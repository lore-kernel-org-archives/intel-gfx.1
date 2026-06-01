Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A62FCD6E61
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Jun 2026 10:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DE311314C;
	Mon,  1 Jun 2026 10:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Fh8kOxPS";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766D710E75F
 for <intel-gfx@lists.freedesktop.org>; Mon,  1 Jun 2026 10:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780309316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cbduX2ADEGxdwqbVWpmygVu5C4B36x/+bcdfT1PUUqQ=;
 b=Fh8kOxPSn/lxFv1d61cWQt17Jk0urX8ZaNGsAfu9uWwe0lAGNTqQOlLIeHNNezYO4GWOIu
 u+SBHytoVl6cGzI25wkg1PAeZ5bfWdQW85bo1m6LoNSKiaKZ/jvj8hLA+qn05r5TwQbweq
 7fQ45+ybHAsleAk64lKuiy4wniYwpt0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-Ktn2wD_kNU-fE3yAWFEhWQ-1; Mon, 01 Jun 2026 06:21:53 -0400
X-MC-Unique: Ktn2wD_kNU-fE3yAWFEhWQ-1
X-Mimecast-MFC-AGG-ID: Ktn2wD_kNU-fE3yAWFEhWQ_1780309312
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-49049100a40so61746445e9.2
 for <intel-gfx@lists.freedesktop.org>; Mon, 01 Jun 2026 03:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780309312; x=1780914112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cbduX2ADEGxdwqbVWpmygVu5C4B36x/+bcdfT1PUUqQ=;
 b=rz/7uYzVb0mqyByn3lrMpm2JYVssstv+ViM2PiTNOngwdTIvvawKA62/3mHQuZ9ImL
 ejenefx+6OL13T9mmhwed+6fmpcKGp6YGiog8jM9PtRDtzTQjBGbAQWXEim43Mr51F80
 QQkSLR0gaJ0SIplvLMa7XcBjtERa60QC3+rSFrheeeVYH5R6lDGkA8K1Wqfz7naGOpFp
 +CjGFWoP2/i9QO9HrQ8VbzInOYe1QmZPFzCIrId+p1V/GABwN35YQNcW3IEsGsl+FxE1
 FzhrzsnQyiR+NjiLRNgWvIRD3MRp3X7OImoBxvXrbSOeX8KHGHCnPIHzrR6afkC5WE5E
 vOAA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8hWjNhpUZVrpUsuBvYgT9CdRlUG0fjhuVphHoaMmUATxqxXu+inbvEfLWiMkwNsp/KefU1i4KA1q8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywvchm0z3LzY5/jFe7RtyN71iWhoT0Nnnr1oiBSKQhd8msmR6SD
 R4D5E3ius4w8c3dyQYr218mJJa/h9SNbvLnH3VnwrnoR5LAPUZEYXqoi/wAcOOYnNiZ6liCxTbK
 v40s17XboqDVwPFDhouv5yLBGShor5hQ+OjoaubZYENABVY8fbCp6mVNeTtyiMLRJcUoTrw==
X-Gm-Gg: Acq92OEDyh5vxZ6RKUaxCf9DL7lAj/iDMG5F6rupzsTxdbZv/CLshmJbvOl2FAnw0NS
 3JOu1iJiJRw845r+CSt329SXxmtr3NwUrOb2z+eSz47OvmS48bVmP6q/q+RrBpXPqj6+ANuZfW9
 2JDKwpFyQIe/tqDZ17k0UadtMoBKNTQnSaAnKHe/hQvXWLj0C8qu4KHu8VEfpPxiAqVbq0+CDLY
 2iSexi5rKgQZInOsWX6NeLSG9iTx2qNQMk9NbpBCvRIuADo/Jqjoq5sFRYvuQrxNsaTLlJnOoWj
 AX550So78EPin/dCgKUkaPTOldjvoPexoqLt1tp9uSVfZghLjb+a1+9+c1A+VsFl95rOT56LBkg
 GTBDMgaXqTBe0+qGZ5tq/VzvDROxKoYeM3UG2w+asBdCVGUlV7XZYfyvBsbeeo96+a2S+rEzIQ3
 5Jh3UL+QgZ6XOZTT4=
X-Received: by 2002:a05:600c:a415:b0:490:60cb:55f0 with SMTP id
 5b1f17b1804b1-490a292febdmr182719275e9.21.1780309311984; 
 Mon, 01 Jun 2026 03:21:51 -0700 (PDT)
X-Received: by 2002:a05:600c:a415:b0:490:60cb:55f0 with SMTP id
 5b1f17b1804b1-490a292febdmr182718675e9.21.1780309311464; 
 Mon, 01 Jun 2026 03:21:51 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d68a925sm366735475e9.2.2026.06.01.03.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 03:21:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, admin@kodeit.net, gargaditya08@proton.me,
 paul@crapouillou.net, jani.nikula@linux.intel.com, mhklinux@outlook.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 04/10] drm/appletbdrm: Allocate request/response
 buffers in begin_fb_access
In-Reply-To: <20260530185716.65688-5-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-5-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:21:50 +0200
Message-ID: <87pl2alfwh.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m_oLN4qZXxvxDkAX7gpnvwvdY--0pYnML-8P9qa-x0o_1780309312
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> In atomic_check, damage handling is not fully evaluated. Another
> atomic_check helper could trigger a full modeset and thus invalidate
> damage clips.
>
> Allocation of the request/response buffers in appletbdrm depends on
> correct damage information. Otherwise it might allocate incorrectly
> sized buffers. Allocate the buffers in the driver's begin_fb_access
> helper. It runs early during the commit when damage clipping has been
> fully evaluated.
>
> v2:
> - allocate before drm_gem_begin_shadow_fb_access() to avoid leak on error

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

