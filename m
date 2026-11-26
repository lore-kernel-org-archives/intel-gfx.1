Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E06606A31E
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2026 11:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e+Qh5SsD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E92C1122D6;
	Thu, 26 Nov 2026 11:12:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB0D112215;
 Thu, 26 Nov 2026 11:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795691529; x=1827227529;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=vRzu813QubacSdgf4l3D/JHV5ZS36AAtdzuqEyhu+N0=;
 b=e+Qh5SsDCUpY6ioLF3WCk7g8RudAH1GXjOKIroyQ9ZRuALWQ4TmFx7n8
 yf84w9n51GRXGGz7ilv7HrAayEwAxlUXdmQCfr/kceAhBg7ieG//qTEAU
 BI5UR2LaeD/D6QiQsB+gC5r/gBKvd5cbYGkwiThdg7nJzw4m7Ti6gzfAO
 T5rqzLJNp7afujb2tzFRc62FeqoEeRvVVQqcyxWjjf3PXsCK5YU3g8y3v
 yCCdUxZAAvTBc+rk0acpTC7XrtxhHDX1g16FmV54a1RziRRFh32+aSNck
 5a1QB4DCoalyYMLjIXrBxzD84Q7PBjHj/qdq1kYn7RS0LaJ2Kzl+Sm+06 w==;
X-CSE-ConnectionGUID: Em2t4aF8RpGlSX7TCC/bIg==
X-CSE-MsgGUID: TVBJ1JrmQsStcA9wtMNwvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4485751"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4485751"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 03:12:09 -0800
X-CSE-ConnectionGUID: eUxjzOGsQg6HOmm+k+yytg==
X-CSE-MsgGUID: 9abU8PTwRz2LFhpkP6abDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12152046"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.171])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 03:12:08 -0800
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <179568992905.91949.6813032884760562063@9ac1b63fe3ea>
References: <20261126094444.52858-1-joonas.lahtinen@linux.intel.com>
 <179568992905.91949.6813032884760562063@9ac1b63fe3ea>
Subject: Re: =?utf-8?b?4pyX?= i915.CI.BAT: failure for drm/i915: Reject
 relocation writes to RO userptr
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
To: i915-ci-infra@lists.freedesktop.org
Date: Thu, 26 Nov 2026 13:12:04 +0200
Message-ID: <179569152467.69877.6379510162911277781@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620
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
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Quoting Patchwork (2026-11-26 12:45:29)
> Patch Details
>=20
> Series:  drm/i915: Reject relocation writes to RO userptr
> URL:     https://patchwork.freedesktop.org/series/179732/
> State:   failure
> Details: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179732v1/inde=
x.html
>=20
> CI Bug Log - changes from CI_DRM_19615 -> Patchwork_179732v1
>=20
> Summary
>=20
> FAILURE
>=20
> Serious unknown changes coming with Patchwork_179732v1 absolutely need to=
 be
> verified manually.
>=20
> If you think the reported changes have nothing to do with the changes
> introduced in Patchwork_179732v1, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in C=
I.
>=20
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179732v1/
> index.html
>=20
> Participating hosts (40 -> 39)
>=20
> Missing (1): bat-dg2-13
>=20
> Possible new issues
>=20
> Here are the unknown changes that may have been introduced in
> Patchwork_179732v1:
>=20
> IGT changes
>=20
> Possible regressions
>=20
>   =E2=80=A2 igt@i915_module_load@load:
>       =E2=96=A1 fi-kbl-8809g: PASS -> ABORT

This failure seems completely unrelated.

Regards, Joonas

>=20
> Build changes
>=20
>   =E2=80=A2 Linux: CI_DRM_19615 -> Patchwork_179732v1
>=20
> CI-20190529: 20190529
> CI_DRM_19615: 3895433515d2f602b53c660afbcd2179f0326e1e @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> Patchwork_179732v1: 3895433515d2f602b53c660afbcd2179f0326e1e @ git://
> anongit.freedesktop.org/gfx-ci/linux
>
