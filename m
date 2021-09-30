Return-Path: <SRS0=5W5W=OU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B1FC433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 30 Sep 2021 07:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FF07615E0
	for <intel-gfx@archiver.kernel.org>; Thu, 30 Sep 2021 07:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FF07615E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDCF6E32A;
	Thu, 30 Sep 2021 07:59:00 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35F96E32A
 for <intel-gfx@lists.freedesktop.org>; Thu, 30 Sep 2021 07:58:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="247665119"
X-IronPort-AV: E=Sophos;i="5.85,335,1624345200"; d="scan'208";a="247665119"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 00:58:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,335,1624345200"; d="scan'208";a="479767223"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 30 Sep 2021 00:58:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 30 Sep 2021 10:58:55 +0300
Date: Thu, 30 Sep 2021 10:58:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Message-ID: <YVVuP6apeGdcivPh@intel.com>
References: <20210930001409.254817-1-jose.souza@intel.com>
 <20210930001409.254817-9-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210930001409.254817-9-jose.souza@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH v2 9/9] drm/i915/display: Always wait vblank
 counter to increment when commit needs a modeset
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

On Wed, Sep 29, 2021 at 05:14:09PM -0700, José Roberto de Souza wrote:
> Not waiting for vblank counter to increment could potentialy cause
> issues as commits after the one that needs a modeset could change
> state of entities that are not committed into hardware yet.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 9e9db1b0a907b..9c49b6031cb5e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -10494,15 +10494,24 @@ static int intel_atomic_commit(struct drm_device *dev,
>  	 * FIXME doing watermarks and fb cleanup from a vblank worker
>  	 * (assuming we had any) would solve these problems.
>  	 */
> -	if (DISPLAY_VER(dev_priv) < 9 && state->base.legacy_cursor_update) {
> +	if (state->base.legacy_cursor_update) {
>  		struct intel_crtc_state *new_crtc_state;
>  		struct intel_crtc *crtc;
>  		int i;
>  
> -		for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
> -			if (new_crtc_state->wm.need_postvbl_update ||
> -			    new_crtc_state->update_wm_post)
> +		for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
> +			if (intel_crtc_needs_modeset(new_crtc_state)) {
> +				state->base.legacy_cursor_update = false;
> +				break;
> +			}

This combination should be impossible to get. Are you seeing this
happening in some case?

> +
> +			if (DISPLAY_VER(dev_priv) < 9 &&
> +			    (new_crtc_state->wm.need_postvbl_update ||
> +			     new_crtc_state->update_wm_post)) {
>  				state->base.legacy_cursor_update = false;
> +				break;
> +			}
> +		}
>  	}
>  
>  	ret = intel_atomic_prepare_commit(state);
> -- 
> 2.33.0

-- 
Ville Syrjälä
Intel
