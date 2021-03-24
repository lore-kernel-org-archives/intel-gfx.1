Return-Path: <SRS0=sv0W=IW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C31C433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Mar 2021 13:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB9F561A0D
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Mar 2021 13:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB9F561A0D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3893D6E9FE;
	Wed, 24 Mar 2021 13:31:26 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFCA6E9FE
 for <intel-gfx@lists.freedesktop.org>; Wed, 24 Mar 2021 13:31:24 +0000 (UTC)
IronPort-SDR: pXNNogGFrgt8KxlJ/rBB0728VorAua2izk6gk7IOXwcrh92Nh2DBkl5jndIDIArplfcbDeXanx
 lCjdvYTBPjFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="187393481"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="187393481"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 06:31:23 -0700
IronPort-SDR: OnCQ2JyRpvJUXmXUlcL2I+27sLx4zDOuYh5spaNXCRICgdRBih0C01MuVqyxtLJ3ag0VpYxMdI
 a80jSkEluftg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="442226859"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 24 Mar 2021 06:31:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 24 Mar 2021 15:31:20 +0200
Date: Wed, 24 Mar 2021 15:31:20 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <YFs/KA78gK3eGEu1@intel.com>
References: <YFrozlRheXy9ziyK@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFrozlRheXy9ziyK@mwanda>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [bug report] drm/i915: Fix enabled_planes bitmask
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

On Wed, Mar 24, 2021 at 10:22:54AM +0300, Dan Carpenter wrote:
> Hello Ville Syrj=E4l=E4,
> =

> This is a semi-automatic email about new static checker warnings.
> =

> The patch 97bc7ffa1b1e: "drm/i915: Fix enabled_planes bitmask" from
> Mar 5, 2021, leads to the following Smatch complaint:
> =

>     drivers/gpu/drm/i915/display/intel_atomic_plane.c:332 intel_plane_ato=
mic_check_with_state()
>     error: we previously assumed 'fb' could be null (see line 324)
> =

> drivers/gpu/drm/i915/display/intel_atomic_plane.c
>    323	=

>    324		if (fb)
>                     ^^
> The patch adds a check for NULL
> =

>    325			new_crtc_state->enabled_planes |=3D BIT(plane->id);
>    326	=

>    327		/* FIXME pre-g4x don't work like this */
>    328		if (new_plane_state->uapi.visible)
>    329			new_crtc_state->active_planes |=3D BIT(plane->id);
>    330	=

>    331		if (new_plane_state->uapi.visible &&
>    332		    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
>                                                         ^^^^^^^^^^^^^^^^^=
^^^^^^^
> Unchecked deref
> =

>    333			new_crtc_state->nv12_planes |=3D BIT(plane->id);
>    334	=

>    335          if (new_plane_state->uapi.visible &&
>    336              fb->format->format =3D=3D DRM_FORMAT_C8)
>                     ^^^^^^^^^^
> Same.  These are potentially false positives.  I don't know if
> "uapi.visible" can be true when ctrc is non-NULL and fb is NULL for
> example?  (The point is I read the commit message, but I know pants all
> about DRM.  :P)

If there's no fb then uapi.visible=3Dfalse. See
intel_atomic_plane_check_clipping().

> =

>    337                  new_crtc_state->c8_planes |=3D BIT(plane->id);
>    338  =

>    339          if (new_plane_state->uapi.visible || old_plane_state->uap=
i.visible)
>    340                  new_crtc_state->update_planes |=3D BIT(plane->id);
>    341  =

>    342          new_crtc_state->data_rate[plane->id] =3D
>    343                  intel_plane_data_rate(new_crtc_state, new_plane_s=
tate);
>    344  =

>    345          return intel_plane_atomic_calc_changes(old_crtc_state, ne=
w_crtc_state,
>    346                                                 old_plane_state, n=
ew_plane_state);
>    347  }
> =

> regards,
> dan carpenter

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
