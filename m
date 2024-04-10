Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BCACD11C2
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Apr 2024 10:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DA610E8F7;
	Wed, 10 Apr 2024 10:39:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D08D10E9B1;
 Wed, 10 Apr 2024 10:39:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm=3A_move_Intel_dr?=
 =?utf-8?q?m_headers_to_a_subdirectory?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 10 Apr 2024 10:39:25 -0000
Message-ID: <171274556524.1319548.3017865535806145530@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1712743191.git.jani.nikula@intel.com>
In-Reply-To: <cover.1712743191.git.jani.nikula@intel.com>
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

Series: drm: move Intel drm headers to a subdirectory
URL   : https://patchwork.freedesktop.org/series/132264/
State : warning

== Summary ==

Error: dim checkpatch failed
8c970e29f651 drm/i915: use system include for drm headers
81251adf0df4 drm: move intel-gtt.h under include/drm/intel
-:81: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#81: 
rename from include/drm/intel-gtt.h

total: 0 errors, 1 warnings, 0 checks, 40 lines checked
210b6d3c5c9f drm: move i915_gsc_proxy_mei_interface.h under include/drm/intel
-:57: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#57: 
rename from include/drm/i915_gsc_proxy_mei_interface.h

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
a7f5cf642054 drm: move i915_component.h under include/drm/intel
-:123: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#123: 
rename from include/drm/i915_component.h

total: 0 errors, 1 warnings, 0 checks, 72 lines checked
d59992803ff1 drm: move intel_lpe_audio.h under include/drm/intel
-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
rename from include/drm/intel_lpe_audio.h

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
351c87a39615 drm: move i915_drm.h under include/drm/intel
-:113: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#113: 
rename from include/drm/i915_drm.h

total: 0 errors, 1 warnings, 0 checks, 56 lines checked
8df033d9b2cc drm: move i915_pxp_tee_interface.h under include/drm/intel
-:43: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#43: 
rename from include/drm/i915_pxp_tee_interface.h

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
bc0b32a80713 drm: move i915_pciids.h under include/drm/intel
-:69: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
rename from include/drm/i915_pciids.h

total: 0 errors, 1 warnings, 0 checks, 32 lines checked
96c38515e434 drm: move xe_pciids.h under include/drm/intel
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
rename from include/drm/xe_pciids.h

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
e34f3fcf46cb drm: move i915_hdcp_interface.h under include/drm/intel
-:82: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#82: 
rename from include/drm/i915_hdcp_interface.h

total: 0 errors, 1 warnings, 0 checks, 40 lines checked


