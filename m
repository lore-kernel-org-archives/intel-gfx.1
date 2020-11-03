Return-Path: <SRS0=aXtb=EJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39D9C2D0A3
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Nov 2020 22:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 461F1223C6
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Nov 2020 22:37:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ozDKFJN1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 461F1223C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4B16E908;
	Tue,  3 Nov 2020 22:37:14 +0000 (UTC)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0521C6E8FB;
 Tue,  3 Nov 2020 22:37:12 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CQl5c0h9Vz9sRR;
 Wed,  4 Nov 2020 09:37:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1604443030;
 bh=zyuBzGI6wd0PS9+p1C1lIj6ckJI72B+AqhdrSNRcwpA=;
 h=Date:From:To:Cc:Subject:From;
 b=ozDKFJN1mTL1fwO4NdsFwOryGA3H0WvMGj/xFdpmt2YJvDT0AhIc4lMUQp3Of/hHk
 Cn9xbWQ6+I05ZtY4G2Z1wJTORazPTIMYcltqaSAwgxfhoV60zsi9bCHg+lFsdAOHbv
 tfSrVm83CqA4fU8DB3BQIzP2PXWMUSrMmHD6uJKDyJZuNMd7eSP1HYMKatnCIQKbHG
 gVSVkrMKc6iuWzvFr2wNmaiA4Z6yx/wRY0z4D/X3MUOSuSm0WaK6jxDaypt+DSdlq+
 kGrbSjs69e4bsi8+1O0XZeAD9DlJMVjraQRCNzhCf1GRWmanIKQhW6k6yVqEORJXRC
 zXXRVO9//6Wlw==
Date: Wed, 4 Nov 2020 09:37:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Message-ID: <20201104093705.10b43959@canb.auug.org.au>
MIME-Version: 1.0
Subject: [Intel-gfx] linux-next: build failure after merge of the
 drm-intel-fixes tree
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: multipart/mixed; boundary="===============1180360213=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============1180360213==
Content-Type: multipart/signed; boundary="Sig_/=+PXjQnJcRmD.Zl2Rk8QD2e";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=+PXjQnJcRmD.Zl2Rk8QD2e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/i915/gt/intel_lrc.c: In function 'gen12_emit_fini_breadcrum=
b':
drivers/gpu/drm/i915/gt/intel_lrc.c:4998:31: error: implicit declaration of=
 function '__gen8_emit_flush_dw'; did you mean 'gen8_emit_flush'? [-Werror=
=3Dimplicit-function-declaration]
 4998 |  cs =3D emit_xcs_breadcrumb(rq, __gen8_emit_flush_dw(cs, 0, 0, 0));
      |                               ^~~~~~~~~~~~~~~~~~~~
      |                               gen8_emit_flush
drivers/gpu/drm/i915/gt/intel_lrc.c:4998:31: warning: passing argument 2 of=
 'emit_xcs_breadcrumb' makes pointer from integer without a cast [-Wint-con=
version]
 4998 |  cs =3D emit_xcs_breadcrumb(rq, __gen8_emit_flush_dw(cs, 0, 0, 0));
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               |
      |                               int
drivers/gpu/drm/i915/gt/intel_lrc.c:4902:63: note: expected 'u32 *' {aka 'u=
nsigned int *'} but argument is of type 'int'
 4902 | static u32 *emit_xcs_breadcrumb(struct i915_request *rq, u32 *cs)
      |                                                          ~~~~~^~

Caused by commit

  c94d65d2ff6d ("drm/i915/gt: Flush xcs before tgl breadcrumbs")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/=+PXjQnJcRmD.Zl2Rk8QD2e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+h25IACgkQAVBC80lX
0GyMsQf/RCsRAOQ9A52R3h4SZS+xYkKoVQ74aszg/PgkSwiVUhV3meyofFhs6+Fb
M+UAp98QtfxQsO+k71ocWvvqHG+LUO4/24VEXWjuONrqo3nSpjMsao71UKyeHXC+
LkS35BJ3vtz3iArTQWUSdGiZc5fj23M7rsaaL3K0e8tX+u60aRwbOu2+2zYxGqm8
5LF8RPgEQK1PjydCcIEgxKeoMTqvdwZLtAzLG9vBR9QQcGOmiA+eeO03siBhbHrZ
xkBt2fofMjaX/ZvvaSFrzXfI/2N12zNLjQG3EF1UM+ypF/zlMXKQT6ori0ndnxhA
TY5tSXzsg/45QirLrJHoGHQb104aFg==
=7CiJ
-----END PGP SIGNATURE-----

--Sig_/=+PXjQnJcRmD.Zl2Rk8QD2e--

--===============1180360213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1180360213==--
