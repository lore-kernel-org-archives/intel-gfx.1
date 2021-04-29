Return-Path: <SRS0=0ugA=J2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BFDC433ED
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 13:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7700613CA
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 13:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7700613CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E83E6E25A;
	Thu, 29 Apr 2021 13:23:53 +0000 (UTC)
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95516E25A
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Apr 2021 13:23:51 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id 8so33336435qkv.8
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Apr 2021 06:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fMuf05EbKkiM1fYlTbBaoSQbeyTAsojaouBxLvsi2EA=;
 b=WncPvvBNREcf4vHe7safJKxLVpOGG2/FflD2pWj2jzLxL8nMr8STVepuOPGaUJSgBz
 nkxLMlnMArIvxxTm/aKmv9rP8HC/0ik8PImMfR+FzQ2oiTOFfthJTeircHSa6uiyYv/m
 HG1Xf+IohVH64dDUxqFFGaTAcZKO0+g39qbVdgnQ7zTfUE7z3tz1/OTFPPNmZBTtwKXc
 +LvGRpEFsUN1aMRhHYBlEGYf+1E2bDSRgdmNR6oKNQU/OXHlzl5SuLGbOeeheYFSdfAj
 1FnKkBQ03cO9hd5R+2bwEtcu3ajGIb5jBfsSNQAvGPzTntv3upie00IY46tHruEn1Lxm
 T4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fMuf05EbKkiM1fYlTbBaoSQbeyTAsojaouBxLvsi2EA=;
 b=lc7jeGce9quR/q9J89k3duqM8041mDkg0iaz4qp1YM8L1dhfFaTH4dbYcO0ZZVXcgZ
 JCUPcTZS7qgPRtRwg90kWyXbR39+yoDzdsxnbL4zAWy8Ah0f1kTGNur1MyiqozEDrQlB
 q9L5N2RhGATA5y2LyqcSuIlFmWmB1XvW4gAEFas3gD3wXYT3a0z3K5hc+QFP55d2queH
 Y8BG07lq2SrGvzGFp3r6p58QbzZSl5JnxhEbWHj8xuGa6wn6jmYm9nl9m8nMvN4Gs9J3
 BxHz9cCbINgOWXp/HIHBR2jhF8JjD/HEa9W0fGU4hlLS4Cqk9gpk0FhbTaxO2J+M9exP
 UK0Q==
X-Gm-Message-State: AOAM531tfRmTmFIpL0Z6bwp/4zEdU6ii+OoL/dmiynEz3D9gBPNlnLdR
 RFVu9SAmnlqe1l61en7ahbnAy2Qn9VcqIXQYVj0DIpNeSBQ=
X-Google-Smtp-Source: ABdhPJwEFqtqcexFYR6LgHnjB1VWddVrz34AdWqSn7YSUbgBAgdc4bFQAHSIoQwgBvhS8Kox7FMlEgecCRBXLyi30G4=
X-Received: by 2002:a37:58c5:: with SMTP id
 m188mr33851837qkb.327.1619702631092; 
 Thu, 29 Apr 2021 06:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210429101036.1086461-1-maarten.lankhorst@linux.intel.com>
 <20210429101036.1086461-3-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20210429101036.1086461-3-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 29 Apr 2021 14:23:24 +0100
Message-ID: <CAM0jSHM1ZKhuHtu-bZnSA=uL-ZLJpocmb0cpgt=rcFZfA1bf7A@mail.gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915: Add ww context to
 prepare_(read/write)
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

On Thu, 29 Apr 2021 at 11:10, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> This will allow us to explicitly pass the ww to pin_pages, when it starts taking it.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
