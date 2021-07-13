Return-Path: <SRS0=tFHw=MF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19FAC11F69
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Jul 2021 10:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7493E61249
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Jul 2021 10:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7493E61249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A366E06B;
	Tue, 13 Jul 2021 10:47:13 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBCE89CF4;
 Tue, 13 Jul 2021 10:47:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="197325325"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="197325325"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 03:47:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="503054388"
Received: from ewaterla-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.5.95])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 03:47:08 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 13 Jul 2021 11:45:53 +0100
Message-Id: <20210713104554.2381406-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210713104554.2381406-1-matthew.auld@intel.com>
References: <20210713104554.2381406-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 4/5] drm/i915: pull in some more kernel-doc
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Pull in the kernel-doc for drm_i915_gem_object.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 Documentation/gpu/i915.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 204ebdaadb45..77558084e989 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -387,6 +387,13 @@ GEM BO Management Implementation Details
 .. kernel-doc:: drivers/gpu/drm/i915/i915_vma_types.h
    :doc: Virtual Memory Address
 
+GEM Buffer Object
+-----------------
+This section documents our core GEM object, and related bits.
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+   :internal:
+
 Buffer Object Eviction
 ----------------------
 
-- 
2.26.3

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
