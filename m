Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370BBCD4F5E
	for <intel-gfx@archiver.kernel.org>; Thu, 21 May 2026 10:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C146810E244;
	Thu, 21 May 2026 10:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wzxgj/AY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015D610E244
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 May 2026 10:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779358815; x=1810894815;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rgyb8cr1SMpR5tTz4gmEOgybyjY5uSd/bxHn+NSA8M4=;
 b=Wzxgj/AYH2nrAMIiQYsXxyaZrSIx1SNCoSTizmeQoXw2+8wuG3cCT4vg
 0J24Up4koM6L1FM6q00ORiSS6G/qCawm8okijFN7WH/V2/yngPrqAN4J7
 4EwpMQ3korUGQ8qMpazV6QqGcX29XAgxBd+MBI259eExHR4iwuTwOpBpu
 spcsrG3DC9VIg5+9EeTuBjMX8Rl1jDnk9+Gu0+4ZxSERQpI7+5lnuMWDo
 NYzk0qGprkM10d8JYzPBULAlR1j8wW3r637fhWf0mF3l4qkaeCTEWrF1l
 4eNWWxK17VoVhXPU0Z/gy1w51q/EMtXLertrGpOXS+vsVX1xDKRup5cuR w==;
X-CSE-ConnectionGUID: U9Lplt69SoKapQKOyUDuGg==
X-CSE-MsgGUID: OPs1rmmNSmKT358x+iAK+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="67799783"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="67799783"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 03:20:14 -0700
X-CSE-ConnectionGUID: b2a5w3xTQRumRWXDs+UZYg==
X-CSE-MsgGUID: J3slCPrXTXOqKBqcfV6KyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="236069612"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.101])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 03:20:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/2] drm/i915: replace drm_driver .release with drmm action
Date: Thu, 21 May 2026 13:20:08 +0300
Message-ID: <20260521102009.2863402-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Replace the struct drm_driver .release hook and manual i915->do_release
handling with a proper drmm action. Start off with using the old release
hook as the action, although going forward this should be made more fine
grained.

There are no intentional functional changes here.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index f06b2e8cf7d4..02295ee324e4 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -130,6 +130,8 @@
 
 static const struct drm_driver i915_drm_driver;
 
+static void i915_driver_release(struct drm_device *dev, void *res);
+
 static int i915_workqueues_init(struct drm_i915_private *dev_priv)
 {
 	/*
@@ -914,7 +916,9 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	i915_welcome_messages(i915);
 
-	i915->do_release = true;
+	ret = drmm_add_action_or_reset(&i915->drm, i915_driver_release, NULL);
+	if (ret)
+		return ret;
 
 	return 0;
 
@@ -984,15 +988,12 @@ void i915_driver_remove(struct drm_i915_private *i915)
 	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 }
 
-static void i915_driver_release(struct drm_device *dev)
+static void i915_driver_release(struct drm_device *dev, void *unused)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
 	intel_wakeref_t wakeref;
 
-	if (!dev_priv->do_release)
-		return;
-
 	wakeref = intel_runtime_pm_get(rpm);
 
 	i915_gem_driver_release(dev_priv);
@@ -1876,7 +1877,6 @@ static const struct drm_driver i915_drm_driver = {
 	    DRIVER_GEM |
 	    DRIVER_RENDER | DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_SYNCOBJ |
 	    DRIVER_SYNCOBJ_TIMELINE,
-	.release = i915_driver_release,
 	.open = i915_driver_open,
 	.postclose = i915_driver_postclose,
 	.show_fdinfo = PTR_IF(IS_ENABLED(CONFIG_PROC_FS), i915_drm_client_fdinfo),
-- 
2.47.3

