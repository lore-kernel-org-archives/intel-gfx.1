Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9035ACD98C5
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Jun 2026 09:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B97A10E2EE;
	Mon, 15 Jun 2026 09:17:29 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB0C10E2EE;
 Mon, 15 Jun 2026 09:17:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_xhci=3A_dbc=3A_support_ru?=
 =?utf-8?q?ntime_suspend_while_DbC_is_in_enabled_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 15 Jun 2026 09:17:28 -0000
Message-ID: <178151504810.78267.1215541568452806956@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <79a7df51-a2ac-4206-987a-83737e1d316f@linux.intel.com>
In-Reply-To: <79a7df51-a2ac-4206-987a-83737e1d316f@linux.intel.com>
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

Series: xhci: dbc: support runtime suspend while DbC is in enabled state
URL   : https://patchwork.freedesktop.org/series/168511/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/168511/revisions/1/mbox/ not applied
Applying: xhci: dbc: support runtime suspend while DbC is in enabled state
error: sha1 information is lacking or useless (drivers/usb/host/xhci-dbgcap.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 xhci: dbc: support runtime suspend while DbC is in enabled state
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


