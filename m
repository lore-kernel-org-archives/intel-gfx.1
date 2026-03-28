Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7340210F3DE2
	for <intel-gfx@archiver.kernel.org>; Sat, 28 Mar 2026 14:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F9B10E3C5;
	Sat, 28 Mar 2026 14:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9V+V222";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BAD10E3F6
 for <intel-gfx@lists.freedesktop.org>; Sat, 28 Mar 2026 14:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774708404; x=1806244404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8IlzpYtSdj1QqnBPC3Mxn9iC0YrVgqQ/elyuPAULpWc=;
 b=K9V+V222TKGsu5yAu3PQxW6VwLdAOS6G2BUYM4M/w0FncZWcUQvm7tZK
 ICpJ55hgt7Sn8CpSuEkvouN6G97iDIlKP4ztkFIwf0WpKNxoQgTNqwRod
 vZIbJbuuTF1JzbM36HLghEBJ695Fc/DiLICzWkw3dQQky80xXVFzvrxhd
 gUBrFVLOGf4YUsr7WllcL2fCnFZ0Yge4SXeAQdwZ0Kk+rcGZM3J2q+PON
 MIqeGkAQ45w1pJ6jNrHh/35KgNhPPae3u1IDwRk3BZVXBdaqzvTo80Gr4
 KOgQvXteFyyDRbJzxvC0GOH+1PBe7BOCelvOCuYH3kj6yeNN2tWieQu99 w==;
X-CSE-ConnectionGUID: Kk6ff5RUSge/FFh3X4WqCA==
X-CSE-MsgGUID: YaU1EY8cRkCm2H0vlNjUXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86839496"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; d="scan'208";a="86839496"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2026 07:33:24 -0700
X-CSE-ConnectionGUID: iyfafXqWRDa7eAzvRUovhQ==
X-CSE-MsgGUID: 2mA5xSEdS0WaZHQc+MkdHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; d="scan'208";a="224621103"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa006.jf.intel.com with ESMTP; 28 Mar 2026 07:33:23 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 10/10] drm/i915/casf: eliminate dead code
Date: Sat, 28 Mar 2026 15:32:12 +0100
Message-ID: <20260328143212.601656-11-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260328143212.601656-1-michal.grzelak@intel.com>
References: <20260328143212.601656-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

We short-cut skl_scaler_get_config() when skl_pipe_scaler_get_hw_state()
has failed. Remove codepaths that assume scaler_id < 0.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 1bd42ef36d07..a3c5e44bc7a1 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -1011,10 +1011,7 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 	scaler_state->scalers[scaler_id].in_use = true;
 
 	scaler_state->scaler_id = scaler_id;
-	if (scaler_id >= 0)
-		scaler_state->scaler_users |= (1 << SKL_CRTC_INDEX);
-	else
-		scaler_state->scaler_users &= ~(1 << SKL_CRTC_INDEX);
+	scaler_state->scaler_users |= (1 << SKL_CRTC_INDEX);
 }
 
 void adl_scaler_ecc_mask(const struct intel_crtc_state *crtc_state)
-- 
2.45.2

