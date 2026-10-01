Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386AFCA5FD6
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2026 16:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E3710E050;
	Thu,  1 Oct 2026 16:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="an1b5Gvt";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0A010E1EC
 for <intel-gfx@lists.freedesktop.org>; Thu,  1 Oct 2026 16:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790873730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ISrpw7olzbmQQV5EJd9ZLesu4XLFhm7z/OC3rYuai2k=;
 b=an1b5GvtCtoGcvJHb9JD+UjO5VIU6n+Zp+lI2AFhtHH5X5SiYpourvrOeyixDvQN1y0JFI
 KKAQJl+CNWWByixa9ZRww+TNGC6kymboGgqY8NbdA3v8UUW1v1HCieEzdNtPCeWq4OTOGS
 0a+CrvnDEiWx3EXjY2sA6d7CP5iXHmA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-N_qs5LzGPja-cjmg0qAPKg-1; Thu, 01 Oct 2026 12:55:29 -0400
X-MC-Unique: N_qs5LzGPja-cjmg0qAPKg-1
X-Mimecast-MFC-AGG-ID: N_qs5LzGPja-cjmg0qAPKg_1790873726
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-48b01a74792so1529606f8f.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 01 Oct 2026 09:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790873726; x=1791478526;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ISrpw7olzbmQQV5EJd9ZLesu4XLFhm7z/OC3rYuai2k=;
 b=ii1IPQ74W2QYxzgqFUbQV+V1Zdc+eVaC3v5LZmeAvtqnjfnpMvb1BE1ro1lQSFOpYj
 j4QD5MEq2JUuaXt5aYT9caej/Qovfh3VjRIFWDsuDgfvwLUtu28f2L4ha3qP8MTqfTT+
 CLBd7gJjed1+AhMWgn5Z5EDLHHWhzFc913riUQBRmC0MrbIwQlVrgTUSHMXjnP4dCWfb
 SOmB33n9/x7RVw+j6YWwKVygVcrl9mT6PMeTR6wFVEn9hw/wtAjJ3r/6MpZhlLvrB97k
 IKe1eWmyDhpG1J8ddpKHEYUIggtlxnGH5jBExZnKEC1SKPsQFQkAzOcj5b8jHT1sTWZm
 esxg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzm9+r6q3ET0zJSx3qUJX+saYwXHFnOcsDPBPqssiUn/Zluc2Npf07mNwWx6tn4gU4/SgfxknorWWM=@lists.freedesktop.org
X-Gm-Message-State: AFuF++k91kzpfqMBIuMP6uVcXw0vXUhMFugtgN1/2VI+X/TXTVuv2Da3
 ndPdAeUaAi+LLySf+ft/ZQCskXr/VvKh7Ql4zR6pxTVaA1YLtLQVj9v9qj3cAAyDUMReYmyGQKg
 3/4t4CTrfcOK8VY9skR/bAWKqjGoe0RnAHLGTlv3ThYlmDgjKYCbMO1rKBuK1cPp3AqvJ9w==
X-Gm-Gg: AYBFou14Jz4rmBqrGVklkGUw3nq4GWplzOfSCHGtpK4evmOgtX3lWm5zvjfVRS7c0QH
 nT9n9iMA6jZZUIkG5WNz8fW4MscpfjlszxKcQk60FsuUfwBn6Q8s9BEDP5dJ6x9jd6qr8+tw7rl
 TMhuIxuR11S2CI2SycXXjR/YuFqr5TXZnr1Vh67qCVuVuR/DYN5BEQTdYXLEqwXGjnWxOLO82j8
 BpgRJSO44pkmhyLub3nvWhl+IsPjwBWNFo7UZ/zEXq3iVBxx0ueZw+9GjGICS4KTs+ZVZB3JKJS
 jWZKn60tNInQsGe4NJbxJFT7mSapESoWR79QfD/u0fpQZrf27omXt0M8ulQ95MGGwzl90yg8ANY
 nLcTIDGU9kbaHuqk+EsJd4kcyicCVTdShGyv8ddRep3PG/iq1g9bWjriVYPCvET0YDg==
X-Received: by 2002:a05:600c:3508:b0:49e:6683:d23c with SMTP id
 5b1f17b1804b1-4a02744dcbemr5195835e9.0.1790873726343; 
 Thu, 01 Oct 2026 09:55:26 -0700 (PDT)
X-Received: by 2002:a05:600c:3508:b0:49e:6683:d23c with SMTP id
 5b1f17b1804b1-4a02744dcbemr5195345e9.0.1790873725892; 
 Thu, 01 Oct 2026 09:55:25 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a02752aeb3sm4607165e9.0.2026.10.01.09.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 09:55:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Mario Limonciello <mario.limonciello@amd.com>, Maxime Ripard
 <mripard@kernel.org>, Xaver Hugl <xaver.hugl@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, Simona Vetter
 <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, David Airlie
 <airlied@gmail.com>, amd-gfx@lists.freedesktop.org, "open list:INTEL DRM
 DISPLAY FOR XE AND I915 DRIVERS" <intel-gfx@lists.freedesktop.org>, "open
 list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v8 00/14] Add support for a DRM backlight capability
In-Reply-To: <d0889653-e835-4a22-b385-85cb19ee13a0@amd.com>
References: <20260908044035.62093-1-mario.limonciello@amd.com>
 <CAFOAJEfgXY7cfLvizuxbS75CJd7mF5tewxp+PH=EhTtpy+aZXg@mail.gmail.com>
 <32f96551-358b-4874-8fd1-a685b02853e1@amd.com> <arJwOSq6-oSywTK6@houat>
 <08e47991-0d72-471f-9955-0b4ebbcffcdf@suse.de> <arJ0huW356NjqpGR@houat>
 <CAFZQkGz9O8dZfmxEC5Fcpa2mRHXde+FFwu4JVz3fvKTzHT49LQ@mail.gmail.com>
 <ar6GxMRwcsTX8IaF@houat> <d0889653-e835-4a22-b385-85cb19ee13a0@amd.com>
Date: Thu, 01 Oct 2026 18:55:24 +0200
Message-ID: <xlv1fqypfjib.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NLB5X6ioW6c_ny79BGblFpPj_XOdqcuiHeqk4vkBpsY_1790873726
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

Mario Limonciello <mario.limonciello@amd.com> writes:

Hello Mario,

> On 10/1/26 11:18, Maxime Ripard wrote:
>> On Wed, Sep 23, 2026 at 10:07:16AM +0200, Xaver Hugl wrote:
>>>> Couldn't we make a sysfs write trigger an atomic commit then? That way,
>>>> it would always go through the atomic commit path, no matter whether
>>>> you're on a "legacy" compositor or not.
>>>
>>> That could cause stutter.
>> 
>> Is it really that bad? I mean, it would be only in scenarios where the
>> legacy API is being used and I would expect it to become the standard
>> pretty fast anyway, no?
>> 
>>>> It probably would, but it would create a precedent I'm not really
>>>> familiar with. Hotplug events are kind of separate because it really is
>>>> a hardware event most of the time: you get an interrupt, and report it
>>>> to userspace. And it's largely outside of the properties space (except
>>>> maybe for things like edid).
>>>
>>> If there's any property changes, userspace does need to be notified
>>> about it. Whether the change is caused by hardware or software doesn't
>>> matter.
>> 
>> Yeah, it turns out we already have a precedent for this for HDCP so it's
>> not too bad I guess.
>> 
>>>> If we start having the argument that a property changing must trigger a
>>>> uevent, then it means that we can expect *any* property to do so
>>> For anything modified outside of the compositor's control, yes.
>>>
>>> The client cap avoids needing uevents for the luminance property
>>> though, since backlight control is exclusive to DRM if the compositor
>>> supports it.
>>>
>>>> "the compositor needs to be in control of it" can apply to many, like
>>>> color formats, positions, tiling, etc.
>>>
>>> If there were other APIs that desktops relied on for controlling color
>>> formats and similar, we would indeed also need a client cap for those
>>> things, until definitely all software is ported away from the old API.
>> 
>> I really think this series should be split. We obviously need to address
>> this, but it's kind of decoupled from the UAPI itself, and is only
>> relevant for a small subset of its usage. And yet it's all we talk
>> about. It'll be easier to merge in chunks and decoupling the legacy API
>> handling from the new uapi.
>> 
>> Maxime
>
> How would you feel about a (temporary) Kconfig that lets you pick which 
> API to support?  This would effectively mean that we can get the new 
> UAPI integrated without worrying about implications for the legacy API.
>
> We can then get compositors all lined up to use the the new API and then 
> bikeshed the compat between the two to let us drop the Kconfig.
>

That is indeed a very good idea IMO. Just depends on !BACKLIGHT_CLASS_DEVICE
and ensure that no existing user of the sysfs get affected by this new API.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

