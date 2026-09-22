Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2F4C982FA
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2026 08:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90A910E629;
	Tue, 22 Sep 2026 08:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lPKVIT4Q";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC9610E629
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Sep 2026 08:24:10 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C5DD860234;
 Tue, 22 Sep 2026 08:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525E21F000FF;
 Tue, 22 Sep 2026 08:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790065449;
 bh=IHPOD4SaRI7c4qPyxJZ/oy1dOTr1yUVZy0xLAaqPXfk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=lPKVIT4QqiSaXlxSLTZzZUsVXdhtVMfR5mTfDsFmLSmmkKDPlq5jyTTsA/06S/VL5
 StB8qlcIC9PSgnOCyRMkZZ2Vr3hXivAa7r9Yo8wQkmAHfJTwKuIsyHhNKzCh/UKE6i
 v+y1Sp4qxZoyDYQykoLyrKBZFI8/Uc3CtcKfEXg+0VWOV6omNcHcJ2K06SxWnHR3T7
 WkSo4VoHyUfhzT77wcGB65s5nAkW+ZNpsMVR8Xzca61xo1SB7tCV16hsymp4FLZoqZ
 JB3WEY5UmGROh0UO4qcJGOjM4KDrSs5Z66Gaxvo7UfHIOAB03hKpi5dALQoAIYibxT
 WF1qJc1cNfNCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/dp: fix PBN in ALLOCATE_PAYLOAD request to use
 actual video bandwidth
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260922081258.1995510-1-xiaolu.xie@intel.com>
References: <20260922081258.1995510-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 08:24:08 +0000
Message-Id: <20260922082409.525E21F000FF@smtp.kernel.org>
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
- [High] drm/i915: decoupling MST time slots from aligned TU size breaks VC=
PI allocation
--

commit d39c8c4fc3f7e04d619491dd803df11282c8c97a
Author: Xiao Lu <xiaolu.xie@intel.com>
Subject: drm/i915/dp: fix PBN in ALLOCATE_PAYLOAD request to use actual vid=
eo bandwidth

This commit fixes an issue where the TU-aligned PBN value was being passed
to drm_dp_atomic_find_time_slots(), causing the MST core's bandwidth check
to fail for configurations that should fit. It separates the raw PBN from
the TU-aligned PBN, passing raw_pbn for payload allocation while retaining
the aligned PBN for TU hardware programming.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
[ ... ]
> @@ -397,7 +398,21 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *=
intel_dp,
> =20
>  			slots =3D drm_dp_atomic_find_time_slots(state, &intel_dp->mst.mgr,
>  							      connector->mst.port,
> -							      dfixed_trunc(pbn));
> +							      raw_pbn);

[Severity: High]
Does passing the unaligned raw_pbn cause the MST core to allocate an
unaligned number of time slots? This seems to decouple the MST core's VCPI
allocation from the driver's aligned hardware TU size in
intel_dp_mtp_tu_compute_config(), which can corrupt the MTP payload framing
and overrun the MTP total slot capacity.

> +
> +			drm_dbg_kms(display->drm,
> +				    "MST TU %s pipe %c: clock=3D%d lanes=3D%d bpp=3D%d link_bpp=3D%d=
 fec=3D%d\n",
> +				    connector->base.name,
> +				    pipe_name(to_intel_crtc(crtc_state->uapi.crtc)->pipe),
> +				    crtc_state->port_clock, crtc_state->lane_count,
> +				    fxp_q4_to_int(bpp_x16), fxp_q4_to_int(link_bpp_x16),
> +				    crtc_state->fec_enable);
> +			drm_dbg_kms(display->drm,
> +				    "MST TU %s: overhead=3D%d raw_pbn=3D%d pbn=3D%d pbn_div=3D%d tu=
=3D%d slots=3D%d full_pbn=3D%d\n",
> +				    connector->base.name,
> +				    remote_bw_overhead, raw_pbn,
> +				    dfixed_trunc(pbn), dfixed_trunc(mst_state->pbn_div),
> +				    remote_tu, slots, connector->mst.port->full_pbn);
> =20
>  			/* TODO: Check this already in drm_dp_atomic_find_time_slots(). */
>  			if (slots > mst_state->total_avail_slots)
>  				slots =3D -EINVAL;

[Severity: High]
This capacity check now only validates the unaligned count. Could this allow
configurations where the aligned hardware TU size exceeds the available MTP
slots to pass the check?

[ ... ]
> 		if (slots =3D=3D -EDEADLK)
> 			return slots;
>=20
> 		if (slots >=3D 0) {
> 			drm_WARN_ON(display->drm, slots !=3D crtc_state->dp_m_n.tu);

[Severity: High]
Will this assertion trigger consistently now? Because slots (unaligned) will
no longer match crtc_state->dp_m_n.tu (which is aligned), this might cause
persistent kernel WARN_ON stack traces (crashing systems with panic_on_warn)
on DP MST modesets where the raw video bandwidth results in an unaligned TU
count.

>=20
> 			break;
> 		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922081258.1995=
510-1-xiaolu.xie@intel.com?part=3D1
