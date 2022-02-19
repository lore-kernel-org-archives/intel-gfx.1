Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A856EC433EF
	for <intel-gfx@archiver.kernel.org>; Sat, 19 Feb 2022 06:34:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDACB10F15F;
	Sat, 19 Feb 2022 06:34:29 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9641410F156;
 Sat, 19 Feb 2022 06:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645252468; x=1676788468;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nhxfLuXZL5Vlkm4L8vSBxdAPYYbKn8gv3KUvFpFf0zk=;
 b=RqIFAvx5MpHAigEFhgrTNq0x1ptqQIsrAHtdDUd0jPhW3PQ34fr0rPhe
 5TeobbhEP6U4nWz1maS8IHeNG7zuy1XhMV7pvfJ6AJlqmvn+oXLV7V7As
 H/c0tffuX7MTo6jZtM2rDkfA/xCuUVlaACt20mYkj45Zk4EDsmLrQtD13
 QfSJQM1xQ3II86TJwGfb7FIqg4R80jOTpHVdaEU8mt0NukunCbqn4xWj3
 kQkJIc/IRm3slhH2w9YCA3l0OPewTfpIPg9ctlfN74DDGwAXxQUkVCX2g
 ryEgRh0I0TvhcvCKpOz91DkrqJ/efG8xGvuPUG+po7lgM5Gpiy9rub0dm Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="248857894"
X-IronPort-AV: E=Sophos;i="5.88,381,1635231600"; d="scan'208";a="248857894"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 22:34:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,381,1635231600"; d="scan'208";a="775499233"
Received: from rkotlyar-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.149.118])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 22:34:27 -0800
Date: Fri, 18 Feb 2022 22:34:30 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <20220219063430.me564f4lu4ufpb6g@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220217175634.4128754-1-lucas.demarchi@intel.com>
 <CAM0jSHM3cf36p_+V3Nx-6mKzARkfPjcPVKnxmx49wUcRKo5bbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAM0jSHM3cf36p_+V3Nx-6mKzARkfPjcPVKnxmx49wUcRKo5bbQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Kill the fake lmem support
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 06:09:53PM +0000, Matthew Auld wrote:
>On Thu, 17 Feb 2022 at 17:55, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>> This was useful for early development of lmem, but it's not used
>> anymore, so remove it.
>>
>> v2: Remove unneeded fields from struct intel_memory_region
>>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks, applied.

Lucas De Marchi
