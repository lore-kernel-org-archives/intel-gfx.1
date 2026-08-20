Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95674C5DF86
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2026 19:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E4410F181;
	Thu, 20 Aug 2026 19:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bHZMQ1WC";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450A210F189
 for <intel-gfx@lists.freedesktop.org>; Thu, 20 Aug 2026 19:48:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DDBD343633;
 Thu, 20 Aug 2026 19:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07721F000E9;
 Thu, 20 Aug 2026 19:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787255298;
 bh=FdnQ5P5jdIkFzY7j9p/9XdQJTxeOOFkDHdMRFTjxxRY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=bHZMQ1WCO5zdR88vUw/V4TS65cvfdfeRm9divOx03+++dWaQMEfirnIsCubO5F1za
 +T9E3w/XOu/3O8IlIarvjUHtgRsn8CAvQX7xUztVfDLc09KD8BYLw1ISh61Xe0kos+
 rM2GF8kwTK+SeBLZNL85rm0NoE0gPsGGFcNkg10Oqf06x5sDodwNJhMEU1FAOUiPL+
 D+qrw6caOn1S2CkgW4J+lrxGRypvPg7Q905jy+j9baQMN+khZmGAqk5XHg7wSAYj/9
 MjXOPXE3lR43+uBQzFbja11gvtWm4PL/d9eDBprpuRPKinl1VJ1xtzV1pmGB95zkP1
 z4m2RwPsZH6TA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/guc: Test GuC v70.74.0 for MTL, DG2
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260820193724.3048409-2-julia.filipchuk@intel.com>
References: <20260820193724.3048409-2-julia.filipchuk@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 19:48:18 +0000
Message-Id: <20260820194818.A07721F000E9@smtp.kernel.org>
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
- [High] The patch replaces the major-versioned GuC firmware definitions (`=
guc_maj`) with exact minor-patch versions (`guc_mmp`) for MTL and DG2, whic=
h removes the fallback logic and breaks GuC initialization on standard syst=
ems.
--

--- Patch [1]: [PATCH] drm/i915/guc: Test GuC v70.74.0 for MTL, DG2 ---
commit b7bd03e4f394bb57a559e10784e9ef6e098b9d4e
Author: Julia Filipchuk <julia.filipchuk@intel.com>

drm/i915/guc: Test GuC v70.74.0 for MTL, DG2

This patch updates the GuC firmware version to 70.74.0 for MTL and DG2 plat=
forms.
It replaces the major-versioned definitions with exact minor-patch version =
definitions.

> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i=
915/gt/uc/intel_uc_fw.c
> index 7fac97fe30a63..4901cb9cb4ca6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
[ ... ]
> @@ -88,8 +88,8 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_f=
w,
>   * security fixes, etc. to be enabled.
>   */
>  #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
> -	fw_def(METEORLAKE,   0, guc_maj(mtl,  70, 53, 0)) \
> -	fw_def(DG2,          0, guc_maj(dg2,  70, 53, 0)) \
> +	fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 74, 0)) \
> +	fw_def(DG2,          0, guc_mmp(dg2,  70, 74, 0)) \

[Severity: High]
In INTEL_GUC_FIRMWARE_DEFS(), does removing the guc_maj fallback entry cause
a regression by breaking GuC initialization on systems where the exact firm=
ware
version 70.74.0 is not present?

To test a new version while maintaining compatibility, should the guc_mmp
definition be added alongside (before) the guc_maj definition, rather than
replacing it?

>  	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 12, 1)) \
>  	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820193724.3048=
409-2-julia.filipchuk@intel.com?part=3D1
