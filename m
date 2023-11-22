Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB97FC61D9D
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Nov 2023 18:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8958910E0AA;
	Wed, 22 Nov 2023 18:57:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5776010E0AA
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Nov 2023 18:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700679448; x=1732215448;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ECJcPJAHiWTV58j2Kr7bUistegDy6Wayp8NhLT9vNDs=;
 b=mdxp2+9SDAV7bsiWksvOriGi29UytiKlcWboOLLrdx6OJJw8t2XIAgJD
 u7NMUM8breBByNEsjqC+SdVQHfmgEG7BpkQbEYZjV5Gndcix6m70oR0zS
 qZR+pi/adftvvNNf4vVeM+q9dHRI9g7lFnKP+/INq1Emd3cs5rdOx+Ryk
 /gwIgnQdmG6eaSxcBw6t0pcrwzjyZN1WJSL1hU29KYwLujQYqjIeEKgnn
 XJzyKonNprEiJCOoahrXnycHDvRH6aEXcdVbOcTVAyzER2ILj70PHuVfp
 R+SpP7N/18SGp9boHjYV/VynkD9n0lZNzCapSce7wuKgXt73F3xbjqqh+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="423252478"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="423252478"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 10:41:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="760380630"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="760380630"
Received: from unknown (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 22 Nov 2023 01:37:41 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Nov 2023 11:34:40 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 22 Nov 2023 11:31:35 +0200
Message-ID: <20231122093137.1509-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122093137.1509-1-ville.syrjala@linux.intel.com>
References: <20231122093137.1509-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 2/4] drm/i915/psr: Include some basic PSR
 information in the state dump
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

Currently no one can figure out what the PSR code is doing since
we're including any of it in the basic state dump. Add at least the
bare minimum there.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 2d15e82c0b3d..5bcdbf083281 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -262,6 +262,11 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 		drm_dbg_kms(&i915->drm, "fec: %s, enhanced framing: %s\n",
 			    str_enabled_disabled(pipe_config->fec_enable),
 			    str_enabled_disabled(pipe_config->enhanced_framing));
+
+		drm_dbg_kms(&i915->drm, "psr: %s, psr2: %s, selective fetch: %s\n",
+			    str_enabled_disabled(pipe_config->has_psr),
+			    str_enabled_disabled(pipe_config->has_psr2),
+			    str_enabled_disabled(pipe_config->enable_psr2_sel_fetch));
 	}
 
 	drm_dbg_kms(&i915->drm, "framestart delay: %d, MSA timing delay: %d\n",
-- 
2.41.0

