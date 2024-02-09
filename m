Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9A0C4828F
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Feb 2024 16:33:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374A410F333;
	Fri,  9 Feb 2024 16:33:45 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364D810E06E;
 Fri,  9 Feb 2024 16:33:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/buddy=3A_Fix_all?=
 =?utf-8?q?oc=5Frange=28=29_error_handling_code_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 09 Feb 2024 16:33:43 -0000
Message-ID: <170749642322.1129906.7263758813641438173@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240209152624.1970-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20240209152624.1970-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: drm/buddy: Fix alloc_range() error handling code (rev3)
URL   : https://patchwork.freedesktop.org/series/129637/
State : warning

== Summary ==

Error: dim checkpatch failed
49edf7cf2985 drm/buddy: Fix alloc_range() error handling code
-:19: WARNING:BAD_SIGN_OFF: Use a single space after Cc:
#19: 
Cc:  <stable@vger.kernel.org> # 6.7+

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


