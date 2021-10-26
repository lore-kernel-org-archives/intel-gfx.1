Return-Path: <SRS0=bGS0=PO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC11EC433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Oct 2021 10:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A78AB60F21
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Oct 2021 10:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A78AB60F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA1289BA3;
	Tue, 26 Oct 2021 10:57:37 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414D789B9A
 for <intel-gfx@lists.freedesktop.org>; Tue, 26 Oct 2021 10:57:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="216787844"
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="216787844"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 03:57:34 -0700
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="724084333"
Received: from linux-z370-aorus-gaming-5.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 03:57:33 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: imre.deak@intel.com, uma.shankar@intel.com, jani.nikula@linux.intel.com,
 animesh.manna@intel.com
Date: Tue, 26 Oct 2021 16:13:42 +0530
Message-Id: <20211026104342.198300-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026104342.198300-1-ankit.k.nautiyal@intel.com>
References: <20211026104342.198300-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 2/2] drm/i915/intel_combo_phy: Print procmon ref
 values
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

Add debug print for Procmon Ref values, to help get the
voltage configurations of combo PHYs.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Suggested-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_combo_phy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_combo_phy.c b/drivers/gpu/drm/i915/display/intel_combo_phy.c
index 634e8d449457..01ff86b3ff91 100644
--- a/drivers/gpu/drm/i915/display/intel_combo_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_combo_phy.c
@@ -112,6 +112,10 @@ static bool icl_verify_procmon_ref_values(struct drm_i915_private *dev_priv,
 
 	procmon = icl_get_procmon_ref_values(dev_priv, phy);
 
+	drm_dbg(&dev_priv->drm,
+		"Combo PHY %c PROCMON values : 0x%x, 0x%x, 0x%x\n",
+		phy_name(phy), procmon->dw1, procmon->dw9, procmon->dw10);
+
 	ret = check_phy_reg(dev_priv, phy, ICL_PORT_COMP_DW1(phy),
 			    (0xff << 16) | 0xff, procmon->dw1);
 	ret &= check_phy_reg(dev_priv, phy, ICL_PORT_COMP_DW9(phy),
-- 
2.25.1

