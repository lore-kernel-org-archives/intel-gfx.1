Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB07C79F89
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 09:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A70B10E43C;
	Mon,  7 Sep 2026 09:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X6yYbtJR";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1D510E43C
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 09:40:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 20A2E403D5;
 Mon,  7 Sep 2026 09:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7911F00A3A;
 Mon,  7 Sep 2026 09:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788774006;
 bh=UMsEGm6vPhFhq3VqCkJGaUH94Jqef24eue8Q3fDq6A8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=X6yYbtJRIpglxQzCdHqPnVfmJ71ifBOKcI/gybVQ1ZuFKYh3RXBDMKg1l5ItxXpf7
 0lrwCUqec9tL4aUrs2l5S9VRp5qfOUeq0UB6e6LRpelLMYEoJEc4IMWiOtIgrN9yZS
 uWyNjP1Qh3fEPb77J4o3FbYAkCJ4creXrapxMVBM9INqS/uJ6mjyUKK+1Wt+rDVeWk
 p54ScC6pWTxnBsPBrbrZ2B1Oj/FiMkCuNcB7GbrtfKHrusX+Fg1vLJ9P9Umg9YOWbl
 IIddX3Pkn7yzsGi8Ue3W8hmpBBT37eOZ4kYwR1Czt0G9hmzspDC7qgmv797sWmXSSl
 I/MT7AE7hMQuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260907092707.1823088-1-arun.r.murthy@intel.com>
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
 <20260907092707.1823088-1-arun.r.murthy@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 09:40:05 +0000
Message-Id: <20260907094005.CC7911F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The wake function is called after reading DPCD caps, entirely defe=
ating the patch's purpose.
- [High] Ineffective polling loop in `poll_timeout_us` due to internal `drm=
_dp_dpcd_read_byte` timeouts exceeding the requested polling timeout.
- [Medium] Missing DPCD revision check before accessing the DP_SET_POWER re=
gister.
- [Medium] Unconditional write of DP_SET_POWER_D3_AUX_ON (0x5) is unsafe fo=
r eDP 1.1 panels.
- [Medium] The `poll_timeout_us` macro expands such that `ret` is modified =
inside the expression and overwritten by the return value, obfuscating erro=
rs.
- [Medium] The use of `true` for `sleep_before_op` unconditionally forces a=
 1ms delay on every eDP initialization.
--

commit fdfc8b88675078b318b600613848f0873f293de0
Author: Arun R Murthy <arun.r.murthy@intel.com>
drm/i915/dp: On DPCD init wake the DPRx for eDP

This commit attempts to fix AUX channel failures by waking up the sink
device for eDP connections. It introduces a wake sequence that is
called right before reading the DPCD capabilities.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16654

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0cd5e6b5034cf..d4cc5f7e82a49 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4779,6 +4779,38 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
>  	intel_edp_set_data_override_rates(intel_dp);
>  }
> =20
> +/* Spec says to try for 3 times, its doubled to add the software overhea=
d */
> +#define AUX_CH_WAKE_RETRY	6
> +
> +static void intel_edp_wake_sink(struct intel_dp *intel_dp)
> +{
> +	u8 value =3D 0;
> +	int ret =3D 0;
> +
> +	/*
> +	 * Wake the sink device
> +	 * Spec DP2.1 section 2.3.1.2 if AUX CH is powered down by writing 0x02
> +	 * to DP_SET_POWER dpcd reg, 1ms time would be required to wake it up
> +	 */
> +	ret =3D poll_timeout_us(ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> +							  DP_SET_POWER, &value),
> +			      ret =3D=3D 0, 1000, AUX_CH_WAKE_RETRY * 1000, true);

[Severity: High]
Will this polling loop actually run more than once?

The poll_timeout_us() macro is given a 6ms timeout. However,
drm_dp_dpcd_read_byte() internally retries for 16ms.

Doesn't this mean the macro's timeout will expire during the very first
read attempt, unconditionally terminating the loop prematurely?

[Severity: Medium]
Does the ret =3D poll_timeout_us(ret =3D ...) assignment clobber the actual
error codes?

Since the macro expands and evaluates the inner expression, it looks
like it overwrites the internal hardware error (like -EIO) with
-ETIMEDOUT, which could hide the true failure reason.

[Severity: Medium]
Does passing true for sleep_before_op force an unconditional 1ms delay
on every eDP initialization?

It seems this sleep happens on the hot path before any wake command has
actually been issued to the hardware.

[Severity: Medium]
Is it safe to unconditionally read the DP_SET_POWER register here
without verifying panel capabilities first?

For DPCD 1.0 panels, polling an unsupported register might trigger
guaranteed NAKs and timeout delays.

> +
> +	/*
> +	 * If sink is in D3 then it may not respond to the AUX tx so
> +	 * wake it up to D3_AUX_ON state
> +	 * If the above poll_timeout_us fails, try waking the sink.
> +	 */
> +	if (value =3D=3D DP_SET_POWER_D3 || ret < 0) {
> +		/* After setting to D0 need a min of 1ms to wake (Spec DP2.1 sec 2.3.1=
.2) */
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> +				       DP_SET_POWER_D0);
> +		fsleep(1000);
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> +				       DP_SET_POWER_D3_AUX_ON);

[Severity: Medium]
Is it safe to write DP_SET_POWER_D3_AUX_ON (0x5) unconditionally to
older hardware?

For eDP 1.1 panels where 0x5 is a reserved value, could this force a
compliance violation and cause a potential link drop?

> +	}
> +}
> +
>  static bool
>  intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *c=
onnector)
>  {
> @@ -4792,6 +4824,8 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, stru=
ct intel_connector *connector
>  	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) !=3D 0)
>  		return false;
> =20
> +	intel_edp_wake_sink(intel_dp);

[Severity: High]
Is intel_edp_wake_sink() unreachable if the sink is actually asleep?

If the sink is asleep, it seems like drm_dp_read_dpcd_caps() would
fail and immediately return false, completely bypassing the new wake
function.

Could this abort initialization and leave the display broken, defeating
the purpose of the patch?

> +
>  	drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
>  			 drm_dp_is_branch(intel_dp->dpcd));
>  	intel_init_dpcd_quirks(intel_dp, &intel_dp->desc.ident);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907092707.1823=
088-1-arun.r.murthy@intel.com?part=3D1
