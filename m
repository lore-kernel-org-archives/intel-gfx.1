Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E813CAC5B8
	for <intel-gfx@archiver.kernel.org>; Tue, 30 Sep 2025 09:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B282010E29B;
	Tue, 30 Sep 2025 09:23:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624A910E29B;
 Tue, 30 Sep 2025 09:23:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_REGRESSION_on_linux-next_?=
 =?utf-8?q?=28next-20250919=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 30 Sep 2025 09:23:21 -0000
Message-ID: <175922420139.377882.14441921233113133267@1538d3639d33>
X-Patchwork-Hint: ignore
References: <70b64347-2aca-4511-af78-a767d5fa8226@intel.com>
In-Reply-To: <70b64347-2aca-4511-af78-a767d5fa8226@intel.com>
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

Series: REGRESSION on linux-next (next-20250919)
URL   : https://patchwork.freedesktop.org/series/155228/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/155228/revisions/1/mbox/ not applied
Applying: REGRESSION on linux-next (next-20250919)
error: corrupt patch at line 6
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 REGRESSION on linux-next (next-20250919)
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


