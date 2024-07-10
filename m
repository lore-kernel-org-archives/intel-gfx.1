Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58FDC3DA42
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Jul 2024 13:35:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8768910E7AF;
	Wed, 10 Jul 2024 13:35:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BAF10E7AB;
 Wed, 10 Jul 2024 13:35:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_series_starting_with?=
 =?utf-8?q?_=5B1/2=5D_drm=3A_Add_might=5Ffault_to_drm=5Fmodeset=5Flock_primi?=
 =?utf-8?q?ng_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Vetter" <daniel.vetter@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 10 Jul 2024 13:35:10 -0000
Message-ID: <172061851027.105350.44486305108980107@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240710093120.732208-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20240710093120.732208-1-daniel.vetter@ffwll.ch>
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

Series: series starting with [1/2] drm: Add might_fault to drm_modeset_lock priming (rev2)
URL   : https://patchwork.freedesktop.org/series/135935/
State : warning

== Summary ==

Error: dim checkpatch failed
9e9ca832c1d9 drm: Add might_fault to drm_modeset_lock priming
-:20: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#20: 
References: https://lore.kernel.org/dri-devel/00000000000073db8b061cd43496@google.com/

-:20: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#20: 
References: https://lore.kernel.org/dri-devel/00000000000073db8b061cd43496@google.com/

-:29: WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Christian König <christian.koenig@amd.com>.', should be: '"Christian König" <christian.koenig@amd.com>'
#29: 
Reviewed-by: Christian König <christian.koenig@amd.com>.

-:43: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Daniel Vetter <daniel.vetter@ffwll.ch>' != 'Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>'

total: 0 errors, 4 warnings, 0 checks, 8 lines checked
ce05a1a2745f bcachefs: no console_lock in bch2_print_string_as_lines
-:26: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#26: 
Reported-by: syzbot+6cebc1af246fe020a2f0@syzkaller.appspotmail.com
References: https://lore.kernel.org/dri-devel/00000000000026c1ff061cd0de12@google.com/

-:27: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#27: 
References: https://lore.kernel.org/dri-devel/00000000000026c1ff061cd0de12@google.com/

-:27: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#27: 
References: https://lore.kernel.org/dri-devel/00000000000026c1ff061cd0de12@google.com/

total: 0 errors, 3 warnings, 0 checks, 21 lines checked


