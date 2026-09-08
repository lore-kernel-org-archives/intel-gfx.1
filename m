Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150D4C79F82
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 08:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7390310E356;
	Tue,  8 Sep 2026 08:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5oUS8AH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AB410E356;
 Tue,  8 Sep 2026 08:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788857145; x=1820393145;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version;
 bh=2fhVIf5H1pHqFPfAfhIX4fZnOgiSIIiV4qekYw0PLIY=;
 b=A5oUS8AHQao9G7AiJJGnM8pAv9dWj8xGZxSTKzYxUv4ECLzDk+p56IZ+
 8Y17glO4roChhJdz1ziz24jb7/Efkxd+8qQvRCQf/W04AhtzZ+piJfdXS
 l0vWXmo3n2JkOr4R9PZUMBwjmRdPni8AV1bVurKV9C25xgbW++JzOLzIg
 v4MEwL34y4Hsdy855+CJp3HVlNAn5AWJmiP3a+GKeUILtJ7qDHAst3Sq+
 hZkoZ49llocy10hErEXBf7TRbdQ8LTD+JlmBQncCqc/r+ejRVdEYb5cVg
 UXRu8O9tDdFvVZJFFHd7C19xZW7t8f+JnT8k+/hrlgT+kDnR6tXX/YhMK w==;
X-CSE-ConnectionGUID: 2DOHieIVSdSazKgTjXzbmw==
X-CSE-MsgGUID: BdcLg8G6TcabXcfavNmzMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89177554"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208,217";a="89177554"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 01:45:45 -0700
X-CSE-ConnectionGUID: tu83B+BIThSMnBoUFv6siA==
X-CSE-MsgGUID: P9+jY8lqR4+UXvScAxaXig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
 d="scan'208,217";a="300815122"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.ger.corp.intel.com) ([10.245.246.101])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 01:45:43 -0700
Message-ID: <d80336b7c23f857016ba04cfac2f3c1696f4a4d1.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= i915.CI.Full: failure for PCI: Disable
 not supported reset methods on DG1 0x4905 (rev2)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 08 Sep 2026 10:45:29 +0200
In-Reply-To: <178880207720.130176.6142655422792771652@61270ab9df2a>
References: <20260907090249.1348552-2-janusz.krzysztofik@linux.intel.com>
 <178880207720.130176.6142655422792771652@61270ab9df2a>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: multipart/alternative; boundary="=-nskahxCvaviLXSOra2ZZ"
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

--=-nskahxCvaviLXSOra2ZZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=C2=A0I915-ci-infra@lists.freedesktop.org,

On Mon, 2026-09-07 at 17:27 +0000, Patchwork wrote:
> Patch Details
>=20
> Series:PCI: Disable not supported reset methods on DG1 0x4905 (rev2)
>=20
> URL:https://patchwork.freedesktop.org/series/172446/
>=20
> State:failure
> Details:
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172446v2/index.html
> CI Bug Log - changes from CI_DRM_19095_full -> Patchwork_172446v2_fullSum=
maryFAILURE
> Serious unknown changes coming with Patchwork_172446v2_full absolutely
> need to be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in Patchwork_172446v2_full, please notify your bug team (I915-
> ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in
> CI.
> Participating hosts (11 -> 11)No changes in participating hosts
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> Patchwork_172446v2_full:
> IGT changesPossible regressions * igt@device_reset@unbind-reset-rebind:
>     - shard-dg1:          NOTRUN -> SKIP [1]

This subtest used to trigger aborts on DG1, see CBL history. =C2=A0This pat=
ch
makes it skip. =C2=A0Please update CBL filters with a condition like:

stdout CONTAINS "Test requirement:
!(!is_sysfs_reset_supported(dev.fds.dev))"

for this subtest skipping on DG1 (SKU 8086:4905 specifically) and tag this
skip as expected, then re-report.

Thanks,
Janusz


> New tests
...


[1] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172446v2/shard-dg1-1=
4/igt@device_reset@unbind-reset-rebind.html

--=-nskahxCvaviLXSOra2ZZ
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
><div>On Mon, 2026-09-07 at 17:27 +0000, Patchwork wrote:</div><blockquote =
type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;pad=
ding-left:1ex"><div><b>Patch Details</b></div>
<div><table>
<tbody><tr><td><b>Series:</b></td><td>PCI: Disable not supported reset meth=
ods on DG1 0x4905 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/172446/">https://patchwork.freedesktop.org/series/172446/</a></td></tr=
>
<tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td=
><td><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172446v2=
/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172446v2/in=
dex.html</a></td></tr></tbody></table> </div><h1>CI Bug Log - changes from =
CI_DRM_19095_full -&gt; Patchwork_172446v2_full</h1><h2>Summary</h2><p><str=
ong>FAILURE</strong></p><p>Serious unknown changes coming with Patchwork_17=
2446v2_full absolutely need to be<br> verified manually.</p><p>If you think=
 the reported changes have nothing to do with the changes<br> introduced in=
 Patchwork_172446v2_full, please notify your bug team (I915-ci-infra@lists.=
freedesktop.org) to allow them<br> to document this new failure mode, which=
 will reduce false positives in CI.</p><h2>Participating hosts (11 -&gt; 11=
)</h2><p>No changes in participating hosts</p><h2>Possible new issues</h2><=
p>Here are the unknown changes that may have been introduced in Patchwork_1=
72446v2_full:</p><h3>IGT changes</h3><h4>Possible regressions</h4><ul>
<li>igt@device_reset@unbind-reset-rebind:</li><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_172446v2/shard-dg1-14/igt@device_reset@unbind-reset=
-rebind.html">SKIP</a></li>
</ul>
</ul></blockquote><div><br></div><div>This subtest used to trigger aborts o=
n DG1, see CBL history. &nbsp;This patch makes it skip. &nbsp;Please update=
 CBL filters with a condition like:<br><br><span class=3D"Apple-tab-span" s=
tyle=3D"white-space:pre">	</span>stdout CONTAINS "Test requirement: !(!is_s=
ysfs_reset_supported(dev.fds.dev))"<br><br>for this subtest skipping on DG1=
 (SKU 8086:4905 specifically) and tag this skip as expected, then re-report=
.</div><div><br></div><div>Thanks,<br>Janusz</div><div><br></div><div><br><=
/div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px =
#729fcf solid;padding-left:1ex"><h2>New tests<br></h2></blockquote><div>...=
</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px=
 #729fcf solid;padding-left:1ex"></blockquote><div><br></div><div><span></s=
pan></div></body></html>

--=-nskahxCvaviLXSOra2ZZ--
