Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF14C25B77
	for <intel-gfx@archiver.kernel.org>; Mon, 20 May 2024 19:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED0E10E04F;
	Mon, 20 May 2024 19:02:43 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F80010E8A8;
 Mon, 20 May 2024 19:02:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/xe=3A_Cleanup_xe?=
 =?utf-8?q?=5Fmmio=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 20 May 2024 19:02:38 -0000
Message-ID: <171623175845.2157358.5425379683962735833@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240520181814.2392-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240520181814.2392-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Cleanup xe_mmio.h
URL   : https://patchwork.freedesktop.org/series/133825/
State : warning

== Summary ==

Error: dim checkpatch failed
ff7fd69a1372 drm/i915/display: Add missing include to intel_vga.c
ce3839510f9f drm/xe: Don't rely on indirect includes from xe_mmio.h
0dd2822656ee drm/xe: Cleanup xe_mmio.h
-:9: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 54c659660d63 ("drm/xe: Make xe_mmio_read|write() functions non-inline")'
#9: 
We don't need <linux/io-64-nonatomic-lo-hi.h> include since commit

total: 1 errors, 0 warnings, 0 checks, 39 lines checked


