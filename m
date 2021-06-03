Return-Path: <SRS0=IdPq=K5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC98C47093
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Jun 2021 02:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1389613E9
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Jun 2021 02:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1389613E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584CD6F381;
	Thu,  3 Jun 2021 02:56:03 +0000 (UTC)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0948C6F380;
 Thu,  3 Jun 2021 02:56:02 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FwVrw1BbJz9sPf;
 Thu,  3 Jun 2021 12:56:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1622688960;
 bh=kNZO8cNXHwdVHyYMhGdZ3l4ogt+C54D3rxbZU9S2DYE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jMh2YX7eMP5zdPLXK1/wyy4AXLdYFnFwI7MUXgkqGIKpJ6B/kqQfYxSwEGAKYJfjj
 +M14Ccvh8OsqLcCFWczBQCrhXslfjCfB5zAAzVCLBQ1fLjGRdr/BU97YEQAoCTHy0b
 Pqg91v8eBGG1AK40FaT81XkVehxhj0r1hX2wrT88xslzloCrdyMxS7tls0LG2UGn8c
 jNYZJSgAU12eUjwMvACpdj+FTll/qT+0FZvj21Lh8knM2SMimcybKxTDDQG256093s
 1Dn8KyD1qssYD0xXo9ycC4+agMxKfAgjMmUEmJ3j4SKwwnSbB1F79v/Nvej9fOkXUZ
 21afMIsnYX2lg==
Date: Thu, 3 Jun 2021 12:55:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Message-ID: <20210603125559.37d1dee6@canb.auug.org.au>
In-Reply-To: <20210603124847.19a6dacf@canb.auug.org.au>
References: <20210603124847.19a6dacf@canb.auug.org.au>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] linux-next: manual merge of the amdgpu tree with
 the drm-misc tree
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0291310448=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============0291310448==
Content-Type: multipart/signed; boundary="Sig_/biCzpGQcJqdY=0PNQKJAJAU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/biCzpGQcJqdY=0PNQKJAJAU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 3 Jun 2021 12:48:47 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index bcfd4a8d0288,1923f035713a..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@@ -657,11 -657,10 +658,11 @@@ void amdgpu_vm_move_to_lru_tail(struct=20
>   		if (!bo->parent)
>   			continue;
>  =20
>  -		ttm_bo_move_to_lru_tail(&bo->tbo, &bo->tbo.mem,
>  +		ttm_bo_move_to_lru_tail(&bo->tbo, bo->tbo.resource,
>   					&vm->lru_bulk_move);
> - 		if (bo->shadow)
> - 			ttm_bo_move_to_lru_tail(&bo->shadow->tbo,
> + 		if (shadow)
>  -			ttm_bo_move_to_lru_tail(&shadow->tbo, &shadow->tbo.mem,
> ++			ttm_bo_move_to_lru_tail(&shadow->tbo,
>  +						bo->shadow->tbo.resource,

that line should have been
						shadow->tbo.resource,

I have fixed it up in my resolution.

--=20
Cheers,
Stephen Rothwell

--Sig_/biCzpGQcJqdY=0PNQKJAJAU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC4RL8ACgkQAVBC80lX
0GzwXQf7Bb7whZWkGGCiLC+YJ0D2/P5gl5muwbKrN1PUW8Fku84HGBKd6fyi5HZI
+/E0B9EdHcCOpQRPQrPBSYokCGyOjDQ6k8ffauGTuyvr3wgKmWFfxYgDgadded6u
10oThEErY49Fr4VqDYlTerLY0nL4QefhwtjQ5Ain2g8v1jh8nV2cWKPzsccdPQY3
gDEN2Wenu5A7mvT3Z+SLOALhXNIh22nfVOkTY88aw29Pn3jbMq2F3Ta75P5jC3oj
hmyfDMxjiXL/yVydW/aA5ZLlbueihUsA7STFUeDpkUXZnCUBrdtxnuTP06jEF1Mi
VvXVBKsOOUACWakFNrA+2iD2pHfxBg==
=lQmq
-----END PGP SIGNATURE-----

--Sig_/biCzpGQcJqdY=0PNQKJAJAU--

--===============0291310448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0291310448==--
