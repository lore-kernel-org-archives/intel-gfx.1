Return-Path: <SRS0=a3P7=L6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F632C07E96
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Jul 2021 09:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B3A16198E
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Jul 2021 09:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B3A16198E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D971289D02;
	Tue,  6 Jul 2021 09:14:06 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3DC89798
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Jul 2021 09:14:05 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a13so25156725wrf.10
 for <intel-gfx@lists.freedesktop.org>; Tue, 06 Jul 2021 02:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QQHReVgbAJM94wLZUFz0+eSyiiaxRNfGcxI1kidBsY4=;
 b=EfjHF9NxvF6Q0vKEcHqWXTa8ZY6zIncQI42xcXAk+fOEp61jEumZfjXNZKUtS9oqf0
 ngwBDmZJeNRe2Osj45Dqc42m/r+VV3CNRmyH49P9IZ1GLkjcCffMX3BtSYhsLGYEoK5R
 AEa9IsrMi+WOA9lWvDN8wBuC0W0MNrwsPThnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QQHReVgbAJM94wLZUFz0+eSyiiaxRNfGcxI1kidBsY4=;
 b=EB8Y/IDu2rizyRVxrEN6Xkb3HPSIvqQcvIe/mzJTDv2fjZYFotYAOqNdWj9GL7cT04
 taQt3pssM6rB/YAgdbgy0sJh0Iag34zi9+T9egk3gZFOB/OB8Xul3kFG/u3C/4JSh4i9
 PwfFTGS2ndFQk0MFV2MbL5gbcJpv9qR6VY+Mcwk7MbWLtEUdl7zPAmBBKzyd5wuOPUeP
 0nb8srnSyQlPc0jlJnzk/nt6sjbdcguRqmBHWIwS5klkf6M2N7R0EHrwS4w8p56f5kVF
 2Mhct1g6n/ex+X3R5yueg/0IoeW802rCL9y4M9OoQYcE+Ww0yci7LvM1DBhukDEXYJBd
 fXIQ==
X-Gm-Message-State: AOAM532H1jbAsqOucvjx1UNfkJTlp5gl7QXsHIOQ1o2P6xVP6/qO99uX
 cI248EHk4rujXG7rmQm4igPZWg==
X-Google-Smtp-Source: ABdhPJwSH0WZYVAcJqNBugwSnIXzKVbQbP9dXqCscctgGgyl+9X471ZjNkfqSNzJk4xXG2C7o1LPGw==
X-Received: by 2002:adf:fd8e:: with SMTP id d14mr21363505wrr.361.1625562844454; 
 Tue, 06 Jul 2021 02:14:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r3sm13429872wrz.89.2021.07.06.02.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 02:14:04 -0700 (PDT)
Date: Tue, 6 Jul 2021 11:14:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <YOQe2fdqTzqyyV9L@phenom.ffwll.local>
References: <20210706090559.1589544-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210706090559.1589544-1-matthew.auld@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Subject: Re: [Intel-gfx] [PATCH 1/2] dma-fence: export dma_fence_might_wait
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Jul 06, 2021 at 10:05:58AM +0100, Matthew Auld wrote:
> It might be useful for drivers to annotate a path where hitting the
> actual wait path might be difficult or unlikely through normal testing.
> =

> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/dma-buf/dma-fence.c | 19 ++++++++++++++++---
>  include/linux/dma-fence.h   |  2 ++
>  2 files changed, 18 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index ce0f5eff575d..f2cd036b5243 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -335,6 +335,21 @@ void __dma_fence_might_wait(void)
>  }
>  #endif
>  =

> +/**
> + * dma_fence_might_wait - entering a section which might wait on DMA fen=
ce
> + * critical section.
> + *
> + * This is also potentially useful for drivers to call directly, when an=
notating
> + * a path where hitting the actual wait path might be difficult or unlik=
ely
> + * through normal testing.

Maybe also add a

"See also dma_fence_begin_signalling() and dma_fence_end_signalling."

here and a similar note the these two functions pointing at
dma_fence_might_wait()? I do like to link things together when there's a
group of functions.

With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> + */
> +void dma_fence_might_wait(void)
> +{
> +	might_sleep();
> +	__dma_fence_might_wait();
> +}
> +EXPORT_SYMBOL(dma_fence_might_wait);
> +
>  =

>  /**
>   * dma_fence_signal_timestamp_locked - signal completion of a fence
> @@ -495,9 +510,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool =
intr, signed long timeout)
>  	if (WARN_ON(timeout < 0))
>  		return -EINVAL;
>  =

> -	might_sleep();
> -
> -	__dma_fence_might_wait();
> +	dma_fence_might_wait();
>  =

>  	trace_dma_fence_wait_start(fence);
>  	if (fence->ops->wait)
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 6ffb4b2c6371..37bf4beed93f 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -370,6 +370,8 @@ static inline void dma_fence_end_signalling(bool cook=
ie) {}
>  static inline void __dma_fence_might_wait(void) {}
>  #endif
>  =

> +void dma_fence_might_wait(void);
> +
>  int dma_fence_signal(struct dma_fence *fence);
>  int dma_fence_signal_locked(struct dma_fence *fence);
>  int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestam=
p);
> -- =

> 2.26.3
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
