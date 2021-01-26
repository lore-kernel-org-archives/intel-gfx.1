Return-Path: <SRS0=J6ZK=G5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC1BC433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 19:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B21F222A83
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 19:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B21F222A83
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CAB6E41B;
	Tue, 26 Jan 2021 19:59:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 05C0B6E41B;
 Tue, 26 Jan 2021 19:59:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E05A7AA916;
 Tue, 26 Jan 2021 19:59:39 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 26 Jan 2021 19:59:39 -0000
Message-ID: <161169117989.9812.8334907364030421600@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210126151259.253885-1-matthew.auld@intel.com>
In-Reply-To: <20210126151259.253885-1-matthew.auld@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5Bv2=2C1/8=5D_drm/i915=3A_make_local-?=
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

Series: series starting with [v2,1/8] drm/i915: make local-memory probing a GT operation
URL   : https://patchwork.freedesktop.org/series/86302/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
4f36bd19aa5a drm/i915: make local-memory probing a GT operation
593235259519 drm/i915: setup the LMEM region
f029688cf4c2 drm/i915: reserve stolen for LMEM region
9ada9ccfa20b drm/i915: introduce mem->reserved
-:75: WARNING:LINE_SPACING: Missing a blank line after declarations
#75: FILE: drivers/gpu/drm/i915/selftests/intel_memory_region.c:167:
+	resource_size_t avail = resource_size(&mem->region);
+	I915_RND_STATE(prng);

total: 0 errors, 1 warnings, 0 checks, 123 lines checked
4c99ba37b47c drm/i915/dg1: Reserve first 1MB of local memory
8129c8335a23 drm/i915: allocate context from LMEM
497696b8f294 drm/i915: move engine scratch to LMEM
950c2dcb8f80 drm/i915: allocate cmd ring in lmem


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
