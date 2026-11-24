Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB855606A31E
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2026 18:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=it+odF3W
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B05410E5AD;
	Tue, 24 Nov 2026 18:28:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B5D10E5AD
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 18:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795544885; x=1827080885;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+Alb6RoiRqS1eqRZyA+BTdqkuR1Dr4E5V1DWU+yWoRc=;
 b=it+odF3WwOhvANExl2NR3/99eTD+LWOuqZhcnr6hY1d3VHVDTrrAXm32
 bxA8Xn/OSw3pLqjN73aXPKKgh51x7M48GxVqVMM68VKmxSPeydNCQgsrR
 znYU0/Q6OwMYa+axdI4vduZTubPe/nV3bLRIKxmTfSLk5j00LPQgTFz/y
 uYaqtUid1hsphKGFWRr3g2CWvv98Sq+buISOQXhFtc9Oe4n3C4+OFrkqh
 TAu0Mho64EZZrc+7XJHlfnl5ZT2hkh7YId4J60Zl6QayHGo3/Fn6sTo00
 ApcvvGUYVxCqZN9RR384Okbf/P94pdk2/gFRUTUCpbjda8nTKggTjidot Q==;
X-CSE-ConnectionGUID: AQj6trf4RgS0DSjYiTWB7A==
X-CSE-MsgGUID: QTy72s9DTxW4Bu5VgKtnjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4409020"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4409020"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 09:35:27 -0800
X-CSE-ConnectionGUID: sHhuygVmSEacDuPqYHXU2Q==
X-CSE-MsgGUID: l48bJV21RiK6QPBNCvnOGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11611112"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.215])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 09:35:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/2] drm/i915: simplify ULT/ULX subplatform detection
Date: Tue, 24 Nov 2026 19:35:20 +0200
Message-ID: <20261124173521.1619675-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For HSW and BDW, ULX machines are also considered ULT. For the sake of
simplicity and clarity, handle this at the IS_XXX_ULT() macro level
instead of two simultaneous subplatforms.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          | 9 ++++++---
 drivers/gpu/drm/i915/intel_device_info.c | 4 ----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 95637ada00d7..5f700ae27643 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -509,13 +509,16 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_P, INTEL_SUBPLATFORM_RPLU)
 #define IS_HASWELL_EARLY_SDV(i915) (IS_HASWELL(i915) && \
 				    (INTEL_DEVID(i915) & 0xFF00) == 0x0C00)
+/* BDW ULX machines are also considered ULT. */
 #define IS_BROADWELL_ULT(i915) \
-	IS_SUBPLATFORM(i915, INTEL_BROADWELL, INTEL_SUBPLATFORM_ULT)
+	(IS_SUBPLATFORM(i915, INTEL_BROADWELL, INTEL_SUBPLATFORM_ULT) || \
+	 IS_SUBPLATFORM(i915, INTEL_BROADWELL, INTEL_SUBPLATFORM_ULX))
 #define IS_BROADWELL_ULX(i915) \
 	IS_SUBPLATFORM(i915, INTEL_BROADWELL, INTEL_SUBPLATFORM_ULX)
+/* HSW ULX machines are also considered ULT. */
 #define IS_HASWELL_ULT(i915) \
-	IS_SUBPLATFORM(i915, INTEL_HASWELL, INTEL_SUBPLATFORM_ULT)
-/* ULX machines are also considered ULT. */
+	(IS_SUBPLATFORM(i915, INTEL_HASWELL, INTEL_SUBPLATFORM_ULT) ||	\
+	 IS_SUBPLATFORM(i915, INTEL_HASWELL, INTEL_SUBPLATFORM_ULX))
 #define IS_HASWELL_ULX(i915) \
 	IS_SUBPLATFORM(i915, INTEL_HASWELL, INTEL_SUBPLATFORM_ULX)
 #define IS_SKYLAKE_ULT(i915) \
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index bbe3a24fe3d9..2014a8f07e61 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -245,10 +245,6 @@ static void intel_device_info_subplatform_init(struct drm_i915_private *i915)
 	} else if (find_devid(devid, subplatform_ulx_ids,
 			      ARRAY_SIZE(subplatform_ulx_ids))) {
 		mask = BIT(INTEL_SUBPLATFORM_ULX);
-		if (IS_HASWELL(i915) || IS_BROADWELL(i915)) {
-			/* ULX machines are also considered ULT. */
-			mask |= BIT(INTEL_SUBPLATFORM_ULT);
-		}
 	} else if (find_devid(devid, subplatform_portf_ids,
 			      ARRAY_SIZE(subplatform_portf_ids))) {
 		mask = BIT(INTEL_SUBPLATFORM_PORTF);
-- 
2.47.3

