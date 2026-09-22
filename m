Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09100C982FA
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2026 12:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5ED10EC9D;
	Tue, 22 Sep 2026 12:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EfqTjNB5";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0778710ECA1
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Sep 2026 12:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790080106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0B9Gq/5m/Sv5U+otsJhRfKNw9njULQyo6d+3n/j0FQw=;
 b=EfqTjNB534yHYpnRrckwbHw06ugqWwUSf5rqNIGQylA/NMCi+CLiCijgkphXzpq2S9wn86
 7MUoX1flCGVYtz1iKHYxGT/pJlosa+1bqGZI23FNVViRNKyCeKRKR4agqOa2oDG0W+VCRq
 0QzjyuR5NZ484OBtlT6l9mjmJhTXwT0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-qmV8WvmPNxWPKaMSyVjEgA-1; Tue, 22 Sep 2026 08:28:25 -0400
X-MC-Unique: qmV8WvmPNxWPKaMSyVjEgA-1
X-Mimecast-MFC-AGG-ID: qmV8WvmPNxWPKaMSyVjEgA_1790080104
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-49d0ae342b9so29539785e9.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Sep 2026 05:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790080104; x=1790684904;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0B9Gq/5m/Sv5U+otsJhRfKNw9njULQyo6d+3n/j0FQw=;
 b=WMa8b+rZ+0YmnuNcqN34orVE5h22WJCyXNjLkfs6qGFsgokWPhTrSW5OnORVz7A1d1
 Hb1JgC7jk9zdvt6T8jW7KvhOReMpv/ikLyd7Q8ihrkKsdGQ4DTSrD/EVpoGNUEOeRtx9
 hIr/oecY5eMX05uHrW9sECD9rU5duBSpIywZDpqsSFJgAQzR8SL2+OvPdiml1HMh2MMH
 250Lt5eb60yoBnUyiQ7OFGXWOVNOCa3Zb03ryjVM2b7fy+JgBy340njHNzk5n5PPf3Xz
 JIy5NzpVusR6/fise7azlthEDUItG5tsw0mT9YqgT0YGiTQkQ+0XFDJLLVGh8a0TM0LE
 W2gw==
X-Forwarded-Encrypted: i=1;
 AKwUvByFYRNlh3bOA/Rff0Uw6W1RkvoasvNh6W1gf93cy6cEscUCPCPqf0Th73+nDyBmNg9kVvXGEyOCJG0=@lists.freedesktop.org
X-Gm-Message-State: AFuF++kiRhWtiXKvOsy18WMF8Uy/Xh0NAveEHBAF5a1ppR4o/fe6KEuK
 Iu4RYDzYHPnBvWLJwubS7lw7at5kq7txjB18VnqorzZzJyBjmN0a/gqO+ZZu60Sl23vgt6HdPsl
 bBlEaGw8wg6WVwUP2doigbbLsW2DB6o8B97AoL9OdIr+T0i4gFN525envHkHZTOMs7Su6Rg==
X-Gm-Gg: AYBFou05AaI31CTnUdkdodIZ6de2p2EUcvBeAbGc95WHOtnOJKZtLwbGTMcBWQKPHqu
 G4qa4RXIKov0dkj6a8IdlGaz1oEVCOVrup034hrn2Rt9MyWark+aru0O41QBZUZ7fC+k10ocrW+
 x7JCqv8j3auKO2X9ZS0FsDqDig2JaA4EU3TtHVgRLK5/lgW3I96dK0X8nFHUetUwBUoKMGjraa7
 zckD6LjnUZdAT8P5gixnstSMiVkno7uqxbLdJOMRy4/9f9hTvhcrks3Ar7FT991C1foc38Ry3Rw
 k4ZFTVd3gMTEirNfFq2heQUwARfOT/o4hXX2q1rJTl/ZBgcWvLKZ9veHvnsmNt4lQv1jnh66M+a
 Qj54bMhgmmSCvmx6/WUHV7buk/aLbdY3a8TsBB+oQh6399Owr2J2YTaVwGuu+U57dNg==
X-Received: by 2002:a05:600c:8b8b:b0:49c:fc6e:a3dc with SMTP id
 5b1f17b1804b1-49fc584fd80mr177177975e9.27.1790080103648; 
 Tue, 22 Sep 2026 05:28:23 -0700 (PDT)
X-Received: by 2002:a05:600c:8b8b:b0:49c:fc6e:a3dc with SMTP id
 5b1f17b1804b1-49fc584fd80mr177177655e9.27.1790080103320; 
 Tue, 22 Sep 2026 05:28:23 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdab3070asm23839485e9.4.2026.09.22.05.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 05:28:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: dri-devel@lists.freedesktop.org, harry.wentland@amd.com, Simona Vetter
 <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 amd-gfx@lists.freedesktop.org, "open list:INTEL DRM DISPLAY FOR XE AND
 I915 DRIVERS" <intel-gfx@lists.freedesktop.org>, "open list:INTEL DRM
 DISPLAY FOR XE AND I915 DRIVERS" <intel-xe@lists.freedesktop.org>, Hans de
 Goede <hansg@kernel.org>
Subject: Re: [PATCH v8 00/14] Add support for a DRM backlight capability
In-Reply-To: <32f96551-358b-4874-8fd1-a685b02853e1@amd.com>
References: <20260908044035.62093-1-mario.limonciello@amd.com>
 <CAFOAJEfgXY7cfLvizuxbS75CJd7mF5tewxp+PH=EhTtpy+aZXg@mail.gmail.com>
 <32f96551-358b-4874-8fd1-a685b02853e1@amd.com>
Date: Tue, 22 Sep 2026 14:28:21 +0200
Message-ID: <xlv1bj9peahm.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VRj6iyfEHHeK2M9-bkqcz4u1ovhiv3kaGzsjB_8zXDg_1790080104
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Mario Limonciello <mario.limonciello@amd.com> writes:

Hello Mario,

> On 9/22/26 03:33, Javier Martinez Canillas wrote:
>> Hello Mario,
>>=20
>> On Tue, Sep 8, 2026 at 6:41=E2=80=AFAM Mario Limonciello
>> <mario.limonciello@amd.com> wrote:
>>>
>>> At Display Next Hackfest 2026 we reviewed progress moving brightness
>>> control into the DRM connector properties.
>>>
>>> There is a range LUMINANCE property that will default to 0->0.
>>> Once a driver attaches a backlight it will be updated to 1->max.
>>> If the panel supports the minimum backlight turning off the display
>>> the range can later be updated to 0->max instead of 1->max.
>>>
>>> The legacy sysfs interface is synchronized with the DRM connector.
>>> When a compositor using this feature is loaded, sysfs writes are disabl=
ed
>>> to prevent legacy tools from going out of sync with the compositor.
>>>
>>=20
>> I don't think I agree with the direction of this series. The main
>> issue for me is that if the sysfs interface is disabled, then I don't
>> understand the value of doing all the hops between the DRM and
>> backlight subsystems...
>
> The reason for all the hops is that users can switch between compositors=
=20
> that support this and don't.  If you're in a compositor that supports it=
=20
> that compositor will want to affirm it's in control.  If you're in a=20
> compositor without support then you should still have a way to change=20
> things, and that's what the sysfs interface exists for.
>

That's Ok but still doesn't explain why it must go through the backlight
subsystem. Both the struct drm_backlight .{s,g}et_luminance() callbacks
and the struct backlight_ops .update_status() can call to the same code
to manage the brightness.

For example, in amdgput this could be amdgpu_dm_backlight_get_level()
and amdgpu_dm_backlight_set_level().

>>=20
>> IMO when a driver sets the DRIVER_CONNECTOR_LUMINANCE feature and the
>> client advertise the DRM_CLIENT_CAP_LUMINANCE capability, then the DRM
>> driver should be in full control of the brightness control and not go
>> through the backlight subsystem at all.
>
> OK but so let's say I start at 100% brightness.  I open up Kwin, I=20
> change the luminance property to 0%.  Let's pretend that backlight=20
> subsystem doesn't get updated.
>
> Then I log into Xorg + Xfce.  The luminance property should be left at=20
> 0%, the brightness subsystem is 100%.
>
> The hardware would be left at 0%.  I press the brightness up key (or=20
> call brightnessctl) and I can't change it because backlight subsystem is=
=20
> 100% already.
>

Not really because struct backlight_ops .get_brightness() will be called
and this will query the HW state (in the case of amdgput this will be a
call to amdgpu_dm_backlight_get_level() as mentioned above).

So the HW state will be changed and both subsystems are going to query
the same information.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

