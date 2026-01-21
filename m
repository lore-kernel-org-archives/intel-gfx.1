Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FE4C4453B
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jan 2026 13:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A7410E7BC;
	Wed, 21 Jan 2026 13:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="EOtzZ+B/";
	dkim-atps=neutral
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D2F10E7BE
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Jan 2026 13:47:48 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 0A16B33FB66
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Jan 2026 13:47:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1769003266; bh=uYTf2tQSx2DIJi0JwknLpK4w6u6cYJIPjQSQD16Dlh0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EOtzZ+B//TrWCAMQ9wrzM8F4S6iRuIw3ytesEcc7kZQZqAi/aU9VWKO/RQBLmHpfl
 zhlNvYaE/JyDYYUlBaitFuNXSEKXZiheHFmisCMSNwb3F+6QIvZd0RyALFNzVfuGoq
 l/JKrp+t4pxK8iCOg9cU6h9SoXeHoQEGPFKhTH6916DeGCddlQEszhuK5j+ta5nLjT
 ZpbAf8vf8L/9G/KlkIK4YIzYV2XYo7qxsaNrM51449B7cvfr18ESzVqj1S1v3yFmDk
 E+Wg9Y8PynW7Rqbtx9iWFXKowJG8pXWrVri4ojUBjMVk//i6oytIGGN/f64Ee9hErG
 yRj8hbwT9IbRg==
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-79275e61c2cso62347007b3.3
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Jan 2026 05:47:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWYRwsn8AOKXWLdozLuH+obYMlCI1cBbeCasx9wg53kGAfJnBOy6RoBhJTIE8xktfurnMbh+Ao5FLY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOJn0jY+d1myUarLnRzn50szizNv7Hmt5Z2cKQamIkfMFptsrz
 M1aQ1wYGsWn/p51fZ3fn2ZkG78S4y1B/Nv+oGSOnlRxirX6ADIi1eTtJOpYtXQhKhLnFsbq654W
 4802P5AdmHva0lpyOySm8asYDOlbN/JE=
X-Received: by 2002:a05:690c:f03:b0:787:f72d:2a5d with SMTP id
 00721157ae682-793c66adb28mr149552197b3.2.1769003264625; Wed, 21 Jan 2026
 05:47:44 -0800 (PST)
MIME-Version: 1.0
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
 <20260106-atomic-v7-1-d51d9a351684@intel.com>
In-Reply-To: <20260106-atomic-v7-1-d51d9a351684@intel.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Wed, 21 Jan 2026 14:47:33 +0100
X-Gmail-Original-Message-ID: <CAFZQkGzQ3GmUHibTJS2xCWsya2=Bh_Uo8zjqN5f_K4HMdfpHCA@mail.gmail.com>
X-Gm-Features: AZwV_QjJqwbQ9zapV1vWIkTbS9UceQz_gcqvByDuD4HZQNF1NHEqx_meGIOHXP8
Message-ID: <CAFZQkGzQ3GmUHibTJS2xCWsya2=Bh_Uo8zjqN5f_K4HMdfpHCA@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] drm: Define user readable error codes for atomic
 ioctl
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

> +       DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,
I don't think it makes sense to have an enum value for this, the
per-plane support for async pageflips should be reported to the
compositor in a way that doesn't require atomic tests. Once that's
done, trying to do async flips with it is just invalid API usage.

> +       DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPP,
Same here, there's already a drm property for async-capable
format+modifiers on each plane, so this falls under invalid API usage.

One more thing I noticed for the failure codes: I think it would be
better if INVALID_API_USAGE and unspecified errors would be split,
with the latter being the default error code.
Afaict with the current version the compositor would be told it's
using the API wrong when it's just a normal test failure that the
driver hasn't added a more specific error code for yet.
INVALID_API_USAGE would then just be for actual "you should know
better than to try this" cases, which should never happen in correct
compositor operation.

Other than that, the API looks good to me. I'll put together a KWin
implementation soon.

- Xaver
