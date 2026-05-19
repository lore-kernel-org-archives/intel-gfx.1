Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5822CD4F3C
	for <intel-gfx@archiver.kernel.org>; Tue, 19 May 2026 05:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4085210EA49;
	Tue, 19 May 2026 05:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igVOgjrI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C8710EA47
 for <intel-gfx@lists.freedesktop.org>; Tue, 19 May 2026 05:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779167674; x=1810703674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KqjjuUiThDgW+FiBzAN3wtrCKc8QiHg8PXCfo2CWO30=;
 b=igVOgjrIDgQtlv4NEMuTuEtNDnd42eXsUwFvQoycyCkOCRt5IxeKGvTV
 OI5kBWyq3u9+1rUVgDBvGlY/DXHNWONBGql6klPTz940pQnRMz96YrP7I
 P50x2weHs17C3wENQcfO771M419j9M7LPZQmNPrVgbCZ/Yw6t0hGbFITa
 pvfOeydwiViNlmnsJmduE/9Rwud37ca4UakNYSfj/qeWHR1PRTKRPju0B
 XOd3OGe+kjJGbc/GFXoM0UPgta2yDUakhEj580HM6SBVFFWP3SmrDo91z
 7qgaCpKAPsJIYWG0yLNMoSkaJBnfXUjzsRcK9Sw63Ecz7sQx4JMfX/Ry2 g==;
X-CSE-ConnectionGUID: MaMK8WlGTw6rXo37ktO6fw==
X-CSE-MsgGUID: Cnh+5/G/RN+UA2DBUM8ksQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97603554"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="97603554"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 22:14:33 -0700
X-CSE-ConnectionGUID: qVdEQZE3Rf6xJGeJtdp0+A==
X-CSE-MsgGUID: ykBsYzLDS22y47zgVfuzWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="243635828"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa003.jf.intel.com with ESMTP; 18 May 2026 22:14:32 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v1 8/8] i915/display/vrr: Enable CMRR
Date: Tue, 19 May 2026 10:33:22 +0530
Message-ID: <20260519050322.3677451-9-mitulkumar.ajitkumar.golani@intel.com>
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

Compute Enabling of CMRR via crtc state.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 975c87c4ffbb..43fb6f4aaf56 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -236,6 +236,7 @@ void intel_vrr_compute_fixed_rr_timings(struct intel_crtc_state *crtc_state,
 	if (HAS_CMRR(display) && is_edp) {
 		/* For CMRR, vmin = vmax = flipline = Dithered Vtotal */
 		crtc_state->vrr.vmax = cmrr_get_vtotal(crtc_state);
+		crtc_state->vrr.cmrr.enable = true;
 	} else {
 		/* For fixed rr,  vmin = vmax = flipline */
 		crtc_state->vrr.vmax = crtc_state->hw.adjusted_mode.crtc_vtotal;
-- 
2.48.1

