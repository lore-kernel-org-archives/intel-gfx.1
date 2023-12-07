Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3021C4167B
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Dec 2023 22:57:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE86710E226;
	Thu,  7 Dec 2023 22:57:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C94C10E226;
 Thu,  7 Dec 2023 22:57:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 04BFBAADED;
 Thu,  7 Dec 2023 22:57:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcgZm9yIHNlcmllcyBzdGFydGlu?=
 =?utf-8?b?ZyB3aXRoIFsxLzNdIGRybTogQWRkIGRybV92Ymxhbmtfd29ya19mbHVzaF9hbGwo?=
 =?utf-8?b?KS4gKHJldjIp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Thu, 07 Dec 2023 22:57:45 -0000
Message-ID: <170198986599.28719.17637517260645878929@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231127160034.215372-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231127160034.215372-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [1/3] drm: Add drm_vblank_work_flush_all(). (rev2)
URL   : https://patchwork.freedesktop.org/series/126934/
State : warning

== Summary ==

Error: dim checkpatch failed
84e07173e672 drm: Add drm_vblank_work_flush_all().
-:33: WARNING:WAITQUEUE_ACTIVE: waitqueue_active without comment
#33: FILE: drivers/gpu/drm/drm_vblank_work.c:249:
+			    waitqueue_active(&vblank->work_wait_queue),

total: 0 errors, 1 warnings, 0 checks, 41 lines checked
e56a10b87a81 drm/i915: Use vblank worker to unpin old legacy cursor fb safely
4d4e377ec291 drm/i915: Use the same vblank worker for atomic unpin
-:37: WARNING:TYPO_SPELLING: 'succesful' may be misspelled - perhaps 'successful'?
#37: FILE: drivers/gpu/drm/i915/display/intel_atomic_plane.c:1168:
+	 * This branch can only ever be called after plane update is succesful,
 	                                                             ^^^^^^^^^

-:118: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#118: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:746:
+							 drm_crtc_accurate_vblank_count(&crtc->base) + 1,

total: 0 errors, 2 warnings, 0 checks, 110 lines checked


