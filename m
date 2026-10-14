Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98589CC6B34
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2026 12:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C2710E948;
	Thu, 15 Oct 2026 12:16:00 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D0E10EA8F
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Oct 2026 16:58:31 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5bb7c6980f1so3456231e87.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Oct 2026 09:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791997110; cv=none;
 d=google.com; s=arc-20260327;
 b=VOUHLKWGs5ATlzgW0TV8HFHQVXDAprnDCYC0iRc+GjRj8sLRIfx21zNPDsEHXcfSnk
 8lLlcos83VNLW9IekRFoVMvA1rHc7s8fQS/XTSPGZ4gx4htq7NpvKYX80wLzfOMygzAB
 i17rMm+Lai9zeQ+gR094HzmVoUHgJRBXtagWxcgMfxtlhdvS3P8ewr3g2y1s12NS743p
 loCv8fp568MhA3LoOSIwVZvZD1rP87qBH5J9bydaunRb1NegP3FN3cW+zd/1d93Ho1ab
 woT3hTcjXMCHNlFr7zO7NkgkR6yaYsmQH26PZxJyug2xIcE3t6otLJ7mYB2Ewl0qtjUn
 jmDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PeoY0yWKZRmwA+3BQa6rH8gq2X5w0eejzi+aqnvivA0=;
 fh=UM8lPez/CzexX/4mZczNPERCI/aFnBLd2KrJOHfeU54=;
 b=GiptmbjS3o7ohE+fmA89YDaTJJbCP47jH43fPVEvWFcLhrtVUdfb1x2pCbRmxbbonm
 TDlJcudqGNRgLnRFLUByeX6FGoRE08GoA6mkF8+3s+JCKi+C0DfpiExrxrLR+NWtBzic
 BDDicTieFuye2k1sQ8nQhkN1MeXLiFMWUSVe+mamBI78ywBdST7rlZyTDiiC10HRtj6i
 kqlNqDniAwm7Einzu51FDig7yiNsStijfHOWYFIVlnPIQCWqvVOaQMYRhmtOrI98Bd8z
 kOu9Cq9uvrUFUlZj8alaC8mGPuundg03LFW3Gn/saPPH+BM+cupZoG2loYaJ9X6vSwXj
 ot2g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aleph0.ai; s=google; t=1791997110; x=1792601910; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PeoY0yWKZRmwA+3BQa6rH8gq2X5w0eejzi+aqnvivA0=;
 b=xo7Tz5d9bYCgLIP6QDQAWIz6bV/SqAXjftgJd1RcHnGlbaD04CfR2rD/42DP/N4D1I
 eQv/Pgk+oDOI46RQekvblHZdbNYZedNlmfULBPOsk3AKJsU2k+87gbutvzTphTXb6L2T
 7P3dFb6CpkE9VY6GyappjPOm68/OkmYoAcUVwhZWk6NkQUFeQ9KjhDdGg0lUDTQcVqQ4
 holMtgAnXG8NDi2G3YVecE6a1qK/grEGE4kxo3T13mT2vqb506g/CbMnFZwwMmOM4JyN
 xq2wTjbCWjuMdtTv8MCV/R+3JKEsvX4tDzbqDqD5+qtIJzQ0WyIHJNUgtbxGdnCWIlVW
 hD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791997110; x=1792601910;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PeoY0yWKZRmwA+3BQa6rH8gq2X5w0eejzi+aqnvivA0=;
 b=bnCGjjSPNjDdh9YrtPzbtw1r9PSEy5Bu9LurZqYAOAkD8EE00yNjNSdZwjPFa4syjH
 tEZTL2rXkLZ5Hc+IdYg0H3SO3uvdR3ys3azOTykMXqBmdO5mrsZZihPncsBaM2cHoGI8
 /0wlDvdy0TaaEsmdLlkTsT7ezaiQZ/daNPLXByuGasifxMK/U5OaQ4JdiHr4l+97MLIp
 5fLyXwgCJckKBkCsHBVatsaKU21YlnZpAxTOl1PZxfDQOh/EQW/SYIFGQQgldTqPZsV+
 T7x9n9S1pWh1yRriyfjc6vcyiOEtoQLC1+K9YXr8XLA1/x/SsuVS4b6AlBmIzAXrh1yH
 xF3w==
X-Forwarded-Encrypted: i=1;
 AKwUvBxWMAz/RPI9LFxUV2l26FZfCRbkJhP0uZhuoHVBNm3NRxSlkF7AwhtjoeedAI0uPlyjjad2k4tis3M=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYK+ib7d4gqos17gUlJtewTLRoWqNFaG9BZyHcPSx0t33WAEXrxU
 44Ezy1GDVV7fTOJArXScv56+JpM5aizaX5z6CaaBVh2ucXbbXoDXTcVUXV/tzDuc/NAbsJ13oXj
 o08or4s3jl6jbPtXMGRL0WrF7IAyvRyMW48ewIWg9lg==
X-Gm-Gg: AYBFou2m4l2eZtFJiPn2Y6bsvP+KGHAjFlkGZzIh3U3J2XwzWcrSjwW+8ImffJv04Sq
 wYPasBacJZgLPgOosf4JdAIR2zID2rowdltFF5IbyYSAgT9l0Bz0qH4k22VqeDU6jQHZEyEWDTz
 C4yvBe4kp3OeOYiuENiFZOkC8j0RmfzfkdnqkpdlsY8Sq0utw3dbSkcL+L1bwniOZ14vu5pnNU0
 67l9P2tDKpBsc8vnFHj8pGsXfHy6MN2KiV+hu4olWP6dpt3mQU9HB2cmwXLyvRE9EmgY1SgnUZ8
 9lJPTKhYWcCQF6wIyFipgDvjZTJ0KJhEHWD8UWma0QKp9qRfahCPDN516FI4tTnSKngQb80hXz4
 NLL3MXVlEmSAyHe4WssuxMRiBOw==
X-Received: by 2002:a05:6512:3187:b0:5b8:bc5e:d0fe with SMTP id
 2adb3069b0e04-5bcde6d0062mr5550632e87.40.1791997109796; Wed, 14 Oct 2026
 09:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20261013-fix-psr-async-trans-push-v1-1-ee79bf31b66f@aleph0.ai>
 <as9lLU0VnFW6JLKf@intel.com>
In-Reply-To: <as9lLU0VnFW6JLKf@intel.com>
From: Vladyslav Yamkovyi <hex@aleph0.ai>
Date: Wed, 14 Oct 2026 18:58:13 +0200
X-Gm-Features: AclHuK9DejIsKpYNlJitvulcu8uweG4HpEyel77BVIQowt9vPUrR_69jHdifP7A
Message-ID: <CAGkn_9h6TMgEk6e0JEROYx_O08Dtpn=_Jyd=T+HuiJZmyGynCA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/psr: Send a frame change notification for async
 flips
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 15 Oct 2026 12:15:59 +0000
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

There was indeed an error in my testing. I ran a synthetic reproducer
separately from my compositor work where I originally encountered
the issue, but failed to enable VRR in that test. I do observe the
errors now.

I withdraw this patch. I will review the logic more thoroughly,
particularly mentioned vblank evasion code, and try to investigate
sending TRANS_PUSH consistently and if this is worth pursuing.
If it will not inspire confidence, I will seek to reliably disable PSR
trans push usage.

--
Vladyslav Yamkoyi

On Wed, 14 Oct 2026 at 13:19, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, Oct 13, 2026 at 05:16:07PM +0200, Vladyslav Yamkovyi via B4 Relay=
 wrote:
> > From: Vladyslav Yamkovyi <hex@aleph0.ai>
> >
> > On platforms using TRANS_PUSH for PSR frame-change notifications,
> > intel_pipe_update_end() exits early for asynchronous flips, before send=
ing
> > the push. The register-based notification is disabled on these platform=
s,
> > and an ORIGIN_FLIP frontbuffer flush does not force PSR to exit.
> >
> > This can leave an accepted async flip without a completion event after
> > PSR2 enters DEEP_SLEEP. On Panther Lake, scanout freezes and the kernel
> > reports "[CRTC:152:pipe A] flip_done timed out". Intel IGT kms_async_fl=
ips
> > reproduces the failure with the compositor inactive when a 200 ms idle
> > interval is inserted before an asynchronous atomic flip.
> >
> > Send the PSR frame-change notification after plane programming and befo=
re
> > releasing the existing PSR lock. Restrict the push to CRTC states that =
use
> > TRANS_PUSH for PSR, leaving other async flips and the synchronous and D=
SB
> > paths unchanged.
> >
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9582
> > Fixes: 129a4da11707 ("drm/i915/psr: Use TRANS_PUSH to trigger frame cha=
nge event")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM sparse smatch
> > Signed-off-by: Vladyslav Yamkovyi <hex@aleph0.ai>
> > ---
> > Based on drm-tip (2026-10-13); also applies to v7.3-rc7.
> >
> > Runtime-tested on Panther Lake (xe, eDP-1, 2880x1800) with Ubuntu-based
> > 7.3.0-rc6 kernels, before and after this fix. IGT kms_async_flips,
> > async-flip-with-page-flip-events-tiled-atomic, dynamic subtest
> > pipe-A-eDP-1-4-rc-ccs, fails with Flip Timeout before the fix and passe=
s
> > afterwards. An LD_PRELOAD interposer inserts one 200 ms idle interval
> > before the eighth async atomic commit without changing its request or
> > flags. Both runs enter PSR2 Early Transport DEEP_SLEEP with selective
> > fetch enabled before that commit.
> >
> > Clang 23.1.2, W=3D1 builds and Sparse/Smatch checks of the CRTC, PSR an=
d VRR
> > translation units for i915 and Xe produced no new diagnostics.
> >
> > OpenAI Codex (GPT-6-Astra) assisted diagnosis, reproducer and fix
> > development, validation and patch preparation, following requests to
> > reproduce the freeze independently, trace its driver cause and prepare =
a
> > tested upstream fix. I take direct responsibility for this contribution=
,
> > have carefully reviewed the change and ensured rigorous local testing.
> > ---
> >  drivers/gpu/drm/i915/display/intel_crtc.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/dr=
m/i915/display/intel_crtc.c
> > index 10ed9bdfee76..8ef24cddbaa6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> > @@ -736,8 +736,16 @@ void intel_pipe_update_end(struct intel_atomic_sta=
te *state,
> >
> >       drm_WARN_ON(display->drm, new_crtc_state->use_dsb);
> >
> > -     if (new_crtc_state->do_async_flip)
> > +     if (new_crtc_state->do_async_flip) {
> > +             /*
> > +              * LNL+ uses TRANS_PUSH for PSR frame-change notification=
s.
> > +              * Async flips skip the vblank path below, but still need=
 to
> > +              * notify PSR after programming the new surface address.
> > +              */
> > +             if (intel_psr_use_trans_push(new_crtc_state))
> > +                     intel_vrr_send_push(NULL, new_crtc_state);
>
> This will make the behaviour of async flips + VRR inconsistent
> between platforms where trans push is used for PSR vs. platforms
> where it's not used. We don't want that.
>
> So either we want to start doing trans pushes for all async
> flips+VRR cases, or we want to disable the PSR trans push usage
> when async flips are happening. The latter would be the safer
> option since the mailboxy trans push usage this would cause
> hasn't been done before. The vblank evasion code does try to
> handle it, but it's not actually tested.
>
> >               goto out;
> > +     }
> >
> >       trace_intel_pipe_update_end(crtc, end_vbl_count, scanline_end);
> >
> >
> > ---
> > base-commit: eb1bf4700d3b25a1a1e670ef31cc06969fa08019
> > change-id: 20261013-fix-psr-async-trans-push-bfa6550270c7
> >
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
