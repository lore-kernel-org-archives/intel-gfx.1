Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBB4C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Feb 2022 13:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B342010F37F;
	Wed, 23 Feb 2022 13:13:29 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DA210F373
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Feb 2022 13:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645622004; x=1677158004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yJtEBcZTXoWA5k00CHBQ69RGwpUm5v4uMoger9s5sYo=;
 b=aYc6tql+prKfRASmNHodZ9KMv4cSFXhhTwpBS6vBbyxpH+aq9nTNnsQ+
 OVjL3/tUZeG2ljoJLiRnZ/w437wXt8MnOlAXhTnn3DKe10ECZ9pHLpwZc
 qWVQUbyjMjm5JdKs3JFN5q2g+VAj5yfOKKEZsR0EB3BI33JndV522zNLo
 OajcdTovrKru1r0dt7UUIJ8lWddoyWU9eSG0tliC5NVKOP1Mef74eEgVM
 6MGLYR1HqJmTZSA7hlJ+hr/wycMJhKOHHyLf5IYWxjF5gbcMKhm6C2Ggp
 9Yne39uoTiMEUPnz++szAyWavexr7RKnqh9a0e4dx5i22hacCsqx8pB0z g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="235466258"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="235466258"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 05:13:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="532676483"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga007.jf.intel.com with SMTP; 23 Feb 2022 05:13:22 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Feb 2022 15:13:21 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 23 Feb 2022 15:13:04 +0200
Message-Id: <20220223131315.18016-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220223131315.18016-1-ville.syrjala@linux.intel.com>
References: <20220223131315.18016-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 02/13] drm/i915: Fix cursor coordinates on
 bigjoiner slave
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

Adjust the cursor dst coordinates appripriately when it's on
the bigjoiner slave pipe. intel_atomic_plane_check_clipping()
already did this but with the cursor we discard those results
(apart from uapi.visible and error checks) since the hardware
will be doing the clipping for us.

v2: Rebase due to bigjoiner bitmask usage

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 2ade8fdd9bdd..3e80763aa828 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -152,6 +152,9 @@ static int intel_check_cursor(struct intel_crtc_state *crtc_state,
 	/* Use the unclipped src/dst rectangles, which we program to hw */
 	plane_state->uapi.src = src;
 	plane_state->uapi.dst = dst;
+	if (intel_crtc_is_bigjoiner_slave(crtc_state))
+		drm_rect_translate(&plane_state->uapi.dst,
+				   -crtc_state->pipe_src_w, 0);
 
 	ret = intel_cursor_check_surface(plane_state);
 	if (ret)
-- 
2.34.1

