Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276CACD4F3C
	for <intel-gfx@archiver.kernel.org>; Tue, 19 May 2026 05:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D7810EA40;
	Tue, 19 May 2026 05:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTMlXcMw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5B410EA40
 for <intel-gfx@lists.freedesktop.org>; Tue, 19 May 2026 05:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779167666; x=1810703666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X2wBLjRYqVLMsLXpx7C7JRgYOLYHln4sd0Px89eBem0=;
 b=PTMlXcMwm6n/oYpxIsW2hvUuE3CJxBweU3tsNF6Jduj2CW9bAuRjTPrU
 MFHaYurV19+yWipqDZxlOVJp4O1+LAgocNAyJUFnkch59fr5TD4QVLPGo
 /OehVcLxB7S7dSXLtydA7axabmovuh2+E9mp9/lZHb1hbIY1mEQcigsXm
 xE/NmIohD0Ym4le43lvMU7FQ0fVWEaTpU8+6IYXmjXqZEpYeHyX7AGQXc
 JCrcQ0DJ/Jydpv4/1O3YD4+5IlUfzLe9LS6RHv8MiamJ8PfAadpiDyBuA
 C0tw7buL3M3/LPC2nQEHSHODPhIeiZIeSvaHG3oH8E1+pP1GhB8gbEEHo w==;
X-CSE-ConnectionGUID: ondWow1NT7+3ekrXwWxPOA==
X-CSE-MsgGUID: Bh85Z+vdSNGgCXx3XWDoiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97603543"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="97603543"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 22:14:26 -0700
X-CSE-ConnectionGUID: k2U4pVmCTqKF1ybHmE850A==
X-CSE-MsgGUID: AU4tu/xoSdirXfW6vJt0NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="243635809"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa003.jf.intel.com with ESMTP; 18 May 2026 22:14:25 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v1 4/8] drm/i915/display: Add state dump for CMRR params
Date: Tue, 19 May 2026 10:33:18 +0530
Message-ID: <20260519050322.3677451-5-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260519050322.3677451-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260519050322.3677451-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add state dump for CMRR params to track CMRR crtc state config
alongside the existing VRR state dump.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 4493483f10a9..0563e37042ab 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -300,6 +300,12 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 		   pipe_config->vrr.pipeline_full, pipe_config->vrr.guardband,
 		   pipe_config->vrr.vsync_start, pipe_config->vrr.vsync_end);
 
+	drm_printf(&p, "vrr: cmrr: %s, cmrr m: %llu, cmrr n: %llu fraction level: %s\n",
+		   str_yes_no(pipe_config->vrr.cmrr.enable),
+		   pipe_config->vrr.cmrr.cmrr_m,
+		   pipe_config->vrr.cmrr.cmrr_n,
+		   intel_vrr_cmrr_level_to_string(pipe_config->vrr.cmrr.level));
+
 	drm_printf(&p, "vrr: vmin vblank: %d, vmax vblank: %d, vmin vtotal: %d, vmax vtotal: %d\n",
 		   intel_vrr_vmin_vblank_start(pipe_config), intel_vrr_vmax_vblank_start(pipe_config),
 		   intel_vrr_vmin_vtotal(pipe_config), intel_vrr_vmax_vtotal(pipe_config));
-- 
2.48.1

