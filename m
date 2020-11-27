Return-Path: <SRS0=emkq=FB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C215C2D0E4
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 14:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F0BB221EB
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 14:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F0BB221EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE896EE07;
	Fri, 27 Nov 2020 14:59:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3FFFE6EE07;
 Fri, 27 Nov 2020 14:59:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 36C3EA47E2;
 Fri, 27 Nov 2020 14:59:52 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Fri, 27 Nov 2020 14:59:52 -0000
Message-ID: <160648919222.26783.11491847203929690508@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201127120718.454037-1-matthew.auld@intel.com>
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLlNQQVJTRTogd2FybmluZyBmb3Ig?=
 =?utf-8?q?DG1_+_LMEM_enabling?=
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

Series: DG1 + LMEM enabling
URL   : https://patchwork.freedesktop.org/series/84344/
State : warning

== Summary ==

$ dim sparse --fast origin/drm-tip
Sparse version: v0.6.2
Fast mode used, each commit won't be checked separately.
+drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1237:15:    expected void *vaddr
+drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1237:15:    got void [noderef] __iomem *
+drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1237:15: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/i915/gem/i915_gem_object.c:496:21:    expected void *vaddr
+drivers/gpu/drm/i915/gem/i915_gem_object.c:496:21:    got void [noderef] __iomem *
+drivers/gpu/drm/i915/gem/i915_gem_object.c:496:21: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/i915/gem/i915_gem_object.c:503:30:    expected void [noderef] __iomem *vaddr
+drivers/gpu/drm/i915/gem/i915_gem_object.c:503:30:    got void *vaddr
+drivers/gpu/drm/i915/gem/i915_gem_object.c:503:30: warning: incorrect type in argument 1 (different address spaces)
+drivers/gpu/drm/i915/gem/i915_gem_region.c:299:34:    expected unsigned long long [usertype] *s
+drivers/gpu/drm/i915/gem/i915_gem_region.c:299:34:    got void [noderef] __iomem *[assigned] vaddr
+drivers/gpu/drm/i915/gem/i915_gem_region.c:299:34: warning: incorrect type in argument 1 (different address spaces)
+drivers/gpu/drm/i915/gt/gen8_engine_cs.c:109:5: warning: symbol 'gen11_emit_flush_render' was not declared. Should it be static?
+drivers/gpu/drm/i915/gt/gen8_engine_cs.c:11:5: warning: symbol 'gen8_emit_flush_render' was not declared. Should it be static?
+drivers/gpu/drm/i915/gt/gen8_engine_cs.c:201:5: warning: symbol 'gen12_emit_flush_render' was not declared. Should it be static?
+drivers/gpu/drm/i915/gt/gen8_engine_cs.c:271:5: warning: symbol 'gen12_emit_flush' was not declared. Should it be static?
+drivers/gpu/drm/i915/gt/gen8_engine_cs.c:332:5: warning: symbol 'gen8_emit_bb_start_noarb' was not declared. Should it be static?
+drivers/gpu/drm/i915/gt/gen8_engine_cs.c:368:5: warning: symbol 'gen8_emit_bb_start' was not declared. Should it be static?
+drivers/gpu/drm/i915/gt/gen8_engine_cs.c:77:5: warning: symbol 'gen8_emit_flush' was not declared. Should it be static?
+drivers/gpu/drm/i915/gt/intel_ring_submission.c:1229:24: warning: Using plain integer as NULL pointer
+drivers/gpu/drm/i915/gt/selftest_reset.c:99:34:    expected unsigned int [usertype] *s
+drivers/gpu/drm/i915/gt/selftest_reset.c:99:34:    got void [noderef] __iomem *[assigned] s
+drivers/gpu/drm/i915/gt/selftest_reset.c:99:34: warning: incorrect type in argument 1 (different address spaces)
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:616:35:    expected void const *from
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:616:35:    got void [noderef] __iomem *
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:616:35: warning: incorrect type in argument 2 (different address spaces)
+drivers/gpu/drm/i915/intel_wakeref.c:137:19: warning: context imbalance in 'wakeref_auto_timeout' - unexpected unlock
+drivers/gpu/drm/i915/selftests/i915_syncmap.c:80:54: warning: dubious: x | !y
+drivers/gpu/drm/i915/selftests/intel_memory_region.c:689:23:    expected void [noderef] __iomem *vaddr
+drivers/gpu/drm/i915/selftests/intel_memory_region.c:689:23:    got void *
+drivers/gpu/drm/i915/selftests/intel_memory_region.c:689:23: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/i915/selftests/intel_memory_region.c:698:40:    expected unsigned int [usertype] *s
+drivers/gpu/drm/i915/selftests/intel_memory_region.c:698:40:    got void [noderef] __iomem *
+drivers/gpu/drm/i915/selftests/intel_memory_region.c:698:40: warning: incorrect type in argument 1 (different address spaces)
+./include/linux/seqlock.h:838:24: warning: trying to copy expression type 31
+./include/linux/seqlock.h:838:24: warning: trying to copy expression type 31
+./include/linux/seqlock.h:864:16: warning: trying to copy expression type 31
-O:drivers/gpu/drm/i915/gt/selftest_reset.c:98:34:    expected unsigned int [usertype] *s
-O:drivers/gpu/drm/i915/gt/selftest_reset.c:98:34:    got void [noderef] __iomem *[assigned] s
-O:drivers/gpu/drm/i915/gt/selftest_reset.c:98:34: warning: incorrect type in argument 1 (different address spaces)


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
