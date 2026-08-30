Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60B1C61DD3
	for <intel-gfx@archiver.kernel.org>; Mon, 31 Aug 2026 11:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFE510E7EE;
	Mon, 31 Aug 2026 11:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="p+q8I3np";
	dkim-atps=neutral
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com
 [74.125.224.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB1610E11C
 for <intel-gfx@lists.freedesktop.org>; Sun, 30 Aug 2026 06:25:44 +0000 (UTC)
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-66d0743503aso3440968d50.3
 for <intel-gfx@lists.freedesktop.org>; Sat, 29 Aug 2026 23:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788071143; cv=none;
 d=google.com; s=arc-20260327;
 b=cN8EX9u6Y7CsPytUgxaig2WxHP3joo6bJiuEdUmwy37QoS1j2CDKrwNc81q8cSpGQm
 BSSB+frfrc4Uilk/nDZ/vxxl097jFOyDi471jQuJEVA6+9smyEi3S78tdg0xAMXVuRyt
 fpekKdiLvN/6xxZCj6MgHP/ZGDZB4jjml9aoBd1jkSnTWmslrkvY0Y2hdq6yf4rgUNbw
 gwRtVOj/SSp+bUAC63Z1ypQ4o4vlh7IQRzcW3YoXVXyAymQlcnJe8LvwuXGvaMUuiOO+
 j5S0/TA5ZUM5gwefmwCPxnk3gYrnTjU8jrP5mn6+GpE73Mbflg3FvlgGFfP431cPAHgc
 7RZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ie2zZl8YsHAeQXHgNP1pjeAs7NQ+FFglXIo7DLINxR8=;
 fh=cKUy68CU4iKzeQZ6jXTeidR4Ug99ZQXHrPeJ/iUQBNc=;
 b=mmx/ZQSWiVW36PUFwEiWpmcMZqlGmab5mbZcrNftVR2jNgKAJuA11stJciRsIgnZTC
 DFQEACDbp/wRZicikMhQ5gKheo2fgrIg+ENPTDd8uqEfaCHWrw2ut9As5RA9GpHPZbuu
 8vRgd8tiafFSIZwWh+k+4nqKp5aoBiRVEF4J/kz+3iPMsrAwt8Llp3vrLj3iNhwOiNTx
 tUd9IaR9C5AIuCiNceUHoZmvjNvzlv++B/P4mdUGPNL6Z/61B26F695Gk0YvWx9rOBuK
 4T9Vk5O/QM3IRjNf+QW/FevLApAosKqFnDGR7+S7xe0q7mv9tT2zBafcd7cHxTsas1+t
 He/A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788071143; x=1788675943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ie2zZl8YsHAeQXHgNP1pjeAs7NQ+FFglXIo7DLINxR8=;
 b=p+q8I3npwgst6WDLaG+F61f29ZJqMZvB7kK+5FZdOYgYyPAGqz7PmoRlL7MHoCGZLS
 +aLfsAMYLQDcCDX+y4hhMMfgKfA5wV/GyHPaf7fF42M7/IM74p0y74FlUtoVIM1e0M1j
 Iy5thH/MAWSov9Ejei1+jUq2yYgf14q0L5fbd3TB3u0zJpmoMglPN1z67cTa62SVlhpI
 On11WwKv1prqU2FDE4olz4ESByfQtuQ2NucIMz9GXjKxScwt2OyqUbuRdHbXrLzPkd7J
 bGDM6IMJlFA14iYb3DJRCgzOIeKKxXJuZPQ+D+xVY2pc7cRoInF/ItSK5p+GxAbg2wbz
 LG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788071143; x=1788675943;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ie2zZl8YsHAeQXHgNP1pjeAs7NQ+FFglXIo7DLINxR8=;
 b=ONlgYAh12cRks3Mbqal3V+m8jWMmSYewItHSnnuIdD7B9h9JpYdmITD0B7i2y7DE/d
 lbsDC/8w+AVhtUQFDalKP0+KmAr0NAnnFrBRIL/GBA+WOXIVRvFkyHIOnNjIsdtiVSmW
 BCjRqcBhwrNfWmLcn9lS3D4gsRVBcvRBegbgP9A2PnCoLyX5t7rILQFnQg+uqHwebAgl
 PT8y8804pbkIznriKFT2Ww+HCtPmneviMOBDhT66V8SwyWH2YewVa16N0/CxaphPbY5c
 cgtYH6qjiJy/6rOx2fFRzHYHETkuAuhpgOJPyFHqJcdwj4PMEa7wooKdwMFwe4JD+4dT
 5ytA==
X-Gm-Message-State: AFuF++mNLwguq3WeWefQRbaHGT6rCzMOU3sevlcqCcUvtEHwE6IGmAql
 XWEtOUFk8XQWpVbfDyCKYYr19NSR/5Zm3Ut6/Imu0C4ktUOZP5Wz6oLCrmdSVdAtRRYHaM16ZfP
 tYCmYk9eLj/twOPP1Bh1zAe5enedNsiM=
X-Gm-Gg: AYBFou2uUvLCvrPNsy81dRPodnMfk1ymyx4Hj406g39NWyYJQF7l+0p2JEly5+74iI3
 +LV1aZqCiLq5vg8nCJ3CIwBWDKcHu2sWalL82ZK62Eh/CGyfnzxdAlh06wzFfhTOiSHv9t6DC52
 U5NvruqvU7f2Cg2LeRrO+nlmETt8RUloEgK+cX9H23l0H2oXzaqjZ4hWK9/OGYL9rT/jcf9jRKE
 DAQD691VB+VIGhJhR94wUeN0y7ZXP/n/qRvtBZq4u0bGHPHVxaD6+f3BXs0S2PoiAzJkpcC2Ier
 YooomYbaBTHrnivVt4NIYQ27biS5fygdl2hQqyH4GVW84z5WRCSaxUbn6SFO3JhW3ggGMq1lNkW
 k4PPSRvSc4kAVjUTyZYMKDReYsS0sSGxDuQ==
X-Received: by 2002:a05:690e:480b:b0:66e:61be:b280 with SMTP id
 956f58d0204a3-66e61beb351mr919322d50.48.1788071143285; Sat, 29 Aug 2026
 23:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260813064902.367504-1-kartikey406@gmail.com>
In-Reply-To: <20260813064902.367504-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 30 Aug 2026 11:55:31 +0530
X-Gm-Features: AcwNN1Uz1IASuABwBGrNzT8vqscd8g3KsyTVjcnjYQteHxWUUv-5lbfRLHAaf4c
Message-ID: <CADhLXY4YXGWUi8JcfdYMJ4HhKMKS2RLg2WvnZnku_XK45m4-fQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915: Guard against NULL driver_data in
 i915_pci_probe()
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com, 
 simona@ffwll.ch, krzysztof.karas@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 syzbot+db96c5ff032f4292a8dc@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 31 Aug 2026 11:47:31 +0000
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

On Thu, Aug 13, 2026 at 12:19=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> pci_match_device() can return the dummy pci_device_id_any entry
> when a device is force-bound via sysfs driver_override, in which
> case ->driver_data is unset (NULL). i915_pci_probe() casts it to
> struct intel_device_info * unconditionally and dereferences
> intel_info->require_force_probe, causing a NULL-ptr-deref.
>
> Reported-by: syzbot+db96c5ff032f4292a8dc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Ddb96c5ff032f4292a8dc
> Tested-by: syzbot+db96c5ff032f4292a8dc@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> v2: Drop Fixes tag, this isn't a regression from a single commit -
>     the unconditional dereference of ->driver_data has always assumed
>     it points into a MODULE_DEVICE_TABLE()-backed entry, an assumption
>     broken by the generic driver_override fallback path, not by any
>     i915-specific change. Add Cc: stable instead. (Krzysztof, Jani)
> ---
>  drivers/gpu/drm/i915/i915_pci.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_=
pci.c
> index 82415af47d54..2f03f95945f1 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -958,6 +958,9 @@ static int i915_pci_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)
>                 (struct intel_device_info *) ent->driver_data;
>         int err;
>
> +       if (!intel_info)
> +               return -ENODEV;
> +
>         if (intel_info->require_force_probe && !id_forced(pdev->device)) =
{
>                 dev_info(&pdev->dev,
>                          "Your graphics device %04x is not properly suppo=
rted by i915 in this\n"
> --
> 2.43.0
>

Gente Reminder. Let me know the status of this patch .

Thanks

Deepanshu
