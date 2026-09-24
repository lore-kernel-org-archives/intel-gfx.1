Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCE7C9830E
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2026 19:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3CD10FC0B;
	Fri, 25 Sep 2026 19:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qe8k7rel";
	dkim-atps=neutral
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com
 [74.125.228.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39AF10F3E6
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Sep 2026 09:44:05 +0000 (UTC)
Received: by mail-ed2-f12.google.com with SMTP id
 4fb4d7f45d1cf-6a60590a85cso3835004a12.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Sep 2026 02:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790243044; cv=none;
 d=google.com; s=arc-20260327;
 b=IUMaLczxrCdiekfXo75/yc6zyXjFtiOy6FSLlowWQ8ciPOjMYEXnmRlJ9D7LGL1qvz
 Clp+WPzR4aAvVkyOdWA5ArZqg/nKfBFIabFV0YNvXQqmWuXrE55QIOseHlXcr+0eOFO7
 rVQbKZay+PgFzHw6p66yzRymyhkArPQrj9KVIN02TuECV8yXek7lCpfGYBncLLD8bPbz
 cMor9tJSZ3UeS8E6hbZGi9Z1hcG9NH0IrwfFL8PRicJHB6Bjy24KeXRJczFYrap5DEwh
 vlsQfxrrBQpVm4jX4LkZkMFeBmWv40AS6rDo0UfOR0gEaE7GJ9lihyH6lcPfF0/HVas+
 5xwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=L9OLmDrSTqVykaELu958GJ33pT3enqLsGyn406fHVPs=;
 fh=H4YzusTRUvtte0TXHsavHqJmsJ/SBU999HOdxFc7UIE=;
 b=PtvWj/bfq9468hQs//aNdqTVUTaDELCbsi7aShBocUkK8+jBQr9c0a1a5yIP6fF5Jh
 gBQgehrEJ1dU5IlOtsTuMd/U9sU+H7c/nVSsVk9rCU20JEGd948JWPU0e2bQarj/c7dy
 8qK5J2XAYnU8wWn3xsDpq/Tb0zO+hRE2g6FSno4d53KE7MC96PJlg4RaILIGOPmvgSlA
 zIjSdUMzWD2HGZ7OAncdRjRGwIwc5L5kUzHXHuyZAQYEpQEkxqzbBQbMpGsARhGN2dxj
 kAtxWiaSrSh5EVJZcig9L7Pgs2Y+w75WQbVdO/9pisIi5fz6EPJS3tjD8Sm1aux95rWb
 KVcg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790243044; x=1790847844; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=L9OLmDrSTqVykaELu958GJ33pT3enqLsGyn406fHVPs=;
 b=Qe8k7relAqkLQ7rISPhvTAkaolAc4e0Cynb1txU2GmZBKmadT/jITDsCCEZruqdqED
 qKfAOn/qqTvikMjvWCXBJSLWG4sRTpj3mJpsLIMIxnZgwaRIfssChohZmDCYIGY5qZiw
 feCPhEMTq+di/3WTIIyjqFC/9hF818XKW3wWR3v5goJzpipHYk36O7MoMxH1B11vdxzK
 93bmr7Q2lCPLSSpCGyd+16kHLkqIpJFlzd5JPdrzOmkTqAGh0udqlQ0l7hJdc+lfr5E/
 myQgDN5SUVxlKl85G/32aSQ+g9rIfvZZMVENJBzPini0M27EPwFKm45x3M88DpD8lush
 N43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790243044; x=1790847844;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=L9OLmDrSTqVykaELu958GJ33pT3enqLsGyn406fHVPs=;
 b=DgPMLtpv86FGpNlZwNMUaQLDC3sH3rX/zRhcgYdDfxlw2ljvpqR+TOjF5v7GUYhq0U
 eF1P5wpwnLyY3or0zk5FmtpO8RMXXULVThO7JdF6hAsDBtMY5OA1W2VzD089aXWXGB46
 NfiXvKkiZe6OsFoQKHiXYhPsSNFZtwUY4pO0rtldxHI1Aw+DH+W9ulq17PAbp57O5Jc9
 jAITJmwah5czi1OiJDsJd8S1oGEU5l2nWYZaySYVMSSboiDSJK4LHdLA0vpbO5M10Jkc
 R2HxCV3zTAQ/9srNUwnIRbtRo2iKrZvV3OHRgIfHPYHVt5isCtpGe1IbG5/dzlZv6Tpi
 gJJA==
X-Gm-Message-State: AFuF++k/bnrbGqdHfl6pev2ncUsNJb0httZj8yCxxAmmZnhaYZiyWY3E
 1oDF1bswLmPQf/L/UQjsq/qjvXO9cAX1mH07AZE07W8zxh1dRMARqN8EA2NxCsp/58chUb38pPy
 MS6iARytf1j1hklwv8j9uOjfFe3N4Add/g1FSbh6bzg==
X-Gm-Gg: AYBFou0xqxvU2H0ZbqURHcmgHi/4diCTwT2NTTHrUpKJugQLW3mmkcKZrg/3srGC7uy
 9rpYDuoR+eIwcL2wk70ER68TEtoDYfNfWwn2FiC4C8rjc5Gw6IEzfa5yxSG3aCiQ55+ShgP/pcz
 xjYQ90nKj5/diMlufL29wdJsQgR5OwUatFwdfgPvtTha66glY/kvM3zfUV+Pj4ew/cCkpgs6aF3
 rl1Faf+/MPM3e4zJZS39BWRbAJuqNn8EVcDRgUlM5InIl/Z8za2x4OAqii2VcGMwAM1ryRGPXmc
 ZeJdYfKZEo/ep+cYl9Jrpu/5LoiF34/nSsBEgb0tQAbsSpblHWrp4Acoj3I+bMATP6bJLnQjgmV
 XNOudahSh1wF81HpiADMcAkPXUmeBnGGF6qUJFau4MjwFbCoOhw0cB6Am/1Q+Yxvmf0srHoFbPg
 ==
X-Received: by 2002:a17:906:7944:b0:c29:555e:bef with SMTP id
 a640c23a62f3a-c2ac23daeb2mr167538266b.9.1790243043803; Thu, 24 Sep 2026
 02:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260923221018.42133-1-conor10@gmail.com>
 <5893371ab206c97d5d2f1d72eb149d5ace4250e2@intel.com>
In-Reply-To: <5893371ab206c97d5d2f1d72eb149d5ace4250e2@intel.com>
From: Conor Svensson <conor10@gmail.com>
Date: Thu, 24 Sep 2026 10:43:52 +0100
X-Gm-Features: AclHuK_JAs21Y6W8bkD-aXYNGegwrRc5OSyNx86NuiiiEUTWMZf9sodhEhvPvrA
Message-ID: <CALr9iFqDs+yvz+V8den0SRV_5X6SKn0WGh0HAnkSuwtxYjZAMQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/i915/dp: Ignore inconsistent TMDS limits on an
 Anker DP branch
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, 
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com, 
 simona@ffwll.ch, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000b00c7e065c3770b4"
X-Mailman-Approved-At: Fri, 25 Sep 2026 19:11:15 +0000
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

--000000000000b00c7e065c3770b4
Content-Type: text/plain; charset="UTF-8"

Hi Jani,

Thanks for the guidance. I've set the quirk revision aside and attached the
full, uncompressed boot-to-failure dmesg from the unpatched control kernel,
with the requested DRM debug parameters:

https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17180#note_3678430

The failure reproduced at 1920x1080, with the native 3440x1440 mode
missing. Only identifying strings were redacted; no log lines were removed.

I'll continue the root-cause investigation on the GitLab issue and use
those findings to guide a revised patch.

Best,

Conor

On Thu, 24 Sept 2026 at 09:03, Jani Nikula <jani.nikula@linux.intel.com>
wrote:

> On Wed, 23 Sep 2026, Conor Svensson <conor10@gmail.com> wrote:
> > Reconnecting an Anker 565 A8388 USB-C hub with a DisplayPort monitor
> > attached can leave the branch reporting a DVI downstream descriptor
> > with 25-165 MHz TMDS limits. On a ThinkPad L14 Gen 4 Intel with a Dell
> > S3422DWG, this removes the native 3440x1440 mode from the connector's
> > mode list even though the EDID still contains it. An explicit native
> > modeline works with the same hardware state.
> >
> > Ignore the derived TMDS limits only for the captured branch identity,
> > firmware and downstream descriptor when EDID 1.4 identifies a digital
> > DisplayPort input. Retain the raw descriptor and other mode checks.
> > Do not restrict the match to a particular monitor or laptop model.
> >
> > With otherwise matching upstream Linux 7.2.5 control/patched builds,
> > the control loses native modes after USB-C reconnect, while the patched
> > kernel selects 3440x1440 at 59.973 Hz automatically. Repeated reconnects,
> > both USB-C ports, suspend/resume, undocking while asleep and docked boot
> > pass. HDMI also works and does not activate the workaround. Periodic
> > picture cycling observed on the control stops with the patch.
> >
> > The branch identity is not proven unique to this retail adapter. This
> > is an experimental workaround for review, not an explanation of why the
> > branch reports inconsistent capabilities. Other adapters and monitors
> > have not been tested.
> >
> > Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17180
> > Assisted-by: LLM
> > Signed-off-by: Conor Svensson <conor10@gmail.com>
> > ---
> > RFC: is this best handled as a branch quirk here, or in the common DP
> > helpers? The captured identity and descriptor match is deliberately
> narrow;
> > there is no monitor/laptop model restriction. The informational log
> marker
> > is retained to show exactly when this experimental workaround executes.
> > The commit introducing the underlying problem has not been identified, so
> > there is no speculative Fixes tag.
> >
> > Hardware A/B testing used upstream Linux 7.2.5 with otherwise identical
> > configurations. This RFC applies the same 48 added lines to drm-tip at
> the
> > base commit below. This drm-tip revision has not been boot-tested. The
> affected intel_dp.o
> > compiles successfully here with no compiler warnings; strict checkpatch
> > passes (human sign-off pending), and 426 predicate boundary cases pass
> > with ASan/UBSan. These predicate tests are not DRM integration tests.
> >
> > Results: three USB-C reconnects, alternate USB-C port, docked s2idle
> > resume plus reconnect, undock while asleep/wake/reconnect, and docked
> > DisplayPort reboot all passed. HDMI also passed without activating the
> > workaround. The control lost native modes and showed periodic picture
> > cycling; that cycling stopped on the patched kernel. No custom modeline
> > was used in either test kernel. Other hardware and higher refresh rates
> > remain untested.
> >
> > AI assistance: Codex (GPT-6) helped investigate the reported hotplug
> > failure, wrote the match/limit-clearing change, prepared the predicate
> > tests, collected diagnostics and drafted this message. The human reporter
> > performed the physical reconnect, suspend and reboot tests and confirmed
> > the visible results. The assistance arose from an extended
> troubleshooting
> > session, rather than a single code-generation prompt.
> >
> > Evidence and detailed test results:
> >
> https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17180#note_3677750
> >
> > This is my first kernel patch submission. I'd appreciate feedback on
> > whether this belongs here or in the common DP helpers, and whether the
> > matching criteria are appropriate.
>
> Thanks for the patch. Please let's first root cause the issue (on the
> gitlab issue) before jumping into quirking specific devices.
>
> Regardless, a few comments below.
>
> >
> > Thanks,
> > Conor
> >
> >  drivers/gpu/drm/i915/display/intel_dp.c | 48 +++++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> > index ffddf4b33..6d6767ca7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -6153,6 +6153,39 @@ intel_dp_get_edid(struct intel_dp *intel_dp)
> >       return drm_edid_read_ddc(&connector->base, &intel_dp->aux.ddc);
> >  }
> >
> > +static bool
> > +intel_dp_has_anker_tmds_mismatch(struct intel_dp *intel_dp,
> > +                              const struct drm_edid *drm_edid)
> > +{
> > +     static const struct drm_dp_dpcd_ident branch = {
> > +             .oui = { 0x90, 0xcc, 0x24 },
> > +             .device_id = { 'S', 'Y', 'N', 'A', 'b', 0x10 },
> > +             .hw_rev = 0x10,
> > +             .sw_major_rev = 0x06,
> > +             .sw_minor_rev = 0x05,
> > +     };
> > +     static const u8 downstream_ports[] = {
> > +             0x0a, 0x42, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +     };
>
> intel_dp->downstream_ports is read from DPCD address 0x80, and it
> dynamically reflects the downstream port information, i.e. what's
> currently connected to the branch device. Having a fixed comparison like
> this will only work for a specific type of downstream device connected
> to a specific downstream port.
>
> > +     const struct edid *edid = drm_edid_raw(drm_edid);
>
> No new drm_edid_raw() calls are to be added.
>
> > +
> > +     if (intel_dp_is_edp(intel_dp) || intel_dp->is_mst ||
> > +         !drm_dp_is_branch(intel_dp->dpcd) || !edid)
> > +             return false;
> > +
> > +     /* HDMI and DVI inputs must retain their downstream limits. */
> > +     if (edid->version != 1 || edid->revision < 4 ||
> > +         !(edid->input & DRM_EDID_INPUT_DIGITAL) ||
> > +         (edid->input & DRM_EDID_DIGITAL_TYPE_MASK) !=
> DRM_EDID_DIGITAL_TYPE_DP)
> > +             return false;
> > +
> > +     return !memcmp(&intel_dp->desc.ident, &branch, sizeof(branch)) &&
> > +             !memcmp(intel_dp->downstream_ports, downstream_ports,
> > +                     sizeof(downstream_ports)) &&
> > +             intel_dp->dfp.min_tmds_clock == 25000 &&
> > +             intel_dp->dfp.max_tmds_clock == 165000;
> > +}
>
> We have intel_quirks.c with various structured mechanisms for
> identifying quirks. If we end up needing a quirk for this, the existing
> mechanisms need to be used instead of adding a bunch of code inline like
> this.
>
> Again, please let's first root cause and debug the issue instead of
> trying to fix the patch.
>
> BR,
> Jani.
>
>
> > +
> >  static void
> >  intel_dp_update_dfp(struct intel_dp *intel_dp,
> >                   const struct drm_edid *drm_edid)
> > @@ -6181,6 +6214,21 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
> >               drm_dp_get_pcon_max_frl_bw(intel_dp->dpcd,
> >                                          intel_dp->downstream_ports);
> >
> > +     /*
> > +      * Experimental workaround for the branch observed in an Anker
> A8388.
> > +      * USB-C hotplug can expose a DVI descriptor for the DP output. The
> > +      * monitor's native timing works when requested explicitly, despite
> > +      * the reported 165 MHz limit. Keep the captured identity and
> failure
> > +      * signature checks narrow until the underlying cause is
> understood.
> > +      */
> > +     if (intel_dp_has_anker_tmds_mismatch(intel_dp, drm_edid)) {
> > +             intel_dp->dfp.min_tmds_clock = 0;
> > +             intel_dp->dfp.max_tmds_clock = 0;
> > +             drm_info(display->drm,
> > +                      "[CONNECTOR:%d:%s] experimental Anker DP TMDS
> limit workaround\n",
> > +                      connector->base.base.id, connector->base.name);
> > +     }
> > +
> >       drm_dbg_kms(display->drm,
> >                   "[CONNECTOR:%d:%s] DFP max bpc %d, max dotclock %d,
> TMDS clock %d-%d, PCON Max FRL BW %dGbps\n",
> >                   connector->base.base.id, connector->base.name,
> >
> > base-commit: 703cd271db3a35088460ab3fec0a96bd48e7fe04
>
> --
> Jani Nikula, Intel
>


-- 

*Conor Svensson*

Schedule a Meeting <https://calendar.app.google/qwPdNGAewy95Bmbn9>

+44 (0) 7497 376 365

LinkedIn <https://www.linkedin.com/in/conorsvensson/>  X (Twitter)
<https://twitter.com/conorsvensson>  Telegram <https://t.me/conor10>

--000000000000b00c7e065c3770b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Jani,<br><br>Thanks for the guidance. =
I&#39;ve set the quirk revision aside and attached the full, uncompressed b=
oot-to-failure dmesg from the unpatched control kernel, with the requested =
DRM debug parameters:<br><br><a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/work_items/17180#note_3678430">https://gitlab.freedesktop.org=
/drm/i915/kernel/-/work_items/17180#note_3678430</a><br><br>The failure rep=
roduced at 1920x1080, with the native 3440x1440 mode missing. Only identify=
ing strings were redacted; no log lines were removed.<br><br>I&#39;ll conti=
nue the root-cause investigation on the GitLab issue and use those findings=
 to guide a revised patch.<br><br>Best,</div><div dir=3D"ltr"><br>Conor</di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, 24 Sept 2026 at 09:03, Jani Nikula &lt;<a href=3D=
"mailto:jani.nikula@linux.intel.com">jani.nikula@linux.intel.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 23 =
Sep 2026, Conor Svensson &lt;<a href=3D"mailto:conor10@gmail.com" target=3D=
"_blank">conor10@gmail.com</a>&gt; wrote:<br>
&gt; Reconnecting an Anker 565 A8388 USB-C hub with a DisplayPort monitor<b=
r>
&gt; attached can leave the branch reporting a DVI downstream descriptor<br=
>
&gt; with 25-165 MHz TMDS limits. On a ThinkPad L14 Gen 4 Intel with a Dell=
<br>
&gt; S3422DWG, this removes the native 3440x1440 mode from the connector&#3=
9;s<br>
&gt; mode list even though the EDID still contains it. An explicit native<b=
r>
&gt; modeline works with the same hardware state.<br>
&gt;<br>
&gt; Ignore the derived TMDS limits only for the captured branch identity,<=
br>
&gt; firmware and downstream descriptor when EDID 1.4 identifies a digital<=
br>
&gt; DisplayPort input. Retain the raw descriptor and other mode checks.<br=
>
&gt; Do not restrict the match to a particular monitor or laptop model.<br>
&gt;<br>
&gt; With otherwise matching upstream Linux 7.2.5 control/patched builds,<b=
r>
&gt; the control loses native modes after USB-C reconnect, while the patche=
d<br>
&gt; kernel selects 3440x1440 at 59.973 Hz automatically. Repeated reconnec=
ts,<br>
&gt; both USB-C ports, suspend/resume, undocking while asleep and docked bo=
ot<br>
&gt; pass. HDMI also works and does not activate the workaround. Periodic<b=
r>
&gt; picture cycling observed on the control stops with the patch.<br>
&gt;<br>
&gt; The branch identity is not proven unique to this retail adapter. This<=
br>
&gt; is an experimental workaround for review, not an explanation of why th=
e<br>
&gt; branch reports inconsistent capabilities. Other adapters and monitors<=
br>
&gt; have not been tested.<br>
&gt;<br>
&gt; Link: <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/work=
_items/17180" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/work_items/17180</a><br>
&gt; Assisted-by: LLM<br>
&gt; Signed-off-by: Conor Svensson &lt;<a href=3D"mailto:conor10@gmail.com"=
 target=3D"_blank">conor10@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; RFC: is this best handled as a branch quirk here, or in the common DP<=
br>
&gt; helpers? The captured identity and descriptor match is deliberately na=
rrow;<br>
&gt; there is no monitor/laptop model restriction. The informational log ma=
rker<br>
&gt; is retained to show exactly when this experimental workaround executes=
.<br>
&gt; The commit introducing the underlying problem has not been identified,=
 so<br>
&gt; there is no speculative Fixes tag.<br>
&gt;<br>
&gt; Hardware A/B testing used upstream Linux 7.2.5 with otherwise identica=
l<br>
&gt; configurations. This RFC applies the same 48 added lines to drm-tip at=
 the<br>
&gt; base commit below. This drm-tip revision has not been boot-tested. The=
 affected intel_dp.o<br>
&gt; compiles successfully here with no compiler warnings; strict checkpatc=
h<br>
&gt; passes (human sign-off pending), and 426 predicate boundary cases pass=
<br>
&gt; with ASan/UBSan. These predicate tests are not DRM integration tests.<=
br>
&gt;<br>
&gt; Results: three USB-C reconnects, alternate USB-C port, docked s2idle<b=
r>
&gt; resume plus reconnect, undock while asleep/wake/reconnect, and docked<=
br>
&gt; DisplayPort reboot all passed. HDMI also passed without activating the=
<br>
&gt; workaround. The control lost native modes and showed periodic picture<=
br>
&gt; cycling; that cycling stopped on the patched kernel. No custom modelin=
e<br>
&gt; was used in either test kernel. Other hardware and higher refresh rate=
s<br>
&gt; remain untested.<br>
&gt;<br>
&gt; AI assistance: Codex (GPT-6) helped investigate the reported hotplug<b=
r>
&gt; failure, wrote the match/limit-clearing change, prepared the predicate=
<br>
&gt; tests, collected diagnostics and drafted this message. The human repor=
ter<br>
&gt; performed the physical reconnect, suspend and reboot tests and confirm=
ed<br>
&gt; the visible results. The assistance arose from an extended troubleshoo=
ting<br>
&gt; session, rather than a single code-generation prompt.<br>
&gt;<br>
&gt; Evidence and detailed test results:<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items=
/17180#note_3677750" rel=3D"noreferrer" target=3D"_blank">https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/work_items/17180#note_3677750</a><br>
&gt;<br>
&gt; This is my first kernel patch submission. I&#39;d appreciate feedback =
on<br>
&gt; whether this belongs here or in the common DP helpers, and whether the=
<br>
&gt; matching criteria are appropriate.<br>
<br>
Thanks for the patch. Please let&#39;s first root cause the issue (on the<b=
r>
gitlab issue) before jumping into quirking specific devices.<br>
<br>
Regardless, a few comments below.<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Conor<br>
&gt;<br>
&gt;=C2=A0 drivers/gpu/drm/i915/display/intel_dp.c | 48 +++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 48 insertions(+)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm=
/i915/display/intel_dp.c<br>
&gt; index ffddf4b33..6d6767ca7 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_dp.c<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_dp.c<br>
&gt; @@ -6153,6 +6153,39 @@ intel_dp_get_edid(struct intel_dp *intel_dp)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return drm_edid_read_ddc(&amp;connector-&gt;=
base, &amp;intel_dp-&gt;aux.ddc);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static bool<br>
&gt; +intel_dp_has_anker_tmds_mismatch(struct intel_dp *intel_dp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct drm_edid *drm_edid)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static const struct drm_dp_dpcd_ident branch =3D =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.oui =3D { 0x90, 0xcc=
, 0x24 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.device_id =3D { &#39=
;S&#39;, &#39;Y&#39;, &#39;N&#39;, &#39;A&#39;, &#39;b&#39;, 0x10 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.hw_rev =3D 0x10,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.sw_major_rev =3D 0x0=
6,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.sw_minor_rev =3D 0x0=
5,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static const u8 downstream_ports[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0a, 0x42, 0x00, 0x0=
0, 0x00, 0x00, 0x00, 0x00,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
<br>
intel_dp-&gt;downstream_ports is read from DPCD address 0x80, and it<br>
dynamically reflects the downstream port information, i.e. what&#39;s<br>
currently connected to the branch device. Having a fixed comparison like<br=
>
this will only work for a specific type of downstream device connected<br>
to a specific downstream port.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct edid *edid =3D drm_edid_raw(drm_edid=
);<br>
<br>
No new drm_edid_raw() calls are to be added.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (intel_dp_is_edp(intel_dp) || intel_dp-&gt;is_=
mst ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!drm_dp_is_branch(intel_dp-&gt;dpcd=
) || !edid)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* HDMI and DVI inputs must retain their downstre=
am limits. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (edid-&gt;version !=3D 1 || edid-&gt;revision =
&lt; 4 ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!(edid-&gt;input &amp; DRM_EDID_INP=
UT_DIGITAL) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(edid-&gt;input &amp; DRM_EDID_DIGI=
TAL_TYPE_MASK) !=3D DRM_EDID_DIGITAL_TYPE_DP)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return !memcmp(&amp;intel_dp-&gt;desc.ident, &amp=
;branch, sizeof(branch)) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!memcmp(intel_dp-&gt;=
downstream_ports, downstream_ports,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0sizeof(downstream_ports)) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intel_dp-&gt;dfp.min_=
tmds_clock =3D=3D 25000 &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intel_dp-&gt;dfp.max_=
tmds_clock =3D=3D 165000;<br>
&gt; +}<br>
<br>
We have intel_quirks.c with various structured mechanisms for<br>
identifying quirks. If we end up needing a quirk for this, the existing<br>
mechanisms need to be used instead of adding a bunch of code inline like<br=
>
this.<br>
<br>
Again, please let&#39;s first root cause and debug the issue instead of<br>
trying to fix the patch.<br>
<br>
BR,<br>
Jani.<br>
<br>
<br>
&gt; +<br>
&gt;=C2=A0 static void<br>
&gt;=C2=A0 intel_dp_update_dfp(struct intel_dp *intel_dp,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
nst struct drm_edid *drm_edid)<br>
&gt; @@ -6181,6 +6214,21 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dp_get_pcon_=
max_frl_bw(intel_dp-&gt;dpcd,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 intel_dp-&gt;downstream_ports);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Experimental workaround for the branch observe=
d in an Anker A8388.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * USB-C hotplug can expose a DVI descriptor for =
the DP output. The<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * monitor&#39;s native timing works when request=
ed explicitly, despite<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * the reported 165 MHz limit. Keep the captured =
identity and failure<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * signature checks narrow until the underlying c=
ause is understood.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (intel_dp_has_anker_tmds_mismatch(intel_dp, dr=
m_edid)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intel_dp-&gt;dfp.min_=
tmds_clock =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intel_dp-&gt;dfp.max_=
tmds_clock =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_info(display-&gt;=
drm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;[CONNECTOR:%d:%s] experimental Anker DP TMDS limit workaround=
\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 connector-&gt;<a href=3D"http://base.base.id" rel=3D"noreferrer" ta=
rget=3D"_blank">base.base.id</a>, connector-&gt;<a href=3D"http://base.name=
" rel=3D"noreferrer" target=3D"_blank">base.name</a>);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dbg_kms(display-&gt;drm,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;[CONNECTOR:%d:%s] DFP max bpc %d, max dotclock %d, TMDS clock %d-%d, PC=
ON Max FRL BW %dGbps\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
nnector-&gt;<a href=3D"http://base.base.id" rel=3D"noreferrer" target=3D"_b=
lank">base.base.id</a>, connector-&gt;<a href=3D"http://base.name" rel=3D"n=
oreferrer" target=3D"_blank">base.name</a>,<br>
&gt;<br>
&gt; base-commit: 703cd271db3a35088460ab3fec0a96bd48e7fe04<br>
<br>
-- <br>
Jani Nikula, Intel<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div><table width=3D"640" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr=
><td style=3D"border-left:4px solid rgb(66,69,242)"><p style=3D"font-size:1=
4px;line-height:20px;margin:0px 0px 0px 12px"><b style=3D"color:rgb(37,42,4=
5)">Conor Svensson</b><br></p><p style=3D"font-size:14px;line-height:20px;m=
argin:0px 0px 0px 12px"><a href=3D"https://calendar.app.google/qwPdNGAewy95=
Bmbn9" style=3D"color:rgb(91,91,91)" target=3D"_blank">Schedule a Meeting</=
a><span style=3D"color:rgb(91,91,91)">=C2=A0</span></p><p style=3D"font-siz=
e:14px;line-height:20px;color:rgb(91,91,91);margin:0px 0px 0px 12px">+44 (0=
) 7497 376 365</p><p style=3D"font-size:14px;line-height:20px;margin:0px 0p=
x 0px 12px"><a href=3D"https://www.linkedin.com/in/conorsvensson/" style=3D=
"color:rgb(91,91,91)" target=3D"_blank">LinkedIn</a><font color=3D"#5b5b5b"=
>=C2=A0=C2=A0</font><a href=3D"https://twitter.com/conorsvensson" style=3D"=
color:rgb(91,91,91)" target=3D"_blank">X (Twitter)</a>=C2=A0<font color=3D"=
#5b5b5b">=C2=A0</font><a href=3D"https://t.me/conor10" style=3D"color:rgb(9=
1,91,91)" target=3D"_blank">Telegram</a>=C2=A0</p></td></tr></tbody></table=
></div><div><br></div></div></div></div></div></div></div>

--000000000000b00c7e065c3770b4--
