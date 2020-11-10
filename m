Return-Path: <SRS0=/3Pa=EQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97329C55ABD
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2020 14:08:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A01221D46
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2020 14:08:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="HV1vFSLa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A01221D46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCF089ACC;
	Tue, 10 Nov 2020 14:08:52 +0000 (UTC)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABEA89AEB
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2020 14:08:51 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 10so3129729wml.2
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2020 06:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=RHr39ngr2B+98zAW9jkqgki28PWEHHD7DNBOpDOqDEA=;
 b=HV1vFSLajmjs7V264buCdkrOFNMsf0AR4R2hGN0vxaEboCaCkqKyTt32hrxiJaCQ6a
 xpaCGLcM4OxSX4xZjVrRoIWK17F9mTjWLKImBON99/hUj5iTEMC+GZGqicywHlFP4Z6g
 yPiVnDaCenDdW1OUxo3QB8QeHLBHTT1pCWbQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=RHr39ngr2B+98zAW9jkqgki28PWEHHD7DNBOpDOqDEA=;
 b=gB4J2TMOBxsqKg254s6RjKPbropJ8Eptvzqb/DuOoor+SvVnbFo36I6ma5jeNBs539
 GPXiXBZ9F3BsaYsEzj07rYtE1+8AjhbJXZpsA4IQwel1n8h5FtfAV7PuYq9bbROB1C1C
 mG3sB0JOubCivy3+6SR5IkC9lU+bCSIKKmuAe1VxVHcbzSOj66OK3H6ntnngLdqP4oYF
 kPV6IP2O53erqrQXdVJ5ySwhFBRalULJ8eGyoEyjI9fhok3yvG2/B5/55DVR6XxNz+dR
 Di5vg6HTEOhI+ckwaQNmifGsacA36wPWNSGuq17vWZToy8qlmHWHQ8n3aCiXddBPS+B5
 dODg==
X-Gm-Message-State: AOAM531p93rR3z2pXHFeGAQeE8WEaksxA2lowIpvHgwaxQ3gZVyjjoIT
 BFiuxjQViytd8d8v+C6hgUbEUw==
X-Google-Smtp-Source: ABdhPJzk1WfduW7a7nXeRjJ0/LZCZ0FXcXwBYE+Pjgm1rOGjGVBG+u8E0OPSh7xm+PDQHm5FFQFHhw==
X-Received: by 2002:a7b:c242:: with SMTP id b2mr4985003wmj.162.1605017329923; 
 Tue, 10 Nov 2020 06:08:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t23sm3073142wmn.4.2020.11.10.06.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 06:08:49 -0800 (PST)
Date: Tue, 10 Nov 2020 15:08:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Deepak R Varma <mh12gx2825@gmail.com>
Message-ID: <20201110140846.GH401619@phenom.ffwll.local>
Mail-Followup-To: Deepak R Varma <mh12gx2825@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20201105173646.GA41732@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105173646.GA41732@localhost>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Intel-gfx] [PATCH v2] drm/vgem: replace idr_init() by
 idr_init_base()
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 11:06:46PM +0530, Deepak R Varma wrote:
> idr_init() uses base 0 which is an invalid identifier. The new function
> idr_init_base allows IDR to set the ID lookup from base 1. This avoids
> all lookups that otherwise starts from 0 since 0 is always unused.
> 
> References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")
> 
> Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>

Applied to drm-misc-next, thanks fory our patch.
-Daniel

> ---
> Changes since v1:
>    - Changes suggested by Daniel Vetter:
>      1. Correct typo in patch summary
>      2. cc intel-gfx to get the patch through CI bot test
> 
>  drivers/gpu/drm/vgem/vgem_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
> index 17f32f550dd9..2902dc6e64fa 100644
> --- a/drivers/gpu/drm/vgem/vgem_fence.c
> +++ b/drivers/gpu/drm/vgem/vgem_fence.c
> @@ -233,7 +233,7 @@ int vgem_fence_signal_ioctl(struct drm_device *dev,
>  int vgem_fence_open(struct vgem_file *vfile)
>  {
>  	mutex_init(&vfile->fence_mutex);
> -	idr_init(&vfile->fence_idr);
> +	idr_init_base(&vfile->fence_idr, 1);
>  
>  	return 0;
>  }
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
