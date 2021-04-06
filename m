Return-Path: <SRS0=ARrU=JD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146E4C433B4
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Apr 2021 12:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74B566121E
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Apr 2021 12:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74B566121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64406E41A;
	Tue,  6 Apr 2021 12:26:30 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF94E6E3EE;
 Tue,  6 Apr 2021 12:26:28 +0000 (UTC)
IronPort-SDR: T6e8aX6D3mXSXhfvawKbeAtbvnuu9H5nkC1zqbU7uQXSpwLAsXMoqHYzt8X42nphnTgKz1pNs5
 MJosPZvBlwNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="278313897"
X-IronPort-AV: E=Sophos;i="5.81,309,1610438400"; d="scan'208";a="278313897"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 05:26:28 -0700
IronPort-SDR: 8lKa5n8Ae2HzZHCFbou4Yvgz+CvYTNxLDETcl6LhmceLHj4saiIoum14LlgTHgQtWfX7shLQj2
 wyS9WyPwUmoA==
X-IronPort-AV: E=Sophos;i="5.81,309,1610438400"; d="scan'208";a="421195694"
Received: from oowomilo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.33.55])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 05:26:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Carlis <llyz108@163.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
In-Reply-To: <20210404084103.528211-1-llyz108@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210404084103.528211-1-llyz108@163.com>
Date: Tue, 06 Apr 2021 15:26:20 +0300
Message-ID: <87k0pflhub.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/sysfs: convert snprintf to
 sysfs_emit
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
Cc: Xuezhi Zhang <zhangxuezhi1@yulong.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Sun, 04 Apr 2021, Carlis <llyz108@163.com> wrote:
> From: Xuezhi Zhang <zhangxuezhi1@yulong.com>
>
> Fix the following coccicheck warning:
> drivers/gpu/drm/i915//i915_sysfs.c:266:8-16: 
> WARNING: use scnprintf or sprintf
> drivers/gpu/drm/i915//i915_sysfs.c:285:8-16: 
> WARNING: use scnprintf or sprintf
> drivers/gpu/drm/i915//i915_sysfs.c:276:8-16: 
> WARNING: use scnprintf or sprintf
> drivers/gpu/drm/i915//i915_sysfs.c:335:8-16: 
> WARNING: use scnprintf or sprintf
> drivers/gpu/drm/i915//i915_sysfs.c:390:8-16: 
> WARNING: use scnprintf or sprintf
> drivers/gpu/drm/i915//i915_sysfs.c:465:8-16: 
> WARNING: use scnprintf or sprintf
> drivers/gpu/drm/i915//i915_sysfs.c:107:8-16: 
> WARNING: use scnprintf or sprintf
> drivers/gpu/drm/i915//i915_sysfs.c:75:8-16: 
> WARNING: use scnprintf or sprintf
> drivers/gpu/drm/i915//i915_sysfs.c:83:8-16: 
> WARNING: use scnprintf or sprintf
> drivers/gpu/drm/i915//i915_sysfs.c:91:8-16: 
> WARNING: use scnprintf or sprintf
> drivers/gpu/drm/i915//i915_sysfs.c:99:8-16: 
> WARNING: use scnprintf or sprintf
> drivers/gpu/drm/i915//i915_sysfs.c:326:8-16: 
> WARNING: use scnprintf or sprintf
>
> Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>

Thanks for the patch, pushed to drm-intel-next.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/i915_sysfs.c | 30 ++++++++++++------------------
>  1 file changed, 12 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
> index 45d32ef42787..4c6b5d52b5ca 100644
> --- a/drivers/gpu/drm/i915/i915_sysfs.c
> +++ b/drivers/gpu/drm/i915/i915_sysfs.c
> @@ -72,7 +72,7 @@ show_rc6_mask(struct device *kdev, struct device_attribute *attr, char *buf)
>  	if (HAS_RC6pp(dev_priv))
>  		mask |= BIT(2);
>  
> -	return snprintf(buf, PAGE_SIZE, "%x\n", mask);
> +	return sysfs_emit(buf, "%x\n", mask);
>  }
>  
>  static ssize_t
> @@ -80,7 +80,7 @@ show_rc6_ms(struct device *kdev, struct device_attribute *attr, char *buf)
>  {
>  	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>  	u32 rc6_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6);
> -	return snprintf(buf, PAGE_SIZE, "%u\n", rc6_residency);
> +	return sysfs_emit(buf, "%u\n", rc6_residency);
>  }
>  
>  static ssize_t
> @@ -88,7 +88,7 @@ show_rc6p_ms(struct device *kdev, struct device_attribute *attr, char *buf)
>  {
>  	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>  	u32 rc6p_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6p);
> -	return snprintf(buf, PAGE_SIZE, "%u\n", rc6p_residency);
> +	return sysfs_emit(buf, "%u\n", rc6p_residency);
>  }
>  
>  static ssize_t
> @@ -96,7 +96,7 @@ show_rc6pp_ms(struct device *kdev, struct device_attribute *attr, char *buf)
>  {
>  	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>  	u32 rc6pp_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6pp);
> -	return snprintf(buf, PAGE_SIZE, "%u\n", rc6pp_residency);
> +	return sysfs_emit(buf, "%u\n", rc6pp_residency);
>  }
>  
>  static ssize_t
> @@ -104,7 +104,7 @@ show_media_rc6_ms(struct device *kdev, struct device_attribute *attr, char *buf)
>  {
>  	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>  	u32 rc6_residency = calc_residency(dev_priv, VLV_GT_MEDIA_RC6);
> -	return snprintf(buf, PAGE_SIZE, "%u\n", rc6_residency);
> +	return sysfs_emit(buf, "%u\n", rc6_residency);
>  }
>  
>  static DEVICE_ATTR(rc6_enable, S_IRUGO, show_rc6_mask, NULL);
> @@ -263,8 +263,7 @@ static ssize_t gt_act_freq_mhz_show(struct device *kdev,
>  	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
>  	struct intel_rps *rps = &i915->gt.rps;
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n",
> -			intel_rps_read_actual_frequency(rps));
> +	return sysfs_emit(buf, "%d\n", intel_rps_read_actual_frequency(rps));
>  }
>  
>  static ssize_t gt_cur_freq_mhz_show(struct device *kdev,
> @@ -273,8 +272,7 @@ static ssize_t gt_cur_freq_mhz_show(struct device *kdev,
>  	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
>  	struct intel_rps *rps = &i915->gt.rps;
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n",
> -			intel_gpu_freq(rps, rps->cur_freq));
> +	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->cur_freq));
>  }
>  
>  static ssize_t gt_boost_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
> @@ -282,8 +280,7 @@ static ssize_t gt_boost_freq_mhz_show(struct device *kdev, struct device_attribu
>  	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
>  	struct intel_rps *rps = &i915->gt.rps;
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n",
> -			intel_gpu_freq(rps, rps->boost_freq));
> +	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->boost_freq));
>  }
>  
>  static ssize_t gt_boost_freq_mhz_store(struct device *kdev,
> @@ -323,8 +320,7 @@ static ssize_t vlv_rpe_freq_mhz_show(struct device *kdev,
>  	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>  	struct intel_rps *rps = &dev_priv->gt.rps;
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n",
> -			intel_gpu_freq(rps, rps->efficient_freq));
> +	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->efficient_freq));
>  }
>  
>  static ssize_t gt_max_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
> @@ -332,8 +328,7 @@ static ssize_t gt_max_freq_mhz_show(struct device *kdev, struct device_attribute
>  	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>  	struct intel_rps *rps = &dev_priv->gt.rps;
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n",
> -			intel_gpu_freq(rps, rps->max_freq_softlimit));
> +	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->max_freq_softlimit));
>  }
>  
>  static ssize_t gt_max_freq_mhz_store(struct device *kdev,
> @@ -387,8 +382,7 @@ static ssize_t gt_min_freq_mhz_show(struct device *kdev, struct device_attribute
>  	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>  	struct intel_rps *rps = &dev_priv->gt.rps;
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n",
> -			intel_gpu_freq(rps, rps->min_freq_softlimit));
> +	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->min_freq_softlimit));
>  }
>  
>  static ssize_t gt_min_freq_mhz_store(struct device *kdev,
> @@ -462,7 +456,7 @@ static ssize_t gt_rp_mhz_show(struct device *kdev, struct device_attribute *attr
>  	else
>  		BUG();
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n", val);
> +	return sysfs_emit(buf, "%d\n", val);
>  }
>  
>  static const struct attribute * const gen6_attrs[] = {

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
