Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229E0C79F8C
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Sep 2026 03:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EE510E4CB;
	Wed,  9 Sep 2026 03:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hpPog1D1";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D732810E4CB
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Sep 2026 03:47:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BD690601FB;
 Wed,  9 Sep 2026 03:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8721F00A3A;
 Wed,  9 Sep 2026 03:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788925654;
 bh=X2jIx/73rGHtI86LhtU3df//6Ff556nWuQ830m0KeIc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=hpPog1D18zyWInUAmmyzbQlHpfe66CaYjR6w69JjZdgP+bcu9P27Ei4Bq9j+e4Xyy
 GGZYaZsiBiCoNCNOZKwZV+EBBDH8Klq9zyska3Tnk1QO+XTsnNNMjCGYs1PIvoI/gT
 bWnkA2v2oXNfnTQEiINuYmZl82VIPtRBGGn5XxPSg5k66U68d3v5CpDi2Z7sVpUj3U
 C4GnCcIk+q4v5Q0K9700V/kOGjiL2X/iL+icJzydgv+uRDDogmro/r4u2OVOuKTvEi
 9QAjHMDus50zLwk9aVxUb0km7vLgeCgTWMA8VJScdjDveS+nHZts3o/IaP+VGzTLFE
 RilvY+xywcZmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] drm/i915/dp: enable DSC passthrough for HDMI 2.1
 PCON devices
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260909033518.158995-2-xiaolu.xie@intel.com>
References: <20260907044410.1368008-3-xiaolu.xie@intel.com>
 <20260909033518.158995-1-xiaolu.xie@intel.com>
 <20260909033518.158995-2-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 03:47:33 +0000
Message-Id: <20260909034734.4A8721F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Flawed implementation of PCON DSC passthrough for MST topologies i=
ncorrectly targets the root SST connector, leading to broken MST support, d=
ata races, and lockless accesses.
- [High] Mode validation unconditionally rejects all DSC modes for passthro=
ugh-only PCONs by capping the slice count with an all-zero DPCD capability.
--

commit f1a37f1f267d3517b3c9a3c61b716d9649b3222e
Author: Xiao Lu <xiaolu.xie@intel.com>
drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON devices

This patch adds explicit driver control of PCON DSC passthrough. It detects
passthrough capability at connect time and uses the downstream HDMI 2.1 sink
DSC capabilities instead of the PCON's encoder constraints to derive DSC
parameters.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0cd5e6b5034cf..e23e4e8b32bf2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
[ ... ]
> @@ -2524,10 +2567,20 @@ bool intel_dp_mode_valid_with_dsc(struct intel_co=
nnector *connector,
>  							 num_joined_pipes,
>  							 output_format,
>  							 pipe_bpp, INT_MAX);
> -	int dsc_slice_count =3D intel_dp_dsc_get_slice_count(connector,
> -							   mode_clock,
> -							   mode_hdisplay,
> -							   num_joined_pipes);
> +	int dsc_slice_count;
> +
> +	if (connector->dp.pcon_dsc_passthrough) {
> +		const struct drm_display_info *info =3D &connector->base.display_info;
> +
> +		dsc_slice_count =3D min_t(int, info->hdmi.dsc_cap.max_slices,
> +					drm_dp_dsc_sink_max_slice_count(connector->dp.dsc_dpcd,
> +									false));

[Severity: High]
Does this unconditionally reject all modes requiring DSC for passthrough-on=
ly
PCONs?

The commit message notes that the PCON encoder DPCD is all-zero for
passthrough-only devices. When connector->dp.dsc_dpcd is all-zero,
drm_dp_dsc_sink_max_slice_count() evaluates to 0.=20

As a result, dsc_slice_count becomes 0 due to the min_t() cap, and the
subsequent check in intel_dp_mode_valid_with_dsc() (if dsc_slice_count =3D=
=3D 0)
will return false, failing mode validation.

[ ... ]
> @@ -3755,6 +3833,10 @@ intel_dp_sink_set_dsc_decompression(struct intel_c=
onnector *connector,
>  {
>  	struct intel_display *display =3D to_intel_display(connector);
> =20
> +	/* PCON passthrough: PCON forwards the stream, sink decompresses. */
> +	if (!connector->mst.dp && connector->dp.pcon_dsc_passthrough)
> +		return;

[Severity: High]
Will this short-circuit logic fail to bypass decompression for MST leaves?

For an MST leaf connector, connector->mst.dp points to the root intel_dp,
meaning the !connector->mst.dp check evaluates to false. This appears to
contradict the commit message's note about ensuring
intel_dp_sink_set_dsc_decompression() is correctly bypassed for PCON
passthrough in MST topologies.

[ ... ]
> @@ -4298,6 +4391,116 @@ void intel_dp_check_frl_training(struct intel_dp =
*intel_dp)
>  	}
>  }
> =20
> +/*
> + * intel_dp_pcon_set_dsc_passthrough_cap - cache PCON DSC passthrough ca=
pability
[ ... ]
> + */
> +static void
> +intel_dp_pcon_set_dsc_passthrough_cap(struct intel_dp *intel_dp)
> +{
> +	struct intel_connector *connector =3D intel_dp->attached_connector;
> +	const struct drm_display_info *info;
> +
> +	if (!connector)
> +		return;
> +
> +	connector->dp.pcon_dsc_passthrough =3D false;
> +
> +	/*
> +	 * PCON DSC passthrough is only supported for SST direct connections.
> +	 * In MST topologies the intermediate hub may report incorrect virtual
> +	 * DPCD for the downstream PCON port, leading to mismatched DSC
> +	 * parameters.  Skip passthrough for MST until hub firmware correctly
> +	 * reflects the PCON's capabilities.
> +	 */
> +	if (connector->mst.port)
> +		return;

[Severity: High]
When called during MST connector mode validation, does this locklessly muta=
te
the root SST connector's state instead of evaluating the MST leaf?

Since mst_connector_get_ddc_modes() passes the root intel_dp
(connector->mst.dp), intel_dp->attached_connector resolves to the root SST
connector.=20

Consequently, connector->mst.port is NULL for the root connector, the early
return is skipped, and it locklessly modifies the root connector's
pcon_dsc_passthrough flag using potentially stale display_info data.

[ ... ]
> +static bool
> +intel_dp_pcon_passthrough_dsc_slice_config(struct intel_dp *intel_dp,
> +					   const struct intel_crtc_state *crtc_state,
> +					   struct intel_dsc_slice_config *config_ret)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	struct intel_connector *connector =3D intel_dp->attached_connector;
> +	const struct drm_display_info *info =3D &connector->base.display_info;

[Severity: High]
Could this result in using the wrong display_info during an MST stream's
atomic check?

If this is called for an MST stream, intel_dp is the root DP device, making
intel_dp->attached_connector the root SST connector. This causes the functi=
on
to read the root connector's display_info rather than the MST leaf's
display_info.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 6a869d0f6ffc0..2653f2347f235 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
[ ... ]
> @@ -1451,6 +1451,13 @@ static int mst_connector_get_ddc_modes(struct drm_=
connector *_connector)
> =20
>  	ret =3D intel_connector_update_modes(&connector->base, drm_edid);
> =20
> +	/*
> +	 * Re-evaluate PCON DSC passthrough capability now that the MST
> +	 * connector's EDID has been parsed and display_info.hdmi.dsc_cap
> +	 * is populated.
> +	 */
> +	intel_dp_pcon_set_dsc_passthrough_cap(intel_dp);

[Severity: High]
Is intel_dp pointing to the root SST port here rather than the MST leaf?

As noted above, passing the root intel_dp into
intel_dp_pcon_set_dsc_passthrough_cap() causes the capability evaluation to
incorrectly target the root connector rather than the MST stream connector.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909033518.1589=
95-1-xiaolu.xie@intel.com?part=3D2
