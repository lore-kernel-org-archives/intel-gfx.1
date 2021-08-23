Return-Path: <SRS0=iWgT=NO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA762C4338F
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Aug 2021 11:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8150B6124B
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Aug 2021 11:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8150B6124B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B43889C09;
	Mon, 23 Aug 2021 11:37:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7FB1E89C07;
 Mon, 23 Aug 2021 11:37:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7719DAA916;
 Mon, 23 Aug 2021 11:37:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 23 Aug 2021 11:37:22 -0000
Message-ID: <162971864245.1908.12095150980936638028@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210823112859.103561-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210823112859.103561-1-tvrtko.ursulin@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Per_client_GPU_stats_=28rev3=29?=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: Per client GPU stats (rev3)
URL   : https://patchwork.freedesktop.org/series/92574/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
49a66f85df5f drm/i915: Explicitly track DRM clients
-:88: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#88: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 231 lines checked
7d9a4a3e14a9 drm/i915: Make GEM contexts track DRM clients
dacba354d7fa drm/i915: Track runtime spent in closed and unreachable GEM contexts
0d712486d694 drm/i915: Track all user contexts per client
8c26c910fb9e drm/i915: Track context current active time
-:139: WARNING:LINE_SPACING: Missing a blank line after declarations
#139: FILE: drivers/gpu/drm/i915/gt/intel_context_types.h:142:
+			u32 last;
+			I915_SELFTEST_DECLARE(u32 num_underflow);

total: 0 errors, 1 warnings, 0 checks, 296 lines checked
34192e190c21 drm: Document fdinfo format specification
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

-:44: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#44: FILE: Documentation/gpu/drm-usage-stats.rst:1:
+.. _drm-client-usage-stats:

total: 0 errors, 2 warnings, 0 checks, 104 lines checked
f2e468ae7d93 drm/i915: Expose client engine utilisation via fdinfo
-:10: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 874442541133 ("drm/amdgpu: Add show_fdinfo() interface")'
#10: 
874442541133 ("drm/amdgpu: Add show_fdinfo() interface"), using the

total: 1 errors, 0 warnings, 0 checks, 140 lines checked
7da55165a74d drm/amdgpu: Convert to common fdinfo format
-:111: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#111: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c:89:
+	seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\npasid:\t%u\n", domain, bus,
 			dev, fn, fpriv->vm.pasid);

-:115: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#115: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c:90:
+	seq_printf(m, "drm-memory-vram:\t%llu KiB\n", vram_mem/1024UL);
 	                                                      ^

-:116: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#116: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c:91:
+	seq_printf(m, "drm-memory-gtt:\t%llu KiB\n", gtt_mem/1024UL);
 	                                                    ^

-:117: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#117: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c:92:
+	seq_printf(m, "drm-memory-cpu:\t%llu KiB\n", cpu_mem/1024UL);
 	                                                    ^

-:127: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#127: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c:109:
+			seq_printf(m, "drm-engine-%s%d:\t%d.%d %%\n",
 					amdgpu_ip_name[i],

total: 0 errors, 0 warnings, 5 checks, 89 lines checked


