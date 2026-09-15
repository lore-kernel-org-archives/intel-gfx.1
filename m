Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17508C88E53
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Sep 2026 04:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B9410F8EF;
	Tue, 15 Sep 2026 04:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CiLqDsg8";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B31210F8EF
 for <intel-gfx@lists.freedesktop.org>; Tue, 15 Sep 2026 04:32:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DEFE04037C;
 Tue, 15 Sep 2026 04:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982921F00893;
 Tue, 15 Sep 2026 04:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789446720;
 bh=xsEki+EouqCopVl3GHK/HLEfnM8v4msAK7S5NUxTVOc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=CiLqDsg8gTSpGEdjHhVImLMWx4pc9MfE73gW56Um8p1TpfLbE1ZE4k3GRikI2K8ZT
 82mainudbxrvw9EgOJZUMxFWRAm+eYFb0ZPYMM+zgz2PQxlr8Tf1i1I1/atqf+0FuS
 GuqinLwuw7gHAzlaglSZwM/sN6Avr/Afwug8JW6Iuw5wZNSEoO+gFW1cDRnLZhhT+f
 no7SkVUooNnPn7r9Bo1nxhpabxOMBxSwrzPzra3pWsd5Y95Q47Mzl5CT/6tn1AwvZt
 whBPyXIDgiGjfshdD4MncQp0fLJEBrq4149WqJGQtggS5lZ/u1/bOC8vuCc/N5GChV
 BJh7F+ATz9gJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv6] drm/i915/dp: On DPCD init wake the DPRx for eDP
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260915042300.2201757-1-arun.r.murthy@intel.com>
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
 <20260915042300.2201757-1-arun.r.murthy@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 04:32:00 +0000
Message-Id: <20260915043200.982921F00893@smtp.kernel.org>
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
- [Medium] drm/i915/dp: DP_SET_POWER unmasked equality check misses D3_AUX_=
ON state
--

commit a16232bb96a8a2ba4105a695180c59781082f707
Author: Arun R Murthy <arun.r.murthy@intel.com>

drm/i915/dp: On DPCD init wake the DPRx for eDP

This commit wakes up the eDP sink device before reading DPCD caps to handle=
=20
failures during AUX_CH reads when the sink is asleep or in an unknown state.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16654

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0cd5e6b5034cf..c44d584cc07a7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
[ ... ]
> +static void intel_edp_wake_sink(struct intel_dp *intel_dp)
> +{
> +	u8 value =3D 0;
> +	int ret;
> +
> +	/*
> +	 * Read the current sink power state. drm_dp_dpcd_read_byte() already
> +	 * retries the AUX transaction internally, so a single read suffices.
> +	 * First commercial eDP panels are Ver1.0 or 1.1, on which DPCD
> +	 * DP_SET_POWER is supported.
> +	 */
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux, DP_SET_POWER, &value);
> +
> +	/*
> +	 * If the AUX read failed the sink may be asleep and not responding,
> +	 * or it read back D3; in either case wake it up to D0.
> +	 * In case of AUX read failure which is usually a POR case, the
> +	 * remaining bits of register 0x600 is set to '0' on POR. So a bare
> +	 * write should be fine.
> +	 */
> +	if (ret < 0 || value =3D=3D DP_SET_POWER_D3) {

[Severity: Medium]
Will this skip the wake sequence for panels that sleep in=20
DP_SET_POWER_D3_AUX_ON (0x5) or start in a POR state of 0x00?

Since DP_SET_POWER_MASK is 0x3, 0x5 is a valid state with bit 2 set, which=
=20
will cause this strict equality check to fail.=20

Should this instead verify that the state is not DP_SET_POWER_D0 to ensure =
any=20
non-D0 state triggers the wakeup?

> +		value &=3D ~DP_SET_POWER_MASK;
> +		value |=3D DP_SET_POWER_D0;
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> +				       value);
> +		/* After setting to D0 need a min of 1ms to wake (Spec DP2.1 sec 2.3.1=
.2) */
> +		fsleep(1000);
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> +				       value);
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915042300.2201=
757-1-arun.r.murthy@intel.com?part=3D1
