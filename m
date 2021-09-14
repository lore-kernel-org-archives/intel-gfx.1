Return-Path: <SRS0=u2GV=OE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C82C433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 15:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6177A60EE7
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 15:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6177A60EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D817C6E4E6;
	Tue, 14 Sep 2021 15:17:50 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D956E4E6
 for <intel-gfx@lists.freedesktop.org>; Tue, 14 Sep 2021 15:17:49 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id s12so24646540ljg.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 14 Sep 2021 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ASAhUY+G41HZqeopdHM7aTSiw9njl3EyKHtj3rFVhDs=;
 b=ak1UeKaRxOfiClhnXWFlc5Tj5KPMuwNRFkYKCr7CwkblbA9Paw3cSpCmNNjhx8WlAR
 mQVYneNQpWpRsZWGMZ81ZIH34dZdZtDMUoN3cV1bET1XUla44MYMFwHm0OhiEQ8yDSmx
 qIaoPgDcted70DTDgGFCvmz8jNdMD5pdByWJCotfqt94eCEE9xwH05GjiwEKYbRedWR4
 30qkyVGox3STWReT2o7u8OHwQAuOXe+zFCSrKHiFssbja0kfMIeSsjW2Sr2fq8/kTIQF
 +/vCVb4lldH/n0uweX+WPK3fJki6M57mqQNhADYjgGtODprzhcTxJXAhbuz6QZRBBdd7
 OpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ASAhUY+G41HZqeopdHM7aTSiw9njl3EyKHtj3rFVhDs=;
 b=zYm7KbBo+Yx+TdtwyXGc7RsakUVnY9Uw4sUcskbTcg4XWe7BntP8laakkhK4/5g/nR
 0UgVCtV6amOParV3crL8TIC48SG6/Iv6L2AKJWl+hJxckWMPDzLLeyqGZzBREey6Pi5s
 GL1MLczAcWoxGuGk4rYbIC2gogatoSzUY8E9A8H2WcLY02biCT5HDite6f3qiFQ+9x7h
 dlSb9RHtn8yb0dvyFK7h4XiETfF2Pa9oB1mV2SpHA8msrf7nThAkC/EdaEjcmh+OZ+1s
 qTiZ4UzBIMnyjmF3WMLBXLnJ+VIhffgILD1mlzh5vdPHlTFyN/wnvxHE+R9V8MK9D7hF
 3uzQ==
X-Gm-Message-State: AOAM533yMe5D90Ey2z35g13mqIRGQYEwCwW1xVeVQcRqk7HpPJetScWn
 69ur3YGUGcCVOg1t4h2BG+ogjBMFIw5QUjAYeRSOLw==
X-Google-Smtp-Source: ABdhPJxrwrgQsvLdH3TFcygl7m8RHug7EOm+c31xSSPd1GollBX37JTf9f8IkkS/AT1bBnL51Z4Z9YyVU7EsQK1Cxs0=
X-Received: by 2002:a2e:99da:: with SMTP id l26mr15293313ljj.339.1631632667834; 
 Tue, 14 Sep 2021 08:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210824225427.2065517-1-nathan@kernel.org>
 <20210824225427.2065517-4-nathan@kernel.org>
In-Reply-To: <20210824225427.2065517-4-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 14 Sep 2021 08:17:36 -0700
Message-ID: <CAKwvOdmASG7XM5Lkv5aVttwQZkaLjm2jo+-BxBkG97h3hZ_Pew@mail.gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jason Ekstrand <jason@jlekstrand.net>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, 
 llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: Enable
 -Wsometimes-uninitialized
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

On Tue, Aug 24, 2021 at 3:54 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> This warning helps catch uninitialized variables. It should have been
> enabled at the same time as commit b2423184ac33 ("drm/i915: Enable
> -Wuninitialized") but I did not realize they were disabled separately.
> Enable it now that i915 is clean so that it stays that way.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the series!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/drm/i915/Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 642a5b5a1b81..335ba9f43d8f 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -19,7 +19,6 @@ subdir-ccflags-y += $(call cc-disable-warning, missing-field-initializers)
>  subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
>  # clang warnings
>  subdir-ccflags-y += $(call cc-disable-warning, sign-compare)
> -subdir-ccflags-y += $(call cc-disable-warning, sometimes-uninitialized)
>  subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
>  subdir-ccflags-y += $(call cc-disable-warning, frame-address)
>  subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
