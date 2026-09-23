Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8D2C98302
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 14:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C062B10F0DF;
	Wed, 23 Sep 2026 14:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="Q0jbMzL4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MSuIFuOn";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7567E10F0DF
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 14:27:29 +0000 (UTC)
Date: Wed, 23 Sep 2026 16:27:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1790173648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ebK7tpidbnUNnloCxx9cKA11zOnukdGDKHVYcAIpvLM=;
 b=Q0jbMzL4lbDyHQ6HaZ0wG8WWdaMgj5kF2iK2bh40UsJb5jq2z9sR2AAnovhgROhs+Ik6lx
 Rz79fZ5hb703Y6QnIVMEC/E8mC0oduUW6KKNHJV+HzhEMGZcJkNLp+V9Dz4kpZddmr/Unr
 DCrj3sdDK1dJeZFXlAiyMfbx7VuQx8gq+dmaEJya27FiTDVIfGLwzohaOXzxTq1IKqAq3e
 D48mlXgG9HE1vvMNnPcmCsOtQlKIjsrPTQpXjRwABoFyGgKTNu1MXo1iJvf/Dva2c7u50P
 Aj9nyhIR8gJTQa2CAjoNkC9T5cqrPqEusrP+Y0TNyXl5NSAZGW2Rj8oUt+L2Bg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1790173648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ebK7tpidbnUNnloCxx9cKA11zOnukdGDKHVYcAIpvLM=;
 b=MSuIFuOnIpJTvdOxIRaJg/6A1ht9yZhl662tZBy5Mw0oGwpMb64KcuY93oZETqL/4DpXyU
 Ve3YTifE3EgNotCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v5 6/6] drm/i915: Use sleeping selftests for igt_atomic
 on PREEMPT_RT
Message-ID: <20260923142726.LlwKVINw@linutronix.de>
References: <20260923111518.310430-8-dev@lankhorst.se>
 <20260923111518.310430-14-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923111518.310430-14-dev@lankhorst.se>
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

On 2026-09-23 13:15:25 [+0200], Maarten Lankhorst wrote:
> This makes the i915 selftests slightly happier, especially
> related to GPU reset.
> 
> All of the i915 code that used to run in BH's, IRQ's, etc is
> converted to preemptible code when compiled with PREEMPT_RT,
> so adding coverage for those situations would require
> 
> This is a better approach than trying to convert all locks
> in i915 from spinlock_t to to raw_spinlock_t just to increase
> test coverage for situations that no longer happen.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
