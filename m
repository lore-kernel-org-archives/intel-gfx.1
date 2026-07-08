Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B9AC43458
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Jul 2026 03:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7625110E53F;
	Wed,  8 Jul 2026 03:57:58 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7352F10E53F;
 Wed,  8 Jul 2026 03:57:56 +0000 (UTC)
X-UUID: 2f1a71d87a8111f1aa26b74ffac11d73-20260708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:366e5402-6b42-48cb-9dd9-8ab9bc04ca0d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:61adddd35b1b63a477744e0dce2e19d9,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
 |15|52,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
 0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2f1a71d87a8111f1aa26b74ffac11d73-20260708
X-User: lilinmao@kylinos.cn
Received: from [10.0.2.15] [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <lilinmao@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
 with ESMTP id 1152066772; Wed, 08 Jul 2026 11:57:48 +0800
Message-ID: <15949620-ec08-4244-abf0-24e6e8991278@kylinos.cn>
Date: Wed, 8 Jul 2026 11:57:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/g?=
 =?UTF-8?Q?uc=3A_Sort_multi-lrc_engines_by_logical_instance?=
To: intel-gfx@lists.freedesktop.org
References: <20260706111328.618675-1-lilinmao@kylinos.cn>
 <1783471758525565.18879.seg@mailgw.kylinos.cn>
Cc: I915-ci-infra@lists.freedesktop.org
From: Linmao Li <lilinmao@kylinos.cn>
In-Reply-To: <1783471758525565.18879.seg@mailgw.kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

This looks unrelated to the patch.

The incomplete is reported on bat-atsm-1 for both the parent test
igt@i915_selftest@live and the dynamic subtest live@hangcheck. The run
stopped while hangcheck was running, and run0.txt ends with a Jenkins
channel disconnect for bat-atsm-1 followed by a reboot request for the
host.

This patch only touches selftest_guc_multi_lrc.c.  In the live selftest
order, guc_multi_lrc runs after hangcheck, so the code changed by this
patch was not reached in this run.

Please re-run or document this failure mode.

在 2026/7/6 22:31, Patchwork 写道:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/i915/guc: Sort multi-lrc engines by logical instance
> *URL:* 	https://patchwork.freedesktop.org/series/169853/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169853v1/index.html
>
>
>   CI Bug Log - changes from CI_DRM_18765 -> Patchwork_169853v1
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with Patchwork_169853v1 absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in Patchwork_169853v1, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169853v1/index.html
>
>
>     Participating hosts (42 -> 40)
>
> Missing (2): bat-dg2-13 fi-snb-2520m
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> Patchwork_169853v1:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@i915_selftest@live@hangcheck:
>       o bat-atsm-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18765/bat-atsm-1/igt@i915_selftest@live@hangcheck.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169853v1/bat-atsm-1/igt@i915_selftest@live@hangcheck.html>
>         +1 other test incomplete
>
>
>     Build changes
>
>   * Linux: CI_DRM_18765 -> Patchwork_169853v1
>
> CI-20190529: 20190529
> CI_DRM_18765: 9179ea89567d036ecc9013cc27af4a367aeb14b9 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGT_8990: 8990
> Patchwork_169853v1: 9179ea89567d036ecc9013cc27af4a367aeb14b9 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
>
