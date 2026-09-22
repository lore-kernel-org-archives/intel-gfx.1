Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D24C982F1
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2026 09:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6871910EC0D;
	Tue, 22 Sep 2026 09:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hV2PGgas";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F68910EC0D
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Sep 2026 09:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790067897; x=1821603897;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=O3bc4gFQ+exec4W0dvCKWzcGfOIIpwcykh5fTt0ppxg=;
 b=hV2PGgaszf171PPdfFIlr4H5JvNsadRD1VeLlBMg90B54wGfLOasiApc
 6G+Jm+irFO6dJD8/vc7vTJyvhV6Vw+IUodXFnq8mfLsbOQ4XQUxsE2TQ9
 zM8ciCe5dKGnHsYRFNXd+8dgG0ivN/smqNmNM8lfipqtIRSZfMFMu1c/z
 lLAqNpgb4zwudNdur80wOjjHBgUrzmVZIoLQR19nl1JgK+yH024YRPgZw
 hvgL1AAfadNRFpj/GaNQAV4jgWCjxt/EJZ+c+EjxrGxyh12btVHVXcYRw
 NnhADeEIk8pusc3j36FGuK1NZfWwMH+4EXDB2CYkHsXWS5CEL6WpRk+DY w==;
X-CSE-ConnectionGUID: 9HQ4jcDPTO6ElY34Gb69eQ==
X-CSE-MsgGUID: A4SPQHfdTx+wl4tL18Cp3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1160727"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1160727"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 02:04:44 -0700
X-CSE-ConnectionGUID: Lnz84abjQK6XmSPn2eYU/A==
X-CSE-MsgGUID: p2St7UTbQgm/etzj9OwZiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="269576553"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 02:04:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Xiao Lu <xiaolu.xie@intel.com>, intel-gfx@lists.freedesktop.org
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, Xiao Lu <xiaolu.xie@intel.com>
Subject: Re: [PATCH] drm/i915/dp: fix PBN in ALLOCATE_PAYLOAD request to use
 actual video bandwidth
In-Reply-To: <20260922081258.1995510-1-xiaolu.xie@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260922081258.1995510-1-xiaolu.xie@intel.com>
Date: Tue, 22 Sep 2026 12:04:39 +0300
Message-ID: <ebfe85875a9d47151426913de39e49159498be8e@intel.com>
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

On Tue, 22 Sep 2026, Xiao Lu <xiaolu.xie@intel.com> wrote:
> When computing the number of time slots for an MST stream,
> intel_dp_mtp_tu_compute_config() was passing the TU-aligned PBN value
> to drm_dp_atomic_find_time_slots() instead of the actual video
> bandwidth PBN.
>
> The aligned PBN is computed by rounding up the raw video bandwidth to
> the nearest TU boundary and aligning to the hardware TU granularity
> (4 / lane_count). This inflated PBN is then used as the requested PBN
> in the ALLOCATE_PAYLOAD sideband message, causing the MST core's
> bandwidth check in drm_dp_mst_atomic_check_port_bw_limit() to
> incorrectly reject configurations that should fit within the available
> link bandwidth.
>
> Per DP v2.1b Section 2.6.4.1, the PBN in an ALLOCATE_PAYLOAD request
> represents the video stream bandwidth and is independent of the source
> TX link rate. The same video stream should result in the same PBN value
> regardless of the link rate used on the source side. Passing the
> TU-aligned PBN violates this requirement, as it incorporates link-rate-
> specific TU granularity into the payload bandwidth value.
>
> This was observed in a 3-display MST daisy-chain topology (PS8650 MST
> hub =E2=86=92 ViewSonic VP2468 =C3=97 2 =E2=86=92 Lenovo Pro 27UD-10) whe=
re switching
> Lenovo to 4K@60Hz failed with -ENOSPC despite the actual video
> bandwidth fitting within the DFP link capacity. The inflated PBN of
> the VP2468 streams (537 instead of the correct 532 for 1920x1080@60Hz)
> consumed excess slots, leaving insufficient room for the 4K@60Hz stream.
>
> Fix this by separating raw_pbn (the actual video bandwidth used for
> payload allocation and ALLOCATE_PAYLOAD) from the aligned pbn (used
> only for TU hardware programming). Pass raw_pbn to
> drm_dp_atomic_find_time_slots() so that bandwidth accounting in the
> MST core reflects the true stream requirements.
>
> Depends-on: <20260908132844.2309047-1-xiaolu.xie@intel.com>
>   ("drm/dp/mst: track allocated_pbn from ALLOCATE_PAYLOAD reply")

This is not a thing. If you have multiple patches with dependencies,
please send them together.

BR,
Jani.

>
> The companion patch above tracks the allocated_pbn returned in the
> ALLOCATE_PAYLOAD reply from the branch device. Together with this fix,
> the correct raw_pbn is used as the requested PBN in the
> ALLOCATE_PAYLOAD request, and the allocated_pbn from the reply is used
> for bandwidth limit checks. This pairing ensures that both the request
> and the check accurately reflect the actual video stream bandwidth
> and any per-hop capacity constraints along the MST path.
>
> Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 33 +++++++++++++++------
>  1 file changed, 24 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 0c362784a..31e846aad 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -350,6 +350,7 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *i=
ntel_dp,
>  		if (is_mst) {
>  			int remote_bw_overhead;
>  			int remote_tu;
> +			int raw_pbn;
>  			fixed20_12 pbn;
>=20=20
>  			remote_bw_overhead =3D intel_dp_mst_bw_overhead(crtc_state,
> @@ -369,9 +370,10 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *=
intel_dp,
>  			 * crtc_state->dp_m_n.tu), provided that the driver doesn't
>  			 * enable SSC on the corresponding link.
>  			 */
> -			pbn.full =3D dfixed_const(intel_dp_mst_calc_pbn(adjusted_mode->crtc_c=
lock,
> -								      link_bpp_x16,
> -								      remote_bw_overhead));
> +			raw_pbn =3D intel_dp_mst_calc_pbn(adjusted_mode->crtc_clock,
> +							 link_bpp_x16,
> +							 remote_bw_overhead);
> +			pbn.full =3D dfixed_const(raw_pbn);
>  			remote_tu =3D DIV_ROUND_UP(pbn.full, mst_state->pbn_div.full);
>=20=20
>  			/*
> @@ -384,11 +386,10 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp =
*intel_dp,
>  			remote_tu =3D ALIGN(remote_tu, 4 / crtc_state->lane_count);
>=20=20
>  			/*
> -			 * Also align PBNs accordingly, since MST core will derive its
> -			 * own copy of TU from the PBN in drm_dp_atomic_find_time_slots().
> -			 * The above comment about the difference between the PBN
> -			 * allocated for the whole path and the TUs allocated for the
> -			 * first branch device's link also applies here.
> +			 * Keep the PBN corresponding to the aligned hardware TU separate
> +			 * from raw_pbn. The aligned value describes the TU granularity of
> +			 * the first downstream branch link; raw_pbn is the video bandwidth
> +			 * value passed to the MST payload allocator and ALLOCATE_PAYLOAD.
>  			 */
>  			pbn.full =3D remote_tu * mst_state->pbn_div.full;
>=20=20
> @@ -397,7 +398,21 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *=
intel_dp,
>=20=20
>  			slots =3D drm_dp_atomic_find_time_slots(state, &intel_dp->mst.mgr,
>  							      connector->mst.port,
> -							      dfixed_trunc(pbn));
> +							      raw_pbn);
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
>=20=20
>  			/* TODO: Check this already in drm_dp_atomic_find_time_slots(). */
>  			if (slots > mst_state->total_avail_slots)

--=20
Jani Nikula, Intel
