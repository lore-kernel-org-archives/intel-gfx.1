Return-Path: <SRS0=u2GV=OE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D5BC433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 08:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 504EA6103B
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 08:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 504EA6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BEF6E438;
	Tue, 14 Sep 2021 08:35:58 +0000 (UTC)
X-Greylist: delayed 366 seconds by postgrey-1.36 at gabe;
 Tue, 14 Sep 2021 08:35:57 UTC
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598C16E437
 for <intel-gfx@lists.freedesktop.org>; Tue, 14 Sep 2021 08:35:57 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 571AE3200973;
 Tue, 14 Sep 2021 04:29:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 14 Sep 2021 04:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=R446ykKm4hYk+KQbYAm4UOZlHE0
 QxxiwrNEFW40rYYU=; b=dXuLzYtldob5E+xqOKneWq/Ew5iLf7ESDnBOnDLvzlK
 Or6nuJjlipbf8/MKea3aooZMgNGe2Wy17keX+Sd/B4rE+b/aOGcp89MJLuj8W9qb
 Z91M2VhvU2pOOlCH2h1O7DC8GunVKkNFrCav/8rJZpSStOsv2Eqy5qGozc4yjFcs
 E8dowFHf9JZJ9HTA6A4ibgZfgfLBr7uvdkejqK1HgGCN5PhXUNQTftyN6Ol6p0Cz
 dn88piv1k4Qd/l211RMbwN4JVCcfWIQqbyWuQpULf6wqCfVMyJDgeiFonkjkx/eL
 8PpI0LTTlyhYhLdWko1nhr/JEIl2N1eFG9CPKCy9/SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=R446yk
 Km4hYk+KQbYAm4UOZlHE0QxxiwrNEFW40rYYU=; b=u11vVXpwEpEN+5t+wbQ22+
 m1CCvbeM1nKD5B/dEWyvh6bgGHNRPbu0JHqv6iRYSn4S1k/lpKkf3EnL5VrN5Gfu
 NJF8jMm+IACuhC0XzEjgNOFO3eAO1Jwg9aD73D8ET7xZt3BKGy/WrmqfXH03DCH5
 iMwnzmkr/cXTBqPa7aEut0tZVVXKu1M4odIKstjQ3lyWkCdywCL0mecKv4o7NsaJ
 0MflvxZTFf/MGeLBVHo0USHk2G4FRrhJjCeT+cw/Gw/Ed8LlYyYsvD7xlQcAgCKL
 3p1PvGI8HxhMZ9ErQ7BeRDsO/QsNC5PAkL8blUU1N/XkJI0wBk2rJeYwAAlPaz9w
 ==
X-ME-Sender: <xms:fV1AYeaGxIHG46Pvfb3z6tuXHxk44YJtaz3me-nJ7sGrtXyZwhh3Lw>
 <xme:fV1AYRYw3ummNYXGb4nVeRGYfXa7mfUgOGINxW2QgVey-3w7SSXrjwmadG9s4sKNU
 _Mscy4EZstCr3d-V4g>
X-ME-Received: <xmr:fV1AYY-VdpIjbvI4kHF5xjiA96iKPdqoLJTvvm-d1qMqdZaq5Gn82ib8dcmXuoVRsyE2sx-Wid23PrGZZtXXmLPA-_xoBMjmclLe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeduvdfhkeekhfdtgeeihfeluddtvedthfektdelfeejgfeludfhteduveej
 hefhnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:fV1AYQqUkw0UnpeI2fRcTJYhbtw6U_a1MJUCVYXbVWyelNgjCEB8hQ>
 <xmx:fV1AYZrIUsDhq-s18Ik_asefMY_zjjn06lvFea_KZbZkFnQrF-ArhQ>
 <xmx:fV1AYeRhWD5x_n3TjosfsODnxa-PAeZdaowiNW8_y_2S4z9UZwXwgQ>
 <xmx:fV1AYak_gTkX1jn6jZ-Lw8haEU5tAkHX3uVZAdiI6PH71PhnNcueWg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 04:29:48 -0400 (EDT)
Date: Tue, 14 Sep 2021 10:29:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com
Message-ID: <20210914082946.jhgj7rk7awkkisv2@gilmour>
References: <cover.1630419362.git.jani.nikula@intel.com>
 <87tuio2zn4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yz34dxbs2awj3423"
Content-Disposition: inline
In-Reply-To: <87tuio2zn4.fsf@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 0/6] drm/displayid: VESA vendor block and
 drm/i915 MSO use of it
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


--yz34dxbs2awj3423
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 13, 2021 at 07:45:03PM +0300, Jani Nikula wrote:
> On Tue, 31 Aug 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> > v2 of https://patchwork.freedesktop.org/series/94161/ with the VESA OUI
> > check and an OUI helper patch added.
>=20
> Maarten, Maxime, Thomas - may I have an ack for merging this via
> drm-intel? I think at this time we can get the merge to drm-next and
> backmerge to drm-misc fairly quickly, and a topic branch would be
> overkill.

Yep, that works for me

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--yz34dxbs2awj3423
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUBdegAKCRDj7w1vZxhR
xRwLAP4jJscnSG6duUo3VJxyzQNG4XAE1in1LTbdyJb+f77uqgD/bedUoXZDj06z
03Ku9cGHj5cR3A4RyxWL/ZAxtV0JQwE=
=8I0A
-----END PGP SIGNATURE-----

--yz34dxbs2awj3423--
