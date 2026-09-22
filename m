Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96232C982FA
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2026 08:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10DA10E994;
	Tue, 22 Sep 2026 08:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="I8wqazkk";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A813F10EBE7
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Sep 2026 08:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790065994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F96J7DJJAKJfcMZddwK3W30eQH37p3jCY4JYz68S9D4=;
 b=I8wqazkkDbLLDkLPdzMh5DzxHOm3rGyXH42DTR7u9Q3lIqFYdQMjs+FV4JGPgIe9eKkLdb
 icQXTumn7bjIqVL17B8HZYTq9kPGQPpIJhEPrLuRPnssAh6cH+OPdI/ykAXFEvgFcRzPdU
 QHj1JRK4qnHMHf+o+W4/Ez2pGHkHoq8=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-P5YGm0C1MV6rDRGJAkQtbQ-1; Tue, 22 Sep 2026 04:33:13 -0400
X-MC-Unique: P5YGm0C1MV6rDRGJAkQtbQ-1
X-Mimecast-MFC-AGG-ID: P5YGm0C1MV6rDRGJAkQtbQ_1790065992
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cc51591102fso5514045a12.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Sep 2026 01:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790065992; x=1790670792;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=F96J7DJJAKJfcMZddwK3W30eQH37p3jCY4JYz68S9D4=;
 b=sZ1NP1G3o7EgamOfsZd9idj+uECQlKD8hU0cyIDL6dJRAytPgmCGuAQzM5rJkTa0Zw
 DhI3HS+ojHjiFNuoZRjQCazkqpkadZIoohkUh07iVuvyy9bEY0p8lASyECbXm3Vhx15l
 46gVlsoFny65+Ir82RB/AG1L5qkoLbQ5jPBeP3DzUEMVC90bM4nTF2w5rQ0+QvtAGKF9
 Za/S5/voLxSBG6aHa9ktRGK3WxPIH9kXMEizSbu9Sbm2I7sCEAEP8wktMHJ39/c3qVUP
 ISE7DN3c/NPvD/aUbGVCRkf58oi0cbv6QX3ScbBgrN3ar4cSkW9kEnqnUvWvUo2bOGtw
 MSIw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwqSdRGlVBWEi6L+MTef0mZ2Cx2Hrw5eJSw3iMNU5i80+Z03U8mT2QwE4OjEoHIokfY02EvHz3OyhU=@lists.freedesktop.org
X-Gm-Message-State: AFuF++nSBopGKvm2JLl8rV97hOszASNKQE1ZUWawX0NsY6rwRqJeTfbf
 doPN5tDPlozGqGCyGAnDpjBHn4mIuB+8AxHUaAN6yAzwef6jPHQtZQsnsOq3NZt+b44QLorXjuD
 wNHAeKxxFuR/pvFItpUQe0tCUxRtlfAZ1VVW4rzyFR9tmW4KRG0cWzKfTngx262fjHZLQ51Y1jP
 fzIZp7FAhSGhz5pkdz4p/QTnnXafpnu/rx8r3VnlD7l7fk
X-Gm-Gg: AYBFou32nNpeHHNheWdEjJ0xCjrAieoVRZTfF49CNEtgpTutCZPBziBprPjeS1MfDUQ
 0ASSy55PJ+kNG9ysGOpo4e8EOQvlz78LgvoxAp93x+6CgJG9P9ok9wiucPz1zK/6tq6t96rvS6d
 nYx94Ka98NLj+2K/+2RdUUGfMYIg2prNaZq3y/eZOD8m+2lkdZ1CRY+Pda
X-Received: by 2002:a05:6a21:3997:b0:3da:1e7b:ea27 with SMTP id
 adf61e73a8af0-3ddec64510dmr599373637.21.1790065992343; 
 Tue, 22 Sep 2026 01:33:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:3997:b0:3da:1e7b:ea27 with SMTP id
 adf61e73a8af0-3ddec64510dmr599341637.21.1790065991877; Tue, 22 Sep 2026
 01:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260908044035.62093-1-mario.limonciello@amd.com>
In-Reply-To: <20260908044035.62093-1-mario.limonciello@amd.com>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Tue, 22 Sep 2026 10:33:00 +0200
X-Gm-Features: AcwNN1VtA49KGh0oWUGKjHEN55TPH-cQU1mit2FWLOruyptSR0tnv5cErAS2kZM
Message-ID: <CAFOAJEfgXY7cfLvizuxbS75CJd7mF5tewxp+PH=EhTtpy+aZXg@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] Add support for a DRM backlight capability
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: dri-devel@lists.freedesktop.org, harry.wentland@amd.com, 
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, Hans de Goede <hansg@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TJZ_KctqC1byCTnREORbKgPP4YM3l0vynwO_q8WJBF8_1790065992
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

Hello Mario,

On Tue, Sep 8, 2026 at 6:41=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> At Display Next Hackfest 2026 we reviewed progress moving brightness
> control into the DRM connector properties.
>
> There is a range LUMINANCE property that will default to 0->0.
> Once a driver attaches a backlight it will be updated to 1->max.
> If the panel supports the minimum backlight turning off the display
> the range can later be updated to 0->max instead of 1->max.
>
> The legacy sysfs interface is synchronized with the DRM connector.
> When a compositor using this feature is loaded, sysfs writes are disabled
> to prevent legacy tools from going out of sync with the compositor.
>

I don't think I agree with the direction of this series. The main
issue for me is that if the sysfs interface is disabled, then I don't
understand the value of doing all the hops between the DRM and
backlight subsystems...

IMO when a driver sets the DRIVER_CONNECTOR_LUMINANCE feature and the
client advertise the DRM_CLIENT_CAP_LUMINANCE capability, then the DRM
driver should be in full control of the brightness control and not go
through the backlight subsystem at all.

It would be better if the hardware specific logic to do the brightness
control is factored out and used by both the struct
backlight_ops.update_status and the atomic modesetting state check /
commit.

--
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

