Return-Path: <SRS0=Ht+W=CZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AC7C433E2
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 17:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED195223E8
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 17:21:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6WSVNcB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED195223E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BFA6E063;
	Wed, 16 Sep 2020 17:21:04 +0000 (UTC)
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BD46E063
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Sep 2020 17:21:03 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id q13so4470158vsj.13
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Sep 2020 10:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YUqF1fbBlNEWIEdlNngXBWqtvOSZVw+yXBuzPhSPQ00=;
 b=a6WSVNcBttGksVBzWo0oFpxOfxONu2tHw7ETnjKYdL7XdsIbDP0DDyb03auA09Zf57
 nAAP3KIdRokQWpSJafSXhTpIlk9+HvrA7LOjU01EeRYI4gVAZs4ZCNW/tNO0gz0gKoES
 aPrk9qlc5RQFSRxPMFzXyI8pfZweyM9sFlGyLEVEXr8klGdfhEipurVFLGNjGc3OEH55
 KfJ4Pek6BsRc2rYtezVa8iCCAxjow4YFkqxKlUGKphedjIthHGua8YrwZVl7/uhFEyd/
 AOy0shBw1VF7DRqKOoRIQfUjQZoSr7M1fsb5/u1p02TcTZb5hliakaK2JHFVZmXnQK0T
 G2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YUqF1fbBlNEWIEdlNngXBWqtvOSZVw+yXBuzPhSPQ00=;
 b=U4pWS0FaelcA9j9rTIcNWSNti+5AeWePUHuCBOigQiGk1M8TPCNxeNw/XSZJI/w5R2
 RgoFAAmMuLKJ2H+fxW4NkPZ3JH2Rm2s6NB3eF4gQ36B3w+uNQ1167T1fJj2GNAxi8Rio
 QpYBA6QQmLdinsLXiPioRPnVJLCrV0DeLzD9de1washDFpOLG8GiLhbDMaoGqQMqFvXS
 ReMKDhnSTaMuLfo+MrVahLECgmNqv9iFAkFy8jtrDBJXza2MLK9xveA0fCgwn3JIVOLp
 X3PWsT+wQbfhQ9dNfNmogvQcLfNEtXJP8gz1Ld8M1FKmqJVPVut9mI4aEnK36UV8JM4t
 1wbQ==
X-Gm-Message-State: AOAM532gls861z2jl2pCbP7aE0d6Y753uIEl37fBamY3WvVHdUXGW7Zx
 kI2/EOH6WHV2JmHp8MZuaPYjZFwuxAkthbTxXZIjIDo5d6RKrw==
X-Google-Smtp-Source: ABdhPJxcvZuj6HE/Hh29FLFkugmkdbRPgmmMNQCRKGdKa9IR4K9H9HSMZ8sFB/2x6Rd+UgOSEkaP7cUB5qv5Xl1VcO0=
X-Received: by 2002:a67:b645:: with SMTP id e5mr1497921vsm.8.1600276862288;
 Wed, 16 Sep 2020 10:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200916094607.409-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200916094607.409-1-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 16 Sep 2020 18:20:36 +0100
Message-ID: <CAM0jSHPu4fRTMMMGuHoF9Xe_coUvVHE8K1bWMOgKcYiicpU_1g@mail.gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/gt: Signal cancelled requests
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 16 Sep 2020 at 10:46, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> After marking the requests on an engine as cancelled upon wedging, send
> any signals for their completions.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
