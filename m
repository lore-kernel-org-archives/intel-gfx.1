Return-Path: <SRS0=RQjs=EF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19D4C4741F
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2020 15:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 586D52071A
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2020 15:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 586D52071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B566EDC6;
	Fri, 30 Oct 2020 15:08:07 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE1A6EDC6
 for <intel-gfx@lists.freedesktop.org>; Fri, 30 Oct 2020 15:08:05 +0000 (UTC)
IronPort-SDR: Ct/UTdGJQIFlkP5GHH0payWOTsZ3NEcQY2+qdF4zJKW+2RsqIl5QEp+vptEbL11J5gJ0mfUAnR
 BMZB2vnWH2qQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="253327537"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="253327537"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 08:08:05 -0700
IronPort-SDR: nuQl9fTmPxkzqTKv/FR3Rf0mjwYoW5RAHE8qY6Ew9H8b03srGC1aWzYgenIFriEAbi48FW2ATx
 ShZEH85jtLxw==
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="537095404"
Received: from sfhansen-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.254.46])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 08:08:04 -0700
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20201016104444.1492028-1-maarten.lankhorst@linux.intel.com>
 <20201016104444.1492028-21-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <1b38a307-0d57-9abd-d72d-a0e783b39183@linux.intel.com>
Date: Fri, 30 Oct 2020 16:08:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201016104444.1492028-21-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v4 20/61] drm/i915: Rework clflush to work
 correctly without obj->mm.lock.
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


On 10/16/20 12:44 PM, Maarten Lankhorst wrote:
> Pin in the caller, not in the work itself. This should also
> work better for dma-fence annotations.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_clflush.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> index bc0223716906..daf9284ef1f5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> @@ -27,15 +27,8 @@ static void __do_clflush(struct drm_i915_gem_object *obj)
>   static int clflush_work(struct dma_fence_work *base)
>   {
>   	struct clflush *clflush = container_of(base, typeof(*clflush), base);
> -	struct drm_i915_gem_object *obj = clflush->obj;
> -	int err;
>   
> -	err = i915_gem_object_pin_pages(obj);
> -	if (err)
> -		return err;
> -
> -	__do_clflush(obj);
> -	i915_gem_object_unpin_pages(obj);
> +	__do_clflush(clflush->obj);
>   
>   	return 0;
>   }
> @@ -44,6 +37,7 @@ static void clflush_release(struct dma_fence_work *base)
>   {
>   	struct clflush *clflush = container_of(base, typeof(*clflush), base);
>   
> +	i915_gem_object_unpin_pages(clflush->obj);

Hmm, Could we do without pinning here? Pages present are protected first 
by the object lock, then by the fence?

/Thomas



_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
