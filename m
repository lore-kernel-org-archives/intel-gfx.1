Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DCFC32771
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Sep 2022 21:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A0510E043;
	Thu, 15 Sep 2022 21:02:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B036D10E043;
 Thu, 15 Sep 2022 21:02:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A6664A8830;
 Thu, 15 Sep 2022 21:02:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Thu, 15 Sep 2022 21:02:05 -0000
Message-ID: <166327572564.11974.8074435567926243949@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220915-stolen-v1-0-117c5f295bb2@intel.com>
In-Reply-To: <20220915-stolen-v1-0-117c5f295bb2@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Improvements_to_stolen_memory_setup?=
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

Series: drm/i915: Improvements to stolen memory setup
URL   : https://patchwork.freedesktop.org/series/108620/
State : warning

== Summary ==

Error: dim checkpatch failed
90b79b3a0c3f drm/i915: Move dsm assignment to be after adjustment
060045222786 drm/i915: Add missing mask when reading GEN12_DSMBASE
ff76e07f8ac4 drm/i915: Split i915_gem_init_stolen()
135031554fb2 drm/i915/dgfx: Make failure to setup stolen non-fatal
-:20: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#20: 
	i915 0000:00:02.0: [drm:init_stolen_smem [i915]] Skip stolen region: failed to setup

total: 0 errors, 1 warnings, 0 checks, 113 lines checked


