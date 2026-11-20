Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766DB606A33B
	for <intel-gfx@archiver.kernel.org>; Fri, 20 Nov 2026 22:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQBqktVk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4954112D23;
	Fri, 20 Nov 2026 22:18:49 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D20B112D23
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Nov 2026 22:18:43 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-93f20c3aaa5so130442885a.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Nov 2026 14:18:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795213122; cv=none;
 d=google.com; s=arc-20260327;
 b=PL6hdvokY8Zeg2CM/SyoIwX6Y6sI9E6hv/KrqXENFE0rWO5FCZvVt7HQva0okC+hPd
 uMh301Ma/g/P95seW9bHfj/qSa8+1iwHjG++Z3ZkxHdIWydKKFZx9+wLuD2qd3nOd2Fp
 fHYePDWmsnPF2xW/KY8HIiRy2xddOV2KhIZ3Ry8llLc3gzIALw2k9/NwU5tuHJcwFf5m
 2LlHAQX03xEIlc5Uf6wyumsgxrFkHJrgDAHEwnwW3mQeRd02WCe3hwG5vJI4Y8M2we97
 Xoe/pfX8RbRvjodtTWnqvwXKogoFK5dNNb4knyeHgALVfQ3jf+pe9CSoA1ArkeTkk1+e
 fphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=9hK61NhYm4hbvqQZMc/tWnALDQEyPFZSvX9uNHUR+Aw=;
 fh=e/J4tDhqeAO+rqWH1nBGQsicJjY0FQmM0L0qBWKmj/c=;
 b=ExFO++Ly2RcXqL0dakEn6pmJNgVssLSUbXRuG8/OFUiKK5+Nlw1QIpASs5Oh/8l4P5
 ax9il8DVLg6IxPCg9k+w+kScHYzVfJJKmUDMzj4fHVY1nrNm/vj29yxgGwAHcdKVS6Dt
 pNGVULrmXHXuOMdh7ImYCZOLbqEydpmthAt7DmUAsE1+Kkl1qwM/pfaMBE5DeAUAQXU7
 B5yYSV7ZbJNywJJdErpK1XIc1utc6q43vBrNV827OT3nkYyPZtsmEeBdBmq4OloOYZmz
 YP53q6oHdWYCthdIAu8oOCW1wd+PioyfPqH9w01xNDpPK175Ryha/yQZQmDYROUUuNf0
 PvRA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795213122; x=1795817922; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9hK61NhYm4hbvqQZMc/tWnALDQEyPFZSvX9uNHUR+Aw=;
 b=MQBqktVkG536riOXKxBWiehxngHGxaa6FJudxMk4fMFi7R8mELA2E3roCI+m2wmEFC
 6+/orCR6FBK94YQMYBwacUL2rAA+eGDC90E3qyG447wRLauLWkOFgQo5HAf4sPW3NacD
 dwo7ZyrVQo9yj/dC+CrJbAOblS0MTylKFoagXdv4FAO5GxM3WJkYBYSJJ326/i/++AzU
 7JFgEMzC7+iNo31Wg58sQYS6K2IxqFr7qm4pkXRgwCeUH/zytjSQEG82a3kS7/rDI09H
 QxhhdRV1kyK2yTF9QuhVz1amCbB4HjCc5W1LsaCM357Yi4Np1nWsh1T54z3zz7GBtw7l
 DqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795213122; x=1795817922;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=9hK61NhYm4hbvqQZMc/tWnALDQEyPFZSvX9uNHUR+Aw=;
 b=OFvmMGieNLt0vGBS2/k3vP+XLlsZtU9pyGe22UC7KyU090Sj3917W7EXsGNvcjA4kJ
 InRHyLRhdaCVMJJPCrbBzxebFkngzu0kqseuubunyQ163ob2Iz+Op1CDtW5Sp7XuoF+P
 77WrSpHYIdkykuj/QCKyVYNZUl2UdztnVjxG3QES1FE6Bz8Mh2r2TL+wWYgijrjXcE9G
 aa4TvzuwXXXR9EeqJ/WVc/X0VOSEcj776VPJV3zv2jmtPxKq6RUE0HuPOdUpgUEqPl98
 k/+I6iXW8mRmFMQtFHPk/vzKK000GXUcjeF095DmzcVxi2k6fKKKVMomrsLFTe624itq
 0Yog==
X-Forwarded-Encrypted: i=1;
 AL+hErEOJmLZmKJ4GhB0Ugr+zzRLRCKdWg+cZR3Ptbxlp7bJbdezM50/O/FYi/IhKIK2Ipqchv1XPg7HII4=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8Vi6dZN/argg2ohTuJsC9VS0miDXd/TEx/2tdvlimChGOjqduH
 acISV1YL70VjZVsCpJw56GpPn2prNQjKY03AChwXgJWl5Rw2vpZEiRizqvgSze2JDZbWt0KTCWd
 JMuLbZb/NcnWwz45TFLq151I3WDLFEmF5Ow==
X-Gm-Gg: AYBFou3+euZVUl8mmKU5PX2Ecwq5JkOBogA7c/LIMCC/+UnmQetrU8hY7WAFJn8HYA/
 aPxen0q9+0qR2BMyr3vhvK2TZ/0py03jmLS8odhF/NLgwYKTXibvy+nV2iAN50Cr4EYbIyH916V
 HkB9Pk1qNTXRNMg+RqOkzSaRedwv+j7ka45MNh3mgWzV/GSYy9se2N4QJ+PUoKLTSpDoIcREity
 Qv+5eg7QiuF7T4BnOb3OhhfaE8VdIKUj+pFJVcsKyGguvodqrsnOz5kw7s6PWlgW/YprutPCNg3
 B+ebpRBPPDyclnzxZWIb1MSBR5wKwk+WQkCUMZOxZSBM8mANGtGIxEU/3lifjSjZSJjwqdCmWHT
 EzrlU8plMwahfTfbTwR5rDLbYoOcyNOWgaiXP3F2eEADouOHP+KvJo8Fr+CSLxm6LQxZkhSH11a
 eRacfg8JJYaqx5tXPZU0qi7A==
X-Received: by 2002:a05:620a:1308:b0:949:6493:7c6c with SMTP id
 af79cd13be357-949ba9e05efmr715091585a.30.1795213121902; Fri, 20 Nov 2026
 14:18:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <aveDNRBLx1a-9hRQ@mail.tty42.de> <avsSK1OE97meC40e@ideak-desk.lan>
 <avtDzWO1sOXYvxZ2@mail.tty42.de>
In-Reply-To: <avtDzWO1sOXYvxZ2@mail.tty42.de>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 21 Nov 2026 08:18:30 +1000
X-Gm-Features: AclHuK-PSpYuj1ahpbNwXwT3dsy09uR-DRKpJwSDX7vu-5SIVe4I6Jr9vd-wnBw
Message-ID: <CAPM=9tz7suJ0UwGPVCusSQr1Km_hK29aNAGWyaCehTEeAHVXbQ@mail.gmail.com>
Subject: Re: [REGRESSION] i915: UHBR training fails with TB5 dock after
 1fd440de4e02; source FFE update skipped?
To: Frederik Schwan <frederik@tty42.de>
Cc: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, regressions@lists.linux.dev, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is a pretty well reported regressions in 7.3 that is hitting a
lot of laptop/docks, can we get some maintainer to just pull the patch
together and get it into the tree soon?

Dave.

On Tue, 17 Nov 2026 at 04:26, Frederik Schwan <frederik@tty42.de> wrote:
>
> On Mon, Nov 16, 2026 at 04:24:43PM +0200, Imre Deak wrote:
> > On Fri, Nov 13, 2026 at 11:08:15PM +0100, Frederik Schwan wrote:
> > > Hi everyone,
> > > I just upgraded my system to 7.3.x and found a regression with my notebook/dock setup.
> > > 3x 4k displays are hooked to the dock, 2 by DP and one through USB-C (I guess that DP-alt mode then).
> > >
> > > Until 7.2 all displays worked. With 7.3 all displays work until kernel switches from fbdev (?) after
> > > which the 2 DP displays have no signal anymore but the USB-C one still works.
> > >
> > > Bisect:
> > >
> > > # bad: [c03c1a14507dfaf8b856c2608f9ac216021fc222] Linux 7.3
> > > # good: [8d3ae59288f1e7d58d76558a6ee96d533bc5019f] Linux 7.2
> > > git bisect start 'v7.3' 'v7.2' '--' 'drivers/gpu/drm/i915/display' 'drivers/gpu/drm/display'
> > > # good: [bbf51a67d1fe895f3d27402d2560259a619b6dba] drm/i915/dp_link_caps: Use max common lane count from link_caps
> > > git bisect good bbf51a67d1fe895f3d27402d2560259a619b6dba
> > > # good: [d6a1bc7c9b4ce71674a633242251d8a804ced82d] drm/i915: Throw away the BIOS fb if has the wrong depth/bpp
> > > git bisect good d6a1bc7c9b4ce71674a633242251d8a804ced82d
> > > # bad: [f0cabcc880aba3f05ca59d735f6d166b7fceca80] drm/i915/fbc: No surface size restrictions from LNL onwards
> > > git bisect bad f0cabcc880aba3f05ca59d735f6d166b7fceca80
> > > # good: [b0b6d44646dc7750df4f052d17688fb7e7569a74] drm/dp_tunnel: Add UHBR tunneling support
> > > git bisect good b0b6d44646dc7750df4f052d17688fb7e7569a74
> > > # bad: [662560bad9be29c3e1a2668806392d2ed9a743d6] drm/i915/bw: Fix spelling mistake "threshod" -> "threshold"
> > > git bisect bad 662560bad9be29c3e1a2668806392d2ed9a743d6
> > > # good: [47fff2b1749e9ba5dfab7528960555cc865360b5] drm/i915/dp: Disable UHBR link configs with 1/2 lanes
> > > git bisect good 47fff2b1749e9ba5dfab7528960555cc865360b5
> > > # bad: [8b9bc7786adef4e2df3a23293c0682efac6dcc83] drm/i915/dram: Interpret 0xF populated-channel count as 16
> > > git bisect bad 8b9bc7786adef4e2df3a23293c0682efac6dcc83
> > > # bad: [1fd440de4e02efab97874bbda0a4daf59d228fa3] drm/i915/dp_tunnel: Add UHBR tunneling support
> > > git bisect bad 1fd440de4e02efab97874bbda0a4daf59d228fa3
> > > # first 'bad' commit: [1fd440de4e02efab97874bbda0a4daf59d228fa3] drm/i915/dp_tunnel: Add UHBR tunneling support
> > >
> > > I collected logs as well with `drm.debug=0x10e log_buf_len=32M thunderbolt.dyndbg=+p`:
> > >
> > > good: v7.2-rc1-263-gb0b6d44646dc.log
> > > bad: v7.2-rc1-268-g1fd440de4e02.log
> > > patched: patched.log
> > >
> > > #regzbot introduced: 1fd440de4e02efab97874bbda0a4daf59d228fa3
> > > #regzbot title: i915: UHBR training fails through TB5 dock when source FFE updates are skipped
> > >
> > > I was desperate and thought I'd give it a quick try with help of Codex which ended in a rabbit whole of DP protocol investigation for me :).
> > > We came up with a patch which I tested successfully.
> > >
> > > I've attached the patch and the "report" codex created in case you're interested.
> > >
> > > Best regards,
> > > Frederik
> >
> > > From: Frederik Schwan <frederik@tty42.de>
> > > Date: Fri, 13 Nov 2026 22:57:12 +0100
> > > Subject: [PATCH] drm/i915/dp: Update source FFE presets during UHBR training with LTTPRs
> > >
> > > UHBR link training uses intra-hop AUX replies at the DPRX address even
> > > when LTTPRs are present. However, intel_dp_set_signal_levels() only
> > > programs the source transmitter when intel_dp_phy_is_downstream_of_source()
> > > identifies the receiver being trained as directly downstream of it.
> > > With LTTPRs present, this check rejects DP_PHY_DPRX.
> > >
> > > As a result, UHBR training updates the requested FFE presets in the DPCD
> > > training set but does not apply them to the source PHY. This causes
> > > UHBR20 and UHBR10 training failures on a Meteor Lake system connected to
> > > a ThinkPad Thunderbolt 5 Smart Dock 7500. Enabling UHBR tunneling exposed
> > > the existing assumption in the source signal-level update path.
> > >
> > > Always update the source signal levels during UHBR training. Preserve
> > > the per-PHY check for 8b/10b training, which trains downstream receivers
> > > individually.
> >
> > The fix is correct, however the above explanation for the root cause and
> > fix isn't clear. The actual one is:
> >
> > 128b132b links (i.e. links used for UHBR modes) are link trained in
> > LTTPR-transparent-mode, even in the cases where LTTPRs are detected on
> > the link: In transparent mode the DPRX PHY is link trained directly,
> > without link training the LTTPR PHYs first separately and so the source
> > must set the FFE parameters during the - single - DPRX link training
> > phase.
> >
> > During a non-transparent link training (i.e. on 8b10b links), the link
> > training signal parameters (i.e. vswing/pre-emph) are only set for the
> > first LTTPR PHY, directly downstream of the source, if LTTPRs are
> > detected on the link. Such LTTPR PHY link training phases are indicated
> > by phy being set to one of the DP_PHY_LTTPRx values as opposed to
> > DP_PHY_DPRX. At the moment, according to the above setting the source's
> > link training signal parameters are skipped whenever a PHY other than
> > DP_PHY_LTTPR1 is being link trained on a link with LTTPRs detected on
> > it. This is not correct during a transparent link training (i.e. on
> > 128b132b links), when the port is in the legacy or DP-alt mode (in the
> > TBT-alt mode the Thunderbolt subsytem owns and programs the source's
> > PHY).
> >
> > Please update the commit message according to the above lines.
> >
>
> Done, hope I didn't forget anything. Patch attached.
>
> > > With this change, the affected system completes four-lane UHBR20
> > > training, including channel equalization, interlane alignment and CDS.
> > >
> > > Fixes: 1fd440de4e02 ("drm/i915/dp_tunnel: Add UHBR tunneling support")
> >
> > The change is not limited to tunnel scenarios, rather to any case where
> > a 128b132b link (i.e. for any UHBR mode) is used in a legacy or DP-alt
> > TypeC port mode (i.e. not TBT-alt port mode), with LTTPRs detected on
> > the link. So the above Fixes: line is not correct, instead the patch
> > should be backported to a kernel version in which the 128b/132b (i.e.
> > UHBR support) in general was enabled.
>
> a421d8a99216d46926609611cdcf260fdf900645 seems to be the first commit of
> the current DP2.0 implementation. That is as old as 5.17.
>
> >
> > > Signed-off-by: Frederik Schwan <freswa@archlinux.org>
> > > Assisted-by: Codex:gpt-6
> > > ---
> > > The analysis and patch preparation were assisted by OpenAI Codex. The
> > > reporter performed the bisect and hardware tests.
> > >
> > >  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > index cb92cff90614..92b8a8a1af3d 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > @@ -1019,7 +1019,13 @@ void intel_dp_set_signal_levels(struct intel_dp *intel_dp,
> > >                    TRAIN_SET_PREEMPH_ARGS(intel_dp->train_set));
> > >     }
> > >
> > > -   if (intel_dp_phy_is_downstream_of_source(intel_dp, dp_phy))
> > > +   /*
> > > +    * UHBR training uses intra-hop AUX replies at the DPRX address, even
> > > +    * with LTTPRs present. The requested FFE presets apply to the source
> > > +    * transmitter, unlike 8b/10b training of individual downstream PHYs.
> > > +    */
> > > +   if (intel_dp_is_uhbr(crtc_state) ||
> > > +       intel_dp_phy_is_downstream_of_source(intel_dp, dp_phy))
> >
> > Introducing an is_transparent_mode() helper and adding that to
> > intel_dp_phy_is_downstream_of_source() would be better probably, but
> > that's a bigger change and should be left out from this fix.
> >
> > intel_dp_get_lane_adjust_tx_ffe_preset() should be fixed similarly to
> > the above.
> >
> > >             encoder->set_signal_levels(encoder, crtc_state);
> > >  }
> > >
> >
> > > i915 UHBR / Thunderbolt 5 regression investigation
> > > ================================================
> > >
> > > Provenance
> > > ----------
> > > Frederik Schwan performed the bisect, built and booted the test kernels,
> > > and supplied the hardware logs. OpenAI Codex, an AI coding assistant,
> > > analyzed those logs and the kernel source, identified the skipped source
> > > PHY callback, prepared the candidate fix, and ran the source-level checks.
> > > This report was prepared by Codex. Its interpretation is offered for
> > > maintainer review; the hardware results below come from the supplied logs.
> > >
> > > Setup and regression boundary
> > > -----------------------------
> > > Host: Lenovo 21Q8CTO1WW, BIOS N4EET24W (1.10), 2026-06-29.
> > > GPU: Intel Meteor Lake, i915, PCI ID 8086:7d51.
> > > Dock: ThinkPad Thunderbolt 5 Smart Dock 7500, connected over Thunderbolt 5.
> > > Display topology: dock MST hub feeding two DisplayPort 1.x displays.
> > > Affected upstream display link: DP-4 / DDI TC3, four lanes, one LTTPR.
> > > The GPU-side state dump shows tbt_mode: no: the physical source PHY is
> > > in use, rather than the integrated TBT alternate-mode PHY path.
> > >
> > > The bisect began with v7.2 good and v7.3 bad, restricted to
> > >   drivers/gpu/drm/i915/display
> > >   drivers/gpu/drm/display
> > >
> > > First bad:
> > >   1fd440de4e02efab97874bbda0a4daf59d228fa3
> > >   drm/i915/dp_tunnel: Add UHBR tunneling support
> > >
> > > Immediate parent tested good:
> > >   47fff2b1749e9ba5dfab7528960555cc865360b5
> > >   drm/i915/dp: Disable UHBR link configs with 1/2 lanes
> > >
> > > The final patched hardware capture identifies its kernel as
> > > 7.3.4-arch1-2, built 2026-11-13 20:51:44 UTC. NVIDIA modules are also
> > > loaded; the affected link and training messages in this report are i915.
> > >
> > > Failure and unsuccessful experiments
> > > ------------------------------------
> > > Before the source-FFE fix, four-lane UHBR20 training fails, including a
> > > retry, followed by UHBR10 failure. Representative six-byte link status:
> > >   UHBR20: 33 33 00 08 ee ee
> > >   UHBR10: 33 33 00 08 66 66
> > >
> > > The adjustment bytes request FFE preset 14 or 6, respectively, on all
> > > four lanes. Lane EQ bits are set but alignment is absent. The sink-status
> > > bit 0x08 is DP_INTRA_HOP_AUX_REPLY_INDICATION; these are intra-hop replies,
> > > not proof that the entire downstream path has finished training.
> > >
> > > Experiment 1 (dmesg.log): remove the legacy alignment-bit requirement
> > > from the UHBR lane-EQ helper, preserving it for active-link monitoring.
> > > Result: training advances to "Lane channel eq done" but then fails with
> > > "Interlane align timeout". This did not fix the problem.
> > >
> > > Experiment 2 (dmesg.log.1): restore the original helper and repeat the
> > > 0x2215 capability read after LTTPR initialization, logging tunnel caps.
> > > Result: coding=01 rates=03 before initialization, after initialization,
> > > and after the extra read; 0x2215 returns 00. UHBR20 and UHBR10 still fail
> > > with "Max loop count reached". This did not fix the problem either.
> > >
> > > Failed runs fall back to HBR3. Although HBR3 training passes, FEC-enable
> > > polling subsequently times out with status 0x04 or 0x00. The logs show
> > > 8b/10b coding selected and intra-hop mode clearing; there is no evidence
> > > that the driver simply leaves UHBR coding or intra-hop mode enabled.
> > > The cause of the fallback FEC failure has not been established.
> > >
> > > Source-level finding
> > > --------------------
> > > File: drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > Function: intel_dp_set_signal_levels()
> > >
> > > The existing code calls encoder->set_signal_levels() only if
> > > intel_dp_phy_is_downstream_of_source(intel_dp, dp_phy) returns true.
> > > That helper accepts a link without repeaters or the source-adjacent
> > > LTTPR, DP_PHY_LTTPR(lttpr_count - 1).
> > >
> > > UHBR lane EQ calls the signal-level update path with DP_PHY_DPRX, even
> > > when repeaters are present, because it uses intra-hop AUX replies.
> > > Consequently, with one or more LTTPRs, the existing guard skips the
> > > source transmitter callback. The debug print precedes the guard, so
> > > "TX FFE presets: 14/14/14/14" does not establish that those presets
> > > were programmed into the GPU PHY. The AUX training-set writes still run.
> > >
> > > For this platform, the callback leads to intel_cx0_phy_set_signal_levels().
> > > The lane level is derived from train_set through intel_ddi_dp_level(),
> > > and the corresponding transmitter settings are written to the PHY.
> > > The integrated TBT alternate-mode path has its own early return there;
> > > that is not the path shown by this system's PHY state.
> > >
> > > Candidate fix
> > > -------------
> > > Allow the callback whenever intel_dp_is_uhbr(crtc_state) is true, retaining
> > > the existing per-PHY guard for 8b/10b:
> > >
> > >   if (intel_dp_is_uhbr(crtc_state) ||
> > >       intel_dp_phy_is_downstream_of_source(intel_dp, dp_phy))
> > >           encoder->set_signal_levels(encoder, crtc_state);
> > >
> > > Neither unsuccessful experimental change is included in this fix.
> > > The bisected commit enabled a path that exposes an older assumption;
> > > it did not introduce the original guard itself.
> > >
> > > Hardware evidence with the fix (dmesg.log.2)
> > > -------------------------------------------
> > > First successful sequence on DP-4:
> > >   20.224632  Lane channel eq done
> > >   20.271570  Interlane align done
> > >   20.297496  CDS interlane align done
> > >   20.297680  128b/132b Link Training passed at link rate = 2000000,
> > >              lane count = 4
> > >
> > > Second successful sequence on DP-4:
> > >   33.891635  Lane channel eq done
> > >   33.934586  Interlane align done
> > >   33.956537  CDS interlane align done
> > >   33.956747  128b/132b Link Training passed at link rate = 2000000,
> > >              lane count = 4
> > >
> > > The first sequence reaches status 77 77 8d 00 11 11 at CDS completion.
> > > There are no UHBR training failures, fallback attempts, or FEC-enable
> > > timeouts in this capture. Earlier Thunderbolt DPRX-read timeouts and
> > > unrelated NVIDIA messages do appear; this is not an error-free system log.
> > >
> > > The result strongly supports the skipped source FFE update as the cause
> > > of the reported UHBR training failure. It also demonstrates that the
> > > DP1.x monitors do not inherently prevent this upstream link training at
> > > UHBR20. It does not establish long-term display stability or validate
> > > UHBR-to-HBR3 fallback recovery, which was not exercised in this run.
> > >
> > > Validation performed by Codex
> > > -----------------------------
> > > - Built intel_dp_link_training.o using a configuration copied from the
> > >   running kernel and processed by olddefconfig.
> > > - git diff --check and scripts/checkpatch.pl passed for the code change.
> > > - A standalone harness extracted the source functions and mocked the
> > >   encoder callback. Before the change, all UHBR cases with 1-8 repeaters
> > >   missed the callback. Afterward, those cases passed, and tested 8b/10b
> > >   per-PHY callback behavior was unchanged. This is not a KUnit or hardware
> > >   test and does not validate electrical signal quality.
> > > - The code patch applies cleanly to the v7.3 version of the source file.
> > >
> > > Supporting material
> > > -------------------
> > > Primary attachments:
> > >   bisect.log
> > >   i915-uhbr-source-ffe.patch
> > >   v7.2-rc1-263-gb0b6d44646dc.log (known-good capture)
> > >   v7.2-rc1-268-g1fd440de4e02.log (first-bad capture)
> > >   patched.log (successful final candidate on 7.3.4)
> > >
> > > Optional experimental captures:
> > >   dmesg.log (lane-EQ helper experiment)
> > >   dmesg.log.1 (0x2215 refresh experiment)
> > >
> > > Logging parameters:
> > >   drm.debug=0x10e log_buf_len=32M thunderbolt.dyndbg=+p
> > >
> > > Retain full logs, preferably compressed, so reviewers can inspect the
> > > capability reads, AUX transactions, topology and ordering. The source
> > > filenames from the bisect should be interpreted together with the actual
> > > kernel banners and bisect.log.
