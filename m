Return-Path: <SRS0=AA48=MI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63073C07E95
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Jul 2021 09:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E2CE61279
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Jul 2021 09:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E2CE61279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DEE6E955;
	Fri, 16 Jul 2021 09:34:50 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4379D6E955
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Jul 2021 09:34:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="271819410"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="271819410"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 02:34:48 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="506816715"
Received: from kmbaku-mobl.ger.corp.intel.com (HELO [10.252.62.109])
 ([10.252.62.109])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 02:34:47 -0700
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210715120842.806605-1-maarten.lankhorst@linux.intel.com>
 <CAM0jSHMZStUCDFzcUrQPaAFXoBVxKmsmK2XQ4hALYHh5Y9p8Jw@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <feaa7999-d28a-d09d-8284-52dec5f5d059@linux.intel.com>
Date: Fri, 16 Jul 2021 11:34:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHMZStUCDFzcUrQPaAFXoBVxKmsmK2XQ4hALYHh5Y9p8Jw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Add missing docbook chapters
 for i915 uapi.
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Op 15-07-2021 om 14:19 schreef Matthew Auld:
> On Thu, 15 Jul 2021 at 13:08, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> I noticed when grepping for DOC: that those were defined
>> in the header, but not actually used. Fix it by removing
>> all chapters and the internal annotation, so the docbook
>> generated chapters are used.
>>
>> Changes since v1:
>> - Just remove the chapters, no need for those.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Link: https://patchwork.freedesktop.org/patch/msgid/20210709113842.651140-1-maarten.lankhorst@linux.intel.com
> Indeed, it seems to still render correctly here.
>
> Maybe update the commit title when pushing,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
>> ---
>>  Documentation/gpu/driver-uapi.rst | 21 ---------------------
>>  1 file changed, 21 deletions(-)
>>
>> diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
>> index 27d0fbe33e87..4411e6919a3d 100644
>> --- a/Documentation/gpu/driver-uapi.rst
>> +++ b/Documentation/gpu/driver-uapi.rst
>> @@ -5,25 +5,4 @@ DRM Driver uAPI
>>  drm/i915 uAPI
>>  =============
>>
>> -Engine Discovery uAPI
>> ----------------------
>> -
>> -.. kernel-doc:: include/uapi/drm/i915_drm.h
>> -   :doc: Engine Discovery uAPI
>> -
>> -Context Engine Map uAPI
>> ------------------------
>> -
>> -.. kernel-doc:: include/uapi/drm/i915_drm.h
>> -   :doc: Context Engine Map uAPI
>> -
>> -Virtual Engine uAPI
>> --------------------
>> -
>> -.. kernel-doc:: include/uapi/drm/i915_drm.h
>> -   :doc: Virtual Engine uAPI
>> -
>> -i915_drm.h
>> -----------
>>  .. kernel-doc:: include/uapi/drm/i915_drm.h
>> -   :internal:
>> --
>> 2.31.0
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

Thanks, pushed!

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
