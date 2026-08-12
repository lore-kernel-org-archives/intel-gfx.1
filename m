Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E445EC5B56A
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2026 09:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F17B10E3ED;
	Wed, 12 Aug 2026 09:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXDjbdQq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5EF10E3ED
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 Aug 2026 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786526141; x=1818062141;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WDlRcDNGVXyonUpKujW15h+tVoF15dUEWCybDD7oaps=;
 b=UXDjbdQqcuMx/KDkdjn/LDSn2dTUAzqr2U+cHptLnsfa0sdYC2NJ55UT
 /El4+XKq+8fCOBLfoKnXeS5t6Q3yQ7gMMVniENMRjK2SPdXs3GY0sVOpV
 MtSEfod+pc0sOe6G5JV3KlfyX77U4DpGTgNjIgkxInuNmKy3UHJ2pVQw7
 4Lw0YHY4EGwtgHyynFDr+Lo+xWcxYlS6b6jgDztpq5nXSvkV/UXXCaA/v
 ZMOE7kSptSLgdOcRSrdXrl5/7pxtfqFOXqgwm7c4unztew3zOHot9M1Lq
 +8V2iKG8iiQ7H8Qs1FPNqIBY2btuiyEjWryy/S1mcsKstcFafLUMLKnNR w==;
X-CSE-ConnectionGUID: mqKlCY6CRcmfiuoX5T4hhQ==
X-CSE-MsgGUID: Z2vUmHrnQ4yMTU4eQh+CTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87094966"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="87094966"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:15:41 -0700
X-CSE-ConnectionGUID: QZ/6Hp8TS7ur7Dhuv+/SAw==
X-CSE-MsgGUID: VEVhHGC3R6mhF4DE6Awy1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="259751698"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.141])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:15:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: alex.zuo@intel.com, jonathan.cavitt@intel.com, imre.deak@intel.com,
 michal.grzelak@intel.com
Subject: Re: [PATCH v2] drm/i915/kunit: DP Link: Use if statements instead
 of for loops
In-Reply-To: <20260811175719.139464-1-jonathan.cavitt@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260811175719.139464-1-jonathan.cavitt@intel.com>
Date: Wed, 12 Aug 2026 12:15:37 +0300
Message-ID: <afaa8f5d600415eed8b2ea39cefe2709818e3877@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 12 Aug 2026, Jonathan Cavitt <jonathan.cavitt@intel.com> wrote:
> The static functions get_target_config and get_fallback_config in
> intel_dp_link_test.c use for loops to determine if the requested index of
> the config set is in the bounds of the config set entry list.
>
> Reconfigure these functions to use if statements instead, as these for
> loops are only run for a single iteration.

The CI on intel-gfx doesn't run kunit tests, while intel-xe does.

Please send the changes to intel-xe, and double check that the link
tests get run, before merging.

> Issue caught by static analysis.
>
> v2: (Michal)
> - Change i <= 0 check to i == 0, as i cannot be negative by assertion
> - Remove unnecessary newlines
>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Michal Grzelak <michal.grzelak@intel.com>
> ---
>  .../i915/display/tests/intel_dp_link_test.c   | 34 ++++++++-----------
>  1 file changed, 15 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> index 67c6fe9f1812..6dfd8903a8ec 100644
> --- a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> +++ b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> @@ -1215,22 +1215,20 @@ static bool get_fallback_config(const struct test_config_table *expected_table,
>  	struct kunit *test = expected_table->test;
>  	const struct link_config_set *config_set =
>  		get_fallback_configs_for_output_type(test, output_type);
> +	const struct intel_dp_link_config *config;
>  	int i;
>  
>  	i = lookup_config(config_set, target_config);
>  	KUNIT_ASSERT_GE(test, i, 0);
>  
> -	for (i--; i >= 0; i--) {
> -		const struct intel_dp_link_config *config =
> -			&config_set->entries[i];
> +	if (!i)
> +		return false;
>  
> -		assert_config_is_supported(expected_table, config);
> -		*fallback_config = *config;
> +	config = &config_set->entries[i-1];

Nitpick, checkpatch should complain about missing spaces around the
operand in "i-1".

> +	assert_config_is_supported(expected_table, config);
> +	*fallback_config = *config;
>  
> -		return true;
> -	}
> -
> -	return false;
> +	return true;
>  }
>  
>  static bool get_target_config(const struct test_config_table *expected_table,
> @@ -1240,19 +1238,17 @@ static bool get_target_config(const struct test_config_table *expected_table,
>  	struct kunit *test = expected_table->test;
>  	const struct link_config_set *config_set =
>  		get_target_configs_for_output_type(test, output_type);
> -	int i;
> +	const struct intel_dp_link_config *config;
> +	int i = config_set->size - 1;
>  
> -	for (i = config_set->size - 1; i >= 0; i--) {
> -		const struct intel_dp_link_config *config =
> -			&config_set->entries[i];
> +	if (i < 0)
> +		return false;
>  
> -		assert_config_is_supported(expected_table, config);
> -		*target = *config;
> +	config = &config_set->entries[i];
> +	assert_config_is_supported(expected_table, config);
> +	*target = *config;
>  
> -		return true;
> -	}
> -
> -	return false;
> +	return true;
>  }
>  
>  static void test_fallback_seq(struct kunit *test,

-- 
Jani Nikula, Intel
