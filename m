Return-Path: <SRS0=uIVS=DT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C44C433DF
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 14:13:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A8882076E
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 14:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A8882076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CC66E47B;
	Mon, 12 Oct 2020 14:13:47 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A4E6E47E
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Oct 2020 14:13:46 +0000 (UTC)
IronPort-SDR: GRk4WuRt/6VyNf+zs9F3t/LuGRAQe6IjxtOwDCiCdMRrqNhGtOESmGa88vIBI0WUbrm+c5A9/4
 /Ci38rcs/A0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="152673523"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="152673523"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 07:13:45 -0700
IronPort-SDR: 4otluYESYABo5BpFBx9XD38cEHGL7iKR0J5vz3W2WVYZSrSGMWNeu9HmWsNb3coogLm8nXf+Ym
 lipqs8CCQetg==
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="529975503"
Received: from dianaman-mobl1.ger.corp.intel.com (HELO [10.252.38.141])
 ([10.252.38.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 07:13:44 -0700
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20201002125939.50817-1-maarten.lankhorst@linux.intel.com>
 <20201002125939.50817-11-maarten.lankhorst@linux.intel.com>
 <9d0866bf640b43abb184fecc503aae9a@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <65cc5740-e6c3-b38a-7b2d-7caa3aabdda3@linux.intel.com>
Date: Mon, 12 Oct 2020 16:13:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <9d0866bf640b43abb184fecc503aae9a@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 10/61] drm/i915: Disable userptr
 pread/pwrite support.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Op 02-10-2020 om 22:14 schreef Ruhl, Michael J:
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
>> Maarten Lankhorst
>> Sent: Friday, October 2, 2020 8:59 AM
>> To: intel-gfx@lists.freedesktop.org
>> Subject: [Intel-gfx] [PATCH 10/61] drm/i915: Disable userptr pread/pwrite
>> support.
>>
>> Userptr should not need the kernel for a userspace memcpy, userspace
>> needs to call memcpy directly.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>> .../gpu/drm/i915/gem/i915_gem_object_types.h  |  2 ++
>> drivers/gpu/drm/i915/gem/i915_gem_userptr.c   | 20
>> +++++++++++++++++++
>> drivers/gpu/drm/i915/i915_gem.c               |  5 +++++
>> 3 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> index 62dde3585b51..dbb6f6171165 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> @@ -57,6 +57,8 @@ struct drm_i915_gem_object_ops {
>>
>> 	int (*pwrite)(struct drm_i915_gem_object *obj,
>> 		      const struct drm_i915_gem_pwrite *arg);
>> +	int (*pread)(struct drm_i915_gem_object *obj,
>> +		     const struct drm_i915_gem_pread *arg);
>>
>> 	int (*dmabuf_export)(struct drm_i915_gem_object *obj);
>> 	void (*release)(struct drm_i915_gem_object *obj);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>> index 22008948be58..136a589e5d94 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>> @@ -700,6 +700,24 @@ i915_gem_userptr_dmabuf_export(struct
>> drm_i915_gem_object *obj)
>> 	return i915_gem_userptr_init__mmu_notifier(obj, 0);
>> }
>>
>> +static int
>> +i915_gem_userptr_pwrite(struct drm_i915_gem_object *obj,
>> +			const struct drm_i915_gem_pwrite *args)
>> +{
>> +	drm_dbg(obj->base.dev, "pwrite to userptr no longer allowed\n");
>> +
>> +	return -EINVAL;
> I have seen ENOSYS used for unsupported pread/pwrite (see radeon_gem.c).
>
> I  have also seen ENOTSUPP for similar return values.
>
> Is EINVAL the correct response?

It seems for some other things we use -ENXIO, I don't think it matters in the end.

As long as we fail in some recognisable way, I'm fine with it. :)

I chose -EINVAL as we return the same error with r/o objects.

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
