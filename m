Return-Path: <SRS0=emkq=FB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF1FC2D0E4
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 10:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1143206D8
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 10:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1143206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA226EB8D;
	Fri, 27 Nov 2020 10:31:45 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098DD6EB8D
 for <intel-gfx@lists.freedesktop.org>; Fri, 27 Nov 2020 10:31:42 +0000 (UTC)
IronPort-SDR: zTeuibL1BF7RX22X8r6ceJL5KQH8/a0dPg9AmVJ91T8mHQp4bRz06tiK8VxBfBtUDBLGCC7M1M
 C61ohPVAA3+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172532646"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172532646"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 02:31:42 -0800
IronPort-SDR: p59ETYrz8oPP9dtuICozKwCzu+IXt0ou1DgoAWUFQPkJ7PwAO9JFvh5IZfZo+7uX/zJ8D6e0Ld
 k6jvXeUsX4Sg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="537600217"
Received: from einatsch-mobl.ger.corp.intel.com (HELO [10.214.245.41])
 ([10.214.245.41])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 02:31:40 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20201127102540.13117-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <fe3cc95e-342d-4e3b-2821-853421e8e32c@linux.intel.com>
Date: Fri, 27 Nov 2020 10:31:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201127102540.13117-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Declare gen9 has 64 mocs
 entries!
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
Cc: stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 27/11/2020 10:25, Chris Wilson wrote:
> We checked the table size against a hardcoded number of entries, and
> that number was excluding the special mocs registers at the end.
> 
> Fixes: 977933b5da7c ("drm/i915/gt: Program mocs:63 for cache eviction on gen9")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: <stable@vger.kernel.org> # v4.3+
> ---
>   drivers/gpu/drm/i915/gt/intel_mocs.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
> index b8d0c32ae9dd..ab6870242e18 100644
> --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
> @@ -59,8 +59,7 @@ struct drm_i915_mocs_table {
>   #define _L3_CACHEABILITY(value)	((value) << 4)
>   
>   /* Helper defines */
> -#define GEN9_NUM_MOCS_ENTRIES	62  /* 62 out of 64 - 63 & 64 are reserved. */
> -#define GEN11_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
> +#define GEN9_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
>   
>   /* (e)LLC caching options */
>   /*
> @@ -361,15 +360,15 @@ static unsigned int get_mocs_settings(const struct drm_i915_private *i915,
>   	if (IS_DG1(i915)) {
>   		table->size = ARRAY_SIZE(dg1_mocs_table);
>   		table->table = dg1_mocs_table;
> -		table->n_entries = GEN11_NUM_MOCS_ENTRIES;
> +		table->n_entries = GEN9_NUM_MOCS_ENTRIES;
>   	} else if (INTEL_GEN(i915) >= 12) {
>   		table->size  = ARRAY_SIZE(tgl_mocs_table);
>   		table->table = tgl_mocs_table;
> -		table->n_entries = GEN11_NUM_MOCS_ENTRIES;
> +		table->n_entries = GEN9_NUM_MOCS_ENTRIES;
>   	} else if (IS_GEN(i915, 11)) {
>   		table->size  = ARRAY_SIZE(icl_mocs_table);
>   		table->table = icl_mocs_table;
> -		table->n_entries = GEN11_NUM_MOCS_ENTRIES;
> +		table->n_entries = GEN9_NUM_MOCS_ENTRIES;
>   	} else if (IS_GEN9_BC(i915) || IS_CANNONLAKE(i915)) {
>   		table->size  = ARRAY_SIZE(skl_mocs_table);
>   		table->n_entries = GEN9_NUM_MOCS_ENTRIES;
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
