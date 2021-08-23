Return-Path: <SRS0=iWgT=NO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54BAC432BE
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Aug 2021 07:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5781F61220
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Aug 2021 07:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5781F61220
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE3E89D2F;
	Mon, 23 Aug 2021 07:07:16 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DD089D2F
 for <intel-gfx@lists.freedesktop.org>; Mon, 23 Aug 2021 07:07:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="204245899"
X-IronPort-AV: E=Sophos;i="5.84,343,1620716400"; 
 d="scan'208,217";a="204245899"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 00:07:14 -0700
X-IronPort-AV: E=Sophos;i="5.84,343,1620716400"; 
 d="scan'208,217";a="684264479"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO [10.249.254.235])
 ([10.249.254.235])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 00:07:13 -0700
Message-ID: <6e25f450ff25363bbc6a722c6342dfe85a9bf384.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, Lakshminarayana Vudum
 <lakshminarayana.vudum@intel.com>
Date: Mon, 23 Aug 2021 09:07:10 +0200
In-Reply-To: <162888651810.17682.14943295616955640879@emeril.freedesktop.org>
References: <20210813144331.372957-1-thomas.hellstrom@linux.intel.com>
 <162888651810.17682.14943295616955640879@emeril.freedesktop.org>
Content-Type: multipart/alternative; boundary="=-aizU+gU9ArdI1R07yPPz"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] 
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgZHJt?=
 =?utf-8?q?/i915=2C_drm/ttm=3A_Update_the_ttm=5Fmove=5Fmemcpy=28=29_interf?=
 =?utf-8?q?ace_=28rev3=29?=
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


--=-aizU+gU9ArdI1R07yPPz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-08-13 at 20:28 +0000, Patchwork wrote:
> Patch Details
> Series:drm/i915, drm/ttm: Update the ttm_move_memcpy() interface
> (rev3)URL:
> https://patchwork.freedesktop.org/series/91893/State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20819/index.html
> CI Bug Log - changes from CI_DRM_10482_full -> Patchwork_20819_fullSummaryFAILURE
> Serious unknown changes coming with Patchwork_20819_full absolutely
> need to be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in Patchwork_20819_full, please notify your bug team to
> allow them
> to document this new failure mode, which will reduce false positives
> in CI.
> Possible new issuesHere are the unknown changes that may have been introduced in
> Patchwork_20819_full:
> IGT changesPossible regressions * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-glk: PASS -> FAIL

Lakshmi, this failure is unrelated.

Thanks,
Thomas



--=-aizU+gU9ArdI1R07yPPz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
 =20
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body><div>On Fri, 2021-08-13 at 20:28 +0000, Patchwork wrote:</div><blockq=
uote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf soli=
d;padding-left:1ex"><div><b>Patch Details</b></div><div><table><tbody><tr><=
td><b>Series:</b></td><td>drm/i915, drm/ttm: Update the ttm_move_memcpy() i=
nterface (rev3)</td></tr><tr><td><b>URL:</b></td><td><a href=3D"https://pat=
chwork.freedesktop.org/series/91893/">https://patchwork.freedesktop.org/ser=
ies/91893/</a></td></tr><tr><td><b>State:</b></td><td>failure</td></tr> <tr=
><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_20819/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_20819/index.html</a></td></tr></tbody></table> </div><h1>CI Bug L=
og - changes from CI_DRM_10482_full -&gt; Patchwork_20819_full</h1><h2>Summ=
ary</h2><p><strong>FAILURE</strong></p><p>Serious unknown changes coming wi=
th Patchwork_20819_full absolutely need to be<br> verified manually.</p><p>=
If you think the reported changes have nothing to do with the changes<br> i=
ntroduced in Patchwork_20819_full, please notify your bug team to allow the=
m<br> to document this new failure mode, which will reduce false positives =
in CI.</p><h2>Possible new issues</h2><p>Here are the unknown changes that =
may have been introduced in Patchwork_20819_full:</p><h3>IGT changes</h3><h=
4>Possible regressions</h4><ul><li>igt@kms_cursor_legacy@2x-long-cursor-vs-=
flip-atomic:</li><ul><li>shard-glk: <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_10482/shard-glk8/igt@kms_cursor_legacy@2x-long-cursor-v=
s-flip-atomic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_20819/shard-glk5/igt@kms_cursor_legacy@2x-long-cursor=
-vs-flip-atomic.html">FAIL</a></li></ul></ul><div><span style=3D"font-size:=
 22px;"></span></div></blockquote><div><br></div><div>Lakshmi, this failure=
 is unrelated.</div><div><br></div><div>Thanks,</div><div>Thomas</div><div>=
<br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left=
:2px #729fcf solid;padding-left:1ex"></blockquote><div><br></div><div><span=
></span></div></body></html>

--=-aizU+gU9ArdI1R07yPPz--

