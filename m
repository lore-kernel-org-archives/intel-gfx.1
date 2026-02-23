Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6C3EC1120
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Feb 2026 18:57:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF95210E417;
	Mon, 23 Feb 2026 18:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R8OiI/QZ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C3210E41F;
 Mon, 23 Feb 2026 18:57:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5AD2043A82;
 Mon, 23 Feb 2026 18:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2576C116D0;
 Mon, 23 Feb 2026 18:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771873024;
 bh=ECcGiIiCVNtZtgp0LEUz9oiHptzMbElK0MmzTEMxbAc=;
 h=Date:From:To:Cc:Subject:From;
 b=R8OiI/QZZfB5JmzWcoAY2Sp5UCPGPb7O2wqp1ZfkwMhH+sufBh+CNrQKND05OOSxw
 YKICW4UCkCnntuclK3G7Cz1xJdCu4EhrVn0/qoRS4/uV030jp09A1eCdRnn7uOZgOD
 QqBA+LPdl6Y9dqJRzgHJdYgUzkjOoOE01PYAex72pcfrm2uQ6sExuWGfmkYU4zWq0C
 stE3P6K3/hnL69OxVLActQBeGzImKd5hgr2i7QrJhfO8Onu7KJOU6NYH87C2yGBrun
 Tv8vF/pB6MVBS2pefCupJK8ZMTJ+k7sk6kYou7e36et7UPDLAlb7MITQpXJo6RGQfs
 ak0TK8ZPM+Ybg==
Date: Mon, 23 Feb 2026 18:56:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <aZyi-yCFoilK6C7u@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QvFcYzBgespsEbHF"
Content-Disposition: inline
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


--QvFcYzBgespsEbHF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/gpu/drm/i915/selftests/i915_active.c: In function 'active_flush':
/tmp/next/build/drivers/gpu/drm/i915/selftests/i915_active.c:326:28: error: 'struct dma_fence' has no member named 'lock'
  326 |         spin_lock_irq(fence->lock);
      |                            ^~
/tmp/next/build/drivers/gpu/drm/i915/selftests/i915_active.c:328:30: error: 'struct dma_fence' has no member named 'lock'
  328 |         spin_unlock_irq(fence->lock); /* serialise with fence->cb_list */
      |                              ^~


Caused by commit

  1f32f310a13c9 (dma-buf: inline spinlock for fence protection v5)

I have used the tree from 20260220 instead.

--QvFcYzBgespsEbHF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcovoACgkQJNaLcl1U
h9DMoQf/VkFzDPVDU8H4TnBntftCMC2NQkSWcTpAkLvre3bHEDTEa/Ou+eeA45Xy
jb5OgRszEGfOQIKSkUl+7mmNTo8qPstFnDaM8tokkqyFDGNv4azqKNJ3Kp4DOKgi
jbqfwlTzHgmHTCS03Z6MsLc+vUPGHvyyjO/nPYFAHR140/Tn3LllFMhE8fAslq4J
SS6gGsozM7YcOiHpKFZNaRDTgYP853lDQjYZ1D5dtFw/Mb/E1vcemB3jATL67mri
2uGZCvEdFkMF6e8C3DOlImI2m8sBjMoz6R3jEMN0woroP0EY5KgjIb9uAxlFuEl4
2hlUDOOK0wPz5bDNriUjnoD2ivbsvA==
=+Uu7
-----END PGP SIGNATURE-----

--QvFcYzBgespsEbHF--
