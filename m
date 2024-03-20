Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25507CD11BF
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Mar 2024 16:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC1910FD11;
	Wed, 20 Mar 2024 16:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiuLwu5o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD6F10FD11
 for <intel-gfx@lists.freedesktop.org>; Wed, 20 Mar 2024 16:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710950674; x=1742486674;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=sz5xJjQ1I6VRUKTKYjQf1XCgjaZW6tpJq7NRhCj4a6g=;
 b=MiuLwu5o1/X/v1TPXwZ8uLdjMihemJpZhPB5xqZYncgUbrcOToQ0cZfu
 5+PyQm3zOSEGaAOnLed58WdHdYg34ecT0V9bch0K6E9tN/Zuh4yypbWCL
 WY8WV93BOfAalZbN2zOECpJWF3lq33b08DeKdIovrIeGiI3BVAvrSJlno
 htHY+yiFnjVTjUt9y5GapY9toDiuBUEq0KjdY898GdpR9rqsOnXAnC0eT
 RBBE2napHgQtxVvnHz3HySWu+Z9LH7dqV2mMqGuCIeEShJokdEkB63Kux
 XqCp28kmhMkWIuLy4V/UOpOkRGxw76PzSZNiKoglrCZrS53b35eRWbzo5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="8834767"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="8834767"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 09:04:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="827782599"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="827782599"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 20 Mar 2024 09:04:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 20 Mar 2024 18:04:30 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/i915: Reject async flips if we need to change
 DDB/watermarks
Date: Wed, 20 Mar 2024 18:04:20 +0200
Message-ID: <20240320160424.700-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240320160424.700-1-ville.syrjala@linux.intel.com>
References: <20240320160424.700-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

DDB/watermarks are always double buffered on the vblank, so we
can't safely change them during async flips. Currently this never
happens, but we'll be making changing between sync and async
flips a bit more flexible, in which case we can actually end up
here.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index bc341abcab2f..1fa416a70d51 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -2540,6 +2540,12 @@ skl_ddb_add_affected_planes(const struct intel_crtc_state *old_crtc_state,
 					&new_crtc_state->wm.skl.plane_ddb_y[plane_id]))
 			continue;
 
+		if (new_crtc_state->do_async_flip) {
+			drm_dbg_kms(&i915->drm, "[PLANE:%d:%s] Can't change DDB during async flip\n",
+				    plane->base.base.id, plane->base.name);
+			return -EINVAL;
+		}
+
 		plane_state = intel_atomic_get_plane_state(state, plane);
 		if (IS_ERR(plane_state))
 			return PTR_ERR(plane_state);
@@ -2906,6 +2912,12 @@ static int skl_wm_add_affected_planes(struct intel_atomic_state *state,
 						 &new_crtc_state->wm.skl.optimal))
 			continue;
 
+		if (new_crtc_state->do_async_flip) {
+			drm_dbg_kms(&i915->drm, "[PLANE:%d:%s] Can't change watermarks during async flip\n",
+				    plane->base.base.id, plane->base.name);
+			return -EINVAL;
+		}
+
 		plane_state = intel_atomic_get_plane_state(state, plane);
 		if (IS_ERR(plane_state))
 			return PTR_ERR(plane_state);
-- 
2.43.2

