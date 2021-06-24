Return-Path: <SRS0=foSz=LS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13BDC49EA6
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 13:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F4E1613C7
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 13:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F4E1613C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E15F6EB97;
	Thu, 24 Jun 2021 13:50:00 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933186EB97;
 Thu, 24 Jun 2021 13:49:59 +0000 (UTC)
IronPort-SDR: kdl3hAupScRE5GyD24swstIYdLoLdfhhitH33RpszMhmqPNbV/DVFL04VCrBo1AH8xoMuaJBbG
 bDzfFz/ux6UQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="204462749"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="204462749"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 06:49:58 -0700
IronPort-SDR: uuSFlDuYmC1vD/gXMI7yM5HUeAHT7moW9EAEtCtMmJzENNjXwZ/MIA7PO/5NGnbcLcDwdq0GhP
 RYxw6PUqqUsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="639795382"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga006.fm.intel.com with ESMTP; 24 Jun 2021 06:49:57 -0700
Received: from [10.249.129.39] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.129.39])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 15ODnut2016371; Thu, 24 Jun 2021 14:49:56 +0100
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-4-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <0b04e2ee-f5f3-3eb9-ad9f-a595f1942e4c@intel.com>
Date: Thu, 24 Jun 2021 15:49:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-4-matthew.brost@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 03/47] drm/i915/guc: Increase size of CTB
 buffers
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



On 24.06.2021 09:04, Matthew Brost wrote:
> With the introduction of non-blocking CTBs more than one CTB can be in
> flight at a time. Increasing the size of the CTBs should reduce how
> often software hits the case where no space is available in the CTB
> buffer.
> 
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 07f080ddb9ae..a17215920e58 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -58,11 +58,16 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
>   *      +--------+-----------------------------------------------+------+
>   *
>   * Size of each `CT Buffer`_ must be multiple of 4K.
> - * As we don't expect too many messages, for now use minimum sizes.
> + * We don't expect too many messages in flight at any time, unless we are
> + * using the GuC submission. In that case each request requires a minimum
> + * 2 dwords which gives us a maximum 256 queue'd requests. Hopefully this
> + * enough space to avoid backpressure on the driver. We increase the size
> + * of the receive buffer (relative to the send) to ensure a G2H response
> + * CTB has a landing spot.
>   */
>  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
>  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> -#define CTB_G2H_BUFFER_SIZE	(SZ_4K)
> +#define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
>  
>  struct ct_request {
>  	struct list_head link;
> @@ -641,7 +646,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>  	/* beware of buffer wrap case */
>  	if (unlikely(available < 0))
>  		available += size;
> -	CT_DEBUG(ct, "available %d (%u:%u)\n", available, head, tail);
> +	CT_DEBUG(ct, "available %d (%u:%u:%u)\n", available, head, tail, size);

CTB size is already printed in intel_guc_ct_init() and is fixed so not
sure if repeating it on every ct_read has any benefit

>  	GEM_BUG_ON(available < 0);
>  
>  	header = cmds[head];
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
