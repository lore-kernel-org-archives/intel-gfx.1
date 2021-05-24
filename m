Return-Path: <SRS0=+tRi=KT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51B9C04FF3
	for <intel-gfx@archiver.kernel.org>; Mon, 24 May 2021 17:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62449610A8
	for <intel-gfx@archiver.kernel.org>; Mon, 24 May 2021 17:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62449610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F053B6E8DC;
	Mon, 24 May 2021 17:27:12 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92686E8D9
 for <intel-gfx@lists.freedesktop.org>; Mon, 24 May 2021 17:27:10 +0000 (UTC)
IronPort-SDR: 55CjpFXqSVMBtgFFys1VyoZdhyTyopUzrX6R8Yxi/BJfO74iDMxr4e0wukv+Ym7ycdl8XQnDlc
 n33rzXlcvpOg==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="202028984"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="202028984"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 10:27:09 -0700
IronPort-SDR: T8QG+xEwp8NhG4NEMf1PshqaZcX+73yZKWS/Krv0NGMm7DAodo5s4ycSo+ht7hGHYw6Gc0U9kg
 FBqntG39AP5Q==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="475979190"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 10:27:07 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 24 May 2021 20:27:03 +0300
Message-Id: <20210524172703.2113058-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210524172703.2113058-1-imre.deak@intel.com>
References: <20210524172703.2113058-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 3/3] drm/i915/debugfs: Print remap info for DPT
 VMAs as well
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

Similarly to GGTT VMAs, DPT VMAs can be also a remapped or rotated view
of the mapped object, so make sure we debug print the details for these
views as well besides the normal view.

While at it also fix the debug print for the VMA type of DPT VMAs.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 17 ++++++++++++++---
 drivers/gpu/drm/i915/i915_vma.h     |  5 +++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 8dd3746911021..6d5c6ea02fab5 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -124,6 +124,17 @@ stringify_page_sizes(unsigned int page_sizes, char *buf, size_t len)
 	}
 }
 
+static const char *stringify_vma_type(const struct i915_vma *vma)
+{
+	if (i915_vma_is_ggtt(vma))
+	       return "ggtt";
+
+	if (i915_vma_is_dpt(vma))
+		return "dpt";
+
+	return "ppgtt";
+}
+
 void
 i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 {
@@ -156,11 +167,11 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 		if (i915_vma_is_pinned(vma))
 			pin_count++;
 
-		seq_printf(m, " (%sgtt offset: %08llx, size: %08llx, pages: %s",
-			   i915_vma_is_ggtt(vma) ? "g" : "pp",
+		seq_printf(m, " (%s offset: %08llx, size: %08llx, pages: %s",
+			   stringify_vma_type(vma),
 			   vma->node.start, vma->node.size,
 			   stringify_page_sizes(vma->page_sizes.gtt, NULL, 0));
-		if (i915_vma_is_ggtt(vma)) {
+		if (i915_vma_is_ggtt(vma) || i915_vma_is_dpt(vma)) {
 			switch (vma->ggtt_view.type) {
 			case I915_GGTT_VIEW_NORMAL:
 				seq_puts(m, ", normal");
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 2a108e66cd495..dc6926d896266 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -68,6 +68,11 @@ static inline bool i915_vma_is_ggtt(const struct i915_vma *vma)
 	return test_bit(I915_VMA_GGTT_BIT, __i915_vma_flags(vma));
 }
 
+static inline bool i915_vma_is_dpt(const struct i915_vma *vma)
+{
+	return i915_is_dpt(vma->vm);
+}
+
 static inline bool i915_vma_has_ggtt_write(const struct i915_vma *vma)
 {
 	return test_bit(I915_VMA_GGTT_WRITE_BIT, __i915_vma_flags(vma));
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
