Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05684C5DF66
	for <intel-gfx@archiver.kernel.org>; Mon, 17 Aug 2026 18:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA7A10E479;
	Mon, 17 Aug 2026 18:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JC/S7qPz";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B9510E479
 for <intel-gfx@lists.freedesktop.org>; Mon, 17 Aug 2026 18:55:39 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 00EA1601DE;
 Mon, 17 Aug 2026 18:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DAAC1F00A3A;
 Mon, 17 Aug 2026 18:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786992937;
 bh=OpZUhvpcdVE43zdCSnW3fLyASkzzVVldxl8lEpybcDs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JC/S7qPzYMyO+Q74fW93WqqDowtlhe8MC4rUxCfueOL/yYIsXpuDBCt640lhzyeyB
 y+fzocWjye098ni/EDncIqYQ0vslD3ZTlhCVKFHOrXb6dk82bg51MHckNRU+5Ay0xJ
 11Wzf6vbbc7oo72orVuwqz9gkbtfO/POkfb5QyIaUfuGZUqNfVvMwFy3tDHldCG/P2
 gVa63HE4y8vIql38smOnYKSksHIjjn1C4Ys06h7oFYHOSVclkSLPoBc8/zPFClS/Uf
 PRViYO6kKZ7//+5DlZI4w+ucOvMRMzBeW8eZfIxj3pWYsyTpxD+Bc79XA74uIpqL6S
 3Bw+Fez/9C3Iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/guc: Test GuC v70.49.5 for TGL, ADL-P, DG1, PVC
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260817184548.2905639-2-julia.filipchuk@intel.com>
References: <20260817184548.2905639-2-julia.filipchuk@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 18:55:36 +0000
Message-Id: <20260817185537.7DAAC1F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The patch is explicitly marked 'for testing only' and removes =
backward compatibility for standard major-version firmware binaries, causin=
g GPU initialization failures.
- [Medium] The commit message claims to test GuC v70.49.5 for PVC (Ponte Ve=
cchio), but the patch contains no firmware definitions for PVC.
--

--- Patch [1]: [PATCH] drm/i915/guc: Test GuC v70.49.5 for TGL, ADL-P, DG1,=
 PVC ---
commit d306b2937eb396389136a560d117b8f7375ddcaf
Author: Julia Filipchuk <julia.filipchuk@intel.com>

drm/i915/guc: Test GuC v70.49.5 for TGL, ADL-P, DG1, PVC

This patch updates the GuC firmware definitions to test version 70.49.5
for several Intel platforms. It replaces the major version fallback with
strict exact-version requirements for the targeted platforms.

> drm/i915/guc: Test GuC v70.49.5 for TGL, ADL-P, DG1, PVC

[Severity: Medium]
The commit message mentions testing GuC for PVC, but is there any change
for PVC in this patch?

Looking at the INTEL_GUC_FIRMWARE_DEFS macro, there are no firmware
definitions added or modified for PVC. Should PVC be removed from the
commit message, or is a hunk missing?

> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i=
915/gt/uc/intel_uc_fw.c
> index 7fac97fe30a63..7e5567410235c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -90,15 +90,11 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc=
_fw,
>  #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
>  	fw_def(METEORLAKE,   0, guc_maj(mtl,  70, 53, 0)) \
>  	fw_def(DG2,          0, guc_maj(dg2,  70, 53, 0)) \
> -	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 12, 1)) \
> -	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
> -	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
> -	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 12, 1)) \
> -	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
> -	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  69, 0, 3)) \
> -	fw_def(DG1,          0, guc_maj(dg1,  70, 5, 1)) \
> -	fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 1, 1)) \
> -	fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 1, 1)) \
> +	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 49, 5)) \

[Severity: Critical]
Does removing the guc_maj fallback here cause GPU initialization to fail
if the exact 70.49.5 patch version is missing?

Without the major version fallback, it seems the driver probe will
deterministically fail on standard linux-firmware installations that do
not have this exact minor version blob, leading to a loss of hardware
acceleration and display.

Could this regression be problematic if the file isn't available?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817184548.2905=
639-2-julia.filipchuk@intel.com?part=3D1
