Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07BDC98308
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 05:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC5210EEF8;
	Wed, 23 Sep 2026 05:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pVHTWgKy";
	dkim-atps=neutral
Received: from mail-oi2-f35.google.com (mail-oi2-f35.google.com
 [74.125.231.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F57310EEEB
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 05:01:20 +0000 (UTC)
Received: by mail-oi2-f35.google.com with SMTP id
 46e09a7af769-8055dcba0a5so147075a34.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Sep 2026 22:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790139679; cv=none;
 d=google.com; s=arc-20260327;
 b=kH7ZbNRciWxbbgh2RUcZ1xIEtwbqC+5ZeTIM15NGSfEaDNicJpGLTi3L2dzU2a30bx
 uCu1b1COU37ygSyuVGLegDllktbimmzZmHoT4FXkMf+Wsi79F1sdWc4Togud4s6/g/Xz
 aMhJmaAL9T1X861aIPFSUSJa28xwUF8VwwXONajAg8SSFPD+DjFYPCUCVxTlBAra5JwZ
 C71DFEhJVu/cxQuOTMAVVoAO0glnElfLsg4RniQzBA0Gb6E7AyuSsjrdB8zN3mLWKuy5
 QidOGM6m/F9YSPkT5ZB0+WRg/beO3ZfjKpZX0ECxk4AOkFfGtKMQ4THwX5jlskgY9Gga
 h7iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=s9t+pGf5Jdws57vhvMQ8eJxDP4MEnxA9XvPVPFGvtB4=;
 fh=E3yMQVNtdi0keFELUcnx5PvBzt7Q5p64d2WvPfgA3pU=;
 b=kGZScUZ0/C6R1EOgzzPLEvo3edJ/54FmrwZNWYFco+vEXVGfrVDPtX7Ox5E7ZqxyIx
 g7v4Uu3IMmP4GiAyhDgQ6utFe09ajdRxS91pj2i0CNc6+kkjH9cqden2BSpEQe+LzW7l
 5kduI081979V3bJVyLIgXqhyuqP4H5Gj5n7oXGGIxUARk5xvVlwlq/bnZU2PdD6ovOOn
 dm4+4uT8oYyHhVi1Zz0JJQj5Gr3Rd83vxaIjTuMtUsaeBHgzvGuARzq80FG/kpDW/i03
 O9zrz+XiC61NXuS83aDk3CSZQToIeaWGApOZF+twofiircRj4l0srIIe56bd6QXXBnH4
 R6fA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790139679; x=1790744479; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=s9t+pGf5Jdws57vhvMQ8eJxDP4MEnxA9XvPVPFGvtB4=;
 b=pVHTWgKyb9M5s4+3AHQyBwFFysdLqfpwoWdBbq3XQq0PxGXBzOjavotffHXV3UVWbp
 A8plUjqyV/H3chcgZJdrgDYCK9ntcIRKTh+l5YksSHhExoJvje8toN/zBakclWRB3utL
 EpihgPQiNtFIS5jAp9PsNFUZr58c3K+OpHhUFG42Y1QP1DrGBHccDGVqeuF4zWYuPytA
 h7B9UpPgtaXO89lLNzH58ouC5NzzrKGxf6CUGqQf4R2CM+DD17UxmypF7I1+Mr8qq0YI
 65QhIi7w0PEHeHDR7BYmbrkMfwEGAqaUcUGUAdgeb65eXP17SYc+757+TZJtHNUWXGD1
 HgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790139679; x=1790744479;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=s9t+pGf5Jdws57vhvMQ8eJxDP4MEnxA9XvPVPFGvtB4=;
 b=0rHW8Fb1i2J9nirIZ6GykLL1BYutsXIzfwjFE/1yLJPIwJGlY/ptmD+Co15trFz+Gj
 AGRs/dWSK/ObR63GuUwMRhPyQOoRfmLlXiydaK36AnFKJoW+QchN9xwfKfW0gR58BB2U
 0m8nnHaNfu9+rMlkarwpEUO/c1Qy2EcXvuC3DGJAVAdYAQaD9wYhWylykH6U11JuI293
 KmMCLCKCkxtshprB8Ol0YZuAVLbmo2oPQDbXXvvBBwN76Tk84hxa4vNCOjTarNzShBL4
 LvGuhP2p5hAqmQsUR3Ajs9HanBmhDOEHWcaYxRZ841eR60FBqNcUCoK1hA93XRq8lAFL
 L9/A==
X-Forwarded-Encrypted: i=1;
 AKwUvBy2GxCmX+G9nPrWpYSMNgOiiAQe9ArL5KAa+n4TVc3bAtNG59keirBdBqHp8z+gIC/D2RWv2kafxLQ=@lists.freedesktop.org
X-Gm-Message-State: AFuF++kK+kcUEtR6bzoeH1qQ3KpJZJ8ldBRGyf9FplPit6ouS4woGGlW
 +W0CNfgggtXKFu/d3s83WRc3Px1LPm0K8EPHRKxDysTtfqRKgUzg97D7C5Nj9VzoFdLIc4pV723
 Eg7WvQAbIHqHYSDAVLXNKif6nWyTCfAY=
X-Gm-Gg: AYBFou0kWATPfklMv839AYpRa0/NwOBX5fHOAK/GaMwrwmkruB1drS7UshZA4+8GQU0
 b4GIzhGtqDZ8jaRaZ+ifcyyHzu1chuUeZUTwYx0lylb4xrkVn3r8+gOYuwDhVNKB+caRyjdpBWZ
 Vv3LmyN23ZBOXrgtFl7j9aJtPcc9ysXLDp26QIpnf6axiT4eNDjzEtEIKWcQTKFgtY+Y0MXpe2h
 uHsWBxWHX7pOIbuuhCLYqUSF+4IhE59I1cT1Li1ZQp+EeAH03CxkoPg60yA1LrAja0LqfCZd486
 JgeLFbTdtWPZaA1N4nLBQ1A/NJlCy8qVJ8H6X3zz68s8ZTIjOK11AioRUf+x1zxzSw==
X-Received: by 2002:a05:6830:2105:b0:814:fd96:b005 with SMTP id
 46e09a7af769-815fa7a3aa8mr1368055a34.10.1790139679573; Tue, 22 Sep 2026
 22:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260724025959.142826-1-W_Armin@gmx.de>
 <20260724025959.142826-3-W_Armin@gmx.de>
 <BN9PR12MB514668975E87D570F50B2D91F7A82@BN9PR12MB5146.namprd12.prod.outlook.com>
 <86d0e015-a8f4-4e10-a9b6-a9714d3e0f07@gmx.de>
 <80c4bb47-936b-976b-6ba8-b366f7a455cf@linux.intel.com>
 <11976ed3784675ad241646287a909286a42675a8@intel.com>
 <3ef68773-e07e-437a-98fb-a3c5fc08539c@gmx.de>
 <62d7da838e7042df8456e76190db792093065b57@intel.com>
 <06550473-63c2-4a3e-a5ad-7e23d7b6b050@kernel.org>
 <d696d85c44930d2124054ce11a06d3096c0db04a@intel.com>
 <CADnq5_PT7s6ixTqDSwe9ai9tUQa04z7UnwhMn7bo7CcsH5Qf0w@mail.gmail.com>
 <154fc984-5c29-4a23-ab8b-736471f419a1@gmx.de>
In-Reply-To: <154fc984-5c29-4a23-ab8b-736471f419a1@gmx.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 23 Sep 2026 07:01:07 +0200
X-Gm-Features: AclHuK9iIINoALCOYPcubT5-e7bSzbMlB0XgN7hLaVHol59ylJMeoZCRLCs4o-M
Message-ID: <CAMeQTsZw8P+__EXsUSW8G6LONN85HPwmG1+zQXwpmHEC=npWyw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ACPI: video: Remove CONFIG_X86 handling from
 nvidia_wmi_ec_supported()
To: Armin Wolf <W_Armin@gmx.de>
Cc: Alex Deucher <alexdeucher@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux@weissschuh.net" <linux@weissschuh.net>,
 "rafael@kernel.org" <rafael@kernel.org>, 
 "lenb@kernel.org" <lenb@kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, 
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "matthew.brost@intel.com" <matthew.brost@intel.com>, 
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
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

On Tue, Sep 22, 2026 at 9:57=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 18.09.26 um 15:03 schrieb Alex Deucher:
>
> > On Fri, Sep 18, 2026 at 7:01=E2=80=AFAM Jani Nikula <jani.nikula@linux.=
intel.com> wrote:
> >> On Fri, 18 Sep 2026, Hans de Goede <hansg@kernel.org> wrote:
> >>> Hi,
> >>>
> >>> On 16-Sep-26 09:16, Jani Nikula wrote:
> >>>> On Wed, 16 Sep 2026, Armin Wolf <W_Armin@gmx.de> wrote:
> >>>>> Am 15.09.26 um 14:31 schrieb Jani Nikula:
> >>>>>
> >>>>>> On Tue, 15 Sep 2026, Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel=
.com> wrote:
> >>>>>>> GPU people heads up!!
> >>>>>>>
> >>>>>>> On Wed, 2 Sep 2026, Armin Wolf wrote:
> >>>>>>>
> >>>>>>>> Am 01.09.26 um 23:30 schrieb Deucher, Alexander:
> >>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>>>> index 12e4a41bf1f0..50305630f533 100644
> >>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>>>> @@ -30,9 +30,7 @@ config DRM_AMDGPU
> >>>>>>>>>>          # ACPI_VIDEO's dependencies must also be selected.
> >>>>>>>>>>          select INPUT if ACPI
> >>>>>>>>>>          select ACPI_VIDEO if ACPI
> >>>>>>>>>> -     # On x86 ACPI_VIDEO also needs ACPI_WMI
> >>>>>>>>>> -     select X86_PLATFORM_DEVICES if ACPI && X86
> >>>>>>>>> The change below makes sense, but this one looks like it should=
 remain
> >>>>>>>>> unless X86_PLATFORM_DEVICES is handled some other way?
> >>>>>>>>>
> >>>>>>>>> Alex
> >>>>>>>> AFAIK the dependency on X86_PLATFORM_DEVICES was only necessary =
because
> >>>>>>>> ACPI-WMI depended on it in the past.
> >>>>>>>> By now ACPI-WMI neither depends on X86_PLATFORM_DEVICES or X86 a=
nymore.
> >>>>>>> Hi all,
> >>>>>>>
> >>>>>>> Could more GPU people besides Alex take a look on this. I'd want =
to make
> >>>>>>> progress with this series within this cycle but would prefer to h=
ave Acks
> >>>>>>> from GPU side.
> >>>>>> I share the same concern with Alex. It seems to me we could now en=
d up
> >>>>>> with x86 configurations without X86_PLATFORM_DEVICES, which handle
> >>>>>> e.g. backlight on a lot of platforms.
> >>>>>>
> >>>>>> I think the safer option might be to go for:
> >>>>>>
> >>>>>>     depends on X86_PLATFORM_DEVICES || !X86
> >>>>>>
> >>>>>> in all of the cases that select/depend on X86_PLATFORM_DEVICES in =
drm.
> >>>>>>
> >>>>>> The alternative is to find out, and handle the fallout, if any.
> >>>>>>
> >>>>>>
> >>>>>> BR,
> >>>>>> Jani.
> >>>>> Alright, should i leave the original "select X86_PLATFORM_DEVICES i=
f ..." statements
> >>>>> as-is or should is change them to "depends on X86_PLATFORM_DEVICES =
|| !X86" everywhere?
> >>>> There are some places that depends on X86_PLATFORM_DEVICES. I think =
it's
> >>>> almost always a mistake to have some places select and some places
> >>>> depends on, and select should anyway be used with care. I'd go for
> >>>> depends on.
> >>> I'm a bit late to the party here, sorry.
> >>>
> >>> Note that X86_PLATFORM_DEVICES is an option which enables / disables
> >>> a menu and does nothing more.
> >>>
> >>> Enabling it or depending on it by itself does nothing.
> >>>
> >>> The select used to be there since it must be selected to be able
> >>> to select ACPI_WMI (which is no longer the case after this series).
> >>>
> >>> To depends on in XE was probably copy pasted from the existing
> >>> select-s and then changed to a depends and already was a completely
> >>> no-op since depending on ACPI_WMI was enough as that itself
> >>> dependend on ACPI_WMI.
> >>>
> >>> As for X86_PLATFORM_DEVICES being needed for some backlight
> >>> interfaces, depending on it by itself does not result in those
> >>> interfaces being there. That requires enabling the actual drivers
> >>> providing those interfaces.
> >>>
> >>> And I don't think that the GPU drivers should start depending
> >>> on those since that will become very unyielding.
> >>>
> >>> TL;DR: I believe Armin's original patch is fine and this is
> >>> a welcome cleanup / simplification of the DRM drivers Kconfig
> >>> bits.
> >> Your explanation makes sense, thanks.
> > Yeah, sounds good.  Thanks!
> >
> > Alex
>
> Nice, i suppose we can apply this series as-is then?

Sorry I'm a bit late here, but for the gma500 part:
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

>
> Thanks,
> Armin Wolf
>
> >> BR,
> >> Jani.
> >>
> >>
> >> --
> >> Jani Nikula, Intel
