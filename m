Return-Path: <SRS0=QgXV=DC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9BEC4727E
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2020 23:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCE6E20838
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2020 23:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCE6E20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=Intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F5B6ED75;
	Fri, 25 Sep 2020 23:26:40 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435246ED76
 for <Intel-GFX@lists.freedesktop.org>; Fri, 25 Sep 2020 23:26:39 +0000 (UTC)
IronPort-SDR: 2RlF4Afd+k91aZJ6wQw437dOKUIBNB57TnJBHFxBk9KRVGbXeeXpf79ErtDNo1DBaTjaA1aU74
 27WBXMG3Nmwg==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="162564373"
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; d="scan'208";a="162564373"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 16:26:38 -0700
IronPort-SDR: tEGGR/pD/eXIhjdSAHZKLGglZy0NiRalAFej8R+A3qC2DpfMwRl3FtVe1hUb/H2VNklMMKAYWJ
 rjzAIEWY2Xnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; d="scan'208";a="337048733"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga004.fm.intel.com with ESMTP; 25 Sep 2020 16:26:37 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Date: Fri, 25 Sep 2020 16:26:37 -0700
Message-Id: <20200925232637.1968039-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200925232637.1968039-1-John.C.Harrison@Intel.com>
References: <20200925232637.1968039-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Subject: [Intel-gfx] [PATCH 4/4] drm/i915/uc: turn on GuC/HuC auto mode by
 default
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

This will enable HuC loading for Gen11+ by default if the binaries
are available on the system. GuC submission still requires explicit
enabling by the user.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/i915/i915_params.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index 330c03e2b4f7..7bdbd8f6ed30 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -58,7 +58,7 @@ struct drm_printer;
 	param(int, disable_power_well, -1, 0400) \
 	param(int, enable_ips, 1, 0600) \
 	param(int, invert_brightness, 0, 0600) \
-	param(int, enable_guc, 0, 0400) \
+	param(int, enable_guc, -1, 0400) \
 	param(int, guc_log_level, -1, 0400) \
 	param(char *, guc_firmware_path, NULL, 0400) \
 	param(char *, huc_firmware_path, NULL, 0400) \
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
