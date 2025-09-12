Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02B9CAC582
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Sep 2025 15:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC5910ECA2;
	Fri, 12 Sep 2025 15:35:59 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFCD10ECA0;
 Fri, 12 Sep 2025 15:35:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_rcu=3A_Remove_r?=
 =?utf-8?q?edundant_rcu=5Fread=5Flock/unlock=28=29_in_spin=5Flock_critical_s?=
 =?utf-8?q?ections?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "pengdonglin" <dolinux.peng@gmail.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 12 Sep 2025 15:35:57 -0000
Message-ID: <175769135764.330879.14025725739375104892@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250912065050.460718-1-dolinux.peng@gmail.com>
In-Reply-To: <20250912065050.460718-1-dolinux.peng@gmail.com>
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

Series: rcu: Remove redundant rcu_read_lock/unlock() in spin_lock critical sections
URL   : https://patchwork.freedesktop.org/series/154460/
State : failure

== Summary ==

Address 'dolinux.peng@gmail.com' is not on the allowlist, which prevents CI from being triggered for this patch.
If you want Intel GFX CI to accept this address, please contact the script maintainers at i915-ci-infra@lists.freedesktop.org.
Exception occurred during validation, bailing out!


