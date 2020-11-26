Return-Path: <SRS0=GkMm=FA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7CCC63798
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2020 15:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90AFC21D40
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2020 15:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90AFC21D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE176E98C;
	Thu, 26 Nov 2020 15:50:16 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF5C6E98C
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 15:50:15 +0000 (UTC)
IronPort-SDR: 8m29iUtHlg2OVDvT4GuT8aAW2WWH8e4hc/4wI649tu/iWa0CPzENYcrVrALEdWCUVGYeuHsToW
 SVKNiYZys7GQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="152134126"
X-IronPort-AV: E=Sophos;i="5.78,372,1599548400"; d="scan'208";a="152134126"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2020 07:50:13 -0800
IronPort-SDR: BnBTSG+uF5JgA2gwSndjWIHPdhsWZxdcUN9sS74/1IxTgJqwrdonmYtSKbP+IN+lImdUsuUucI
 zati/nRaPsDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,372,1599548400"; d="scan'208";a="365857613"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 26 Nov 2020 07:50:10 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 26 Nov 2020 17:50:10 +0200
Date: Thu, 26 Nov 2020 17:50:10 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <20201126155010.GD6112@intel.com>
References: <20201126105539.2661-1-chris@chris-wilson.co.uk>
 <20201126140841.1982-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126140841.1982-1-chris@chris-wilson.co.uk>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Program mocs:63 for cache
 eviction on gen9
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Nov 26, 2020 at 02:08:41PM +0000, Chris Wilson wrote:
> Ville noticed that the last mocs entry is used unconditionally by the HW
> when it performs cache evictions, and noted that while the value is not
> meant to be writable by the driver, we should program it to a reasonable
> value nevertheless.
> =

> As it turns out, we can change the value of mocs:63 and the value we
> were programming into it would cause hard hangs in conjunction with
> atomic operations.
> =

> v2: Add details from bspec about how it is used by HW
> =

> Suggested-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2707
> Fixes: 3bbaba0ceaa2 ("drm/i915: Added Programming of the MOCS")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: <stable@vger.kernel.org> # v4.3+
> ---
>  drivers/gpu/drm/i915/gt/intel_mocs.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/=
gt/intel_mocs.c
> index 254873e1646e..26cedde80476 100644
> --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
> @@ -131,7 +131,19 @@ static const struct drm_i915_mocs_entry skl_mocs_tab=
le[] =3D {
>  	GEN9_MOCS_ENTRIES,
>  	MOCS_ENTRY(I915_MOCS_CACHED,
>  		   LE_3_WB | LE_TC_2_LLC_ELLC | LE_LRUM(3),
> -		   L3_3_WB)
> +		   L3_3_WB),
> +
> +	/*
> +	 * mocs:63
> +	 * - used by the L3 for all its evictions.
> +	 *   Thus it is expected to allow LLC cacheability to enable coherent
> +	 *   flows to be maintained.
> +	 * - used to force L3 uncachable cycles.
> +	 *   Thus it is expected to make the surce L3 uncacheable.

"surce"?

> +	 */
> +	MOCS_ENTRY(63,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
> +		   L3_1_UC)
>  };
>  =

>  /* NOTE: the LE_TGT_CACHE is not used on Broxton */
> -- =

> 2.20.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
