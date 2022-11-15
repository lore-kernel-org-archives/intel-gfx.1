Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F837C4332F
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Nov 2022 00:25:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480A310E354;
	Tue, 15 Nov 2022 00:25:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6AC3B10E354;
 Tue, 15 Nov 2022 00:25:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6495DA0BA8;
 Tue, 15 Nov 2022 00:25:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
Date: Tue, 15 Nov 2022 00:25:22 -0000
Message-ID: <166847192237.16901.12174883563999195380@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20221114205717.386681-1-anusha.srivatsa@intel.com>
In-Reply-To: <20221114205717.386681-1-anusha.srivatsa@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5B1/3=5D_drm/i915/display=3A_Add_miss?=
 =?utf-8?q?ing_checks_for_cdclk_crawling?=
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

Series: series starting with [1/3] drm/i915/display: Add missing checks for cdclk crawling
URL   : https://patchwork.freedesktop.org/series/110882/
State : warning

== Summary ==

Error: dim checkpatch failed
77c35543c996 drm/i915/display: Add missing checks for cdclk crawling
0ea41d2f3543 drm/i915/display: Do both crawl and squash when changing cdclk
-:62: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#62: FILE: drivers/gpu/drm/i915/display/intel_cdclk.c:1736:
+						    const struct intel_cdclk_config *old_cdclk_config,

-:63: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#63: FILE: drivers/gpu/drm/i915/display/intel_cdclk.c:1737:
+						    const struct intel_cdclk_config *new_cdclk_config,

-:192: ERROR:TRAILING_WHITESPACE: trailing whitespace
#192: FILE: drivers/gpu/drm/i915/display/intel_cdclk.c:1862:
+^I$

total: 1 errors, 2 warnings, 0 checks, 206 lines checked
17dddff83aa5 drm/i915/display: Add CDCLK Support for MTL


