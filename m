Return-Path: <SRS0=gs28=GW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B324C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 23:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BF3A22DD3
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 23:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BF3A22DD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EBB6E04A;
	Tue, 19 Jan 2021 23:17:40 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E676E04A;
 Tue, 19 Jan 2021 23:17:37 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23644422-1500050 
 for multiple; Tue, 19 Jan 2021 23:17:30 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 19 Jan 2021 23:17:29 +0000
Message-Id: <20210119231729.751316-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] i915/gem_exec_parallel: Launch 1s worth
 of threads
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Let's not assume that the thread execution is instantaneous, but apply a
time limit as well as a maximum number so that the test should always run
in bounded time.

Also limit each thread to submitting only two pieces of outstanding work,
to minimise over-saturation. We use two alternating batches as a generic
way of tracking their fences.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_parallel.c | 60 +++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 19 deletions(-)

diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
index d3dd06a65..9cb299733 100644
--- a/tests/i915/gem_exec_parallel.c
+++ b/tests/i915/gem_exec_parallel.c
@@ -48,6 +48,7 @@ static inline uint32_t hash32(uint32_t val)
 #define USERPTR 0x4
 
 #define NUMOBJ 16
+#define MAXTHREADS 4096
 
 struct thread {
 	pthread_t thread;
@@ -64,15 +65,15 @@ struct thread {
 static void *thread(void *data)
 {
 	struct thread *t = data;
-	struct drm_i915_gem_exec_object2 obj[2];
-	struct drm_i915_gem_relocation_entry reloc;
+	struct drm_i915_gem_exec_object2 obj[2], tmp;
+	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_execbuffer2 execbuf;
 	uint32_t batch[16];
 	uint16_t used;
 	int fd, i;
 
 	pthread_mutex_lock(t->mutex);
-	while (*t->go == 0)
+	while (READ_ONCE(*t->go) == 0)
 		pthread_cond_wait(t->cond, t->mutex);
 	pthread_mutex_unlock(t->mutex);
 
@@ -101,18 +102,25 @@ static void *thread(void *data)
 	memset(obj, 0, sizeof(obj));
 	obj[0].flags = EXEC_OBJECT_WRITE;
 
-	memset(&reloc, 0, sizeof(reloc));
-	reloc.offset = sizeof(uint32_t);
+	memset(reloc, 0, sizeof(reloc));
+	reloc[0].offset = sizeof(uint32_t);
 	if (t->gen < 8 && t->gen >= 4)
-		reloc.offset += sizeof(uint32_t);
-	reloc.read_domains = I915_GEM_DOMAIN_INSTRUCTION;
-	reloc.write_domain = I915_GEM_DOMAIN_INSTRUCTION;
-	reloc.delta = 4*t->id;
+		reloc[0].offset += sizeof(uint32_t);
+	reloc[0].read_domains = I915_GEM_DOMAIN_INSTRUCTION;
+	reloc[0].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
+	reloc[0].delta = 4*t->id;
+	reloc[1] = reloc[0];
+
 	obj[1].handle = gem_create(fd, 4096);
-	obj[1].relocs_ptr = to_user_pointer(&reloc);
+	obj[1].relocs_ptr = to_user_pointer(&reloc[0]);
 	obj[1].relocation_count = 1;
 	gem_write(fd, obj[1].handle, 0, batch, sizeof(batch));
 
+	tmp.handle = gem_create(fd, 4096);
+	tmp.relocs_ptr = to_user_pointer(&reloc[1]);
+	tmp.relocation_count = 1;
+	gem_write(fd, tmp.handle, 0, batch, sizeof(batch));
+
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
@@ -129,6 +137,8 @@ static void *thread(void *data)
 	igt_until_timeout(1) {
 		unsigned int x = rand() % NUMOBJ;
 
+		igt_swap(obj[1], tmp);
+
 		used |= 1u << x;
 		obj[0].handle = t->scratch[x];
 
@@ -139,10 +149,13 @@ static void *thread(void *data)
 
 		if (t->flags & FDS)
 			gem_close(fd, obj[0].handle);
+
+		gem_sync(fd, tmp.handle);
 	}
 
 	if (t->flags & CONTEXTS)
 		gem_context_destroy(fd, execbuf.rsvd1);
+	gem_close(fd, tmp.handle);
 	gem_close(fd, obj[1].handle);
 	if (t->flags & FDS)
 		close(fd);
@@ -153,7 +166,7 @@ static void *thread(void *data)
 
 static void check_bo(int fd, uint32_t handle, int pass, struct thread *threads)
 {
-	uint32_t x = hash32(handle * pass) % 1024;
+	uint32_t x = hash32(handle * pass) % MAXTHREADS;
 	uint32_t result;
 
 	if (!(threads[x].used & (1 << pass)))
@@ -167,18 +180,20 @@ static void check_bo(int fd, uint32_t handle, int pass, struct thread *threads)
 
 static uint32_t handle_create(int fd, unsigned int flags, void **data)
 {
+	unsigned int size = MAXTHREADS * sizeof(uint32_t);
+
 	if (flags & USERPTR) {
 		uint32_t handle;
 		void *ptr;
 
-		posix_memalign(&ptr, 4096, 4096);
-		gem_userptr(fd, ptr, 4096, 0, 0, &handle);
+		posix_memalign(&ptr, 4096, size);
+		gem_userptr(fd, ptr, size, 0, 0, &handle);
 		*data = ptr;
 
 		return handle;
 	}
 
-	return gem_create(fd, 4096);
+	return gem_create(fd, size);
 }
 
 static void handle_close(int fd, unsigned int flags, uint32_t handle, void *data)
@@ -197,7 +212,9 @@ static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
 	struct thread *threads;
 	pthread_mutex_t mutex;
 	pthread_cond_t cond;
+	struct timespec tv;
 	void *arg[NUMOBJ];
+	int count;
 	int go;
 	int i;
 
@@ -227,7 +244,7 @@ static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
 			scratch[i] = gem_flink(fd, handle[i]);
 	}
 
-	threads = calloc(1024, sizeof(struct thread));
+	threads = calloc(MAXTHREADS, sizeof(struct thread));
 	igt_assert(threads);
 
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -235,7 +252,8 @@ static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
 	pthread_cond_init(&cond, 0);
 	go = 0;
 
-	for (i = 0; i < 1024; i++) {
+	memset(&tv, 0, sizeof(tv));
+	for (i = 0; i < MAXTHREADS && !igt_seconds_elapsed(&tv); i++) {
 		threads[i].id = i;
 		threads[i].fd = fd;
 		threads[i].gen = gen;
@@ -246,15 +264,19 @@ static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
 		threads[i].cond = &cond;
 		threads[i].go = &go;
 
-		pthread_create(&threads[i].thread, 0, thread, &threads[i]);
+		if (pthread_create(&threads[i].thread, 0, thread, &threads[i]))
+			break;
 	}
+	count = i;
+	igt_info("Launched %d threads\n", count);
+	igt_require(count);
 
 	pthread_mutex_lock(&mutex);
-	go = 1024;
+	WRITE_ONCE(go, count);
 	pthread_cond_broadcast(&cond);
 	pthread_mutex_unlock(&mutex);
 
-	for (i = 0; i < 1024; i++)
+	for (i = 0; i < count; i++)
 		pthread_join(threads[i].thread, NULL);
 
 	for (i = 0; i < NUMOBJ; i++) {
-- 
2.30.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
