Return-Path: <SRS0=FGOe=O2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B164CC433EF
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Oct 2021 10:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56DDD60FF2
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Oct 2021 10:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56DDD60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D3B6ED99;
	Wed,  6 Oct 2021 10:15:23 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95116ED99;
 Wed,  6 Oct 2021 10:15:22 +0000 (UTC)
Date: Wed, 6 Oct 2021 12:15:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1633515321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PzhOopOiQjVdHREVS6WWzBcImsM1l4/BHgs/eCC4K8A=;
 b=INKg+7W3lD/dz477LrSHOsCpgAkDmDnXH2Mi+sKCBhlDyySVVpm6yV+VdMdsGQuX7IG6aV
 9VxaR+JwXShyfkhJZIez5dglkRIaB6tnZLxaTiclIrUzpTe9wX2Ah7o4jGJp4pwDayLWmn
 yr/ZTeStOZZ3bt34FRkIDtSAjyOj2vbK12Kcqwi4Z2JMWR775+temRALJ3l6NR1RJFlV06
 KXiWe4maPrxnUevd/Qa7jMRufDIZsdDXMs/cKXULxIhIFCj4QrMAtY4hc9myMeN+/iE+jq
 oXItle6E1byo/TsTY5zz0S9dOA4zrh/gmeYN8Ikz1WzhxxDmfq/VxiofHc3gLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1633515321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PzhOopOiQjVdHREVS6WWzBcImsM1l4/BHgs/eCC4K8A=;
 b=RuA3eqShVPUdwFcnCCvOUdpNpIb4II+09MBd70YnFE5PMLmXdRBu0IY/dhLr9pde+ahyIc
 jFe0WRRIQjbaOIAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Luca Abeni <lucabe72@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
Message-ID: <20211006101519.ffwg7u7epzl7dedl@linutronix.de>
References: <20211005150046.1000285-1-bigeasy@linutronix.de>
 <20211005150046.1000285-4-bigeasy@linutronix.de>
 <YV1tm8bNEBbPeU6/@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YV1tm8bNEBbPeU6/@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/8] drm/i915: Disable tracing points on
 PREEMPT_RT
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

On 2021-10-06 12:34:19 [+0300], Ville Syrj=C3=A4l=C3=A4 wrote:
> I think the correct answer is to make uncore.lock a raw_spinlock.
> Without the tracepoints deubgging any of this is stuff pretty much
> impossible. We also take that lock a lot.

Let me check if that works.

Sebastian
