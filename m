Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8897CCF2E8
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2026 11:41:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6362610EC49;
	Mon, 19 Oct 2026 11:41:54 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA86910E538
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 11:04:10 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-8253bc5a613so1156585a34.0
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 04:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792407850; cv=none;
 d=google.com; s=arc-20260327;
 b=RSS//58PGiWRVK3lyYKpBBi218oqXgVQ2YWEcs/7O7Q5pvdNo1zVq4VSZav+AGuzGN
 AI0ZdEZzZN6sHD5/rUFUYIkburb7LioK7qrZ/lv6wJZkMy2JfA2yu5swxG7Bip83B2JB
 lrb4jM/MAgCU35Az0NUKpyJpbtaJVxoU6toBqv+utVFmXZYEXNawdtfvQrkjMW1kwnQn
 50oSvjP2BgUVmEWsqFQKM9J4uFJtLFh8aso8oFSJwZWKwHH3azKo8eKxxDsQwhZKJIER
 WquZgcOXMYrC7spLO+06gca3o1KXrMwycU6Ur70ujS/8lVlJDGV3rVSnjjW07jg6YZqS
 oJCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=2RjmAJkJaRfKW8CM604T3xdOE/8FYHsXLHXgCKfQYGM=;
 fh=mweKFOCwBNoIHguNy2N11BgFxUM9hD0SJlPYjVmp9ww=;
 b=pSkdCxqop5KuWfscplqRQZLMiDX4RUd6gH8pVn/5DwN688khfFTxOwc2YwZ4TwSpBG
 CecCHcHqNHj749DgsqxK38phEvLoN/ToY+v5Uorz0O1vG7lQTjHyeUI+cB8wMR8HwSWA
 DPU/WiDUbRw6gegiFkjxweNi86onEp43hEHOIY4NEv38E7ZY0ba+5J9kLR8Mt5vUY50+
 vVDklKT2YWHrs4mPEu+QTYEzgtqCMRBMpgASr0wkkNa3tRPFXDnUko8Kz/l/82IcOkcc
 WmHdLNuloo2W5x55jzcKNUY9I0bf5nuqumg0NAZUNRNMnFaZjF7mS2IreXrzSnGRNDbJ
 s1AA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792407850; x=1793012650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=2RjmAJkJaRfKW8CM604T3xdOE/8FYHsXLHXgCKfQYGM=;
 b=GYXb1IoLlVASGqdbM168SG8nht6qafUj/TZK3DNe5SlBWXvQgWxen6sd5zAmXtC9P2
 hegWuooftETZeOyRD0+qqk+fDzxpv0yCLmBcU7x4g/Gn+k/CeTjKPjhHoT43BHfqi/tc
 nhM+79AgTpAbJ6XC2OJRkKEbISuTMzre6lyAmkVZ9bIv+5xO+r4l+s0oyKsyVuAcp3MJ
 qKHB69mL9yH+JMcPYURh4dANqb4FbQo4Ovg/tql7Nunl+ugpGEgBL5mCzy2JfZo68nG+
 2lCoFTAe02smDSQHCp+G6piC0rV1cLHZ/+PRlQobjG5tR1C8Vi7VG11YmfvACp77iNKu
 MqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792407850; x=1793012650;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=2RjmAJkJaRfKW8CM604T3xdOE/8FYHsXLHXgCKfQYGM=;
 b=wiLiIITS+tJ25wNFl7fhq1Dancx44ySppdL83SJGzyKu2fLPnYbyNVLLTGdA2CYhTe
 nemeDF2Zi5DVZ32i2v6PSnpEUkB5GbCLkqdyZmOFxRmTd0vQ/b6ogsIKjpBG+N0oLf1Q
 HWQLYjfXjIL9rGzXI+CUDcuJX4Wo+4nr1iyw7e/APJfAqpSUvMN3k5WrtrDgSJ72ldqi
 SwtbNp9jMd9Bpad21dcy4SI+TuxVkqCPgGKdCGZQrekhzG4c18pWRM2QPALNppXeEpXh
 YR/FCfGHl0uVIZgSjT5aaiRiRdFDQV1Se6da7e0iyJIl58as2VbwZUmbh4J0iX19iChq
 VMVg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwEhRMV4xi2iILimmlnmqM+KB//VlFJf7tefjbZM4o6zaxyFY2OFNvQBn0284Ggkx/cfHMyrFUjywY=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIoCt0NKZF9keJnfxtZWjBMPgJREGUodxEf0z0HX6mGVoMZym/n
 KTHhPQ85WEPIiC5YqlK3puX9mivTmnHOwr4/rQzYXuamRbIt6nbWnilS9yY1q//M8g/vfEKPXI2
 hHzDuDRkcBCP5b0k565Y3yMefoDSpEuU=
X-Gm-Gg: AYBFou1ySB6rVmW0dTdee1ZeK00WvRE7K0ESPyvJvyMPp8VYfE549kbI2S8O3XvOR8L
 HXOZiYNr7tEETrnLhZmxCCVLv2CnEeAYZqUNu3I2mVl3hHDjfKzGdj1V02qPctwCQm7xrWDBlfQ
 jR3Uki1AVx/mzQ508mJZan35N3n6zl5TZyHhu+DavTiO/ZdlLt17xYeWRht/yLW5yJGr5atcwIR
 QKsuIvSqgy/ooNIccSA59L3ZL/s6fY9Dcu3VPuGyrpfFN6sHI3IbZhbpw+HmNa2tfROaLp/FrFx
 DgQoHgbAefXKDPko/niGKjhTkAFcggYMNFriE0SzOpjReGpHhyK3MZtPyr8Z5UblqgYBN2vR3cL
 CGKUQLEpYy+7vWmTEkAfow3upZrF9T9SF9VqpnIvx
X-Received: by 2002:a05:6808:3509:b0:53a:6769:c35b with SMTP id
 5614622812f47-53ccaf1f442mr5332468b6e.12.1792407849778; Mon, 19 Oct 2026
 04:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20261018-vlv-dsi-owned-gpios-v1-1-3ca18bcda670@gmail.com>
 <atXp2NSPKZUPj8sq@ashevche-desk.local>
In-Reply-To: <atXp2NSPKZUPj8sq@ashevche-desk.local>
From: Michael Anderson <mwwa919@gmail.com>
Date: Mon, 19 Oct 2026 07:03:57 -0400
X-Gm-Features: AclHuK8biEMfZ_1GVer949iI38PfSha8JvD86j9Plx2_choI2YB3QRBY5aZp0yo
Message-ID: <CAL-Wm=O-Gr3CuvCn8iSQceQMhu=LGFz0SPhmWeFL=RiVnoprdw@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/dsi: Use owned panel/backlight GPIOs in VLV MIPI
 sequences
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hans de Goede <hansg@kernel.org>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 19 Oct 2026 11:41:45 +0000
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

Thanks for looking at this. I'd like to make sure I understand before
doing a v2.

Here both users of pin 10 are i915 itself: intel_dsi_vbt_gpio_init()
takes it as the "backlight" enable GPIO (soc_panel_gpio_table,
PPS_BLC_SOC), and the VBT MIPI sequences on this tablet then toggle the
same pin as the panel reset (low in ASSERT_RESET, high-low-high in
DEASSERT_RESET). Do you mean describing pin 10 with a software-node
"reset-gpios" reference and having both paths go through
reset_control_*(), or something else?

One concern: the VBT drives explicit pulses on the pin, and shared reset
controls are refcounted, so a pulse from one path wouldn't reach the line
while the other holds it deasserted. Would an exclusive reset obtained
once by i915 and used by both paths work instead, or am I missing how
reset-gpio handles this?

Thanks,
Mike


On Mon, Oct 19, 2026 at 5:58=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Oct 18, 2026 at 04:12:40PM -0400, Mike Anderson via B4 Relay wrot=
e:
>
> > On VLV with PPS_BLC_SOC, intel_dsi_vbt_gpio_init() requests the
> > backlight and panel enable GPIOs (INT33FC:01 pins 10 and 11) for i915
> > itself. Since commit 8241b55f1ded ("drm/i915/dsi: Replace poking of VLV
> > GPIOs behind the driver's back") the GPIO elements of the VBT MIPI
> > sequences also request their pin through gpiolib, so when a sequence
> > toggles one of these two pins the request fails and the toggle is
> > dropped:
> >
> >   i915 0000:00:02.0: [drm] *ERROR* GPIO index 10 request failed (-EBUSY=
)
> >
> > Before that commit the pad registers were written directly, so the
> > sequences could still drive the pins i915 owned.
> >
> > The Toshiba Encore 2 WT8-B (Bay Trail, DSI panel) uses pin 10 as the
> > panel reset line: MIPI_SEQ_ASSERT_RESET drives it low and
> > MIPI_SEQ_DEASSERT_RESET pulses it high-low-high. With every toggle
> > failing, the panel is never reset after i915 sends MIPI_SEQ_DISPLAY_OFF
> > during takeover and stays black, even though the backlight PWM and both
> > enable GPIOs read back as on. The tablet only has a usable display
> > with nomodeset.
> >
> > When a VLV MIPI sequence targets pin 10 or 11 and i915 holds the
> > corresponding descriptor, set it through that descriptor instead of
> > requesting the pin a second time.
>
> Ah, nice, this should be solved via using reset-gpio, which is exactly fi=
xed
> for the reset shared lines case.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


--=20
Michael Anderson
