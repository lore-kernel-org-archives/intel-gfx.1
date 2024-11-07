Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A54D43375
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Nov 2024 16:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B79210E870;
	Thu,  7 Nov 2024 16:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mE4mq0Yf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1EB10E13D
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 Nov 2024 16:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730995896; x=1762531896;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=p/mR3sIDURgV78e7CDnjPwGxqZbZrJS2b1ik3CHsPl0=;
 b=mE4mq0YfxBG7pY0g0IDyFxuQx7noY4d4WZAj7hRXptvqd5Y9WuowRMrU
 q74Tt6e16weqSYEgoZLRykbIeRJmiUKH5ZnnKhIzjEclYPeu68g8houH2
 tYGOaXB87RlYsLjCDvTMtpA25/0rKpx9EFWXPpno4FRGMNsdFHkJwYMly
 Wzoc9jmyLJQqwAk+l9JYjHAcBhfRC/7ohHsxFWA2I32zYPqYAfp3D/Dqg
 QQihf75x8+bLRdyh3UgualrGgiX9ZEEmiTuvH4wXTRT4teYHa4XIXdc1O
 08N0dRTLiJ1J9dFkAvaP9n7Yx90JC0AMOtvgKLO4ZoZtQSEf75CEocFAw A==;
X-CSE-ConnectionGUID: Gbu6tk/GQuygs1Zx9Xk09w==
X-CSE-MsgGUID: 0O0s5BjoSmusESyzv32l6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="41443032"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="41443032"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 08:11:31 -0800
X-CSE-ConnectionGUID: e6jvWepnTI6YgYkvejiX4Q==
X-CSE-MsgGUID: Qgesr2f+STCXZ+kJ5P9Mfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="85277842"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Nov 2024 08:11:29 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Nov 2024 18:11:28 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/10] drm/i915/crt: Split long line
Date: Thu,  7 Nov 2024 18:11:15 +0200
Message-ID: <20241107161123.16269-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107161123.16269-1-ville.syrjala@linux.intel.com>
References: <20241107161123.16269-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Split an overly long line in the CRT code.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_crt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index 1be55bdb48b9..134a4e6a4ac0 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -1047,7 +1047,9 @@ void intel_crt_init(struct intel_display *display)
 		 * it and see what happens.
 		 */
 		intel_de_write(display, adpa_reg,
-			       adpa | ADPA_DAC_ENABLE | ADPA_HSYNC_CNTL_DISABLE | ADPA_VSYNC_CNTL_DISABLE);
+			       adpa | ADPA_DAC_ENABLE |
+			       ADPA_HSYNC_CNTL_DISABLE |
+			       ADPA_VSYNC_CNTL_DISABLE);
 		if ((intel_de_read(display, adpa_reg) & ADPA_DAC_ENABLE) == 0)
 			return;
 		intel_de_write(display, adpa_reg, adpa);
-- 
2.45.2

