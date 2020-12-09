Return-Path: <SRS0=x7Pm=FN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A2EC433FE
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Dec 2020 07:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 399BA23BA7
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Dec 2020 07:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 399BA23BA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE0C6E128;
	Wed,  9 Dec 2020 07:52:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F876E128;
 Wed,  9 Dec 2020 07:52:14 +0000 (UTC)
IronPort-SDR: x+PeLQ9xeyrB+xxL5W+S7I+SLWHOkthHpeiec957wFml3bJLBCoXS/kVVSl57y5oD3vZoNOkpB
 uqNh+JXnSszg==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="161087382"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; 
 d="asc'?scan'208";a="161087382"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 23:52:13 -0800
IronPort-SDR: 1uqYvliSGq6xaVhyp5z797fQLBmeMuZ4ZCSoWuVqLMvW2j/4Lv1tKfb8Vw7OZfkio6WFzaYTpc
 7IDFNAdJj1rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; 
 d="asc'?scan'208";a="376249313"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2020 23:52:12 -0800
Date: Wed, 9 Dec 2020 15:36:53 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20201209073653.GL16939@zhen-hp.sh.intel.com>
References: <cover.1607422863.git.jani.nikula@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1607422863.git.jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/8] drm/i915/gvt: make headers
 self-contained
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
Content-Type: multipart/mixed; boundary="===============0068090618=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


--===============0068090618==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l2C7pJE7HE4aLL3l"
Content-Disposition: inline


--l2C7pJE7HE4aLL3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.12.08 12:29:06 +0200, Jani Nikula wrote:
> For a long time now we've had a build option in i915 to ensure the
> headers in the driver are self-contained, i.e. they include and forward
> declare everything they need. Finally fix the gvt headers that aren't,
> and remove them from the exclude list.
>=20
> Please use the CONFIG_DRM_I915_WERROR=3Dy config option to ensure the
> driver remains warning free and headers stay self-contained.
>=20
> Please merge this via the gvt tree.
>=20

Thanks, Jani! Looks fine to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>=20
>=20
> Jani Nikula (8):
>   drm/i915/gvt: make execlist.h self-contained
>   drm/i915/gvt: make fb_decoder.h self-contained
>   drm/i915/gvt: make gtt.h self-contained
>   drm/i915/gvt: make interrupt.h self-contained
>   drm/i915/gvt: make mmio_context.h self-contained
>   drm/i915/gvt: make gvt.h self-contained
>   drm/i915/gvt: make scheduler.h self-contained
>   drm/i915/gvt: make mpt.h self-contained
>=20
>  drivers/gpu/drm/i915/Makefile           | 10 +---------
>  drivers/gpu/drm/i915/gvt/execlist.h     |  3 ---
>  drivers/gpu/drm/i915/gvt/fb_decoder.h   |  6 ++++--
>  drivers/gpu/drm/i915/gvt/gtt.h          | 11 ++++++++++-
>  drivers/gpu/drm/i915/gvt/gvt.h          |  4 ++++
>  drivers/gpu/drm/i915/gvt/interrupt.h    |  5 ++++-
>  drivers/gpu/drm/i915/gvt/mmio_context.h | 11 +++++++++++
>  drivers/gpu/drm/i915/gvt/mpt.h          |  2 ++
>  drivers/gpu/drm/i915/gvt/scheduler.h    |  5 +++++
>  9 files changed, 41 insertions(+), 16 deletions(-)
>=20
> --=20
> 2.20.1
>=20
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--l2C7pJE7HE4aLL3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX9B+kAAKCRCxBBozTXgY
J2pYAJ44rA4h9xu8bXNDKDZ+KDNhV2GhUACfWY/ChVpwb22IIZgGb5tHqURRMJA=
=zqZu
-----END PGP SIGNATURE-----

--l2C7pJE7HE4aLL3l--

--===============0068090618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0068090618==--
