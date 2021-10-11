Return-Path: <SRS0=Rlc6=O7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEE5C433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Oct 2021 18:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9219F60F23
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Oct 2021 18:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9219F60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841936E91A;
	Mon, 11 Oct 2021 18:18:28 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF9189EB7;
 Mon, 11 Oct 2021 18:18:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="227224139"
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="227224139"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 11:18:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="440896443"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 11:18:25 -0700
Date: Mon, 11 Oct 2021 11:13:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thanneeru Srinivasulu <thanneeru.srinivasulu@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 michal.wajdeczko@intel.com
Message-ID: <20211011181340.GA9450@jons-linux-dev-box>
References: <20211011152106.3424810-1-thanneeru.srinivasulu@intel.com>
 <20211011152106.3424810-3-thanneeru.srinivasulu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011152106.3424810-3-thanneeru.srinivasulu@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915/huc: Use i915_probe_error to
 report early HuC failures
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Oct 11, 2021 at 08:51:04PM +0530, Thanneeru Srinivasulu wrote:
> Replace DRM_ERROR with i915_probe_error to report early HuC failures.
> 
> Signed-off-by: Thanneeru Srinivasulu <thanneeru.srinivasulu@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index ff4b6869b80b..ff0f5b9130c9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -179,7 +179,7 @@ int intel_huc_auth(struct intel_huc *huc)
>  	ret = intel_guc_auth_huc(guc,
>  				 intel_guc_ggtt_offset(guc, huc->rsa_data));
>  	if (ret) {
> -		DRM_ERROR("HuC: GuC did not ack Auth request %d\n", ret);
> +		i915_probe_error(gt->i915, "HuC: GuC did not ack Auth request %d\n", ret);
>  		goto fail;
>  	}
>  
> @@ -190,7 +190,7 @@ int intel_huc_auth(struct intel_huc *huc)
>  					huc->status.value,
>  					2, 50, NULL);
>  	if (ret) {
> -		DRM_ERROR("HuC: Firmware not verified %d\n", ret);
> +		i915_probe_error(gt->i915, "HuC: Firmware not verified %d\n", ret);
>  		goto fail;
>  	}
>  
> -- 
> 2.25.1
> 
