Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C09606A325
	for <intel-gfx@archiver.kernel.org>; Fri, 20 Nov 2026 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VLYzOJxL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC80F10E921;
	Fri, 20 Nov 2026 15:57:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044FD10E921
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Nov 2026 15:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795190260; x=1826726260;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4e1norEu0tsFsfd/g4Wp5AZgpeyYdwl7xej0VO0PLLI=;
 b=VLYzOJxLWp/BcXc1ZSZQei+SyGvVv5mQGS/pq452D3X+qPu6QEomSPf9
 nwW2ueAl/VoYzWDjlPQ4tkkgVeHQ8l+FaoJp1bF77KLRZyoY2vm72xUIX
 lCsl2DlxdxfUbh3GhsCIViHptBRaxLgXV+ZUxLNs45XGeb+DscdL+XqOP
 U3jRo+9J8IUeKTUl1tZvx0HsoM0R9h72ZSSz5iROGtFrdRTL/ZbmSt3RE
 7Jff9YGH5FXNoQmOZW8AsN+6wIJSkmuRdXdwD5hvC3g99grFu+dcCr+K8
 9tb+EKbmNbO/aXy03a23ijqrTlyCbl/Z7smT932YHdy0aE+gwDBVGE4iD A==;
X-CSE-ConnectionGUID: WopkUTpFQG2HP1aV8HYQYw==
X-CSE-MsgGUID: f5lnipH9R42JNGkPCYpZIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4062818"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4062818"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:57:40 -0800
X-CSE-ConnectionGUID: 3OK3oAzKRHmBBulzyFusMA==
X-CSE-MsgGUID: jOnytOf5TZmqsXl/ZTbOqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="11059190"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.250])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:57:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/2] drm/i915/gvt: rename kvmgt.c to kvmgt_module.c
Date: Fri, 20 Nov 2026 17:57:33 +0200
Message-ID: <20261120155734.259742-1-jani.nikula@intel.com>
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

Make space for building the kvmgt.ko within gvt/. Otherwise, the names
would clash.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/Makefile                    | 2 +-
 drivers/gpu/drm/i915/gvt/{kvmgt.c => kvmgt_module.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/gpu/drm/i915/gvt/{kvmgt.c => kvmgt_module.c} (100%)

diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
index 1699f644298e..47f4f6f43c15 100644
--- a/drivers/gpu/drm/i915/gvt/Makefile
+++ b/drivers/gpu/drm/i915/gvt/Makefile
@@ -14,7 +14,7 @@ kvmgt-$(CONFIG_DRM_I915_GVT) += \
 	gvt/gtt.o \
 	gvt/handlers.o \
 	gvt/interrupt.o \
-	gvt/kvmgt.o \
+	gvt/kvmgt_module.o \
 	gvt/mmio.o \
 	gvt/mmio_context.o \
 	gvt/opregion.o \
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt_module.c
similarity index 100%
rename from drivers/gpu/drm/i915/gvt/kvmgt.c
rename to drivers/gpu/drm/i915/gvt/kvmgt_module.c
-- 
2.47.3

