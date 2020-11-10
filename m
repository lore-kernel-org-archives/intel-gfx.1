Return-Path: <SRS0=/3Pa=EQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE15C388F7
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2020 06:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B390206C0
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2020 06:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B390206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFE189831;
	Tue, 10 Nov 2020 06:15:43 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F8489831;
 Tue, 10 Nov 2020 06:15:42 +0000 (UTC)
IronPort-SDR: ZfEPyasXWXq74g2DdK5hCrINN26oRcGqlnEIRaJvLthwTZuoKiDhHETmjK73aoJ0LecZQCZuSN
 YwGBZTCmrc2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="254631954"
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
 d="asc'?scan'208";a="254631954"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 22:15:42 -0800
IronPort-SDR: Fm1oj+ZCE6ZKYnhmLZh2yn42bWDF/Gu6Zh+9yOuWB/WsqyQPGsfR1aPq0bDi+t9wtrHPdy/uQE
 Qpmd6tR/JnXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
 d="asc'?scan'208";a="529658274"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga006.fm.intel.com with ESMTP; 09 Nov 2020 22:15:41 -0800
Date: Tue, 10 Nov 2020 14:01:27 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Message-ID: <20201110060127.GJ1239@zhen-hp.sh.intel.com>
References: <20201027045406.159566-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201027045406.159566-1-colin.xu@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Subject: Re: [Intel-gfx] [PATCH v7 2/2] drm/i915/gvt: Add GVT resume routine
 to i915
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1361073465=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


--===============1361073465==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UnaWdueM1EBWVRzC"
Content-Disposition: inline


--UnaWdueM1EBWVRzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.10.27 12:54:06 +0800, Colin Xu wrote:
> This patch add gvt resume wrapper into i915_drm_resume().
> GVT relies on i915 so resume gvt at last.
>=20
> V2:
> - Direct call into gvt suspend/resume wrapper in intel_gvt.h/intel_gvt.c.
> The wrapper and implementation will check and call gvt routine. (zhenyu)
>=20
> V3:
> Refresh.
>=20
> V4:
> Rebase.
>=20
> V5:
> Fail intel_gvt_suspend() if fail to save GGTT.
>=20
> V6:
> Save host entry to per-vGPU gtt.ggtt_mm on each host_entry update so
> only need the resume routine.
>=20
> V7:
> Refresh.
>=20
> Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_drv.c | 2 ++
>  1 file changed, 2 insertions(+)

Patch title is a bit incorrect as this is to change in drm/i915: ...
other than that

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Although this is to change i915 file, I think it's easy enough to be merged
through gvt tree, let me know if there's any concern.

Thanks

>=20
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_=
drv.c
> index d3237b0d821d..2c15c9440f8a 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -1270,6 +1270,8 @@ static int i915_drm_resume(struct drm_device *dev)
> =20
>  	intel_power_domains_enable(dev_priv);
> =20
> +	intel_gvt_resume(dev_priv);
> +
>  	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> =20
>  	return 0;
> --=20
> 2.29.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--UnaWdueM1EBWVRzC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX6ostwAKCRCxBBozTXgY
J1wjAJ9eSM3pQEpdRBB5UUjZSitkJ51UmgCdFGokHhgeSN3MNFWMmwwGLcBrutQ=
=51uX
-----END PGP SIGNATURE-----

--UnaWdueM1EBWVRzC--

--===============1361073465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1361073465==--
