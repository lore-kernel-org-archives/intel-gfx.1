Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B8DC02198
	for <intel-gfx@archiver.kernel.org>; Mon, 10 Feb 2025 18:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B06710E5E4;
	Mon, 10 Feb 2025 18:19:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9673610E1E7;
 Mon, 10 Feb 2025 18:19:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_meson=3A_Add_dependency_o?=
 =?utf-8?q?n_xv?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Povilas Kanapickas" <povilas@radix.lt>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 10 Feb 2025 18:19:06 -0000
Message-ID: <173921154661.436326.17319932940623002784@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <77434761-e627-4a82-8482-34e6cce79349@radix.lt>
In-Reply-To: <77434761-e627-4a82-8482-34e6cce79349@radix.lt>
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

Series: meson: Add dependency on xv
URL   : https://patchwork.freedesktop.org/series/144614/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/144614/revisions/1/mbox/ not applied
Applying: meson: Add dependency on xv
error: sha1 information is lacking or useless (meson.build).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 meson: Add dependency on xv
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


