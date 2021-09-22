Return-Path: <SRS0=at8c=OM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769F9C433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Sep 2021 18:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F3466115A
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Sep 2021 18:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F3466115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDCC6E02A;
	Wed, 22 Sep 2021 18:06:47 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0066E02A
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Sep 2021 18:06:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="223696459"
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; 
 d="scan'208,217";a="223696459"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 11:06:45 -0700
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; 
 d="scan'208,217";a="474785483"
Received: from mmazarel-mobl1.ger.corp.intel.com (HELO [10.249.254.175])
 ([10.249.254.175])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 11:06:44 -0700
To: intel-gfx@lists.freedesktop.org,
 ", Lakshminarayana Vudum" <lakshminarayana.vudum@intel.com>
References: <20210922062527.865433-1-thomas.hellstrom@linux.intel.com>
 <163230155466.6942.15685607691777205949@emeril.freedesktop.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <cf0542cf-7e26-1851-5032-5a4b3f896033@linux.intel.com>
Date: Wed, 22 Sep 2021 20:06:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <163230155466.6942.15685607691777205949@emeril.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="------------C14E1343C94C1EEBA6232969"
Content-Language: en-US
Subject: Re: [Intel-gfx] 
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgZHJt?=
 =?utf-8?q?/i915=3A_Suspend_/_resume_backup-_and_restore_of_LMEM=2E_=28rev?=
 =?utf-8?q?9=29?=
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
--------------C14E1343C94C1EEBA6232969
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/22/21 11:05 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/i915: Suspend / resume backup- and restore of LMEM. (rev9)
> *URL:* 	https://patchwork.freedesktop.org/series/94278/ 
> <https://patchwork.freedesktop.org/series/94278/>
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21124/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21124/index.html>
>
>
>   CI Bug Log - changes from CI_DRM_10622_full -> Patchwork_21124_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with Patchwork_21124_full absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in Patchwork_21124_full, please notify your bug team to 
> allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> Patchwork_21124_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@gem_exec_schedule@u-submit-golden-slice@rcs0:
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10622/shard-tglb3/igt@gem_exec_schedule@u-submit-golden-slice@rcs0.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21124/shard-tglb6/igt@gem_exec_schedule@u-submit-golden-slice@rcs0.html>
>
>

Lakshmi, this failure is unrelated.

The igt@gem_exec_schedule@u-submit-golden-slice plus some other subtests 
have been broken since igt commit

a9987a8d tests/i915/gem_exec_schedule: Convert to intel_ctx_t (v3)

Although the tests typically says SUCCESS, it's because they typically 
are interrupted by the watchdog and move on.

Thanks,

Thomas


--------------C14E1343C94C1EEBA6232969
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/22/21 11:05 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:163230155466.6942.15685607691777205949@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/i915: Suspend / resume backup- and restore of LMEM.
              (rev9)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/94278/"
                moz-do-not-send="true">https://patchwork.freedesktop.org/series/94278/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21124/index.html"
                moz-do-not-send="true">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21124/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_10622_full -&gt;
        Patchwork_21124_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with Patchwork_21124_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in Patchwork_21124_full, please notify your bug team
        to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        Patchwork_21124_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@gem_exec_schedule@u-submit-golden-slice@rcs0:
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10622/shard-tglb3/igt@gem_exec_schedule@u-submit-golden-slice@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21124/shard-tglb6/igt@gem_exec_schedule@u-submit-golden-slice@rcs0.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
      <br>
    </blockquote>
    <br>
    <p>Lakshmi, this failure is unrelated.</p>
    <p>The igt@gem_exec_schedule@u-submit-golden-slice plus some other
      subtests have been broken since igt commit</p>
    <p>a9987a8d tests/i915/gem_exec_schedule: Convert to intel_ctx_t
      (v3)</p>
    <p>Although the tests typically says SUCCESS, it's because they
      typically are interrupted by the watchdog and move on.<br>
    </p>
    <p>Thanks,</p>
    <p>Thomas</p>
  </body>
</html>

--------------C14E1343C94C1EEBA6232969--
