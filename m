Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D56C79F8C
	for <intel-gfx@archiver.kernel.org>; Sun,  6 Sep 2026 06:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C31C10E09A;
	Sun,  6 Sep 2026 06:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OFFelXgs";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF6410E09A
 for <intel-gfx@lists.freedesktop.org>; Sun,  6 Sep 2026 06:35:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A501E439C1;
 Sun,  6 Sep 2026 06:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B1D1F00A3A;
 Sun,  6 Sep 2026 06:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788676558;
 bh=md6DhW+0eYzFvTSGD2sD4+EA42a48dnSCKrtGdHEij4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=OFFelXgs7PdeahsUIk/DC2dUbANAo6WClyOI9Eed/brNhRU2MT/jixU7YyWiJVQEY
 u9wvqeEEb46dtYXnq9RIXoXQFw/DoLAz81cwF4ElzE/em12qiEe660VvBSkhS6MZ0r
 hbHfmVRKse0n4mJHaTk5AJCpGSULKmhBcbHUJq8OQFzgEcnNvZy21xbxS8xEjL7Q+z
 z7Wj+/1k4roEci6U1YU4cu/jViLF41mKa5gVAqSooJO3JMaRl4lurbl+hSPxmWzxw2
 KUzJrqFsUigw9lSGYzawtkcu82hRBuw0aqsvaPU8BHynYV4Jenwqx3gBG7dsUFv+8Y
 NfZ+yAdDRDwAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/i915/dp: enable DSC passthrough for HDMI 2.1
 PCON devices
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260906062032.857322-1-xiaolu.xie@intel.com>
References: <20260906062032.857322-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 06:35:57 +0000
Message-Id: <20260906063558.59B1D1F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardcoded usage of `intel_dp->attached_connector` accesses the roo=
t SST connector in shared DP code paths, breaking MST support.
- [High] Function signature mismatch in the call to `intel_hdmi_dsc_get_num=
_slices()` causes compilation failure.
- [High] PCON DSC passthrough fundamentally breaks downstream DSC helpers d=
ue to an unhandled all-zero `dsc_dpcd`.
--

commit 8891a63d7de717cf65ea1f4d21b654db63caa8ce
Author: Xiao Lu <xiaolu.xie@intel.com>

    drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON devices

    This patch adds explicit driver control of PCON DSC passthrough.
    It derives DSC parameters from the downstream HDMI sink's EDID DSC
    capabilities rather than from the PCON's DSC encoder DPCD (which is
    all-zero for passthrough-only PCONs).

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2393,7 +2403,19 @@ int intel_dp_dsc_compute_config(struct intel_dp *i=
ntel_dp,
>  		}
>  	}
> =20
> -	if (!intel_dp_dsc_get_slice_config(connector, adjusted_mode->crtc_clock,
> +	if (intel_dp->attached_connector->dp.pcon_dsc_passthrough) {

[Severity: High]
Does hardcoding intel_dp->attached_connector here cause issues for MST
configurations? For MST, attached_connector points to the root SST connecto=
r,
not the active MST leaf branch connector undergoing the modeset. This might
incorrectly evaluate the pcon_dsc_passthrough flag of the root connector
instead of the active MST connector.

> +		/*
> +		 * PCON passthrough: no PCON encoder DPCD, derive slice config
> +		 * from the downstream HDMI 2.1 sink DSC capabilities in EDID.
> +		 */
> +		if (!intel_dp_pcon_passthrough_dsc_slice_config(intel_dp,
> +								pipe_config,
> +								&pipe_config->dsc.slice_config)) {
> +			drm_dbg_kms(display->drm,
> +				    "PCON DSC passthrough: no valid slice config\n");
> +			return -EINVAL;
> +		}
> +	} else if (!intel_dp_dsc_get_slice_config(connector, adjusted_mode->crt=
c_clock,
>  					   adjusted_mode->crtc_hdisplay, num_joined_pipes,
>  					   &pipe_config->dsc.slice_config))
>  		return -EINVAL;

[Severity: High]
Does PCON DSC passthrough fundamentally break downstream DSC helpers like
intel_dp_dsc_compute_params() and intel_dp_dsc_supports_format() due to the
unhandled all-zero dsc_dpcd?

The patch notes that the PCON's DSC encoder DPCD is all-zero, but fails to
update critical DSC calculation pathways to bypass the DPCD checks. For exa=
mple,
intel_dp_dsc_compute_params() and intel_dp_dsc_supports_format() continue
to query connector->dp.dsc_dpcd. This causes them to calculate 0 for
properties like line_buf_depth or return false for supported formats,
causing the driver to immediately bail out with -EINVAL.

[ ... ]

> @@ -4298,6 +4360,90 @@ void intel_dp_check_frl_training(struct intel_dp *=
intel_dp)
> +static void
> +intel_dp_pcon_set_dsc_passthrough_cap(struct intel_dp *intel_dp)
> +{
> +	struct intel_connector *connector =3D intel_dp->attached_connector;

[Severity: High]
Does this unconditionally modify the root SST connector state even when inv=
oked
for an MST branch device? Using intel_dp->attached_connector instead of the
active connector could cause state corruption for MST setups.

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
Will this read EDID capabilities from the wrong connector's display_info
during DSC config computation for MST endpoints? Using
intel_dp->attached_connector fetches the root connector's capabilities rath=
er
than the downstream MST leaf.

[ ... ]

> +	/*
> +	 * Derive the required slice count from the downstream HDMI 2.1 sink
> +	 * DSC capabilities in EDID (not from the PCON encoder DPCD which is
> +	 * all-zero for passthrough-only devices).
> +	 */
> +	target_slices =3D intel_hdmi_dsc_get_num_slices(crtc_state,
> +						      hdmi_max_slices,
> +						      crtc_state->hw.adjusted_mode.hdisplay,
> +						      hdmi_max_slices,
> +						      hdmi_throughput);

[Severity: High]
Does this call to intel_hdmi_dsc_get_num_slices() fail to compile?

The function is being called with 5 arguments (passing crtc_state as the
first argument), but it expects 6 arguments, with the first argument being a
const struct drm_display_mode *mode. This would lead to a build failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906062032.8573=
22-1-xiaolu.xie@intel.com?part=3D1
