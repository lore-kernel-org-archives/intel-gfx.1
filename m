Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86FCC28B30
	for <intel-gfx@archiver.kernel.org>; Fri, 14 Mar 2025 04:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912DF10E0D4;
	Fri, 14 Mar 2025 04:05:10 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CCF10E0D4;
 Fri, 14 Mar 2025 04:05:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Trivial_style_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andi Shyti" <andi.shyti@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 14 Mar 2025 04:05:10 -0000
Message-ID: <174192511014.32201.12416804807136300871@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250314021225.11813-1-andi.shyti@linux.intel.com>
In-Reply-To: <20250314021225.11813-1-andi.shyti@linux.intel.com>
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

Series: Trivial style fixes
URL   : https://patchwork.freedesktop.org/series/146278/
State : warning

== Summary ==

Error: dim checkpatch failed
6f2c9455289e drm/i915/gt: Fix typos in comments
-:6: WARNING:TYPO_SPELLING: 'upto' may be misspelled - perhaps 'up to'?
#6: 
upto -> up to
^^^^

-:7: WARNING:TYPO_SPELLING: 'acknowledgement' may be misspelled - perhaps 'acknowledgment'?
#7: 
acknowledgement -> acknowledgment
^^^^^^^^^^^^^^^

total: 0 errors, 2 warnings, 0 checks, 16 lines checked
485bc8f3e0be drm/i915/gt: Fix SPDX license format
d9992d83cb54 drm/i915/gt: Remove trailing blank lines
958dca2127ae drm/i915/gt: Use proper sleeping functions for timeouts shorter than 20ms
-:7: WARNING:TYPO_SPELLING: 'unprecise' may be misspelled - perhaps 'imprecise'?
#7: 
msleep is very unprecise for timeouts shorter than 20
               ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 17 lines checked


