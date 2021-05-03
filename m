Return-Path: <SRS0=mvB2=J6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB73C433B4
	for <intel-gfx@archiver.kernel.org>; Mon,  3 May 2021 17:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C941860230
	for <intel-gfx@archiver.kernel.org>; Mon,  3 May 2021 17:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C941860230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488826E14B;
	Mon,  3 May 2021 17:01:26 +0000 (UTC)
X-Greylist: delayed 456 seconds by postgrey-1.36 at gabe;
 Mon, 03 May 2021 17:01:25 UTC
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870766E14B
 for <intel-gfx@lists.freedesktop.org>; Mon,  3 May 2021 17:01:25 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id B2F67580552;
 Mon,  3 May 2021 12:53:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 03 May 2021 12:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=M
 sqyRimXY3XqCOEklJF7m9X85ugMYqBbaG8HDHYoI44=; b=gBqu4QfUbh04ILRSn
 3yCeS87M1JDw2hIzK4kEHDRC8KtcVA0m1Se9c1mRHCbeIEcUx0xdGatUzInAw3h3
 XCtsqSOZ4CKGyc6VUZMTydPFITS/KjZbCgLCEaqArGhCBAw0KvmnU1V8igGtabV8
 t6x1uWW609qnbxCKcc5maXyJ0s1M5PeAvacRO9UEvydUXLB4kUCHZ4k/RBz4y1fe
 DpxPWVKyyADiERUd5VX1kX2798DdzZlm46KKzSMXxCHidWrUkFssWeYeiwprfyYF
 NXQDuT83IakUhcq/RtoZP7Pr86wZWMpldRljczQS1WyCrfapdcEIE9eBW1GtciHb
 KM/Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=MsqyRimXY3XqCOEklJF7m9X85ugMYqBbaG8HDHYoI
 44=; b=aiKqP5zwxStOyvmTf96V84t7QaEoyMP63zFgbFuoRY1u32LQVpoqkCvSJ
 sQb8oU/0JVL05lLi6Szx/0BN83Yen/AgdlQe9LjOFT77ZW4E0YSuVCqruHaVJoVu
 OpMy5YtS7mQLr3heRMa+l+h2GBr5TQ4nkSwOWChEl/vDD+FBdzoqcX2E6BfMmAcm
 OTh8op4cBxCb8bzOsWgo72dLSuR3PAJf731oNexmXzmE4RcQNWqN/64EyQ6UVoA0
 hNvIZTMuv21iWHOSQR5+Wb5OYjoGuPleiDWR5RuxUkIUSgau1siOWoNXxOdld2DO
 nL+nmerySJQ35QYDTCuX4Wl3TD0Og==
X-ME-Sender: <xms:mSqQYFfe53HHBwkwYiatYFvxVo3V4GsxE4SjulTfkGVx14OYv9tSAQ>
 <xme:mSqQYDPxpYMrsDQKz4Bs6Bdjn1YbRfihFR0DLJ0b_xG8JZSUj5LvXat4NUZLgReeC
 hbZIkuhj3l5Zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgedguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefirhgv
 ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpedvff
 fgueeiuefhheevheetgfehvdefgeekfeevueejfeeftdetudetiefhheffvdenucffohhm
 rghinhepkhgvrhhnvghlrdhorhhgnecukfhppeekfedrkeeirdejgedrieegnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhho
 rghhrdgtohhm
X-ME-Proxy: <xmx:mSqQYOjcv7B7N5B6pp3hvzCsUJQPv0P79PhhLqbNUQh3J8aXqWw7aA>
 <xmx:mSqQYO_q7LxFV8Ii6XPuPr2Ck0KZ3k1q4yZPrq5zeONoTj1QryI2mw>
 <xmx:mSqQYBuGil4ogjAp1gTbCuz5SdQzLPSt_Asfz_xz3wCQHG3Uwjw48g>
 <xmx:miqQYHKlXgOmY--MMFOxU-8xt2xFkpaaSHwK9_C1T_ouvPtIxxl6ZQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon,  3 May 2021 12:53:45 -0400 (EDT)
Date: Mon, 3 May 2021 18:53:43 +0200
From: Greg KH <greg@kroah.com>
To: Imre Deak <imre.deak@intel.com>
Message-ID: <YJAql6Vstj7wY5Wg@kroah.com>
References: <20210503164001.GE4190280@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503164001.GE4190280@ideak-desk.fi.intel.com>
Subject: Re: [Intel-gfx] drm/i915: v5.11 stable backport request
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Mario =?iso-8859-1?Q?H=FCttel?= <mario.huettel@gmx.net>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, May 03, 2021 at 07:40:01PM +0300, Imre Deak wrote:
> Stable team, please backport the upstream commits
> =

> 7962893ecb85 ("drm/i915: Disable runtime power management during shutdown=
")
> =

> to the v5.11 stable kernel, they fix a system shutdown failure.
> =

> References: https://lore.kernel.org/intel-gfx/042237f49ed1fd719126a3407d7=
c909e49addbea.camel@gmx.net
> Reported-and-tested-by: Mario H=FCttel <mario.huettel@gmx.net>

You also need this in 5.12.y, right?

thanks,

greg k-h
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
