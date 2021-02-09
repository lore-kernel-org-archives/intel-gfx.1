Return-Path: <SRS0=0Its=HL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4A7C433DB
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Feb 2021 15:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFBE964EB4
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Feb 2021 15:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFBE964EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610E46E182;
	Tue,  9 Feb 2021 15:09:18 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C206E182
 for <intel-gfx@lists.freedesktop.org>; Tue,  9 Feb 2021 15:09:16 +0000 (UTC)
IronPort-SDR: ZE7zj+KmvkmEK5Fn3vMXV5GU++rhdVF66kDOaUXXdA/J+cLj/rO/9eLtX/GVOAiOOTdp9Us+9h
 WoRlzg0r7SMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="243387561"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; d="scan'208";a="243387561"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 07:09:15 -0800
IronPort-SDR: Qm9nM5a0oSYqpns9ubUBSAPZ6FFCgcvRvolKzqNXqVQWM7yB6yc9apqDvGauaid9SshZ+udJFo
 W+lEu4VpwBKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; d="scan'208";a="396158450"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 09 Feb 2021 07:09:13 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 09 Feb 2021 17:09:13 +0200
Date: Tue, 9 Feb 2021 17:09:13 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Message-ID: <YCKlmbQuA4DCnIom@intel.com>
References: <20210209021918.16234-1-ville.syrjala@linux.intel.com>
 <161284092971.28236.16871246953456318187@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161284092971.28236.16871246953456318187@emeril.freedesktop.org>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] 
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2Vy?=
 =?utf-8?q?ies_starting_with_=5B1/3=5D_drm/i915=3A_Disallow_plane_x+w=3Est?=
 =?utf-8?q?ride_on_ilk+_with_X-tiling?=
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
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 03:22:09AM -0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
> =

> Series: series starting with [1/3] drm/i915: Disallow plane x+w>stride on=
 ilk+ with X-tiling
> URL   : https://patchwork.freedesktop.org/series/86882/
> State : failure
> =

> =3D=3D Summary =3D=3D
> =

> CI Bug Log - changes from CI_DRM_9747 -> Patchwork_19637
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> =

> Summary
> -------
> =

>   **FAILURE**
> =

>   Serious unknown changes coming with Patchwork_19637 absolutely need to =
be
>   verified manually.
>   =

>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_19637, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in=
 CI.
> =

>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19637/=
index.html
> =

> Possible new issues
> -------------------
> =

>   Here are the unknown changes that may have been introduced in Patchwork=
_19637:
> =

> ### IGT changes ###
> =

> #### Possible regressions ####
> =

>   * igt@vgem_basic@unload:
>     - fi-kbl-soraka:      NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19637/fi-kbl-s=
oraka/igt@vgem_basic@unload.html

<3> [558.016425] i915 0000:00:02.0: [drm] *ERROR* Potential atomic update f=
ailure on pipe A

I guess we've been throwing that under these two:
https://gitlab.freedesktop.org/drm/intel/-/issues/86
https://gitlab.freedesktop.org/drm/intel/-/issues/558

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
