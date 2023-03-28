Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208FBC76196
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Mar 2023 23:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DC710E4C9;
	Tue, 28 Mar 2023 23:22:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7EA9010E4C9;
 Tue, 28 Mar 2023 23:22:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7B40BA7DFF;
 Tue, 28 Mar 2023 23:22:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Mar 2023 23:22:04 -0000
Message-ID: <168004572450.29057.8771431424624622946@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230307134901.322560-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230307134901.322560-1-dmitry.baryshkov@linaro.org>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBk?=
 =?utf-8?q?rm/i915=3A_move_DSC_RC_tables_to_drm=5Fdsc=5Fhelper=2Ec_=28rev3?=
 =?utf-8?q?=29?=
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

Series: drm/i915: move DSC RC tables to drm_dsc_helper.c (rev3)
URL   : https://patchwork.freedesktop.org/series/114473/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/114473/revisions/3/mbox/ not applied
Applying: drm/i915/dsc: change DSC param tables to follow the DSC model
Applying: drm/i915/dsc: move rc_buf_thresh values to common helper
Applying: drm/i915/dsc: move DSC tables to DRM DSC helper
error: sha1 information is lacking or useless (drivers/gpu/drm/i915/display/intel_vdsc.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0003 drm/i915/dsc: move DSC tables to DRM DSC helper
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


