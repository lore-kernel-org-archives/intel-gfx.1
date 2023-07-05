Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7783EEB64DD
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Jul 2023 20:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BC210E3C0;
	Wed,  5 Jul 2023 20:21:30 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADED10E3C2
 for <intel-gfx@lists.freedesktop.org>; Wed,  5 Jul 2023 20:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688588488; x=1720124488;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zDJUhKeJs+iIqXM+hRF6y6VVzhnCmQq/vf89igt+VDQ=;
 b=csVEtcr0j/ctNgiODm6fUtfvF6OSvFLh9FB6/LPhFpuP6LU62CuuGebY
 P9Y6Zkon9r6C+kbigpMx2p0RVZ4fK1VTtyXMufsD/05Bu4l+tJ0A6VIKn
 iqTOL21w1x3oTR3qdQsY1PyB353wtOzSapCJjK5cktvB4FEKz1cCm6wBj
 M7m4Jbrvt2LkXU2l2cGibxusM7Ir3DZnkR0k6pYVHF28GpjTXlfuyL94J
 ZcikL5PCMcm7bxmowkhDTiMf6qfsgd3Eq1ovmIMkbp4CtyHbG0NfI89Gp
 IhWDtariIn5nyFuzrWFwjO80ri9BOGybWP+KBFJwtPIfxIVXTlbaMIMPS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="353269008"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="353269008"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 13:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="754491072"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="754491072"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga001.jf.intel.com with SMTP; 05 Jul 2023 13:21:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 05 Jul 2023 23:21:25 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed,  5 Jul 2023 23:21:10 +0300
Message-Id: <20230705202122.17915-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230705202122.17915-1-ville.syrjala@linux.intel.com>
References: <20230705202122.17915-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 01/13] drm/i915/sdvo: Issue SetTargetOutput
 prior ot GetAttachedDisplays
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

I have at least one SDVO device (some Lenovo DVI-I ADD2 card,
based on Conexant CX25904) where GetAttachedDisplays returns
success but fails to report any attached displays unless wet
precede the command with a SetTargetOutput. Make it so.

I wasn't able to spot anything in the SDVO spec stating that
this should be necessary, but real world wins over spec.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_sdvo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 8298a86d1334..9ac4c0b6055b 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -2135,6 +2135,10 @@ intel_sdvo_detect(struct drm_connector *connector, bool force)
 	if (!INTEL_DISPLAY_ENABLED(i915))
 		return connector_status_disconnected;
 
+	if (!intel_sdvo_set_target_output(intel_sdvo,
+					  intel_sdvo_connector->output_flag))
+		return connector_status_unknown;
+
 	if (!intel_sdvo_get_value(intel_sdvo,
 				  SDVO_CMD_GET_ATTACHED_DISPLAYS,
 				  &response, 2))
-- 
2.39.3

