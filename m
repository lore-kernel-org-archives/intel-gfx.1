Return-Path: <SRS0=sbLu=FH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DB8C64E7A
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Dec 2020 05:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5703206F9
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Dec 2020 05:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5703206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5246E06E;
	Thu,  3 Dec 2020 05:22:22 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195276EB6B;
 Thu,  3 Dec 2020 05:22:21 +0000 (UTC)
IronPort-SDR: 5ZfMJ/5AcrUhAHh5oaI/hgUpuQz9rlecB3xOtZjG2QddyEYiaskl0/f399833eeTmOswDX+V+l
 Z0YvMqlOw83g==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="152963764"
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; 
 d="asc'?scan'208";a="152963764"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 21:22:20 -0800
IronPort-SDR: 3g7sKu0uEtrb4J4Gg8+tn6WxjHoGWxMgG31PeOB6A2nxPYkD24fYRui35VppvDClg4i4hRjzMo
 XYxga6PxkwZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; 
 d="asc'?scan'208";a="538229792"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga006.fm.intel.com with ESMTP; 02 Dec 2020 21:22:18 -0800
Date: Thu, 3 Dec 2020 13:07:13 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20201203050713.GX16939@zhen-hp.sh.intel.com>
References: <20201130111353.25406-1-jani.nikula@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201130111353.25406-1-jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gvt: avoid useless use of inline
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Hang Yuan <hang.yuan@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0583632435=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


--===============0583632435==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LfQcPIWFRhGivmDw"
Content-Disposition: inline


--LfQcPIWFRhGivmDw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.11.30 13:13:53 +0200, Jani Nikula wrote:
> In most cases, we are better off letting the compiler decide whether to
> inline static functions in .c files or not. In this case, the inline
> will be ignored anyway as mmio_pm_restore_handler() is passed as a
> function pointer.
>=20
> Fixes: 5f60b12edcd0 ("drm/i915/gvt: Save/restore HW status to support GVT=
 suspend/resume")
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Hang Yuan <hang.yuan@linux.intel.com>
> Cc: Colin Xu <colin.xu@intel.com>
> Cc: Zhi Wang <zhi.a.wang@intel.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 6f0706e885cb..69e725b95bcf 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -3686,8 +3686,7 @@ void intel_gvt_restore_fence(struct intel_gvt *gvt)
>  	}
>  }
> =20
> -static inline int mmio_pm_restore_handler(struct intel_gvt *gvt,
> -					  u32 offset, void *data)
> +static int mmio_pm_restore_handler(struct intel_gvt *gvt, u32 offset, vo=
id *data)
>  {
>  	struct intel_vgpu *vgpu =3D data;
>  	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
> --=20

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Queued this. Thanks!

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--LfQcPIWFRhGivmDw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX8hyfAAKCRCxBBozTXgY
J/qJAJ9cjx57y3nvkOIt/t7HXq+hxaD4swCggGpGd/l2GdzO7C5TNFZTQEcgW48=
=Qt1w
-----END PGP SIGNATURE-----

--LfQcPIWFRhGivmDw--

--===============0583632435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0583632435==--
