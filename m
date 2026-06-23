Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1498CCDB471
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Jun 2026 20:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4B010EC90;
	Tue, 23 Jun 2026 20:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ICg4qqgT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F09B10EC90
 for <intel-gfx@lists.freedesktop.org>; Tue, 23 Jun 2026 20:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782246196; x=1813782196;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dZHY3NAC980NgVGLOguxNpCIQ3krVw+oWnY1NjY1pwU=;
 b=ICg4qqgT0KspdPE6txYqMP7za8rADNXeuPkOiwdCQebvtxLCrxCwqvZZ
 HamC7ZzopOipnttZQgzW6ADKKR2EwO3RDY6UaQqXMWL8Vt0xN5s+oZh0h
 jubHCv+Jj5EYVfjb6yHJ+WVaZX15abOeUawVH5DVzAVQFqEB3lKk+FhNs
 P7cvRWysez82N7qMwPLeQK1oZjFdtI2kwNN72MCvrALdJ2hbmf5b8bB2c
 dlalH2cb9IYI/sYqNxFMsdiy1cvMsSKxDVtutbUCzBK1rX3bAL8VB7pWj
 pSGwPNUY/BsVe4EpY9r1o/x+VNh2Wol99JAfE+ik+dKMWv3SWm8IFXKSw g==;
X-CSE-ConnectionGUID: AQ6GCToqRUi0ZYwu+mnZ/g==
X-CSE-MsgGUID: +WnTsQ/BRdKZ8modXDrM2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="108540877"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="108540877"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 13:23:15 -0700
X-CSE-ConnectionGUID: fS17JElLQfCSmzpmuNKe+A==
X-CSE-MsgGUID: 2Wne2U/PRFS7XO1hMCgPCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="243244507"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 13:23:13 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 michal.wajdeczko@intel.com, raag.jadav@intel.com,
 andi.shyti@linux.intel.com, jani.nikula@intel.com
Subject: [PATCH v5] drm/i915: Refactor generic_handle_irq_safe() error messages
Date: Wed, 24 Jun 2026 04:23:10 +0800
Message-ID: <20260623202310.1023770-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Refactor all error messages resulting from generic_handle_irq_safe()
failures in I915 for clarity.

v2:
- Use drm_err_ratelimited() correctly (jcavitt)

v3:
- Use xe_err_ratelimited() instead (Jadav)
- Split into patch series (jcavitt)

v4:
- Use suggested phrasing (Wajdeczko)

v5:
- s/PTR_ERR/ERR_PTR (jcavitt)

Suggested-by: Raag Jadav <raag.jadav@intel.com>
Suggested-by: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lpe_audio.c | 2 +-
 drivers/gpu/drm/i915/gt/intel_gsc.c            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
index 022ad18044bf..ff2cf479d8e1 100644
--- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
@@ -265,7 +265,7 @@ void intel_lpe_audio_irq_handler(struct intel_display *display)
 	ret = generic_handle_irq_safe(display->audio.lpe.irq);
 	if (ret)
 		drm_err_ratelimited(display->drm,
-				    "error handling LPE audio irq: %d\n", ret);
+				    "LPE audio: irq handling failed (%pe)\n", ERR_PTR(ret));
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.c b/drivers/gpu/drm/i915/gt/intel_gsc.c
index 050d909fb4f8..1c06bf76568a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gsc.c
+++ b/drivers/gpu/drm/i915/gt/intel_gsc.c
@@ -286,7 +286,7 @@ static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
 
 	ret = generic_handle_irq_safe(gt->gsc.intf[intf_id].irq);
 	if (ret)
-		gt_err_ratelimited(gt, "error handling GSC irq: %d\n", ret);
+		gt_err_ratelimited(gt, "GSC: irq handling failed (%pe)\n", ERR_PTR(ret));
 }
 
 void intel_gsc_irq_handler(struct intel_gt *gt, u32 iir)
-- 
2.53.0

