Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32871C54E68
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Mar 2024 16:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9842110EECF;
	Thu, 21 Mar 2024 16:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSg7oult";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2A210EEEF
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 Mar 2024 16:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711037901; x=1742573901;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MPIVk89hhJHrgmeGD8PN5wYGpcN/5pm+LzWoDcyRVso=;
 b=DSg7oultxaWhpOxEsnabXseNMWVbsJyX22QOP0kppQeAQm0OhefKn+EM
 caZOsvajU2EksX3wtbmlWdnH+beSeDFbF3YHggMkHaCEkMLapkVC5LTgY
 P4yu3x+EzhTT3zCpvwI0FHTI9Dwh/L5xoPPOEMsERUhKnXhMWwdRx9u42
 1NopbRV9niBFIcgZC6smSRTCFop4jflI6DHXl/vRR1s4MbHrvmRFEVyPZ
 r55pQIqVucouEwtv+oCFjeESU1zUNw/PKK/K6GkkxcH42Po8xPgPsQqIc
 1f+fClP6rL5dq6D7C6MkMFlQXXXaOAFRztVPNy1HGL1cpKIAggjNH70Ah g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5894195"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5894195"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 09:18:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="827783101"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="827783101"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 21 Mar 2024 09:18:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 21 Mar 2024 18:18:18 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915/bios: Define the (obsolete) backlight i2c VBT
 stuff
Date: Thu, 21 Mar 2024 18:18:05 +0200
Message-ID: <20240321161806.31714-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240321161806.31714-1-ville.syrjala@linux.intel.com>
References: <20240321161806.31714-1-ville.syrjala@linux.intel.com>
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The VBT backlight entries include various fields for i2c
controlled backlights. These have been obsoleted at some
unknown point in time, but let's define them anyway so that
we have a full picture of what has been in there.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vbt_defs.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
index 5da8ae407dfd..bcd1b239eb65 100644
--- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
@@ -881,11 +881,12 @@ struct bdb_lvds_lfp_data_tail {
 struct lfp_backlight_data_entry {
 	u8 type:2;
 	u8 active_low_pwm:1;
-	u8 obsolete1:5;
+	u8 i2c_pin:3;						/* obsolete since ? */
+	u8 i2c_speed:2;						/* obsolete since ? */
 	u16 pwm_freq_hz;
 	u8 min_brightness;					/* ???-233 */
-	u8 obsolete2;
-	u8 obsolete3;
+	u8 i2c_address;						/* obsolete since ? */
+	u8 i2c_command;						/* obsolete since ? */
 } __packed;
 
 struct lfp_backlight_control_method {
-- 
2.43.2

