Return-Path: <SRS0=CSZM=FO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8910CC433FE
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 15:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 006E22310E
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 15:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 006E22310E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363C16E95F;
	Thu, 10 Dec 2020 15:18:58 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695E96EA94
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Dec 2020 15:18:57 +0000 (UTC)
IronPort-SDR: 3I7HdzyTYVRQ2chCMbVIBnbhyYpSpxsj0CsCWqDlZrWgR+J5HNdye1hpMEU95ipMm+zI3CAut5
 priQx5GEFQRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="154080034"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="154080034"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 07:18:56 -0800
IronPort-SDR: gyyQ+HgmUBUD/XF9ILTBg/vU9vzxGidKmjosM5o4kY0jmiECe4C3tv/EbtEzel611Fpznla4L2
 /vvMV+DV20Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="438519317"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 10 Dec 2020 07:18:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Dec 2020 17:18:54 +0200
Date: Thu, 10 Dec 2020 17:18:54 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>
Message-ID: <X9I8XieR98LFRNaY@intel.com>
References: <20201210041755.29088-1-airlied@gmail.com>
 <20201210041755.29088-7-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210041755.29088-7-airlied@gmail.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH 6/9] drm/i915: refactor pll code out into
 intel_dpll_legacy.c
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

On Thu, Dec 10, 2020 at 02:17:52PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> =

> This pulls a large chunk of the pll calculation code out of
> intel_display.c to a new file.
> =

> One function makse sense to be an inline, otherwise this
> is pretty much a straight copy cover. also all the
> remaining hooks for g45 and older end up the same now.
> =

> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/i915/Makefile                 |    1 +
>  drivers/gpu/drm/i915/display/intel_display.c  | 1393 +----------------
>  drivers/gpu/drm/i915/display/intel_display.h  |   13 +-
>  .../drm/i915/display/intel_display_types.h    |    5 +
>  .../gpu/drm/i915/display/intel_dpll_legacy.c  | 1370 ++++++++++++++++
>  5 files changed, 1398 insertions(+), 1384 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_dpll_legacy.c
> =

<snip>
> +static int hsw_crtc_compute_clock(struct intel_crtc *crtc,
> +				  struct intel_crtc_state *crtc_state)
> +{
> +	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
> +	struct intel_atomic_state *state =3D
> +		to_intel_atomic_state(crtc_state->uapi.state);
> +
> +	if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DSI) ||
> +	    INTEL_GEN(dev_priv) >=3D 11) {
> +		struct intel_encoder *encoder =3D
> +			intel_get_crtc_new_encoder(state, crtc_state);
> +
> +		if (!intel_reserve_shared_dplls(state, crtc, encoder)) {
> +			drm_dbg_kms(&dev_priv->drm,
> +				    "failed to find PLL for pipe %c\n",
> +				    pipe_name(crtc->pipe));
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}

If you're moving this then the "legacy" in the fine name is just
wrong. I guess just call it intel_dpll.c if we lack a better idea?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
