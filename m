Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DED5E7716E
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Dec 2024 21:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E17710E0C4;
	Thu,  5 Dec 2024 21:18:11 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BAF10E0C4;
 Thu,  5 Dec 2024 21:18:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm=3A_fix_and_enabl?=
 =?utf-8?q?e_warnings_on_unused_static_inlines_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 05 Dec 2024 21:18:10 -0000
Message-ID: <173343349040.3077870.14251184037757885776@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1733410889.git.jani.nikula@intel.com>
In-Reply-To: <cover.1733410889.git.jani.nikula@intel.com>
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

Series: drm: fix and enable warnings on unused static inlines (rev2)
URL   : https://patchwork.freedesktop.org/series/138460/
State : warning

== Summary ==

Error: dim checkpatch failed
dc99fb0a4943 drm/bridge: dw-hdmi-i2s: annotate hdmi_read() with __maybe_unused
-:7: WARNING:REPEATED_WORD: Possible repeated word: 'and'
#7: 
Building with clang and and W=1 leads to warning about unused

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
e3994671b5b8 drm: renesas: rcar-du: annotate rcar_cmm_read() with __maybe_unused
-:7: WARNING:REPEATED_WORD: Possible repeated word: 'and'
#7: 
Building with clang and and W=1 leads to warning about unused

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
004ed9e0f32f drm: enable warnings on unused static inlines


