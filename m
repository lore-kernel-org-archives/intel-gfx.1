Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3EFC6FA82
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Sep 2022 17:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D303C10E725;
	Tue, 20 Sep 2022 17:07:26 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DA010E749;
 Tue, 20 Sep 2022 17:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663693640; x=1695229640;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FCuNFnHLugpbQ+7xG0WCG3rWB9vLsHnItVu5jY6pbsk=;
 b=b9T6Yet7q+Sx55p4AGDE1Ij7HoMoMt0BXPF+haZ7UoGlw7YO6K7vSLLG
 Sbc1Y2w5UVmkbGJCfuqiGDiUh+Bs43GRRazyMOTcZN7RpQLf69g8NpvCD
 8Pr2viU73S18BAVJOwWl3oGsDhJqk3FXJmIzkCn83uw9OTDgu+E2jjTT3
 B4upHa/idQKRJ7d3wG2rO/jQWSnsL2pfHvl+64wyh/yj3KGjw4DSkT7GB
 KhamznvYzzJCapWiPqtKdFTxccByKoh5A1yAbEi9gkTgro6b6gOYn8DOT
 JmNW33f7v20QmBBCSLFBD4UThr9RZXq5oJaT7k0Lk9zWij8OLjl/+oYAU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="297352710"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="297352710"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 10:06:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="708067070"
Received: from nirmoyda-desk.igk.intel.com ([10.102.13.19])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 10:06:36 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 20 Sep 2022 19:06:28 +0200
Message-Id: <20220920170628.3391-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915: Do not cleanup obj with NULL
 bo->resource
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
Cc: matthew.auld@intel.com, dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

For delayed BO release i915_ttm_delete_mem_notify()
gets called twice, once with proper bo->resource and
another time with NULL. We shouldn't do anything for
the 2nd time as we already cleanedup the obj once.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/6850
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 0544b0a4a43a..e3fc38dd5db0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -511,7 +511,7 @@ static void i915_ttm_delete_mem_notify(struct ttm_buffer_object *bo)
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 	intel_wakeref_t wakeref = 0;
 
-	if (likely(obj)) {
+	if (bo->resource && likely(obj)) {
 		/* ttm_bo_release() already has dma_resv_lock */
 		if (i915_ttm_cpu_maps_iomem(bo->resource))
 			wakeref = intel_runtime_pm_get(&to_i915(obj->base.dev)->runtime_pm);
-- 
2.37.3

