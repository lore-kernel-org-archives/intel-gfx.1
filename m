Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C193F4613D
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 16:03:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9B210E4D5;
	Mon, 23 Mar 2026 16:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oq93M5Yp";
	dkim-atps=neutral
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B795A10E5D4
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Mar 2026 01:53:47 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-4043b909ed4so4106204fac.3
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Mar 2026 18:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773798827; cv=none;
 d=google.com; s=arc-20240605;
 b=RJi748rRCRrRnV+lmlJarF2XcCLTjFNb68IL9o39Io8igqXZ6PUhVj4N8qQuBcM1hu
 Z8VCWeUkedSMNhZVy7eyuGuygkNJBS5jz27WZ6tnqNfYsHT2vesD1qpbx9XV/4KfLDTl
 2t3KnSmYrIdyGA9M7B+BVXLqf8U5xd+hEsEc44A6CQsqmMZ4MstIjxA2gEkKdLmQTz13
 vpwyjXcZUu/eXFO/ehQVNac5a61hEcNb+QVLrv7VnmuBFAL6x9+dx1h8O6pzP8FCZjs1
 IvU8z/Bsi5XwA6+I1lFOyuVnINEoYeEnRLStPsjMoWd7IgxY2KrVqGZA15YM99xwtbBG
 OAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cp9Ep/hNNUKT/Q107TyB692cBkvdQAk6sieLmz8xQmg=;
 fh=y+9Ejl92RIFaY60gXgKdM71YWphLSGuOavjO/NHeSMI=;
 b=FP8Yhfu7Tu+GmQtdtKPe1wQSZVhCf3UZir+UU8n4M2/iJJL4mw8lwqYZxFnFfGE+eV
 jiAT6IdOOo0EngB8LWlB2MERTgs5TUqyOnLC7spL/sMY7RKWCV2lhZI3F6tTiHtF/AMc
 DQRPym+9PR811RQocUGF/Hx4NkUG9eMLrrbnjy0htRCj1JWKMwAEeHydj0BqA+3MnR64
 lFiLFP0NfsrjA6h7XSjBwceESHQxZAuHIS/FWQ5fqEnB8nuBQ042L5cw9sCAYzDywW3o
 duRQes0pOSMs8DtXazKFnjSLNI5HIT0QriEtzzj9dB9Q2yy/YMjFGj0kkOYUp8EtUtxE
 KF0Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773798827; x=1774403627; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cp9Ep/hNNUKT/Q107TyB692cBkvdQAk6sieLmz8xQmg=;
 b=Oq93M5Ypo1IoM7uJy+2vr0sn4ZxZhrqkYVsw6Nv47twXCyOnHMbw0DJVvMuRhPQ3//
 pfuyJ6URGsE3NZlha0G4+APHPdgH2bpqylpDdS1IKs/e385IL70aSCuIiePA+8VDE6xw
 H/dzbAQGlxFfrnA/L/Kj5Wwn6m7myDpJIqMg4GPJ74ZHHaVe1vKLWskvo1HNZWyB0Z8s
 ZpsAyZTkGqltxWOKPUgrMQxbVsbb/f/ShP85qOHeTz7suMqNgkmXAIzakfWQXUmMmsm+
 5hVvGi/BtvRaJl0W7EzLNOwZ7xDaV7OGet7LwWeykxsyy5TAqpJPgRpi7mqvX5OIeuq5
 eFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773798827; x=1774403627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cp9Ep/hNNUKT/Q107TyB692cBkvdQAk6sieLmz8xQmg=;
 b=Uj40dmbo527J0qgqZgtblBArrktvcidiuyOJAQ7VDbFT9sbSnjBwhpabPP/3ifLWmH
 umuY2J8ePmS30kIbP4vlLlDmelkTldMskhb9daoN+erTe8w2Wn0Otc8r65NGSMGx9rrE
 QLGxC0blEmR0wWiJ0FhQlWm8O/jPpS7pbb+GrOuRdX604NQwZA2ppaarNbUqlK8r3UYl
 zvhlw5lEoiecSftf6frwDy/0WqcEatl8pZHAwl7D/Msk55V8sIb/1+CWSaAhDiLi9dpp
 1Wzhh8QtyqFqHZLx7fui2ud2ClHJnYx8sHUfT5nGxnOYoUH2lcnSIlcaRyXb1kSyIvCF
 79xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2njpYZCe4OkNEqkjVcqAv3YZFqrp5z2vydg8Yw0oOVh9nKsf4zpXSnzyhnGtKqvASRiIESBpOmCE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5y0lHpHcUEe78C8zxwxLSGdWk3Y2iKv7KOjmXV7QeT27Yta0d
 HQWS5lhQ7Rqjj7T703e3h0yI8eT6I5A9002LpPxvaFOHdjxkjpq1QDcyO73ijj2wS2/p3fB8NTu
 kAlddfH+6br4MTmX5vDWmi1BQFWYaOHs=
X-Gm-Gg: ATEYQzzumk9GqtnQ5dFiA/XzivlIySmURlJKSC/T9RhjSR4I+yCkfrMNXdtiPqh/u4e
 rbFwb6vUrxe1P+zQHiAYIMcGg1TWk8uX2AYOin1QpdAVarr6s6gHnGpx9JQUTp5S3l8FVvcKqtg
 +3eO+k+bv8w7dAhWp/E4Fer5Jm0rEp+yIU4+aats1M51E/fTWE6CINpH/e8nVAQ2i7I/YqaaJC1
 MzyPh088vUiacxcFBgVEiswC6eTNIAhOroYR5KjfjlDFKsmagJNSqYPSgkZVD8MTqP6DfAEuP1/
 XUFT9SPXcli2bUaqIGenlsgq9Wbwwke4gQWlmbod5KGMM0j9JRoTCROHDgOWP/HXFiwR/mZaJXe
 77D9juY+fZQ==
X-Received: by 2002:a05:6870:ebcb:b0:417:1ba0:7320 with SMTP id
 586e51a60fabf-41bd41cda0bmr1126217fac.33.1773798826608; Tue, 17 Mar 2026
 18:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260317185920.43387-1-hanguidong02@gmail.com>
 <20260317191538.43535-1-hanguidong02@gmail.com>
 <c14b399c9c6bf96f8c7d33615561b0d787ff175b@intel.com>
In-Reply-To: <c14b399c9c6bf96f8c7d33615561b0d787ff175b@intel.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 18 Mar 2026 09:53:36 +0800
X-Gm-Features: AaiRm52nR_v9OD3YNBiYZ0KMPL0_wApDenMFnYnmDk762NDAGBxD5i0lDEEX0xA
Message-ID: <CALbr=LadoX8g--rtU==HQfNQ9f1=KP=7AS-PGfooKaSbnYPz+Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/i915/display: initialize string params to empty
 strings
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: gregkh@linuxfoundation.org, dakr@kernel.org, rafael@kernel.org, 
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, 
 airlied@gmail.com, simona@ffwll.ch, gustavo.sousa@intel.com, 
 demarchi@kernel.org, jouni.hogander@intel.com, luciano.coelho@intel.com, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org, 
 akaieurus@gmail.com, me@ziyao.cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 Mar 2026 16:03:23 +0000
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

On Wed, Mar 18, 2026 at 4:12=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Wed, 18 Mar 2026, Gui-Dong Han <hanguidong02@gmail.com> wrote:
> > Passing NULL to debugfs_create_str() causes a NULL pointer dereference
> > upon reading, and is no longer permitted. Change the default values of
> > dmc_firmware_path and vbt_firmware to empty strings ("").
> >
> > Existing code that consumes these parameters already verifies both
> > pointer validity and string length, so empty strings are handled
> > correctly. Furthermore, heap allocation is not required here: these
> > debugfs parameters are created with strictly read-only permissions
> > (0400). As a result, the debugfs write operation is never invoked,
> > meaning the static empty string will not be erroneously freed by
> > kfree().
> >
> > Fixes: e9913f0bd2e1 ("drm/i915/display: move dmc_firmware_path to displ=
ay params")
> > Fixes: 29292bc6cc37 ("drm/i915/display: Move vbt_firmware module parame=
ter under display")
> > Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_params.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/driv=
ers/gpu/drm/i915/display/intel_display_params.h
> > index b95ecf728daa..0a8cad98d480 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> > @@ -23,8 +23,8 @@ struct drm_printer;
> >   *       debugfs file
> >   */
> >  #define INTEL_DISPLAY_PARAMS_FOR_EACH(param) \
> > -     param(char *, dmc_firmware_path, NULL, 0400) \
> > -     param(char *, vbt_firmware, NULL, 0400) \
> > +     param(char *, dmc_firmware_path, "", 0400) \
> > +     param(char *, vbt_firmware, "", 0400) \
>
> Admittedly this is all very convoluted, but these NULL pointers (or
> pointers to them) are never passed to debugfs_create_str().

Hi Jani,

Thanks for your review.

Could you elaborate on why they are never passed? Looking at
intel_display_debugfs_params.c, the intel_display_debugfs_params()
function iterates over INTEL_DISPLAY_PARAMS_FOR_EACH using the
REGISTER macro. This eventually calls
_intel_display_param_create_file(), which uses _Generic to dispatch
char ** types to debugfs_create_str().

Thanks.
