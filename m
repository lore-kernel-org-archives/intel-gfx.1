Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1058B606A326
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2026 13:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M3/64PZe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8F410FC73;
	Wed, 25 Nov 2026 13:59:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4174E10FC73
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Nov 2026 13:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795615181; x=1827151181;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZlBIpR684suIgAO9dUiY/yXD1lgy5uzDDC+mclN+0E8=;
 b=M3/64PZeu4XLVS0OcBald/TfxVfBoTZ5OLO4C4LLaNqq1jmC+NE+aIeX
 AoKg5wOuZG8Jnss5BnOew3gU7udoR4O2y63adrAicw//DnqlXH10oEeEV
 exOIeF2ZaVMchQiYumOj8lA1WS2MLZk7Mt9L5s8l8/G4TLHxlULfz4shF
 fEkSil+tQPxCs6VGqkPyMNcKwYkOjfXFscNr3thiFSVDF9tTbDx/jOa6q
 cBqzubP2ltlzIUjby0akmTVuR+sPbbPrD4MChy76OLEPlCCa4o1C25TnN
 rOf2vUWYLxxG9pULBcScemp5Z68Ll3StKt15uxvc6xaApN7tXb3UyvpN5 g==;
X-CSE-ConnectionGUID: BCzwyyLdR4GDPDdc6AUP2w==
X-CSE-MsgGUID: kZ44rjUZTAW+tw9HzDgizA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4397594"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4397594"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 05:59:40 -0800
X-CSE-ConnectionGUID: Pdy9vpwzRK2bVF6PwjNpdA==
X-CSE-MsgGUID: kEIqedFcTs+vXHjBGtZ1CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="12347712"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 05:59:39 -0800
Date: Wed, 25 Nov 2026 15:59:35 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915/uncore: hide uncore forcewake iterators
Message-ID: <awbpx5Rcrc677txa@intel.com>
References: <20261124181405.1669126-1-jani.nikula@intel.com>
 <20261124181405.1669126-2-jani.nikula@intel.com>
 <awXsjTEyzIWAIhOP@intel.com>
 <2fc2f86379a7db6bb8e3b91707aeaf01354362ab@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fc2f86379a7db6bb8e3b91707aeaf01354362ab@intel.com>
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

On Wed, Nov 25, 2026 at 11:12:11AM +0200, Jani Nikula wrote:
> On Tue, 24 Nov 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Tue, Nov 24, 2026 at 08:14:05PM +0200, Jani Nikula wrote:
> >> There are no users of for_each_fw_domain_masked() and
> >> for_each_fw_domain() left outside of intel_uncore.c. Hide them from the
> >> rest of the driver.
> >> 
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/intel_uncore.c | 8 ++++++++
> >>  drivers/gpu/drm/i915/intel_uncore.h | 8 --------
> >>  2 files changed, 8 insertions(+), 8 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> >> index 02f6000b203e..cefcec468963 100644
> >> --- a/drivers/gpu/drm/i915/intel_uncore.c
> >> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> >> @@ -42,6 +42,14 @@
> >>  #define FORCEWAKE_ACK_TIMEOUT_MS 50
> >>  #define GT_FIFO_TIMEOUT_MS	 10
> >>  
> >> +/* Iterate over initialised fw domains */
> >> +#define for_each_fw_domain_masked(domain__, mask__, uncore__, tmp__) \
> >> +	for (tmp__ = (mask__); tmp__ ;) \
> >> +		for_each_if(domain__ = (uncore__)->fw_domain[__mask_next_bit(tmp__)])
> >> +
> >> +#define for_each_fw_domain(domain__, uncore__, tmp__) \
> >> +	for_each_fw_domain_masked(domain__, (uncore__)->fw_domains, uncore__, tmp__)
> >> +
> >
> > Selftests use these. Do they include the whole .c file or something?
> 
> Yes. I hate it, but I'm dodging that battle.

Hmm, yeah looks like the normal file includes the selftest file
at the end. I was first looking for the opposite and was confused 
when I didn't find it.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> >
> >>  struct intel_uncore *to_intel_uncore(struct drm_device *drm)
> >>  {
> >>  	return &to_i915(drm)->uncore;
> >> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
> >> index d5de6a172ff3..1819c9430181 100644
> >> --- a/drivers/gpu/drm/i915/intel_uncore.h
> >> +++ b/drivers/gpu/drm/i915/intel_uncore.h
> >> @@ -175,14 +175,6 @@ struct intel_uncore {
> >>  	unsigned int user_forcewake_count;
> >>  };
> >>  
> >> -/* Iterate over initialised fw domains */
> >> -#define for_each_fw_domain_masked(domain__, mask__, uncore__, tmp__) \
> >> -	for (tmp__ = (mask__); tmp__ ;) \
> >> -		for_each_if(domain__ = (uncore__)->fw_domain[__mask_next_bit(tmp__)])
> >> -
> >> -#define for_each_fw_domain(domain__, uncore__, tmp__) \
> >> -	for_each_fw_domain_masked(domain__, (uncore__)->fw_domains, uncore__, tmp__)
> >> -
> >>  static inline bool
> >>  intel_uncore_has_forcewake(const struct intel_uncore *uncore)
> >>  {
> >> -- 
> >> 2.47.3
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
