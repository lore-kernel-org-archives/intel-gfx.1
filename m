Return-Path: <SRS0=FGOe=O2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAD5C433EF
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Oct 2021 09:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90CAC61163
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Oct 2021 09:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90CAC61163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1580E6ED24;
	Wed,  6 Oct 2021 09:00:01 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C20C96ED24;
 Wed,  6 Oct 2021 08:59:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B9D21AA0EA;
 Wed,  6 Oct 2021 08:59:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 06 Oct 2021 08:59:59 -0000
Message-ID: <163351079973.5961.17290101413648816291@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211006025350.a5PczFZP4%akpm@linux-foundation.org>
In-Reply-To: <20211006025350.a5PczFZP4%akpm@linux-foundation.org>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBt?=
 =?utf-8?q?motm_2021-10-05-19-53_uploaded_=28drivers/gpu/drm/msm/hdmi/hdmi?=
 =?utf-8?b?X3BoeS5vKQ==?=
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

Series: mmotm 2021-10-05-19-53 uploaded (drivers/gpu/drm/msm/hdmi/hdmi_phy.o)
URL   : https://patchwork.freedesktop.org/series/95495/
State : failure

== Summary ==

Applying: mmotm 2021-10-05-19-53 uploaded (drivers/gpu/drm/msm/hdmi/hdmi_phy.o)
error: patch failed: drivers/gpu/drm/msm/Kconfig:5
error: drivers/gpu/drm/msm/Kconfig: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Using index info to reconstruct a base tree...
Patch failed at 0001 mmotm 2021-10-05-19-53 uploaded (drivers/gpu/drm/msm/hdmi/hdmi_phy.o)
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


