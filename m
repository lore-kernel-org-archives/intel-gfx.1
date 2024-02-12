Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E529C48297
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Feb 2024 17:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8EA10EE11;
	Mon, 12 Feb 2024 17:56:04 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF8010EDB5;
 Mon, 12 Feb 2024 17:56:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/dp=3A_add_an_API_to_i?=
 =?utf-8?q?ndicate_if_sink_supports_VSC_SDP_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Abhinav Kumar" <quic_abhinavk@quicinc.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 12 Feb 2024 17:56:04 -0000
Message-ID: <170776056427.1183349.16027608030000138738@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240212173355.1857757-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240212173355.1857757-1-quic_abhinavk@quicinc.com>
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

Series: drm/dp: add an API to indicate if sink supports VSC SDP (rev2)
URL   : https://patchwork.freedesktop.org/series/129748/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/129748/revisions/2/mbox/ not applied
Applying: drm/dp: add an API to indicate if sink supports VSC SDP
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/display/drm_dp_helper.c
M	include/drm/display/drm_dp_helper.h
Falling back to patching base and 3-way merge...
Auto-merging include/drm/display/drm_dp_helper.h
CONFLICT (content): Merge conflict in include/drm/display/drm_dp_helper.h
Auto-merging drivers/gpu/drm/display/drm_dp_helper.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm/dp: add an API to indicate if sink supports VSC SDP
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


