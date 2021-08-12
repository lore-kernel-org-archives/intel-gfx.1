Return-Path: <SRS0=LDoR=ND=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3C4C4338F
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Aug 2021 12:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11CC661059
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Aug 2021 12:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11CC661059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED2C6E3EB;
	Thu, 12 Aug 2021 12:44:58 +0000 (UTC)
X-Greylist: delayed 7717 seconds by postgrey-1.36 at gabe;
 Thu, 12 Aug 2021 12:44:56 UTC
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2244D6E092;
 Thu, 12 Aug 2021 12:44:56 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Thu, 12 Aug 2021 14:44:52 +0200
Message-Id: <20210812124452.622233-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210812124452.622233-1-maarten.lankhorst@linux.intel.com>
References: <20210812124452.622233-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 2/2] drm/i915: Add pci ids and uapi for DG1
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

DG1 has support for local memory, which requires the usage of the
lmem placement extension for creating bo's, and memregion queries
to obtain the size. Because of this, those parts of the uapi are
no longer guarded behind FAKE_LMEM.

According to the pull request referenced below, mesa should be mostly
ready for DG1. VK_EXT_memory_budget is not hooked up yet, but we
should definitely just enable the uapi parts by default.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/11584
Cc: Jordan Justen jordan.l.justen@intel.com
Cc: Jason Ekstrand jason@jlekstrand.net
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 3 ---
 drivers/gpu/drm/i915/i915_pci.c            | 1 +
 drivers/gpu/drm/i915/i915_query.c          | 3 ---
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 23fee13a3384..1d341b8c47c0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -347,9 +347,6 @@ static int ext_set_placements(struct i915_user_extension __user *base,
 {
 	struct drm_i915_gem_create_ext_memory_regions ext;
 
-	if (!IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM))
-		return -ENODEV;
-
 	if (copy_from_user(&ext, base, sizeof(ext)))
 		return -EFAULT;
 
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 1bbd09ad5287..93ccdc6bbd03 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1115,6 +1115,7 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_RKL_IDS(&rkl_info),
 	INTEL_ADLS_IDS(&adl_s_info),
 	INTEL_ADLP_IDS(&adl_p_info),
+	INTEL_DG1_IDS(&dg1_info),
 	{0, 0, 0}
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index e49da36c62fb..5e2b909827f4 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -432,9 +432,6 @@ static int query_memregion_info(struct drm_i915_private *i915,
 	u32 total_length;
 	int ret, id, i;
 
-	if (!IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM))
-		return -ENODEV;
-
 	if (query_item->flags != 0)
 		return -EINVAL;
 
-- 
2.32.0

