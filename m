Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D3CC9832A
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2026 19:11:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAD010FC1A;
	Fri, 25 Sep 2026 19:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O41ucw84";
	dkim-atps=neutral
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com
 [74.125.228.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA56E10F3D9
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Sep 2026 09:53:13 +0000 (UTC)
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c2940ef15d3so245799266b.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Sep 2026 02:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790243592; cv=none;
 d=google.com; s=arc-20260327;
 b=Dx2281gc9N634M97p5IXX/avfmvZAnjolomYd6mDWuH1NSy2yFbvYNQ40r1Shpbf5j
 p2YPpw+SC3ug8x+SSCKX0DUUcZMEOuGjUKZuiTXU4z7dfVO93sxEEPRGmqfriuWIS27v
 qyToabmTXdAQUvXQhWrFgRRXSWdtGJAK1d5jRLKwzO282gc+4gTP2DTiurVP7+fOueGa
 D3HN7zh4yLN2/EoVu+ZkbFk5giqfBaZa5X8hNG+JMVatNpgH0bLyJ1eHIUASkjvgQfK4
 zEpqj5fHagV1CxteAytpIt/L8Upp62VgDc66wYlGfnLMMrpcjl0Y8RTpAHoSFysOTIDy
 15BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=yb6RSbXE1G0ySa9rVI9g78GVJor8aLKdYOQ2/3J/LuM=;
 fh=H4YzusTRUvtte0TXHsavHqJmsJ/SBU999HOdxFc7UIE=;
 b=mtyqTMkAqMTw+fvNPkG4XMXnk+arKQs6KZ9Rbpugs+MlRK5bJJ3tbTayBKu0OP1ki6
 TMF4QZ2KBxRp01bumcep5kFLAVlTYc/rGH9gQ7vrY+dtmP8DVqSEyeZkxUsaKUkp3PEO
 k90PKbo9lppZlizzyCj//+TBqhiGrlvH7usLJqaJ8xmcFiBxClDCWCMy1iPFVATgKhZT
 F7b8lD8XNdw3h0LZ/Ln61pswk31rL2tiAtaXD6HBn7Eb2VE3eZ+qbyUstyI+9E4JEHoz
 +AnmqTijlyAJkbj+4UEgMmTV92jkvp5TG1zD50ClD8shpbjPxfdKZHjRTE6vDd3F26Qk
 UXKQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790243592; x=1790848392; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=yb6RSbXE1G0ySa9rVI9g78GVJor8aLKdYOQ2/3J/LuM=;
 b=O41ucw84ILwbbrrTY30NBhmvMOMslCVH5cKjNYQ7nXq021tBGG4SXH45tsaQNCL+hC
 49SXqnYBLnjMQlIrTBkBhhAE8BqSnmRFa+gy4Zyi4siOTO4aTCF38g88j+VknwLXSq2N
 GgT9Se3EivXcIUztBpVim6G85GPQUusYDxWOOYC87iXAwmAySBx5Usevcngsx6RTgWpq
 xf+oeJkWamO9jxl1OuMwe1OAbEzXqYZFhgNJPUbh3ioOmDCc9ygpc3CF5RlqBsj3m18f
 MDx9Injo2TUCfUTQqKqpnVYa4ME3HCN0ZsKYo9SIMs5O/18STc4gK9wwBqbdNta3uwBt
 4Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790243592; x=1790848392;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=yb6RSbXE1G0ySa9rVI9g78GVJor8aLKdYOQ2/3J/LuM=;
 b=NlRhqAoPEO3kVIVymygUsBjufP/ghgLnphfWfLro2k7aMoXh/DeO3pl54ABwuHUGQh
 H7evF/pTxUxgbOqaFiLkklxQseFr6hPm3hjWBd5AnkhTpKw1v97NTZxJ41c0p1OYc4os
 viN0MlLvWhxRvoDqOH8l75VAbgV8iSZVZ2PBb0p6OXDIrxVU6CxNLDY5GZFv0OY9A3c7
 gE2lh5qLG2ZMpFo6ZCGs/aytKl+79xcdf+01ZyhOkK1zdb/wxMEhWmcVICP6osZGQwW+
 /pYbBSlz4p/MyDGEKNLiAdlFDVF0PEbEtAGnyFeICa2qt18nkChPbBJVTPDz8wXgR9Ed
 fjTQ==
X-Gm-Message-State: AFuF++mneqojjx9Py3htw6O4i5YGV2W/G49egfulmk7/rN1Rcm7CQzk0
 XfY0b1AIJFgADRrO6/5Gu3En8wuq9LWtfM6uUz4IO+W8Y684PBQT7CaQyyJOABIPYnSWG5lf81C
 vdriB6c1drxb9mxB3zvMHOTHDy4bDzqI=
X-Gm-Gg: AYBFou3bS3WND3rmIvPfcoUgHxfMaJ3OtT+gyrD38I6g+0pjN+GLRTVGRWZioaFtewZ
 CtgVzpZfWY+h1vBU4h44AMOWWiIaV9zcfz9p1Ic3sQYyGRBAE+NCEPgZWHztoT8en6V87iOElqV
 yXjokmUd7wjoujfbWp3ZJ9CXwrw29BzF+Fg5+kwVL2sHip66K97UN+nwaPJr5QmosWVpEwGka90
 IZGcA6WLmnxhYu/bLJ/aSjBPyG5ZiZBhZF8e13X4cSnjp8PvTChyyHlmK50qcne+E/XwEN8l47d
 Mh4B3VhPKtVdhnMKLP9pNwta0z7FEOIgUIiaHxuctjmX1H9Qz6S+lk4Ff+32ZDNTkn6fEUBjqrP
 xBMcT0Vv0KnGRyKVhJ6klUdo9P0rkjNKREpCSAVCqy83xTTShVG+dKRzA86om42yBvnPAczxrsw
 ==
X-Received: by 2002:a17:907:d24:b0:c24:b11a:470f with SMTP id
 a640c23a62f3a-c2ac2106076mr175312866b.0.1790243591838; Thu, 24 Sep 2026
 02:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260923221018.42133-1-conor10@gmail.com>
 <5893371ab206c97d5d2f1d72eb149d5ace4250e2@intel.com>
In-Reply-To: <5893371ab206c97d5d2f1d72eb149d5ace4250e2@intel.com>
From: Conor Svensson <conor10@gmail.com>
Date: Thu, 24 Sep 2026 10:53:00 +0100
X-Gm-Features: AclHuK8s1zPMrRHE9rS5EEMVSyRkeNCsNGXgbfegbLEH7sS5W_-QEi7hcOX7q_k
Message-ID: <CALr9iFpFyS3O-A6VD8AhM_wkPaoO0DofPBJFLoH=akJCDzEp1w@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/i915/dp: Ignore inconsistent TMDS limits on an
 Anker DP branch
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, 
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com, 
 simona@ffwll.ch, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="0000000000005a60ff065c3791ca"
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

--0000000000005a60ff065c3791ca
Content-Type: text/plain; charset="UTF-8"

Hi Jani (resending due to accidental embedded HTML on previous message),

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

--0000000000005a60ff065c3791ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jani (resending due to accidental embedded HTML on prev=
ious message),<br><br>Thanks for the guidance. I&#39;ve set the quirk revis=
ion aside and attached the full, uncompressed boot-to-failure dmesg from th=
e unpatched control kernel, with the requested DRM debug parameters:<br><br=
><a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/171=
80#note_3678430">https://gitlab.freedesktop.org/drm/i915/kernel/-/work_item=
s/17180#note_3678430</a><br><br>The failure reproduced at 1920x1080, with t=
he native 3440x1440 mode missing. Only identifying strings were redacted; n=
o log lines were removed.<br><br>I&#39;ll continue the root-cause investiga=
tion on the GitLab issue and use those findings to guide a revised patch.<b=
r><br>Best,<br><br>Conor</div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 24 Sept 2026 at 09:03=
, Jani Nikula &lt;<a href=3D"mailto:jani.nikula@linux.intel.com">jani.nikul=
a@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Wed, 23 Sep 2026, Conor Svensson &lt;<a href=3D"mailto:=
conor10@gmail.com" target=3D"_blank">conor10@gmail.com</a>&gt; wrote:<br>
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
></div><div><br></div></div></div></div></div></div>

--0000000000005a60ff065c3791ca--
