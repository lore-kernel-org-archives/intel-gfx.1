Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6AB606A31E
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Oct 2026 11:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UXN/FZtz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9824C10EE77;
	Mon, 26 Oct 2026 11:53:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863E110EE77
 for <intel-gfx@lists.freedesktop.org>; Mon, 26 Oct 2026 11:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793015628; x=1824551628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cIPVYfwWaI0u9VpKrV83KKLxBwKOG9kAWtmWAaVnTj4=;
 b=UXN/FZtznm6fLWE5brIfu7bHFfzcyxm1n/W4TiOMSkupshSjAyp7cOCl
 tW1esRSXRzSlQYHztBdPF4xgMi1tFjBdIGXgXJ01S4m+hSHdK/ofSpDXt
 zta1qoIyjKXl3+ygRM6gQdINe2AabCCgqwlyh8yOd54Jyypn4ovqMhuld
 E68ITEIBm66ThrhyFqW/0vwqAmB/dXIxdCytXS8EGKSEfXMy/NZxp40/x
 Q3w6wAr3QaDx0v6QbnQUSFBPcInSzqEorEits5ifVg7e0InBPdKDzKl/X
 q4EYKDtivayPgbeoQmVVP1sUM7fBFdGwc2KZ78kDvGAMqoeFx2AaczfoB Q==;
X-CSE-ConnectionGUID: Tu29ZRkaQB23T1ZD6Sn2zA==
X-CSE-MsgGUID: qEWbDJWsQ8WpioNhyYztVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1579605"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1579605"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:53:48 -0700
X-CSE-ConnectionGUID: xiqy6L6wTPaUoq+2OFJunA==
X-CSE-MsgGUID: nen9gwjpTtWgZshyUXmf+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4232174"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:53:45 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 1/3] drm/i915/scaler: drop unused plane_state argument
Date: Mon, 26 Oct 2026 12:53:27 +0100
Message-ID: <20261026115329.2343954-2-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261026115329.2343954-1-michal.grzelak@linux.intel.com>
References: <20261026115329.2343954-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
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
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

intel_allocate_scaler() no longer uses plane_state since condition
containing it has been removed at commit 17d70a0760f2 ("drm/i915/casf:
Extract scaler_has_casf()"). Drop plane_state as well.

v2->v3
- strip Fixes: trailer for cleanups (Jani)

Cc: Nemesa Garg <nemesa.garg@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 7994b983d509d..4b456924fdef3 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -334,7 +334,6 @@ static bool scaler_has_casf(struct intel_display *display, int scaler_id)
 
 static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
 				 struct intel_crtc *crtc,
-				 struct intel_plane_state *plane_state,
 				 bool casf_scaler)
 {
 	struct intel_display *display = to_intel_display(crtc);
@@ -406,7 +405,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
 	int vscale = 0;
 
 	if (*scaler_id < 0)
-		*scaler_id = intel_allocate_scaler(scaler_state, crtc, plane_state, casf_scaler);
+		*scaler_id = intel_allocate_scaler(scaler_state, crtc, casf_scaler);
 
 	if (drm_WARN(display->drm, *scaler_id < 0,
 		     "Cannot find scaler for %s:%d\n", name, idx))
-- 
2.45.2

