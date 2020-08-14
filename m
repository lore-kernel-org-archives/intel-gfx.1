Return-Path: <SRS0=1luh=BY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C371EC433E1
	for <intel-gfx@archiver.kernel.org>; Fri, 14 Aug 2020 13:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0A0F2068E
	for <intel-gfx@archiver.kernel.org>; Fri, 14 Aug 2020 13:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0A0F2068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6476EB3C;
	Fri, 14 Aug 2020 13:44:50 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425AD6EB3C
 for <intel-gfx@lists.freedesktop.org>; Fri, 14 Aug 2020 13:44:48 +0000 (UTC)
IronPort-SDR: 8DmuU0Yu8tX0i+xtRg6G49jwRNWY8R+0cB9DO/DbvU890RyNNNmgokR6wsGSoWr9VGZwnzH1uO
 m+XyuJYkU6wA==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="155510048"
X-IronPort-AV: E=Sophos;i="5.76,312,1592895600"; d="scan'208";a="155510048"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 06:44:47 -0700
IronPort-SDR: WUjsBLgL4pqHDqCWpO/0fP1lDq8G15eUJjqkd5XO2o/doiVwV/s8z/bnx/+hLDHGPhwWhEul+n
 FxdPWkJQgSIg==
X-IronPort-AV: E=Sophos;i="5.76,312,1592895600"; d="scan'208";a="470590257"
Received: from unknown (HELO intel.com) ([10.223.74.178])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 06:44:46 -0700
Date: Fri, 14 Aug 2020 19:03:07 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Nischal Varide <nischal.varide@intel.com>
Message-ID: <20200814133306.GK30770@intel.com>
References: <20200814024950.26830-1-nischal.varide@intel.com>
 <20200814024950.26830-8-nischal.varide@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024950.26830-8-nischal.varide@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [PATCH 8/8] Critical KlockWork Error - Fixes -
 intel_combo_phy.c Uninitialized Variable-1
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 2020-08-14 at 08:19:50 +0530, Nischal Varide wrote:
> ---
>  drivers/gpu/drm/i915/display/intel_combo_phy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_combo_phy.c b/drivers/gpu/drm/i915/display/intel_combo_phy.c
> index eccaa79cb4a9..6e721b8ed611 100644
> --- a/drivers/gpu/drm/i915/display/intel_combo_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_combo_phy.c
> @@ -258,7 +258,7 @@ static bool phy_is_master(struct drm_i915_private *dev_priv, enum phy phy)
>  static bool icl_combo_phy_verify_state(struct drm_i915_private *dev_priv,
>  				       enum phy phy)
>  {
> -	bool ret;
> +	bool ret = 1;
IMHO in this function in each code flow ret is assigned with some value,
so i have not noticed any case ret could return any garbag value here.
It seems a false alarm to me.
Thanks,
Anshuman Gupta.
>  	u32 expected_val = 0;
>  
>  	if (!icl_combo_phy_enabled(dev_priv, phy))
> -- 
> 2.26.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
