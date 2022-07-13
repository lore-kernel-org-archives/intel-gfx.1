Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF8CC433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Jul 2022 20:09:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7410698DEE;
	Wed, 13 Jul 2022 20:09:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 408BF98DD2;
 Wed, 13 Jul 2022 20:09:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 38B69A9932;
 Wed, 13 Jul 2022 20:09:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Date: Wed, 13 Jul 2022 20:09:33 -0000
Message-ID: <165774297320.740.17567948111595822469@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
In-Reply-To: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Random_assortment_of_=28mostly=29_GuC_related_patches_=28re?=
 =?utf-8?b?djIp?=
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

Series: Random assortment of (mostly) GuC related patches (rev2)
URL   : https://patchwork.freedesktop.org/series/106272/
State : warning

== Summary ==

Error: dim checkpatch failed
dea3dbd81ade drm/i915: Remove bogus GEM_BUG_ON in unpark
909eeb72fb3d drm/i915/guc: Don't call ring_is_idle in GuC submission
53760fb38f4a drm/i915/guc: Fix issues with live_preempt_cancel
f56a0551c6ad drm/i915/guc: Add GuC <-> kernel time stamp translation information
9ec48f9590e4 drm/i915/guc: Record CTB info in error logs
9de35e4d864c drm/i915/guc: Use streaming loads to speed up dumping the guc log
263f1e938c10 drm/i915/guc: Route semaphores to GuC for Gen12+
cf9a04633964 drm/i915/guc: Add selftest for a hung GuC
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:22: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#22: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 170 lines checked
e9a1fdbc7625 drm/i915/selftest: Cope with not having an RCS engine
6bac7cf93b56 drm/i915/guc: Support larger contexts on newer hardware
4d462f42d5f1 drm/i915/guc: Don't abort on CTB_UNUSED status
85fefd30d816 drm/i915/guc: Add a helper for log buffer size


