Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201B9C83F07
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Jul 2025 15:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A248810E4CD;
	Mon,  7 Jul 2025 15:40:38 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF38A10E4C1;
 Mon,  7 Jul 2025 15:40:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_fs=3A_refactor_?=
 =?utf-8?q?write=5Fbegin/write=5Fend_and_add_ext4_IOCB=5FDONTCACHE_support_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?6ZmI5rab5rabIFRhb3RhbyBDaGVu?= <chentaotao@didiglobal.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 07 Jul 2025 15:40:37 -0000
Message-ID: <175190283777.139854.2252377223148685275@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250707070023.206725-1-chentaotao@didiglobal.com>
In-Reply-To: <20250707070023.206725-1-chentaotao@didiglobal.com>
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

Series: fs: refactor write_begin/write_end and add ext4 IOCB_DONTCACHE support (rev2)
URL   : https://patchwork.freedesktop.org/series/151267/
State : failure

== Summary ==

Address 'chentaotao@didiglobal.com' is not on the allowlist, which prevents CI from being triggered for this patch.
If you want Intel GFX CI to accept this address, please contact the script maintainers at i915-ci-infra@lists.freedesktop.org.
Exception occurred during validation, bailing out!


