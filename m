Return-Path: <SRS0=maCC=IV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC2FC433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Mar 2021 10:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2805619B9
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Mar 2021 10:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2805619B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0491D6E88A;
	Tue, 23 Mar 2021 10:09:32 +0000 (UTC)
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315C76E888;
 Tue, 23 Mar 2021 10:09:31 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id v70so13697145qkb.8;
 Tue, 23 Mar 2021 03:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=brFLAs4ZmpZ4ezkH9aQuPcpMcvmSsqQiO68i32nNmTI=;
 b=B+cqypR4dopKNzyTDjAxBiXQrDXdNBqq469LGev1FueCgm5BstVTAeXEeYQKEtbZag
 Yov8dsWCHU4B8i3EZQjn/N+aG7XSKnaufr7boDryDqb5ey/sBIaIKDnmKEfdr5QEDw/t
 A0QEvIugsU/T9eA434SSGVOvpvH9ltFmJ4upNrEmvEXsNZQCC/xeJ+FN3p7gKqeOc4qJ
 6glkohBfArz/VBvNyVSUhlaU0QoHE9IjC/SBpZn9xuZFeSBjDg+58CjTOOctJT78fxxU
 2z8iED6hIj1BxyihBGhb/NIDWu+D2sy79n/FC9yfGq0WtGK7VWOmn5EmmTe429PeVjiR
 mHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=brFLAs4ZmpZ4ezkH9aQuPcpMcvmSsqQiO68i32nNmTI=;
 b=jLLK7sgIZ7PlJAGaoC/XdH+yhMBJlS4fVI1lGPwDHEL7JrO4hGktI6Vvh99SYt9cb0
 j0u6goONR/5yE5iNCgwuHw+gEFm1gd5rksHJ6LEKg+94I5eOoSpL5P2XfUyctez/jjtt
 gjaa5UIqOdor0SbDdEeg/W05LzNjFIOY0A6zNA07e6juRExcPY+NFg7qFLgEWBKmT4nO
 4Tg7O6E4nxC5o/sucU9xqa/WTqN1bGCu2yPElyzYDBtRwztop7ZMOvu1VapmVf0c51Z0
 onsRtPosbg8JovnU/gxYW9fXUkjq2u3aMpsI0ziDZ9VocpIDlM8drsv2Kpw6yDg+jruW
 Qkbw==
X-Gm-Message-State: AOAM531kNcTRHiPIRZ/STGDxYYv74boFpB+x1LiFSvPl9Cr2kYBd2coR
 Dwktsd6fXJDzwsuhRvLrjJL1mRJIZzXGqrivUdav6b5rlw0=
X-Google-Smtp-Source: ABdhPJyR+hr9P5TBw8wqB0EM+62EGVxUbPwPQHRgyFi1qTngvF7eaciM1rZY9ZUrqU3gsRQZtnzMshNr/ZG17icFwbw=
X-Received: by 2002:a05:620a:13ec:: with SMTP id
 h12mr4376404qkl.460.1616494170347; 
 Tue, 23 Mar 2021 03:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210318170419.2107512-1-tvrtko.ursulin@linux.intel.com>
 <20210318170419.2107512-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210318170419.2107512-4-tvrtko.ursulin@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 23 Mar 2021 10:09:04 +0000
Message-ID: <CAM0jSHOdStRHgwvJFtbdPjBdyK_xkCRQ7CxmgvfsceBLucDO6g@mail.gmail.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915: Handle async cancellation in
 sentinel assert
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, 18 Mar 2021 at 17:04, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> With the watchdog cancelling requests asynchronously to preempt-to-busy we
> need to relax one assert making it apply only to requests not in error.
>
> v2:
>  * Check against the correct request!
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 4b870eca9693..bf557290173a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -815,6 +815,13 @@ assert_pending_valid(const struct intel_engine_execlists *execlists,
>                 spin_unlock_irqrestore(&rq->lock, flags);
>                 if (!ok)
>                         return false;
> +
> +               /*
> +                * Due async nature of preempt-to-busy and request cancellation

Due to the

> +                * we need to skip further asserts for cancelled requests.
> +                */
> +               if (READ_ONCE(rq->fence.error))
> +                       break;

If the above trylock fails, I guess we end up skipping this? Maybe add
an explicit goto label to handle the skip here?

>         }
>
>         return ce;
> --
> 2.27.0
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
