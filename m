Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0225CC47DB3
	for <intel-gfx@archiver.kernel.org>; Wed, 31 Jan 2024 19:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C56610FC97;
	Wed, 31 Jan 2024 19:35:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24E610FC90
 for <intel-gfx@lists.freedesktop.org>; Wed, 31 Jan 2024 19:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706729712; x=1738265712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f95pS4d1AirjMrJlIrrkT7GEYzm5hh4TOzxd0zWMWx4=;
 b=gummqIl2A5uONWtHKTjaibeXbxIhWNhRyYroAyrseFmWADTC3JgeLPZC
 cPpWpqpwc7HCTdAl4a/QMeedp89Ld8CAjZ5/tvhWHOShyPPC0J0MRZ4Jl
 /va2yzweBmlGSR6Rk9RhMFUxpHD4tHHTH4iIbguKyyXfrRJvqxHrvdoVh
 yCBYsZraaIZ9wnUejJG8s/qCBX1lvMZ0c/3kTXYlq4DpEjZQjZZnmwEi6
 tFa8LESNNxkrjSEyps2s/5CV2DT7Z7jR5tn6/AaERyRkXH12LBPa/MTmh
 sYOcGH00PnsEgYJ1KiieaRaoJ2n7kRxblooOh8Scrp6ZmSqvjgHzlETWP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="467936214"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="467936214"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 11:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822686281"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="822686281"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orsmga001.jf.intel.com with ESMTP; 31 Jan 2024 11:34:55 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 08/10] drm/i915/hdcp: Extract hdcp structure from correct
 connector
Date: Thu,  1 Feb 2024 01:02:39 +0530
Message-Id: <20240131193240.938405-9-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131193240.938405-1-suraj.kandpal@intel.com>
References: <20240131193240.938405-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
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

Currently intel_hdcp is not being extracted from primary connector
this patch fixes that.

Fixes: 524240b231ea ("drm/i915/hdcp: Propagate aux info in DP HDCP functions")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 6d28119f33fd..2cd987645776 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -389,7 +389,9 @@ intel_dp_hdcp2_wait_for_msg(struct intel_connector *connector,
 			    const struct hdcp2_dp_msg_data *hdcp2_msg_data)
 {
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
-	struct intel_hdcp *hdcp = &connector->hdcp;
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct intel_dp *dp = &dig_port->dp;
+	struct intel_hdcp *hdcp = &dp->attached_connector->hdcp;
 	u8 msg_id = hdcp2_msg_data->msg_id;
 	int ret, timeout;
 	bool msg_ready = false;
@@ -505,8 +507,9 @@ int intel_dp_hdcp2_read_msg(struct intel_connector *connector,
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	struct intel_hdcp *hdcp = &connector->hdcp;
 	struct drm_dp_aux *aux = &dig_port->dp.aux;
+	struct intel_dp *dp = &dig_port->dp;
+	struct intel_hdcp *hdcp = &dp->attached_connector->hdcp;
 	unsigned int offset;
 	u8 *byte = buf;
 	ssize_t ret, bytes_to_recv, len;
-- 
2.25.1

