Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644E5C79F9E
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 09:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E239B10E2E9;
	Mon,  7 Sep 2026 09:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GLq9oGo2";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CBE10E70C
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 09:05:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8AD1260052;
 Mon,  7 Sep 2026 09:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16AC91F00A3A;
 Mon,  7 Sep 2026 09:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788771958;
 bh=1niFZ7sfKu23PqwyF1sk7aIHJKq4K77Kd4eY0QCPIV0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=GLq9oGo24yhSp9+FMGCLeSP3eW3w5trDBP7nLUKLaASgiziJFfxR6JaZF9lHcIOHI
 k8dI4Dg+WaVQwHpmRsEf2M9S+RLKP4kNSjMS50inVldeji7uI1Sn7nqvx5kP8rW7jV
 JhGMJ2KYd3tQxJMtE5Smy9/CGVJ8+Lo0XdYn7/+fLpi8HHXxhkjI1rrJ7xcidLrtFC
 hnuzUxqt056o/r5ukDthSt+cwIKxz3Dq4a2WxOoorKudUvJ/rdZRQkLeDHPVPvTfTa
 XlSxWMZtSd7GZTnaFDyzGHL08UvNdyFOw6ikdbfT8VEo6bGpxV2FlxZ7z2xrFT06wU
 NEWxUJYykQ1tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] PCI: Disable not supported reset methods on DG1 0x4905
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: linux-pci@vger.kernel.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260907090249.1348552-2-janusz.krzysztofik@linux.intel.com>
References: <20260907090249.1348552-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 09:05:57 +0000
Message-Id: <20260907090558.16AC91F00A3A@smtp.kernel.org>
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

> DRM CI consistently reports failing device reset attempts on Intel DG1
> discrete graphics adapters.  Manual reproduction attempts allowed to
> narrow down the scope of that problem to a specific revision of that
> hardware, SKU 8086:4905.  It has been confirmed that both reset methods
> claimed by the device, i.e., flr and bus, suffer from that issue.
>=20
> Since consecutively failing device resets may lead to system hangs,
> disable both useless reset methods.  A respective CI test will then be
> skipped instead of aborting whole CI jobs.
>=20
> Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/11814
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907090249.1348=
552-2-janusz.krzysztofik@linux.intel.com?part=3D1

