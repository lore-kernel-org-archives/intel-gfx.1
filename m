Return-Path: <SRS0=U9P+=OZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4683EC433EF
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Oct 2021 15:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1032261244
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Oct 2021 15:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1032261244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084416E429;
	Tue,  5 Oct 2021 15:00:54 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F6A6E41D;
 Tue,  5 Oct 2021 15:00:52 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1633446049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0URelBZGz8DTUCCDh3NKZZAQQHLT3jT0kolCu2bpf0E=;
 b=yRJUc6dQ71Ue4e/wQZsJ6G3YQpxMhz20LOa/72EomUAD6Jrv95aDij5FAwVusx9r6LHBby
 bJh7n4MF9wIgXUEX269hxydV7kvU4vJ13NLbwNcmHfMprixVCbJDQNPnVvhvyZkH0w87xu
 TAe2RxQpR82Vb/dLUl2cZvEWQO49bI7YthRGJwjSyfBqnzxgBgPz8nQy05Ct5Y+Wxxv45c
 C4N3qrnCy0aTzGdEQuefEceq9IRYJNM02UGhXn/f74y0tZVSh+IIYS8w4JXDTQLRlmRcAV
 o+B7A7zuq+i6tA9MIVWwAiTsyo5hXkUctpBFmSOoc0n2tkC7A4j7++cgyoy4hw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1633446049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0URelBZGz8DTUCCDh3NKZZAQQHLT3jT0kolCu2bpf0E=;
 b=Cv6QX/enAZNy96TVVRyh3NGN04wI5Mogg8Wq4TyddOu/4AgTord1Tj5MN1Sx+E2MjFcC07
 WiCrx/lOdXmiAbAQ==
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>
Date: Tue,  5 Oct 2021 17:00:38 +0200
Message-Id: <20211005150046.1000285-1-bigeasy@linutronix.de>
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi,

the following patches are from the PREEMPT_RT queue. It is mostly about
disabling interrupts/preemption which leads to problems.
Unfortunately DRM_I915_LOW_LEVEL_TRACEPOINTS had to be disabled because
it acquires locks from within trace points.
I tested it on a SandyBridge with built-in i915 by using X, OpenGL and
playing videos without noticing any warnings. However, some code paths
were not entered.

Sebastian


