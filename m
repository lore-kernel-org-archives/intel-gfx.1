Return-Path: <SRS0=sv0W=IW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAE7C433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Mar 2021 07:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59550619E9
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Mar 2021 07:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59550619E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E935E89CAD;
	Wed, 24 Mar 2021 07:02:22 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FE589CAD;
 Wed, 24 Mar 2021 07:02:22 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ce10so31087087ejb.6;
 Wed, 24 Mar 2021 00:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4nP2sjxdIv+V7zOJ0GdZvSOpswpNmLx11k7HJ+bvJxk=;
 b=QvAU79pCBO+OQDfpn+xUY5yx++V0Ks5VP6K/O86bTfVDItoT42/06NiMeWV9tiei8W
 PVNx7w4yCT+TJKfioJxmgiMuUGKAp+jRwRBB9NRDpQsGvkdXeOYK09ZXqmp97mWdBv4W
 ZcICkmEpCRWPipZmcULSjDrmSAjPJWWa4Cq5/YTru2MWC1bVvfVaGeHNGwDyOxg/x6+8
 03RqjoglLfGjh1a3lVfLBNz/cqGrriQbcYYqApkc+zeav6Fr+jpm78Nr4lmWjHg0jRWA
 npRrPT2N9JMPRK18nv71TSlII4zkq5c+CJSheXTRM4w2EHKmWLzUXvkmzhfA4ZQ0DTdb
 806Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4nP2sjxdIv+V7zOJ0GdZvSOpswpNmLx11k7HJ+bvJxk=;
 b=FsNQw3v+lceccHDa5DvCO/uDUmGhIG5orKNLaaPd8PrKQlTw2nGq69Mbf+jp+H1lTU
 tAIRzJx1E+6v3lpqmKECTJKRiBKXpV7c3BYlR5jUP1yUEvuJaQIVKQEvo7pWMoWjDtmZ
 38VsXOf9at5mMqmsFJSaQ50wYB8MYiHCcSe392yudHGHHTmmXCKxZdvFQHLbPfKe721L
 XFhaV5DYL30eFEJg1dwGeY8Qb4x/dmVBPePQ6zf/ZfyqezZ7FU1hieWB93ceuyNT4xN7
 RG5jAUBX/95+aU8p3mu7QtPuyyZgDYjFCh84tdX3blonFGLjjvD46i1203FJLGWqNgum
 C8kw==
X-Gm-Message-State: AOAM530H4LyV440ZMyjhKcsn/76H/VSiBd48L/vYCnNbmBnnmrOvKLFg
 SeusTq1ZB2Sp8dB0S6sluaj1vo7C+AWbdUQBjklsDYxg
X-Google-Smtp-Source: ABdhPJwokLWdP5xYMSVLfBYxXbdntNqp0f6PT11epkzPIodULwpC23bGh6gmTKucCmzNm6zNQb3CupEPlTmURqzn/no=
X-Received: by 2002:aa7:c88e:: with SMTP id p14mr1662803eds.119.1616567579852; 
 Tue, 23 Mar 2021 23:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210323084453.366863-1-daniel.vetter@ffwll.ch>
 <20210323084453.366863-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20210323084453.366863-2-daniel.vetter@ffwll.ch>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 24 Mar 2021 16:32:48 +1000
Message-ID: <CAPM=9tyQ5=GWWPKzEYke4ARk0dNGqnZnpZAydXiM0nn0A8JxTQ@mail.gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/doc: Add RFC section
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 23 Mar 2021 at 18:45, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Motivated by the pre-review process for i915 gem/gt features, but
> probably useful in general for complex stuff.
>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Let's give it a try, I do like the future ideas of doing things with
gitlab issues as well.

Acked-by: Dave Airlie <airlied@redhat.com>
> ---
>  Documentation/gpu/index.rst |  1 +
>  Documentation/gpu/rfc.rst   | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 Documentation/gpu/rfc.rst
>
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index c9a51e3bfb5a..df58cb826d68 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -16,6 +16,7 @@ Linux GPU Driver Developer's Guide
>     vga-switcheroo
>     vgaarbiter
>     todo
> +   rfc
>
>  .. only::  subproject and html
>
> diff --git a/Documentation/gpu/rfc.rst b/Documentation/gpu/rfc.rst
> new file mode 100644
> index 000000000000..9d0ff2921af8
> --- /dev/null
> +++ b/Documentation/gpu/rfc.rst
> @@ -0,0 +1,16 @@
> +===============
> +GPU RFC Section
> +===============
> +
> +For complex work, especially new uapi, it is often good to nail the high level
> +design issues before getting lost in the code details. This section is meant to
> +host such documentation:
> +
> +* Each RFC should be a section in this file, explaining the goal and main design
> +  considerations.
> +
> +* For uapi structures add a file to this directory with and then pull the
> +  kerneldoc in like with real uapi headers.
> +
> +* Once the code has landed move all the documentation to the right places in
> +  the main core, helper or driver sections.
> --
> 2.31.0
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
