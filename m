Return-Path: <SRS0=Rlc6=O7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC27C433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Oct 2021 15:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9523960E94
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Oct 2021 15:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9523960E94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FBB89F89;
	Mon, 11 Oct 2021 15:42:46 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8AA89F6E;
 Mon, 11 Oct 2021 15:42:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="313097996"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="313097996"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 08:19:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="490518775"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga008.jf.intel.com with ESMTP; 11 Oct 2021 08:19:42 -0700
Received: from intel.com (srinivasulu-X299-AORUS-Gaming-7.iind.intel.com
 [10.145.162.218])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 19BFJcaH019164; Mon, 11 Oct 2021 16:19:40 +0100
From: Thanneeru Srinivasulu <thanneeru.srinivasulu@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, thanneeru.srinivasulu@intel.com
Date: Mon, 11 Oct 2021 20:51:03 +0530
Message-Id: <20211011152106.3424810-2-thanneeru.srinivasulu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011152106.3424810-1-thanneeru.srinivasulu@intel.com>
References: <20211011152106.3424810-1-thanneeru.srinivasulu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 1/4] drm/i915/huc: Use i915_probe_error to
 report early CTB failures
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Replace DRM_ERROR with CT_PROBE_ERROR to report early CTB failures.

Signed-off-by: Thanneeru Srinivasulu <thanneeru.srinivasulu@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 0a3504bc0b61..83764db0fd6d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -191,8 +191,8 @@ static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
 	err = guc_action_register_ct_buffer(ct_to_guc(ct), type,
 					    desc_addr, buff_addr, size);
 	if (unlikely(err))
-		CT_ERROR(ct, "Failed to register %s buffer (%pe)\n",
-			 guc_ct_buffer_type_to_str(type), ERR_PTR(err));
+		CT_PROBE_ERROR(ct, "Failed to register %s buffer (%pe)\n",
+			       guc_ct_buffer_type_to_str(type), ERR_PTR(err));
 	return err;
 }
 
-- 
2.25.1

