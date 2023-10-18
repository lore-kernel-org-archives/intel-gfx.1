Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F41CDB47E
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Oct 2023 15:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039D910E132;
	Wed, 18 Oct 2023 15:41:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E8610E3F3
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Oct 2023 15:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697643692; x=1729179692;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dqalHBqEuIEStAtosI8WNY/cF9VCf4ZwdptoqQ+gEcA=;
 b=M9HIpJ1Osgn9IAABlvWNMIiVo9SHlDgUuorlJdVPYuPhV4ZzzjG4A77R
 lDXMWdIIDLppJyswcewioUk8Np5mYioXIMZCnYruOA9XeCtqE6J9Z9Y2M
 1OstHvtYsNr+y14IOACO+PirZkfMY7kSrwNBludH1lnILt1qcV6aZUgpe
 t1+tYMPNKG8GnAOUP9dwVG9XRGNH1+n7ysf6ixlRVIQhg7piMspEa/IAQ
 9n5VkVKEQgwWSuvkIMWpfmoVePX3avOQ+E9iBIfmoIqKxUmm19WbHdhTG
 EUJcysa4+BAgCY/Y5QfwTTQZh+3GvLA3F/UzP7ZG4H99AvkqmKPd3Xy3X A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="388902950"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="388902950"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 08:41:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="733219370"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="733219370"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga006.jf.intel.com with SMTP; 18 Oct 2023 08:41:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Oct 2023 18:41:29 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 18 Oct 2023 18:41:21 +0300
Message-ID: <20231018154123.5479-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018154123.5479-1-ville.syrjala@linux.intel.com>
References: <20231018154123.5479-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 2/4] drm/i915/mst: Disable transcoder before
 deleting the payload
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

Bspec tells us that we should disable the transcoder before
deleting the payload. Looks like this has been reversed since
MST support was added.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 7b4628f4f124..57eb581b8a50 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -587,10 +587,6 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
 	struct intel_dp *intel_dp = &dig_port->dp;
 	struct intel_connector *connector =
 		to_intel_connector(old_conn_state->connector);
-	struct drm_dp_mst_topology_state *new_mst_state =
-		drm_atomic_get_new_mst_topology_state(&state->base, &intel_dp->mst_mgr);
-	struct drm_dp_mst_atomic_payload *new_payload =
-		drm_atomic_get_mst_payload_state(new_mst_state, connector->port);
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 
 	drm_dbg_kms(&i915->drm, "active links %d\n",
@@ -598,8 +594,6 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
 
 	intel_hdcp_disable(intel_mst->connector);
 
-	drm_dp_remove_payload_part1(&intel_dp->mst_mgr, new_mst_state, new_payload);
-
 	intel_audio_codec_disable(encoder, old_crtc_state, old_conn_state);
 }
 
@@ -634,6 +628,8 @@ static void intel_mst_post_disable_dp(struct intel_atomic_state *state,
 
 	intel_disable_transcoder(old_crtc_state);
 
+	drm_dp_remove_payload_part1(&intel_dp->mst_mgr, new_mst_state, new_payload);
+
 	clear_act_sent(encoder, old_crtc_state);
 
 	intel_de_rmw(dev_priv, TRANS_DDI_FUNC_CTL(old_crtc_state->cpu_transcoder),
-- 
2.41.0

