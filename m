Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8C0C67861
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Apr 2024 18:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A3E112930;
	Mon,  8 Apr 2024 18:12:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0944311292C;
 Mon,  8 Apr 2024 18:12:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/edid=3A_cleanups?=
 =?utf-8?q?=2C_resend?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 08 Apr 2024 18:12:08 -0000
Message-ID: <171259992803.1286010.1392305246424732802@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1712565984.git.jani.nikula@intel.com>
In-Reply-To: <cover.1712565984.git.jani.nikula@intel.com>
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

Series: drm/edid: cleanups, resend
URL   : https://patchwork.freedesktop.org/series/132142/
State : warning

== Summary ==

Error: dim checkpatch failed
d6df9c755975 drm/displayid: move drm_displayid.h to drm_displayd_internal.h
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
rename from include/drm/drm_displayid.h

total: 0 errors, 1 warnings, 0 checks, 37 lines checked
dfc9c110a355 drm/edid: move all internal declarations to drm_crtc_internal.h
1c045914f6ae drm/edid: group struct drm_edid based declarations together
1e612609dcc8 drm/edid: rename drm_find_edid_extension() to drm_edid_find_extension()
4f4faac0b3be drm/edid: avoid drm_edid_find_extension() internally
cc870d1238bc drm/edid: make drm_edid_are_equal() static
198fc1a35758 drm/edid: make drm_edid_are_equal() more convenient for its single user


