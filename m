Return-Path: <SRS0=J6ZK=G5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199CDC433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 17:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9BDE20DD4
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 17:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9BDE20DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61B889C9C;
	Tue, 26 Jan 2021 17:13:30 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA1889C9C
 for <intel-gfx@lists.freedesktop.org>; Tue, 26 Jan 2021 17:13:29 +0000 (UTC)
IronPort-SDR: xrMi22yXp7dhinxL7LlqOzvrZNCLYjKTbOnmBapKrOM92YXHgdRtzivasdAzyg4RfADnILLHC6
 daCQwSq9/+sQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="176427012"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="176427012"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 09:13:29 -0800
IronPort-SDR: OXZ34r+08vxRstAUoUC/eYgYMaAn0KjywLPK+3BvsfUfG4SW5ctPJTqosoHEdJIBiBNWVfhvQC
 3npLHiHMvSHw==
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="362058358"
Received: from jackedwa-mobl.ger.corp.intel.com (HELO [10.214.230.137])
 ([10.214.230.137])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 09:13:27 -0800
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20200106234703.645168-1-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <cc82f99e-9a78-215d-32ad-a1c9ac2afac9@linux.intel.com>
Date: Tue, 26 Jan 2021 17:13:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20200106234703.645168-1-matthew.auld@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gtt: split up i915_gem_gtt
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>



On 06/01/2020 23:47, Matthew Auld wrote:
> Attempt to split i915_gem_gtt.[ch] into more manageable chunks.

> +void clear_pages(struct i915_vma *vma)
> +{
> +	GEM_BUG_ON(!vma->pages);
> +
> +	if (vma->pages != vma->obj->mm.pages) {
> +		sg_free_table(vma->pages);
> +		kfree(vma->pages);
> +	}
> +	vma->pages = NULL;
> +
> +	memset(&vma->page_sizes, 0, sizeof(vma->page_sizes));
> +}

We probably want to add a prefix now that the function is exported.

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
