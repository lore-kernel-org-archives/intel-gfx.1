Return-Path: <SRS0=La7M=PG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E87C433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 18 Oct 2021 16:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BFC5604D2
	for <intel-gfx@archiver.kernel.org>; Mon, 18 Oct 2021 16:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BFC5604D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C726E0DC;
	Mon, 18 Oct 2021 16:57:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B41F6E0DC;
 Mon, 18 Oct 2021 16:57:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1391EA9A42;
 Mon, 18 Oct 2021 16:57:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "luo penghao" <cgel.zte@gmail.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 18 Oct 2021 16:57:17 -0000
Message-ID: <163457623707.27088.9291504493691598122@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211018084331.851975-1-luo.penghao@zte.com.cn>
In-Reply-To: <20211018084331.851975-1-luo.penghao@zte.com.cn>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/display=3A_Remove_unused_variable_and_its_assignme?=
 =?utf-8?b?bnQu?=
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

Series: drm/i915/display: Remove unused variable and its assignment.
URL   : https://patchwork.freedesktop.org/series/95966/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
96c9d1f9af61 drm/i915/display: Remove unused variable and its assignment.
-:38: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: luo penghao <cgel.zte@gmail.com>' != 'Signed-off-by: luo penghao <luo.penghao@zte.com.cn>'

total: 0 errors, 1 warnings, 0 checks, 14 lines checked


