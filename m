Return-Path: <SRS0=gs28=GW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BF1C433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 19:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B80B20706
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 19:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B80B20706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9999689F2A;
	Tue, 19 Jan 2021 19:08:02 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFB989F2A
 for <intel-gfx@lists.freedesktop.org>; Tue, 19 Jan 2021 19:08:00 +0000 (UTC)
IronPort-SDR: VpKFcqUDivSyjsEzRy+RQdFoWZA9/Kgf08JxzRrTf6k8pHXi1XtmBxinoR1tSiyD9YsISyIPJK
 aTxiWuxjGqUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="166646402"
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; d="scan'208";a="166646402"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 11:07:59 -0800
IronPort-SDR: GG6agiYdZ4kN6ubyabjJTDvvEKpunpJb35FrqsnFIZ11cV/AZ6K/g54hqVxEqOHOuVfp/9M46h
 ZyvSQc7URiJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; d="scan'208";a="426580953"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 19 Jan 2021 11:07:57 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Jan 2021 21:07:56 +0200
Date: Tue, 19 Jan 2021 21:07:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>
Message-ID: <YAcuDDu56wMvNGjy@intel.com>
References: <20210113220935.4151-1-manasi.d.navare@intel.com>
 <20210113220935.4151-16-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113220935.4151-16-manasi.d.navare@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH v4 15/18] drm/i915/display: Helpers for VRR
 vblank min and max start
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Jan 13, 2021 at 02:09:32PM -0800, Manasi Navare wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> With VRR the earliest the registers can get latched are at
> flipline decision boundary, calculate that as vrr_vmin_vblank_start()
> and the latest the regsiters can get latched are vmax decision boundary
> calculate that as vrr_vmax_vblank_start()
> =

> Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_vrr.c | 36 ++++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_vrr.h |  2 ++
>  2 files changed, 38 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i=
915/display/intel_vrr.c
> index 5dc6d578760a..9a18c36e4a9a 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -45,6 +45,42 @@ intel_vrr_check_modeset(struct intel_atomic_state *sta=
te)
>  	}
>  }
>  =

> +/*
> + * Without VRR registers get latched at:
> + *  vblank_start
> + *
> + * With VRR the earliest registers can get latched is:
> + *  intel_vrr_vmin_vblank_start(), which if we want to maintain
> + *  the correct min vtotal is >=3Dvblank_start+1
> + *
> + * The latest point registers can get latched is the vmax decision bound=
ary:
> + *  intel_vrr_vmax_vblank_start()
> + *
> + * Between those two points the vblank exit starts (and hence registers =
get
> + * latched) ASAP after a push is sent.
> + *
> + * framestart_delay is programmable 0-3.
> + */
> +static int intel_vrr_vblank_exit_length(const struct intel_crtc_state *c=
rtc_state)
> +{
> +	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> +	struct drm_i915_private *i915 =3D to_i915(crtc->base.dev);
> +
> +	/* TODO: Not sure why the hw imposes the extra scanline?, also check on=
 TGL */

We can now drop the TGL TODO(s) since I tested it and confirmed it
follows the same rules.

> +	return crtc_state->vrr.pipeline_full + i915->framestart_delay + 2;
> +}
> +
> +int intel_vrr_vmin_vblank_start(const struct intel_crtc_state *crtc_stat=
e)
> +{
> +	/* Min vblank actually determined by flipline that is always >=3Dvmin+1=
 */
> +	return crtc_state->vrr.vmin + 1 - intel_vrr_vblank_exit_length(crtc_sta=
te);
> +}
> +
> +int intel_vrr_vmax_vblank_start(const struct intel_crtc_state *crtc_stat=
e)
> +{
> +	return crtc_state->vrr.vmax - intel_vrr_vblank_exit_length(crtc_state);
> +}
> +
>  void
>  intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>  			 struct drm_connector_state *conn_state)
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i=
915/display/intel_vrr.h
> index 7610051edad2..d8b6b45557ca 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.h
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.h
> @@ -27,5 +27,7 @@ void intel_vrr_send_push(const struct intel_crtc_state =
*crtc_state);
>  void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state);
>  void intel_vrr_get_config(struct intel_crtc *crtc,
>  			  struct intel_crtc_state *crtc_state);
> +int intel_vrr_vmax_vblank_start(const struct intel_crtc_state *crtc_stat=
e);
> +int intel_vrr_vmin_vblank_start(const struct intel_crtc_state *crtc_stat=
e);
>  =

>  #endif /* __INTEL_VRR_H__ */
> -- =

> 2.19.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
