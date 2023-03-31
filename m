Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909CDC6FD1D
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Mar 2023 01:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0878A10E067;
	Fri, 31 Mar 2023 01:22:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 90F4A10E067;
 Fri, 31 Mar 2023 01:22:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 66E7CAADEC;
 Fri, 31 Mar 2023 01:22:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Date: Fri, 31 Mar 2023 01:22:25 -0000
Message-ID: <168022574538.14987.3071518159784381683@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230331003611.107011-1-fei.yang@intel.com>
In-Reply-To: <20230331003611.107011-1-fei.yang@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5B1/3=5D_drm/i915/mtl=3A_Define_MOCS_?=
 =?utf-8?q?and_PAT_tables_for_MTL?=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/3] drm/i915/mtl: Define MOCS and PAT tables for MTL
URL   : https://patchwork.freedesktop.org/series/115906/
State : warning

== Summary ==

Error: dim checkpatch failed
0ba061e0e1f8 drm/i915/mtl: Define MOCS and PAT tables for MTL
-:156: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#156: FILE: drivers/gpu/drm/i915/gt/intel_ggtt.c:229:
+	GEM_BUG_ON(addr & ~GEN12_GGTT_PTE_ADDR_MASK);

total: 0 errors, 1 warnings, 0 checks, 365 lines checked
943df95249ca drm/i915/mtl: workaround coherency issue for Media
890e4ea3ef7c drm/i915/mtl: end support for set caching ioctl


