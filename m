Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C112D711C0
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Nov 2024 16:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEDC10E18A;
	Wed, 20 Nov 2024 16:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D7pD6Xln";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCFD10E79E
 for <intel-gfx@lists.freedesktop.org>; Wed, 20 Nov 2024 16:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732120900; x=1763656900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lp1XsOjfEdnhtE95S3d9mElLCXp65ltf+bTb949N1gA=;
 b=D7pD6XlnrxIUgbx/nR/cmU8vYvZ7fCNiKAmK6tAuJPqc8km6ibjs2BaS
 nFU71tyj4iPcVQXJUA5e0/JgJob4EYl4bsECXilqKRxAoHUBvfthwMD1c
 5ZSFkBvpDUGY5l7SBHGojKTsrKBaib97aijIiPJAQEq8DUrTePfXsLMuN
 48QqPnlMZ+j8gPEQoh0yaWKKFBAtDBMgvX7w+Zefy+R7FWzwLn/wJms0u
 fEqfkaLwZuW0V2PdalTeAjTjZ474HL4sFcXZeKeBpZdvcYNWs9tQDAlRa
 EJ6js/BVsng35r/iH72ehZhrVRlE5LhqPp7ZmAJECWbyJAEqmR59VzfGx A==;
X-CSE-ConnectionGUID: N07YYqhqThWlLC22IdBptQ==
X-CSE-MsgGUID: jznXexN6RT6ymdjECCl+Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="49620316"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="49620316"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 08:41:31 -0800
X-CSE-ConnectionGUID: 8Bl7c7onSzio3udjPW59BQ==
X-CSE-MsgGUID: qMTWedN2SeWFfZUjz6xghg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="90137166"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 20 Nov 2024 08:41:30 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 20 Nov 2024 18:41:28 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: stable@vger.kernel.org
Subject: [PATCH 2/4] drm/i915/color: Stop using non-posted DSB writes for
 legacy LUT
Date: Wed, 20 Nov 2024 18:41:21 +0200
Message-ID: <20241120164123.12706-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241120164123.12706-1-ville.syrjala@linux.intel.com>
References: <20241120164123.12706-1-ville.syrjala@linux.intel.com>
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

DSB LUT register writes vs. palette anti-collision logic
appear to interact in interesting ways:
- posted DSB writes simply vanish into thin air while
  anti-collision is active
- non-posted DSB writes actually get blocked by the anti-collision
  logic, but unfortunately this ends up hogging the bus for
  long enough that unrelated parallel CPU MMIO accesses start
  to disappear instead

Even though we are updating the LUT during vblank we aren't
immune to the anti-collision logic because it kicks in brifly
for pipe prefill (initiated at frame start). The safe time
window for performing the LUT update is thus between the
undelayed vblank and frame start. Turns out that with low
enough CDCLK frequency (DSB execution speed depends on CDCLK)
we can exceed that.

As we are currently using non-posted writes for the legacy LUT
updates, in which case we can hit the far more severe failure
mode. The problem is exacerbated by the fact that non-posted
writes are much slower than posted writes (~4x it seems).

To mititage the problem let's switch to using posted DSB
writes for legacy LUT updates (which will involve using the
double write approach to avoid other problems with DSB
vs. legacy LUT writes). Despite writing each register twice
this will in fact make the legacy LUT update faster when
compared to the non-posted write approach, making the
problem less likely to appear. The failure mode is also
less severe.

This isn't the 100% solution we need though. That will involve
estimating how long the LUT update will take, and pushing
frame start and/or delayed vblank forward to guarantee that
the update will have finished by the time the pipe prefill
starts...

Cc: stable@vger.kernel.org
Fixes: 34d8311f4a1c ("drm/i915/dsb: Re-instate DSB for LUT updates")
Fixes: 25ea3411bd23 ("drm/i915/dsb: Use non-posted register writes for legacy LUT")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12494
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 30 ++++++++++++++--------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 6ea3d5c58cb1..7cd902bbd244 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1368,19 +1368,29 @@ static void ilk_load_lut_8(const struct intel_crtc_state *crtc_state,
 	lut = blob->data;
 
 	/*
-	 * DSB fails to correctly load the legacy LUT
-	 * unless we either write each entry twice,
-	 * or use non-posted writes
+	 * DSB fails to correctly load the legacy LUT unless
+	 * we either write each entry twice when using posted
+	 * writes, or we use non-posted writes.
+	 *
+	 * If palette anti-collision is active during LUT
+	 * register writes:
+	 * - posted writes simply get dropped and thus the LUT
+	 *   contents may not be correctly updated
+	 * - non-posted writes are blocked and thus the LUT
+	 *   contents are always correct, but simultaneous CPU
+	 *   MMIO access will start to fail
+	 *
+	 * Choose the lesser of two evils and use posted writes.
+	 * Using posted writes is also faster, even when having
+	 * to write each register twice.
 	 */
-	if (crtc_state->dsb_color_vblank)
-		intel_dsb_nonpost_start(crtc_state->dsb_color_vblank);
-
-	for (i = 0; i < 256; i++)
+	for (i = 0; i < 256; i++) {
 		ilk_lut_write(crtc_state, LGC_PALETTE(pipe, i),
 			      i9xx_lut_8(&lut[i]));
-
-	if (crtc_state->dsb_color_vblank)
-		intel_dsb_nonpost_end(crtc_state->dsb_color_vblank);
+		if (crtc_state->dsb_color_vblank)
+			ilk_lut_write(crtc_state, LGC_PALETTE(pipe, i),
+				      i9xx_lut_8(&lut[i]));
+	}
 }
 
 static void ilk_load_lut_10(const struct intel_crtc_state *crtc_state,
-- 
2.45.2

