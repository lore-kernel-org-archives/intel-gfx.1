Return-Path: <SRS0=hFQw=IK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D886CC433DB
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Mar 2021 11:37:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8501A64FC3
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Mar 2021 11:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8501A64FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC726F5B9;
	Fri, 12 Mar 2021 11:37:07 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71306F5B9
 for <intel-gfx@lists.freedesktop.org>; Fri, 12 Mar 2021 11:37:05 +0000 (UTC)
IronPort-SDR: 0Le1n98vFJfY58HdctxraVX6E/VkSrFf0vBeYSB3zdgWGUwuW1mgVr0SCqqFShdIh/Ah23c0jM
 QsWqZE6UoQXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="175942362"
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; d="scan'208";a="175942362"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 03:37:04 -0800
IronPort-SDR: 81A93BGX/tefOP7M27O3CIW27K/+PVdFetYZmvGFn//fDDgoDa/Ciep6Xs95bC5Qi5f6jdjPqZ
 Mng2VQreHOgg==
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; d="scan'208";a="404391320"
Received: from abdelh1x-mobl.amr.corp.intel.com (HELO [10.252.50.43])
 ([10.252.50.43])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 03:37:03 -0800
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
References: <cover.1611354210.git.ashutosh.dixit@intel.com>
 <20210311202017.1133327-1-jason@jlekstrand.net>
 <20210311202017.1133327-2-jason@jlekstrand.net>
 <87o8fp6of4.wl-ashutosh.dixit@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <d411d610-26d6-8873-3c4b-db70e09f4e61@linux.intel.com>
Date: Fri, 12 Mar 2021 12:37:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87o8fp6of4.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915: Disable pread/pwrite ioctl's
 for future platforms (v2)
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Op 2021-03-12 om 04:28 schreef Dixit, Ashutosh:
> On Thu, 11 Mar 2021 12:20:17 -0800, Jason Ekstrand wrote:
>> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
>> index b2e3b5cfccb4a..78ad5a9dd4784 100644
>> --- a/drivers/gpu/drm/i915/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>> @@ -374,10 +374,19 @@ int
>>  i915_gem_pread_ioctl(struct drm_device *dev, void *data,
>> 		     struct drm_file *file)
>>  {
>> +	struct drm_i915_private *i915 = to_i915(dev);
>> 	struct drm_i915_gem_pread *args = data;
>> 	struct drm_i915_gem_object *obj;
>> 	int ret;
>>
>> +	/* Pread is disallowed for all platforms after TGL-LP */
>> +	if (INTEL_GEN(i915) >= 12 && !IS_TIGERLAKE(i915))
>> +		return -EOPNOTSUPP;
>> +
>> +	/* All discrete memory platforms are Gen12 or above */
>> +	if (WARN_ON(HAS_LMEM(i915)))
>> +		return -EOPNOTSUPP;
> Not sure but you are probably trying to make it explicit that pread/pwrite
> are truly gone on dGfx? Because real dGfx are Gen12+ the code will return
> from the first if statement and never get to the second if statement. And
> there's talk on the relocation thread about tripping fake LMEM here for
> platforms prior to Gen12.
>
> So I'd suggest get rid of this second if statement and only retain the
> first (for both pread and pwrite) since that seems to be entirely
> sufficient.
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

I think this should probably be a -ENODEV return code, otherwise patch looks good to me.

We probably don't want to break fake lmem until it's removed..

Cc drm maintainers on next version?

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
