Return-Path: <SRS0=JOrb=PU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E840BC433EF
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Nov 2021 15:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1FE960F58
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Nov 2021 15:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1FE960F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129446E426;
	Mon,  1 Nov 2021 15:39:18 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CEB6E0D5;
 Mon,  1 Nov 2021 15:39:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="230893666"
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800"; d="scan'208";a="230893666"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 08:39:15 -0700
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800"; d="scan'208";a="448988308"
Received: from nielsjoh-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.212.248.225])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 08:39:15 -0700
From: Jordan Justen <jordan.l.justen@intel.com>
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
In-Reply-To: <20210916184012.2642295-3-John.C.Harrison@Intel.com>
References: <20210916184012.2642295-1-John.C.Harrison@Intel.com>
 <20210916184012.2642295-3-John.C.Harrison@Intel.com>
Date: Mon, 01 Nov 2021 08:39:14 -0700
Message-ID: <877ddr51i5.fsf@jljusten-skl>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915/uapi: Add query for
 hwconfig table
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
Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org,
 Slawomir Milczarek <slawomir.milczarek@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

<John.C.Harrison@Intel.com> writes:

> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> GuC contains a consolidated table with a bunch of information about the
> current device.
>
> Previously, this information was spread and hardcoded to all the components
> including GuC, i915 and various UMDs. The goal here is to consolidate
> the data into GuC in a way that all interested components can grab the
> very latest and synchronized information using a simple query.
>
> As per most of the other queries, this one can be called twice.
> Once with item.length=0 to determine the exact buffer size, then
> allocate the user memory and call it again for to retrieve the
> table data. For example:
>   struct drm_i915_query_item item = {
>     .query_id = DRM_I915_QUERY_HWCONCFIG_TABLE;
>   };
>   query.items_ptr = (int64_t) &item;
>   query.num_items = 1;
>
>   ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
>
>   if (item.length <= 0)
>     return -ENOENT;
>
>   data = malloc(item.length);
>   item.data_ptr = (int64_t) &data;
>   ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
>
>   // Parse the data as appropriate...
>
> The returned array is a simple and flexible KLV (Key/Length/Value)
> formatted table. For example, it could be just:
>   enum device_attr {
>      ATTR_SOME_VALUE = 0,
>      ATTR_SOME_MASK  = 1,
>   };
>
>   static const u32 hwconfig[] = {
>       ATTR_SOME_VALUE,
>       1,             // Value Length in DWords
>       8,             // Value
>
>       ATTR_SOME_MASK,
>       3,
>       0x00FFFFFFFF, 0xFFFFFFFF, 0xFF000000,
>   };

Seems simple enough, so why doesn't i915 define the format of the
returned hwconfig blob in i915_drm.h?

struct drm_i915_hwconfig {
	uint32_t key;
	uint32_t length;
	uint32_t values[];
};

It sounds like the kernel depends on the closed source guc being loaded
to return this information. Is that right? Will i915 also become
dependent on some of this data such that it won't be able to initialize
without the firmware being loaded?

> The attribute ids are defined in a hardware spec.

Which spec?

-Jordan
