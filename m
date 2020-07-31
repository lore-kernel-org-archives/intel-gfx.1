Return-Path: <SRS0=EmSX=BK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE24C433DF
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 19:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08583206D4
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 19:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08583206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7156EB3D;
	Fri, 31 Jul 2020 19:07:00 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44F96EB3D
 for <intel-gfx@lists.freedesktop.org>; Fri, 31 Jul 2020 19:06:59 +0000 (UTC)
IronPort-SDR: gIdawlCJ0TyNHg+un0WSmDRSZRVmb0I72YLlmvMR3G7cOnT9K+GYQv+1ayE2cp6b/siEcQcx+U
 WLdYcAvNCZcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="151055119"
X-IronPort-AV: E=Sophos;i="5.75,419,1589266800"; d="scan'208";a="151055119"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 12:06:59 -0700
IronPort-SDR: bQWZwgboiqcAT3USRRr0WlP1zIQGQjqzCjsn7R0GM4Ucg0sgq0CKIpncLKWuf0MiVr+XpWWsRQ
 N/ipAfrU5CYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,419,1589266800"; d="scan'208";a="274577608"
Received: from nk4-mobl1.gar.corp.intel.com (HELO [10.252.37.207])
 ([10.252.37.207])
 by fmsmga008.fm.intel.com with ESMTP; 31 Jul 2020 12:06:58 -0700
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20200731134553.156492-1-lionel.g.landwerlin@intel.com>
 <20200731134553.156492-3-lionel.g.landwerlin@intel.com>
 <159620585968.21624.902926301015466462@build.alporthouse.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <28cadfb8-528a-7683-9b82-a2fbdf494f68@intel.com>
Date: Fri, 31 Jul 2020 22:06:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159620585968.21624.902926301015466462@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915: add syncobj timeline support
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 31/07/2020 17:30, Chris Wilson wrote:
> Quoting Lionel Landwerlin (2020-07-31 14:45:52)
>> -               drm_syncobj_replace_fence(syncobj, fence);
>> +               if (eb->fences[n].chain_fence) {
>> +                       drm_syncobj_add_point(syncobj, eb->fences[n].chain_fence,
>> +                                             fence, eb->fences[n].value);
> This function remains not acceptable. It is trivial to write an igt test
> that causes the DRM_ERROR. A user controllable error message is still
> not allowed. If you do not have such a test in your igt series, then that
> too is lacking.
> -Chris

As far as I remember there are IGT tests for this (*unordered* subtests).

So CI should report a fairlure. The IGT test itself won't fail though.


I thought we removed that DRM_ERROR a while ago.

I'll send a patch to remove it. Thanks.


-Lionel

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
