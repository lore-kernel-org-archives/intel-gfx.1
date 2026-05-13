Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9398DCD4851
	for <intel-gfx@archiver.kernel.org>; Wed, 13 May 2026 08:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297CC10ED6B;
	Wed, 13 May 2026 08:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n71NpYoj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B8310ED55
 for <intel-gfx@lists.freedesktop.org>; Wed, 13 May 2026 08:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778659272; x=1810195272;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dEFrmP4xl9dTUtPtQUwgXn55uj92pnbmKfuCmbAHaKM=;
 b=n71NpYojdwydss2E4WeJ4IS8i+Iq3JhiAXStcsXw9/V0hAkdB3tkS9Rm
 Z2tz+tRktW3UJSYOcljFgNvWP2Bh9/I6+GzELzzlc74K/4wbh8b9rvtmM
 RbqWL9f28zdVdjMO7GSMhwUWqN1HgdxLydMCZK0pQeohmnx6xtfAsSLpj
 lKeBBzfZOBCmsQZnjdMhrbIzUzj/IKMcIE8ATFnL+PolT1XcA1amUeHKr
 ++j/6a5yNhM0CpszNtNgTHMQ5Uf21XUNkZTqc/y/7clqYQXmDoqRfaKZ8
 m/u01zl0VQrn3YqgSn6muqOWpF2KD+pgwni5yVIs8f7Tt3E8l6B+/MpkG w==;
X-CSE-ConnectionGUID: /Ad0tbJuQnaZJ+f77mOGpw==
X-CSE-MsgGUID: 6qFEFvDTTBy117roKYYquQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="89884149"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="89884149"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:01:12 -0700
X-CSE-ConnectionGUID: N168wn/6SJSdrnzbllUptg==
X-CSE-MsgGUID: 48tWwSB/RuGsDvLJA3SCVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="237163488"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.61])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:01:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [RESEND] drm/i915/sdvo: use the i2c bus locking functions
Date: Wed, 13 May 2026 11:01:03 +0300
Message-ID: <20260513080103.169402-1-jani.nikula@intel.com>
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
index 23c511a9a2ad..ba54c90828f4 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -3319,7 +3319,7 @@ static void proxy_lock_bus(struct i2c_adapter *adapter,
 	struct intel_sdvo_ddc *ddc = adapter->algo_data;
 	struct intel_sdvo *sdvo = ddc->sdvo;
 
-	sdvo->i2c->lock_ops->lock_bus(sdvo->i2c, flags);
+	i2c_lock_bus(sdvo->i2c, flags);
 }
 
 static int proxy_trylock_bus(struct i2c_adapter *adapter,
@@ -3328,7 +3328,7 @@ static int proxy_trylock_bus(struct i2c_adapter *adapter,
 	struct intel_sdvo_ddc *ddc = adapter->algo_data;
 	struct intel_sdvo *sdvo = ddc->sdvo;
 
-	return sdvo->i2c->lock_ops->trylock_bus(sdvo->i2c, flags);
+	return i2c_trylock_bus(sdvo->i2c, flags);
 }
 
 static void proxy_unlock_bus(struct i2c_adapter *adapter,
@@ -3337,7 +3337,7 @@ static void proxy_unlock_bus(struct i2c_adapter *adapter,
 	struct intel_sdvo_ddc *ddc = adapter->algo_data;
 	struct intel_sdvo *sdvo = ddc->sdvo;
 
-	sdvo->i2c->lock_ops->unlock_bus(sdvo->i2c, flags);
+	i2c_unlock_bus(sdvo->i2c, flags);
 }
 
 static const struct i2c_lock_operations proxy_lock_ops = {
-- 
2.47.3

