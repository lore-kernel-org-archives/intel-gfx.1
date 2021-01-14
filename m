Return-Path: <SRS0=EqF4=GR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCEAC433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 14:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1691223A69
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 14:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1691223A69
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=etezian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DEB89FDE;
	Thu, 14 Jan 2021 14:01:52 +0000 (UTC)
Received: from 20.mo7.mail-out.ovh.net (20.mo7.mail-out.ovh.net
 [46.105.49.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D820389FDE
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Jan 2021 14:01:51 +0000 (UTC)
Received: from player756.ha.ovh.net (unknown [10.108.4.98])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id B358118F983
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Jan 2021 14:44:17 +0100 (CET)
Received: from etezian.org (213-243-141-64.bb.dnainternet.fi [213.243.141.64])
 (Authenticated sender: andi@etezian.org)
 by player756.ha.ovh.net (Postfix) with ESMTPSA id 57E481932B8FF;
 Thu, 14 Jan 2021 13:44:10 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0014b763843-cf93-48b6-b821-c6a6c132cdaf,
 72D3C5DAFF26A6515C48D523C3EFD44FB281F22F) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 213.243.141.64
Date: Thu, 14 Jan 2021 15:44:06 +0200
From: Andi Shyti <andi@etezian.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <YABKplEe6AFumR3x@jack.zhora.eu>
References: <20210113124600.656-1-chris@chris-wilson.co.uk>
 <X/+z+wPUkADDKCAd@jack.zhora.eu>
 <161062581173.19482.11361639362425651645@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161062581173.19482.11361639362425651645@build.alporthouse.com>
X-Ovh-Tracer-Id: 5382083032536826377
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrtddtgdeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughisegvthgviihirghnrdhorhhgqeenucggtffrrghtthgvrhhnpedtgfduudfhfeeuueejfeeihedtfeetgfegveehgfeuleelhfduteegieekudeifeenucfkpheptddrtddrtddrtddpvddufedrvdegfedrudeguddrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopehinhhtvghlqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
Subject: Re: [Intel-gfx] [PATCH 01/10] drm/i915: Mark up protected uses of
 'i915_request_completed'
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Chris,

> > > diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> > > index 0b1a46a0d866..784c05ac5cca 100644
> > > --- a/drivers/gpu/drm/i915/i915_request.c
> > > +++ b/drivers/gpu/drm/i915/i915_request.c
> > > @@ -276,7 +276,7 @@ static void remove_from_engine(struct i915_request *rq)
> > >  
> > >  bool i915_request_retire(struct i915_request *rq)
> > >  {
> > > -     if (!i915_request_completed(rq))
> > > +     if (!__i915_request_is_complete(rq))
> > 
> > 
> > >               return false;
> > >  
> > >       RQ_TRACE(rq, "\n");
> > > @@ -342,8 +342,7 @@ void i915_request_retire_upto(struct i915_request *rq)
> > >       struct i915_request *tmp;
> > >  
> > >       RQ_TRACE(rq, "\n");
> > > -
> > > -     GEM_BUG_ON(!i915_request_completed(rq));
> > > +     GEM_BUG_ON(!__i915_request_is_complete(rq));
> > 
> > I might be a bit shallow, but where is the lock here?
> 
> This holds the request->context->timeline->mutex.
> 
> The locking is basically split between frontend/backend:
> 
>   construction/destruction - under the timeline->mutex
> 
>   execution - under the engine->active.lock (coordinates with
>               timeline->mutex)
> 
> At all other times, RCU protected access (using the SLAB_TYPESAFE_BY_RCU
> so approach with caution).

Right! Thanks!

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
