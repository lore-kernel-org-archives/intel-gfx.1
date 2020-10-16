Return-Path: <SRS0=PmWI=DX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0209C433DF
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Oct 2020 08:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 009052080A
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Oct 2020 08:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 009052080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F586EA9E;
	Fri, 16 Oct 2020 08:17:10 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C876EA9E;
 Fri, 16 Oct 2020 08:17:09 +0000 (UTC)
IronPort-SDR: GXGXb3avMOJpmlKpG0uuV6f1k4kdxmJyFQq+LresBmFYg+QWhoHxPEf2QclPjigsMef2UnnCHX
 QY1tUXcopRxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="166624652"
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; d="scan'208";a="166624652"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 01:17:09 -0700
IronPort-SDR: ksFzsufU/YLmsJOeKmP8eA3ueP6zKnx3ow6nse4vGUbuamrZrFblGodHXq2eXDTAunLUOlbexd
 gdy1zE0Yi8Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; d="scan'208";a="314820660"
Received: from unknown (HELO [10.239.160.24]) ([10.239.160.24])
 by orsmga003.jf.intel.com with ESMTP; 16 Oct 2020 01:17:07 -0700
To: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 zhenyuw@linux.intel.com
References: <20201016081353.376670-1-colin.xu@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <5010efb2-a1ce-d746-5210-171ac9f0db2b@intel.com>
Date: Fri, 16 Oct 2020 16:17:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201016081353.376670-1-colin.xu@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v5 2/2] drm/i915/gvt: Add GVT suspend/resume
 routine to i915
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
Reply-To: Colin.Xu@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 2020-10-16 16:13, Colin Xu wrote:
> This patch add gvt suspend/resume wrapper into i915: i915_drm_suspend()
> and i915_drm_resume(). GVT relies on i915 so suspend gvt ahead of other
> i915 sub-routine and resume gvt at last.
>
> V2:
> - Direct call into gvt suspend/resume wrapper in intel_gvt.h/intel_gvt.c.
> The wrapper and implementation will check and call gvt routine. (zhenyu)
>
> V3:
> Refresh.
>
> V4:
> Rebase.
>
> V5:
> Fail intel_gvt_suspend() if fail to save GGTT.
>
> Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_drv.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index 8bb7e2dcfaaa..b3203292b0ee 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -1104,6 +1104,9 @@ static int i915_drm_suspend(struct drm_device *dev)
>   
>   	drm_kms_helper_poll_disable(dev);
>   
> +	if (intel_gvt_suspend(dev_priv))
> +		drm_err(&dev_priv->drm, "failed to suspend GVT\n");
I'm not quite sure if it's OK to fail i915_drm_suspend() here if 
intel_gvt_suspend() fails. I saw intel_display_suspend() may also return 
failure but i915_drm_suspend() doesn't handle such case so I just follow 
the style for intel_gvt_suspend().
> +
>   	pci_save_state(pdev);
>   
>   	intel_display_suspend(dev);
> @@ -1281,6 +1284,8 @@ static int i915_drm_resume(struct drm_device *dev)
>   
>   	intel_power_domains_enable(dev_priv);
>   
> +	intel_gvt_resume(dev_priv);
> +
>   	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>   
>   	return 0;

-- 
Best Regards,
Colin Xu

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
