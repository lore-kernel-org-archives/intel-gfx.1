Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDD6D2ECF3
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Jan 2026 21:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6F510E527;
	Mon, 19 Jan 2026 21:41:28 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2CE10E36E;
 Mon, 19 Jan 2026 21:41:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_linux-next=3A_build_failu?=
 =?utf-8?q?re_after_merge_of_the_drm-misc_tree?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Brown" <broonie@kernel.org>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 19 Jan 2026 21:41:27 -0000
Message-ID: <176885888710.169327.3706500302616245978@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <aW5r7NzicgqvpaUj@sirena.org.uk>
In-Reply-To: <aW5r7NzicgqvpaUj@sirena.org.uk>
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

Series: linux-next: build failure after merge of the drm-misc tree
URL   : https://patchwork.freedesktop.org/series/160314/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/160314/revisions/1/mbox/ not applied
Applying: linux-next: build failure after merge of the drm-misc tree
error: sha1 information is lacking or useless (drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 linux-next: build failure after merge of the drm-misc tree
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


