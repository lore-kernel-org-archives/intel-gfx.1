Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F401AC982DA
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Sep 2026 10:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6909D10E4EE;
	Fri, 18 Sep 2026 10:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J4ljq4up";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861A910E4EE
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2026 10:43:51 +0000 (UTC)
X-CSE-ConnectionGUID: QN9lS1Z4Tf+P52oAFbnifw==
X-CSE-MsgGUID: /d/vQc1LTR+PjYHmG95YrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107728492"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107728492"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:43:51 -0700
X-CSE-ConnectionGUID: GU9mxmSlSy646cpbgUaZBg==
X-CSE-MsgGUID: Nu3quq7JS5GqcTpp7djJcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271657020"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.216])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:43:50 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business
 Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Resent-To: intel-gfx@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Fri, 18 Sep 2026 13:43:48 +0300
Resent-Message-ID: <31d7334ed0618052ebad4b8a8b61a1407abc7520@intel.com>
Received: from fmviesa009.fm.intel.com (fmviesa009.fm.intel.com
 [10.60.135.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9F75120B5708
 for <jani.nikula@linux.intel.com>; Thu, 17 Sep 2026 21:23:42 -0700 (PDT)
X-CSE-ConnectionGUID: k7CuDmaMRR+vW1Wum+b+/Q==
X-CSE-MsgGUID: /YelUtbMSvWuYh+ZaA/VWA==
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="267941748"
Received: from fmvoesa101.fm.intel.com ([10.64.2.11])
 by fmviesa009-1.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 21:23:42 -0700
X-CSE-ConnectionGUID: hdqqf7WkRIud8NACvv9Ynw==
X-CSE-MsgGUID: Ls7OU6nfR/2Uw7kuNypZDw==
Authentication-Results: mtab.intel.com; spf=None
 smtp.pra=lalitshankarch@gmail.com; spf=Pass
 smtp.mailfrom=lalitshankarch@gmail.com; spf=None
 smtp.helo=postmaster@mail-pz2-f41.google.com; dkim=pass (signature
 verified) header.i=@gmail.com; dmarc=pass (p=none dis=none) d=gmail.com
IronPort-SDR: 6aacbcce_y8pMtQbb+b/L6agkSkAILwUwwBbAT4cc+GG5cy7cpYkWh1y
 9niGVeKVByQGznXm7PSFhV5WP2FSAyQpyqbX/yA==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A0F6BwAQvKxqfCnkfUpaglkCgj8WgVYzBFSEWJ1tkiQUg?=
 =?us-ascii?q?Ss9Ag8BAQEBAQEBAQEHAQFPAgQBAQMEhH6OCgIeBwEEMAkNAQECAQIBAwIBA?=
 =?us-ascii?q?gEBAQEBAQEBAQEBAQoBAQECAgEBAQIBAQIEAwEBAQECEAEBIhkHDhIphk8NS?=
 =?us-ascii?q?QEBAYk7BwQFAYICAYEkYQIFAzsBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEFAixhJwQLAQ0BGx0BAxIQDwImAiICEQEFASIBEoMCgiMBB?=
 =?us-ascii?q?hABAzcCAQW3CYtyfxYFAhaBAYINBgUDAgHaYAoZKA1yA4FlAQICBwkBCgEBg?=
 =?us-ascii?q?QkuAYR3Kk8OAYI+IAGFAnaEAoEhG4INgRWDaYIfgWdSg0aCagSCInoSlEUIB?=
 =?us-ascii?q?x8SCAEcBgoCSAsKEgMEAwQEAQILEwkDAwIOAggDAggGGQE/EgQTCgMKCwcFH?=
 =?us-ascii?q?woCDBQKKCISAikKAyAKCxIPAxgVAQEHBgICAwEEAgQMAgQFAgIFBAMCCgQDA?=
 =?us-ascii?q?wQBAQgCAi0DAQMZCAkIAgsFERgMCwUCCicDDwEJAx8XCA4IETQIBgMTARoGB?=
 =?us-ascii?q?QYLNxUFDBEBAhsCHwQdEQgDAQ0OAgICAQkDBBYEAhQKIAIDAwYDCgkCBQMbG?=
 =?us-ascii?q?AQBAgIDAgECCAMHCAMNAwQCAwMDBAECAgEBAQIDAQMDBAMBBgIBAwcCAgMDA?=
 =?us-ascii?q?wsBAgMDBQMDBQUCAgUFAwUCAgoCAwMDAgEDAhoIAwYDEgEQAwMGAQMHAwcCB?=
 =?us-ascii?q?AMJAggDAwgIAxcDAwUBAgIEAwMICAQDAwQCAgMKAgUDAgMDBQMDBwIEAgQDA?=
 =?us-ascii?q?wEFAQIHAgMHAgEYAwIECAcHBQILBAIIBA0JBAIEAgIPBAYDAwcBAQIBBwUGA?=
 =?us-ascii?q?wICEAEICgUGAgICHAMdAQMNBgEJBQIBBQ4HBQICGAMGAgMGBQEDAQoLAQEDC?=
 =?us-ascii?q?gECBAIFAwMBAwIDAgYDAwIFBQUDCQcFAwEDAgUJAQMDBgUCAgMCAwECCAQGB?=
 =?us-ascii?q?QMCAgMFAQQDBAMKAwIIAwMIAwwCGgIFAQIDAwYJAwcHAgMHAwIFAgcFAwMFA?=
 =?us-ascii?q?wYBAwIBAwMICxUiAwEFAwMCAQMCBQMDGAICBAUDAwMDAwgEAgIBBwYEAgICA?=
 =?us-ascii?q?QUFBQQFBgIEAwgBAQUDAwoNAQIHDAMMBgMHAwMEBAMCBQoCBAEHDQcJBwMCA?=
 =?us-ascii?q?wgBAQsEAQMDCgMDBQIBAQcFAwYDBwIDAwMFBAUDAgsDBwICAwMDAikBAQEDA?=
 =?us-ascii?q?wMDAwQDAQMBAwMHAwUDAhAIAQoDAgYDBwYDBQMDAgECAwMFEQMGBAUGGQIGE?=
 =?us-ascii?q?ToBCAIDAwEUBAQFAgUVAggBAwMFAwMDAwIFAwEFAQEDAwUDAwMDAwMEAQMEA?=
 =?us-ascii?q?gMHBggBAQECCAMDAgUDAwMEAwMCAQ0EAgUDBgICBAIEAQcDAQICAQMDAwMBA?=
 =?us-ascii?q?gQEAgcEBQIPAwQCAwMFAgMCAwsGAg0JCAcMATwMBwooBDYBBg8UBQQlGAFnB?=
 =?us-ascii?q?wePSh+CW3sUgyWWFI0hjWuUJnFpgz+bYIV8GjOEBJNPSJJRAYhakC4jkXCXB?=
 =?us-ascii?q?QIKBwcRJBKBMjqBXDMaI4EBgjZQAxkPkiSPPQG8W0Q1PQIHAgcOAwuFTQEZg?=
 =?us-ascii?q?XqCcoVVgXSBTAEB?=
IronPort-PHdr: A9a23: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
 WKylcjCIgojFsrCG/Tr//sRDhoE
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:2WpXeK4tdtF9R4tTeAPXwObXdLJyesId70hD6qm+c20xTiX+rb
 HVoB17726OtN91YhsdcL+7Sc69qB/nhP1ICOoqTM+ftWvdyQ2VxehZhOOIowEIcxeeygc379
 YFT0ERMqyTMXFKyej/pCe3euxO/DBFysyVbCXlokuFNTsaEp2IJj0WNjqm
X-Talos-CUID: 9a23:GheJy27UUtEmWhXWSdss9EINA856TX7n7Wrcc2mRInh3GYyTVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AsY+PfgxP2Q4vc3kQIFe1sKI52heaqIC1V2cwz5M?=
 =?us-ascii?q?IgY7eCDMvOCq7nSyFbpByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115720000"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="115720000"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-pz2-f41.google.com ([74.125.228.41])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026
 21:23:42 -0700
Received: by mail-pz2-f41.google.com with SMTP id
 d2e1a72fcca58-86868f7707dso156786b3a.2
 for <jani.nikula@linux.intel.com>; Thu, 17 Sep 2026 21:23:41 -0700
 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789705421; x=1790310221;
 darn=linux.intel.com;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9BEYrdPncK5+8wcIBCPJhFb06NPsWm4ypvW09xMw3CI=;
 b=J4ljq4upEARFl9kING12jz89XgMNRrEdfYAxoOWfnhrH4yPIVQt4drPVeGRqtUjiJz
 LyR0urcoPcN3jJAA1td+z7kuqBaE8i5Izb/+OyHnf0ti3M4uAv2oo0fZM7uU01OEJt2x
 ugShpJ/ilfKP67Z11N5fZMEAR00esCXfVVuIGXxdnN1jfuPo7s0SR36ajlbsCSijU5iI
 I+NLE5+J7u4JmXRghXxV+H9zBeyQfKOGgskbnmXSynzVTM0Ngoj7zpcXc0J7Pk8H3N48
 jI+fm5nNarQP8PFnHq5YNWUZtFrNGdK24cT7EHQp64RJqYEdBGnbuIdJanVH1TfOMxhP
 Mbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789705421; x=1790310221;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9BEYrdPncK5+8wcIBCPJhFb06NPsWm4ypvW09xMw3CI=;
 b=V+7gk8oRgqLDwKNzyjb5cBc0HBL2vCHRfpEQmzBOdoF909QJSb3TLnvxmrnaPGbM+7
 ts5De6RObL8tBWGY9O9ywxnAoi70ch6GhFI/2VlmA9P1EW3gvcl43F6Sv9ZNQEQWGQpz
 FF0dbV6PymFfrJrIuiEbPLwfGwhuJPlgsjRvpkUFOp0s0SDymdCRm0UhtEv/U49ntMTH
 VIwzu01b+CSBcKRy/HDWlKU/kDJXtj0iJOWNZ9KBX9fTCFBUV9sdVcmpfydwpWsKxycc
 QdfFfPWHrVkf7LQnxWHGsQ1OUZzvLwaJ2o4+uhMTPH6niVCqpyI3m7U9oNyiNMd/X5bz
 55yQ==
X-Gm-Message-State: AFuF++nxMwUJpFhIjLl8d0wntU29d689kcW/RYZ8oR2veoJAE7RCyl+2
 5GTxfB/fvFKwZG3iMqZDBLbuMycRf5+qJvPOHlqywqmw3Y3B+J6F5MOwGFNl0MmQ
X-Gm-Gg: AYBFou1zGoZYam8VWF4qswQ4oBjc3TBhIxFhnhyiwC5WIR3enqc71pUt4xk+a4S5LXK
 oyLOCuG1oOUsC8bAZGmV3bTknL5U+saZwKLL66qgvvHIIscAm6MzVgoP/Y1u+FZEgWsgnaHU3fv
 uDC+Hr5d+qkOaiHXshS/9+ygKJHCeAXcJb9x0/64TtiTx+WpHwKBypflyegPS8IeZvCYaQyriJ1
 TSXk3yDCYkUuFktvT2pel74egMvGytVwd5dio1c4fhwjJ+u4bkzkcUnTs/IuSPDSYMvD6hIONUF
 E7AXodqfhB7nTdjsLNs1GtujN/L4hz6kcBLzka78PDQx8bqz1c8f4L950NGDWB+ceOEVtNMfnwr
 bU3onuseLWnp+jfShit3qryP9wfuD4d99Yl2t6tDq0ua8yBNLDnyI9T0/NFoRoYHSLxq2C7ICbg
 LEj2pPhzwDi01UMUaeMRFWj2vN8WCoD/AWPRhHA7gSJRP0Ca5waIm7nZYKhEhh7hzkHVae7+IG
X-Received: by 2002:a05:6a20:6a20:b0:3d2:2afa:d7d with SMTP id
 adf61e73a8af0-3dd8c52d98emr2724989637.18.1789705420877;
 Thu, 17 Sep 2026 21:23:40 -0700 (PDT)
Received: from G15-5520 ([103.246.195.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-144cdfc3df2sm2305851c88.5.2026.09.17.21.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 21:23:40 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>,
 intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND
 I915 DRIVERS),
 intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] drm/i915: use string choice helpers
Date: Fri, 18 Sep 2026 04:23:18 +0000
Message-ID: <20260918042325.17700-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Z9AsWm/owMk/
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

Prefer the str_high_low() and str_read_write() helper functions
over ternary operators with hardcoded strings.

No functional changes.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 5 +++--
 drivers/gpu/drm/i915/gvt/aperture_gm.c       | 4 +++-
 drivers/gpu/drm/i915/vlv_iosf_sb.c           | 6 ++++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index dbebd7210848..b83f0afaa9b5 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -5,6 +5,7 @@
 
 #include <linux/log2.h>
 #include <linux/math64.h>
+#include <linux/string_choices.h>
 
 #include <drm/drm_print.h>
 
@@ -189,7 +190,7 @@ int intel_cx0_wait_for_ack(struct intel_encoder *encoder,
 		drm_dbg_kms(display->drm,
 			    "PHY %c Error occurred during %s command. Status: 0x%x\n",
 			    phy_name(phy),
-			    command == XELPDP_PORT_P2M_COMMAND_READ_ACK ? "read" : "write", *val);
+			    str_read_write(command == XELPDP_PORT_P2M_COMMAND_READ_ACK), *val);
 		intel_cx0_bus_reset(encoder, lane);
 		return -EINVAL;
 	}
@@ -198,7 +199,7 @@ int intel_cx0_wait_for_ack(struct intel_encoder *encoder,
 		drm_dbg_kms(display->drm,
 			    "PHY %c Not a %s response. MSGBUS Status: 0x%x.\n",
 			    phy_name(phy),
-			    command == XELPDP_PORT_P2M_COMMAND_READ_ACK ? "read" : "write", *val);
+			    str_read_write(command == XELPDP_PORT_P2M_COMMAND_READ_ACK), *val);
 		intel_cx0_bus_reset(encoder, lane);
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
index 253b41789be9..794fb50e48dd 100644
--- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
+++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
@@ -34,6 +34,8 @@
  *
  */
 
+#include <linux/string_choices.h>
+
 #include <drm/drm_print.h>
 
 #include "gt/intel_ggtt_fencing.h"
@@ -76,7 +78,7 @@ static int alloc_gm(struct intel_vgpu *vgpu, bool high_gm)
 	mutex_unlock(&gt->ggtt->vm.mutex);
 	if (ret)
 		gvt_err("fail to alloc %s gm space from host\n",
-			high_gm ? "high" : "low");
+			str_high_low(high_gm));
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/vlv_iosf_sb.c b/drivers/gpu/drm/i915/vlv_iosf_sb.c
index 1f0332b4ad0d..fede1735bc08 100644
--- a/drivers/gpu/drm/i915/vlv_iosf_sb.c
+++ b/drivers/gpu/drm/i915/vlv_iosf_sb.c
@@ -3,6 +3,8 @@
  * Copyright © 2013-2021 Intel Corporation
  */
 
+#include <linux/string_choices.h>
+
 #include <drm/drm_print.h>
 #include <drm/intel/display_parent_interface.h>
 
@@ -101,7 +103,7 @@ static int vlv_sideband_rw(struct drm_i915_private *i915,
 				    VLV_IOSF_DOORBELL_REQ, IOSF_SB_BUSY, 0,
 				    5)) {
 		drm_dbg(&i915->drm, "IOSF sideband idle wait (%s) timed out\n",
-			is_read ? "read" : "write");
+			str_read_write(is_read));
 		return -EAGAIN;
 	}
 
@@ -125,7 +127,7 @@ static int vlv_sideband_rw(struct drm_i915_private *i915,
 		err = 0;
 	} else {
 		drm_dbg(&i915->drm, "IOSF sideband finish wait (%s) timed out\n",
-			is_read ? "read" : "write");
+			str_read_write(is_read));
 		err = -ETIMEDOUT;
 	}
 
-- 
2.53.0

