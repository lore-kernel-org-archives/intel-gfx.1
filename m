Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953D8C433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Feb 2022 22:13:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5FA10EAF8;
	Fri, 25 Feb 2022 22:13:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 68BB710EAEE;
 Fri, 25 Feb 2022 22:13:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 65875A0003;
 Fri, 25 Feb 2022 22:13:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Fri, 25 Feb 2022 22:13:51 -0000
Message-ID: <164582723141.6270.17747495990508296534@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220225145502.331818-1-matthew.auld@intel.com>
In-Reply-To: <20220225145502.331818-1-matthew.auld@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5BCI=2C1/7=5D_drm/i915=3A_add_io=5Fsi?=
 =?utf-8?q?ze_plumbing?=
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

Series: series starting with [CI,1/7] drm/i915: add io_size plumbing
URL   : https://patchwork.freedesktop.org/series/100746/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
b11f6dc03213 drm/i915: add io_size plumbing
-:139: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#139: FILE: drivers/gpu/drm/i915/gt/intel_region_lmem.c:152:
+	drm_info(&i915->drm, "Local memory IO size: %pa\n",
+		&mem->io_size);

total: 0 errors, 0 warnings, 1 checks, 184 lines checked
d0a116799acc drm/i915/ttm: require mappable by default
e600e61873d8 drm/i915: add I915_BO_ALLOC_GPU_ONLY
f71925989804 drm/i915/buddy: track available visible size
a357298028da drm/i915/buddy: adjust res->start
1b5e9cea7c6a drm/i915/buddy: tweak 2big check
30b942cc1cf8 drm/i915/selftests: mock test io_size
-:63: WARNING:LINE_SPACING: Missing a blank line after declarations
#63: FILE: drivers/gpu/drm/i915/selftests/intel_memory_region.c:548:
+	u64 size;
+	I915_RND_STATE(prng);

total: 0 errors, 1 warnings, 0 checks, 161 lines checked


