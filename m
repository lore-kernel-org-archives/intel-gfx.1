Return-Path: <SRS0=1luh=BY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDFBC433DF
	for <intel-gfx@archiver.kernel.org>; Fri, 14 Aug 2020 13:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCB852068E
	for <intel-gfx@archiver.kernel.org>; Fri, 14 Aug 2020 13:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCB852068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD0D6EB4D;
	Fri, 14 Aug 2020 13:39:17 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EE96EB4D
 for <intel-gfx@lists.freedesktop.org>; Fri, 14 Aug 2020 13:39:16 +0000 (UTC)
IronPort-SDR: ITHldcDVGknyhD5d50O8BiwCA3X81s3lGazmRFyJmgappbZYQ6ZnPRaU2a00ZPXmX+wDTvjpAh
 Kek4+S/v/Oyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="142242600"
X-IronPort-AV: E=Sophos;i="5.76,312,1592895600"; d="scan'208";a="142242600"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 06:39:15 -0700
IronPort-SDR: Q3PcVlUNmavQZkZKKEc2L1M4S0OUHDAvq5LpDNfIqh2J65uAfS/l5+CuZnh9VXTyzZ76Ju3iIp
 NivSxpbsZm9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,312,1592895600"; d="scan'208";a="309383578"
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7])
 by orsmga002.jf.intel.com with ESMTP; 14 Aug 2020 06:39:15 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 irsmsx601.ger.corp.intel.com (163.33.146.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 14 Aug 2020 14:39:13 +0100
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Fri, 14 Aug 2020 19:09:12 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Varide, Nischal" <nischal.varide@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Thread-Topic: [Intel-gfx] [PATCH 1/8] Critical KlockWork Error - Fixes -
 intel_cdclk.c - Possible NullPointerDereference1
Thread-Index: AQHWch/Kiwck9vF+ckee5+F4EVkmfKk3m0oQ
Date: Fri, 14 Aug 2020 13:39:12 +0000
Message-ID: <26eb49d2d21e4250b548f924bf1fb35d@intel.com>
References: <20200814024950.26830-1-nischal.varide@intel.com>
In-Reply-To: <20200814024950.26830-1-nischal.varide@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 1/8] Critical KlockWork Error - Fixes -
 intel_cdclk.c - Possible NullPointerDereference1
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
Cc: "Varide, Nischal" <nischal.varide@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Nischal
> Varide
> Sent: Friday, August 14, 2020 8:20 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: Varide, Nischal <nischal.varide@intel.com>
> Subject: [Intel-gfx] [PATCH 1/8] Critical KlockWork Error - Fixes - intel_cdclk.c -
> Possible NullPointerDereference1

Add some commit description explaining the clockwork warning.

Also append all display patches (in display folder) with "drm/i915/display :"
in the commit headers. For generic path have "drm/i915:" as prefix.
Please check the format used in patches already merged to tree.

> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c
> b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index 9d6cacbdb691..1cd0ab5b36d2 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -1926,7 +1926,11 @@ intel_set_cdclk_pre_plane_update(struct
> intel_atomic_state *state)
>  		intel_atomic_get_old_cdclk_state(state);
>  	const struct intel_cdclk_state *new_cdclk_state =
>  		intel_atomic_get_new_cdclk_state(state);
> -	enum pipe pipe = new_cdclk_state->pipe;
> +	enum pipe pipe;
> +
> +	if (!(old_cdclk_state && new_cdclk_state))
> +		return
> +	(void)(pipe = new_cdclk_state->pipe);

Is this typecast really needed ?

> 
>  	if (!intel_cdclk_changed(&old_cdclk_state->actual,
>  				 &new_cdclk_state->actual))
> @@ -1955,7 +1959,13 @@ intel_set_cdclk_post_plane_update(struct
> intel_atomic_state *state)
>  		intel_atomic_get_old_cdclk_state(state);
>  	const struct intel_cdclk_state *new_cdclk_state =
>  		intel_atomic_get_new_cdclk_state(state);
> -	enum pipe pipe = new_cdclk_state->pipe;
> +	enum pipe pipe;
> +
> +	if (!(old_cdclk_state && new_cdclk_state))
> +		return
> +	(void)(pipe = new_cdclk_state->pipe);

Same here.

> +
> +
> 
>  	if (!intel_cdclk_changed(&old_cdclk_state->actual,
>  				 &new_cdclk_state->actual))
> @@ -2484,6 +2494,9 @@ int intel_modeset_calc_cdclk(struct intel_atomic_state
> *state)
> 
>  	old_cdclk_state = intel_atomic_get_old_cdclk_state(state);
> 
> +	if (!(old_cdclk_state && new_cdclk_state))
> +		return
> +
>  	new_cdclk_state->active_pipes =
>  		intel_calc_active_pipes(state, old_cdclk_state->active_pipes);
> 
> --
> 2.26.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
