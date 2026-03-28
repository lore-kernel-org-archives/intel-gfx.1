Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C8210F3DE2
	for <intel-gfx@archiver.kernel.org>; Sat, 28 Mar 2026 14:33:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA7D10E3E4;
	Sat, 28 Mar 2026 14:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dg/rkaEV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB8110E3D5
 for <intel-gfx@lists.freedesktop.org>; Sat, 28 Mar 2026 14:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774708402; x=1806244402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JswiMabGuiANKsvq5LRmr0XnikwciYuRpFL97f8UAcM=;
 b=Dg/rkaEVUL6rSTZMFSxx1gnZKOvrBN/pE9wDYrc3RHoA9d8dmffXQhOk
 U6E0h2/TJo6vsDncaK2vIITE6GrhEk2tTriYB5f/u01v6C5wedEw9LHdN
 dT/UmxLK5KRgcUtNOaaJFLjigjc3V77adfuu7Q9KJz7Q99ehucbcqku0W
 LdBzqAz2E8vBrwMmU/R7onXl9exmwrRGa7ZH/chosDicVwupp15ry20xF
 A/Y+E+je1CFT+YvJJWAvxZYeNApwQSE1+HMddhnTTYJlnRuFwwSrGXiCy
 b8CwDrGYybv1ZcdT0b3THrTOeyfz2f7dLxzJwp2flkzhL7hVulYjp6zsT Q==;
X-CSE-ConnectionGUID: VN6szoFGR/+sDp5kjp+avQ==
X-CSE-MsgGUID: 35iV/9HASHqh5GYms2Q8qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86839494"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; d="scan'208";a="86839494"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2026 07:33:22 -0700
X-CSE-ConnectionGUID: RDmbmrANSVmu8B2d2SZwXA==
X-CSE-MsgGUID: 37kJEvSLSlGFm6AUw+Zcng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; d="scan'208";a="224621094"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa006.jf.intel.com with ESMTP; 28 Mar 2026 07:33:21 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 08/10] drm/i915/casf: invert loop's breaking logic
Date: Sat, 28 Mar 2026 15:32:10 +0100
Message-ID: <20260328143212.601656-9-michal.grzelak@intel.com>
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

skl_scaler_get_config()'s loop is skipped when specified condition is
met and broken when the condition is not met. Equivalently, invert the
condition and break the loop.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 802130df6561..9318fd1bcc45 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -977,10 +977,8 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 		u32 ctl;
 
 		ctl = intel_de_read(display, SKL_PS_CTRL(crtc->pipe, scaler_id));
-		if ((ctl & (PS_SCALER_EN | PS_BINDING_MASK)) != (PS_SCALER_EN | PS_BINDING_PIPE))
-			continue;
-
-		break;
+		if ((ctl & (PS_SCALER_EN | PS_BINDING_MASK)) == (PS_SCALER_EN | PS_BINDING_PIPE))
+			break;
 	}
 
 	/* Read CASF regs for second scaler */
-- 
2.45.2

