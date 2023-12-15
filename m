Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69063C41535
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Dec 2023 11:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AD910E123;
	Fri, 15 Dec 2023 11:11:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA6410E123;
 Fri, 15 Dec 2023 11:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702638695; x=1734174695;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ksGyiksFXhY7uPwUtKPOIfHEzPNiAa0REUC5CSYkGis=;
 b=VakwxRa6ql2cpcLcgM00G409yoSaZzguuy9HhChQ/a6ZnuiX/o/X+UcR
 tD9jsThf1a+J7VIr+k5pWELx2uoMcGYRab66+jh37vbfzK73KeFAA6fsq
 GslxmIrGmZoCGi0t84bjmnZbx/agj8td5Wh0OCkAxZUIRbkW+gs0/7ZgJ
 MHaw4AN6gwvQTI7kUQxEELni4+y3YOvSp/cezgSxNnALOg7Xneijc3wMp
 Ziz/n2mGlVxFgYB0N4gyq6N8uqTctHcPmeXxGxR+7SjYNHK5CsykCSYGz
 3w3uEj/Rey5kdFNqrpnzGvAmdbmd2YdwwiJGQZjOSkXcWrL5F5QxpM4th A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394138390"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; d="scan'208";a="394138390"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 03:11:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="767946560"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; d="scan'208";a="767946560"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 15 Dec 2023 03:11:30 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Dec 2023 13:11:29 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mm: Allow CONFIG_DRM_MM_DEBUG with DRM=m
Date: Fri, 15 Dec 2023 13:11:29 +0200
Message-ID: <20231215111129.9559-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The original rationale for
commit cd456f8d06d2 ("drm: Restrict stackdepot usage to builtin drm.ko")
was that depot_save_stack() (which is what we used back then)
wasn't exported. stack_depot_save() (which is what we use now) is
exported however, so relax the dependency allow CONFIG_DRM_MM_DEBUG
with DRM=m.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 31cfe2c2a2af..4b8b8f8a0e72 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -42,7 +42,7 @@ config DRM_MIPI_DSI
 config DRM_DEBUG_MM
 	bool "Insert extra checks and debug info into the DRM range managers"
 	default n
-	depends on DRM=y
+	depends on DRM
 	depends on STACKTRACE_SUPPORT
 	select STACKDEPOT
 	help
-- 
2.41.0

