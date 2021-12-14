Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A54C433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Dec 2021 14:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A4710E4CA;
	Tue, 14 Dec 2021 14:03:13 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D3210E480;
 Tue, 14 Dec 2021 14:03:11 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639490588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PKOblzRcMQhKJJmJvMs0P/2nF/9bPXHu9vOjiwBdfbI=;
 b=bu5DDXViUownEqbsFdzfaPQA5JdgpAdYjMyBciyYeEwbuE5yTfLLVGNPq14xMc8ncUe9fW
 1P6BVk08Suy6G1QZSIVQ8IBR7/FBmEq//o7GGYF124zI7da5/RLB2c5/EID024sBTELtYN
 iHRdaGMwbQxIYYk05BXUFL7mnugcY0VUy5GncqFbU8iNafn6dR/gm1Xhxx+YouLoBFBIHr
 5ex0OfsXzyD1Gjev/fNtqzj7W7kiBQjRdMPzwOczY10OCw/w49EJrxw4DDN1mY0tgu76WJ
 2CcF9hNfGth82NdTrIH1eDNRwygdQJTFzgUTRVyYiv8AJqBrf4JhPlq4Sx6nGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639490588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PKOblzRcMQhKJJmJvMs0P/2nF/9bPXHu9vOjiwBdfbI=;
 b=FhH1dlSZzJ0H8ijemQayIox20lmPXUx+33WimFACAkYxy1CboHdcUmtuUEHQQ67Z/Q4u4X
 GD6iG0sWGzh9NYBA==
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Date: Tue, 14 Dec 2021 15:02:53 +0100
Message-Id: <20211214140301.520464-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [Intel-gfx] [PATCH 0/8] drm/i915: PREEMPT_RT related fixups.
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
Cc: David Airlie <airlied@linux.ie>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


Hi,

The following patches are from the PREEMPT_RT queue. One patch was
applied, one added so here are eight again. I can post them in smaller
batches if that is preferred.
It is mostly about disabling interrupts/preemption which leads to
problems.  Unfortunately DRM_I915_LOW_LEVEL_TRACEPOINTS had to be
disabled because it acquires locks from within trace points. Making the
lock a raw_spinlock_t led to higher latencies during video playback
  https://lore.kernel.org/all/20211006164628.s2mtsdd2jdbfyf7g@linutronix.de/

and I'm not sure if I hit the worse case here.
I tested it on a SandyBridge with built-in i915 by using X, OpenGL and
playing videos without noticing any warnings. However, some code paths
were not entered.

Sebastian

