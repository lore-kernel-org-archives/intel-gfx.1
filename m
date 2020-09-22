Return-Path: <SRS0=0qc7=C7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267A0C4363D
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2020 16:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA9A4235FC
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2020 16:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA9A4235FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEA588ECC;
	Tue, 22 Sep 2020 16:54:25 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F8888ECC
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Sep 2020 16:54:23 +0000 (UTC)
IronPort-SDR: d/ua0nOII7IkIq+MDnAwtAruu60Lni+nWarDcnG3uKZWfY3RZWK3R0zanRYBCJDLXAqTrXQdG2
 JfbQgXOi0H0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="159945051"
X-IronPort-AV: E=Sophos;i="5.77,291,1596524400"; d="scan'208";a="159945051"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 09:54:23 -0700
IronPort-SDR: GOqVquhZamguccgr+xvqri/wG/OFqWQ88aK9us1Jy8//bfSZHL6I64fcfCWW7MFKX6AiWx5JM5
 ZvLf3CKmMdsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,291,1596524400"; d="scan'208";a="412712646"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 22 Sep 2020 09:54:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 22 Sep 2020 19:54:20 +0300
Date: Tue, 22 Sep 2020 19:54:20 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Message-ID: <20200922165420.GU6112@intel.com>
References: <20200922125106.30540-1-imre.deak@intel.com>
 <20200922125106.30540-5-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200922125106.30540-5-imre.deak@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [PATCH 4/7] drm/i915: Factor out a helper to
 disable the DPCD training pattern
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

On Tue, Sep 22, 2020 at 03:51:03PM +0300, Imre Deak wrote:
> To prepare for a follow-up LTTPR change factor out a helper to disable
> the training pattern in DPCD. We'll need to do this for each LTTPR
> (without programming the port to output the idle pattern) when training
> in LTTPR non-transparent mode.
> =

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  .../drm/i915/display/intel_dp_link_training.c | 28 +++++++++++--------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/driv=
ers/gpu/drm/i915/display/intel_dp_link_training.c
> index 0c3809891bd2..6994a32244dc 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -102,30 +102,34 @@ void intel_dp_get_adjust_train(struct intel_dp *int=
el_dp,
>  		intel_dp->train_set[lane] =3D v | p;
>  }
>  =

> +static bool intel_dp_disable_dpcd_training_pattern(struct intel_dp *inte=
l_dp)
> +{
> +	u8 val =3D DP_TRAINING_PATTERN_DISABLE;
> +
> +	return drm_dp_dpcd_write(&intel_dp->aux, DP_TRAINING_PATTERN_SET, &val,=
 1) =3D=3D 1;
> +}


> +
>  static bool
>  intel_dp_set_link_train(struct intel_dp *intel_dp,
>  			u8 dp_train_pat)
>  {
>  	u8 buf[sizeof(intel_dp->train_set) + 1];
> -	int ret, len;
> +	int len;
>  =

>  	intel_dp_program_link_training_pattern(intel_dp, dp_train_pat);
>  =

> -	buf[0] =3D dp_train_pat;
>  	if ((dp_train_pat & ~DP_LINK_SCRAMBLING_DISABLE) =3D=3D
> -	    DP_TRAINING_PATTERN_DISABLE) {
> +	    DP_TRAINING_PATTERN_DISABLE)
>  		/* don't write DP_TRAINING_LANEx_SET on disable */

As mentioned in the other patch I think we're doing things in the wrong
order here. I suspect it'll be cleaner to just stop doing
intel_dp_set_link_train(DISABLE) entirely and just have a dedicated
function for disabling link training. We can then trivially do a
followup to swap the order of operations to match the spec.

> -		len =3D 1;
> -	} else {
> -		/* DP_TRAINING_LANEx_SET follow DP_TRAINING_PATTERN_SET */
> -		memcpy(buf + 1, intel_dp->train_set, intel_dp->lane_count);
> -		len =3D intel_dp->lane_count + 1;
> -	}
> +		return intel_dp_disable_dpcd_training_pattern(intel_dp);
>  =

> -	ret =3D drm_dp_dpcd_write(&intel_dp->aux, DP_TRAINING_PATTERN_SET,
> -				buf, len);
> +	buf[0] =3D dp_train_pat;
> +	/* DP_TRAINING_LANEx_SET follow DP_TRAINING_PATTERN_SET */
> +	memcpy(buf + 1, intel_dp->train_set, intel_dp->lane_count);
> +	len =3D intel_dp->lane_count + 1;
>  =

> -	return ret =3D=3D len;
> +	return drm_dp_dpcd_write(&intel_dp->aux, DP_TRAINING_PATTERN_SET,
> +				 buf, len) =3D=3D len;
>  }
>  =

>  static bool
> -- =

> 2.17.1
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
