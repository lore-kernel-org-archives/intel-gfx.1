Return-Path: <SRS0=MMuT=IQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0791C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Mar 2021 20:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6558B64ED5
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Mar 2021 20:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6558B64ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB2D6E153;
	Thu, 18 Mar 2021 20:53:07 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38736E153
 for <intel-gfx@lists.freedesktop.org>; Thu, 18 Mar 2021 20:53:05 +0000 (UTC)
IronPort-SDR: 3YN9LcGC47qWRg+aCBVyBnt0AzsIAOk5glY+9Yb+0uf6U5gDXK3yJ5goefDFqAA2tmwz45vGPs
 T/kVMXvuCU4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="169063846"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="169063846"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 13:52:38 -0700
IronPort-SDR: tsiRv5Vv3g88SLmcnHpgohnZTfuWBDackP2bS6oKWgVGa8aQU7EWr37m8EBeTIa2vu0ElaivQ0
 UvDObIDa2y2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="413238702"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 18 Mar 2021 13:52:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Mar 2021 22:52:34 +0200
Date: Thu, 18 Mar 2021 22:52:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Message-ID: <YFO9kkfDd7R6ZHeS@intel.com>
References: <20210318181039.17260-1-ville.syrjala@linux.intel.com>
 <161609818377.12738.9441142796604021229@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161609818377.12738.9441142796604021229@emeril.freedesktop.org>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] 
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2Vy?=
 =?utf-8?q?ies_starting_with_=5B1/2=5D_drm/i915=3A_Fix_pre-skl_DP_AUX_prec?=
 =?utf-8?q?harge_length?=
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
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 08:09:43PM -0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
> =

> Series: series starting with [1/2] drm/i915: Fix pre-skl DP AUX precharge=
 length
> URL   : https://patchwork.freedesktop.org/series/88132/
> State : failure
> =

> =3D=3D Summary =3D=3D
> =

> CI Bug Log - changes from CI_DRM_9870 -> Patchwork_19807
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> =

> Summary
> -------
> =

>   **FAILURE**
> =

>   Serious unknown changes coming with Patchwork_19807 absolutely need to =
be
>   verified manually.
>   =

>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_19807, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in=
 CI.
> =

>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19807/=
index.html
> =

> Possible new issues
> -------------------
> =

>   Here are the unknown changes that may have been introduced in Patchwork=
_19807:
> =

> ### IGT changes ###
> =

> #### Possible regressions ####
> =

>   * igt@i915_selftest@live@execlists:
>     - fi-kbl-soraka:      [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9870/fi-kbl-sorak=
a/igt@i915_selftest@live@execlists.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19807/fi-kbl-s=
oraka/igt@i915_selftest@live@execlists.html

<3> [1019.090846] i915 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did n=
ot complete or timeout within 10ms (status 0xad4003ff)

Unrelated to the patch since it doesn't touch the skl+ AUX code
and this machine is a kbl. So seems to be just some random fail.

> =

>   =

> Known issues
> ------------
> =

>   Here are the changes found in Patchwork_19807 that come from known issu=
es:
> =

> ### IGT changes ###
> =

> #### Issues hit ####
> =

>   * igt@core_hotunplug@unbind-rebind:
>     - fi-bwr-2160:        [PASS][3] -> [FAIL][4] ([i915#3194])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9870/fi-bwr-2160/=
igt@core_hotunplug@unbind-rebind.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19807/fi-bwr-2=
160/igt@core_hotunplug@unbind-rebind.html
> =

>   =

>   [i915#3194]: https://gitlab.freedesktop.org/drm/intel/issues/3194
> =

> =

> Participating hosts (44 -> 40)
> ------------------------------
> =

>   Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u =

> =

> =

> Build changes
> -------------
> =

>   * Linux: CI_DRM_9870 -> Patchwork_19807
> =

>   CI-20190529: 20190529
>   CI_DRM_9870: a9a5ed8d2432e5335e6c26118cefb2cfff28ae37 @ git://anongit.f=
reedesktop.org/gfx-ci/linux
>   IGT_6036: 5b535494abcdf5ce2b9be99b7bb5df8ab4733083 @ git://anongit.free=
desktop.org/xorg/app/intel-gpu-tools
>   Patchwork_19807: 89c9ce9bcfbf7286c2ec25ffaa26041909ec84d6 @ git://anong=
it.freedesktop.org/gfx-ci/linux
> =

> =

> =3D=3D Linux commits =3D=3D
> =

> 89c9ce9bcfbf drm/i915: Remove stray newlines
> 6b3f9e7ed7f6 drm/i915: Fix pre-skl DP AUX precharge length
> =

> =3D=3D Logs =3D=3D
> =

> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
19807/index.html

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
