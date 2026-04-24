Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C34FED3DA
	for <intel-gfx@archiver.kernel.org>; Fri, 24 Apr 2026 14:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BE910E3E3;
	Fri, 24 Apr 2026 14:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNG4mHcr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69F110E3E3
 for <intel-gfx@lists.freedesktop.org>; Fri, 24 Apr 2026 14:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777042664; x=1808578664;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pNexVISFV1fEA/By7Tr1MMjsRpdfva456BR0PaYXwao=;
 b=jNG4mHcruWKiTN3KF87vFYwa2ZCEkhJF4TtsAFAVaabegrQZvUuK1PD0
 wURpTev2VgcbVBipqTM46UrfHHgWZ/V02gvXIqufnyn5crNcGoBsFr2d0
 +uqm71ELG7KR3r8xxpGrmN82j3Nx4ye7iCCO6ewy444Z1ED2DL2uqQY/0
 3a1YdWZkqnEx5h/nKUW2slksdUBksgBhJLnaRpICDxPo76+gnY4Kxyvvl
 1ZAyXncIdiE5A4bHV5G9xwU1K5MQknDqvuyVlqL7ZxTl20bOmPnlyf5KN
 yvO2h2sN8f9IU3zIit2vlHSjKhK3DeIYDyTBQ2P9qFiMJHocm/khBxmCc w==;
X-CSE-ConnectionGUID: AWsuSuU2Q0WHTEQFDeKarA==
X-CSE-MsgGUID: 0ArEfVXKTmqZLZND+rztCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="78080995"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="78080995"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 07:57:43 -0700
X-CSE-ConnectionGUID: K66Iya5kQ8WNuym8hgU12g==
X-CSE-MsgGUID: oKE+KCOeQcGBLaJt/inO9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="237311462"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.89])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 07:57:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/i915/sdvo: use the i2c bus locking functions
Date: Fri, 24 Apr 2026 17:57:38 +0300
Message-ID: <20260424145738.251138-1-jani.nikula@intel.com>
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

Use i2c_lock_bus(), i2c_trylock_bus(), and i2c_unlock_bus() instead of
poking at i2c adapter's lock_ops directly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_sdvo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 2e1af9e869de..f65b1e307aaf 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -3314,7 +3314,7 @@ static void proxy_lock_bus(struct i2c_adapter *adapter,
 	struct intel_sdvo_ddc *ddc = adapter->algo_data;
 	struct intel_sdvo *sdvo = ddc->sdvo;
 
-	sdvo->i2c->lock_ops->lock_bus(sdvo->i2c, flags);
+	i2c_lock_bus(sdvo->i2c, flags);
 }
 
 static int proxy_trylock_bus(struct i2c_adapter *adapter,
@@ -3323,7 +3323,7 @@ static int proxy_trylock_bus(struct i2c_adapter *adapter,
 	struct intel_sdvo_ddc *ddc = adapter->algo_data;
 	struct intel_sdvo *sdvo = ddc->sdvo;
 
-	return sdvo->i2c->lock_ops->trylock_bus(sdvo->i2c, flags);
+	return i2c_trylock_bus(sdvo->i2c, flags);
 }
 
 static void proxy_unlock_bus(struct i2c_adapter *adapter,
@@ -3332,7 +3332,7 @@ static void proxy_unlock_bus(struct i2c_adapter *adapter,
 	struct intel_sdvo_ddc *ddc = adapter->algo_data;
 	struct intel_sdvo *sdvo = ddc->sdvo;
 
-	sdvo->i2c->lock_ops->unlock_bus(sdvo->i2c, flags);
+	i2c_unlock_bus(sdvo->i2c, flags);
 }
 
 static const struct i2c_lock_operations proxy_lock_ops = {
-- 
2.47.3

