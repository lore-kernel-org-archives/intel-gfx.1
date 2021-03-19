Return-Path: <SRS0=R2gn=IU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1730DC433E1
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Mar 2021 09:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B919361929
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Mar 2021 09:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B919361929
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C626089DED;
	Mon, 22 Mar 2021 09:10:10 +0000 (UTC)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B776EA29
 for <intel-gfx@lists.freedesktop.org>; Fri, 19 Mar 2021 14:35:53 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso4947889pjb.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 19 Mar 2021 07:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0R7vCUqOiWqusGQdLDA2yAGdzDAYsdMM6CojvsuIllk=;
 b=dYE81wS7DSKdB7GyR7+XAISp1t5pL/zSDfGVzIkbDNtoK9UFhOBsBQloCz5aWC1JAw
 lb3M2Iovl8eVPmG9iOIr/YUjCSJAhPTN/g+p6UMu6/Y1VjFTY32AXsOmDiENYV+o4uYU
 2E6IrTuBArSyTrhCPYpg4mJiuwrSs7OAHvKo0A4CJV1bCBDO7aWZsxn8OtdcMNW1ZA7u
 S+elXIqViLr/nD7rTq4htiUkJ5lo2uGNeF21pedQKl0u5C8M9VsU/JvlO1Bjey6pA7C4
 ANLJaApZfubVYKU033BWxll74mz1LZeSHXGAp7PYpcEbxUnJW9WBOVD/HMYy5a3wMAlo
 KCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0R7vCUqOiWqusGQdLDA2yAGdzDAYsdMM6CojvsuIllk=;
 b=mYCG6bS+9W5wraUctvT0cz8bn6xLncITT0CSDqZTh3ouuFpwsXTZZD0iGECf7WpwQQ
 arExYQle9taHTMQkM3EqzXbXVO+kSKSlGwHoOG84am5WhVTxA5ihU+32Vy0t409nbaIQ
 +QFjY+XhQY/RNcC5V2Ih+TXI9rvi3XTtYevCuSXF921ZmTzPyHB116fWGZU59DA2okVB
 Tsvbb39BRS+eKs1CQDVhJNR7GptsGApxQsdipFmsjuzjgY7whQP4LavOOfiQmRaiS6C4
 3IGkjieK2TKmdgDnz3aZRsw3nSDwYf5X7OrcTk9s+BijeoG+P0qz89b/pPqUqhxJSHZ/
 xLpQ==
X-Gm-Message-State: AOAM5310Qp0aJk+lUlsjEQASD6GsajI4nWSpE4kIiFcK9GxNTG0J1SWS
 JrunEHtQYKT671Ei/YKi3bo16VnYIkKRbecgOtPggw==
X-Google-Smtp-Source: ABdhPJx6mz7QtxY42zHzQ4OwZrXSYkhmbs+ESa/8sPIZwAXqhmt9XhBi9MDQuYZrkn0CZzsEUeDWOtF7VrY+uzB9bCI=
X-Received: by 2002:a17:90a:4a8f:: with SMTP id
 f15mr10307132pjh.19.1616164552793; 
 Fri, 19 Mar 2021 07:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-9-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-9-lyude@redhat.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 19 Mar 2021 15:35:41 +0100
Message-ID: <CAG3jFyto=4U7wqtw92Escsu9cXGV=xD8SUKm_UUm7bRmYPUYxA@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Approved-At: Mon, 22 Mar 2021 09:10:08 +0000
Subject: Re: [Intel-gfx] [PATCH 08/30] drm/bridge/analogix/anx78xx: Setup
 encoder before registering connector
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
Cc: Torsten Duwe <duwe@lst.de>, Jernej Skrabec <jernej.skrabec@siol.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hey Lyude,

Thanks for the patch, it looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Fri, 19 Feb 2021 at 22:56, Lyude Paul <lyude@redhat.com> wrote:
>
> Since encoder mappings for connectors are exposed to userspace, we should
> be attaching the encoder before exposing the connector to userspace. Just a
> drive-by fix for an issue I noticed while fixing up usages of
> drm_dp_aux_init()/drm_dp_aux_register() across the tree.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index ec4607dc01eb..338dd8531d4b 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -924,12 +924,6 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge,
>         drm_connector_helper_add(&anx78xx->connector,
>                                  &anx78xx_connector_helper_funcs);
>
> -       err = drm_connector_register(&anx78xx->connector);
> -       if (err) {
> -               DRM_ERROR("Failed to register connector: %d\n", err);
> -               return err;
> -       }
> -
>         anx78xx->connector.polled = DRM_CONNECTOR_POLL_HPD;
>
>         err = drm_connector_attach_encoder(&anx78xx->connector,
> @@ -939,6 +933,12 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge,
>                 return err;
>         }
>
> +       err = drm_connector_register(&anx78xx->connector);
> +       if (err) {
> +               DRM_ERROR("Failed to register connector: %d\n", err);
> +               return err;
> +       }
> +
>         return 0;
>  }
>
> --
> 2.29.2
>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
