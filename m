Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA9AE9D40D
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Feb 2026 16:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1266910E6D9;
	Wed,  4 Feb 2026 16:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvpcqFfY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C54110E6D9
 for <intel-gfx@lists.freedesktop.org>; Wed,  4 Feb 2026 16:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770223844; x=1801759844;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=C9d87Ugo5UDFWJIBGJvABvbgRJBGqFPb+ZvlK7aUnbQ=;
 b=lvpcqFfYI5dlf2iSQmkAfoX4CS30pH8vlDhI6NM4TLBzJeHOpi6Zy0zu
 4jz+Fg102GsNmtvRZMc9+E3+QXPBzAZOppSnj4HQd1gC3iyO2OpjcgIcX
 fuCDqhrpJ2Tejr0yP4mjOLZgXgvlt0YV8EcjzBpXTrQUpxBZi2BR0bSNi
 okrLEHj7Q/f+IyZcsRtlCFE5UZg+JdaMjuuNmeIOLouE1FfahflP9jzoa
 gls1sIfp1ghrbCLE5m9kXA8LfVpo/6etP18FSo96hnLiAFMlUBQ2Vhzhl
 Z1AqtqZO4RGozD4k1PONQmbhKKs/E7LEd/+YStn42k/JLYlTcVkNsTudq Q==;
X-CSE-ConnectionGUID: LOGyE+I4Sue36nY3+zCTdw==
X-CSE-MsgGUID: yNAxfBWSQ0yw0rkdpnKnWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70433854"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="70433854"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:50:44 -0800
X-CSE-ConnectionGUID: 1gkeupn0Qce4LUJki7c5hg==
X-CSE-MsgGUID: LSPYW8FCSlGdy8RYyaweAw==
X-ExtLoop1: 1
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:50:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com
Subject: Re: [PATCH] drm/i915/gvt: Swap read and write checks
In-Reply-To: <20260204161945.8127-2-jonathan.cavitt@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260204161945.8127-2-jonathan.cavitt@intel.com>
Date: Wed, 04 Feb 2026 18:50:39 +0200
Message-ID: <4563cd825cf6f28fea6b0c9470c8859462332281@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 04 Feb 2026, Jonathan Cavitt <jonathan.cavitt@intel.com> wrote:
> The function intel_gvt_i2c_handle_aux_ch_write currently does not
> support the DP_AUX_I2C_WRITE operation.  Notably, we check if
> op & 0x1 == DP_AUX_I2C_WRITE (one), and if it does not, assert that
> op & 0x1 == DP_AUX_I2C_READ (zero).  This is unnecessary because if
> op & 0x1 != 1, then op & 0x1 == 0.  But beyond that, it probably makes
> more sense to check for the condition that is implemented, rather than
> check for the condition that is not.
>
> Swap the conditions.  We can also get rid of the unnecessary drm_WARN_ON
> while we're here.
>
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/edid.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/edid.c b/drivers/gpu/drm/i915/gvt/edid.c
> index 021afff1cd5d..ca5b54466a65 100644
> --- a/drivers/gpu/drm/i915/gvt/edid.c
> +++ b/drivers/gpu/drm/i915/gvt/edid.c
> @@ -535,16 +535,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_vgpu *vgpu,
>  					i2c_edid->edid_available = true;
>  			}
>  		}
> -	} else if ((op & 0x1) == DP_AUX_I2C_WRITE) {
> -		/* TODO
> -		 * We only support EDID reading from I2C_over_AUX. And
> -		 * we do not expect the index mode to be used. Right now
> -		 * the WRITE operation is ignored. It is good enough to
> -		 * support the gfx driver to do EDID access.
> -		 */
> -	} else {
> -		if (drm_WARN_ON(&i915->drm, (op & 0x1) != DP_AUX_I2C_READ))
> -			return;
> +	} else if ((op & 0x1) == DP_AUX_I2C_READ) {
>  		if (drm_WARN_ON(&i915->drm, msg_length != 4))
>  			return;
>  		if (i2c_edid->edid_available && i2c_edid->target_selected) {
> @@ -553,6 +544,13 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_vgpu *vgpu,
>  			aux_data_for_write = (val << 16);
>  		} else
>  			aux_data_for_write = (0xff << 16);
> +	} else {
> +		/* TODO
> +		 * We only support EDID reading from I2C_over_AUX. And
> +		 * we do not expect the index mode to be used. Right now
> +		 * the WRITE operation is ignored. It is good enough to
> +		 * support the gfx driver to do EDID access.
> +		 */
>  	}
>  	/* write the return value in AUX_CH_DATA reg which includes:
>  	 * ACK of I2C_WRITE

-- 
Jani Nikula, Intel
