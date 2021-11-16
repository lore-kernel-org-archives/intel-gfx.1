Return-Path: <SRS0=oPCP=QD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1016C433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Nov 2021 16:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ABBD60F22
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Nov 2021 16:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8ABBD60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00124896E4;
	Tue, 16 Nov 2021 16:43:00 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1AF896E4;
 Tue, 16 Nov 2021 16:43:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="297151928"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="297151928"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:42:59 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="494525139"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:42:59 -0800
Date: Tue, 16 Nov 2021 08:37:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20211116163723.GA14280@jons-linux-dev-box>
References: <20211116114558.GA11936@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116114558.GA11936@kili>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix error pointer dereference in
 i915_gem_do_execbuffer()
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 02:48:17PM +0300, Dan Carpenter wrote:
> Originally "out_fence" was set using out_fence = sync_file_create() but
> which returns NULL, but now it is set with out_fence = eb_requests_create()
> which returns error pointers.  The error path needs to be modified to
> avoid an Oops in the "goto err_request;" path.
> 
> Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the fix. LGTM. With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 4d7da07442f2..9b24d9b5ade1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -3277,6 +3277,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  	out_fence = eb_requests_create(&eb, in_fence, out_fence_fd);
>  	if (IS_ERR(out_fence)) {
>  		err = PTR_ERR(out_fence);
> +		out_fence = NULL;
>  		if (eb.requests[0])
>  			goto err_request;
>  		else
> -- 
> 2.20.1
> 
