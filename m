Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC6EC4345F
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Apr 2024 04:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186DD11309F;
	Tue, 23 Apr 2024 04:41:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8C011309E;
 Tue, 23 Apr 2024 04:41:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Uprev_mesa_and_IGT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 23 Apr 2024 04:41:31 -0000
Message-ID: <171384729118.1590358.17504371991427250933@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240423040243.448091-1-vignesh.raman@collabora.com>
In-Reply-To: <20240423040243.448091-1-vignesh.raman@collabora.com>
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

Series: Uprev mesa and IGT
URL   : https://patchwork.freedesktop.org/series/132746/
State : warning

== Summary ==

Error: dim checkpatch failed
661c85a3be29 drm/ci: uprev mesa version
867f0241d6c3 drm/ci: build virtual GPU driver as module
7d1b740578d9 drm/ci: uprev IGT and generate testlist from build
-:154: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#154: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1694 lines checked
7368c619c5ef drm/ci: add tests on vkms
-:124: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#124: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 170 lines checked


