Return-Path: <SRS0=NK3F=OH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D92C433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 17 Sep 2021 03:54:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA474610C8
	for <intel-gfx@archiver.kernel.org>; Fri, 17 Sep 2021 03:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA474610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3646E6EB55;
	Fri, 17 Sep 2021 03:54:32 +0000 (UTC)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC566EB55
 for <intel-gfx@lists.freedesktop.org>; Fri, 17 Sep 2021 03:54:31 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id s69so4626070oie.13
 for <intel-gfx@lists.freedesktop.org>; Thu, 16 Sep 2021 20:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Z2XZ+ejIq8gAO03IprEPqdCwXRdO4jg+APIYrokV1Ew=;
 b=Rp3rJu9n89T3K7fmu6SfCo1sN0C2kzBXotX3/AHB1rVwR61CApN5AJQnffzqEdrGZa
 QuNT6a3cQziXs7y6ZcFZciqSM5sr+buMhOIKWiDZF5/4+TnYqo4ChqsVNHYtTPrySMiN
 OQDxBfP2g600GDx4NeR9QHxbSAXLc+xB7qZ18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Z2XZ+ejIq8gAO03IprEPqdCwXRdO4jg+APIYrokV1Ew=;
 b=5nSFad06a+UDCqXvIyEU6nnPJAtl3FXhNj/oO1r93hxE4YdRpgExM4Re/hzavm+zO6
 0veE2Ks2MPbr8/SbcCb5xEt9WBLTy0+0EcRjSp10Epem6a0yc8KZOCyTkwxgsN6a30k9
 ag8ntMwOFv+GZrCc+kNWRJ/LHzI5nAJLGDwLBE1zGIrEmzbJnFynmVz6NID6S35jVDBM
 6DsnJjqpfto/6qB8j4Y+LBPoTGCrGVZ/HFCfV+Y4nwtR2Zv1GJQ9UCeL/BVln5ZIdaiY
 psWe1jtTsddPrpPBdQX3kHVBH1p8tcNV6e1H6HVZCDOGTGlsmiEQrl0MqMqtJtmvIrbQ
 7jxA==
X-Gm-Message-State: AOAM5314TF0tqaETQ2gE0HbKpcY/zssVJsapd2NhQ3XhiUpYOjmjcx/s
 cPPuwW60yMNVNQORM8iEBtFS/tQomVBu1wY+hCCEPA==
X-Google-Smtp-Source: ABdhPJzIXD5SaZh+FXg6/yC/JnECSczMBKqtkOdgIhgZufWgdBqAqD2dAboj1EodrmE90IHtcOhantUU8qDNKURFel4=
X-Received: by 2002:aca:2310:: with SMTP id e16mr2471632oie.64.1631850870446; 
 Thu, 16 Sep 2021 20:54:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 20:54:30 -0700
MIME-Version: 1.0
In-Reply-To: <20210915203834.1439-9-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-9-sean@poorly.run>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 16 Sep 2021 20:54:30 -0700
Message-ID: <CAE-0n50Yh+e_jgZ=H=YFV--ojYqqoDJTeqv6iz6vdSWhx6JJLg@mail.gmail.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-gfx] [PATCH v2 08/13] drm/msm/dpu_kms: Re-order dpu
 includes
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

Quoting Sean Paul (2021-09-15 13:38:27)
> From: Sean Paul <seanpaul@chromium.org>
>
> Make includes alphabetical in dpu_kms.c
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-9-sean@poorly.run #v1
>
> Changes in v2:
> -None
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
