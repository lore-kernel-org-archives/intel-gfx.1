Return-Path: <SRS0=R2gn=IU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C765C433E1
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Mar 2021 18:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F2E061992
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Mar 2021 18:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F2E061992
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641096E542;
	Mon, 22 Mar 2021 18:17:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3414B6E503;
 Mon, 22 Mar 2021 16:04:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1F12619AA;
 Mon, 22 Mar 2021 16:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429094;
 bh=xAtyylaIqASvvaS85ZKuu0hXHauLkQxCojv0RLX/Mb4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qF3TQ/qAB99dHQJQ17LkEWSGHzxXaa6ah0V394Zl3kvv8RzfyZLGR5LrTvWyC7H1A
 Y/FGboTYdhxs+1JdIoA84vXMKDdcAhTrEkBBb0UQUQKweCwvIzhlEQaLj3V5+EtINN
 TkIcf5XVjUiGPrExh51GxNaO8HstdwbBZt6yPypCRTLZ7dgkDLCsQKmQNcTUMokkXV
 S8QQatAQDJMuuHsGK0sG76w09rCi8u76J/NCDygW1XdPiFPESnsqpJ4LRffqASyFiK
 CjWew/HiP9HZ5pWACV/kafDp0YkSlO5krvl5NtQtLs6m/hkRHKNSKqc2U8LuhcidQu
 4FzJ0OAQMgZGg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org,
	Martin Sebor <msebor@gcc.gnu.org>
Date: Mon, 22 Mar 2021 17:02:45 +0100
Message-Id: <20210322160253.4032422-8-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Mar 2021 18:17:39 +0000
Subject: [Intel-gfx] [PATCH 07/11] ARM: sharpsl_param: work around
 -Wstringop-overread warning
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
Cc: dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 linux-scsi@vger.kernel.org, x86@kernel.org,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org,
 Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Ning Sun <ning.sun@intel.com>,
 Anders Larsen <al@alarsen.net>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-security-module@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Simon Kelley <simon@thekelleys.org.uk>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmdjYyB3YXJucyB0aGF0IGFjY2Vz
c2luZyBhIHBvaW50ZXIgYmFzZWQgb24gYSBudW1lcmljIGNvbnN0YW50IG1heQpiZSBhbiBvZmZz
ZXQgaW50byBhIE5VTEwgcG9pbnRlciwgYW5kIHdvdWxkIHRoZXJlZm9yZSBoYXMgemVybwphY2Nl
c3NpYmxlIGJ5dGVzOgoKYXJjaC9hcm0vY29tbW9uL3NoYXJwc2xfcGFyYW0uYzogSW4gZnVuY3Rp
b24g4oCYc2hhcnBzbF9zYXZlX3BhcmFt4oCZOgphcmNoL2FybS9jb21tb24vc2hhcnBzbF9wYXJh
bS5jOjQzOjk6IGVycm9yOiDigJhtZW1jcHnigJkgcmVhZGluZyA2NCBieXRlcyBmcm9tIGEgcmVn
aW9uIG9mIHNpemUgMCBbLVdlcnJvcj1zdHJpbmdvcC1vdmVycmVhZF0KICAgNDMgfCAgICAgICAg
IG1lbWNweSgmc2hhcnBzbF9wYXJhbSwgcGFyYW1fc3RhcnQoUEFSQU1fQkFTRSksIHNpemVvZihz
dHJ1Y3Qgc2hhcnBzbF9wYXJhbV9pbmZvKSk7CiAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+CgpJbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgdGhlIHdhcm5pbmcgaXMgYm9n
dXMgc2luY2UgdGhpcyBpcyB0aGUgYWN0dWFsCnBvaW50ZXIsIG5vdCBhbiBvZmZzZXQgb24gYSBO
VUxMIHBvaW50ZXIuIEFkZCBhIGxvY2FsIHZhcmlhYmxlIHRvIHNodXQKdXAgdGhlIHdhcm5pbmcg
YW5kIGhvcGUgaXQgZG9lc24ndCBjb21lIGJhY2suCgpMaW5rOiBodHRwczovL2djYy5nbnUub3Jn
L2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD05OTU3OApTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGFyY2gvYXJtL2NvbW1vbi9zaGFycHNsX3BhcmFtLmMg
fCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9hcmNoL2FybS9jb21tb24vc2hhcnBzbF9wYXJhbS5jIGIvYXJjaC9hcm0v
Y29tbW9uL3NoYXJwc2xfcGFyYW0uYwppbmRleCBlZmViNTcyNGQ5ZTkuLjYyMzdlZGUyZjBjNyAx
MDA2NDQKLS0tIGEvYXJjaC9hcm0vY29tbW9uL3NoYXJwc2xfcGFyYW0uYworKysgYi9hcmNoL2Fy
bS9jb21tb24vc2hhcnBzbF9wYXJhbS5jCkBAIC00MCw3ICs0MCw5IEBAIEVYUE9SVF9TWU1CT0wo
c2hhcnBzbF9wYXJhbSk7CiAKIHZvaWQgc2hhcnBzbF9zYXZlX3BhcmFtKHZvaWQpCiB7Ci0JbWVt
Y3B5KCZzaGFycHNsX3BhcmFtLCBwYXJhbV9zdGFydChQQVJBTV9CQVNFKSwgc2l6ZW9mKHN0cnVj
dCBzaGFycHNsX3BhcmFtX2luZm8pKTsKKwlzdHJ1Y3Qgc2hhcnBzbF9wYXJhbV9pbmZvICpwYXJh
bXMgPSBwYXJhbV9zdGFydChQQVJBTV9CQVNFKTsKKworCW1lbWNweSgmc2hhcnBzbF9wYXJhbSwg
cGFyYW1zLCBzaXplb2YoKnBhcmFtcykpOwogCiAJaWYgKHNoYXJwc2xfcGFyYW0uY29tYWRqX2tl
eXdvcmQgIT0gQ09NQURKX01BR0lDKQogCQlzaGFycHNsX3BhcmFtLmNvbWFkaj0tMTsKLS0gCjIu
MjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50
ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
