Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD88CD98CC
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Jun 2026 10:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0855B10EE03;
	Thu, 11 Jun 2026 10:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hESG0yP2";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12BB10EE03
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 10:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781172694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8J03CxoywVvGkdqDT93IzLl+xZxTV2J8FpCDOD6Xyq8=;
 b=hESG0yP22EjsOuceMxmvHq0try/hmvXON1cklcBWSDb3jed8sWkNNGrJ0Vn9f7umH6sygY
 Gz/I6kSciv/yt8nFX7fOvZTY1LILN3Ew4Jd2oQO+cWl+gga0Pl7JeSH0A/I1PyG39rZHug
 7lmwe0HqxiW8OJ/8Ii9fhq77GsO6Odc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-UmsANVcvPHKTV7fWXSh-og-1; Thu, 11 Jun 2026 06:11:28 -0400
X-MC-Unique: UmsANVcvPHKTV7fWXSh-og-1
X-Mimecast-MFC-AGG-ID: UmsANVcvPHKTV7fWXSh-og_1781172687
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-45ef697092fso4890458f8f.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 03:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781172687; x=1781777487;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8J03CxoywVvGkdqDT93IzLl+xZxTV2J8FpCDOD6Xyq8=;
 b=pPD0dL7XRySuZa7eEzeTNO94zEZ5r8O8RWnJwL94OZbbEYmrYeR/kt0cVkaX4K0g2p
 0dIhmt85/8OmxJpm6sYU4ryujdQVdGTJlJ6rZNRHNIMPS9MhQWomqP0/i1qJHrTbO7ul
 5DokGOxawERgFlRFYM0BNnUmrVJZfGCec2XWa0f+FvITfxONizJLHG0yTQO8Ko4iPGnd
 hRic1bmLs0vbvV8ccg2IDeHDL4KrHDVkSqkehjMsFvaUTRBspAVg9wVzihBtTqAlY17P
 eQN9Y9M0LgzUuzJaFW9yO3C5I64np3h0xoXX0BR4f3wwVp2Pc3k3LVYHioE0SIx0xw+R
 pEPA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8YSJW5yCo59Hp2qbnC2++3tMXun6LgOymEj3Annaau3+TGwJu730MRRSrndGJGxfwBlMCOcmfhwL8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGczBIkLjN6an3dI2UTW09cERAiCo/A/xqMpfEW21QN49/tUX4
 J7hTPEuCZXXQ2sk/OjMmiXeESILSKCJYpAAQ70NmC/L2fZtnXHhDr9nJ4prYqLHLOfjFmzyW8uj
 TxvTGHmPaojFQulqCKEzpJpgQcYSmewpQPTiZMn4DC3QM9GxZ3MEV8aAHh+WnnbxEKHvNJQ==
X-Gm-Gg: Acq92OGeiI0ok4Q0sB7SPNny05p2TwGES4f1NlICFY/9dPRvaB3iU3vJmdEaJZrKBq5
 bT4UtbSVVtVs94igKYUqgkqKRbxlG2tZH06s1UO8j21hmxq8UZeotUJkBIPaoLqU08LEL02fSwA
 md9F65qWz83gFo/0UR2RMkzGRSgRZYbuyBuREIDTYNc2gEZarH7rexbvHazt11FDj5DkO13D49g
 M6GAq/h7wde3Fo6h2RE9Xt0tI6K0bMUYyMVoIdIxYk7BptH674GBWVJSs0u5osXl5T6deUZQm83
 Y9Pqqpes+rpALmWM+bAXWhYf5gi2kBiVD66gVvaWHdC0qYGnMtzIZJtuEh2DvgxpnCK/dmLDDFX
 tiAXQguAiDFsW9fREyOAV53HC884Fp2jaw3nt/sfREuFfal40kDxV8rwJ/8pUcCAkgBG8qUt5nM
 bNXXx1xIwvtZSIhOo=
X-Received: by 2002:a5d:524f:0:b0:460:3233:bee8 with SMTP id
 ffacd0b85a97d-460677b28camr2150165f8f.40.1781172687215; 
 Thu, 11 Jun 2026 03:11:27 -0700 (PDT)
X-Received: by 2002:a5d:524f:0:b0:460:3233:bee8 with SMTP id
 ffacd0b85a97d-460677b28camr2150129f8f.40.1781172686816; 
 Thu, 11 Jun 2026 03:11:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2e4b18sm63288157f8f.10.2026.06.11.03.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 03:11:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, admin@kodeit.net, gargaditya08@proton.me,
 paul@crapouillou.net, jani.nikula@linux.intel.com, mhklkml@zohomail.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org, Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v5 02/15] drm/i915/display: Handle struct
 drm_plane_state.ignore_damage_clips
In-Reply-To: <20260610152505.260172-3-tzimmermann@suse.de>
References: <20260610152505.260172-1-tzimmermann@suse.de>
 <20260610152505.260172-3-tzimmermann@suse.de>
Date: Thu, 11 Jun 2026 12:11:25 +0200
Message-ID: <87v7bp5quq.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OzfhJ_2hxREAjcgN8H1ttCwyXdI7nqug_WKoon4cbNg_1781172687
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

> The mode-setting pipeline can disabled damage clippings for a commit
> by setting ignore_damage_clips in struct drm_plane_state. The commit
> will then do a full display update. Commit 35ed38d58257 ("drm: Allow
> drivers to indicate the damage helpers to ignore damage clips") introduced
> ignore_damage_clips to selectively ignore damage clipping in certain
> framebuffer changes.
>
> The i915 driver does not modify the flag, but DRM's damage iterator
> will soon rely on it. Calling drm_atomic_helper_check_plane_damage()
> right before drm_atomic_helper_damage_merged() guarantees that it
> has the correct state. The i915 driver does not do this elsewhere
> so far.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to ignore damage clips")

Same comment here than for patch #1. I don't think this is a fix.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

