Return-Path: <SRS0=MV7T=MT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A719EC432BE
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Jul 2021 12:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C30F61A38
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Jul 2021 12:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C30F61A38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09176E88A;
	Tue, 27 Jul 2021 12:01:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5506E57E;
 Tue, 27 Jul 2021 12:01:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7116661A38;
 Tue, 27 Jul 2021 12:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627387292;
 bh=H6GBvjIm6gs/iLbLE96kn/VqKHUusHV0IfYP8LTdKuc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=anIocG4OWAwzmllx6ZRPVFzCiFPqZzRXWMI8tjJGgbGhWa1ObkMmscUx6T1ORakn8
 cQRKCsQ032g5Iw7F/t3V9TuBudHnysG4NPSNkG80hA0/rVy8scMpMofQIz8Gy/+/Ua
 O54CC2fWELD3+m2hETwm2vGztpZXlHMmnFgkP8CROD9PkXrvCXCKY+7jNgiB2y/li/
 4iPxXXADcVdBDq+1NANnmkO+Vj+ur/AUKXgaINkjp2Qf6juZG6aYlh4QgM87qx5v37
 Sz0OJDgOSNYPpXnm4mby2Sbl+MO2iYMhXa1rdvu71mGh0/FfxzFYr7D7RbrXzkEm3R
 ZxVaSpt4epHUg==
Date: Tue, 27 Jul 2021 13:01:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <20210727120122.GR4670@sirena.org.uk>
References: <20210727111448.1443-1-broonie@kernel.org>
 <CAKMK7uFNFOTrcLbFW3eoziPaZaH9JFKJe1AVvJGT6wU_rqfUeA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFNFOTrcLbFW3eoziPaZaH9JFKJe1AVvJGT6wU_rqfUeA@mail.gmail.com>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] linux-next: manual merge of the drm-misc tree with
 the drm-next tree
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Zack Rusin <zackr@vmware.com>
Content-Type: multipart/mixed; boundary="===============0605606328=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


--===============0605606328==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RpDyejMaDGJhP2PU"
Content-Disposition: inline


--RpDyejMaDGJhP2PU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2021 at 01:41:30PM +0200, Daniel Vetter wrote:
> On Tue, Jul 27, 2021 at 1:15 PM Mark Brown <broonie@kernel.org> wrote:

> > Today's linux-next merge of the drm-misc tree got a conflict in:

> >   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h

> > between commit:

> >   ebc9ac7c3dfe ("drm/vmwgfx: Update device headers")

> > from the drm-next tree and commit:

> >   be4f77ac6884 ("drm/vmwgfx: Cleanup fifo mmio handling")

> > from the drm-misc tree.

> I got confused for a bit how we managed a conflict here because vmwgfx
> flows drm-misc.git -> drm.git -> linus. The 2nd patch is in
> drm-misc-fixes, which makes sense, not in drm-misc-next like I assumed
> at first drm-misc means.

I probably misidentified the tree when I was reporting things TBH -
there's so many DRM trees and they're constantly generating conflicts
that I sometimes rush through it a bit, especially for the simpler ones
like this.

--RpDyejMaDGJhP2PU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD/9ZEACgkQJNaLcl1U
h9By1Af+JO44Ehk6vlvcgLV8W9uQiouHcojGdJQaD4MHuFGlDy46R3h/TuTDrb0M
nj5AC8yfcJx4joEF9hVYXQEWXP9LKut4afpJjpeSy/vpFsV1xmlHkKo8AtAO8Urb
osfKHwSQwwljQ+chkXP6v2zEX3DrzoscSXgJO/F9WqPLlXnWpTR4v3FVaiiIt2ob
FLb5367epKV1dSre54YYba4BDCz0EyOL5FpL/v3RQsQ3MUfPUqFVIMPF22fVJYTS
M2m0EKEPhFPR1Gu/mYGNKPfBXygQeIwBmg6voBj9WHoHBegcZzBe2yWzWsPe5Xh5
9VBig7YPnN3wLDpIQelbXU33OSnY4w==
=L+/4
-----END PGP SIGNATURE-----

--RpDyejMaDGJhP2PU--

--===============0605606328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0605606328==--
