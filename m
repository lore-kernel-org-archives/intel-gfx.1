Return-Path: <SRS0=4rgl=NX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3207CC432BE
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Sep 2021 08:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9F9260FED
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Sep 2021 08:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9F9260FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3F56E15D;
	Wed,  1 Sep 2021 08:34:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEE76E15D
 for <intel-gfx@lists.freedesktop.org>; Wed,  1 Sep 2021 08:33:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="198913559"
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; 
 d="scan'208,217";a="198913559"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 01:33:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; 
 d="scan'208,217";a="532009993"
Received: from ntaiyeby-mobl1.ger.corp.intel.com (HELO [10.249.254.114])
 ([10.249.254.114])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 01:33:56 -0700
To: intel-gfx@lists.freedesktop.org,
 ", Lakshminarayana Vudum" <lakshminarayana.vudum@intel.com>
References: <20210831122931.157536-1-thomas.hellstrom@linux.intel.com>
 <163043588758.10660.354234617896530827@emeril.freedesktop.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <a1c0b106-3ba4-1859-f5be-27d29cf2cc0f@linux.intel.com>
Date: Wed, 1 Sep 2021 10:33:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <163043588758.10660.354234617896530827@emeril.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="------------214F6828E8966F5F7BD19578"
Content-Language: en-US
Subject: Re: [Intel-gfx] 
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgZHJt?=
 =?utf-8?q?/i915/gem=3A_Fix_the_mman_selftest_=28rev2=29?=
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

This is a multi-part message in MIME format.
--------------214F6828E8966F5F7BD19578
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/31/21 8:51 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/i915/gem: Fix the mman selftest (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/94062/ 
> <https://patchwork.freedesktop.org/series/94062/>
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20928/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20928/index.html>
>
>
>   CI Bug Log - changes from CI_DRM_10539_full -> Patchwork_20928_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with Patchwork_20928_full absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in Patchwork_20928_full, please notify your bug team to 
> allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> Patchwork_20928_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@sysfs_heartbeat_interval@mixed@vcs0:
>       o shard-skl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10539/shard-skl9/igt@sysfs_heartbeat_interval@mixed@vcs0.html>
>         -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20928/shard-skl6/igt@sysfs_heartbeat_interval@mixed@vcs0.html>
>
>
Lakshmi, this failure is unrelated.

Thanks,

Thomas



--------------214F6828E8966F5F7BD19578
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/31/21 8:51 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:163043588758.10660.354234617896530827@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/i915/gem: Fix the mman selftest (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/94062/"
                moz-do-not-send="true">https://patchwork.freedesktop.org/series/94062/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20928/index.html"
                moz-do-not-send="true">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20928/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_10539_full -&gt;
        Patchwork_20928_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with Patchwork_20928_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in Patchwork_20928_full, please notify your bug team
        to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        Patchwork_20928_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@sysfs_heartbeat_interval@mixed@vcs0:
          <ul>
            <li>shard-skl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10539/shard-skl9/igt@sysfs_heartbeat_interval@mixed@vcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20928/shard-skl6/igt@sysfs_heartbeat_interval@mixed@vcs0.html"
                moz-do-not-send="true">WARN</a></li>
          </ul>
        </li>
      </ul>
      <br>
    </blockquote>
    <p>Lakshmi, this failure is unrelated.</p>
    <p>Thanks,</p>
    <p>Thomas</p>
    <p><br>
    </p>
  </body>
</html>

--------------214F6828E8966F5F7BD19578--
