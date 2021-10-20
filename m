Return-Path: <SRS0=m2z4=PI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA01C433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Oct 2021 14:24:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BB586135E
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Oct 2021 14:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BB586135E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D18D6E9BD;
	Wed, 20 Oct 2021 14:24:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id F23566E9B7;
 Wed, 20 Oct 2021 14:24:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EB4C4A00E8;
 Wed, 20 Oct 2021 14:24:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhawanpreet Lakha" <bhawanpreet.lakha@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 20 Oct 2021 14:24:22 -0000
Message-ID: <163473986293.27359.11696267043112658557@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211020141603.19452-1-Bhawanpreet.Lakha@amd.com>
In-Reply-To: <20211020141603.19452-1-Bhawanpreet.Lakha@amd.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBz?=
 =?utf-8?q?eries_starting_with_=5B1/4=5D_drm=3A_Remove_slot_checks_in_dp_m?=
 =?utf-8?q?st_topology_during_commit?=
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

Series: series starting with [1/4] drm: Remove slot checks in dp mst topology during commit
URL   : https://patchwork.freedesktop.org/series/96060/
State : failure

== Summary ==

Applying: drm: Remove slot checks in dp mst topology during commit
Applying: drm: Update MST First Link Slot Information Based on Encoding Format
Applying: drm/amd/display: Add DP 2.0 MST DC Support
error: sha1 information is lacking or useless (drivers/gpu/drm/amd/display/dc/core/dc.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0003 drm/amd/display: Add DP 2.0 MST DC Support
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


