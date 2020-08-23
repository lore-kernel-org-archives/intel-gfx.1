Return-Path: <SRS0=xQ/R=CB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F05EC433E1
	for <intel-gfx@archiver.kernel.org>; Sun, 23 Aug 2020 10:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E31032074D
	for <intel-gfx@archiver.kernel.org>; Sun, 23 Aug 2020 10:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E31032074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FFA6E48C;
	Sun, 23 Aug 2020 10:45:04 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADC36E48C
 for <intel-gfx@lists.freedesktop.org>; Sun, 23 Aug 2020 10:45:02 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id A4BEA1C0BBB; Sun, 23 Aug 2020 12:44:59 +0200 (CEST)
Date: Sun, 23 Aug 2020 12:44:59 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Joerg Roedel <joro@8bytes.org>
Message-ID: <20200823104459.untmn33r46wqxi66@duo.ucw.cz>
References: <20200821123746.16904-1-joro@8bytes.org>
MIME-Version: 1.0
In-Reply-To: <20200821123746.16904-1-joro@8bytes.org>
User-Agent: NeoMutt/20180716
Subject: Re: [Intel-gfx] [PATCH v2] mm: Track page table modifications in
 __apply_to_page_range()
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
Cc: Joerg Roedel <jroedel@suse.de>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 David Vrabel <david.vrabel@citrix.com>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============0781891860=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


--===============0781891860==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ab2tecr4xsmyxrrm"
Content-Disposition: inline


--ab2tecr4xsmyxrrm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The __apply_to_page_range() function is also used to change and/or
> allocate page-table pages in the vmalloc area of the address space.
> Make sure these changes get synchronized to other page-tables in the
> system by calling arch_sync_kernel_mappings() when necessary.
>=20
> Tested-by: Chris Wilson <chris@chris-wilson.co.uk> #x86-32
> Cc: <stable@vger.kernel.org> # v5.8+
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

This seems to solve screen blinking problems on Thinkpad X60. (It
already survived few unison runs, which would usually kill it.).

Tested-by: Pavel Machek <pavel@ucw.cz>

Thanks and best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ab2tecr4xsmyxrrm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX0JIqwAKCRAw5/Bqldv6
8kjIAJoD97mGm2SLYscxJlq2IzZ34vE4vQCcDwXVYWTvZgJt0mtfFG77d0syZ0o=
=f1aM
-----END PGP SIGNATURE-----

--ab2tecr4xsmyxrrm--

--===============0781891860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0781891860==--
