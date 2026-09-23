Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5514CC9830C
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 14:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE77A10F067;
	Wed, 23 Sep 2026 14:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RvJuHdxS";
	dkim-atps=neutral
Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com
 [74.125.230.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC370897F6
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 08:07:30 +0000 (UTC)
Received: by mail-qk2-f43.google.com with SMTP id
 d75a77b69052e-52fb76906adso13570341cf.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 01:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790150849; cv=none;
 d=google.com; s=arc-20260327;
 b=r/cO3lk6NN5a4Chd0eEp5JCN/FrcuvJUzoVnPAj4b/5+YajeLFCdKeu6AZiUwN4tSU
 1DfVcB1IHyKLeujkFRa+bg/lZPENKUmRWNUvcs7bH4mHkKeePtpQgdSHqRLAToUWnKZO
 w3S0Rz914TP/hRyzmLFUr+kUkf34O11dHHZfb8wIGgTX4KKVLi/UIqJEWu6b9+Fbg6IS
 Z6tW3SOrvKqV2NMN8mQUI+OCXafaslyDuGgxBlK+rLQQvhT++QP7IIqrfh+nNoR4Jw6n
 3P7nFl7Y7icGova4P3taCxF2LpBqXTrQJTg4U5OvB2Md5u8XFmmhPJS4bflKkc5O8YFI
 oJeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=X6tfoxJ5bpmB6e0WP97I+GLmoZutAadx7RSvw4hqVZ0=;
 fh=SH2zHvXsEbIumUsTvGlzVMyChdhoQPrFF0QoxF+H5EE=;
 b=rXqh+tf7zlG17m/c0Q3+isfoKrqv0RtzfwTism56E8GQIpD2wuECwbQJIZ572ksBFD
 mLYymDac4kRe6C7OWDgcoVzpKWL18L0jGRhVWg/d/0hBJ26PYBFHnfv6P6LPijbE3GqJ
 KOdtqBkYWuoEYB2/hYrRo/T286IVGhM1EOYi3rXJfWGviMuJzWtM5hGKp2LWm1iyc4Gv
 asWxBwrwWIenJJoBdmx0nun5EhYIAYZHhZZuLImERCxJ88ZOxxh5tA18qf29jbt3hW7a
 YwaVN5kVXt6Ol8KRzu1KhuMJFSCKCuw4gtCDg9zVP9iWFb9eF2rIGT0t+MmhEXzMiabU
 L9Pw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790150849; x=1790755649; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=X6tfoxJ5bpmB6e0WP97I+GLmoZutAadx7RSvw4hqVZ0=;
 b=RvJuHdxS4DzPLW74CvaE3ZUuO+Mi05YFW5wrE0Di1VXmFX3yKiAIaluwbrDcBqNJLk
 qdfeVaeqLw60CLx5XiI1x/+3Bj/Rjs2FIIet/tNKq4PBs4Z4rX7YBRRMIC7isk/YYfv3
 YsBt1dTi1pMthGIHjpYezy0TYnYzzypg7gNm+ZYMTCPRVXpfUXWDaRX4bDjRtu2SHP1u
 Ea9YL/y6pyMNU4yDovDtDPYfBBUfehja6cfUpfaAIoNRR0PNIq8PvVX00zxC1bkYagtq
 VOOckLOoiU8XuL6n514ZmJoJBKcBj+orG2QSSdd6AjRWMK+7zAtYvGc2J3B7lirxjoyi
 c6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790150849; x=1790755649;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=X6tfoxJ5bpmB6e0WP97I+GLmoZutAadx7RSvw4hqVZ0=;
 b=NKbIIFEtUX1ZkycJTlyarg0iEFEnqk0y2dKyyLD5bFlWrkjItOjIyAqCk9rMPErKuC
 BbuWmpK5lYiWjOvarh/nCk2oMtxjlgBIp0gmtbGJ7NqXq7pIdcoHj08b9qk7MVdsKzzK
 VklMuH8+BQQMAqqlQG59LHlRfpVRjfi1Fy5XwCRE/c6UfqqsH/H2pdZmkqULd1shQMxK
 /6eJ6kO0dlzAc8+OTFF4riZtdsHOl2laRzBMYgoMLgoA2mvvZuIbS3QPav/vt261+Z7w
 fpC5gD5u8Ywk+cEOT9vps2xt3msuwv/kIDkqw1KpINg2jMvhdIp6vvXtWSS+2dZLI3uI
 C0zQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxISVgKNjAN/7bTq0fiKXFEDsKmj0+nnnPrHdTu+7CeRT4X1QBUca6WRd8dTbJP2x/QO0VfAXFhg5w=@lists.freedesktop.org
X-Gm-Message-State: AFuF++mboAQdQDZyLAEKa21pDEnNA+yc83GhuXUXjch3MuK1qLRCw5Uo
 3C+nUiJ6fOYPS2NwrS2d0Ekg809vCvMzer5tTLTWOuZx59VlMrStVTHQOU7lt58RzhRfw289P28
 sxGN9UPrlqBm2siUzxssxpcB18qkB5e8=
X-Gm-Gg: AYBFou0a5j8U+CARja56I2uOJ7GZVGUHeTRx6myPwvnylVVNiSCVIUKbDhXgr//wfaQ
 ErwBkHMXG5zU9b1JT4iNko2ErYveMI2LyFxyOYa8zddLU31xL2J1bULDPwpPytb3eV/kCo3eWyQ
 nHMzDLUCKf4J9D7fgOMlAY5AB6qWMP2JBnkOBkhja2Uk2fefXBUSdyd06Z88+J7UQAsi6KyGowF
 NF52Q6fYZpB2Yws+vrba8u+L1OpQBamb0Kww5axrlrZbnDiClSt5GvrYxLUAWqMoPOSdpaRe7vy
 7SBcMmVU9F8ZuYo/dKAxzk7xNpiv4qPXcRp1Nejgy1/XE5C8NijXgP4zUHSl1exzZJWMLB5qve+
 W7yTsHm7qbw==
X-Received: by 2002:a05:6214:4886:b0:90e:8be9:c384 with SMTP id
 6a1803df08f44-9140c4244d5mr29354756d6.27.1790150849428; Wed, 23 Sep 2026
 01:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260908044035.62093-1-mario.limonciello@amd.com>
 <CAFOAJEfgXY7cfLvizuxbS75CJd7mF5tewxp+PH=EhTtpy+aZXg@mail.gmail.com>
 <32f96551-358b-4874-8fd1-a685b02853e1@amd.com> <arJwOSq6-oSywTK6@houat>
 <08e47991-0d72-471f-9955-0b4ebbcffcdf@suse.de> <arJ0huW356NjqpGR@houat>
In-Reply-To: <arJ0huW356NjqpGR@houat>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Wed, 23 Sep 2026 10:07:16 +0200
X-Gm-Features: AclHuK8xgDnVa7N6ARRpfcYEwFozCo04IqFUVuiW8m2XtM8bq-AsJWi-i2VQJfk
Message-ID: <CAFZQkGz9O8dZfmxEC5Fcpa2mRHXde+FFwu4JVz3fvKTzHT49LQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] Add support for a DRM backlight capability
To: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, Simona Vetter <simona@ffwll.ch>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, amd-gfx@lists.freedesktop.org, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 23 Sep 2026 14:17:20 +0000
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

> Couldn't we make a sysfs write trigger an atomic commit then? That way,
it would always go through the atomic commit path, no matter whether
you're on a "legacy" compositor or not.
That could cause stutter.

> It probably would, but it would create a precedent I'm not really
> familiar with. Hotplug events are kind of separate because it really is
> a hardware event most of the time: you get an interrupt, and report it
> to userspace. And it's largely outside of the properties space (except
> maybe for things like edid).
If there's any property changes, userspace does need to be notified
about it. Whether the change is caused by hardware or software doesn't
matter.

> If we start having the argument that a property changing must trigger a
> uevent, then it means that we can expect *any* property to do so
For anything modified outside of the compositor's control, yes.
The client cap avoids needing uevents for the luminance property
though, since backlight control is exclusive to DRM if the compositor
supports it.

> "the compositor needs to be in control of it" can apply to many, like
> color formats, positions, tiling, etc.
If there were other APIs that desktops relied on for controlling color
formats and similar, we would indeed also need a client cap for those
things, until definitely all software is ported away from the old API.

- Xaver
