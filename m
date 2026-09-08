Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0CBC79F99
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 16:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBD910E137;
	Tue,  8 Sep 2026 16:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EtBNpkON";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE2310E137
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 16:25:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7BB66601DE;
 Tue,  8 Sep 2026 16:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045991F00A3A;
 Tue,  8 Sep 2026 16:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788884747;
 bh=kFUT29RGcaBTLE16pNuoyhpqbdNADH/or5bfZz5/ioU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=EtBNpkONfEqgU7aBJjXSakWiCwvj3axHQTESZZYBkbs1j+XvubPL3cPZrEjUpI97e
 gYlsTAnWpOvoWa76LfMTuYDNPaXHOIrWeGDKYRVr45mMmJgeFTRDsD67TNehPMfX7O
 ulKCnQUsJO/0wjTzlIY5jdX6IQvJwqponq7ggy/C/ICnRwa7pie7ffA1F+fkLM541Y
 Asz+irRJN9T5hnP8aVuAQFaLG3MNqR0fXBHFS2nVieUyXdBchIgASSnWPULVhNZjc+
 sMgWzH35b6AHEkLEBtlrSM3Kp9GR5itNbXhuVGZarzKBRjE6mb8NzMKbbGRjJpdb8g
 aLfYIF/nP0tWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv5] drm/i915/dp: On DPCD init wake the DPRx for eDP
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260908161248.1901822-1-arun.r.murthy@intel.com>
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
 <20260908161248.1901822-1-arun.r.murthy@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 16:25:46 +0000
Message-Id: <20260908162547.045991F00A3A@smtp.kernel.org>
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
- [High] Missing bitmask when checking the DP_SET_POWER state in intel_edp_=
wake_sink, leading to skipped wake sequences for valid sleep states.
--

commit 5baa07d75bcb19eae05989d83bea3bd4d212a13a
Author: Arun R Murthy <arun.r.murthy@intel.com>

drm/i915/dp: On DPCD init wake the DPRx for eDP

This commit attempts to wake the eDP sink before reading DPCD capabilities
to avoid AUX_CH failures when the sink is in an unknown or sleep state.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16654

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0cd5e6b5034cf..07cc39a6f2e37 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4779,6 +4779,33 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)

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
> +	 * or it read back D3; in either case wake it up to D3_AUX_ON.
> +	 */
> +	if (ret < 0 || value =3D=3D DP_SET_POWER_D3) {
                       ^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this strict equality check skip the wake sequence for valid sleep stat=
es?

If the sink returns a power state like DP_SET_POWER_D3_AUX_ON (0x5), or if
it returns 0x2 with non-zero reserved bits due to hardware quirks, this che=
ck
evaluates to false.

Without isolating the power state bits using a bitmask (or simply checking
if the value is not DP_SET_POWER_D0), the driver would skip writing
DP_SET_POWER_D0. Can this leave the main link powered down and cause
subsequent DPCD reads or link training to fail?

> +		/* After setting to D0 need a min of 1ms to wake (Spec DP2.1 sec 2.3.1=
.2) */
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> +				       DP_SET_POWER_D0);
> +		fsleep(1000);
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> +				       DP_SET_POWER_D0);
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908161248.1901=
822-1-arun.r.murthy@intel.com?part=3D1
