Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE02E92FCE
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Oct 2023 00:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52A310E082;
	Fri,  6 Oct 2023 00:13:26 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D55610E07B;
 Fri,  6 Oct 2023 00:13:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 459D2AADEA;
 Fri,  6 Oct 2023 00:13:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Ser" <contact@emersion.fr>
Date: Fri, 06 Oct 2023 00:13:25 -0000
Message-ID: <169655120524.6466.15228016852165288246@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231005131623.114379-1-contact@emersion.fr>
In-Reply-To: <20231005131623.114379-1-contact@emersion.fr>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/atomic-helper=3A_relax_unregistered_connector_check?=
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

Series: drm/atomic-helper: relax unregistered connector check
URL   : https://patchwork.freedesktop.org/series/124664/
State : warning

== Summary ==

Error: dim checkpatch failed
7f14ea949b98 drm/atomic-helper: relax unregistered connector check
-:68: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#68: FILE: drivers/gpu/drm/drm_atomic_helper.c:630:
+	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i)

total: 0 errors, 1 warnings, 0 checks, 43 lines checked


