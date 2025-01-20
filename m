Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9237C02181
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Jan 2025 11:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B92410E3BD;
	Mon, 20 Jan 2025 11:09:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB3010E3BA;
 Mon, 20 Jan 2025 11:09:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_iommu=3A_intel=3A_ap?=
 =?utf-8?q?ply_quirk=5Fiommu=5Figfx_for_8086=3A0044_=28QM57/QS57=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mingcong Bai" <jeffbai@aosc.io>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 20 Jan 2025 11:09:14 -0000
Message-ID: <173737135464.2064996.4310384680681374284@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250120093540.512825-1-jeffbai@aosc.io>
In-Reply-To: <20250120093540.512825-1-jeffbai@aosc.io>
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

Series: iommu: intel: apply quirk_iommu_igfx for 8086:0044 (QM57/QS57)
URL   : https://patchwork.freedesktop.org/series/143719/
State : warning

== Summary ==

Error: dim checkpatch failed
3d953d911327 iommu: intel: apply quirk_iommu_igfx for 8086:0044 (QM57/QS57)
-:71: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#71: 
Reported-by: Wenhao Sun <weiguangtwk@outlook.com>
Signed-off-by: Mingcong Bai <jeffbai@aosc.io>

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


