Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE9D606A338
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2026 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ue0Iyl6s
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EE210FCBF;
	Wed,  4 Nov 2026 15:03:16 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAB710E881
 for <intel-gfx@lists.freedesktop.org>; Wed,  4 Nov 2026 09:00:22 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-8b305e10ac7so4469427b3.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 04 Nov 2026 01:00:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793782821; cv=none;
 d=google.com; s=arc-20260327;
 b=UtAQRduuaahhEJ2hMN7WBALwgIQEuCm2zt7NpSgs/YgQ0V4t2BJuZIzyWyC4eENSl3
 eAOYgt6wwj4JakK0ARPK1BwLwM6+mHdB1+/nDdq/yQcvKn5LIx11Lvvy42a5u3Fg9Bfv
 Rn8VgiedmJM3vCP2yoCdSbQPqa3jA/cyNVx4BPu0hAL1WgYlIsD1/Apji5vjS3k/VO/E
 LFAlgEFjfozRBpT1O1syzarzPPXarWSs0fnTPnPHOg3aIwZGHD7zjFKCKCi2/0IbSn8t
 uxGmaN4ZKcslc6qHQNe4hJOVfWDlYdjnZig3yLAfpwaMNbDpTG0KjtWtvSdTd1jE7Upd
 n/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jTRnpEDN+KWb3ei+FUpJVOT/UTcJwtCB9oaH08vzv9M=;
 fh=uSmHOU8EoYtMA0K723Wxs49CQ7UAtpObez3oGoBDvyQ=;
 b=jHw6GU3tEE7OxSat+NB9AZfR02VnVOQ4Kl9fhuiSNNIa5UPhmGtv8ns7ojUBCNrNDK
 47KBUCfAlNYDj0vz+CwoEbW2EtGTK+s9pa4Z++4JDcTlfzFBVFWBcO+riQCAVI0zdJLw
 SWRzKPGrMr5GqbEjA7KqTFQz9FWPFv5a1QQAHiF+x790Q6yW4V0nmj7JffOzz8xEPC1n
 WWj28G4nAInnVR5lOd4VuY27Cbq67EAqSRiFmaEeNcls9/sRgO/utMElNMlXrunxJJT8
 +4tReNsgVkegrF/kugC1fmt57c/uBoTNFi7OQ9DdYqeJVYvky5lefNh/I8jcFXaIpLj6
 yTMA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793782821; x=1794387621; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jTRnpEDN+KWb3ei+FUpJVOT/UTcJwtCB9oaH08vzv9M=;
 b=ue0Iyl6sYIrYBoyQZx1C/1fR9H7cbpDdBFXCheHPpwGSk8Bjd8Z6Vd/gFS6bIIqJSx
 dJauAqQAMpGfdLPRlz799X7Pr7v4XvZliEcjgLuRLAv+qQ61j0Ddx1Dg64xe0n8NW1bw
 Xm71+T1UEUPT0dkMNXJzNd3vtvOgPT/p2bdawIbGSPQUxg9ToN802XRLXv7au2RKI/UH
 SzZHnUaFobQ+Ouy/uyW4UMPicVzW/9Kk69H4dlhYFA7zpF9bCvpCpJXpGAyuoGQTCu47
 mK+6tCpbSOh+V9a+4wkjCeQ1lcZhIamCKWkf3awTUxuSLbyWsCGmgAGKxNYVk7+ueVcQ
 dT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793782821; x=1794387621;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jTRnpEDN+KWb3ei+FUpJVOT/UTcJwtCB9oaH08vzv9M=;
 b=yxmDzKXxt7HICvhetPKNzOAeJw186CjeqNTEEXlktpOlFFMkHvMP0Y5/PLs8rdYu0O
 n9ekxmQyplHgoLjBORCliuTbfdDi0FsSRcMKNkh0tNpI5x+WOs04pEhbgH74NY3qg5o9
 xcqU91siQCArgCv3Qv/5pjRa6X3E7gbTH9Cfusic0s6j6dOOPUP8by4aNWjCn34jElVU
 t0xHLqCL5EGwb0keamEOHRZNp4OGStYtV1b4K7mFE58HggM0kcHZV4+FgLluWW/+2k/X
 TNMo/am4GeXyxMRUbnjlXQP4zWtn60uxElfskSR3nZS5pD3WFxyrFEuPsCPRdxhsOW1u
 MKHg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwtzzD6KxoS0aZ0ORO0o4s3ILzxVl6Zje3733Yz85XPYAX7ziXQHgaTlChKgU+vbCSTBYxXxT7H7uQ=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8mQEWN9DKBtvbq0je8sebo7tqB6oITkkzFkeKu9TgCTkuQIag6
 WhpCrNVKgmHk5gt1OcJYEYhHyHFnJ+GGIxWQA5Ce2Gb3jfo/lodEATiqtrEn/PsLPhmftzGD6cs
 B/7MLQ8aZN999kR7+JZI1e4lpFWT7ydA=
X-Gm-Gg: AYBFou2BY4AAWpfRbk+WhqW5/yt7e0oR+4UXrIDnUbk2wJhdeQsUhho3cYgn8pd6LNs
 4hlFUI75YnfCN7k5vyFyNYvvpUF+RwuIWWQpekBg02cocQIw8QqT0ogksaRHzaJYBcyRhqwyx1W
 Fe72v6E/9pB9BE1AyOXueMOXubv2jnjblAxwkyv5mWx6kf/dWxaldJW7h6/saGEzSlEgNCaON33
 SmkKwtSd2L1Xg4/YOmnY2rYpVugl8y9tTlBYSvHqMEZdAvuU92auYEX6ZM2YXl5fpSFmA3IqelB
 BKM/pBQ2WeLPxlBMAke63aP2McrH3kuHnfrvAwzUv2RKGEv9Q2Sw4Awle5SS6TVKVccprjPcma9
 yNJNmI7kmLEd6+JQ7wEcZq9ReLyu9bElOAB8gs+EYRsG11/bJezp9uiFjoS+gF/Mue3ph
X-Received: by 2002:a05:690c:f05:b0:8a1:781f:4aa0 with SMTP id
 00721157ae682-8b2b67f1889mr109610237b3.56.1793782820885; Wed, 04 Nov 2026
 01:00:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031-dp-tunnel-bwa-flag-v1-1-f94ed3179349@gmail.com>
 <20261102130145.GU158991@black.igk.intel.com>
In-Reply-To: <20261102130145.GU158991@black.igk.intel.com>
From: Diego C N <diego.sure@gmail.com>
Date: Wed, 4 Nov 2026 10:00:08 +0100
X-Gm-Features: AclHuK-KTLDrGi9C8ZMZKwzhArkycX_ZxWgS8iSAY08wiND5eYgccYF5_KZeB0A
Message-ID: <CACPnnOZHhdwOSDhsnG22SyPD1JsrcgM4Y26QYORd=xoUzhXuVw@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/dp_tunnel: Allow BWA when the DP IN adapter does
 not advertise it
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Imre Deak <imre.deak@intel.com>, dri-devel@lists.freedesktop.org, 
 Uma Shankar <uma.shankar@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Mika Westerberg <westeri@kernel.org>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 04 Nov 2026 15:03:08 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mika,

Oh, I see. Well, thanks anyway for taking time to check this patch and
for answering it.
I'll keep it as my personal patch since it's been working very well
for the past weeks.

On Mon, Nov 2, 2026 at 2:02=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Sat, Oct 31, 2026 at 01:18:18AM +0100, Diego Nogu=C3=AAs via B4 Relay =
wrote:
> > From: Diego Nogu=C3=AAs <diego.sure@gmail.com>
> >
> > On an Alder Lake host (i7-1265U) with a Thunderbolt 4 dock (Dell WD22TB=
4,
> > Goshen Ridge) driving two 4K@60 monitors through two DP tunnels, the
> > monitor whose tunnel is created second is limited to 4K@30. Which monit=
or
> > is affected depends only on the order in which they are powered on.
> >
> > The thunderbolt driver enables the BW allocation mode (BWA) on both DP =
IN
> > adapters: it sets the CM BWA support (DP_USB4_DRIVER_BW_CAPABILITY), a
> > group ID and the estimated BW. The DP IN adapter, however, never sets
> > DP_IN_BW_ALLOCATION_MODE_SUPPORT in DP_TUNNELING_CAPABILITIES (0xe000d
> > reads 0x01), so tunnel_regs_are_valid() rejects the tunnel with:
>
> Alder Lake firmware really does not support this and by forcing it to be
> enabled you may end up in untested code paths and interesting behavior :)
> BWA was only officially supported starting from Meteor Lake.



--=20
Diego C. N.
