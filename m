Return-Path: <SRS0=ggpC=KU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FAEC47084
	for <intel-gfx@archiver.kernel.org>; Tue, 25 May 2021 15:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01D7F61260
	for <intel-gfx@archiver.kernel.org>; Tue, 25 May 2021 15:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01D7F61260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD506EA63;
	Tue, 25 May 2021 15:27:58 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591B06EA61;
 Tue, 25 May 2021 15:27:57 +0000 (UTC)
IronPort-SDR: Gw9QjuNEeNMgpNIFsInVlQz3rbBpOKGy9fKjubaJQGAg9Al2p7Bw/eH9yk10tnB/PiPTvfrqry
 SJS5btEt+23w==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="202237976"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="202237976"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 08:27:53 -0700
IronPort-SDR: Dej0CYihPLpXX7PX410TElOPH4UbwzYrwd0QwmxpNyTfU1etYQyTkuqL1o/Bl9fIXeWWQe4yIr
 px4EEJTopO0g==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="442589081"
Received: from tomeara-mobl.ger.corp.intel.com (HELO [10.213.211.66])
 ([10.213.211.66])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 08:27:51 -0700
To: Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
References: <20210521183215.65451-1-matthew.brost@intel.com>
 <YK0CKLSCx0qowxhy@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <040887b2-48f3-c4be-2a43-7e99492af5fc@linux.intel.com>
Date: Tue, 25 May 2021 16:27:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YK0CKLSCx0qowxhy@phenom.ffwll.local>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 0/3] Clean a few backend interfaces in the
 i915
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 25/05/2021 14:56, Daniel Vetter wrote:
> On Fri, May 21, 2021 at 11:32:12AM -0700, Matthew Brost wrote:
>> As discussed in [1] start merging some support patches as a precursor to
>> GuC submission the i915. This is step #1 mentioned in [1].
>>
>> [1] https://patchwork.freedesktop.org/series/89844/
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Pushed to drm-intel-gt-next, thanks for patches&reviews. Btw you can also
> ping John H or Daniele for pushing stuff for you, should be quicker than
> waiting for me to return from a lon w/e :-)
> 
> Plus I _really_ don't want to get back into the business of pushing other
> people's work ...

To Matt - Also please take care to preserve r-b's when resurrecting 
patches because all of these three had mine from before which is now 
lost in git history.

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
