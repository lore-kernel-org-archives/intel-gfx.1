Return-Path: <SRS0=1kDK=G6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C618C433E6
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 06:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B235F20724
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 06:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B235F20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EEA6E57E;
	Wed, 27 Jan 2021 06:51:01 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824906E578
 for <intel-gfx@lists.freedesktop.org>; Wed, 27 Jan 2021 06:50:58 +0000 (UTC)
IronPort-SDR: Hjyewyi8VRlKQZ0AxzeNaTWkdgkL96MKsmC7YDQkYOy8bMmOQ6QZ64+tEusxfHezVLyI9hEJ1B
 oZh4WruZT1tA==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="241555741"
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; d="scan'208";a="241555741"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 22:50:58 -0800
IronPort-SDR: Ta9SavtmsMMJ0EAbM0OX0CGGrY9tbO7Zre2Dgg+/8rpGtdIrLvyLcYbmrTKiQ7xVhLatf8XSJG
 NuB6eY1M9v2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; d="scan'208";a="573175104"
Received: from jhli-desk1.jf.intel.com ([10.54.74.156])
 by orsmga005.jf.intel.com with ESMTP; 26 Jan 2021 22:50:58 -0800
From: Juston Li <juston.li@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 26 Jan 2021 22:50:32 -0800
Message-Id: <20210127065034.2501119-2-juston.li@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210127065034.2501119-1-juston.li@intel.com>
References: <20210127065034.2501119-1-juston.li@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 2/4] drm/i915/hdcp: update
 cp_irq_count_cached in intel_dp_hdcp2_read_msg()
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
Cc: seanpaul@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Update cp_irq_count_cached when we handle reading the messages rather
than writing a message to make sure the value is up to date and not
stale from a previously handled CP_IRQ. AKE flow  doesn't always respond
to a read with a write msg.

E.g. currently AKE_Send_Pairing_Info will "timeout" because we received
a CP_IRQ for reading AKE_Send_H_Prime but no write occurred between that
and reading AKE_Send_Pairing_Info so cp_irq_count_cached is stale
causing the wait to return right away rather than waiting for a new
CP_IRQ.

Signed-off-by: Juston Li <juston.li@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 4dba5bb15af5..d1397af97f69 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -442,8 +442,6 @@ static
 int intel_dp_hdcp2_write_msg(struct intel_digital_port *dig_port,
 			     void *buf, size_t size)
 {
-	struct intel_dp *dp = &dig_port->dp;
-	struct intel_hdcp *hdcp = &dp->attached_connector->hdcp;
 	unsigned int offset;
 	u8 *byte = buf;
 	ssize_t ret, bytes_to_write, len;
@@ -459,8 +457,6 @@ int intel_dp_hdcp2_write_msg(struct intel_digital_port *dig_port,
 	bytes_to_write = size - 1;
 	byte++;
 
-	hdcp->cp_irq_count_cached = atomic_read(&hdcp->cp_irq_count);
-
 	while (bytes_to_write) {
 		len = bytes_to_write > DP_AUX_MAX_PAYLOAD_BYTES ?
 				DP_AUX_MAX_PAYLOAD_BYTES : bytes_to_write;
@@ -509,6 +505,8 @@ int intel_dp_hdcp2_read_msg(struct intel_digital_port *dig_port,
 			    u8 msg_id, void *buf, size_t size)
 {
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct intel_dp *dp = &dig_port->dp;
+	struct intel_hdcp *hdcp = &dp->attached_connector->hdcp;
 	unsigned int offset;
 	u8 *byte = buf;
 	ssize_t ret, bytes_to_recv, len;
@@ -523,6 +521,8 @@ int intel_dp_hdcp2_read_msg(struct intel_digital_port *dig_port,
 	if (ret < 0)
 		return ret;
 
+	hdcp->cp_irq_count_cached = atomic_read(&hdcp->cp_irq_count);
+
 	if (msg_id == HDCP_2_2_REP_SEND_RECVID_LIST) {
 		ret = get_receiver_id_list_size(dig_port);
 		if (ret < 0)
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
