Return-Path: <SRS0=NK3F=OH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E96C433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 17 Sep 2021 03:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F2D660F21
	for <intel-gfx@archiver.kernel.org>; Fri, 17 Sep 2021 03:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F2D660F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07076EB4C;
	Fri, 17 Sep 2021 03:51:55 +0000 (UTC)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3418F6EB49
 for <intel-gfx@lists.freedesktop.org>; Fri, 17 Sep 2021 03:51:54 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 k12-20020a056830150c00b0051abe7f680bso11172335otp.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 16 Sep 2021 20:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=eC8WWm0GB9m9+OiTXjvJDwwJ4bOx9YsGIUwSquTEdkE=;
 b=leXlvUp4wCgJ+WDoSlsI5mfKEeObgFzMYEyDUeRToizAqmkwRLhzsTBxrdEHJ1LdYD
 F1jlqshs/rFCIBHW6i5CscigoTLiIEwaxQ1O/7w84B5WqXaa6JB05tIBgBGUouTzY+BZ
 5ngRCTCyGAVKY1/dVw68vCIPuKawOTvBfu5lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=eC8WWm0GB9m9+OiTXjvJDwwJ4bOx9YsGIUwSquTEdkE=;
 b=5BTxT8ylTnXNLYdVp9HcuZ4qfbTfV7M9fAKKN/OdjQM0JFqXoHlDMoxZ2bm823k7xS
 +l674UpzVEQcM5PbwRGwgr4U2XECgjnFolwSrgs+O+dMEe1xbwch80qYE1b5tlfhPj3r
 S54Iucjy1v4o14mYCKAoI2oU+eftZ/NP8a9UT67kkggAkYSSMpZumrBqgOuaqGpvRpb7
 PcrvSvbCArqw011Z1Q6SvMh1r9FTmzgdM+YxhTcrYbYaBDWCwfv3F094WpKpaAv/FFbV
 yp5h9cPgMTBPyncDzHJEAV0JhN1OCcV1rDE5zEnONsKFiMle4Bv1RJED4T5KnyFxg7q1
 t0nw==
X-Gm-Message-State: AOAM532X6xeevBABDmYm6yN8mAofqbBtbd0Y9G8eMYsWt82L6XRdu0Ek
 2ZZoQCoV2AVUhvm8QvsvTKp5FJSu0FNs2oLcM9pMpdE6U4M=
X-Google-Smtp-Source: ABdhPJwb+CAeP1LbhPRSrTra9NOvhp96+APdALmb4BWvnUD6hxz1CMABXqTRzuUhf7PFT5ityKS48rAG+XuHAMo+ZcQ=
X-Received: by 2002:a05:6830:719:: with SMTP id
 y25mr7534615ots.77.1631850713468; 
 Thu, 16 Sep 2021 20:51:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 20:51:52 -0700
MIME-Version: 1.0
In-Reply-To: <20210915203834.1439-12-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-12-sean@poorly.run>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 16 Sep 2021 20:51:52 -0700
Message-ID: <CAE-0n53jiiasodgaat9jJPifxGg=mNo8vewzORdBB+ZVd3VXTw@mail.gmail.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-gfx] [PATCH v2 11/13] drm/msm/dp: Re-order dp_audio_put
 in deinit_sub_modules
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

Quoting Sean Paul (2021-09-15 13:38:30)
> From: Sean Paul <seanpaul@chromium.org>
>
> Audio is initialized last, it should be de-initialized first to match
> the order in dp_init_sub_modules().

I don't really understand why the driver is written with all this "get"
stuff but sure.

>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-12-sean@poorly.run #v1
>
> Changes in v2:
> -None
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
