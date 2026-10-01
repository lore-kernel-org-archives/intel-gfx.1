Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C658CCA5FE7
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Oct 2026 20:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E51810FA32;
	Fri,  2 Oct 2026 20:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I/atsHNg";
	dkim-atps=neutral
Received: from mail-qv2-f40.google.com (mail-qv2-f40.google.com
 [74.125.230.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1374010E251
 for <intel-gfx@lists.freedesktop.org>; Thu,  1 Oct 2026 19:30:11 +0000 (UTC)
Received: by mail-qv2-f40.google.com with SMTP id
 6a1803df08f44-917a3545923so19337956d6.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 01 Oct 2026 12:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790883010; cv=none;
 d=google.com; s=arc-20260327;
 b=mQ4+ZgOiZtpeL2idA7/8QRzMrWGgc1tbhXENhMxTHdnNCkLt7KjAxnyO0SKKkQGL7N
 sQPU94jhs8+AlaT6AASrH9kHJa5vmKcwNM5wnQ/xJ7oGpXQ5sX6jExVkx+NbTVy9vo/P
 OucUhOkVSZOeU4DGTdOyRkMId5nllOZ07nYZ3jpQp67s7vbd1x7gB/Ngc8CjL3yZL18Y
 LHeFki56ud9cdK1uIqIOSRTQnRjxq91LPu2Dvz8wp0mUIzgGqYNwW4avAym/a+t4CmaX
 X1r3zqM1ublTE0C9DZiw2Y9OK3io1G5t7aTey5OkJzVoYU0enWFvWZJGuQZ6gyh5k+Rc
 A1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bE/ZpayYaMuQJ2cjUw/XMionGOYmv8DuAlly9njYYE8=;
 fh=R5Cp0tVThynaWCz8D7NK6fm7Xq1jedhB2IDOKMfbWRE=;
 b=CHM6kAx+FNZkVPekaAIA4rnmqjkJ0X57d9w3zRv4vwZqQPWlJPDIyMkryztkY/HGYr
 Vmn8GBhrXluRI6YCjxnDPpj8hx/Q0LZAnxiN85LKCKOrcXkmgh6fpGCB6j2GbV4KqNd3
 nTmqFWzcZs33sT+8VU2j1EIPfxeML+EJfMwnsPtR6cWFuOnF4wGLmQDmvWIrw0CowcPh
 y9SriOztIPeFEMUNSaF5kPUdEAlkuGmrycubgHJXkWxUaSYNTWic/w+hONz07AvFS0ZP
 yNyUVzN+V3DFSGiVPYLLCavJ6hJvaUJbAXi7COcoxQ6VVzbqGi987uKW7XXiAinVtfhy
 3Bqw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790883010; x=1791487810; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=bE/ZpayYaMuQJ2cjUw/XMionGOYmv8DuAlly9njYYE8=;
 b=I/atsHNg+8htBTg+w5pzrDB4AzXTGsXqw0YYMs+N9hzdUXwCXTKyBE/wU3Wml9Gwp5
 Idm7Jm+T5ZaYkjRkUHF59Avb5bj8gvj4m7GcE1uaZjJCN67u0KAQVWc1IPGPrFrkcO8R
 J8gM2MntBM/BFVXkK9zpHmvjXliRL0dj5TWmMY22/H4mnbZJp/Dv/uW3DGBQlYvIJQ0O
 jzS6e8lUemCD3vYDRUVg21SugqWhiP93x2NDvNoyyTnj5D93pJeHMW0oOqThn44f1rNJ
 VHuqBi8j+yxqiLbtx3ArUlYdDpDPtdZerOukcv8I4ogNmpJ63Y2uWNOdLUf/JwTGL8qW
 +spQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790883010; x=1791487810;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=bE/ZpayYaMuQJ2cjUw/XMionGOYmv8DuAlly9njYYE8=;
 b=sibAfnDahECb2UvZbA62PXXxMtZN8c0TX1fX6Mn70L5WI2OpyqT6rOon5SIy0alXa2
 LBdwl9b2ZnvbRRT6xCqxhwM0NbPMNCO8pS4WFYWqu2cFkAbJekm+l8Aofw+F9lDOW9e6
 E4MF+hrKlQs1ShZtfD88F2sIYlXgzH5NeV98lzAreP6d4xkbia6AbPAD1uB8rhr+BnnB
 SgDCdwGuoU0E4YYZ4LbKWXctRZnCDoKCYf3jphyQZU7AU/Yn+PBx6YCUUnyRIwk3J9DQ
 F9oLVIOgAAOgk1lHYBKy8KgMwmqzOO2AW+5MHDXVDuCYcCCBiNUmrwAD9NqZGINS6OSJ
 TA5w==
X-Forwarded-Encrypted: i=1;
 AKwUvBy0Qu0rPsamPTCP29fnHPm7qCKdbEjGvSr8GpzDv1LONjS+vJF9VpbfYcq26QL+9jRHRUkBBattZAI=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLqqvOLnxPsLBMiGLy2OHWT2W/tRPg3K+3ttH224Vq8U4P8KbrS
 KLeFGos3ip+Em0KicYj0nTiX3NFeCrOHeS0dKcSkRlvJGdmA1IMdeqpeP6PFWNYZ0O5HnarYk/w
 rwvzd6f1UT7qcpsOaSa1wmht6ytvdNoc=
X-Gm-Gg: AYBFou29K3ddSwBSqzO54Syhsr/5sX2763nYcv9t1nTXfji7GMqpM9wj6qq9+Bx2PmI
 +iZgevLtRrrF5zpucavZCbvRTH8DVA3nemAQBMk3zCgePI0V7AfMiV7W/dEvPSueZQ0yfBdehJf
 rf86Q8ISu3m0gRwvP5NJOvcYba0QUQsKcnhE7vuR9AqPpVa31J/O31J+1bjEVZ3lF3lynL5m7l9
 KUQ3rETvtq+Mxdg6xhIfKH+cJJKnEYyQFLtU0ANqeFXvtQWY82KFex7WARysjzjK2s6IMLgR9Lo
 ldYz13B6fMyPde172b2UYxoGHUedlzi509qI1kSrZrb4kZdgvXJv19o0
X-Received: by 2002:a05:6214:1301:b0:914:5471:e569 with SMTP id
 6a1803df08f44-917c011aa47mr9730326d6.18.1790883009819; Thu, 01 Oct 2026
 12:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260908044035.62093-1-mario.limonciello@amd.com>
 <20260908044035.62093-5-mario.limonciello@amd.com>
 <25c3dd77-bedc-4822-b687-0ea429db0dc7@amd.com>
In-Reply-To: <25c3dd77-bedc-4822-b687-0ea429db0dc7@amd.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Thu, 1 Oct 2026 15:29:57 -0400
X-Gm-Features: AclHuK-bx6IInYg2xVtTEtZOke_ojMQyvMv_9lNx9GZqWxpIrzw65JUNJ9QqnL8
Message-ID: <CAFZQkGxz6Sn7AU2_ATt_kpwTf9g0Orc6tTOOsmOzkHJo94E+-Q@mail.gmail.com>
Subject: Re: [PATCH v8 04/14] drm: add connector backlight (LUMINANCE)
 infrastructure
To: Harry Wentland <harry.wentland@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, 
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 amd-gfx@lists.freedesktop.org, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, Hans de Goede <hansg@kernel.org>, 
 David Herrmann <dh.herrmann@gmail.com>, Mario Limonciello <superm1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 02 Oct 2026 20:45:17 +0000
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

Am Do., 1. Okt. 2026 um 15:12 Uhr schrieb Harry Wentland
<harry.wentland@amd.com>:
> Why not simply call it BACKLIGHT, which is what it is? Later, if we then
> add support for luminance (in absolute nits) we can use the LUMINANCE
> term for that. Otherwise it'll be lost to us and be apt to confuse
> people.
BACKLIGHT suggests there's a backlight, which isn't the case with OLED
panels for example.
I'd say luminance is the most technically correct term for this, even
if it doesn't come attached with a unit for now.

- Xaver
