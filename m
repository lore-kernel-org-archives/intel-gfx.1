Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AFFC433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Feb 2022 06:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1866D10E61C;
	Wed, 16 Feb 2022 06:06:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 201AB10E61C;
 Wed, 16 Feb 2022 06:06:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1DB0BA00A0;
 Wed, 16 Feb 2022 06:06:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Wed, 16 Feb 2022 06:06:52 -0000
Message-ID: <164499161209.16091.4514490540035730001@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220215061342.2055952-1-matthew.d.roper@intel.com>
In-Reply-To: <20220215061342.2055952-1-matthew.d.roper@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5Bv2=2C1/2=5D_drm/i915=3A_Define_MCH_?=
 =?utf-8?q?registers_relative_to_MCHBAR=5FMIRROR=5FBASE?=
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

Series: series starting with [v2,1/2] drm/i915: Define MCH registers relative to MCHBAR_MIRROR_BASE
URL   : https://patchwork.freedesktop.org/series/100153/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
94c59797c95e drm/i915: Define MCH registers relative to MCHBAR_MIRROR_BASE
22b72089639b drm/i915: Move MCHBAR registers to their own header
-:20: WARNING:TYPO_SPELLING: 'swtich' may be misspelled - perhaps 'switch'?
#20: 
 - Create separate patch to swtich a few register definitions to be
                            ^^^^^^

-:438: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#438: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 556 lines checked


