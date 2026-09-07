Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68380C79F99
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 21:01:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0140D10E4E6;
	Mon,  7 Sep 2026 21:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E4srLzoR";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0456D10E4B9
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 21:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788814864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=km54XNA3pesnlH9MUSOEbKUzj91GMmwN/4bvXZLN1Qw=;
 b=E4srLzoRT2lSFcaQysiCLk/7gYWQXXHBWble0pc3yRK0BKbcUWXlkkenZdQBdblXltv429
 aq23hN2ImYmLgJhVNpUkK9ErT/FV8Sa0bc3WYo3Bf/cgSD4jChuPK5MW4huzJs8Xh8G3m2
 v2U/A6AYyGRGC393cggcW25+9qGapb4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-PyBtYueePXCJigTdGZQI3Q-1; Mon, 07 Sep 2026 17:01:02 -0400
X-MC-Unique: PyBtYueePXCJigTdGZQI3Q-1
X-Mimecast-MFC-AGG-ID: PyBtYueePXCJigTdGZQI3Q_1788814862
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-485866e0066so2130383f8f.2
 for <intel-gfx@lists.freedesktop.org>; Mon, 07 Sep 2026 14:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788814861; x=1789419661;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=km54XNA3pesnlH9MUSOEbKUzj91GMmwN/4bvXZLN1Qw=;
 b=Ok0P7PiZIBa31ZU2nWfpDHPo0VTCpaAg2dEtsgoI/m3Upns38r93xEubD+GRnKj+Ky
 RsQRLfR6RXUL54sPCLiBggeKQImLyI99FprsRDeSjBmiKtQ5N4oZVkK03ui0EDUq+6X5
 Ey7UR7pWIb1N8uPrp6mpqDwY/qVbOFgptGc/wYITioG99JU5KarO1e3bumAOKJoh/5fJ
 Uqz0O0u+j6V4ihbBQdemwgPmfWeO6LvcAsNwaIvshVYpg+8BfDUFjo0uKpz8fU+r+ikF
 cVDddh/e7KUzIwwMn+TRXDo7LZAyUMtX7nK6YXjEY5GbGngsqZjrGFgJKFAbYpfjoSUf
 aFaw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzWojQDV3edQ6maRo1OK0VsKIX/Yf3aUooYZze5GrPoGOosLgXVT1ttkbOuSoSGMMUXuZoM09K8msk=@lists.freedesktop.org
X-Gm-Message-State: AFuF++nBahAkLq6R0Q/g+hXARZlNEkIyBGnXu+GVQ7miPpy7M4fl1WZE
 Wptf6XgXzFPyxIibQIJTSA6uhRbrm7xRq35syfZ7VZnHmm1/rqhcQClEFJdmUqRlikedlGX685R
 wTFfd5VIVVZYpTdv0PSTB/FqvS7u73/oEqJcpylD/yodABwUqPuUrwjwc7Vu2DLtYbBiz+Q==
X-Gm-Gg: AYBFou15SZxoxAmtPyB4A46LDa2BMpcZq84Gu1oIkZ9f8ZHpYu/QMtPaBFM45dinEpe
 X9OWNVVPfPGYunVg/p9odiHs01ydvb+KAFT0PCJrE7vfqkjBh8945ER/LnNhdi7Tf+ndAsrPAxF
 hzxT3KGu1ZaYNSsKrTL09FgQRdRLaZAPyJvIjEXQh8x665TseaKkFh6TCGNr5Xi2nH15OXrKROP
 L7xyNqnErkph/vWYc63H2DFGOK022XcuZlB4Hav8m5miCaW23HhIqGSgZPg6w7LxmhSINJSF2F+
 DBeeSYamlk+Bx7D47j17Rh9WI1950uKyDpdS1WGWBKohofp1lcLxZWiufMhM/yX8K1C0mHGCBj1
 gNPc5ytKFowfmgS5WSMZ1pl/KN/v0K4CE0Lo6RBRQdbzF4TYS
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id
 5b1f17b1804b1-49cfa20cd58mr167275075e9.33.1788814861700; 
 Mon, 07 Sep 2026 14:01:01 -0700 (PDT)
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id
 5b1f17b1804b1-49cfa20cd58mr167274945e9.33.1788814861409; 
 Mon, 07 Sep 2026 14:01:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9?
 ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7703cefsm458086515e9.5.2026.09.07.14.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 14:01:00 -0700 (PDT)
Message-ID: <b34807ad-6390-4804-ba29-43a407b3d9fb@redhat.com>
Date: Mon, 7 Sep 2026 23:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] drm/panic: Do not use un-escaped URL as format
 string
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, stable@vger.kernel.org
References: <20260902121930.597222-1-tzimmermann@suse.de>
 <20260902121930.597222-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260902121930.597222-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aNr0lPR27aPLBP6LDhHULDUCVB0-uqw4ZH0fCI1AEEk_1788814862
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

On 9/2/26 14:13, Thomas Zimmermann wrote:
> Replace the direct use of DRM_PANIC_SCREEN_QR_CODE_URL in snprintf()
> with a %s conversion specifier. Avoids a possible vulnerabilty from
> a crafted URL string.
> 
> As the attacker needs to control the kernel at the Kconfig level, the
> potential for an exploit is likely low.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.12+
> ---
>   drivers/gpu/drm/drm_panic.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index e576c4791861..ba21df4be338 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -658,7 +658,8 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
>   	char *kmsg;
>   	int max_qr_data_size, url_len;
>   
> -	url_len = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&z=",
> +	url_len = snprintf(url, sizeof(url), "%s?a=%s&v=%s&z=",
> +			   CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL,
>   			   utsname()->machine, utsname()->release);
>   
>   	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);

