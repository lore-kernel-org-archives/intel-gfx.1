Return-Path: <SRS0=NK3F=OH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FAF0C433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 17 Sep 2021 03:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C6E8610A4
	for <intel-gfx@archiver.kernel.org>; Fri, 17 Sep 2021 03:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C6E8610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D776EB47;
	Fri, 17 Sep 2021 03:53:53 +0000 (UTC)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70E96EB4C
 for <intel-gfx@lists.freedesktop.org>; Fri, 17 Sep 2021 03:53:51 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso11109069otv.12
 for <intel-gfx@lists.freedesktop.org>; Thu, 16 Sep 2021 20:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=si11JPg2tUx3AsVeQ/TovCztnetl7T3psWWpp1fS5lA=;
 b=DZOnQvfjYVw2eK0gwNwwxEXWEm5xLno5eGrvLjhgQGrgMCGhtM4kv/W42j9sLJbi3O
 pcEBZnF0iu+0HiMKill8pmsE1UQpkECyjgiq3K0ICvlL6rldHZyw/e152XjZ/43P2ZnG
 mzjiCCe9lkGDxEZvO+/SMpdWDYkRwaGvJ8SB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=si11JPg2tUx3AsVeQ/TovCztnetl7T3psWWpp1fS5lA=;
 b=q61cHAms4YgWmdIlpE8s5dLKjVU4A6xzmbTlpFvYrstFuznPhZrJLvQNEEKO0cSwpH
 jqI058EGMPrH12aFt1LVJ2OKdzggjtU1CWPEkClgJUA7K7FvZ04f7dsqXvEdQbaoSvHJ
 uSVsHZBKymeI+DbPCVUT+cMsb2YuEuo/GvJvGXa7SnQXSEJtl4m5iDXb1fF66w9i8Mz9
 tntk/Exr07WHv+wbi72wvUtX5Sjqop8iNY0UhXHbXqA1u2BjRXsHD5vES1JecZg5x2qm
 hj+DZAsTpSQD4RD2iDEfOfZa/HcnAiIWwjkKnIz1o9PsynkrZo034NQKtonK2LEBIpV8
 XDLw==
X-Gm-Message-State: AOAM5306S3vy3LXI1h1Aqsu+lZdTUSERVFFkjpOGvrw7+UaeDp+Aw6m4
 1TdNEJYtkWrQMcHboug6Gq6IMj9EM4cO1JB9PQe6Rg==
X-Google-Smtp-Source: ABdhPJy6tPkXKq2HM2Xabj28+m9bCyAX8hcbLJrNjiL+b85iLZXT99WZxbBBCWiIknpSoYbGwM1DrBLiHpKljB+xkBQ=
X-Received: by 2002:a05:6830:18c7:: with SMTP id
 v7mr7659104ote.126.1631850831069; 
 Thu, 16 Sep 2021 20:53:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 20:53:50 -0700
MIME-Version: 1.0
In-Reply-To: <20210915203834.1439-11-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-11-sean@poorly.run>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 16 Sep 2021 20:53:50 -0700
Message-ID: <CAE-0n53uAEcj8Rpx36cRUU34k9mqtg2_tiXW_4+CYmrcihguHg@mail.gmail.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-gfx] [PATCH v2 10/13] drm/msm/dpu: Remove
 encoder->enable() hack
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

Quoting Sean Paul (2021-09-15 13:38:29)
> From: Sean Paul <seanpaul@chromium.org>
>
> encoder->commit() was being misused because there were some global
> resources which needed to be tweaked in encoder->enable() which were not
> accessible in dpu_encoder.c. That is no longer true and the redirect
> serves no purpose any longer. So remove the indirection.

When did it become false? Just curious when this became obsolete.

>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-11-sean@poorly.run #v1
>
> Changes in v2:
> -None
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
