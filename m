Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05272C5478C
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Feb 2024 17:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1E110E505;
	Wed, 28 Feb 2024 17:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kBGKA6FY";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6304B10E505
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Feb 2024 17:23:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D51C9618E6;
 Wed, 28 Feb 2024 17:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E67C433C7;
 Wed, 28 Feb 2024 17:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709140984;
 bh=tMjIhEv+h3b2Ps+WQU7FV8OtoGXlbPLUgVjp/OLsuF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kBGKA6FYaVSm3RnV9qMC9BLabmJ4All978c9MTGrsnDB+XCxY5qF3KHEiakEJIbWQ
 Lwoz+w2xF82MxKbZf+upqEXxoVEm892h6YOTZUZqhLbzP/5mjw6QVVXGvPcqY1koIr
 cZQuR7b+Nlhg9Mcf+nYf/Jt8mIZFopetxxtNTfYMbcjYBQwBu6V7tAHF7mOIUMEhch
 A/S9XccJQOQsI9dBoqvMo49QQAOiTgDNTl/+qnOjDYqvPywp7W0TKQW+8JcvlUyDF8
 zTYBHeDOMigUmry4U7c+lhnHDRVyZtOfF5R9Ec+vR2zqWcsPYNACufStwjFfRmTnhF
 xFry5VCluJIRg==
Date: Wed, 28 Feb 2024 17:22:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH v3 4/5] ASoC: codecs: hda: Cleanup error messages
Message-ID: <af0c782d-8625-46f7-a347-2d21df3f6ac0@sirena.org.uk>
References: <20240226124432.1203798-1-cezary.rojewski@intel.com>
 <20240226124432.1203798-5-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5d8EE8aWTInID7GB"
Content-Disposition: inline
In-Reply-To: <20240226124432.1203798-5-cezary.rojewski@intel.com>
X-Cookie: Function reject.
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


--5d8EE8aWTInID7GB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 26, 2024 at 01:44:31PM +0100, Cezary Rojewski wrote:
> Be cohesive and use same pattern in each error message.

Acked-by: Mark Brown <broonie@kernel.org>

--5d8EE8aWTInID7GB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXfa/IACgkQJNaLcl1U
h9B3RQf/UdU0M9FMYbw47kPs/ZdpM9qN/4dwPDRM5n4ZnxN33cVWytfI7w60ysye
ziXIITDE6a7V/A587Q/TV5NO8Ie1z09zImkQ74gdR4DdbuFmMT39wQyXPRJJsUab
qrvH10h7bJ1hBz52wBw/mNeLV5/hydr5Qh5cmlR5BLc7VxXPHC2ebBPJQsqBENce
/Jr1A8+pRLg2ObR0px7sX7g5oAMorzTn/GCLYsKx3rUFxiXBHXAZjO0MPM7coK1x
HzteTCuC3mfZ8IwYgbyS5MyjCHn/oVGgruDzffetPVK2+JLdb5l4tTwcarowYx1U
xLPD46/pS22hTsY3n2jlct4koCrlIQ==
=WiEM
-----END PGP SIGNATURE-----

--5d8EE8aWTInID7GB--
