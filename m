Return-Path: <SRS0=8ese=K3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA98C4708F
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Jun 2021 09:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7193461364
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Jun 2021 09:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7193461364
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27156E9B3;
	Tue,  1 Jun 2021 09:15:54 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCFA6E9B3;
 Tue,  1 Jun 2021 09:15:53 +0000 (UTC)
IronPort-SDR: yTj46qgsVeJkEeH8Kyth8aZsyXFQq342/GrYK8e6pyBfFt4y6VMDulGyp2SFNDD/lEvw2CzaF9
 Otsh+Y5F32bg==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="190623636"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="190623636"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 02:15:52 -0700
IronPort-SDR: Bw0tk3C7d1eONPubV8f1kyR9bZ+TSKu8KpyNrFseCA1eadASP2wH92/dAbzFseIm9hc6Hhv/pw
 A19f5nJPi4nw==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="416411726"
Received: from deancarp-mobl.ger.corp.intel.com (HELO [10.213.232.28])
 ([10.213.232.28])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 02:15:50 -0700
To: YueHaibing <yuehaibing@huawei.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, chris@chris-wilson.co.uk, tvrtko.ursulin@intel.com
References: <20210528100403.21548-1-yuehaibing@huawei.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <7e60320b-3a1b-0cdc-136d-29c139b27af7@linux.intel.com>
Date: Tue, 1 Jun 2021 10:15:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210528100403.21548-1-yuehaibing@huawei.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH -next] drm/i915: use DEVICE_ATTR_RO macro
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 28/05/2021 11:04, YueHaibing wrote:
> Use DEVICE_ATTR_RO() helper instead of plain DEVICE_ATTR(),
> which makes the code a bit shorter and easier to read.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/gpu/drm/i915/i915_pmu.c   |  8 +++-----
>   drivers/gpu/drm/i915/i915_sysfs.c | 30 +++++++++++++++---------------
>   2 files changed, 18 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 41651ac255fa..fb215929b05b 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -834,15 +834,13 @@ static ssize_t i915_pmu_event_show(struct device *dev,
>   	return sprintf(buf, "config=0x%lx\n", eattr->val);
>   }
>   
> -static ssize_t
> -i915_pmu_get_attr_cpumask(struct device *dev,
> -			  struct device_attribute *attr,
> -			  char *buf)
> +static ssize_t cpumask_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
>   {
>   	return cpumap_print_to_pagebuf(true, buf, &i915_pmu_cpumask);
>   }
>   
> -static DEVICE_ATTR(cpumask, 0444, i915_pmu_get_attr_cpumask, NULL);
> +static DEVICE_ATTR_RO(cpumask);
>   
>   static struct attribute *i915_cpumask_attrs[] = {
>   	&dev_attr_cpumask.attr,
> diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
> index 4c6b5d52b5ca..183517d1a73d 100644
> --- a/drivers/gpu/drm/i915/i915_sysfs.c
> +++ b/drivers/gpu/drm/i915/i915_sysfs.c
> @@ -58,8 +58,8 @@ static u32 calc_residency(struct drm_i915_private *dev_priv,
>   	return DIV_ROUND_CLOSEST_ULL(res, 1000);
>   }
>   
> -static ssize_t
> -show_rc6_mask(struct device *kdev, struct device_attribute *attr, char *buf)
> +static ssize_t rc6_enable_show(struct device *kdev,
> +			       struct device_attribute *attr, char *buf)
>   {
>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>   	unsigned int mask;
> @@ -75,43 +75,43 @@ show_rc6_mask(struct device *kdev, struct device_attribute *attr, char *buf)
>   	return sysfs_emit(buf, "%x\n", mask);
>   }
>   
> -static ssize_t
> -show_rc6_ms(struct device *kdev, struct device_attribute *attr, char *buf)
> +static ssize_t rc6_residency_ms_show(struct device *kdev,
> +				     struct device_attribute *attr, char *buf)
>   {
>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>   	u32 rc6_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6);
>   	return sysfs_emit(buf, "%u\n", rc6_residency);
>   }
>   
> -static ssize_t
> -show_rc6p_ms(struct device *kdev, struct device_attribute *attr, char *buf)
> +static ssize_t rc6p_residency_ms_show(struct device *kdev,
> +				      struct device_attribute *attr, char *buf)
>   {
>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>   	u32 rc6p_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6p);
>   	return sysfs_emit(buf, "%u\n", rc6p_residency);
>   }
>   
> -static ssize_t
> -show_rc6pp_ms(struct device *kdev, struct device_attribute *attr, char *buf)
> +static ssize_t rc6pp_residency_ms_show(struct device *kdev,
> +				       struct device_attribute *attr, char *buf)
>   {
>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>   	u32 rc6pp_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6pp);
>   	return sysfs_emit(buf, "%u\n", rc6pp_residency);
>   }
>   
> -static ssize_t
> -show_media_rc6_ms(struct device *kdev, struct device_attribute *attr, char *buf)
> +static ssize_t media_rc6_residency_ms_show(struct device *kdev,
> +					   struct device_attribute *attr, char *buf)
>   {
>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>   	u32 rc6_residency = calc_residency(dev_priv, VLV_GT_MEDIA_RC6);
>   	return sysfs_emit(buf, "%u\n", rc6_residency);
>   }
>   
> -static DEVICE_ATTR(rc6_enable, S_IRUGO, show_rc6_mask, NULL);
> -static DEVICE_ATTR(rc6_residency_ms, S_IRUGO, show_rc6_ms, NULL);
> -static DEVICE_ATTR(rc6p_residency_ms, S_IRUGO, show_rc6p_ms, NULL);
> -static DEVICE_ATTR(rc6pp_residency_ms, S_IRUGO, show_rc6pp_ms, NULL);
> -static DEVICE_ATTR(media_rc6_residency_ms, S_IRUGO, show_media_rc6_ms, NULL);
> +static DEVICE_ATTR_RO(rc6_enable);
> +static DEVICE_ATTR_RO(rc6_residency_ms);
> +static DEVICE_ATTR_RO(rc6p_residency_ms);
> +static DEVICE_ATTR_RO(rc6pp_residency_ms);
> +static DEVICE_ATTR_RO(media_rc6_residency_ms);
>   
>   static struct attribute *rc6_attrs[] = {
>   	&dev_attr_rc6_enable.attr,
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
