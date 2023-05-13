Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5780C77B75
	for <intel-gfx@archiver.kernel.org>; Sat, 13 May 2023 01:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5164F10E04E;
	Sat, 13 May 2023 01:14:43 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E23610E04E;
 Sat, 13 May 2023 01:14:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 666D6AADDD;
 Sat, 13 May 2023 01:14:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Sat, 13 May 2023 01:14:41 -0000
Message-ID: <168394048139.18762.583542243001495972@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230512235824.1399566-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230512235824.1399566-1-alan.previn.teres.alexis@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/selftest/gsc=3A_Ensure_GSC_Proxy_init_completes_be?=
 =?utf-8?q?fore_selftests?=
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

Series: drm/i915/selftest/gsc: Ensure GSC Proxy init completes before selftests
URL   : https://patchwork.freedesktop.org/series/117713/
State : warning

== Summary ==

Error: dim checkpatch failed
b97349ae2b23 drm/i915/selftest/gsc: Ensure GSC Proxy init completes before selftests
-:62: WARNING:LINE_CONTINUATIONS: Avoid unnecessary line continuations
#62: FILE: drivers/gpu/drm/i915/selftests/i915_selftest.c:154:
+static struct __startup_waiter all_startup_waiters[] = { \

total: 0 errors, 1 warnings, 0 checks, 71 lines checked


