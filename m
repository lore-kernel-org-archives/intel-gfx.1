Return-Path: <SRS0=u2GV=OE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCC3C433FE
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 01:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3030561151
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 01:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3030561151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BC56E2A3;
	Tue, 14 Sep 2021 01:23:40 +0000 (UTC)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5846E301
 for <intel-gfx@lists.freedesktop.org>; Tue, 14 Sep 2021 01:23:39 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so16052984otf.6
 for <intel-gfx@lists.freedesktop.org>; Mon, 13 Sep 2021 18:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=QApNJaQ+4zf4NOG0NQxMwjGWEI23AT3h/AkJ/g+8Fgs=;
 b=B5Ou/+YkeYt3m8Q4F5zkxmBu02DaZz1pg/FLbUK/u9KR9D6/RBSadeL749BhJffFZS
 ddZSGbKbX7mjHwLeAJm9SOVnxFLF3RbBLh30gTW/tmeDg4J21yw/L3DWCT0XyVA8IKYj
 MObgqrM+4P5HiRWPev07GLPN4TATag+/AXGAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=QApNJaQ+4zf4NOG0NQxMwjGWEI23AT3h/AkJ/g+8Fgs=;
 b=njEBP2UlBG3OV9EtZk09NrJ9kmmgtTgG4vwHxDFdsNjXzMosZlBMNYkGiwYtqb2tqf
 Azevd4GVVImnRyRwQCu7JRYaHNmGQULFZg4BGGS8+m1jG0PjRxDqKXsUTuRJdnRKElCS
 ovP6bB+8NUXuV6Jm1NT8nBIcjEyqH7ezeoh1OIZwR7EPmcis4ty/VGlrJs1S0mSiSQLL
 6zKNd5k+c2eBoN+G73gpM8MPLnG/PQsO1mxBqkl8mb9kqBmkyOFZI0ls2ec34eC9BJvu
 cpFixgRBAOA6fw+jZtfpnQCLrz1u3YgGJj4PePiPhpL4FiW9ekH7G4/gFEuTDXbeGeja
 iZGg==
X-Gm-Message-State: AOAM530+oDhTJxliUW595P8sZb9PrV6opXN7TAgct67J07k/0sqLHKbe
 MnLjjtolSwbNTPKHMEt6ArEm1dYIH/OyuGwPxyUl+A==
X-Google-Smtp-Source: ABdhPJz81mU20V2tbBwEn6dAUEH0d4iWsffBcpOJ1p+/Gm0extfrRrbnhXl70N8M3Fw8rJM5F/QFgiqaOkCPoiRYZeo=
X-Received: by 2002:a05:6830:719:: with SMTP id
 y25mr12251836ots.77.1631582618692; 
 Mon, 13 Sep 2021 18:23:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Sep 2021 18:23:38 -0700
MIME-Version: 1.0
In-Reply-To: <20210913175747.47456-13-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
 <20210913175747.47456-13-sean@poorly.run>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 13 Sep 2021 18:23:38 -0700
Message-ID: <CAE-0n507ehHX3FHDUjvsdNRXHvNUM4YRNYuE+PN=PrZb+94U+w@mail.gmail.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-gfx] [PATCH 12/14] dt-bindings: msm/dp: Add bindings for
 HDCP registers
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

Quoting Sean Paul (2021-09-13 10:57:43)
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 64d8d9e5e47a..984301442653 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -21,6 +21,11 @@ properties:
>    reg:
>      maxItems: 1
>
> +  reg-names:
> +    const: dp_controller
> +    const: hdcp_key
> +    const: hdcp_tz

Perhaps we should drop reg-names and assume index 1 is hdcp_key and
index 2 is hdcp_tz? And then make them optional by having minItems: 1 on
the reg property.

> +
>    interrupts:
>      maxItems: 1
>
