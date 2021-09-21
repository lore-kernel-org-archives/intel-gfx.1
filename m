Return-Path: <SRS0=FeUR=OL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD24C433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 00:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA849611ED
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 00:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA849611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609616E8BE;
	Tue, 21 Sep 2021 00:23:22 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D426C6E8BE
 for <intel-gfx@lists.freedesktop.org>; Tue, 21 Sep 2021 00:23:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="308811929"
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="308811929"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 17:23:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="549183681"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 17:23:19 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Tue, 21 Sep 2021 03:23:02 +0300
Message-Id: <20210921002313.1132357-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210921002313.1132357-1-imre.deak@intel.com>
References: <20210921002313.1132357-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 02/13] drm/i915/adlp/tc: Fix PHY connected check
 for Thunderbolt mode
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

On ADL-P the PHY ready (aka status complete on other platforms) flag is
always set, besides when a DP-alt, legacy sink is connected also when a
TBT sink is connected or nothing is connected. So assume the PHY to be
connected when both the TBT live status and PHY ready flags are set.

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_tc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index 3ffece568ed98..7dc3696085c71 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -509,6 +509,10 @@ static bool icl_tc_phy_is_connected(struct intel_digital_port *dig_port)
 		return dig_port->tc_mode == TC_PORT_TBT_ALT;
 	}
 
+	/* On ADL-P the PHY complete flag is set in TBT mode as well. */
+	if (IS_ALDERLAKE_P(i915) && dig_port->tc_mode == TC_PORT_TBT_ALT)
+		return true;
+
 	if (!tc_phy_is_owned(dig_port)) {
 		drm_dbg_kms(&i915->drm, "Port %s: PHY not owned\n",
 			    dig_port->tc_port_name);
-- 
2.27.0

