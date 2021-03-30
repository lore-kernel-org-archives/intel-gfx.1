Return-Path: <SRS0=tdmG=I4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F652C433C1
	for <intel-gfx@archiver.kernel.org>; Tue, 30 Mar 2021 04:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61E8A61580
	for <intel-gfx@archiver.kernel.org>; Tue, 30 Mar 2021 04:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61E8A61580
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B713F6E4BA;
	Tue, 30 Mar 2021 04:56:37 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE6D6E4BA;
 Tue, 30 Mar 2021 04:56:36 +0000 (UTC)
IronPort-SDR: rDkMGH+6n2cba0h5MJFiDYxcnmHVDyDFpgMwFVsIsiTvGVRl4deB7tnu4bmb8L7JYPP6Gms5Bx
 h+NStcnEsvRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="191157581"
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; 
 d="asc'?scan'208";a="191157581"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 21:56:35 -0700
IronPort-SDR: HZV/xAl6XU0XPfGFxxdOx0C4VltCnZVcNJYDLjmG5azusyYID8Cr+TmQoUDF/1I7Je0Wplsti7
 LzrIG0SLBjLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; 
 d="asc'?scan'208";a="438167110"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 29 Mar 2021 21:56:33 -0700
Date: Tue, 30 Mar 2021 12:39:18 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Message-ID: <20210330043918.GF1551@zhen-hp.sh.intel.com>
References: <0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
 <15-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
 <20210323192630.GM17735@lst.de>
 <20210323193936.GN2356281@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210323193936.GN2356281@nvidia.com>
Subject: Re: [Intel-gfx] [PATCH 15/18] vfio/gvt: Make DRM_I915_GVT depend on
 VFIO_MDEV
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tarun Gupta <targupta@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: multipart/mixed; boundary="===============0908711408=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


--===============0908711408==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t5C3/nrmPumNj5sH"
Content-Disposition: inline


--t5C3/nrmPumNj5sH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.03.23 16:39:36 -0300, Jason Gunthorpe wrote:
> On Tue, Mar 23, 2021 at 08:26:30PM +0100, Christoph Hellwig wrote:
> > On Tue, Mar 23, 2021 at 02:55:32PM -0300, Jason Gunthorpe wrote:
> > > Ideally all of this would be moved to kvmgt.c, but it is entangled wi=
th
> > > the rest of the "generic" code in an odd way. Thus put in a kconfig
> > > dependency so we don't get randconfig failures when the next patch cr=
eates
> > > a link time dependency related to the use of MDEV_TYPE.
> >=20
> > Ideally that weird struct intel_gvt_mpt would go away entirely.  But
> > that is clearly out of scope for this patchset..
>=20
> Yes.. Maybe someone from Intel will take that on, along with that
> other note you had. Compared to all the others this driver is quite
> twisty!
>=20

It was there for other hypervisor support, although XenGT support was
never upstream, but there's also some third-party hypervisor using GVT
device model.

For vGPU type, it planned to be used for XenGT as well, but it turned
out not to be true, yeah, I agree that should be in kvmgt.c and mdev only.
Thanks to point out this. Until to clean up this, I may pick this one first.

Thanks

--t5C3/nrmPumNj5sH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYGKrcQAKCRCxBBozTXgY
J8zDAJ0Xy9PLJHspqp50RvI2/Vh4KD7eIQCfR1Zm6VKxdAZTrBsIgGUJ3lyADUI=
=piPA
-----END PGP SIGNATURE-----

--t5C3/nrmPumNj5sH--

--===============0908711408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0908711408==--
