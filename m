Return-Path: <SRS0=r3jS=N6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142E3C433F5
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Sep 2021 19:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3F1A61074
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Sep 2021 19:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3F1A61074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164A86E2B6;
	Wed,  8 Sep 2021 19:04:54 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B6B6E28B;
 Wed,  8 Sep 2021 19:04:51 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1631127427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ja6UVY/K51tXsi/XK0upPS/i2C7NG+UnVxqjbfVoGk4=;
 b=dHHaZQKqI2XbPRdwg09l8XmX2++tSCWJ/STqtynlVm9FvHiYw2Jtloj/xZIXxXDBwZGwDl
 MPXqnOt0Vgt3EhaZ208fFDJ2O9LYs+beJCgEHIS/wG1i9GNqHtsCtExiOsotjgULdl/WJK
 97gqGYLR2ll5lcuH5ELCgen57GSK4EiOYXpwN5nBxYucntCHHjuRKKE7UXUNVJLhhvk8d4
 eB+/XWdL5Ofgi8t5LpqdAYi+tLVRj2uu+4EHjnl9PK/ctDUN7I/9tIyWENWlZwmK5mPEWt
 eKc9t5twN4pUnv0BXsH08Ax2YfdwsUTx9JYm6nseApR8dShHzFOLuIDXOqCGZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1631127427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ja6UVY/K51tXsi/XK0upPS/i2C7NG+UnVxqjbfVoGk4=;
 b=QQzOpSv7gV3E4Yhh0WCZStnU34gClc1Xft1BQ4pEZW8t1B2mfnoQ7pSSQOh0AMZAJADqZM
 QQrEMqNgIBCau3Dw==
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Clark Williams <williams@redhat.com>
Date: Wed,  8 Sep 2021 20:57:01 +0200
Message-Id: <20210908185703.2989414-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [Intel-gfx] [PATCH 0/2] drm/i915/gt: Locking splats PREEMPT_RT
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

Clark Williams reported two issues with the i915 driver running on
PREEMPT_RT. While #1 looks simple I have no idea about #2 thus the RFC.

Sebastian

