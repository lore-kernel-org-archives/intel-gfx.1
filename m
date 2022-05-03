Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AE2C433F5
	for <intel-gfx@archiver.kernel.org>; Tue,  3 May 2022 18:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7BB10E7E8;
	Tue,  3 May 2022 18:23:29 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190CC10E4AA
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 18:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651602208; x=1683138208;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uTBTrpNgGDTZbYgpZHPbupmMvPOsNhDymHmz5O49hB4=;
 b=m0mdf+GTelx1YaWz7fTgZTKXsc7KHfkDl3WpcbpvBU6+6yucYZtD6HUA
 EGdTKTGSmuuNaIetvqonKYwp6yKi3NI1mI3VZo//t4qRtxWwKp6hDo6IF
 PV6uwOyG2irAE0WRaWcQyM9Ht+m+7tndcv+4ynk2pFfx4EXeYGu3AUs4+
 2KANKmPzRVENYi5j3QVbqo3Ray9BWifiddOyNxVpoPhOm1wq4jqIOZLU4
 LY6bEfORAmuWeEmMJ2Sv6XGZSyxIUFTFF/xX6YeZ2EvpxeJNx7Yn/q870
 nPxjAbwx4Zt34V5W37ozjlgGG7SPyg+ApvhvgXuH9PC0VKA8knCEHavSR Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="249532897"
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; d="scan'208";a="249532897"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 11:23:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; d="scan'208";a="620451124"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by fmsmga008.fm.intel.com with SMTP; 03 May 2022 11:23:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 03 May 2022 21:23:25 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 21:22:30 +0300
Message-Id: <20220503182242.18797-15-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503182242.18797-1-ville.syrjala@linux.intel.com>
References: <20220503182242.18797-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 14/26] drm/i915: Skip FDI vs. dotclock sanity
 check during readout
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

The VBIOS/GOP may not program the FDI M/n vs. dotclock entirely
consistently. Eg. on a SNB Thinkpad X220 LVDS I see dotclock of
69.286 MHz (the best the DPLL can do) vs. FDI M/N 69.3 MHz
(matches what the EDID actually declares).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 1a25addadc21..86971be92e57 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -10248,8 +10248,6 @@ static void intel_modeset_readout_hw_state(struct drm_device *dev)
 			crtc_state->min_voltage_level;
 
 		intel_bw_crtc_update(bw_state, crtc_state);
-
-		intel_pipe_config_sanity_check(dev_priv, crtc_state);
 	}
 }
 
-- 
2.35.1

