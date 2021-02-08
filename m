Return-Path: <SRS0=Rx2D=HK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF57EC433E0
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Feb 2021 20:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54AE864E8A
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Feb 2021 20:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54AE864E8A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9216E9E4;
	Mon,  8 Feb 2021 20:10:02 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A216E9E4
 for <intel-gfx@lists.freedesktop.org>; Mon,  8 Feb 2021 20:10:01 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id i8so27236752ejc.7
 for <intel-gfx@lists.freedesktop.org>; Mon, 08 Feb 2021 12:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BZu8ozw8qstPbqDqXA6KssFvTevEron6dgsytjw/rXQ=;
 b=JM8xgr5CjuVZPvMWcPe5m/yXlTk8XRI4addOj79ldThNR0nnondpY5Yy5u+O93Mmb2
 x+LyUSjChrsXNiw6jVAXO/i860ZvM6TLyVdHebJZ90T+FgdDDQRJR30t8kK7XwrdWEmE
 We0hVfRRdAwJrGxWYNjrbcECv/7Q0QwIMEt0cPSG74gIC6ikcj9LKBetFVsNmfA2ZJQD
 CXO44uL4MqX6V+e7k2rSyyrkjb3k+xIWELvqjaRFm0U2HVt1/izwnIJ0x9jdxuXaU1eO
 fw9dovXDr5M7YLnQXlt80Ff7Tf4VJi7qDng+k4GWT7SzUJXSnBV6duGVWnTuIgNl5UPO
 kDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BZu8ozw8qstPbqDqXA6KssFvTevEron6dgsytjw/rXQ=;
 b=bwae4Ya2LKlx/6Gmh5t2JulL2g29zsE0jWzrQnaPhuZHk8lzjwYY/LikbPMy5L9lv7
 oBPh9MZ67Its6XutXPyMJYaGVWWnRi3TvhgfHCzyZ1M0Cv7ltvijQUTkOOCovz2WLQDu
 mB1fBcVxnIU9mXSMyqbRGR6ZJS4dnwpEAeikJSFUJaPMOZgu7ydKw3PM+F7iDcreBmlM
 nl45/8vTBRFOMXYUat5ggm2wPwQ6zLKAzcd+ySOoTN6CxxsOZ9ntzTY/d0RNcx8dGCFd
 NwBz35nUi++cAGPfOiFk8xcH205wxAU1yJoJmb8nYCOXtC1fhaXb9xHxxsFT0akNXwwX
 XQWw==
X-Gm-Message-State: AOAM531gJ2POs+VN928/M4DEXsKy6MEyji4SiS6JTaEXIW5oIWaFwbQa
 d7FYNxeF+W+WsTJLBlwpdqSB9jzGbyn0Se8UFCz2s9hS+6I=
X-Google-Smtp-Source: ABdhPJzu0qND5ZiTbVCf5tW4ZoKUb7OZPrjHO2pz6erDR7x/hzJo49DjVNgpkryPhJdEa+DCQ3Xjacp1y8FwppNSn3w=
X-Received: by 2002:a17:907:210e:: with SMTP id
 qn14mr19338138ejb.237.1612815000502; 
 Mon, 08 Feb 2021 12:10:00 -0800 (PST)
MIME-Version: 1.0
References: <20210119214336.1463-1-chris@chris-wilson.co.uk>
 <20210119214336.1463-6-chris@chris-wilson.co.uk>
In-Reply-To: <20210119214336.1463-6-chris@chris-wilson.co.uk>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 9 Feb 2021 06:09:48 +1000
Message-ID: <CAPM=9tyZDmAzaj9RmkbHsvDuE4+s7FjUjPSk2uAaZHmDW1gewQ@mail.gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [CI 6/6] drm/i915/gem: Drop lru bumping on display
 unpinning
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

On Wed, 20 Jan 2021 at 07:43, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Simplify the frontbuffer unpin by removing the lock requirement. The LRU
> bumping was primarily to protect the GTT from being evicted and from
> frontbuffers being eagerly shrunk. Now we protect frontbuffers from the
> shrinker, and we avoid accidentally evicting from the GTT, so the
> benefit from bumping LRU is no more, and we can save more time by not.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c |  7 +--
>  drivers/gpu/drm/i915/display/intel_overlay.c |  4 +-
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c   | 45 --------------------
>  drivers/gpu/drm/i915/gem/i915_gem_object.h   |  1 -
>  4 files changed, 4 insertions(+), 53 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 32ff9d201aeb..2bd04e631eaa 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1430,7 +1430,7 @@ intel_pin_and_fence_fb_obj(struct drm_framebuffer *fb,
>                  */
>                 ret = i915_vma_pin_fence(vma);
>                 if (ret != 0 && INTEL_GEN(dev_priv) < 4) {
> -                       i915_gem_object_unpin_from_display_plane(vma);
> +                       i915_vma_unpin(vma);
>                         vma = ERR_PTR(ret);
>                         goto err;
>                 }
> @@ -1448,12 +1448,9 @@ intel_pin_and_fence_fb_obj(struct drm_framebuffer *fb,
>
>  void intel_unpin_fb_vma(struct i915_vma *vma, unsigned long flags)
>  {
> -       i915_gem_object_lock(vma->obj, NULL);
>         if (flags & PLANE_HAS_FENCE)
>                 i915_vma_unpin_fence(vma);
> -       i915_gem_object_unpin_from_display_plane(vma);
> -       i915_gem_object_unlock(vma->obj);
> -

Why does this drop the locking here without explanation and without
reviewer comments?

Any patches from Chris that touch locking need vastly more review than
rubberstamps.

Dave.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
