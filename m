Return-Path: <SRS0=1kDK=G6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB30C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 17:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8836260187
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 17:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8836260187
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7696E867;
	Wed, 27 Jan 2021 17:21:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id DD6336E865;
 Wed, 27 Jan 2021 17:21:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D6941A363D;
 Wed, 27 Jan 2021 17:21:29 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Wed, 27 Jan 2021 17:21:29 -0000
Message-ID: <161176808985.11911.3478007794356542834@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210127131417.393872-1-matthew.auld@intel.com>
In-Reply-To: <20210127131417.393872-1-matthew.auld@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5Bv5=2C1/8=5D_drm/i915=3A_make_local-?=
 =?utf-8?q?memory_probing_a_GT_operation?=
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
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v5,1/8] drm/i915: make local-memory probing a GT operation
URL   : https://patchwork.freedesktop.org/series/86355/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
5a1abb4304a2 drm/i915: make local-memory probing a GT operation
93136429ec96 drm/i915: setup the LMEM region
fe2045f56b21 drm/i915: reserve stolen for LMEM region
cd1a9b80c3a0 drm/i915: introduce mem->reserved
-:91: WARNING:LINE_SPACING: Missing a blank line after declarations
#91: FILE: drivers/gpu/drm/i915/selftests/intel_memory_region.c:155:
+	u64 allocated, cur_avail;
+	I915_RND_STATE(prng);

total: 0 errors, 1 warnings, 0 checks, 135 lines checked
8173f2b6030d drm/i915/dg1: Reserve first 1MB of local memory
5f5610a977fb drm/i915: allocate context from LMEM
761ab0754313 drm/i915: move engine scratch to LMEM
7874b30f7d44 drm/i915: allocate cmd ring in lmem


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
