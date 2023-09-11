Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14F0EE7FF4
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Sep 2023 13:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE3210E1AB;
	Mon, 11 Sep 2023 13:32:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED44C10E1AB;
 Mon, 11 Sep 2023 13:32:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E93A5A3ECB;
 Mon, 11 Sep 2023 13:32:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Mon, 11 Sep 2023 13:32:29 -0000
Message-ID: <169443914995.31367.10747081940226848056@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230911123305.1682554-1-jani.nikula@intel.com>
In-Reply-To: <20230911123305.1682554-1-jani.nikula@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/gt=3A_rename_DBG=28=29_to_GTT=5FTRACE=28=29?=
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

Series: drm/i915/gt: rename DBG() to GTT_TRACE()
URL   : https://patchwork.freedesktop.org/series/123538/
State : warning

== Summary ==

Error: dim checkpatch failed
025fa566293e drm/i915/gt: rename DBG() to GTT_TRACE()
-:103: WARNING:TRACE_PRINTK: Do not use trace_printk() in production code (this can be ignored if built only with a debug config option)
#103: FILE: drivers/gpu/drm/i915/gt/intel_gtt.h:38:
+#define GTT_TRACE(...) trace_printk(__VA_ARGS__)

total: 0 errors, 1 warnings, 0 checks, 83 lines checked


