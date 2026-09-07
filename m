Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D82CC79F99
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 10:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FCE10E1CC;
	Mon,  7 Sep 2026 10:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmnrJR/r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0646510E1CC
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 10:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788776254; x=1820312254;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=JCTfWfND40SgQvSW9ZxPDwrssjc+ZIzdYKBUbWUBto4=;
 b=VmnrJR/rFFTY5urTOeMjbM9BVnuIIv/Y2xJ6YiBOliSZSxHtQT+dGVLt
 Z6Nb0RQADiPjECEAjDWlc2NIrjTQdImukbgMo/xopneqOBos6HKyFivN4
 +5u8fZVSSKxDeFaNK2BZOhuiz6Yjbr3u4Yr6WULW6r//3MqnsrGljGwxL
 wU5crcHkYEaDATbng463VTmbQgmL+qBzPTg3vcujrOna7k4N1YzOMmhe+
 SFPwDXfDiwJJHvICVrG1bJ0gZNJCLoSvj6/evJwu067MtQtj9AdKUxlr1
 CKTxIABy/5CjzcsUNaGx7W89iMElVO5D1ZLSkz1rcJPPlM6CW5tbujHvz A==;
X-CSE-ConnectionGUID: Zp8bXcsQQwm8Ld3N2TsPYg==
X-CSE-MsgGUID: FN17YrgeSU2s6UtsBAPQSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89196657"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89196657"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:17:33 -0700
X-CSE-ConnectionGUID: kKHle6DEQjiyKit9xxR+Hg==
X-CSE-MsgGUID: Zw81V7TMR62GtttD7NRCkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="266326788"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.229])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:17:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Xiao Lu <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= Fi.CI.BUILD: failure for drm/i915/dp:
 enable DSC passthrough for HDMI 2.1 PCON devices (rev3)
In-Reply-To: <178868305842.126685.7778187743510505708@61270ab9df2a>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260906080845.1047081-1-xiaolu.xie@intel.com>
 <178868305842.126685.7778187743510505708@61270ab9df2a>
Date: Mon, 07 Sep 2026 13:17:30 +0300
Message-ID: <9647a22adc43ca1b1636b4dc082dcf1723adf0b3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Sun, 06 Sep 2026, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> =3D=3D Series Details =3D=3D
>
> Series: drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON devices (re=
v3)
> URL   : https://patchwork.freedesktop.org/series/173452/
> State : failure
>
> =3D=3D Summary =3D=3D
>
> Error: make failed
>   DESCEND objtool
>   CC [M]  drivers/gpu/drm/i915/display/intel_dp.o
> drivers/gpu/drm/i915/display/intel_dp.c: In function =E2=80=98intel_dp_pc=
on_passthrough_dsc_slice_config=E2=80=99:
> drivers/gpu/drm/i915/display/intel_dp.c:4427:25: error: too few arguments=
 to function =E2=80=98intel_hdmi_dsc_get_num_slices=E2=80=99
>  4427 |         target_slices =3D intel_hdmi_dsc_get_num_slices(&crtc_sta=
te->hw.adjusted_mode,
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/gpu/drm/i915/display/intel_dp.c:84:
> drivers/gpu/drm/i915/display/intel_hdmi.h:60:5: note: declared here
>    60 | int intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *=
mode,
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> make[6]: *** [scripts/Makefile.build:290: drivers/gpu/drm/i915/display/in=
tel_dp.o] Error 1
> make[5]: *** [scripts/Makefile.build:551: drivers/gpu/drm/i915] Error 2
> make[4]: *** [scripts/Makefile.build:551: drivers/gpu/drm] Error 2
> make[3]: *** [scripts/Makefile.build:551: drivers/gpu] Error 2
> make[2]: *** [scripts/Makefile.build:551: drivers] Error 2
> make[1]: *** [/home/kbuild/kernel/Makefile:2229: .] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> Build failed, no error log produced

Please base your patches on top of the drm-tip branch.

BR,
Jani.


--=20
Jani Nikula, Intel
