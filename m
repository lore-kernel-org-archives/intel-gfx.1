Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B684C001B0
	for <intel-gfx@archiver.kernel.org>; Wed, 19 Jul 2023 13:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B625410E48B;
	Wed, 19 Jul 2023 13:56:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id DE9CE10E48B;
 Wed, 19 Jul 2023 13:56:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DD512AADEC;
 Wed, 19 Jul 2023 13:56:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Date: Wed, 19 Jul 2023 13:56:51 -0000
Message-ID: <168977501190.20709.7976339107968088213@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230718172934.69049-1-imre.deak@intel.com>
In-Reply-To: <20230718172934.69049-1-imre.deak@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5Bv2=2C1/3=5D_drm/i915=3A_Avoid_endle?=
 =?utf-8?q?ss_HPD_poll_detect_loop_via_runtime_suspend/resume_=28rev2=29?=
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

Series: series starting with [v2,1/3] drm/i915: Avoid endless HPD poll detect loop via runtime suspend/resume (rev2)
URL   : https://patchwork.freedesktop.org/series/120931/
State : warning

== Summary ==

Error: dim checkpatch failed
eef2b2d4e3b7 drm/i915: Avoid endless HPD poll detect loop via runtime suspend/resume
-:9: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#9: 
commit a8ddac7c9f06 ("drm/i915: Avoid HPD poll detect triggering a new detect cycle")

-:44: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#44: 
References: https://gitlab.freedesktop.org/drm/intel/-/issues/7940#note_1997403

total: 0 errors, 2 warnings, 0 checks, 82 lines checked
6dc0f8c2b082 drm: Add an HPD poll helper to reschedule the poll work
114a34ff7741 drm/i915: Fix HPD polling, reenabling the output poll work as needed


