Return-Path: <SRS0=eTAM=DV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B74C433DF
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Oct 2020 19:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EB062078A
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Oct 2020 19:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EB062078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFF66EB37;
	Wed, 14 Oct 2020 19:20:55 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A9E6EB3A
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Oct 2020 19:20:52 +0000 (UTC)
IronPort-SDR: QtsLubUKi7LtJotcK2j8hapTcGuBOpBhYx/NnEl/pYVNaw7sCgm58dH7EDObdVuUM0+xVEgsCA
 oMxZ8VUSaTIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9774"; a="183703025"
X-IronPort-AV: E=Sophos;i="5.77,375,1596524400"; d="scan'208";a="183703025"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 12:20:44 -0700
IronPort-SDR: A3XTHUwor9fP6ycrWy2XX76XmV5cazYGsRLuMGZKVzQFhzB5HI6CYNjfaMxtiZdvgtHVT2DEeI
 oeIs/g0aY1fg==
X-IronPort-AV: E=Sophos;i="5.77,375,1596524400"; d="scan'208";a="345781270"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 12:20:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 14 Oct 2020 12:19:37 -0700
Message-Id: <20201014191937.1266226-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014191937.1266226-1-lucas.demarchi@intel.com>
References: <20201014191937.1266226-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 11/11] drm/i915/dgfx: define llc and snooping
 behaviour
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

From: Michel Thierry <michel.thierry@intel.com>

While we do lack the faster shared LLC, we should still have support
for snooping over PCIe.

Signed-off-by: Michel Thierry <michel.thierry@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index d0eeb2181e74..27964ac0638a 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -908,6 +908,8 @@ static const struct intel_device_info rkl_info = {
 	GEN12_FEATURES, \
 	.memory_regions = REGION_SMEM | REGION_LMEM, \
 	.has_master_unit_irq = 1, \
+	.has_llc = 0, \
+	.has_snoop = 1, \
 	.is_dgfx = 1
 
 static const struct intel_device_info dg1_info __maybe_unused = {
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
