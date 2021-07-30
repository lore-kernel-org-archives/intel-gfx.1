Return-Path: <SRS0=bte8=MW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D31C4320E
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Jul 2021 08:54:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B56260F6B
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Jul 2021 08:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B56260F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A811C6F41A;
	Fri, 30 Jul 2021 08:54:12 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18B46F415;
 Fri, 30 Jul 2021 08:54:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="298644854"
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; d="scan'208";a="298644854"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 01:54:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; d="scan'208";a="664763867"
Received: from asleatox-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.201.173])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 01:54:03 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 30 Jul 2021 09:53:43 +0100
Message-Id: <20210730085348.2326899-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210730085348.2326899-1-matthew.auld@intel.com>
References: <20210730085348.2326899-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t v3 06/11] lib/ioctl_wrappers: update
 mmap_{read, write} for discrete
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

We can no longer just call get_caching or set_domain, and the mmap mode
must be FIXED. This should bring back gem_exec_basic and a few others in
CI on DG1.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 lib/ioctl_wrappers.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 25c5e495..7e27a1b3 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -339,7 +339,18 @@ static void mmap_write(int fd, uint32_t handle, uint64_t offset,
 	if (!length)
 		return;
 
-	if (is_cache_coherent(fd, handle)) {
+	if (gem_has_lmem(fd)) {
+		/*
+		 * set/get_caching and set_domain are no longer supported on
+		 * discrete, also the only mmap mode supportd is FIXED.
+		 */
+		map = gem_mmap_offset__fixed(fd, handle, 0,
+					     offset + length,
+					     PROT_READ | PROT_WRITE);
+		igt_assert_eq(gem_wait(fd, handle, 0), 0);
+	}
+
+	if (!map && is_cache_coherent(fd, handle)) {
 		/* offset arg for mmap functions must be 0 */
 		map = __gem_mmap__cpu_coherent(fd, handle, 0, offset + length,
 					       PROT_READ | PROT_WRITE);
@@ -369,7 +380,17 @@ static void mmap_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint6
 	if (!length)
 		return;
 
-	if (gem_has_llc(fd) || is_cache_coherent(fd, handle)) {
+	if (gem_has_lmem(fd)) {
+		/*
+		 * set/get_caching and set_domain are no longer supported on
+		 * discrete, also the only supported mmap mode is FIXED.
+		 */
+		map = gem_mmap_offset__fixed(fd, handle, 0,
+					     offset + length, PROT_READ);
+		igt_assert_eq(gem_wait(fd, handle, 0), 0);
+	}
+
+	if (!map && (gem_has_llc(fd) || is_cache_coherent(fd, handle))) {
 		/* offset arg for mmap functions must be 0 */
 		map = __gem_mmap__cpu_coherent(fd, handle, 0,
 					       offset + length, PROT_READ);
-- 
2.26.3

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
