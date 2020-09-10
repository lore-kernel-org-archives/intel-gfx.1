Return-Path: <SRS0=K74T=CT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF580C43461
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2020 04:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3955E20719
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2020 04:19:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="evbTMrD3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3955E20719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B791A89FCE;
	Thu, 10 Sep 2020 04:19:01 +0000 (UTC)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFDF89FCE;
 Thu, 10 Sep 2020 04:19:00 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bn5HM5Ncqz9sTd;
 Thu, 10 Sep 2020 14:18:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1599711538;
 bh=EhVZZhtTZCGxIkbgzYqVicFIUPzGTN9DxCVVPOY1Xss=;
 h=Date:From:To:Cc:Subject:From;
 b=evbTMrD34oqRHtx7o9AHio+LEMg/rNnKdizpFr2dEn4JHdhyKJtxaSjpX/uWXfroX
 jU9wefkUcSN/FZ74YN8rn0SkzBGNSzSeDxsSsC5YKO9vqghY9gQYSWQ15WXQ6NnK23
 Rk+KsUXLBHvx+OzLwGS8DDf3pjVXFJRcgKOnztZDZSiyP9vcZuRy+6RIVL03uiF3Eg
 mNmLWDLrIksfVgRydeCGU1X6K7Gpx26Ff0cockawtd5Oy5qOKf6bigR+rHOdcEPMA+
 Dokh4zzBffQYiKnRLhWZM1a8yeWdr33iPqDXO1epCGdfP7PNrQhvSEyeffyN4NKV7y
 YcdzOVLfdgJ1A==
Date: Thu, 10 Sep 2020 14:18:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chanwoo Choi <cw00.choi@samsung.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Message-ID: <20200910141854.1d4b1b10@canb.auug.org.au>
MIME-Version: 1.0
Subject: [Intel-gfx] linux-next: manual merge of the extcon tree with the
 drm-misc tree
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: multipart/mixed; boundary="===============1889793458=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============1889793458==
Content-Type: multipart/signed; boundary="Sig_/e=KaLfUS5Ij0WJmpNj.Op=0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/e=KaLfUS5Ij0WJmpNj.Op=0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the extcon tree got a conflict in:

  MAINTAINERS

between commit:

  f61249dddecc ("MAINTAINERS: Add entry for i.MX 8MQ DCSS driver")

from the drm-misc tree and commit:

  d0e3c25150dd ("MAINTAINERS: Add entry for NXP PTN5150A CC driver")

from the extcon tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 623c53ab5bd5,da94c9b12f1b..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -12496,14 -12430,13 +12496,21 @@@ F:	drivers/iio/gyro/fxas21002c_core.
  F:	drivers/iio/gyro/fxas21002c_i2c.c
  F:	drivers/iio/gyro/fxas21002c_spi.c
 =20
 +NXP i.MX 8MQ DCSS DRIVER
 +M:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
 +R:	Lucas Stach <l.stach@pengutronix.de>
 +L:	dri-devel@lists.freedesktop.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
 +F:	drivers/gpu/drm/imx/dcss/
 +
+ NXP PTN5150A CC LOGIC AND EXTCON DRIVER
+ M:	Krzysztof Kozlowski <krzk@kernel.org>
+ L:	linux-kernel@vger.kernel.org
+ S:	Maintained
+ F:	Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
+ F:	drivers/extcon/extcon-ptn5150.c
+=20
  NXP SGTL5000 DRIVER
  M:	Fabio Estevam <festevam@gmail.com>
  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)

--Sig_/e=KaLfUS5Ij0WJmpNj.Op=0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ZqS4ACgkQAVBC80lX
0GzmZQgAhm9Au7ork/yyZ3MKOW+hLWU+QSZsorx+EpWJ0cp7nYN/YDijwMydfpXk
DFf53BByT7rglwvwis8zhMwjoodlGOY6ImkMIIlOZEMZMhaLlZunhTWdeuYCuKvM
xDyjPwQbXK/QCaoYGcTUrvG58IBqOIaeIIgGYc/bgw5aU/KER4syr8XS6KYGWsrX
DQGlzedAMcfsoclBIRMjpuuSIuDHtMwVMa4Pnfz2PNcGnFZ7r5V24Pi4NY5+2zTW
tdrmfs58w3Ilq30feyn5BYae64qwV5Z2jSVJOLYvgl5OS4YP79Q4ivf3738l04eK
SEdOJSIYKI7pZkhmdJNu4fKLkxbENw==
=zfDk
-----END PGP SIGNATURE-----

--Sig_/e=KaLfUS5Ij0WJmpNj.Op=0--

--===============1889793458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1889793458==--
