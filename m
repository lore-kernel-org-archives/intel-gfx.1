Return-Path: <SRS0=nd+/=JY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57DBC433B4
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Apr 2021 05:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8113261077
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Apr 2021 05:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8113261077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55B06E8F9;
	Tue, 27 Apr 2021 05:50:02 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD386E8F8;
 Tue, 27 Apr 2021 05:50:01 +0000 (UTC)
IronPort-SDR: A89Df+yZUD1b4YSiDWODWRHGFV0AU10cZ4rd2kBU56x/b5kmq1lXAWRQ0WOaSwRTtGWGvznWEh
 CqspLG1Znbhw==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="175936140"
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; 
 d="asc'?scan'208";a="175936140"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 22:50:01 -0700
IronPort-SDR: ihXkyHJiSR8f4LOJoCndr5hUGZuTzRwRDlTYkIsHfvK8lscD0thWohtZZJnBMzI8NPCoUH+zYn
 QT6YCh8F0FWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; 
 d="asc'?scan'208";a="454518755"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Apr 2021 22:49:58 -0700
Date: Tue, 27 Apr 2021 13:31:39 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20210427053139.GO1551@zhen-hp.sh.intel.com>
References: <20210426094143.4031527-1-zhenyuw@linux.intel.com>
 <20210426094143.4031527-2-zhenyuw@linux.intel.com>
 <20210426105555.3cad2599@redhat.com>
 <20210426174017.GL2047089@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20210426174017.GL2047089@ziepe.ca>
Subject: Re: [Intel-gfx] [PATCH 2/2] Revert "vfio/gvt: Make DRM_I915_GVT
 depend on VFIO_MDEV"
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
Cc: Arnd Bergmann <arnd@kernel.org>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0864560099=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


--===============0864560099==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KjcUHqqCp23GY06r"
Content-Disposition: inline


--KjcUHqqCp23GY06r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.04.26 14:40:17 -0300, Jason Gunthorpe wrote:
> On Mon, Apr 26, 2021 at 10:55:55AM -0600, Alex Williamson wrote:
> > On Mon, 26 Apr 2021 17:41:43 +0800
> > Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> >=20
> > > This reverts commit 07e543f4f9d116d6b4240644191dee6388ef4a85.
> >=20
> > 07e543f4f9d1 ("vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV")
> >=20
> > > With all mdev handing moved to kvmgt module, only kvmgt should depend
> > > on VFIO_MDEV. So revert this one.
> > >=20
> > > Cc: Arnd Bergmann <arnd@kernel.org>
> > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > Cc: Alex Williamson <alex.williamson@redhat.com>
> > > Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > >  drivers/gpu/drm/i915/Kconfig | 1 -
> > >  1 file changed, 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kcon=
fig
> > > index 8f15bfb5faac..93f4d059fc89 100644
> > > +++ b/drivers/gpu/drm/i915/Kconfig
> > > @@ -102,7 +102,6 @@ config DRM_I915_GVT
> > >  	bool "Enable Intel GVT-g graphics virtualization host support"
> > >  	depends on DRM_I915
> > >  	depends on 64BIT
> > > -	depends on VFIO_MDEV
> > >  	default n
> > >  	help
> > >  	  Choose this option if you want to enable Intel GVT-g graphics
> >=20
> > I take it that this retracts your ack from
> > https://lore.kernel.org/dri-devel/20210425032356.GH1551@zhen-hp.sh.inte=
l.com/
> > I'll drop it from consideration for pushing through my tree unless
> > indicated otherwise.  Thanks,
>=20
> In any event you'll need either Arnd's patch or this patch in your
> tree to avoid randconfig problems.
>=20
> At this point I would take Arnd's and leave this to go next merge
> window.
>=20

I'm ok with that, so won't block your vfio pull for merge window.
I'll send gvt fixes pull in next RC.

Thanks

--KjcUHqqCp23GY06r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYIehtgAKCRCxBBozTXgY
J2w3AJ4gyrDrZFIEk7uVuXg7LP2UkZfjxQCeND41lQBr2dk3T0H1qSRERauJTMU=
=004h
-----END PGP SIGNATURE-----

--KjcUHqqCp23GY06r--

--===============0864560099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0864560099==--
