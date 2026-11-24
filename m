Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7DA606A31E
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2026 19:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pk4l2KQE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B28310E649;
	Tue, 24 Nov 2026 19:59:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE1410E8BA
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 19:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795550365; x=1827086365;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bKPe3Qlhf17Isw2GjkxTJuEo4hbHY6n22BTHTjWSpIM=;
 b=Pk4l2KQEXdSnDqynyI+XPDkNGqUo6RaqJLhtmnJUofuWuoOnWCOrQkxF
 XzlFd7BjBOrQ4DMb/NSUECKlbDAn/kttlEij8CIyIih92mCRNMcaQn7ZY
 TWXQaXKJnzd1JjXNwVKE2wj2v33KVFQfQp7DS5lMqVcHSoQDTTX17yYGa
 bCa1loaUl6x0ayq7FF5Dufc756fC7FR+IBPibnjXid1/ahKSzWGrayz12
 stUbBRcJd6vMhZFJK02vJieBXw+tBHgT/eESFYHoPOywMMKrnuMXvq1WO
 qFMStCJ2nHyPfdGyG8c+CBe9TmMBnyJkslYc36jveOiHlfte+NAifxeOV A==;
X-CSE-ConnectionGUID: Em2DaVg3SXamrFD1wjCNtQ==
X-CSE-MsgGUID: RV+UTlbIQRabpKukwH2LFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4411104"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4411104"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 11:59:14 -0800
X-CSE-ConnectionGUID: MenrX5/IRaO07qDMIrQBiQ==
X-CSE-MsgGUID: X075opSJTV+bfdWPkvztsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="13677345"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.204])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 11:59:12 -0800
Date: Tue, 24 Nov 2026 21:59:09 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915/uncore: hide uncore forcewake iterators
Message-ID: <awXsjTEyzIWAIhOP@intel.com>
References: <20261124181405.1669126-1-jani.nikula@intel.com>
 <20261124181405.1669126-2-jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261124181405.1669126-2-jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 08:14:05PM +0200, Jani Nikula wrote:
> There are no users of for_each_fw_domain_masked() and
> for_each_fw_domain() left outside of intel_uncore.c. Hide them from the
> rest of the driver.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_uncore.c | 8 ++++++++
>  drivers/gpu/drm/i915/intel_uncore.h | 8 --------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 02f6000b203e..cefcec468963 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -42,6 +42,14 @@
>  #define FORCEWAKE_ACK_TIMEOUT_MS 50
>  #define GT_FIFO_TIMEOUT_MS	 10
>  
> +/* Iterate over initialised fw domains */
> +#define for_each_fw_domain_masked(domain__, mask__, uncore__, tmp__) \
> +	for (tmp__ = (mask__); tmp__ ;) \
> +		for_each_if(domain__ = (uncore__)->fw_domain[__mask_next_bit(tmp__)])
> +
> +#define for_each_fw_domain(domain__, uncore__, tmp__) \
> +	for_each_fw_domain_masked(domain__, (uncore__)->fw_domains, uncore__, tmp__)
> +

Selftests use these. Do they include the whole .c file or something?

>  struct intel_uncore *to_intel_uncore(struct drm_device *drm)
>  {
>  	return &to_i915(drm)->uncore;
> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
> index d5de6a172ff3..1819c9430181 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.h
> +++ b/drivers/gpu/drm/i915/intel_uncore.h
> @@ -175,14 +175,6 @@ struct intel_uncore {
>  	unsigned int user_forcewake_count;
>  };
>  
> -/* Iterate over initialised fw domains */
> -#define for_each_fw_domain_masked(domain__, mask__, uncore__, tmp__) \
> -	for (tmp__ = (mask__); tmp__ ;) \
> -		for_each_if(domain__ = (uncore__)->fw_domain[__mask_next_bit(tmp__)])
> -
> -#define for_each_fw_domain(domain__, uncore__, tmp__) \
> -	for_each_fw_domain_masked(domain__, (uncore__)->fw_domains, uncore__, tmp__)
> -
>  static inline bool
>  intel_uncore_has_forcewake(const struct intel_uncore *uncore)
>  {
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
