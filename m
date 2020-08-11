Return-Path: <SRS0=3cRA=BV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5454DC433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 11 Aug 2020 08:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3471320756
	for <intel-gfx@archiver.kernel.org>; Tue, 11 Aug 2020 08:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3471320756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D173189CB9;
	Tue, 11 Aug 2020 08:54:27 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1831489CB9
 for <intel-gfx@lists.freedesktop.org>; Tue, 11 Aug 2020 08:54:26 +0000 (UTC)
IronPort-SDR: UYoD6ctP8JAlXQZ2s1cB3JPkM4ChvsnjUgiQ2sNPwjlJztioFWnxaNQ728RTuFJQjf8Z5Ff+F4
 dbiT78fGYI1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="133747365"
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="133747365"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 01:54:25 -0700
IronPort-SDR: zsLc+30GYCgSLnDXfe5FsajPtbNiazJzgemaavvBuH5MKud/gmLxGbc8GiR+FGQ9l4tfE3+yl0
 kdCmamAxXYAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="494610309"
Received: from gksingh.iind.intel.com ([10.66.179.29])
 by fmsmga006.fm.intel.com with ESMTP; 11 Aug 2020 01:54:23 -0700
From: Gaurav K Singh <gaurav.k.singh@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 11 Aug 2020 14:28:17 +0530
Message-Id: <20200811085817.18705-1-gaurav.k.singh@intel.com>
X-Mailer: git-send-email 2.27.0-rc2
In-Reply-To: <20200807115633.16328-1-gaurav.k.singh@intel.com>
References: <20200807115633.16328-1-gaurav.k.singh@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] i915/gem: Force HW tracking to exit PSR
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Instead of calling i915_gem_object_invalidate_frontbuffer(),
call i915_gem_object_flush_frontbuffer() which will eventually
call psr_force_hw_tracking_exit(). This will force HW tracking
to exit PSR instead of disabling and re-enabling.

On Gen9 Intel chromebooks, while playing around with Squid software,
after drawing line, line delay was observed.Also can see flash, garbage
and even shaking display sometimes.

With this fix, issues reported were resolved on Gen9 and Gen11 Intel
chromebooks. Tested the patch on non-PSR, PSR1 and PSR2 panels, no issue
observed.

Signed-off-by: Gaurav K Singh <gaurav.k.singh@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 7f76fc68f498..810fc2381743 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -461,6 +461,7 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 			  struct drm_file *file)
 {
 	struct drm_i915_gem_set_domain *args = data;
+	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct drm_i915_gem_object *obj;
 	u32 read_domains = args->read_domains;
 	u32 write_domain = args->write_domain;
@@ -552,8 +553,13 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 
 	i915_gem_object_unlock(obj);
 
-	if (write_domain)
-		i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
+	if (write_domain) {
+		if (dev_priv->psr.active)
+			i915_gem_object_flush_frontbuffer(obj, ORIGIN_DIRTYFB);
+		else
+			i915_gem_object_invalidate_frontbuffer(obj,
+								ORIGIN_CPU);
+	}
 
 out_unpin:
 	i915_gem_object_unpin_pages(obj);
-- 
2.27.0-rc2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
