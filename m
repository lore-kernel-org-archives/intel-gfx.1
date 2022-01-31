Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09723C433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 31 Jan 2022 20:44:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A3410E3A8;
	Mon, 31 Jan 2022 20:44:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 81AB510E3A8;
 Mon, 31 Jan 2022 20:44:02 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7E466A00E8;
 Mon, 31 Jan 2022 20:44:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Robert Beckett" <bob.beckett@collabora.com>
Date: Mon, 31 Jan 2022 20:44:02 -0000
Message-ID: <164366184249.8647.3961189829177053870@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220131185231.725346-1-bob.beckett@collabora.com>
In-Reply-To: <20220131185231.725346-1-bob.beckett@collabora.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_discrete_card_64K_page_support_=28rev4=29?=
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

Series: discrete card 64K page support (rev4)
URL   : https://patchwork.freedesktop.org/series/99119/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
5e8b377b5d22 drm/i915: add needs_compact_pt flag
cd0c6d7c7b7b drm/i915: enforce min GTT alignment for discrete cards
-:298: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#298: FILE: drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:457:
+						if (offset < hole_start + aligned_size)

-:310: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#310: FILE: drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:481:
+						if (offset + aligned_size > hole_end)

-:328: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#328: FILE: drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:497:
+						if (offset < hole_start + aligned_size)

-:340: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#340: FILE: drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:520:
+						if (offset + aligned_size > hole_end)

-:358: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#358: FILE: drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:536:
+						if (offset < hole_start + aligned_size)

-:370: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#370: FILE: drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:560:
+						if (offset + aligned_size > hole_end)

-:388: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#388: FILE: drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:576:
+						if (offset < hole_start + aligned_size)

-:400: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#400: FILE: drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:599:
+						if (offset + aligned_size > hole_end)

total: 0 errors, 8 warnings, 0 checks, 434 lines checked
4605b885e079 drm/i915: support 64K GTT pages for discrete cards
66143948b6a9 drm/i915: add gtt misalignment test
8fa9d39a7902 drm/i915/uapi: document behaviour for DG2 64K support


