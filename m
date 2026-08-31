Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8E2C61DD3
	for <intel-gfx@archiver.kernel.org>; Mon, 31 Aug 2026 09:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C3D10E276;
	Mon, 31 Aug 2026 09:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UJZKnaE2";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74EC110E276
 for <intel-gfx@lists.freedesktop.org>; Mon, 31 Aug 2026 09:58:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9EA3560120;
 Mon, 31 Aug 2026 09:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C9A1F000E9;
 Mon, 31 Aug 2026 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788170305;
 bh=AASBnBFRIqop+0bjZgae+I4zpAjrcmXaQU/OUzFuaIM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=UJZKnaE2AB1pJjXVTfLAzr5i7wLBMtkv/N3ysMXTzqehZmkGshbmY+/Ls+ECNVsiu
 j15jb9aFGX9YQ4NKE/WOBAq9cYaFO1dazrGSZWrif81RFIZVLDaSIa1YLvZ5GE2H1R
 66W5sRSMWvDqtfRTs3tIQpAtX63XhByKEtOwMHkA7zFwPrP4fT+noCbHtXEgfnrRDa
 VHR7SrMvofvezQs6gGNYZGbnC8IFdX+W3NH8OO04CLU9PceSKvP4mFme9CVAO+HJp4
 w5r6yGuojL/hKpw4DGFPtKR8dlXvLWVDReMsSVW5yUJOVcjXE5sdjUHf0UAjPEorbC
 9y/APmxCGCLBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] drm/i915/pps: reconcile a BIOS-enabled VDD without
 leaking its wakeref
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260831093854.1427305-1-arun.r.murthy@intel.com>
References: <20260831044036.1236136-1-arun.r.murthy@intel.com>
 <20260831093854.1427305-1-arun.r.murthy@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 09:58:24 +0000
Message-Id: <20260831095825.26C9A1F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Early return in intel_pps_vdd_off_sync_unlocked() skips wakeref cl=
eanup and permanently leaks vdd_wakeref if the hardware VDD bit is reset ex=
ternally.
--

commit 74c15e0ea248699dfcba4c3a0009676b770c8241
Author: Arun R Murthy <arun.r.murthy@intel.com>
Subject: drm/i915/pps: reconcile a BIOS-enabled VDD without leaking its wak=
eref

When the BIOS leaves the eDP VDD force bit enabled at boot, pps_vdd_init()
adopts that state by taking an AUX power-domain reference into vdd_wakeref.
This commit explicitly tracks this handover to prevent blindly reusing or
leaking the wakeref when the HW force bit is reset under the driver.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/8477

[ ... ]
> diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i=
915/display/intel_pps.c
> index d4c98b150fa2b..4152880774395 100644
> --- a/drivers/gpu/drm/i915/display/intel_pps.c
> +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> @@ -758,9 +758,22 @@ bool intel_pps_vdd_on_unlocked(struct intel_dp *inte=
l_dp)
>  	if (edp_have_panel_vdd(intel_dp))
>  		return need_to_disable;
> =20
> -	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> -	intel_dp->pps.vdd_wakeref =3D intel_display_power_get(display,
> -							    intel_aux_power_domain(dig_port));
> +	/*
> +	 * pps_vdd_init() may have taken a reference at the BIOS->driver handov=
er
> +	 * for an already-on VDD whose HW force bit was since reset under us (DC
> +	 * states, DMC, BIOS). Only in that boot/resume handover case reuse the
> +	 * held reference instead of overwriting and leaking it. At runtime a
> +	 * held wakeref here is a real imbalance, so keep asserting it and depe=
nd
> +	 * on the HW read.
> +	 */
> +	if (intel_dp->pps.vdd_wakeref_boot) {
> +		intel_dp->pps.vdd_wakeref_boot =3D false;
> +	} else {
> +		drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> +		intel_dp->pps.vdd_wakeref =3D
> +			intel_display_power_get(display,
> +						intel_aux_power_domain(dig_port));

[Severity: High]
This is a pre-existing issue, but does this overwrite and permanently leak
the runtime vdd_wakeref if the hardware VDD bit is reset externally?

As the commit message acknowledges, the hardware VDD bit can be cleared
externally by DMC, DC states, or BIOS independently of the driver.

If this happens while a runtime wakeref is held, and the delayed VDD off
timer expires, intel_pps_vdd_off_sync_unlocked() appears to return early
without dropping the wakeref:

drivers/gpu/drm/i915/display/intel_pps.c:intel_pps_vdd_off_sync_unlocked() {
    ...
    if (!edp_have_panel_vdd(intel_dp))
        return;
    ...
}

If intel_pps_vdd_on_unlocked() is subsequently called, it triggers this
WARN_ON and overwrites the non-NULL wakeref pointer with a new allocation.
This makes the original leaked wakeref unrecoverable.

Is there a way to safely clean up the existing runtime wakeref before
allocating a new one?

> +	}
> =20
>  	pp_stat_reg =3D _pp_stat_reg(intel_dp);
>  	pp_ctrl_reg =3D _pp_ctrl_reg(intel_dp);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831093854.1427=
305-1-arun.r.murthy@intel.com?part=3D1
