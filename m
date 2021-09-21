Return-Path: <SRS0=FeUR=OL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5243C433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 15:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BD1261178
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 15:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BD1261178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1067C6EA1E;
	Tue, 21 Sep 2021 15:25:31 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF866EA1E
 for <intel-gfx@lists.freedesktop.org>; Tue, 21 Sep 2021 15:25:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="223438503"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="223438503"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 08:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="556982523"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 21 Sep 2021 08:25:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Sep 2021 18:25:23 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 21 Sep 2021 18:25:15 +0300
Message-Id: <20210921152517.803-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210921152517.803-1-ville.syrjala@linux.intel.com>
References: <20210921152517.803-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 2/4] drm/i915/fbc: Align FBC segments to 512B
 on glk+
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

Apply the same 512 byte FBC segment alignment to glk+ as we use
on skl+. The only real difference is that we now have a dedicated
register for the FBC override stride. Not 100% sure which
platforms really need the 512B alignment, but it's easiest
to just do it on everything.

Also the hardware no longer seems to misclaculate the CFB stride
for linear, so we can omit the use of the override stride for
linear unless the stride is misaligned.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 14 +++++++++++---
 drivers/gpu/drm/i915/i915_reg.h          |  4 ++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index f51871f39eb6..ff05eb83e204 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -115,7 +115,7 @@ static unsigned int intel_fbc_cfb_stride(struct drm_i915_private *i915,
 	 * be 512 byte aligned. Aligning each line to 512 bytes guarantees
 	 * that regardless of the compression limit we choose later.
 	 */
-	if (DISPLAY_VER(i915) == 9)
+	if (DISPLAY_VER(i915) >= 9)
 		return max(ALIGN(stride, 512), skl_fbc_min_cfb_stride(cache));
 	else
 		return stride;
@@ -356,10 +356,18 @@ static void gen7_fbc_activate(struct drm_i915_private *dev_priv)
 	const struct intel_fbc_reg_params *params = &fbc->params;
 	u32 dpfc_ctl;
 
-	/* Display WA #0529: skl, kbl, bxt. */
-	if (DISPLAY_VER(dev_priv) == 9) {
+	if (DISPLAY_VER(dev_priv) >= 10) {
 		u32 val = 0;
 
+		if (params->override_cfb_stride)
+			val |= FBC_STRIDE_OVERRIDE |
+				FBC_STRIDE(params->override_cfb_stride / fbc->limit);
+
+		intel_de_write(dev_priv, GLK_FBC_STRIDE, val);
+	} else if (DISPLAY_VER(dev_priv) == 9) {
+		u32 val = 0;
+
+		/* Display WA #0529: skl, kbl, bxt. */
 		if (params->override_cfb_stride)
 			val |= CHICKEN_FBC_STRIDE_OVERRIDE |
 				CHICKEN_FBC_STRIDE(params->override_cfb_stride / fbc->limit);
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index cad84c3b864b..ef594df039db 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -3389,6 +3389,10 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define   ILK_DPFC_DISABLE_DUMMY0 (1 << 8)
 #define   ILK_DPFC_CHICKEN_COMP_DUMMY_PIXEL	(1 << 14)
 #define   ILK_DPFC_NUKE_ON_ANY_MODIFICATION	(1 << 23)
+#define GLK_FBC_STRIDE		_MMIO(0x43228)
+#define   FBC_STRIDE_OVERRIDE	REG_BIT(15)
+#define   FBC_STRIDE_MASK	REG_GENMASK(14, 0)
+#define   FBC_STRIDE(x)		REG_FIELD_PREP(FBC_STRIDE_MASK, (x))
 #define ILK_FBC_RT_BASE		_MMIO(0x2128)
 #define   ILK_FBC_RT_VALID	(1 << 0)
 #define   SNB_FBC_FRONT_BUFFER	(1 << 1)
-- 
2.32.0

