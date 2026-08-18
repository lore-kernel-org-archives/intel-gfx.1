Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4230CC5DF70
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Aug 2026 06:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AF010E4D2;
	Tue, 18 Aug 2026 06:59:43 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF3E10E20C;
 Tue, 18 Aug 2026 06:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915/cdclk=3A_Don=27t?=
 =?utf-8?q?_force_cd2x_pipe_select_on_Xe3_in_bxt=5Fsanitize=5Fcdclk=28=29_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?Q2hhbmcgSmlvbmco5bi454KvKQ==?= <304750714@qq.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 18 Aug 2026 06:59:42 -0000
Message-ID: <178703638244.61185.2376999261360175716@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260815164149.607690-1-xspeed1989@gmail.com>
In-Reply-To: <20260815164149.607690-1-xspeed1989@gmail.com>
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

Series: drm/i915/cdclk: Don't force cd2x pipe select on Xe3 in bxt_sanitize_cdclk() (rev3)
URL   : https://patchwork.freedesktop.org/series/172269/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/172269/revisions/3/mbox/ not applied
Applying: drm/i915/cdclk: Don't force cd2x pipe select on Xe3 in bxt_sanitize_cdclk()
error: sha1 information is lacking or useless (drivers/gpu/drm/i915/display/intel_cdclk.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm/i915/cdclk: Don't force cd2x pipe select on Xe3 in bxt_sanitize_cdclk()
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


