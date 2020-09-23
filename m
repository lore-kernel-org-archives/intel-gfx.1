Return-Path: <SRS0=ky/+=DA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12087C4727F
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2020 13:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAA8B221EB
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2020 13:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAA8B221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DBD6E0D0;
	Wed, 23 Sep 2020 13:35:38 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6456E0D0
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2020 13:35:35 +0000 (UTC)
IronPort-SDR: VcqMz/mz+AEuOn4DOvduvMyZDPamXfc/DwoqQMcf3psPo4Sl8OPQ15zlpwYlBZLOfH17RvbSoh
 irCWG6Bj2gtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="148628201"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="148628201"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 06:35:35 -0700
IronPort-SDR: NP9nFthtLSPq6EYqs9z4ZQ3LBUj5/Fcw5iWj6EUJORSEfg2mmTb3rOYZfKISX/1hiDv2SeuwNf
 ka5NMC8p05MA==
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="454916551"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 06:35:33 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 23 Sep 2020 18:54:35 +0530
Message-Id: <20200923132435.17039-3-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200923132435.17039-1-anshuman.gupta@intel.com>
References: <20200923132435.17039-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v4 2/2] drm/i915: dont retry stream management
 at seq_num_m roll over
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

From: Ramalingam C <ramalingam.c@intel.com>

When roll over detected for seq_num_m, we shouldn't continue with stream
management with rolled over value.

So we are terminating the stream management retry, on roll over of the
seq_num_m.

v2:
  using drm_dbg_kms instead of DRM_DEBUG_KMS [Anshuman]
v3:
  dev_priv is used as i915 [JaniN]
v4:
  roll over is detected at the start of the stream management.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com> [v3]
Tested-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index d750bb57f252..b2a4bbcfdcd2 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -1448,7 +1448,6 @@ static
 int _hdcp2_propagate_stream_management_info(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	union {
 		struct hdcp2_rep_stream_manage stream_manage;
@@ -1457,6 +1456,9 @@ int _hdcp2_propagate_stream_management_info(struct intel_connector *connector)
 	const struct intel_hdcp_shim *shim = hdcp->shim;
 	int ret;
 
+	if (connector->hdcp.seq_num_m > HDCP_2_2_SEQ_NUM_MAX)
+		return -ERANGE;
+
 	/* Prepare RepeaterAuth_Stream_Manage msg */
 	msgs.stream_manage.msg_id = HDCP_2_2_REP_STREAM_MANAGE;
 	drm_hdcp_cpu_to_be24(msgs.stream_manage.seq_num_m, hdcp->seq_num_m);
@@ -1485,10 +1487,6 @@ int _hdcp2_propagate_stream_management_info(struct intel_connector *connector)
 
 out:
 	hdcp->seq_num_m++;
-	if (hdcp->seq_num_m > HDCP_2_2_SEQ_NUM_MAX) {
-		drm_dbg_kms(&i915->drm, "seq_num_m roll over.\n");
-		return -ERANGE;
-	}
 
 	return ret;
 }
@@ -1699,6 +1697,13 @@ hdcp2_propagate_stream_management_info(struct intel_connector *connector)
 		if (!ret)
 			break;
 
+		/* Lets restart the auth incase of seq_num_m roll over */
+		if (connector->hdcp.seq_num_m > HDCP_2_2_SEQ_NUM_MAX) {
+			drm_dbg_kms(&i915->drm,
+				    "seq_num_m roll over.(%d)\n", ret);
+			break;
+		}
+
 		drm_dbg_kms(&i915->drm,
 			    "HDCP2 stream management %d of %d Failed.(%d)\n",
 			    i + 1, tries, ret);
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
