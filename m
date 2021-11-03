Return-Path: <SRS0=D79Q=PW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5927C433F5
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Nov 2021 17:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7755261073
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Nov 2021 17:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7755261073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=Intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835E173C63;
	Wed,  3 Nov 2021 17:07:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C76973C66;
 Wed,  3 Nov 2021 17:07:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="231501444"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="231501444"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 10:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="449892057"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga006.jf.intel.com with ESMTP; 03 Nov 2021 10:04:50 -0700
From: John.C.Harrison@Intel.com
To: IGT-Dev@Lists.FreeDesktop.Org
Date: Wed,  3 Nov 2021 10:04:47 -0700
Message-Id: <20211103170449.1614314-7-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103170449.1614314-1-John.C.Harrison@Intel.com>
References: <20211103170449.1614314-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 i-g-t 6/8] lib/igt_sysfs: Support large files
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
Cc: Intel-GFX@Lists.FreeDesktop.Org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The syfs helper functions were all using basic 'int' data types for
sizs, offsets, etc. when reading from sysfs. This works fine for
little files, but not for large error capture logs (which can be
gigabytes in sizes).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/igt_sysfs.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 6919ac361..ee75e3ef1 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -53,9 +53,11 @@
  * provides basic support for like igt_sysfs_open().
  */
 
-static int readN(int fd, char *buf, int len)
+static ssize_t readN(int fd, char *buf, size_t len)
 {
-	int ret, total = 0;
+	ssize_t ret;
+	size_t total = 0;
+
 	do {
 		ret = read(fd, buf + total, len - total);
 		if (ret < 0)
@@ -69,9 +71,11 @@ static int readN(int fd, char *buf, int len)
 	return total ?: ret;
 }
 
-static int writeN(int fd, const char *buf, int len)
+static ssize_t writeN(int fd, const char *buf, size_t len)
 {
-	int ret, total = 0;
+	ssize_t ret;
+	size_t total = 0;
+
 	do {
 		ret = write(fd, buf + total, len - total);
 		if (ret < 0)
@@ -218,8 +222,9 @@ bool igt_sysfs_set(int dir, const char *attr, const char *value)
 char *igt_sysfs_get(int dir, const char *attr)
 {
 	char *buf;
-	int len, offset, rem;
-	int ret, fd;
+	size_t len, offset, rem;
+	ssize_t ret;
+	int fd;
 
 	fd = openat(dir, attr, O_RDONLY);
 	if (igt_debug_on(fd < 0))
-- 
2.25.1

