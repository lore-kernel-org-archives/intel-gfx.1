Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CFCC624CF
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Sep 2026 10:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5580610E3DE;
	Tue,  1 Sep 2026 10:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sd5gPQ2A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED53C10E3DE;
 Tue,  1 Sep 2026 10:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788259427; x=1819795427;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version;
 bh=2iLoIDqoIBVrSn934gNDnWml0IVZCp1Lw/1+Ksgy7NQ=;
 b=Sd5gPQ2Ab6FLfYJHrBKrn6ltaR56t5zxOnsj69usptz9JZNNnN63qo05
 MNpMUV5gHBuNBPu+j+PcA3aERFdRzG9rkVOM3fq3AG+9PhtcLzsD4Iay9
 ZzkpNTzeAwTAfZeaHI6uSRVREqLOSO/SJ6e98Nbh99r5rDtwUPxMP0U1/
 EM2JzIHQ7gVb4Ufe5gbBvtyVfmpuDpGtswPR9TjdT9Egs1EDEj1wH0hB5
 WHF33ew5Pnf7ueYlBzD98rb/y5pmmfgT5BazxBr3pI0CPovDZxHsW8wFp
 ehKfc2Xm8m0wKFvrKuLvzJU65sSgMvHC1XFqc4rM4xMVRovR3M+NjHI4n w==;
X-CSE-ConnectionGUID: zOR7dgK0SkKpmi7VQrPpGw==
X-CSE-MsgGUID: b4jPnuLmSn+usLUYCBkkCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88536537"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208,217";a="88536537"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 03:43:35 -0700
X-CSE-ConnectionGUID: bcuEpVxxSzOjWIYzwTAVcw==
X-CSE-MsgGUID: GezzfMHgSQ+uQIfP8/P1HQ==
X-ExtLoop1: 1
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.167])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 03:43:33 -0700
Message-ID: <2bfacf4518d0a914ef984dbf7dc2c6f6114100b3.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= i915.CI.Full: failure for
 drm/i915/selftests: Wait longer for request to start
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 01 Sep 2026 12:43:31 +0200
In-Reply-To: <178820767489.104222.16189714489178134155@61270ab9df2a>
References: <20260831093510.3496388-2-janusz.krzysztofik@linux.intel.com>
 <178820767489.104222.16189714489178134155@61270ab9df2a>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: multipart/alternative; boundary="=-JVIB0sRUh/AyrlgacjsT"
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
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

--=-JVIB0sRUh/AyrlgacjsT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=C2=A0I915-ci-infra@lists.freedesktop.org,

On Mon, 2026-08-31 at 20:21 +0000, Patchwork wrote:
> Patch Details
>=20
> Series:drm/i915/selftests: Wait longer for request to start
>=20
> URL:https://patchwork.freedesktop.org/series/173048/
>=20
> State:failure
> Details:
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173048v1/index.html
> CI Bug Log - changes from CI_DRM_19062_full -> Patchwork_173048v1_fullSum=
maryFAILURE
> Serious unknown changes coming with Patchwork_173048v1_full absolutely
> need to be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in Patchwork_173048v1_full, please notify your bug team (I915-
> ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in
> CI.
> Participating hosts (10 -> 10)No changes in participating hosts
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> Patchwork_173048v1_full:
> IGT changesPossible regressions *=20
>    igt@gem_linear_blits@normal:shard-dg1: PASS [5] -> FAIL [4]
>  *=20
>    igt@i915_pm_rpm@sysfs-read:shard-dg2: PASS [3] -> SKIP [2]
>  *=20
>    igt@runner@aborted:
>     - shard-mtlp:         NOTRUN -> (FAIL [1], FAIL [1])

The patch under this pre-merge testing only touches one specific selftest,
then the above failures are not related. =C2=A0Please update CBL filters an=
d re-
report.

Thanks,
Janusz

> Known issuesHere are the changes found in Patchwork_173048v1_full that co=
me from
> known issues:
...


[1] FAIL
    https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173048v1/shard-mtlp-=
6/igt@runner@aborted.html
[2] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173048v1/shard-dg2-1=
/igt@i915_pm_rpm@sysfs-read.html
[3] PASS
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19062/shard-dg2-5/igt@i=
915_pm_rpm@sysfs-read.html
[4] FAIL
    https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173048v1/shard-dg1-1=
4/igt@gem_linear_blits@normal.html
[5] PASS
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19062/shard-dg1-17/igt@=
gem_linear_blits@normal.html

--=-JVIB0sRUh/AyrlgacjsT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
 =20
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
<style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head>
<body><div>Hi&nbsp;I915-ci-infra@lists.freedesktop.org,</div><div><br></div=
><div>On Mon, 2026-08-31 at 20:21 +0000, Patchwork wrote:</div><blockquote =
type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;pad=
ding-left:1ex"><div><b>Patch Details</b></div>
<div><table>
<tbody><tr><td><b>Series:</b></td><td>drm/i915/selftests: Wait longer for r=
equest to start</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/173048/">https://patchwork.freedesktop.org/series/173048/</a></td></tr=
>
<tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td=
><td><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173048v1=
/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173048v1/in=
dex.html</a></td></tr></tbody></table> </div><h1>CI Bug Log - changes from =
CI_DRM_19062_full -&gt; Patchwork_173048v1_full</h1><h2>Summary</h2><p><str=
ong>FAILURE</strong></p><p>Serious unknown changes coming with Patchwork_17=
3048v1_full absolutely need to be<br> verified manually.</p><p>If you think=
 the reported changes have nothing to do with the changes<br> introduced in=
 Patchwork_173048v1_full, please notify your bug team (I915-ci-infra@lists.=
freedesktop.org) to allow them<br> to document this new failure mode, which=
 will reduce false positives in CI.</p><h2>Participating hosts (10 -&gt; 10=
)</h2><p>No changes in participating hosts</p><h2>Possible new issues</h2><=
p>Here are the unknown changes that may have been introduced in Patchwork_1=
73048v1_full:</p><h3>IGT changes</h3><h4>Possible regressions</h4><ul>
<li>
<p>igt@gem_linear_blits@normal:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19062/shard-dg1-17/igt@gem_linear_blits@normal.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173048v1/sha=
rd-dg1-14/igt@gem_linear_blits@normal.html">FAIL</a></li>
</ul></li>
<li>
<p>igt@i915_pm_rpm@sysfs-read:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19062/shard-dg2-5/igt@i915_pm_rpm@sysfs-read.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173048v1/shard=
-dg2-1/igt@i915_pm_rpm@sysfs-read.html">SKIP</a></li>
</ul></li>
<li>
<p>igt@runner@aborted:</p></li><ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_173048v1/shard-mtlp-6/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173048=
v1/shard-mtlp-6/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</ul></blockquote><div><br></div><div>The patch under this pre-merge testin=
g only touches one specific selftest, then the above failures are not relat=
ed. &nbsp;Please update CBL filters and re-report.</div><div><br></div><div=
>Thanks,</div><div>Janusz</div><div><br></div><blockquote type=3D"cite" sty=
le=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><h=
2>Known issues</h2><p>Here are the changes found in Patchwork_173048v1_full=
 that come from known issues:<br></p></blockquote><div>...</div><blockquote=
 type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;pa=
dding-left:1ex"></blockquote><div><br></div><div><span></span></div></body>=
</html>

--=-JVIB0sRUh/AyrlgacjsT--
