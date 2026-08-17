Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E96AC5DF66
	for <intel-gfx@archiver.kernel.org>; Mon, 17 Aug 2026 12:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9123610E783;
	Mon, 17 Aug 2026 12:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dgwi863J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640C610E783
 for <intel-gfx@lists.freedesktop.org>; Mon, 17 Aug 2026 12:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786968539; x=1818504539;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=C5/1ARkhSi9RNOuaAXeKaoHPgUlvX8P0PZmlqEQN5Fg=;
 b=Dgwi863JYlIQoTQsXIlxZOBKbZyewT/LvgWQIsOZ52A2xmVa1aWsWMPU
 kzOknTiALr4RHMPUNSXKaZr+ZTV5kwYLeRCqd917dWS7vao/ZnF92kFsm
 l/8QIVNYN1ARtpQsXA7xPDwNuL7xT6MNkjmQrOHEV5NQWRX9YdZTdErOD
 kIqwXA1Qjt/33s6Fk7LqiJUcVb95Q8cD+fuHnLRlhCN+KirVKQBR69o3j
 m8gIFha6rJ4nZYhzc65mo7Ko5gxL2tMbI23m5VBCK/1/WzC6po3gVRnzp
 sCqhaOsFpQuwsw2nBMkswRjzv0lbJw36s1tm8AOl9sI+WE21QG1D61ebe w==;
X-CSE-ConnectionGUID: jClE+4fwRli45LL4CBgPKg==
X-CSE-MsgGUID: +t/syXzqQg+Uv9EyiXvgog==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87462636"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="87462636"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 05:08:58 -0700
X-CSE-ConnectionGUID: hoLGTOibTfqBA2QtdGa8Hg==
X-CSE-MsgGUID: 0+BUc1efSaSyrZYMX4HQRA==
X-ExtLoop1: 1
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.110])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 05:08:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Novej Panjawani <novej.panjawani@gmail.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [BUG] i915/ADL-P eDP: link training exits with adj_req=0x11
 unresolved, causing modeset loop on CMN14E7 (Dell Latitude 5430)
In-Reply-To: <b4814185-1fe2-43a8-8d7c-11290c5e38f1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <b4814185-1fe2-43a8-8d7c-11290c5e38f1@gmail.com>
Date: Mon, 17 Aug 2026 15:08:54 +0300
Message-ID: <ca8ac2afa85c8c47ea558e903a4952d2b000ba7e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Sun, 16 Aug 2026, Novej Panjawani <novej.panjawani@gmail.com> wrote:
> ## Summary
>
> After boot and after any display mode change (HDMI connect/disconnect),=20
> the internal eDP display on this Dell Latitude 5430 (ADL-P, Intel Iris=20
> Xe 46A8) enters an **infinite modeset loop** that repeats every ~2=20
> seconds: backlight off =E2=86=92 pipe disabled =E2=86=92 link retrain =E2=
=86=92 pipe enabled =E2=86=92=20
> backlight on =E2=86=92 repeat. This produces continuous visible black-scr=
een=20
> flashing. The loop self-resolves after ~5=E2=80=9315 minutes (thermal=20
> stabilization of the eDP connection), and is immediately re-triggered by=
=20
> any subsequent mode change.

Please file a bug as described at [1].

BR,
Jani.


[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


>
> External HDMI display is not affected.
>
> ## Hardware / Environment
>
> | | |
> |---|---|
> | **System** | Dell Latitude 5430 |
> | **GPU** | Intel Alder Lake-P, Iris Xe Graphics =E2=80=94 PCI `0000:00:0=
2.0`,=20
> Device ID `0x46A8` |
> | **Panel** | Chimei Innolux CMN14E7 =E2=80=94 14" 1920=C3=971080, eDP 1.=
4, EDID 1.4 |
> | **Kernel** | `6.18.40-1-cachyos-lts` (clang 22.1.8, LLD 22.1.8) |
> | **i915** | 1.6.0 =E2=80=94 GuC 70.49.4, DMC adlp_dmc.bin v2.20, HuC 7.9=
.3 |
> | **BIOS** | Dell 1.36.0 (2025-12-23) =E2=80=94 latest per fwupd |
>
> ## Root Cause
>
> With `drm.debug=3D0x04`, the following loop is captured every ~2 seconds:
>
> 1. `intel_dp_start_link_train` uses **vswing 0/0/0/0, pre-emph 0/0/0/0**=
=20
> at `LINK_BW_SET=3D0x0a` (HBR / 2.7 Gbps), 2 lanes
> 2. TPS1 and TPS2 complete =E2=80=94 `"Channel EQ done. DP Training succes=
sful"`
> 3. Pipe A and backlight are enabled (PWM =3D 23718)
> 4. ~2 seconds later, link status check:
>  =C2=A0 =C2=A0- Read 1: `align:0x80 sink:0x3 adj_req0_1:0x11` =E2=80=94 a=
ligned, but panel=20
> requesting vswing level 1
>  =C2=A0 =C2=A0- Read 2: `align:0x0 sink:0x1 adj_req0_1:0x11` =E2=80=94 **=
alignment lost,=20
> symbol lock lost**
> 5. Driver detects link loss =E2=86=92 full modeset (backlight off, pipe d=
isabled)
> 6. Repeat from step 1
>
> **`adj_req0_1=3D0x11` (vswing level 1 requested for lanes 0/1) appears in=
=20
> every DPCD read throughout the flicker window.** The driver exits=20
> training while adj_req is non-zero and does not apply the requested=20
> levels to the operational link. The panel cannot sustain HBR at level 0,=
=20
> degrades within ~2 seconds, fires IRQ_HPD, the driver responds with a=20
> full modeset, and the cycle repeats.
>
> ## Debug Log (one complete cycle)
>
> Captured with `drm.debug=3D0x04`:
>
> ```
> i915: [drm:intel_dp_start_link_train] Using LINK_BW_SET value 0a
> i915: [drm:intel_dp_set_signal_levels] 8b/10b, lanes: 2, vswing levels:=20
> 0/0/0/0, pre-emphasis levels: 0/0/0/0
> i915: [drm:intel_dp_link_train_phy] Clock recovery OK
> i915: [drm:intel_dp_link_train_phy] Channel EQ done. DP Training successf=
ul
> i915: [drm:intel_dp_link_train_phy] Link Training passed at link rate =3D=
=20
> 270000, lane count =3D 2
> i915: enabling pipe A
> i915: [drm:cnp_enable_backlight] set backlight PWM =3D 23718
>
> -- ~2 seconds --
>
> i915: [drm:intel_dp_dump_link_status] ln0_1:0x73 align:0x80 sink:0x3=20
> adj_req0_1:0x11=C2=A0 =C2=A0<-- link ok, but adj_req non-zero
> i915: [drm:intel_dp_dump_link_status] ln0_1:0x73 align:0x0 sink:0x1=20
> adj_req0_1:0x11=C2=A0 =C2=A0<-- link lost
>
> i915: [drm:cnp_disable_backlight] set backlight PWM =3D 0
> i915: [drm:intel_disable_transcoder] disabling pipe A
> i915: [drm:intel_hpd_irq_handler] Received HPD interrupt on PIN 4 - cnt: =
10
> i915: [drm:intel_dp_hpd_pulse] ignoring long hpd on eDP [ENCODER:262:DDI=
=20
> A/PHY A]
>
> -- repeat every ~2 seconds --
> ```
>
> ## Reproduction
>
> 1. Append `drm.debug=3D0x04` to kernel cmdline, reboot
> 2. `journalctl -k -f | grep -E=20
> "link_train|dump_link|hpd|backlight|transcoder"`
> 3. Cycle appears within seconds of display init, repeats every ~2 seconds
> 4. After 5=E2=80=9315 min, cycle stops (thermal stabilization)
> 5. Retrigger: unplug external display =E2=86=92 cycle immediately resumes
>
> ## Expected Behaviour
>
> Either:
> - **(a)** The TPS2 loop should continue iterating and updating=20
> vswing/pre-emph until `adj_req` is zero before declaring training=20
> successful; or
> - **(b)** After training exits, the driver should apply the final=20
> `adj_req` vswing values to the DDI buffer translation used for normal=20
> operation
>
> ## Attempted Workarounds (all ineffective)
>
> None of the following affect link training vswing behavior:
> - `i915.enable_psr=3D0`, `i915.enable_panel_replay=3D0`
> - `i915.enable_dc=3D0`, `i915.enable_sagv=3D0`, `i915.enable_fbc=3D0`,=20
> `i915.enable_dsb=3D0`
> - `i915.edp_vswing=3D2` =E2=80=94 selects 400 mV DDI translation table bu=
t does=20
> not force vswing level 1 in the training loop
> - `i915.enable_rc6=3D0` =E2=80=94 silently ignored ("unknown parameter");=
 GuC RC=20
> remains active
> - `xe.force_probe=3D46a8` =E2=80=94 xe exhibits a separate fatal bug: con=
tinuous=20
> GTT plane faults in stolen framebuffer memory (~300K=E2=80=93600K suppres=
sed=20
> callbacks per 5 seconds)
>
> ## Notes
>
> - Issue self-resolves after thermal warmup, strongly suggesting the=20
> physical link is borderline at HBR/level-0 =E2=80=94 applying level 1 sho=
uld=20
> resolve it permanently
> - BIOS 1.36.0 is the latest (confirmed via fwupd)
> - External HDMI (pipe B) is unaffected throughout
>

--=20
Jani Nikula, Intel
