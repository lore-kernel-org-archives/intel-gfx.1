Return-Path: <SRS0=3135=II=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE35C433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Mar 2021 10:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24C4264FC8
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Mar 2021 10:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24C4264FC8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2546E9EE;
	Wed, 10 Mar 2021 10:19:20 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5116E9EE
 for <intel-gfx@lists.freedesktop.org>; Wed, 10 Mar 2021 10:19:19 +0000 (UTC)
IronPort-SDR: nLmw0tLnVL7g18t6HpPjc+ty5CCliU3Tve3wG0KUKYHcndjZaOQSnDjqommRwEV2KQ72P4yxF3
 wmqkyGpqfz2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="273471986"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; d="scan'208";a="273471986"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 02:19:18 -0800
IronPort-SDR: mivjzZSChBthorMiISCe2eSuGjRJQrWakRQRRu2CCeO1LoeVdFSGRFo2aH+dkC5CaDX43O710e
 oNwQw1g21YlA==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; d="scan'208";a="410130522"
Received: from deyangko-mobl1.ccr.corp.intel.com (HELO [10.249.43.167])
 ([10.249.43.167])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 02:19:14 -0800
To: "Chiou, Cooper" <cooper.chiou@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20200916180745.627-1-cooper.chiou@intel.com>
 <20210302062700.6025-1-cooper.chiou@intel.com>
 <0c8ef2fb-34b0-98ea-12bb-fc300172799c@linux.intel.com>
 <161484956454.28586.15932692857365863465@build.alporthouse.com>
 <161485897632.28586.2630377954645968923@build.alporthouse.com>
 <161490560153.13701.1838349946598091390@build.alporthouse.com>
 <40dd702b-c71c-0b99-93e6-0e120ef7715d@linux.intel.com>
 <161494684568.15221.13792200139079395463@build.alporthouse.com>
 <SA2PR11MB49696180125900E3CCB090049D969@SA2PR11MB4969.namprd11.prod.outlook.com>
 <194e43a3-2425-f5de-a8db-ad86bac19a66@linux.intel.com>
 <SA2PR11MB496960ABA0D7C5E2A53A2C099D939@SA2PR11MB4969.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <928454d4-8ae6-9b02-747f-fecdcc1e6ac4@linux.intel.com>
Date: Wed, 10 Mar 2021 10:19:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <SA2PR11MB496960ABA0D7C5E2A53A2C099D939@SA2PR11MB4969.namprd11.prod.outlook.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915: Enable
 WaProgramMgsrForCorrectSliceSpecificMmioReads for Gen9
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Tseng,
 William" <william.tseng@intel.com>, "Chen, Rong A" <rong.a.chen@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


Hi,

On 08/03/2021 17:32, Chiou, Cooper wrote:
> I've tested on GLK, KBL, CFL Intel NUC devices and got the following performance results, there is no performance regression per my testing.
> 
> Patch: [v5] drm/i915: Enable WaProgramMgsrForCorrectSliceSpecificMmioReads for Gen9
> Test suite: phoronix-test-suite.supertuxkart.1024x768.Fullscreen.Ultimate.1.GranParadisoIsland.frames_per_second
> Kernel version: 5.12.0-rc1 (drm-tip)
> 
> a. Device: Intel NUC kit NUC7JY Gemini Lake Celeron J4005 @2.7GHz (2 Cores)
>      Without patch, fps=57.45
>      With patch, fps=57.49
> b. Device: Intel NUC kit NUC8BEH Coffee Lake Core i3-8109U @3.6GHz(4 Cores)
>      Without patch, fps=117.23
>      With patch, fps=117.27
> c. Device: Intel NUC kit NUC7i3BNH Kaby Lake Core i3-7100U @2.4GHz(4 Cores)
>      Without patch, fps=114.05
>      With patch, fps=114.34
> 
> Meanwhile, Intel lkp team has validated performance on lkp-kbl-nuc1 and no regression.
> f69d02e37a85645a  d912096c40cdc3bc9364966971 testcase/testparams/testbox
> ----------------  -------------------------- ---------------------------
>            %stddev      change         %stddev
>                \          |                \
>        29.79                       29.67
> phoronix-test-suite/performance-true-Fullscreen-Ultimate-1-Gran_Paradiso_Island__Approxima-supertuxkart-1.5.2-ucode=0xde/lkp-kbl-nuc1
>        29.79                       29.67        GEO-MEAN phoronix-test-suite.supertuxkart.1280x1024.Fullscreen.Ultimate.1.GranParadisoIsland.frames_per_second
> 

CI results are green so that is good.

Do the machines used for performance testing include unusual fusing? 
Worrying thing is that we were never able to reproduce the reported 
regression in house due lack of identical machine, right? Although I 
guess avoiding hangs trumps performance.

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
