Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC31C61DD6
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2026 05:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9830610E45A;
	Wed,  2 Sep 2026 05:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PQo/VVh1";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470D310E45A
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Sep 2026 05:30:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id EF0AC44781;
 Wed,  2 Sep 2026 05:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09F11F000E9;
 Wed,  2 Sep 2026 05:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788327021;
 bh=Dk2PJ3+Vc11xlrzLb9ZnwIWDqB9SKabRyWzl5HjPtW4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=PQo/VVh19e7o+seymjLE70bdg5oqnkSPchuc+6IKP0ZsrtGTE7/YP5hH61ItcW6PH
 p0UBIYu8TidSZObCJzikpUwWhu7i7c+aLu6Lkx1ut0dbPysUYU5ZA9ZgoEQPuxwMfs
 iQ+BSh7DeUjWCSte/eqsS08zc+yHlQmd9zrkbL0eTnMuVjgIhXety4Qg7U/XRrS6nC
 O9YtW21tGP6i7MfXQZK/BU64Lt0jW2OCZDnZ5zqoCOpo3GCU+bSsZBcWuILY/3hP4M
 jzVyla7155227LAl9kV+NjS0pt3Fc3/hoqqH3LxD3rn3yXMEdPPmQ/Zu4BGYXvprBL
 Yb9K2bmSIFVxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6] drm/i915/display: Enable VRR/HDR over MST
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260902051206.264215-1-xiaolu.xie@intel.com>
References: <20260901132601.239131-1-xiaolu.xie@intel.com>
 <20260902051206.264215-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 05:30:21 +0000
Message-Id: <20260902053021.B09F11F000E9@smtp.kernel.org>
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
- [Low] The patch exports and directly calls the low-level `drm_dp_mst_dpcd=
_read` and `drm_dp_mst_dpcd_write` functions instead of using the standard =
DPCD access APIs.
--

commit 79505a4fb76cee58bfa580901d6c993fd41628e1
Author: Xiao Lu <xiaolu.xie@intel.com>

drm/i915/display: Enable VRR/HDR over MST

This commit enables VRR and HDR metadata over MST. It reads the MSA timing
parameter ignore capability from the sink's virtual DPCD and updates the
VSC SDP, HDR metadata, and AS-SDP computations.

> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -2164,6 +2164,7 @@ ssize_t drm_dp_mst_dpcd_read(struct drm_dp_aux *aux,
>  	return drm_dp_send_dpcd_read(port->mgr, port,
>  				     offset, size, buffer);
>  }
> +EXPORT_SYMBOL(drm_dp_mst_dpcd_read);

[Severity: Low]
Is it necessary to export drm_dp_mst_dpcd_read directly to the core DRM
layer? The standard helpers like drm_dp_dpcd_read already check aux->is_rem=
ote
and route to the MST equivalents. Using the standard API preserves the
built-in drm_dp_dump_access debugging trace.

> @@ -2187,6 +2188,7 @@ ssize_t drm_dp_mst_dpcd_write(struct drm_dp_aux *au=
x,
>  	return drm_dp_send_dpcd_write(port->mgr, port,
>  				      offset, size, buffer);
>  }
> +EXPORT_SYMBOL(drm_dp_mst_dpcd_write);

[Severity: Low]
Similarly, does drm_dp_mst_dpcd_write need to be exported here, or could
we rely on the standard drm_dp_dpcd_write API instead?

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c

[ ... ]

> @@ -1157,6 +1160,24 @@ static void mst_stream_post_disable(struct intel_a=
tomic_state *state,
>  	 * Power down mst path before disabling the port, otherwise we end
>  	 * up getting interrupts from the sink upon detecting link loss.
>  	 */
> +	if (old_crtc_state->vrr.enable) {
> +		u8 val;
> +		ssize_t ret;
> +
> +		ret =3D drm_dp_mst_dpcd_read(&connector->mst.port->aux,
> +					   DP_DOWNSPREAD_CTRL, &val, 1);

[Severity: Low]
Can we use drm_dp_dpcd_read here in mst_stream_post_disable instead of
calling the low-level drm_dp_mst_dpcd_read function? Bypassing the standard
API skips the DPCD access debug tracing that is printed when DRM_UT_DP is
enabled, which can make MST debugging more difficult.

> +		if (ret < 0) {
> +			drm_dbg_kms(display->drm,
> +				    "[CONNECTOR:%d:%s] Failed to read DP_DOWNSPREAD_CTRL: %zd\n",
> +				    connector->base.base.id,
> +				    connector->base.name, ret);
> +		} else {
> +			val &=3D ~DP_MSA_TIMING_PAR_IGNORE_EN;
> +			drm_dp_mst_dpcd_write(&connector->mst.port->aux,
> +					      DP_DOWNSPREAD_CTRL, &val, 1);

[Severity: Low]
Does this also apply to the write operation? Calling drm_dp_dpcd_write
instead of drm_dp_mst_dpcd_write would ensure the sideband transactions are
logged consistently with the rest of the DPCD accesses.

[ ... ]

> @@ -1274,6 +1295,24 @@ static void mst_stream_pre_enable(struct intel_ato=
mic_state *state,
> =20
>  	drm_dp_send_power_updown_phy(&intel_dp->mst.mgr, connector->mst.port, t=
rue);
> =20
> +	if (pipe_config->vrr.enable) {
> +		u8 val;
> +		ssize_t ret;
> +
> +		ret =3D drm_dp_mst_dpcd_read(&connector->mst.port->aux,
> +					   DP_DOWNSPREAD_CTRL, &val, 1);
> +		if (ret < 0) {
> +			drm_dbg_kms(display->drm,
> +				    "[CONNECTOR:%d:%s] Failed to read DP_DOWNSPREAD_CTRL: %zd\n",
> +				    connector->base.base.id,
> +				    connector->base.name, ret);
> +		} else {
> +			val |=3D DP_MSA_TIMING_PAR_IGNORE_EN;
> +			drm_dp_mst_dpcd_write(&connector->mst.port->aux,
> +					      DP_DOWNSPREAD_CTRL, &val, 1);

[Severity: Low]
For consistency, could the standard read and write helpers be used here in
mst_stream_pre_enable as well, avoiding the need to export the low-level
MST topology functions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902051206.2642=
15-1-xiaolu.xie@intel.com?part=3D1
