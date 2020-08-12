Return-Path: <SRS0=eb9m=BW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9976C433DF
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2020 00:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BB4C2076C
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2020 00:12:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jt8w7KS0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BB4C2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67DE6E871;
	Wed, 12 Aug 2020 00:12:08 +0000 (UTC)
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FD86E869;
 Wed, 12 Aug 2020 00:12:07 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id q3so399624ybp.7;
 Tue, 11 Aug 2020 17:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ANisI7MawC30nrIBSjMSXLgYwLyr20x+LoTvwdtr3Sc=;
 b=jt8w7KS0d9R8I0y6qYP7BXoLqMunGTkSfoLt7r1G+NWD3l+RBKwXgk1IAA53wxCn/b
 cBWmSGimcl2Z7wRaumBNoisfrAz4a6QcDFhMXBWZjlO7d9igL9SLcfSzABjiNgpPo2dw
 fbCEOvssdKwkVwxt8lcU4gD/7+sIrwGjJKUApqWqSTqXkHoEfK+4DMyNi1xWH20fXfgH
 k5klOKWtNP95qArhsmn0ZgmZ72PzkVxlwfNeqpcA6BkJyt5JNDbVV/wIYPXPFFIYese3
 uCFXrugVDiTa3rj3JguNOm9ukexFC7V9xjdOn8xSw9wTy8n5k3dAx4dMgsG0jab/JpeF
 il0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ANisI7MawC30nrIBSjMSXLgYwLyr20x+LoTvwdtr3Sc=;
 b=eXTZrIC263JY9oOGNxQEEfcg9Z69duJabP+g87AuCsgx7v7NrngqQw5kKMoEk/YQ7+
 NH4OtPf1nQ/fg7+DqtS4M18S08sTz7xkQ2cGQGcC90JLouqiDWQjpBcDZCXpHlNXJQ/H
 RgxGW86YV5xzLsLE+5pGdLN2Ru6isbRmtC0x57QALKGJhhzxGBeLOYlLwdq8+jbHEGuV
 TJJxX5Hh6iP7o/mVGFXSaQ8EurfV9oFcRYMAnaMbONSEbECxGWo3ifQOR3opBTktO//5
 XwMokDnK/99d/W2fK9ihqRvjEi2vlpZZr83ezfyKlexelY6oAdlXx/tUhD78PpiBjqE2
 46Gw==
X-Gm-Message-State: AOAM532mXbT4AZ3/ttWh5v3ebIGDFINEqLZZNtFEyyDxKuOOBpp5pSNP
 xCY6YKoyyuU5W/buW2gLln94hm+C92kQr8IaeVQ=
X-Google-Smtp-Source: ABdhPJwxJMEczs4u6ViJWr7Vt+u/2jmPSxvj3eAufTe/uJ56YXuOqV5u5G89FcccuYXQC7MGZw0EbpSDkyhLVL23HLY=
X-Received: by 2002:a25:9c01:: with SMTP id c1mr26221367ybo.83.1597191126680; 
 Tue, 11 Aug 2020 17:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200811200457.134743-1-lyude@redhat.com>
 <20200811200457.134743-11-lyude@redhat.com>
In-Reply-To: <20200811200457.134743-11-lyude@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 12 Aug 2020 10:11:55 +1000
Message-ID: <CACAvsv6HZpgSC=gyJa_HyWLYAd70GefPp9j10ZOZ07CDQ70phA@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [RFC 10/20] drm/nouveau/kms: Use new
 drm_dp_has_mst() helper for checking MST caps
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 12 Aug 2020 at 06:06, Lyude Paul <lyude@redhat.com> wrote:
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_dp.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> index d701f09aea645..bb85d81c25244 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -44,7 +44,6 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
>         struct nv50_mstm *mstm = NULL;
>         int ret;
>         u8 *dpcd = outp->dp.dpcd;
> -       u8 tmp;
>
>         ret = drm_dp_dpcd_read(aux, DP_DPCD_REV, dpcd, DP_RECEIVER_CAP_SIZE);
>         if (ret == DP_RECEIVER_CAP_SIZE && dpcd[DP_DPCD_REV]) {
> @@ -56,19 +55,10 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
>                 return connector_status_disconnected;
>         }
>
> -       if (nouveau_mst)
> +       if (nouveau_mst) {
>                 mstm = outp->dp.mstm;
> -
> -       if (mstm) {
> -               if (dpcd[DP_DPCD_REV] >= DP_DPCD_REV_12) {
> -                       ret = drm_dp_dpcd_readb(aux, DP_MSTM_CAP, &tmp);
> -                       if (ret < 0)
> -                               return connector_status_disconnected;
> -
> -                       mstm->can_mst = !!(tmp & DP_MST_CAP);
> -               } else {
> -                       mstm->can_mst = false;
> -               }
> +               if (mstm)
> +                       mstm->can_mst = drm_dp_has_mst(aux, dpcd);
>         }
>
>         return connector_status_connected;
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
