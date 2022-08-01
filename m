Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A861C00144
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Aug 2022 18:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512DF8F79F;
	Mon,  1 Aug 2022 18:10:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 446758F211;
 Mon,  1 Aug 2022 18:10:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2F1F1AA0EB;
 Mon,  1 Aug 2022 18:10:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Mon, 01 Aug 2022 18:10:06 -0000
Message-ID: <165937740616.14744.16927497064905082177@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220729105625.28269-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20220729105625.28269-1-janusz.krzysztofik@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5BRESUBMIT=2C1/2=5D_drm/i915/gem=3A_A?=
 =?utf-8?q?void_taking_runtime-pm_under_the_shrinker?=
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

Series: series starting with [RESUBMIT,1/2] drm/i915/gem: Avoid taking runtime-pm under the shrinker
URL   : https://patchwork.freedesktop.org/series/106838/
State : warning

== Summary ==

Error: dim checkpatch failed
0551a3d7d91f drm/i915/gem: Avoid taking runtime-pm under the shrinker
-:24: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#24: 
<4> [437.542183] ffffffff827a7608 (acpi_wakeup_lock){+.+.}-{3:3}, at: acpi_device_wakeup_disable+0x12/0x50

total: 0 errors, 1 warnings, 0 checks, 27 lines checked
93e4cbef93c8 drm/i915/gem: Perform active shrinking from a background thread


