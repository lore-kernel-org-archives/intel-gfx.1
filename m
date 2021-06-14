Return-Path: <SRS0=Eks7=LI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82E3C2B9F4
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Jun 2021 19:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 923EB61166
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Jun 2021 19:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 923EB61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D891C899D4;
	Mon, 14 Jun 2021 19:51:44 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF7B8981D;
 Mon, 14 Jun 2021 19:51:43 +0000 (UTC)
IronPort-SDR: qKxiC5ysi0zAlTU5iaLWiy2XmezdTcPnC8EA1e4Bcou26JfYrkf0D7mii8dd2OsEtxOfPYMtlf
 5lG6df+Rk8gQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="269719409"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="269719409"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 12:51:42 -0700
IronPort-SDR: m88ygSvo7E/vjZg+MtxsfyCpN8NpGLZy7HRZHP/iewDB5ydlbQDkfdWmRy/SVnCWEpRGVPRVD1
 iBrgKJAskEYQ==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="420882308"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 12:51:42 -0700
Date: Mon, 14 Jun 2021 12:44:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John.C.Harrison@Intel.com
Message-ID: <20210614194450.GA29647@sdutt-i7>
References: <20210610215247.2996757-1-John.C.Harrison@Intel.com>
 <20210610215247.2996757-3-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610215247.2996757-3-John.C.Harrison@Intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [PATCH i-g-t 2/2] tests/i915/query: Add test for L3
 bank count
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
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 02:52:47PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Various UMDs need to know the L3 bank count. So a query API has been
> added for it. Test that query.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  include/drm-uapi/i915_drm.h |  1 +
>  tests/i915/i915_query.c     | 35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
> index 5c34ab759..191820532 100644
> --- a/include/drm-uapi/i915_drm.h
> +++ b/include/drm-uapi/i915_drm.h
> @@ -2234,6 +2234,7 @@ struct drm_i915_query_item {
>  #define DRM_I915_QUERY_PERF_CONFIG      3
>  #define DRM_I915_QUERY_MEMORY_REGIONS   4
>  #define DRM_I915_QUERY_HWCONFIG_TABLE   5
> +#define DRM_I915_QUERY_L3_BANK_COUNT    6
>  /* Must be kept compact -- no holes and well documented */
>  
>  	/**
> diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
> index eef4afb05..17948e0d8 100644
> --- a/tests/i915/i915_query.c
> +++ b/tests/i915/i915_query.c
> @@ -849,6 +849,38 @@ static void query_parse_and_validate_hwconfig_table(int i915)
>  	free(data);
>  }
>  
> +static int query_engine_l3_bank_count(int fd)
> +{
> +	uint32_t *banks;
> +	struct drm_i915_query_item size = {
> +		.query_id = DRM_I915_QUERY_L3_BANK_COUNT,
> +	};
> +	struct drm_i915_query_item query = {
> +		.query_id = DRM_I915_QUERY_L3_BANK_COUNT,
> +	};

I believe you could just one of the local variables, right? I see the
comparison for 'query.length == size.length' but you store the length a
u32 rather than a struct.

Just a suggestion but not a blocker, with that:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +	int num_counts, i;
> +
> +	i915_query_items(fd, &size, 1);
> +	igt_require(size.length > 0);
> +
> +	num_counts = size.length / sizeof(*banks);
> +	igt_info("size = %d, count = %d => %ld\n", size.length, num_counts, num_counts * sizeof(*banks));
> +	igt_assert(size.length == (num_counts * sizeof(*banks)));
> +
> +	banks = malloc(size.length);
> +	igt_assert(banks);
> +	query.data_ptr = to_user_pointer(banks);
> +	query.length = size.length;
> +
> +	i915_query_items(fd, &query, 1);
> +	igt_assert(query.length == size.length);
> +	for (i = 0; i < num_counts; i++)
> +		igt_info("Bank count #%d: %d\n", i, banks[i]);
> +
> +	free(banks);
> +	return 0;
> +}
> +
>  igt_main
>  {
>  	int fd = -1;
> @@ -911,6 +943,9 @@ igt_main
>  	igt_subtest("hwconfig_table")
>  		query_parse_and_validate_hwconfig_table(fd);
>  
> +	igt_subtest("l3_banks")
> +		query_engine_l3_bank_count(fd);
> +
>  	igt_fixture {
>  		close(fd);
>  	}
> -- 
> 2.25.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
