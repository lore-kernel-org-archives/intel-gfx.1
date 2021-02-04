Return-Path: <SRS0=bw6s=HG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE5EC433E0
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 12:11:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9004A64E8C
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 12:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9004A64E8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB706EC9A;
	Thu,  4 Feb 2021 12:11:36 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7595F6EC98;
 Thu,  4 Feb 2021 12:11:34 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from build.alporthouse.com (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23785957-1500050 
 for multiple; Thu, 04 Feb 2021 12:11:28 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Date: Thu,  4 Feb 2021 12:11:19 +0000
Message-Id: <20210204121121.2660-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC 1/3] proc: Show GPU runtimes
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Present an interface for system monitors to watch the GPU usage as a
whole and by individual applications. By consolidating the information
into a canonical location, we have a single interface that can track the
utilisation of all GPU devices and sub-devices. This is preferrable to
asking the system monitors to walk the sysfs, or other interfaces, of
each device and parse the custom information presented by each driver.

Opens:
- Should we try to name each channel so that it can be shown in UI?

In gnome-system-monitor, we would have a task list:
	Process ... GPU0% GPU1%
and charts that would show the GPU% on/next the CPU overview.

Then we could have a futher expansion of a GPU% into per-channel
utilisation. That would be useful to check to see what is saturating a
particular channel, e.g. find the video decoder bottleneck.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 fs/proc/Makefile         |  1 +
 fs/proc/base.c           |  2 +
 fs/proc/gpu.c            | 83 ++++++++++++++++++++++++++++++++++++++++
 fs/proc/internal.h       |  6 +++
 include/linux/proc_gpu.h | 33 ++++++++++++++++
 5 files changed, 125 insertions(+)
 create mode 100644 fs/proc/gpu.c
 create mode 100644 include/linux/proc_gpu.h

diff --git a/fs/proc/Makefile b/fs/proc/Makefile
index bd08616ed8ba..bdc42b592e3e 100644
--- a/fs/proc/Makefile
+++ b/fs/proc/Makefile
@@ -16,6 +16,7 @@ proc-y	+= cmdline.o
 proc-y	+= consoles.o
 proc-y	+= cpuinfo.o
 proc-y	+= devices.o
+proc-y	+= gpu.o
 proc-y	+= interrupts.o
 proc-y	+= loadavg.o
 proc-y	+= meminfo.o
diff --git a/fs/proc/base.c b/fs/proc/base.c
index b3422cda2a91..062298f5f6c8 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -3266,6 +3266,7 @@ static const struct pid_entry tgid_base_stuff[] = {
 #ifdef CONFIG_SECCOMP_CACHE_DEBUG
 	ONE("seccomp_cache", S_IRUSR, proc_pid_seccomp_cache),
 #endif
+	ONE("gpu", S_IRUGO, proc_pid_gpu),
 };
 
 static int proc_tgid_base_readdir(struct file *file, struct dir_context *ctx)
@@ -3598,6 +3599,7 @@ static const struct pid_entry tid_base_stuff[] = {
 #ifdef CONFIG_SECCOMP_CACHE_DEBUG
 	ONE("seccomp_cache", S_IRUSR, proc_pid_seccomp_cache),
 #endif
+	ONE("gpu", S_IRUGO, proc_pid_gpu),
 };
 
 static int proc_tid_base_readdir(struct file *file, struct dir_context *ctx)
diff --git a/fs/proc/gpu.c b/fs/proc/gpu.c
new file mode 100644
index 000000000000..7264bf1f2f7b
--- /dev/null
+++ b/fs/proc/gpu.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/proc_fs.h>
+#include <linux/proc_gpu.h>
+#include <linux/seq_file.h>
+#include <linux/spinlock.h>
+#include <linux/list.h>
+
+#include "internal.h"
+
+static LIST_HEAD(gpu);
+static DEFINE_SPINLOCK(lock);
+
+void proc_gpu_register(struct proc_gpu *pg)
+{
+	spin_lock(&lock);
+	list_add_tail(&pg->link, &gpu);
+	spin_unlock(&lock);
+}
+EXPORT_SYMBOL_GPL(proc_gpu_register);
+
+void proc_gpu_unregister(struct proc_gpu *pg)
+{
+	spin_lock(&lock);
+	list_del(&pg->link);
+	spin_unlock(&lock);
+}
+EXPORT_SYMBOL_GPL(proc_gpu_unregister);
+
+static void print_runtime(struct seq_file *m, const struct proc_gpu_runtime *rt)
+{
+	int i;
+
+	seq_printf(m, "%llu", rt->device);
+
+	for (i = 0; i < rt->nchannel; i++)
+		seq_printf(m, " %llu", rt->channel[i]);
+
+	seq_printf(m, " %s\n", rt->name);
+}
+
+int proc_pid_gpu(struct seq_file *m, struct pid_namespace *ns,
+		 struct pid *pid, struct task_struct *task)
+{
+	struct proc_gpu *p, *pn, mark = {};
+	struct proc_gpu_runtime rt;
+
+	spin_lock(&lock);
+	list_for_each_entry_safe(p, pn, &gpu, link) {
+		if (!p->fn)
+			continue;
+
+		rt.name[0] = '\0';
+		p->fn(p, pid, &rt);
+		if (!rt.name[0])
+			continue;
+
+		list_add(&mark.link, &p->link);
+		spin_unlock(&lock);
+
+		print_runtime(m, &rt);
+
+		spin_lock(&lock);
+		list_safe_reset_next(&mark, pn, link);
+		list_del(&mark.link);
+	}
+	spin_unlock(&lock);
+
+	return 0;
+}
+
+static int proc_gpu_show(struct seq_file *m, void *v)
+{
+	return proc_pid_gpu(m, NULL, NULL, NULL);
+}
+
+static int __init proc_gpu_init(void)
+{
+	proc_create_single("gpu", 0, NULL, proc_gpu_show);
+	return 0;
+}
+fs_initcall(proc_gpu_init);
diff --git a/fs/proc/internal.h b/fs/proc/internal.h
index f60b379dcdc7..08bf45bec975 100644
--- a/fs/proc/internal.h
+++ b/fs/proc/internal.h
@@ -221,6 +221,12 @@ void set_proc_pid_nlink(void);
 extern struct inode *proc_get_inode(struct super_block *, struct proc_dir_entry *);
 extern void proc_entry_rundown(struct proc_dir_entry *);
 
+/*
+ * proc_gpu.c
+ */
+int proc_pid_gpu(struct seq_file *m, struct pid_namespace *ns,
+		 struct pid *pid, struct task_struct *task);
+
 /*
  * proc_namespaces.c
  */
diff --git a/include/linux/proc_gpu.h b/include/linux/proc_gpu.h
new file mode 100644
index 000000000000..05c1db951c80
--- /dev/null
+++ b/include/linux/proc_gpu.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Interface for showing per-gpu/per-process runtimes in /proc.
+ */
+#ifndef _LINUX_PROC_GPU_H
+#define _LINUX_PROC_GPU_H
+
+#include <linux/list.h>
+#include <linux/types.h>
+
+struct pid;
+struct proc_gpu;
+
+struct proc_gpu_runtime {
+	char name[60];
+	int nchannel;
+	u64 device;
+	u64 channel[64];
+};
+
+typedef void (*proc_gpu_fn_t)(struct proc_gpu *arg,
+			      struct pid *pid,
+			      struct proc_gpu_runtime *rt);
+
+struct proc_gpu {
+	struct list_head link;
+	proc_gpu_fn_t fn;
+};
+
+void proc_gpu_register(struct proc_gpu *pg);
+void proc_gpu_unregister(struct proc_gpu *pg);
+
+#endif /* _LINUX_PROC_GPU_H */
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
