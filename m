Return-Path: <SRS0=4n+h=QE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C701C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Nov 2021 18:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0CA461A62
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Nov 2021 18:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0CA461A62
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42ED56E4CD;
	Wed, 17 Nov 2021 18:31:25 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898906E4CD
 for <intel-gfx@lists.freedesktop.org>; Wed, 17 Nov 2021 18:31:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="233970411"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="233970411"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 10:31:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="536395241"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 17 Nov 2021 10:31:10 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 17 Nov 2021 20:31:10 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 17 Nov 2021 20:31:03 +0200
Message-Id: <20211117183103.27418-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211117183103.27418-1-ville.syrjala@linux.intel.com>
References: <20211117183103.27418-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 3/3] drm/i915: Fix framestart_delay commens in
 VRR code
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

Since I originally wrote these comments we decided to change our
definition of framestart_delay from 0-3 to 1-4. Adjust the comments
to match that new convention. The actual code was adjusted already.

Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index db1c3902fc2d..139e8936edc5 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -60,7 +60,7 @@ intel_vrr_check_modeset(struct intel_atomic_state *state)
  * Between those two points the vblank exit starts (and hence registers get
  * latched) ASAP after a push is sent.
  *
- * framestart_delay is programmable 0-3.
+ * framestart_delay is programmable 1-4.
  */
 static int intel_vrr_vblank_exit_length(const struct intel_crtc_state *crtc_state)
 {
@@ -138,13 +138,13 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 			i915->window2_delay;
 	else
 		/*
-		 * FIXME: s/4/framestart_delay+1/ to get consistent
+		 * FIXME: s/4/framestart_delay/ to get consistent
 		 * earliest/latest points for register latching regardless
 		 * of the framestart_delay used?
 		 *
 		 * FIXME: this really needs the extra scanline to provide consistent
 		 * behaviour for all framestart_delay values. Otherwise with
-		 * framestart_delay==3 we will end up extending the min vblank by
+		 * framestart_delay==4 we will end up extending the min vblank by
 		 * one extra line.
 		 */
 		crtc_state->vrr.pipeline_full =
-- 
2.32.0

