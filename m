Return-Path: <SRS0=u9zS=JF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBE0C433ED
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Apr 2021 04:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1C176113E
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Apr 2021 04:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1C176113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584106EA00;
	Thu,  8 Apr 2021 04:52:45 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3836E9F4
 for <intel-gfx@lists.freedesktop.org>; Thu,  8 Apr 2021 04:52:39 +0000 (UTC)
IronPort-SDR: ZRoIB4l2nnlQeieDE2hCykMNJNOwiV2TvdbD98SySd50wkWKmky06FloqYcHdxKGpGwNQZuaCd
 pLBp4Q32zTeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="193573090"
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="193573090"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 21:52:37 -0700
IronPort-SDR: U/k3xfdUpj2G4z9nj8K32fikYan8zRUdXqbhW3pcl9QVkYI8W7PvhhedjZ4B7CaWB/fltCwy76
 IEdM2DeVOX7g==
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="422064220"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 21:52:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed,  7 Apr 2021 21:52:16 -0700
Message-Id: <20210408045227.985408-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210408045227.985408-1-lucas.demarchi@intel.com>
References: <20210408045227.985408-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 01/12] drm/i915: rename display.version to
 display.ver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

The macro we use to check is called DISPLAY_VER(). While using this
macro and the new ones being added in following changes I made the
mistake multiple times when mixing both "ver" and "version". Although
it's usually better to prefer the complete name, the shorhand
DISPLAY_VER() / GRAPHICS_VER / MEDIA_VER are clear and cause less
visual polution.

Another issue is when copying the variable to other places.
"display.version" would be copied to a "display_version" variable which
is long and would make people abbreviate as "version", or "display_ver".
In the first case it's not always clear what version refers to, and in
the second case it just hints it should be the name in the first place.

So, in the same way use used "gen" rather than "generation", use "ver"
instead of "version".

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          | 2 +-
 drivers/gpu/drm/i915/i915_pci.c          | 4 ++--
 drivers/gpu/drm/i915/intel_device_info.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 69e43bf91a15..8c62bb2abd31 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1237,7 +1237,7 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
 #define INTEL_GEN(dev_priv)	(INTEL_INFO(dev_priv)->gen)
 #define INTEL_DEVID(dev_priv)	(RUNTIME_INFO(dev_priv)->device_id)
 
-#define DISPLAY_VER(i915)	(INTEL_INFO(i915)->display.version)
+#define DISPLAY_VER(i915)	(INTEL_INFO(i915)->display.ver)
 #define IS_DISPLAY_RANGE(i915, from, until) \
 	(DISPLAY_VER(i915) >= (from) && DISPLAY_VER(i915) <= (until))
 #define IS_DISPLAY_VER(i915, v) (DISPLAY_VER(i915) == (v))
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 480553746794..ce5cbeaf036d 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -36,7 +36,7 @@
 #include "i915_selftest.h"
 
 #define PLATFORM(x) .platform = (x)
-#define GEN(x) .gen = (x), .gen_mask = BIT((x) - 1), .display.version = (x)
+#define GEN(x) .gen = (x), .gen_mask = BIT((x) - 1), .display.ver = (x)
 
 #define I845_PIPE_OFFSETS \
 	.pipe_offsets = { \
@@ -723,7 +723,7 @@ static const struct intel_device_info bxt_info = {
 static const struct intel_device_info glk_info = {
 	GEN9_LP_FEATURES,
 	PLATFORM(INTEL_GEMINILAKE),
-	.display.version = 10,
+	.display.ver = 10,
 	.ddb_size = 1024,
 	GLK_COLORS,
 };
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 2f442d418a15..b16c75927a12 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -189,7 +189,7 @@ struct intel_device_info {
 #undef DEFINE_FLAG
 
 	struct {
-		u8 version;
+		u8 ver;
 
 #define DEFINE_FLAG(name) u8 name:1
 		DEV_INFO_DISPLAY_FOR_EACH_FLAG(DEFINE_FLAG);
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
