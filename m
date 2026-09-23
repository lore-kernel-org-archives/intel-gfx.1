Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2170C98304
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 14:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E72B10F0E4;
	Wed, 23 Sep 2026 14:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="Lg+1qR0X";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TNNmI4Mu";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC7E10F0E2
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 14:27:48 +0000 (UTC)
Date: Wed, 23 Sep 2026 16:27:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1790173667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=71Vntc96dDERhBBo1KHAEdVNIrpnwSNM2IsAX1uvQnk=;
 b=Lg+1qR0XRJdVjQTdQdWw/iRtFg+pY1q639lR4u7EV3mT5xtU9ermmIYVC30H2YzNouOsdW
 kvbflX6r1wzeCGxhNhW1molgqCyxg7YSkYljZzJM5epokeLuJj55+Cmv2aej3YboTOaoYe
 2ZdtfyEAXrjt2aqiinwHouDN1pa/Jh8fl9+T7xRguPNhhS9CLboSWcryNHVK8TeZf9Lm/2
 6juDXXicB/a7doFHd0ORnmUtVBjg3nD2R1YyfX+lcju7vmLZTQcyb7z50jpfglUOwg32xW
 wfUgYDABPG85IMo5u0tnsfpcbz4KHa5GP3XUmcvdEx28BPRbsB33McNon/0rQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1790173667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=71Vntc96dDERhBBo1KHAEdVNIrpnwSNM2IsAX1uvQnk=;
 b=TNNmI4Mu9EEhMngdTU1nCf3MjmfyQY68s+3GE/IDBcZV0m0hBD3oOkPGnNFuN8KI/GyBDQ
 Uu7rIu4FrpBNWtCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v5 0/6] drm/i915: Most fixes to make i915 work well with
 PREEMPT_RT.
Message-ID: <20260923142745.0kQ05Jg8@linutronix.de>
References: <20260923111518.310430-8-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923111518.310430-8-dev@lankhorst.se>
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

On 2026-09-23 13:15:19 [+0200], Maarten Lankhorst wrote:
> This series has dropped 'drm/i915/gt: Use signalers_lock to prevent
> starvation of irq_work.', but otherwise includes all fixes I have 
> created so far to make the core i915 module work correctly on
> PREEMPT_RT.
> 
> I'm hoping by reducing the delta, the remaining patches will become
> easier to review and accept. A major patch series with nearly 30 patches
> over the entire code is harder to review and accept than a few isolated
> series targeting specific parts of the driver.

Thank you Maarten.

Sebastian
