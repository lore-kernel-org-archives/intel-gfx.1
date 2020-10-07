Return-Path: <SRS0=Us3n=DO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20552C4363D
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Oct 2020 00:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD4B5206F0
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Oct 2020 00:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD4B5206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B3B6E845;
	Wed,  7 Oct 2020 00:22:33 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7056E83A
 for <intel-gfx@lists.freedesktop.org>; Wed,  7 Oct 2020 00:22:31 +0000 (UTC)
IronPort-SDR: HYzxwRLTAjTGqKtcsTvyyGv59x0ZSUUbCWTEMFWREg0tzkB0XPMVKKdeh5C3fyWyTTH5hXADA5
 eKl5u4APKLqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="162142908"
X-IronPort-AV: E=Sophos;i="5.77,344,1596524400"; d="scan'208";a="162142908"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 17:22:28 -0700
IronPort-SDR: syqNJTJ8k4W+/1hrz8snW5FcN5EK1qQNVoJC43/e/vwyqsOpi07Jy+UNAZ9NEGpCqeQ6v90e7Z
 gFT1HKaxva1w==
X-IronPort-AV: E=Sophos;i="5.77,344,1596524400"; d="scan'208";a="527687757"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 17:22:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  6 Oct 2020 17:22:06 -0700
Message-Id: <20201007002210.3678024-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007002210.3678024-1-lucas.demarchi@intel.com>
References: <20201007002210.3678024-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 4/8] drm/i915/dg1: Increase mmio size to 4MB
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

From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>

On DGFX the register range has been extended to go up to 8MB. However we
only actually use up to address 280000h, so let's increase it to 4MB.

v2 (Lucas):  add bspec reference and reword commit message to explain
   the 4 vs 8 MB used (requested by Matt Roper)

Bspec: 53616

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 263ffcb832b7..54e201fdeba4 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1701,11 +1701,15 @@ static int uncore_mmio_setup(struct intel_uncore *uncore)
 	 * clobbering the GTT which we want ioremap_wc instead. Fortunately,
 	 * the register BAR remains the same size for all the earlier
 	 * generations up to Ironlake.
+	 * For dgfx chips register range is expanded to 4MB.
 	 */
 	if (INTEL_GEN(i915) < 5)
 		mmio_size = 512 * 1024;
+	else if (IS_DGFX(i915))
+		mmio_size = 4 * 1024 * 1024;
 	else
 		mmio_size = 2 * 1024 * 1024;
+
 	uncore->regs = pci_iomap(pdev, mmio_bar, mmio_size);
 	if (uncore->regs == NULL) {
 		drm_err(&i915->drm, "failed to map registers\n");
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
