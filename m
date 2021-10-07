Return-Path: <SRS0=q0LQ=O3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394AEC433EF
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Oct 2021 07:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CED5F610FB
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Oct 2021 07:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CED5F610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582776F390;
	Thu,  7 Oct 2021 07:14:10 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923446F390
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 Oct 2021 07:14:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="289685049"
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="289685049"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 00:14:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="439420479"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 07 Oct 2021 00:14:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Oct 2021 10:14:05 +0300
Date: Thu, 7 Oct 2021 10:14:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Anshuman Gupta <anshuman.gupta@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Juston Li <juston.li@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Message-ID: <YV6ePVRuzr3wljyl@intel.com>
References: <20211006235704.28894-1-ville.syrjala@linux.intel.com>
 <20211006235704.28894-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211006235704.28894-5-ville.syrjala@linux.intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Rename
 intel_load_plane_csc_black()
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

On Thu, Oct 07, 2021 at 02:57:04AM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> intel_load_plane_csc_black() is specific to glk+ so deserves
> a name reflecting that fact.

After testing on real hw it seems to be icl+ actually
(thank you bspec filter for letting me down).
I'll tweak the name when I apply this.

> Also rename the variables to
> standard form so I won't get confused reading the code.
> 
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Juston Li <juston.li@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  .../drm/i915/display/skl_universal_plane.c    | 35 +++++++++----------
>  1 file changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 1e85ea98231f..709ab7166d88 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -1011,29 +1011,28 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
>  	}
>  }
>  
> -static void intel_load_plane_csc_black(struct intel_plane *intel_plane)
> +static void glk_plane_csc_load_black(struct intel_plane *plane)
>  {
> -	struct drm_i915_private *dev_priv = to_i915(intel_plane->base.dev);
> -	enum pipe pipe = intel_plane->pipe;
> -	enum plane_id plane = intel_plane->id;
> -	u16 postoff = 0;
> +	struct drm_i915_private *i915 = to_i915(plane->base.dev);
> +	enum plane_id plane_id = plane->id;
> +	enum pipe pipe = plane->pipe;
>  
> -	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 0), 0);
> -	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 1), 0);
> +	intel_de_write_fw(i915, PLANE_CSC_COEFF(pipe, plane_id, 0), 0);
> +	intel_de_write_fw(i915, PLANE_CSC_COEFF(pipe, plane_id, 1), 0);
>  
> -	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 2), 0);
> -	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 3), 0);
> +	intel_de_write_fw(i915, PLANE_CSC_COEFF(pipe, plane_id, 2), 0);
> +	intel_de_write_fw(i915, PLANE_CSC_COEFF(pipe, plane_id, 3), 0);
>  
> -	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 4), 0);
> -	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 5), 0);
> +	intel_de_write_fw(i915, PLANE_CSC_COEFF(pipe, plane_id, 4), 0);
> +	intel_de_write_fw(i915, PLANE_CSC_COEFF(pipe, plane_id, 5), 0);
>  
> -	intel_de_write_fw(dev_priv, PLANE_CSC_PREOFF(pipe, plane, 0), 0);
> -	intel_de_write_fw(dev_priv, PLANE_CSC_PREOFF(pipe, plane, 1), 0);
> -	intel_de_write_fw(dev_priv, PLANE_CSC_PREOFF(pipe, plane, 2), 0);
> +	intel_de_write_fw(i915, PLANE_CSC_PREOFF(pipe, plane_id, 0), 0);
> +	intel_de_write_fw(i915, PLANE_CSC_PREOFF(pipe, plane_id, 1), 0);
> +	intel_de_write_fw(i915, PLANE_CSC_PREOFF(pipe, plane_id, 2), 0);
>  
> -	intel_de_write_fw(dev_priv, PLANE_CSC_POSTOFF(pipe, plane, 0), postoff);
> -	intel_de_write_fw(dev_priv, PLANE_CSC_POSTOFF(pipe, plane, 1), postoff);
> -	intel_de_write_fw(dev_priv, PLANE_CSC_POSTOFF(pipe, plane, 2), postoff);
> +	intel_de_write_fw(i915, PLANE_CSC_POSTOFF(pipe, plane_id, 0), 0);
> +	intel_de_write_fw(i915, PLANE_CSC_POSTOFF(pipe, plane_id, 1), 0);
> +	intel_de_write_fw(i915, PLANE_CSC_POSTOFF(pipe, plane_id, 2), 0);
>  }
>  
>  static void
> @@ -1102,7 +1101,7 @@ skl_program_plane(struct intel_plane *plane,
>  	 * or after the commit, display content will be garbage.
>  	 */
>  	if (plane_state->force_black)
> -		intel_load_plane_csc_black(plane);
> +		glk_plane_csc_load_black(plane);
>  
>  	intel_de_write_fw(dev_priv, PLANE_STRIDE(pipe, plane_id), stride);
>  	intel_de_write_fw(dev_priv, PLANE_POS(pipe, plane_id),
> -- 
> 2.32.0

-- 
Ville Syrjälä
Intel
