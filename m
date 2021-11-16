Return-Path: <SRS0=oPCP=QD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F31C433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Nov 2021 07:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 586B261BFB
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Nov 2021 07:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 586B261BFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86E06F3A2;
	Tue, 16 Nov 2021 07:56:15 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E5F6F3A5
 for <intel-gfx@lists.freedesktop.org>; Tue, 16 Nov 2021 07:56:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="220530546"
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; d="scan'208";a="220530546"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 23:56:13 -0800
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; d="scan'208";a="645383389"
Received: from pheino-mobl.ger.corp.intel.com (HELO [10.249.254.142])
 ([10.249.254.142])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 23:56:12 -0800
Message-ID: <a72e82d7-9524-97db-acc4-77df12c5437a@linux.intel.com>
Date: Tue, 16 Nov 2021 08:56:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Harish Chegondi <harish.chegondi@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20211116014623.633687-1-harish.chegondi@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211116014623.633687-1-harish.chegondi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add checks to prevent NULL
 pointer dereference
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
Cc: matthew.auld@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi, Harish,

On 11/16/21 02:46, Harish Chegondi wrote:
> __sg_next() returns NULL if the input sg entry is the last entry in the
> list. Check the return pointer from __sg_next() to prevent NULL pointer
> dereference.

Did you actually hit a NULL pointer dereference here? I can't see how we 
could hit the last entry in the list in this way since sg_alloc_table() 
will either ensure we have sufficient entries or fail?

Thomas


> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_scatterlist.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
> index 41f2adb6a583..da9322c5d5f7 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.c
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.c
> @@ -112,6 +112,11 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
>   			if (st->nents)
>   				sg = __sg_next(sg);
>   
> +			if (!sg) {
> +				sg_free_table(st);
> +				i915_refct_sgt_put(rsgt);
> +				return ERR_PTR(-EFAULT);
> +			}
>   			sg_dma_address(sg) = region_start + offset;
>   			sg_dma_len(sg) = 0;
>   			sg->length = 0;
> @@ -191,6 +196,11 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>   				if (st->nents)
>   					sg = __sg_next(sg);
>   
> +				if (!sg) {
> +					sg_free_table(st);
> +					i915_refct_sgt_put(rsgt);
> +					return ERR_PTR(-EFAULT);
> +				}
>   				sg_dma_address(sg) = region_start + offset;
>   				sg_dma_len(sg) = 0;
>   				sg->length = 0;
