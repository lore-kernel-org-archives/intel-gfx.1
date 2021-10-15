Return-Path: <SRS0=ZLzJ=PD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365ACC433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Oct 2021 14:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E60386108E
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Oct 2021 14:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E60386108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1BD6E9F9;
	Fri, 15 Oct 2021 14:24:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E46F96E30F;
 Fri, 15 Oct 2021 14:24:10 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D9474A7525;
 Fri, 15 Oct 2021 14:24:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Claudio Suarez" <cssk@net-c.es>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 15 Oct 2021 14:24:10 -0000
Message-ID: <163430785086.29318.11289706205389359819@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211015113713.630119-1-cssk@net-c.es>
In-Reply-To: <20211015113713.630119-1-cssk@net-c.es>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBy?=
 =?utf-8?q?eplace_drm=5Fdetect=5Fhdmi=5Fmonitor=28=29_with_drm=5Fdisplay?=
 =?utf-8?q?=5Finfo=2Eis=5Fhdmi?=
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

Series: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
URL   : https://patchwork.freedesktop.org/series/95880/
State : failure

== Summary ==

Applying: gpu/drm: make drm_add_edid_modes() consistent when updating connector->display_info
Applying: drm/amdgpu: use drm_* functions instead of duplicated code in amdgpu driver
Applying: drm/vc4: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Applying: drm/radeon: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Applying: drm/tegra: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Applying: drm/gma500: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Applying: drm/exynos: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Applying: drm/msm: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Applying: drm/sun4i: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Applying: drm/sti: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Applying: drm/zte: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Using index info to reconstruct a base tree...
A	drivers/gpu/drm/zte/zx_hdmi.c
Falling back to patching base and 3-way merge...
CONFLICT (modify/delete): drivers/gpu/drm/zte/zx_hdmi.c deleted in HEAD and modified in drm/zte: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi. Version drm/zte: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi of drivers/gpu/drm/zte/zx_hdmi.c left in tree.
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0011 drm/zte: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


