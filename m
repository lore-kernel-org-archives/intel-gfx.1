Return-Path: <SRS0=J6ZK=G5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBE6C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 10:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DF5721744
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 10:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DF5721744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E69D89DBD;
	Tue, 26 Jan 2021 10:20:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7352289D7F;
 Tue, 26 Jan 2021 10:20:14 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6DCB3A9932;
 Tue, 26 Jan 2021 10:20:14 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 26 Jan 2021 10:20:14 -0000
Message-ID: <161165641444.9811.3762625862799134731@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210126094612.163290-1-matthew.auld@intel.com>
In-Reply-To: <20210126094612.163290-1-matthew.auld@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5B1/7=5D_drm/i915=3A_setup_the_LMEM_r?=
 =?utf-8?q?egion?=
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

Series: series starting with [1/7] drm/i915: setup the LMEM region
URL   : https://patchwork.freedesktop.org/series/86294/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
684488fc1838 drm/i915: setup the LMEM region
-:57: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#57: FILE: drivers/gpu/drm/i915/gt/intel_region_lmem.c:164:
+		drm_dbg(&i915->drm, "Intel graphics LMEM IO start: %pa\n",
+			 &mem->io_start);

total: 0 errors, 0 warnings, 1 checks, 74 lines checked
bebbd470cc5f drm/i915: reserve stolen for LMEM region
47e9cf146fbe drm/i915: introduce mem->reserved
-:75: WARNING:LINE_SPACING: Missing a blank line after declarations
#75: FILE: drivers/gpu/drm/i915/selftests/intel_memory_region.c:167:
+	resource_size_t avail = resource_size(&mem->region);
+	I915_RND_STATE(prng);

total: 0 errors, 1 warnings, 0 checks, 123 lines checked
f8db1a26bbd9 drm/i915/dg1: Reserve first 1MB of local memory
-:48: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#48: FILE: drivers/gpu/drm/i915/gt/intel_region_lmem.c:158:
+{
+

total: 0 errors, 0 warnings, 1 checks, 65 lines checked
41cf705692f0 drm/i915: allocate context from LMEM
85f01e9f4886 drm/i915: move engine scratch to LMEM
bf5fa03c9cc5 drm/i915: allocate cmd ring in lmem


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
