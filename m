Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E17EC531F7
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Jul 2026 14:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE6510F131;
	Thu, 23 Jul 2026 14:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nu2dRBj5";
	dkim-atps=neutral
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com
 [74.125.224.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8B210E486
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Jul 2026 16:44:29 +0000 (UTC)
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-667f1390f58so9743170d50.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Jul 2026 09:44:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784738669; cv=none;
 d=google.com; s=arc-20260327;
 b=D+DiGBGLbRTywRFhbygRV+xyBErMJwlXBjYTvwBYIR+WikbHvq7+iNU8iCCA8AWMWd
 v5mODTYSstIBX4bbM8OQpbZ6oeWanwiDmuIoqzb5EP/cqG9OhClGCN/BbciLe3NkbpK7
 nnFjVE9VO5BASNPzKKBRCkkh0T2liZziuEXiKqupBWpvaifnGDLISgV9Eow1yGzZKxm6
 2sT+6WNBXny3JWHiGuwTS68K1hKiQW7CzaR5ofeiGOTYMCVNLF3AGJ/Rnx64DodHn6K3
 LOrPYSKkH3RKhPN5cinfnsDukYmYAwc1Mqr+hiXg/5mg2SSYnLwl5nHbaMGLFrRaChHF
 npQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6vCGv/RyeVFnoEW9tIkNt/ZBPJkW6RlvdlpEDoVrknM=;
 fh=bVj4xFcb6aTir7w5epYtdeRyaYfA2qmtAfDxVhi1/bk=;
 b=J3ogHBlvHtPP3x3aGIGYh5nAzWwNr/lLHx0jE5DA3vM/r+6GfmV9mqA5VDcieJOge9
 Fpe/X5tbUPQaNTaJ0lN1ktEfRlD7ItOezZ12xhg9e8cUR2ck7CxbViDaehI7XvzBBDzg
 nIRrA4Xrpttdr9kJgr6hBxUjzUrFrLCqEhHs7ILuhm3FHy/idG+Jsje/KRSxFZjLSGBS
 8ZElUNUlIvxXHHQZafIovLsiedwDadY+/q/+la4SxSYpx4VSOWq0sqXUpmSKlulUdrkm
 i+7oRSmzFGHd6nX4APRuqE0uL/1VNthIMYQeona8yRjSLTf7jEbf3uC16fXJzAHeqAYF
 A1uQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784738669; x=1785343469; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6vCGv/RyeVFnoEW9tIkNt/ZBPJkW6RlvdlpEDoVrknM=;
 b=Nu2dRBj546yt7EYskjRYjLJXSglLr1Tk4Upm+bGqJ1zLDPMax9IfT5JaRhLVxbRhhB
 O92emjePqIAdilw/2pitl8xXg3YNuMYFVXwIrFcTEw8rZQc8q/hx0dDBFG90ivOY4ab5
 6rsQgsSqozVzQp2WteYAinkDvLVMwRVgnZ78+zTBgoWNoeDd9H2ZOSK0UKpSxWT0FR82
 6iAWzNgp6lXEh7247BaQomiTJCt+xFpG4akqNSv2r4uaTormlczmfqcha5hDTzU4MTjE
 F3p3rvKPEQQ5OJq5Dd8ILC7XPYBig4Vhd110ytjad04JC1pAxNfwDtoIAFwLtq25IEl0
 1T3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784738669; x=1785343469;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6vCGv/RyeVFnoEW9tIkNt/ZBPJkW6RlvdlpEDoVrknM=;
 b=TMY+i9WOX5uER4iICGTJsjeoHg6keSeY2MDzPbNOgBAA9h4DLwDyEkB3OXb7+AcOby
 UbG+IxMfV90h1OdkFg/HWijNQ9sKwMBwf0VHv6r6F8d3idBZFwrcR5ExzdfWFa6bTCbq
 5GF/JRRG08GwUBUBhm630FyZjUGny+S+YqsZtutLjiL01Azh9lKb/Q3Oyr7axZCOE9UT
 1E1aDyjZKmdLOk9tU1TeEhltW//o0aAM/A9xEcGZ+1VYHgm8apx+88kms7Rogkhloxct
 t2Qe8mnU7Zo+mrcNeoPrkgK6jPjNzmJnY2GnqHgFUNkxNV0f9WdzVHC5Ruqf+vrS7CZM
 wgqQ==
X-Gm-Message-State: AOJu0YycmVjocKYmrt5i29+daCs/LPg0Wn2YmfiMpFez3PJW32G3874k
 Dl0vUrG+BPgcdWiReqJmjmDjh8ZzF8Fp4OtqAHLE0irmsxVy29gXFsyUNIMmxLhJqkmRBewstIh
 cQrv6L6AW8QyZAQm4q6w+GPac2Nw5m/Y=
X-Gm-Gg: AR+sD11kyZAqq1HTJET3oeUwdGctyFMfQWzmTBGI2xYX6K4vRP5jB15KSOQsYoUnA68
 0O/mxiYIkaqsdqIaxWDkO4D2SYBMvVOYqyPB2KoyWl5xvS8Pvyzu2jjKOOsXkoq1TLwCTSOYxwu
 mGxpmvIEUr+sTXh6Ju8DceEAEQUY36NgOsd7guEISukWgvheG7Ux5NQPHXsJw7NTfuxbD/IvtU4
 opA40zP8DSEqKdRH12ylB5/Ce9QcRjOafFfiRJCpVD+GrbNlgZx5Os64GSz4LYzb7ZkbpcSCJWF
 ixnJctqF5y7WioflBK4/JSBo59g=
X-Received: by 2002:a53:a6d0:0:b0:667:e2e1:4c with SMTP id
 956f58d0204a3-6683bb03e7bmr4142068d50.2.1784738668720; 
 Wed, 22 Jul 2026 09:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260722154802.3760046-1-johnfoushee@gmail.com>
 <DS4PPFE901A304F30C76A6DDF48BDAAE920E3C12@DS4PPFE901A304F.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPFE901A304F30C76A6DDF48BDAAE920E3C12@DS4PPFE901A304F.namprd11.prod.outlook.com>
From: John Foushee <johnfoushee@gmail.com>
Date: Wed, 22 Jul 2026 09:44:16 -0700
X-Gm-Features: AUfX_mwNuDWTzYcYl8OndK4uZQVeNS7dreLBBMCpSlV4-VUHUR7Lah18YjNHuuI
Message-ID: <CAGsDCxQ30bUzMbzSigA-o55zX=vzyeP91g38ZDvzJftppp17uA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/backlight: allow hybrid pin-enable + AUX
 brightness panels
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 23 Jul 2026 14:08:34 +0000
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

> Hi John this fix has been already floated, reviewed and merged some days
> ago to drm-intel-next.
>
> https://patchwork.freedesktop.org/series/170522/

Thanks, glad it's fixed, and happy to see the same conclusion; please
disregard my patch.

For the record: independently root-caused and tested the same change on a
Google Pixel Slate (nocturne, Tianma Y156ZAN02.0: advertises
BRIGHTNESS_AUX_SET_CAP without AUX_ENABLE_CAP, ignores PWM for brightness,
and resets the AUX brightness register on every panel power cycle, so it
resumes from suspend to a permanently black screen without this fix). With
the equivalent change on 7.1.4 the panel's AUX brightness register is
restored across suspend/resume and full-range brightness control works,
so feel free to count that as a

Tested-by: John Foushee <johnfoushee@gmail.com>

for commit 7d594b24 on real affected hardware.

One question: the regression (ed8be780bdbc upstream / 102d44b3a8fa in
mainline) is present in the shipping 7.1.x stable series, but 7d594b24
doesn't carry Cc: stable. Will the Fixes: tag be enough for it to be picked
up for 7.1.x/7.2.x, or should it be nominated to stable explicitly?
Affected devices are unusable after any suspend without it, so a backport
would matter to users on current stable kernels.

Diagnosis details, DPCD dumps and EDID, if useful:
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16679

Thanks,
John


On Wed, Jul 22, 2026 at 9:22=E2=80=AFAM Kandpal, Suraj <suraj.kandpal@intel=
.com> wrote:
>
>
> > Subject: [PATCH] drm/i915/backlight: allow hybrid pin-enable + AUX brig=
htness
> > panels
> >
> > Commit 102d44b3a8fa ("drm/i915/backlight: Fix VESA backlight possible c=
heck
> > condition") restricted the VESA backlight path to fully AUX-based panel=
s
> > (enable and adjustment both via AUX), on the grounds that the hybrid
> > configurations are not currently supported.
> >
> > The hybrid pin-enable + AUX-adjustment configuration is however already
> > handled: intel_dp_aux_vesa_enable_backlight() falls back to the PWM fun=
cs
> > for enable when info.aux_enable is unset, and
> > drm_edp_backlight_init() supports aux_set without aux_enable.
> >
> > At least one panel requires this configuration to work at all: the Tian=
ma
> > Y156ZAN02.0 in the Google Pixel Slate (nocturne) advertises
> > DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP but not
> > DP_EDP_BACKLIGHT_AUX_ENABLE_CAP (DP_EDP_GENERAL_CAP_1 =3D 0xfb,
> > DP_EDP_BACKLIGHT_ADJUSTMENT_CAP =3D 0xff). The panel ignores the PWM
> > pin for brightness adjustment, and resets its AUX brightness register
> > (DP_EDP_BACKLIGHT_BRIGHTNESS_MSB/LSB) to 0 whenever panel power is
> > cycled. With the PWM backlight funcs selected, the panel comes back bla=
ck
> > after every suspend/resume or DPMS off/on cycle while all driver-visibl=
e state
> > (link training, PPS, PWM duty) looks healthy.
> > Firmware rewrites the register at boot, which masks the problem until t=
he first
> > runtime panel power cycle.
> >
> > Allow the hybrid configuration by requiring only AUX brightness adjustm=
ent
> > capability; backlight enable keeps using the pin/PWM path via the exist=
ing
> > fallback.
> >
> > Tested on the Google Pixel Slate (KBL-Y) on 7.1.4: i915 now selects the=
 VESA
> > AUX backlight interface, the panel's AUX brightness register is restore=
d across
> > suspend/resume, and brightness control works over the full range where =
it
> > previously had no effect.
> >
> > Fixes: 102d44b3a8fa ("drm/i915/backlight: Fix VESA backlight possible c=
heck
> > condition")
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16679
> > Cc: stable@vger.kernel.org
> > Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> > Signed-off-by: John Foushee <johnfoushee@gmail.com>
>
> Hi John this fix has been already floated, reviewed and merged some days =
ago to drm-intel-next.
>
> https://patchwork.freedesktop.org/series/170522/
>
> Regards,
> Suraj Kandpal
>
> > ---
> >  .../gpu/drm/i915/display/intel_dp_aux_backlight.c    | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > index 7a6c07f..a5c03c3 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > @@ -616,11 +616,15 @@ check_if_vesa_backlight_possible(struct intel_dp
> > *intel_dp)
> >       u8 bit_min, bit_max;
> >
> >       /*
> > -      * Since we only support Fully AUX Based VESA Backlight interface=
 make
> > sure
> > -      * backlight enable is possible via AUX along with backlight adju=
stment
> > +      * Brightness adjustment must be possible via AUX. Backlight *ena=
ble*
> > +      * may come either via AUX (DP_EDP_BACKLIGHT_AUX_ENABLE_CAP)
> > or via the
> > +      * BL_ENABLE pin, which the VESA backlight code already supports =
by
> > +      * falling back to the PWM funcs for enable when aux_enable is no=
t set.
> > +      * Some panels (e.g. Tianma Y156ZAN02.0 in the Google Pixel Slate=
)
> > +      * support only that hybrid configuration and ignore the PWM pin =
for
> > +      * brightness adjustment.
> >        */
> > -     if (!(intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP
> > &&
> > -           intel_dp->edp_dpcd[2] &
> > DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP))
> > +     if (!(intel_dp->edp_dpcd[2] &
> > +DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP))
> >               return false;
> >
> >       ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> > DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &bit_min);
> > --
> > 2.47.3
>


--=20

@foush
