Return-Path: <SRS0=ggpC=KU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFF0C2B9F7
	for <intel-gfx@archiver.kernel.org>; Tue, 25 May 2021 01:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B415613F6
	for <intel-gfx@archiver.kernel.org>; Tue, 25 May 2021 01:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B415613F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B84889C82;
	Tue, 25 May 2021 01:09:10 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1270389993;
 Tue, 25 May 2021 01:08:34 +0000 (UTC)
IronPort-SDR: 1c3VAwDZtUCsUN0hR8Jq2wTi6jBC/F1GbxrwrR8D+5oeXpQ8QEatlrwVzs7V1+NKQN2iW5xIXA
 MNpCFNlYEYQA==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="263276317"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="263276317"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 18:08:33 -0700
IronPort-SDR: i8qgBLvxEd31rMcMqjLLmYnMNO3S1HMTbDkiNYQTXdQGXb85A2Zha5nAs+L8b1+GjP09oUkd/5
 oPtMQeAcC3Og==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="479049117"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 18:08:32 -0700
Date: Mon, 24 May 2021 18:01:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <20210525010123.GA25587@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-29-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-29-matthew.brost@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [RFC PATCH 28/97] drm/i915/guc: Kill
 guc_clients.ct_pool
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 12:13:42PM -0700, Matthew Brost wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> CTB pool is now maintained internally by the GuC as part of its
> "private data". No need to allocate separate buffer and pass it
> to GuC as yet another ADS.
> 
> GuC: 57.0.0
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  | 12 ------------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 12 +-----------
>  2 files changed, 1 insertion(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 648e1767b17a..775f00d706fa 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -25,8 +25,6 @@
>   *      +---------------------------------------+
>   *      | guc_clients_info                      |
>   *      +---------------------------------------+
> - *      | guc_ct_pool_entry[size]               |
> - *      +---------------------------------------+
>   *      | padding                               |
>   *      +---------------------------------------+ <== 4K aligned
>   *      | private data                          |
> @@ -39,7 +37,6 @@ struct __guc_ads_blob {
>  	struct guc_policies policies;
>  	struct guc_gt_system_info system_info;
>  	struct guc_clients_info clients_info;
> -	struct guc_ct_pool_entry ct_pool[GUC_CT_POOL_SIZE];
>  } __packed;
>  
>  static u32 guc_ads_private_data_size(struct intel_guc *guc)
> @@ -67,11 +64,6 @@ static void guc_policies_init(struct guc_policies *policies)
>  	policies->is_valid = 1;
>  }
>  
> -static void guc_ct_pool_entries_init(struct guc_ct_pool_entry *pool, u32 num)
> -{
> -	memset(pool, 0, num * sizeof(*pool));
> -}
> -
>  static void guc_mapping_table_init(struct intel_gt *gt,
>  				   struct guc_gt_system_info *system_info)
>  {
> @@ -157,11 +149,7 @@ static void __guc_ads_init(struct intel_guc *guc)
>  	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
>  
>  	/* Clients info  */
> -	guc_ct_pool_entries_init(blob->ct_pool, ARRAY_SIZE(blob->ct_pool));
> -
>  	blob->clients_info.clients_num = 1;
> -	blob->clients_info.ct_pool_addr = base + ptr_offset(blob, ct_pool);
> -	blob->clients_info.ct_pool_count = ARRAY_SIZE(blob->ct_pool);
>  
>  	/* ADS */
>  	blob->ads.scheduler_policies = base + ptr_offset(blob, policies);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 95db4a7d3f4d..301b173a26bc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -269,19 +269,9 @@ struct guc_gt_system_info {
>  } __packed;
>  
>  /* Clients info */
> -struct guc_ct_pool_entry {
> -	struct guc_ct_buffer_desc desc;
> -	u32 reserved[7];
> -} __packed;
> -
> -#define GUC_CT_POOL_SIZE	2
> -
>  struct guc_clients_info {
>  	u32 clients_num;
> -	u32 reserved0[13];
> -	u32 ct_pool_addr;
> -	u32 ct_pool_count;
> -	u32 reserved[4];
> +	u32 reserved[19];
>  } __packed;
>  
>  /* GuC Additional Data Struct */
> -- 
> 2.28.0
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
