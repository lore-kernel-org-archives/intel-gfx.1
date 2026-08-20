Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB578C5DF85
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2026 17:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E47610F124;
	Thu, 20 Aug 2026 17:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Be3T+p6m";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CD210F11F
 for <intel-gfx@lists.freedesktop.org>; Thu, 20 Aug 2026 17:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787245503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
 b=Be3T+p6mFPfn5YcVDRQG2CTD8jYXC1m/QI14N6v0z2Suy97Ou/5AV8Mlfx+Yz+DuEII7D6
 hs+wBoZ4O4hvmcm27JtziryF4Yq2/xiHoaKlEa7LzaolwrJVDX9R+R3Ku8lQBpe1XyZ8N3
 hdLCWQHgz3whNb0tpqBArAFqfzPNBt4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-yvXltl_eMhyxUSerfNUMBA-1; Thu, 20 Aug 2026 13:05:00 -0400
X-MC-Unique: yvXltl_eMhyxUSerfNUMBA-1
X-Mimecast-MFC-AGG-ID: yvXltl_eMhyxUSerfNUMBA_1787245499
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-496b6f97676so348995e9.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 20 Aug 2026 10:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787245499; x=1787850299;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
 b=b/GNQB2yr3WBP8r/7WwHchZ5dj1+CpFrnif/0QppDtM4EzlQwGhtx8ImEZNA9dGCAF
 tHrNGicdhmLC1A6CUR0wOc/XSoBVE9tf/UIAJu1uYvt0HD8RTBpNAkLDdZK/+bj5DX+j
 EtQiVT0f1IcP0CiL4x3ox106hYj46aOerZ7SHS0QFPxNQy2dQywj3LBR+N85EV9BYpXV
 /K6UV7RZVbENXCo93KHsKCqbDTkCMEDlUiJFfvrBDh/wwaUnYEY2S10cjIS2CmNCDsi8
 tNxBMHh/GgetUSYsSVsp7+MW0E7Ecwpa/Fg7SSSNNfU8IogKqScf6sPnVr7wOWL9Yx42
 Ycrg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro71dzO172Xg3WbDs2aR2y7NZwGX2GkgahyVG3n8rosImI/CuxGLqKoWQUng6jpZB8iTqTyJe5U/wM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy6un6wpa4a3f4kYcBWw3HXSjPSf80mkLSllF7kSFkV1yjpyy6
 5aJGeYPz0zEKKL/902Aj9cdNMKoZlgkTWv2tneVp7Ny/IJ7KI7u24vDC1+4jfXUe0d/QkCiUOyr
 +vdv+dElV7ItaM42JV5AIJ6gIFx15TNOWbG3b95pNxCGTwJiNe+u0WQhKsRNPj0j4/E+sgg==
X-Gm-Gg: AR+sD13v3tMj7euIHkKSdPP9zmdQ4btnXDLL2hNdqTEaHjZyxbMiwF1U8e85aEiXx8d
 q8xU54+ETi+kffm7B/3l9ET2EK+tVtGtZk8p1U9/Y3SSTY3Se2aOZsPff95EFR/UQ2zw6VrGayx
 soIf1EEgrCXjnfoG06Cd5QKWwZVHS+r8XWHRRSsgYQiD9dIANBJb/o4exBk98C3n6dBc6SGaDib
 /xjISwaDB/kYRdIZHk0r5fH+CfDGqUqzJblJsYZZjLv8Hl+YIedrThGICG7/tUy3Q2lovHVTlmK
 xiVmxvnZo2+ZzJKb23sug2kwGwPIflS7Fa9zg/woxA4P1JoPktuD4DGLHXDf24+KVlaPqiBNQoC
 CfvOnuEqpra63eoq24ywzd2o9R5ZQc3VhJY65Am7RPxvR7w==
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id
 5b1f17b1804b1-499b8465f7dmr5016915e9.10.1787245499080; 
 Thu, 20 Aug 2026 10:04:59 -0700 (PDT)
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id
 5b1f17b1804b1-499b8465f7dmr5015695e9.10.1787245498659; 
 Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb?
 ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14c33b3sm13157002f8f.27.2026.08.20.10.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Message-ID: <cb784cf6-f3d8-41aa-9f71-c197a5eba7f2@redhat.com>
Date: Thu, 20 Aug 2026 19:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] drm/panic: Return -EINVAL if font is not available
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qfMayplo3pOkimwh9cfxamnKfOLbe23zvEWZHOFst40_1787245499
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> Font lookup does not allocate memory. Hence reporting ENOMEM on
> failed lookups is misleading. Report EINVAL instead.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 705b72bf0d83..96d238bfceee 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -757,8 +757,10 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   	int qr_width, qr_canvas_width, qr_pitch, v_margin;
>   	u8 *qr_image;
>   
> -	if (!font || !stream.workspace)
> +	if (!stream.workspace)
>   		return -ENOMEM;
> +	if (!font)
> +		return -EINVAL;
>   
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   

