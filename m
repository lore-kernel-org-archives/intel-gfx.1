Return-Path: <SRS0=VIuW=HV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C01C433DB
	for <intel-gfx@archiver.kernel.org>; Fri, 19 Feb 2021 07:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FBD064DEC
	for <intel-gfx@archiver.kernel.org>; Fri, 19 Feb 2021 07:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FBD064DEC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B006E8A1;
	Fri, 19 Feb 2021 07:13:12 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2A66E8A1
 for <intel-gfx@lists.freedesktop.org>; Fri, 19 Feb 2021 07:13:11 +0000 (UTC)
IronPort-SDR: 7ko2yHF7TY3O1VCZJb3R+QlP6TPqM46T+fdczM+gZsKlVtHu3EW7wgcMpz3PBHKG3FCOucjrkw
 BALd5P7ZKsSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="163542487"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="163542487"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 23:13:11 -0800
IronPort-SDR: FVUMf48OX9g5A4MNhvH+tImg1c8Xm1EZKBfMFQTan18WQ1CpRwCJJDc06jx5kjTPMIwQAaZ64R
 abIFcR/Gtrug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="581585238"
Received: from crazyhost.itwn.intel.com ([10.5.218.110])
 by orsmga005.jf.intel.com with ESMTP; 18 Feb 2021 23:13:10 -0800
From: Gary C Wang <gary.c.wang@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 19 Feb 2021 15:06:31 +0800
Message-Id: <20210219070631.19853-1-gary.c.wang@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [Intel-gfx] [PATCH] drm/i915: enhance legacy HPD disconnection flow
 for 4K pipe compute in GLK
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

HDMI PHY is not available to use when its HDMI disaply plug-in, and power-off
then power-on as soon as getting a hotplug. In above cases where there's a HDMI
connector physically connected but it can't be used by GLK with 4K pipe then blank
screen (lacking of edid-update & mode-probing) then need return false, since the
rest of the driver should pretty much treat the port as disconnected.

As previous result, handshaking through is required around connect and disconnect.
Otherwise it would be in a inconsistent state as port is disconnected but with a
valid HDMI type.

Also setting it to return HDMI disconnect for any future calls to
intel_digital_port_connected(), this way we don't need to check if port is marked
as safe everytime.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/3092
Test-steps: setup HDMI 4K@60Hz in GLK then to power monitor off then on to get display
recovery correctly

Tested-by: Gary C Wang <gary.c.wang@intel.com>
Reviewed-by: Gordon Sylin <gordon.sylin@intel.com>
Signed-off-by: Gary C Wang <gary.c.wang@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 7f384f259fc8..039cdbfe71a0 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2705,7 +2705,7 @@ intel_hdmi_detect(struct drm_connector *connector, bool force)
 
 	wakeref = intel_display_power_get(dev_priv, POWER_DOMAIN_GMBUS);
 
-	if (INTEL_GEN(dev_priv) >= 11 &&
+	if ((INTEL_GEN(dev_priv) >= 11 || IS_GEMINILAKE(dev_priv)) &&
 	    !intel_digital_port_connected(encoder))
 		goto out;
 
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
