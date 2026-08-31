Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191ABC61DF0
	for <intel-gfx@archiver.kernel.org>; Mon, 31 Aug 2026 04:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8A210E1D4;
	Mon, 31 Aug 2026 04:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YOEWl+ii";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EF210E1D4
 for <intel-gfx@lists.freedesktop.org>; Mon, 31 Aug 2026 04:57:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id EA0334017A;
 Mon, 31 Aug 2026 04:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64771F000E9;
 Mon, 31 Aug 2026 04:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788152249;
 bh=Grw+cpUxCNp9f3is3AJEszm6bdWrs/LKm++S/WXwVcM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=YOEWl+ii8dC+IroTNM+2w7nnWvUaF3UnJH7pLCIwLMr7xs/cC0YURGiTeWRx/o102
 Hd9F3nP42am30MxT8gihSGVW6W4ugtgadPmKfmX7b0OnljwFcPE2LNRQtY14Gs7vOq
 OAVqmCO4a8KkNa1DuloQrCY5iTE685uZVp/Brggw675MsfLOWeHD/JnnApVGNOYCHB
 xENulAE01vpKUxoGbU+ojPnUF/8hEO4yxGRdkYRb6HBQAFgFqV7NqcrICNDZ7cAZGP
 SwSr0Xb0TJpAHbC7rlNI2pOVvRAxal+tN6SNXF3Dp/aMoW6e35QTrXNaAJxO+oOtOF
 RK8rdl9NLNijQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/pps: don't orphan the VDD wakeref when the HW
 force bit is reset
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260831044036.1236136-1-arun.r.murthy@intel.com>
References: <20260831044036.1236136-1-arun.r.murthy@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 04:57:29 +0000
Message-Id: <20260831045729.A64771F000E9@smtp.kernel.org>
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
- [High] This problem wasn't introduced by this patch, but the patch incomp=
letely fixes the wakeref leak by failing to update the VDD off-paths to use=
 the software wakeref as the authoritative record, leaving them vulnerable =
to the exact same asynchronous hardware state reset.
--

commit 18ac414fc1cf2489e00ff31b05c939f81f2c6a00
Author: Arun R Murthy <arun.r.murthy@intel.com>
drm/i915/pps: don't orphan the VDD wakeref when the HW force bit is reset

This patch attempts to fix a wakeref leak by ensuring the software wakeref
is not overwritten if the volatile hardware bit clears while we still hold
a reference. It updates intel_pps_vdd_on_unlocked to track the wakeref
authoritatively.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/8477

> diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i=
915/display/intel_pps.c
> index d4c98b150fa2b..43e89aaf419f6 100644
> --- a/drivers/gpu/drm/i915/display/intel_pps.c
> +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> @@ -758,9 +758,10 @@ bool intel_pps_vdd_on_unlocked(struct intel_dp *inte=
l_dp)
>  	if (edp_have_panel_vdd(intel_dp))
>  		return need_to_disable;

[Severity: High]
This is a pre-existing issue, but does relying on edp_have_panel_vdd()
here leave vdd_wakeref unbalanced if the hardware bit is spuriously set?

If the hardware EDP_FORCE_VDD bit is set asynchronously (e.g., by DMC, DC
states, or BIOS), edp_have_panel_vdd() will return true and bypass
acquiring the wakeref into intel_dp->pps.vdd_wakeref. When the panel is
later turned off, the off-paths might unconditionally drop a reference we
never took.

Additionally, does this fix leave the VDD off-paths vulnerable to the
exact same race with volatile hardware state?

For example, in intel_pps_vdd_off_sync_unlocked():

    if (!edp_have_panel_vdd(intel_dp))
        return;
       =20
If the hardware bit was reset asynchronously, this early return completely
skips calling intel_display_power_put(), permanently leaking vdd_wakeref.

Similarly, in intel_pps_init_late():

    if (edp_have_panel_vdd(intel_dp))
        edp_panel_vdd_schedule_off(intel_dp);

If the hardware bit cleared, this fails to schedule the delayed wakeref
cleanup, causing another leak.

Should the VDD off-paths also be updated to use vdd_wakeref as the
authoritative record rather than the volatile hardware bit?

> -	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> -	intel_dp->pps.vdd_wakeref =3D intel_display_power_get(display,
> -							    intel_aux_power_domain(dig_port));
> +	if (!intel_dp->pps.vdd_wakeref)
> +		intel_dp->pps.vdd_wakeref =3D
> +			intel_display_power_get(display,
> +						intel_aux_power_domain(dig_port));
> =20
>  	pp_stat_reg =3D _pp_stat_reg(intel_dp);
>  	pp_ctrl_reg =3D _pp_ctrl_reg(intel_dp);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831044036.1236=
136-1-arun.r.murthy@intel.com?part=3D1
