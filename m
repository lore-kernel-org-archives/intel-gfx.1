Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86508C6FA82
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Sep 2022 00:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBF110E51C;
	Tue, 13 Sep 2022 00:58:38 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CCB10E146;
 Tue, 13 Sep 2022 00:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663030688; x=1694566688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kr1LciugNNttTLX2Mwa/1HEeInKy09QHn+EpUr3G1aE=;
 b=DNVZPddnCIYEpRz8AjxG3PvbFXq9kAOLJTWMVD3hsp7enYZ8qXLrcf/e
 fUuMaYjyiSb52bnMzqIcanekwn6B9V5nmJw0rY/xklakPULndBCbL7a/L
 +7XrCn+k+AapYRInJvZ83Yxb1ym1mPKTo6fWHWlv+V9Im6cFuFYPrl/AQ
 BH/HwADfA3lDvxh7MMxKCt7Gl83j7eu3rLgZiSR5u8pQVto83X54zJPfJ
 6W3mQtXYgysoZK/QQrneRrxU2mzIatB+g/nRCshs3IwiX/GXhmDiqIucx
 Kuixe6uXL9e90Rtq73OSBUl+tWphNpetlnHwZTdt1qwTsSWax2idSdC9N A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="295592210"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="295592210"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:58:08 -0700
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="758593588"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:58:08 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 12 Sep 2022 17:57:39 -0700
Message-Id: <20220913005739.798337-16-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
References: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v5 15/15] HAX: drm/i915: force INTEL_MEI_GSC and
 INTEL_MEI_PXP on for CI
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Both are required for HuC loading.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/Kconfig.debug | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index e7fd3e76f8a2..a6576ffbc4dc 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -48,6 +48,8 @@ config DRM_I915_DEBUG
 	select DRM_I915_DEBUG_RUNTIME_PM
 	select DRM_I915_SW_FENCE_DEBUG_OBJECTS
 	select DRM_I915_SELFTEST
+	select INTEL_MEI_GSC
+	select INTEL_MEI_PXP
 	select BROKEN # for prototype uAPI
 	default n
 	help
-- 
2.37.2

