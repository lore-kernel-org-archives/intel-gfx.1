Return-Path: <SRS0=K2GL=NJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E93C4338F
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Aug 2021 00:37:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECF2B60FA0
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Aug 2021 00:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECF2B60FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7904A6E247;
	Wed, 18 Aug 2021 00:37:33 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D1D6E2B4
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Aug 2021 00:37:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="279966459"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="279966459"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 17:37:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="676844436"
Received: from josouza-mobl2.jf.intel.com (HELO josouza-mobl2.intel.com)
 ([10.24.14.59])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 17:37:31 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@intel.com>, Rob Clark <robdclark@gmail.com>,
 Deepak Rawat <drawat@vmware.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Tue, 17 Aug 2021 17:42:09 -0700
Message-Id: <20210818004216.220279-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210818004216.220279-1-jose.souza@intel.com>
References: <20210818004216.220279-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 1/8] drm/damage_helper: Fix handling of cursor
 dirty buffers
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

Cursors don't have a framebuffer so the fb comparisson was always
failing and atomic state was being committed without any plane state.

So here checking if objects match when checking cursors.

Fixes: b9fc5e01d1ce ("drm: Add helper to implement legacy dirtyfb")
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Deepak Rawat <drawat@vmware.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/drm_damage_helper.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index 8eeff0c7bdd47..595187d97c131 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -157,12 +157,18 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
 retry:
 	drm_for_each_plane(plane, fb->dev) {
 		struct drm_plane_state *plane_state;
+		bool match;
 
 		ret = drm_modeset_lock(&plane->mutex, state->acquire_ctx);
 		if (ret)
 			goto out;
 
-		if (plane->state->fb != fb) {
+		match = plane->state->fb == fb;
+		/* Check if objs match to handle dirty buffers of cursors */
+		if (plane->type == DRM_PLANE_TYPE_CURSOR && plane->state->fb)
+			match |= fb->obj[0] == plane->state->fb->obj[0];
+
+		if (!match) {
 			drm_modeset_unlock(&plane->mutex);
 			continue;
 		}
-- 
2.32.0

