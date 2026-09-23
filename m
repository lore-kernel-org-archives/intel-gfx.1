Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D965C98304
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 14:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF8710F0D4;
	Wed, 23 Sep 2026 14:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="NQVOFLx+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+DuVX7oE";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171DA10F0BB
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 14:27:06 +0000 (UTC)
Date: Wed, 23 Sep 2026 16:27:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1790173623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uY2ER/NnHNPcTPJ6x4T/wTLpxx779yr+rcQm3bEsP1c=;
 b=NQVOFLx+FF939nSjq/H+3t3iLQ+OKGnsAYgwe7UWfib6H9WVNkSn2fFMlbqea2D2f+Zk1h
 zlZ2BtwxWb6dtHi34VwMqiIFpl0XVrMpoE6dJ0qq5TTaKKDd3/iK7WaH7JXtKXPjVqsl4M
 WSW/n5ohHG9N3OP7guA0ln4K3U/c3eghfMs+iak0c0zymxNiCUoVkNjORjl+hWKzeLu1NQ
 N8bcDoVrroTbngMf0Txt5QhEdqp2rwzGwYky0M07yngOsc7lMrnUGQ1GN98sa4LKNW20xA
 3Yq60GBnykLyA5I/pICavN/mwwSQU+YWLpqeMh6rLbGrkaZgzkyuFUsBHhhhHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1790173623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uY2ER/NnHNPcTPJ6x4T/wTLpxx779yr+rcQm3bEsP1c=;
 b=+DuVX7oE4RCPiYQGpnQqgid4IbHskXplR5CNkndbRbOU35Ue9fWtCCRylq3hUjj7Phztr5
 C9fLz/J7+g0QTpDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5 5/6] drm/i915/gt: Set stop_timeout() correctly on
 PREEMPT-RT
Message-ID: <20260923142702.I8mInjdQ@linutronix.de>
References: <20260923111518.310430-8-dev@lankhorst.se>
 <20260923111518.310430-13-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923111518.310430-13-dev@lankhorst.se>
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

On 2026-09-23 13:15:24 [+0200], Maarten Lankhorst wrote:
> Also check if RCU is disabled for PREEMPT-RT, which is the case when
> local_bh_disable() is called.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

This looks familiar ;)

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
