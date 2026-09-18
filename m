Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7039CC982DA
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Sep 2026 12:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF22D10F345;
	Fri, 18 Sep 2026 12:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="IYeh8Sg9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x+7fpiny";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF37A10F345;
 Fri, 18 Sep 2026 12:44:04 +0000 (UTC)
Date: Fri, 18 Sep 2026 14:44:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1789735443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QZP5tBBkkOAqMQq0aEdHcQ3gpe2t4aHXCIIvgdMWVbE=;
 b=IYeh8Sg9yG1HN4XHVa4C0uN+n0Ry6PPeGLNmSYVKffrpHktVuuekgl8V9nIqlr+tPAh+t3
 fjMMQNkVqL/20NkBGEvgdDdSYzVleFyudyKqXx1e3W++uEElaVXeB+6/lKG+HwWYzL/1Q8
 jBqUW54Msk4HOfXhpyJkoNNjJpNGqlBjbxrTnQtgiF14wq0d8+nIG25yXv9zhB3Dr1ZUaa
 0T3rQteoXTAHKXDox6QODuEQo+tQyhpBb6prXf16VBpC2LTI5hn6RY22Hx7+tY+IIspl0G
 JWdvj63U9oR0UA2MeLa/6Q+KN6jnRQGYKw6IQ3ma+FqzQ+mk5Rt/Wnd8qBHf+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1789735443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QZP5tBBkkOAqMQq0aEdHcQ3gpe2t4aHXCIIvgdMWVbE=;
 b=x+7fpinyKNPFIPHXXpG4ELrvT7sszLO3fDDzjs1FVGgsazNa79dCUSdixfkMe59rZNziXR
 ZFUXDNvXkkz61qDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: intel-gfx@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 drm/i915: Use %p for pointer formatting
Message-ID: <20260918124402.iotQ8TLn@linutronix.de>
References: <20260918103725.cfYzL1Wt@linutronix.de>
 <178973392516.181279.7948382320786706476@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178973392516.181279.7948382320786706476@61270ab9df2a>
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

On 2026-09-18 12:18:45 [-0000], Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915: Use %p for pointer formatting
> URL   : https://patchwork.freedesktop.org/series/174505/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_19175 -> Patchwork_174505v1
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with Patchwork_174505v1 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_174505v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174505v1/index.html

This looks unrelated. Halp.

> Participating hosts (38 -> 38)
> ------------------------------
> 
>   Additional (1): bat-adls-6 
>   Missing    (1): bat-dg2-13 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_174505v1:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pm_rpm@basic-rte:
>     - bat-dg2-8:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19175/bat-dg2-8/igt@kms_pm_rpm@basic-rte.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174505v1/bat-dg2-8/igt@kms_pm_rpm@basic-rte.html
> 

There is warning "A FIFO underrun" but the change is just print/debugfs
which shouldn't make a change in output.

Sebastian
