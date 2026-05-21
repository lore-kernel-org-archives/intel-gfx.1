Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95916CD5BB0
	for <intel-gfx@archiver.kernel.org>; Thu, 21 May 2026 19:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE8210E56B;
	Thu, 21 May 2026 19:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="lkOvdBwQ";
	dkim-atps=neutral
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE0F10E550
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 May 2026 19:29:00 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-40427db1300so5483847fac.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 May 2026 12:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779391740; cv=none;
 d=google.com; s=arc-20240605;
 b=A4qHfroh5zY4BySlJSrdfZ/XhzhNBy6ACzibUJE2mXVkGrb+pbLRg6Om/DEWqPx3VI
 WM/JEQBhIgLTs6As8DV5Lw+vkyAx7Ek9y4apCCT7PSJfm1tiBm/DbUHBIgv+1O5Z9NDX
 A8X2dJhVZXfXCzt1QG3ZjHOzHEqFydLOzLJRbbuKRuAh+jo9MzdisO9WDqFUlqyQ2J0J
 +m0Rf30qWn6/VZPNWYC0QN+b6Bn0fBK/jQO/sc5EBWMIshbQhsy3j3YKOKx+41+mhGNG
 eExWlf+87WrpGrTekvl0ha1qIHqfrYyE4m9cTfa4KxFZkpk1ty3kIiErkzdT59bkFYpA
 gWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=7ws4Wuj3CXZZNtq4EC+PMmQ3IvviWpx3ix3T35qEpAQ=;
 fh=RjlZ/PTQXvGzQZnK3cAoSXPkfiLU0/E8UzbIpBVSwbE=;
 b=SjydOriWv6XAJvl9+aMFIWCQ/V69+zwMuFDG9+G+EEsOE+RFCf63qQI3NE9wYRdp9/
 qKI5Ts/2wcRa+HJ2zTrTDofNta3kER3FP2LYsDUwqu+aFd9i1jsvmzJHT4KeLqeGAeIu
 mfVTOtmxhNzEbl/8FEFyzmUz/vQpJ5cOSFg0djLnKSSdb6rpt9H3lzVKM6qh3EyRcvf9
 GIk2S1yZC3b3D4Y5hX8Yuh1A4JiBJCgMidtzYaQYwiudbkcdxHZRIwqF/sNcKguGQ9wp
 A2/zlwX8q9uiTT5TPmV2y3EcPnfatJLyOclYETrZmOhupbNP8SmpWqOCkkYI+3nCSeRX
 fj9A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1779391740; x=1779996540;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ws4Wuj3CXZZNtq4EC+PMmQ3IvviWpx3ix3T35qEpAQ=;
 b=lkOvdBwQZloOsTveTWFaja1Dieuhw7jgKYBJvxE1ELnb6wjCi2a0sUJA5e5UcE26yO
 h38yX6zkoPfMHQWY8uXJRqIBnMlqUNwOM19GZkwaAMSfSVInt2T+WVNydQi9OhEX7swB
 KRN2/0FT6Tl3tvi3h94FEDBU+inHJGn6VrlailO1K7tJZRAss1ieKBh/nZVwj8UsvTTL
 pfUx1mFl+QSKlLs8mgoq5eNauNCkTG7tTkDTg7XGRzgUd0VjJ091VlE/AjEcuNNIbnru
 J/unE1YjhT9rfgXiLroCzfMgt+IegqnERfv6sTZrHzJ6zVaRiBgIxV65gf7cRPEAdx1b
 PJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779391740; x=1779996540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7ws4Wuj3CXZZNtq4EC+PMmQ3IvviWpx3ix3T35qEpAQ=;
 b=AVsc3w4mj3Te7AWTb0loil6iHuD2Du1KNArkm5pvA8xBOspm5V2HAb8GbM1hk3PBKq
 87Ygdox9HVeDKl+IeNx4I+33A1GDvKr/K0wlpJQyQ7TGXJgGLhOvkn9nReFiAW9bDgOH
 Me/1QVE4wQSSJUb3hA0H7Pb2SHPDByl2LOVshGO8M3JZT3hiXFumvLvEus4nJARvd6Gl
 4KIQVIysL0gtKXe9j9p9wh75Ra0kvSVXyC5MR89aaUzWr7MkdcQoKai+ZdUp0jh37jvM
 feeLpV5EZ0T1kIGISeKwSnp3gY7vz5SlzCcYhf6zJ70vuvz18dLhaUwHdQc0V8hrkyhn
 uufA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/zGN0VM8OPvKrtWCeW/tdXzcdxp7WF11gkdUkDlx8TRxIuHJClzx36QqNTLi0EBthNQm58S4gySyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywp46ZdhgAtfZ20CNG98xGvNzUf5figMk/8lkiYOQE1vSPQ1Uxr
 A8o9ITzUDhbgdbWLiVv2QTVJYF1JWH+1s1Y8GRbdx6SX3+Xe8tDuVsu56bKlUg+feo8/l2oFras
 YoFOycJZIer9/RCRmlMWJQcvY8pi4Fbpi0MTkUf2A
X-Gm-Gg: Acq92OGpjex5N0Cob/+nEDN9exsJvsChqCOgqHzd7iO8W51mBu62IvJeQn6aIjTlk20
 t7kPydPAeF+sIFsnGjIBC4bL6AwuiqlgZKGxOg+EQF4PUqFmsyZrdwYEsXlEaaQOeK4nVkKABwd
 yJjq2qglukpAAKLRgjzrbiggoXWOYK0ds2Vc+kg3CrXTkGq+7wvZun3JHoKgZTIHw0H5h3wAnNz
 nMmLNM8Ier7lucosKcGp967LsQ7zPOPqMYo9s6c7EbbF/NSDMVzA22q9ab/0TUSMClm2a1596uG
 NkB3N1pJpD2b/aIedGFUwzk0CthuwJHeB59Y50jwUeCzvOdGqYphGvuxrLMfXxrOnVxs12QpGxI
 j6RpXb350gEfL72UDiY/bm+uuyxxEzaCI4m2ADWbbh+tHpAvL902POjrWUt61
X-Received: by 2002:a05:6871:4390:b0:42c:5ce:3fbf with SMTP id
 586e51a60fabf-43b5aa61c4fmr270735fac.13.1779391739185; Thu, 21 May 2026
 12:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260521180143.2143262-1-sean@poorly.run>
 <6d8e36e2aea806f9973b3c501aad4523f7316d6a@intel.com>
In-Reply-To: <6d8e36e2aea806f9973b3c501aad4523f7316d6a@intel.com>
From: Sean Paul <seanpaul@google.com>
Date: Thu, 21 May 2026 15:28:21 -0400
X-Gm-Features: AVHnY4L2anUydq_L67QU46fv9RB9GULiXwcGBVPw2CKypMRulFNg7KoJtoZEDCs
Message-ID: <CAOw6vbL-+YZED15LFH0PRbxWbKhkOohNd+fnJMmVtdvF=A31RQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/color: Fix plane color pipeline programming bugs
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Thu, May 21, 2026 at 2:39=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Thu, 21 May 2026, Sean Paul <sean@poorly.run> wrote:
> > From: Sean Paul <seanpaul@google.com>
> >
> > Fix two bugs in the plane-level color pipeline programming:
> > 1. Fix a step discontinuity in the Post-CSC Gamma LUT when SDR dimming
> >    is active by clamping Segment 2 to the last user-provided LUT entry
> >    value instead of hardcoding it to 1.0 (1 << 24).
> > 2. Fix a typo in the loop condition in xelpd_program_plane_pre_csc_lut
> >    for Segment 2 degamma programming, changing 'while (i++ > 130)' to
> >    'while (i++ < 130)'. Also clamp Segment 2 to the last user-provided
> >    LUT entry value instead of hardcoding it to 1.0 (1 << 24) to fix
> >    a step discontinuity similar to the Post-CSC fix.
>
> One fix per patch, please.

Ack

>
> For #2 there's already [1].

This isn't in drm-tip or drm-intel afaict. I'll drop it out of my set,
but could you please apply it?

Sean

>
> BR,
> Jani.
>
> [1] https://lore.kernel.org/r/20260519075245.383864-1-pranay.samala@intel=
.com
>
> >
> > Signed-off-by: Sean Paul <seanpaul@google.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_color.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/d=
rm/i915/display/intel_color.c
> > index 2d318e922671..9b807b024ec3 100644
> > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > @@ -3953,6 +3953,7 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb =
*dsb,
> >       enum plane_id plane =3D to_intel_plane(state->plane)->id;
> >       const struct drm_color_lut32 *pre_csc_lut =3D plane_state->hw.deg=
amma_lut->data;
> >       u32 i, lut_size;
> > +     u32 lut_val =3D 1 << 24;
> >
> >       if (icl_is_hdr_plane(display, plane)) {
> >               lut_size =3D 128;
> > @@ -3963,7 +3964,7 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb =
*dsb,
> >
> >               if (pre_csc_lut) {
> >                       for (i =3D 0; i < lut_size; i++) {
> > -                             u32 lut_val =3D drm_color_lut32_extract(p=
re_csc_lut[i].green, 24);
> > +                             lut_val =3D drm_color_lut32_extract(pre_c=
sc_lut[i].green, 24);
> >
> >                               intel_de_write_dsb(display, dsb,
> >                                                  PLANE_PRE_CSC_GAMC_DAT=
A_ENH(pipe, plane, 0),
> > @@ -3975,8 +3976,8 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb =
*dsb,
> >                       do {
> >                               intel_de_write_dsb(display, dsb,
> >                                                  PLANE_PRE_CSC_GAMC_DAT=
A_ENH(pipe, plane, 0),
> > -                                                (1 << 24));
> > -                     } while (i++ > 130);
> > +                                                lut_val);
> > +                     } while (i++ < 130);
> >               } else {
> >                       for (i =3D 0; i < lut_size; i++) {
> >                               u32 v =3D (i * ((1 << 24) - 1)) / (lut_si=
ze - 1);
> > @@ -4023,11 +4024,11 @@ xelpd_program_plane_post_csc_lut(struct intel_d=
sb *dsb,
> >                                                  lut_val);
> >                       }
> >
> > -                     /* Segment 2 */
> > +                     /* Segment 2 - clamp to the last LUT value to pre=
vent step discontinuity */
> >                       do {
> >                               intel_de_write_dsb(display, dsb,
> >                                                  PLANE_POST_CSC_GAMC_DA=
TA_ENH(pipe, plane, 0),
> > -                                                (1 << 24));
> > +                                                lut_val);
> >                       } while (i++ < 34);
> >               } else {
> >                       /*TODO: Add for segment 0 */
>
> --
> Jani Nikula, Intel
