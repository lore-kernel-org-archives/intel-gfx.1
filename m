Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55036C678D5
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Mar 2023 15:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C8410E4E0;
	Tue,  7 Mar 2023 15:01:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7D57410E4E0;
 Tue,  7 Mar 2023 15:01:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 64BAFA0078;
 Tue,  7 Mar 2023 15:01:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Das, Nirmoy" <nirmoy.das@intel.com>
Date: Tue, 07 Mar 2023 15:01:29 -0000
Message-ID: <167820128940.31452.13878753397464605624@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230307144652.17595-1-nirmoy.das@intel.com>
In-Reply-To: <20230307144652.17595-1-nirmoy.das@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5BRFC=2C1/2=5D_drm/i915=3A_Add_a_func?=
 =?utf-8?q?tion_to_mmap_framebuffer_obj?=
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

Series: series starting with [RFC,1/2] drm/i915: Add a function to mmap framebuffer obj
URL   : https://patchwork.freedesktop.org/series/114775/
State : warning

== Summary ==

Error: dim checkpatch failed
d0b102d9dd12 drm/i915: Add a function to mmap framebuffer obj
-:120: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#120: FILE: drivers/gpu/drm/i915/gem/i915_gem_mman.c:1040:
+			GEM_BUG_ON(obj && obj->ops->mmap_ops);

-:126: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#126: FILE: drivers/gpu/drm/i915/gem/i915_gem_mman.c:1046:
+			GEM_BUG_ON(obj && !obj->ops->mmap_ops);

total: 0 errors, 2 warnings, 0 checks, 148 lines checked
36875aac2dd5 drm/i915/display: Implement fb_mmap callback function


