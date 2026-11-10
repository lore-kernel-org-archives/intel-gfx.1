Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2597606E471
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2026 13:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X8dDLTga
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8B610F6A6;
	Tue, 10 Nov 2026 13:00:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9E810F6A4
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2026 12:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794315595; x=1825851595;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1+DscA2CLBVNE6jFybqHQWwWJEevXH8QZZ8kUg8Hyz8=;
 b=X8dDLTgaTfN9GP/nQ2fND134obwGc6CeOmp8++wsGQVixTFhgGEmftaS
 lvDmuyIlqka2Pg01TnUfxlFRg2RDJQjsnBxR1Dnx2JkPLfwlBKEx8HgDr
 jHnCYFWaFn5jtr3orLmI5h08fBteHryOc8WEBaKut7RIaVBL+kcMEIs8t
 aeMwUjBaijnOm2PgOmGkAhaWQCz+ngLMsnOaCxxueVtzxbNta5knL+ibH
 13eBY6nsRAHku70dl7suZafYIpTmCrMIaN1O1vBuSwtmfUDzrhThd8zhS
 HjKYQk5AD8aLrLkJF0lmYYhCJkf8+nauTJ/EwgQXDWUTR2LIwgxXvVMjO A==;
X-CSE-ConnectionGUID: ps54K8W7SyeczxERBPflSA==
X-CSE-MsgGUID: nejYKBc0Tjq6VPcqWIQOzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3085801"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3085801"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 04:59:55 -0800
X-CSE-ConnectionGUID: lP0pZDLfSSK68yTH8+sGmw==
X-CSE-MsgGUID: V5x2Fl15To+HRiACLG23RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7976687"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 04:59:54 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915: Unconfuse i915_get_vblank_counter() variables
Date: Tue, 10 Nov 2026 14:59:42 +0200
Message-ID: <20261110125942.11010-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110125942.11010-1-ville.syrjala@linux.intel.com>
References: <20261110125942.11010-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Using the same 'frame' variable for both the raw register
value and the decoded frame counter value is confusing,
and potentially fragile since we need to make sure the
pixel counter has been extracted from the raw register
value before we clobber it with the frame counter extraction.
Use separate variables for each to make the code less
confusing/fragile. The frame counter is only 24 bits, so
using a u64 is also unnecessary.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vblank.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 1d4753605675..4aa6536986e5 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -77,8 +77,8 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	const struct drm_display_mode *mode = &vblank->hwmode;
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
-	u32 pixel, vbl_start, hsync_start, htotal;
-	u64 frame;
+	u32 frame, pixel, vbl_start, hsync_start, htotal;
+	u64 val;
 
 	/*
 	 * On i965gm TV output the frame counter only works up to
@@ -109,11 +109,11 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
 	 * we get a low value that's stable across two reads of the high
 	 * register.
 	 */
-	frame = intel_de_read64_2x32_volatile_fw(display, PIPEFRAMEPIXEL(display, pipe),
-						 PIPEFRAMEHIGH(display, pipe));
+	val = intel_de_read64_2x32_volatile_fw(display, PIPEFRAMEPIXEL(display, pipe),
+					       PIPEFRAMEHIGH(display, pipe));
 
-	pixel = REG_FIELD_GET(PIPE_PIXEL_MASK, frame);
-	frame = REG_FIELD_GET64(PIPE_FRAME_MASK, frame);
+	pixel = REG_FIELD_GET(PIPE_PIXEL_MASK, val);
+	frame = REG_FIELD_GET64(PIPE_FRAME_MASK, val);
 
 	/*
 	 * The frame counter increments at beginning of active.
-- 
2.56.0

