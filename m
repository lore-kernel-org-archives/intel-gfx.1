Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1D5C5DF86
	for <intel-gfx@archiver.kernel.org>; Wed, 19 Aug 2026 10:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9BA10E115;
	Wed, 19 Aug 2026 10:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JyM+hxf4";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF3410E115
 for <intel-gfx@lists.freedesktop.org>; Wed, 19 Aug 2026 10:30:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F1BF7401CE;
 Wed, 19 Aug 2026 10:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A9A1F000E9;
 Wed, 19 Aug 2026 10:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787135407;
 bh=8xMoFsX9OfmHYIPY9QEu2zKWVKkyYLOBBjn7JLcA2AA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JyM+hxf4rW9LtLU9AszxMKcbwvjF0ICsjZtyxQsD3AvKVb1Ta7ant9IZn1D2+vPCt
 zhxWbzkrdFtm7MLNqB9ScbtEkWN+l9SmQ8eFiH3hBGnSe7vZkeCeBYvn1S4+i6rus9
 DdCyJ0i1hxJXme1zfUmIgb6j7BlNo8YMVAzytFVmXpKOo6NY7705eehPMgznoZBWZ9
 Q7o0RckuA4qDSMuvubo5atRJ/ofD/9rEPSmc+1I08xB9cel/BPwmTr9fXxAjI1zu8G
 olWZ2kboMuDQI50hNBDmkHExxXV8C0n+5DSnKKS+yje9sVN2oAyXzLhA2b7kiyN3JZ
 Ur3cnUbUax7kA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] PCI: Disable not supported reset methods on DG1 0x4905
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
In-Reply-To: <20260819102509.1662504-2-janusz.krzysztofik@linux.intel.com>
References: <20260819102509.1662504-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 10:30:07 +0000
Message-Id: <20260819103007.B9A9A1F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

> DRM CI consequently reports failing device reset attempts on Intel DG1
> discrete graphics adapters.  Manual reproduction attempts allowed to
> narrow down the scope of that problem to a specific revision of that
> hardware, SKU 8086:4905.  It has been confirmed that both reset methods
> claimed by the device, i.e., flr and bus, suffer from that issue.
>=20
> Since consecutively failing device resets may lead to system hangs,
> disable both useless reset methods.  A respective CI test will then be
> skipped instead of aborting whole CI jobs.
>=20
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/11814
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819102509.1662=
504-2-janusz.krzysztofik@linux.intel.com?part=3D1

