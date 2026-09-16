Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7E2C88E7F
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2026 17:35:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CA810E1CF;
	Wed, 16 Sep 2026 17:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d60ITa/2";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23F110E1CF
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Sep 2026 17:35:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 344E4601FD;
 Wed, 16 Sep 2026 17:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB471F000FF;
 Wed, 16 Sep 2026 17:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789580126;
 bh=+L6mV5mxkZmZP2ACsFYtFeDDASZtojfrldeGQZwA2xw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=d60ITa/2hT4hqWJdPjaLJRVJql7zWKCU67pDX8ufwLJNPRDpNrMo3hhnZJc9v7eaD
 6ZY3RPHzknn6js7rHUDqDD789cgG19wPMYgmkRJfnEBjHQoQh9w8ZvZddUY0Qmx2cI
 p7jXigtp4jmsKy7h6WJ/DWIzeQEfw7Wr2q5jp9X5q6R1hJp34FX3qxzaV/7WGmWkRv
 QQ1n85Fys5jOxvY+ni5HIKdJTwosc1hReTGymKxhejZRRXs9XJ4Di1DW2cBHUtJv63
 Ad1VxL8pb9CtBCGAkmNKW3oeKyIbSraLSaGF4kdBVLE8tulkj+RwuwiDMBp79+kOg+
 9BOfr0sunTBhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/i915/gsc: Validate the CPD entry offset
 before manifest read
To: "Jesus Narvaez" <jesus.narvaez@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260916172615.681135-4-jesus.narvaez@intel.com>
References: <20260916172615.681135-3-jesus.narvaez@intel.com>
 <20260916172615.681135-4-jesus.narvaez@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 17:35:26 +0000
Message-Id: <20260916173526.BFB471F000FF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] drm/i915: contradictory values in GSC manifest bounds check error l=
og
--

commit 65566b07d00691d3c9ac58902a755662f6ba6177
Author: Jesus Narvaez <jesus.narvaez@intel.com>

drm/i915/gsc: Validate the CPD entry offset before manifest read

This commit adds bounds checking for the CPD manifest offset before reading
the GSC manifest to prevent out-of-bounds dereferencing. It also validates
the CPD header length and casts the boot1 partition offset and size to
prevent integer overflows.

> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/=
i915/gt/uc/intel_gsc_fw.c
> index d550eb6edfb8e..ab6c19d4125f6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c

[ ... ]

> @@ -205,7 +214,15 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw =
*gsc_fw, const void *data, s
>  	cpd_entry =3D (void *)cpd_header + cpd_header->header_length;
>  	for (i =3D 0; i < cpd_header->num_of_entries; i++, cpd_entry++) {
>  		if (strcmp(cpd_entry->name, "RBEP.man") =3D=3D 0) {
> -			manifest =3D (void *)cpd_header + cpd_entry_offset(cpd_entry);
> +			u32 man_off =3D cpd_entry_offset(cpd_entry);
> +
> +			if ((man_off + sizeof(struct intel_gsc_manifest_header)) >
> +			    (layout->boot1.size - cpd_offset)) {
> +				gt_err(gt, "GSC FW boot section too small for manifest: %u < %zu\n",
> +				       layout->boot1.size, man_off + sizeof(*manifest));

[Severity: Low]
Are the variables passed to gt_err accurately mapping to the bounding
condition that just failed?

The bounding condition checks if man_off + sizeof(struct
intel_gsc_manifest_header) > layout->boot1.size - cpd_offset.
However, the error log prints layout->boot1.size and man_off +
sizeof(*manifest), omitting cpd_offset from the calculation.

Could this lead to misleading and mathematically contradictory values in the
error log?

> +				return -ENODATA;
> +			}
> +			manifest =3D (void *)cpd_header + man_off;
>  			intel_uc_fw_version_from_gsc_manifest(&gsc->release,
>  							      manifest);
>  			gsc->security_version =3D manifest->security_version;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916172615.6811=
35-3-jesus.narvaez@intel.com?part=3D2
