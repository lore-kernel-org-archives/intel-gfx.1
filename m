Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68C5D46BF8
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Jan 2026 20:56:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE3B10E772;
	Wed, 28 Jan 2026 20:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U6EnHneL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CBA10E76F
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Jan 2026 20:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769633792; x=1801169792;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2m6uJuvzGwsE7kbXXtckTG30X7QzwqtAgDvgArT9cvs=;
 b=U6EnHneLMkyAxFaZc3STLMz5dxGhLhz1KXyieNIKyzLKDa3HSEgzhooT
 l7CkWqUqlwZuWgloITBcx74MWpjVTR6HKAlztjL26n4dkjuBePXvBZ7RM
 z76zs0NJyEzsJ5qJhOU9vYXWNu36T6ff+f3b6zDXzc4+eG/ibkC6Fvs4L
 tQChPf7ZEYLucrGOXlUrM0FTcFGX2W3gMaaGo+SWXw4DDa4uDbkcJbPmP
 LOzGwCZPgnxr2KdyTT0qsnX0HTPVk/LqkKjzZThoAjgwacT+QjqUdyPZl
 nueH9TNi/maYz1xpSHqXDYSWd239kqjjocZvYFUVW0UZzSQFWbUnMSftL w==;
X-CSE-ConnectionGUID: hD7fFxSCRHuMYDLmQPlarg==
X-CSE-MsgGUID: FzRgcAdvSDSouf+Vr5FB/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81974239"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81974239"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 12:56:32 -0800
X-CSE-ConnectionGUID: cnkUJXSERMS8TcFwuTbaLQ==
X-CSE-MsgGUID: EYZVr7rJTmWDL7nsS9KnAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208167955"
Received: from dut4086lnl.fm.intel.com ([10.105.10.177])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 12:56:31 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com,
	alex.zuo@intel.com,
	jonathan.cavitt@intel.com
Subject: [PATCH] drm/i915/display: Fail intel_ddi_init if encoder init fails
Date: Wed, 28 Jan 2026 20:56:30 +0000
Message-ID: <20260128205629.66618-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Static analysis issue:

drm_encoder_init is capable of returning an error code in some cases,
such as when drm_mode_object_add fails, or if
dev->mode_config.num_encoder >= 32.  In these cases, encoder->dev is not
properly initialized, which may lead to issues when it is dereferenced
in, for example, intel_ddi_init_dp_connector, which calls
intel_dp_init_connector.

Much like the other error cases in this function, just return if an
error code is reported from drm_encoder_init.  Note that goto err in
this case would only exacerbate the issue, as drm_encoder_cleanup also
relies on encoder->dev being present.  So, just kfree the dig_port
before returning, as that's the only necessary part of the error path to
call here.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index d8739e2bb004..7fc5f726e9a8 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -5264,9 +5264,12 @@ void intel_ddi_init(struct intel_display *display,
 	encoder = &dig_port->base;
 	encoder->devdata = devdata;
 
-	drm_encoder_init(display->drm, &encoder->base, &intel_ddi_funcs,
-			 DRM_MODE_ENCODER_TMDS, "%s",
-			 intel_ddi_encoder_name(display, port, phy, &encoder_name));
+	if (drm_encoder_init(display->drm, &encoder->base, &intel_ddi_funcs,
+			     DRM_MODE_ENCODER_TMDS, "%s",
+			     intel_ddi_encoder_name(display, port, phy, &encoder_name))) {
+		kfree(dig_port);
+		return;
+	}
 
 	intel_encoder_link_check_init(encoder, intel_ddi_link_check);
 
-- 
2.43.0

