Return-Path: <SRS0=bvk2=GS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B67C433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Jan 2021 14:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23DE523884
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Jan 2021 14:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23DE523884
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD52D6E0BE;
	Fri, 15 Jan 2021 14:03:17 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABBF6E0BE
 for <intel-gfx@lists.freedesktop.org>; Fri, 15 Jan 2021 14:03:12 +0000 (UTC)
IronPort-SDR: 3D0qvJGwH129mc6o1pOyzzcyV4weT0KrqaGV9UaPmEWmGKH+B1+dl2Je17+z+IUOCdyhrcT4sr
 cj0jPjKiSa8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="240095246"
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; d="scan'208";a="240095246"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 06:03:12 -0800
IronPort-SDR: HUK8B8V/9XqZTTbzKzNf1mxOcnkIcZM1eL/zddEHvF/KeL1xVTmAS4LGNF6LQPqwRd6xO+JWAe
 2mNmKKEoY8hw==
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; d="scan'208";a="465585490"
Received: from unknown (HELO genxfsim-desktop.iind.intel.com) ([10.223.74.179])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 06:03:10 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 15 Jan 2021 19:18:25 +0530
Message-Id: <20210115134825.29521-3-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115134825.29521-1-anshuman.gupta@intel.com>
References: <20210115134825.29521-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/2] drm/i915/hdcp: Fix error: uninitialized
 symbol 'ret'.
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

Move (num_hdcp_streams > 0) condition to stream_encryption()
code block, where it actually belongs.

Cc: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index f24e2c07bfa6..3cc128787887 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -878,15 +878,15 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
 		}
 		drm_dbg_kms(&dev_priv->drm, "HDCP 1.4 transcoder: %s stream encryption disabled\n",
 			    transcoder_name(hdcp->stream_transcoder));
+		/*
+		 * If there are other connectors on this port using HDCP,
+		 * don't disable it until it disabled HDCP encryption for
+		 * all connectors in MST topology.
+		 */
+		if (dig_port->num_hdcp_streams > 0)
+			return ret;
 	}
 
-	/*
-	 * If there are other connectors on this port using HDCP, don't disable it
-	 * until it disabled HDCP encryption for all connectors in MST topology.
-	 */
-	if (dig_port->num_hdcp_streams > 0)
-		return ret;
-
 	hdcp->hdcp_encrypted = false;
 	intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder, port), 0);
 	if (intel_de_wait_for_clear(dev_priv,
@@ -1947,10 +1947,10 @@ static int _intel_hdcp2_disable(struct intel_connector *connector)
 		}
 		drm_dbg_kms(&i915->drm, "HDCP 2.2 transcoder: %s stream encryption disabled\n",
 			    transcoder_name(hdcp->stream_transcoder));
-	}
 
-	if (dig_port->num_hdcp_streams > 0)
-		return ret;
+		if (dig_port->num_hdcp_streams > 0)
+			return ret;
+	}
 
 	ret = hdcp2_disable_encryption(connector);
 
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
