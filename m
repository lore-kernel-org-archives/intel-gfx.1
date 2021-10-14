Return-Path: <SRS0=d1l9=PC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6466DC433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Oct 2021 11:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF6EE61029
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Oct 2021 11:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF6EE61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282FA6EC6C;
	Thu, 14 Oct 2021 11:00:58 +0000 (UTC)
X-Greylist: delayed 438 seconds by postgrey-1.36 at gabe;
 Thu, 14 Oct 2021 11:00:56 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833326EC6C
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Oct 2021 11:00:56 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 90A861C0B79; Thu, 14 Oct 2021 12:53:34 +0200 (CEST)
Date: Thu, 14 Oct 2021 12:53:34 +0200
From: Pavel Machek <pavel@ucw.cz>
To: kernel list <linux-kernel@vger.kernel.org>, vitaly.lubart@intel.com,
 tomas.winkler@intel.com, daniele.ceraolospurio@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, intel-gfx@lists.freedesktop.org
Message-ID: <20211014105334.GA19786@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: [Intel-gfx] intel_mei_pxp: needs better help text
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


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


CONFIG_INTEL_MEI_PXP:

MEI Support for PXP Services on Intel platforms.

Enables the ME FW services required for PXP support through
I915 display driver of Intel.


That's ... very useless help text. According to
https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DIntel-PXP-Protected=
-Xe-Path
this is some kind of DRM. Help text should probably say it has to do
with i915 video, and explain the acronyms, and probably its usecases.



--=20
http://www.livejournal.com/~pavelmachek

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYWgMLgAKCRAw5/Bqldv6
8vXQAKCaZIbr9BzntFKSnAJ7J3QFZsMjMwCfXZUJ0s9UEqQacjevS3ERxAo+/e0=
=Otrh
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
