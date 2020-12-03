Return-Path: <SRS0=sbLu=FH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E49C4361A
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Dec 2020 22:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B823E2220F
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Dec 2020 22:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B823E2220F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4C56E092;
	Thu,  3 Dec 2020 22:16:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E31F6EC3D;
 Thu,  3 Dec 2020 22:16:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0DE2DA7525;
 Thu,  3 Dec 2020 22:16:34 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Deucher" <alexdeucher@gmail.com>
Date: Thu, 03 Dec 2020 22:16:34 -0000
Message-ID: <160703379403.31153.2140266127944374259@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBk?=
 =?utf-8?q?rm=3A_Try_to_fix_encoder_possible=5Fclones/crtc_=28rev4=29?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm: Try to fix encoder possible_clones/crtc (rev4)
URL   : https://patchwork.freedesktop.org/series/63399/
State : failure

== Summary ==

Applying: drm: Include the encoder itself in possible_clones
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/drm_crtc_internal.h
M	drivers/gpu/drm/drm_drv.c
M	drivers/gpu/drm/drm_mode_config.c
M	include/drm/drm_encoder.h
Falling back to patching base and 3-way merge...
Auto-merging include/drm/drm_encoder.h
CONFLICT (content): Merge conflict in include/drm/drm_encoder.h
Auto-merging drivers/gpu/drm/drm_mode_config.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_mode_config.c
Auto-merging drivers/gpu/drm/drm_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_drv.c
Auto-merging drivers/gpu/drm/drm_crtc_internal.h
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm: Include the encoder itself in possible_clones
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
