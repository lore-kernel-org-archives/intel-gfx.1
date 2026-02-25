Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E29FD375E
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Feb 2026 13:20:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6127A10E794;
	Wed, 25 Feb 2026 13:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="L1RA5PEx";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB0B10E78C
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Feb 2026 13:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772025597;
 bh=KmjNnUhpY2WsmJESuqbPJuQrO5tIVfnFocxszCW9ch8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=L1RA5PExwRjwR2UqUkOblGQT1/jF0uVDKLOySUELhwKRuscyBI/dj7XMtsMC+lE2Y
 uBUl+mSKIAJY1f0CfoD5cDRIwvFkUpc5IRu2gI0GmWz9lrW+QFbsE5TgUUdtV9E/h4
 zv5bOu4WciApBJ8ZJaBWKb02rcnSAr0BCOAY5GtPVmnPXz/x2lMcpKzpTH5Jq5fUp6
 EiT4zMtI2lgpsKaUI3XBU1Ihh/QuLajGAIGp39R04fDvDLla8YndP/0xn6cpLy6arV
 Fx4TXvhUsA5IdjPxeUqLrb1ROUHz2dlpsRjmP6f+NKhpIx3mMp22N67GJCkBWE6vEF
 bcHJ4uWHoqYfA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org
Subject: [i915-ci-only NO-REVIEW 25/25] FOR-CI: bump MAX_STACK_TRACE_ENTRIES
Date: Wed, 25 Feb 2026 14:19:29 +0100
Message-ID: <20260225131931.60724-26-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260225131931.60724-1-dev@lankhorst.se>
References: <20260225131931.60724-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

We're hitting a bug in CI where MAX_STACK_TRACE_ENTRIES is set too low.
My guess is the repeated loading/unloading is creating multiples of the
same entries. As a hack just reset lockdep. This might only be necessary
for CI + PREEMPT_RT.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 lib/Kconfig.debug | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index fa8449118bee6..b13f4ea509580 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1624,8 +1624,8 @@ config LOCKDEP_CHAINS_BITS
 config LOCKDEP_STACK_TRACE_BITS
 	int "Size for MAX_STACK_TRACE_ENTRIES (as Nth power of 2)"
 	depends on LOCKDEP && !LOCKDEP_SMALL
-	range 10 26
-	default 19
+	range 22 26
+	default 22
 	help
 	  Try increasing this value if you hit "BUG: MAX_STACK_TRACE_ENTRIES too low!" message.
 
-- 
2.51.0

