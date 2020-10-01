Return-Path: <SRS0=YfZL=DI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B50DC4727C
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2020 10:39:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2468820796
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2020 10:39:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cu1vuSZA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2468820796
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B40E6E167;
	Thu,  1 Oct 2020 10:39:26 +0000 (UTC)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEC789C86;
 Thu,  1 Oct 2020 10:39:25 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C28kY697yz9sSf;
 Thu,  1 Oct 2020 20:39:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1601548763;
 bh=JmbLezRzmSGuU5WK2PvyAyFQp3GhmDoCVA9yDQLx69k=;
 h=Date:From:To:Cc:Subject:From;
 b=cu1vuSZAb/gRpe7X9+frUCo2ClK8MEKqUCRsiSozM0M4XYBoN4aeP5rNLmuhI4jnS
 cgd64ioHd+aMKd30oJZ3uyoMPD5IJQKEwSXLRzCVFRdkslkG5fkWpyMRvjdFnA8Yu0
 khDFod5sZ3ZIIxPtnxSbALsmM2PqhvpZihkasJah0+zK489/w5cmEVzza7dRtKEcXG
 w88yM2nisN/KfsFfH8Xm0fbTZiSkq+hDESIzRUA7iqW3GzswdOQhNAqlPudZc+GvEs
 kq6CbBhUyjLSFllpwL1PIxX1a8KN6vbcTf1Ejpc9f7GGN6t1dnJXNSlOsv2IRhuwPK
 QJ1rZIoaFMqRg==
Date: Thu, 1 Oct 2020 20:39:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Message-ID: <20201001203917.43d46a3d@canb.auug.org.au>
MIME-Version: 1.0
Subject: [Intel-gfx] linux-next: manual merge of the akpm tree with the
 drm-intel tree
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: multipart/mixed; boundary="===============1947369385=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============1947369385==
Content-Type: multipart/signed; boundary="Sig_/DdEb5MkgX7Rcxn6kn4rpov4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DdEb5MkgX7Rcxn6kn4rpov4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  drivers/gpu/drm/i915/gem/i915_gem_pages.c

between commit:

  4caf017ee937 ("drm/i915/gem: Avoid implicit vmap for highmem on x86-32")
  ba2ebf605d5f ("drm/i915/gem: Prevent using pgprot_writecombine() if PAT i=
s not supported")

from the drm-intel tree and patch:

  "drm/i915: use vmap in i915_gem_object_map"

from the akpm tree.

I fixed it up (I just dropped the changes in the former commits) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/DdEb5MkgX7Rcxn6kn4rpov4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl91sdUACgkQAVBC80lX
0GwY1Af+L5GL9WkeOKfbPmrMAMlWlaXHGD4rkH3IsH8AhCc0xfM78DvlXnJK4Fqq
DlLWngMCn/ubtPzJRPwSTSLUL1ZwGOapud/G1Tf0teSiunQ0Wc3NzIZt7E82Aw3i
jCSols7sNh7PvJ4spsowtMrpGNVpBhJMTBaK+BQpXZi8RFCcbqcC5ZaDWdyA5y9W
eUnZE947oIwiyofvpvzJg7b9GAqSstmMz9U86iM0UEtBTGOjLF0W6tvEgnNPEUIL
zRJzdQTWrsrKFvCNpdO5ONRyqtj6h+xY9V8QHRMLYaVKYMdAssCC77fPpzTnxEoP
TWl+u+jgBsx90uEoH2zzbr5eMANPjw==
=7wpk
-----END PGP SIGNATURE-----

--Sig_/DdEb5MkgX7Rcxn6kn4rpov4--

--===============1947369385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1947369385==--
