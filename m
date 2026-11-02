Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BAD606A324
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2026 22:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q4a7CMnp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107B010F27B;
	Mon,  2 Nov 2026 22:22:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C4010E707
 for <intel-gfx@lists.freedesktop.org>; Mon,  2 Nov 2026 22:22:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E2FB443861;
 Mon,  2 Nov 2026 22:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0FC1F00A17;
 Mon,  2 Nov 2026 22:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793658136;
 bh=1shZ26L/gVBgoa0nbsaFgl3amwPzZcO5PjOr4c/29zA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Q4a7CMnpTCXMLTKOiglOWlOpL+zfKqm1S3pfk92ysGxwvrkBUK4IHz0/u5O8pgb5X
 IRVlKtOCzBwM4TFILL4xWLCJa0rpUSIzSfHMZqm39dUrrSDL6YdRcJ7nTKGlOE7vHe
 iU2M0CU8QwY/OGvQ2cpNcHb2zVKsvswZ3x8aUSp8co8q/B8hY+S1kzGVMIeQ9kNjlI
 BdjVvK1iYpsJdz4/KsG9u3tjOsNUtB21RDYkqYTbOCyPqqJbq4Y8q3n82B2Yz9g8OA
 mgOFnHbDl0nEc4cJFS0VipHLiUWzXicaWAWT5AYziPv2aNAUQugj1UCRTD6Cg+pMnS
 lvYwudQm1xAiA==
Message-ID: <sashiko-outbox-194275@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/guc: Test GuC v70.83.0 for DG2, MTL
To: "Julia Filipchuk" <julia.filipchuk@intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <20261102221518.546010-2-julia.filipchuk@intel.com>
References: <20261102221518.546010-2-julia.filipchuk@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 22:22:16 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/i915/guc: guc_mmp() replacement breaks major-versioned firmwar=
e on MTL/DG2
--

commit 8a0f11765b445043e0614bba8e7df77aba661014
Author: Julia Filipchuk <julia.filipchuk@intel.com>

drm/i915/guc: Test GuC v70.83.0 for DG2, MTL

This commit updates the Meteor Lake and DG2 GuC firmware definitions in
intel_uc_fw.c from v70.53.0 using guc_maj() to v70.83.0 using guc_mmp() for
testing.

> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i=
915/gt/uc/intel_uc_fw.c
> index d7c731fe972bf..c89a1b97108c0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -89,8 +89,8 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_f=
w,
>   * security fixes, etc. to be enabled.
>   */
>  #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
> -	fw_def(METEORLAKE,   0, guc_maj(mtl,  70, 53, 0)) \
> -	fw_def(DG2,          0, guc_maj(dg2,  70, 53, 0)) \
> +	fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 83, 0)) \
> +	fw_def(DG2,          0, guc_mmp(dg2,  70, 83, 0)) \

[Severity: High]
Does replacing guc_maj() with guc_mmp() here break GuC firmware loading on
Meteor Lake and DG2 systems that have standard linux-firmware installed?

With guc_mmp(), blobs_guc[] and the module firmware table only list
i915/mtl_guc_70.83.0.bin and i915/dg2_guc_70.83.0.bin, removing the
major-versioned i915/mtl_guc_70.bin and i915/dg2_guc_70.bin entries with no
fallback.

When intel_uc_fw_fetch() calls try_firmware_load() and those three-part
versioned test files are absent, the fallback loop in intel_uc_fw_fetch()
calls __uc_fw_auto_select():

drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:intel_uc_fw_fetch() {
	...
	while (err =3D=3D -ENOENT) {
		old_ver =3D true;

		__uc_fw_auto_select(i915, uc_fw);
		if (!uc_fw->file_selected.path) {
			...
}

Because no other blobs_guc[] entry exists for Meteor Lake or DG2,
__uc_fw_auto_select() leaves file_selected.path unset and firmware fetch
fails. Since GuC submission is enabled by default on both platforms,
__uc_init_hw() then aborts hardware initialization:

drivers/gpu/drm/i915/gt/uc/intel_uc.c:__uc_init_hw() {
	...
	if (!intel_uc_fw_is_loadable(&guc->fw)) {
		ret =3D __uc_check_hw(uc) ||
		      intel_uc_fw_is_overridden(&guc->fw) ||
		      intel_uc_wants_guc_submission(uc) ?
		      intel_uc_fw_status_to_error(guc->fw.status) : 0;
		goto err_out;
	}
	...
}

Should these entries remain guc_maj(mtl, 70, 83, 0) and
guc_maj(dg2, 70, 83, 0) (or retain the guc_maj() entries as fallbacks)
before this is merged beyond testing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102221518.5460=
10-2-julia.filipchuk@intel.com?part=3D1
