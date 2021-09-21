Return-Path: <SRS0=FeUR=OL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3F4C433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 18:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8955F61184
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 18:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8955F61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B0E6EA3D;
	Tue, 21 Sep 2021 18:12:50 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E324B6EA3D
 for <intel-gfx@lists.freedesktop.org>; Tue, 21 Sep 2021 18:12:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="221549950"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="221549950"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 11:12:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="549597325"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 21 Sep 2021 11:12:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Sep 2021 21:12:45 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 21 Sep 2021 21:12:45 +0300
Message-Id: <20210921181245.15091-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210921152517.803-4-ville.syrjala@linux.intel.com>
References: <20210921152517.803-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v3 3/4] drm/i915/fbc: Implement Wa_16011863758
 for icl+
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

There's some kind of weird corner cases in FBC which requires
FBC segments to be separated by at least one extra cacheline.
Make sure that is present.

v2: Respin to fit in with skl_fbc_min_cfb_stride()
v3: Make it build

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> #v1
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index ff05eb83e204..2df6a4e115a1 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -84,7 +84,8 @@ static unsigned int _intel_fbc_cfb_stride(const struct intel_fbc_state_cache *ca
 }
 
 /* minimum acceptable cfb stride in bytes, assuming 1:1 compression limit */
-static unsigned int skl_fbc_min_cfb_stride(const struct intel_fbc_state_cache *cache)
+static unsigned int skl_fbc_min_cfb_stride(struct drm_i915_private *i915,
+					   const struct intel_fbc_state_cache *cache)
 {
 	unsigned int limit = 4; /* 1:4 compression limit is the worst case */
 	unsigned int cpp = 4; /* FBC always 4 bytes per pixel */
@@ -94,6 +95,13 @@ static unsigned int skl_fbc_min_cfb_stride(const struct intel_fbc_state_cache *c
 	/* minimum segment stride we can use */
 	stride = cache->plane.src_w * cpp * height / limit;
 
+	/*
+	 * Wa_16011863758: icl+
+	 * Avoid some hardware segment address miscalculation.
+	 */
+	if (DISPLAY_VER(i915) >= 11)
+		stride += 64;
+
 	/*
 	 * At least some of the platforms require each 4 line segment to
 	 * be 512 byte aligned. Just do it always for simplicity.
@@ -116,7 +124,7 @@ static unsigned int intel_fbc_cfb_stride(struct drm_i915_private *i915,
 	 * that regardless of the compression limit we choose later.
 	 */
 	if (DISPLAY_VER(i915) >= 9)
-		return max(ALIGN(stride, 512), skl_fbc_min_cfb_stride(cache));
+		return max(ALIGN(stride, 512), skl_fbc_min_cfb_stride(i915, cache));
 	else
 		return stride;
 }
-- 
2.32.0

