Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6462C3271E
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Jul 2024 05:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C1610E948;
	Thu, 11 Jul 2024 05:59:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B6010E948;
 Thu, 11 Jul 2024 05:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/gt=3A_Do_no?=
 =?utf-8?q?t_consider_preemption_during_execlists=5Fdequeue_for_gen8_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 11 Jul 2024 05:59:43 -0000
Message-ID: <172067758368.124492.1391168419109569970@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240711051215.1143127-1-nitin.r.gote@intel.com>
In-Reply-To: <20240711051215.1143127-1-nitin.r.gote@intel.com>
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

Series: drm/i915/gt: Do not consider preemption during execlists_dequeue for gen8 (rev2)
URL   : https://patchwork.freedesktop.org/series/135901/
State : warning

== Summary ==

Error: dim checkpatch failed
55e56364a5b9 drm/i915/gt: Do not consider preemption during execlists_dequeue for gen8
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries for gen8").

-:11: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries for gen8")'
#11: 
bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries for gen8").

total: 1 errors, 1 warnings, 0 checks, 34 lines checked


