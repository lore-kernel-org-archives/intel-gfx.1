Return-Path: <SRS0=TzMs=BR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73CBC433DF
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Aug 2020 11:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82A9C2075D
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Aug 2020 11:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82A9C2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3154B89BF6;
	Fri,  7 Aug 2020 11:52:46 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A7089BF6
 for <intel-gfx@lists.freedesktop.org>; Fri,  7 Aug 2020 11:52:45 +0000 (UTC)
IronPort-SDR: g0h+yUdbGf07IN+jnWV92fCAuK0fTP04+ey6pOan4s4RGnocyWJnHXk90XcoZaoRA0AYiMS7Cr
 Mzqx9xJbUPiA==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="217396255"
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="217396255"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 04:52:44 -0700
IronPort-SDR: GElAqMcvAAbvOegEA3hv7xrzun39d3v9O2gdZA8YN2pjd0VHj9ImimA00YfK15zTpLGbknBenc
 8Haz8cWTjSdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="276660163"
Received: from gksingh.iind.intel.com ([10.66.179.29])
 by fmsmga008.fm.intel.com with ESMTP; 07 Aug 2020 04:52:43 -0700
From: Gaurav K Singh <gaurav.k.singh@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  7 Aug 2020 17:26:33 +0530
Message-Id: <20200807115633.16328-1-gaurav.k.singh@intel.com>
X-Mailer: git-send-email 2.27.0-rc2
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
chromebooks.

Signed-off-by: Gaurav K Singh <gaurav.k.singh@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 7f76fc68f498..fb1daddde286 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -553,7 +553,7 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 	i915_gem_object_unlock(obj);
 
 	if (write_domain)
-		i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
+		i915_gem_object_flush_frontbuffer(obj, ORIGIN_DIRTYFB);
 
 out_unpin:
 	i915_gem_object_unpin_pages(obj);
-- 
2.27.0-rc2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
