Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED16FC5B572
	for <intel-gfx@archiver.kernel.org>; Tue, 11 Aug 2026 17:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFEC10E352;
	Tue, 11 Aug 2026 17:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wwk062pC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C135210E352
 for <intel-gfx@lists.freedesktop.org>; Tue, 11 Aug 2026 17:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786468741; x=1818004741;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=wvRcb7gRDsqeTLL13PcsGS0QjzscAoXHdAT4jc3r/qY=;
 b=Wwk062pCBbwSfG6Z4ZrLdasEsVS18M3az9zbpMJGIepCTj7haiw2BumN
 pJzgwEM5zbtyPfR3eydcLY5AA0THnrdD6asQq6FViVXZ1rwaWXkEtZhRu
 jAbBEXigT5WeegLO5ObARrONvDPtNzUGJYn6Zet1o6emlthWfEj695J/y
 1PwAw1jTGczBsxM4QRs+PbeUZj7XdE4TdR6LzbLlSZ7L6EZ3/xHkEc98k
 368tdlCiciHuqLCPL1eycq/UWFNXzMLom8nW4aO3Kq61jvG3qXjWrczOc
 K3zLOQsdVB9J+4xocWRxP5izqklo8PBzA9Aca6AyYso3wagGoOyigMpwV A==;
X-CSE-ConnectionGUID: e3Gzh4tOQsq7UbUp3uH9LA==
X-CSE-MsgGUID: BpLBeQD4Q9KL1FFhyyV9bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="74546075"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="74546075"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 10:19:01 -0700
X-CSE-ConnectionGUID: kz9vnh/nQ4aDT45ruJu6rg==
X-CSE-MsgGUID: MwSKoNpVRFGb0QNI1A7G9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="259546054"
Received: from dev-417.igk.intel.com (HELO devbox) ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 10:19:00 -0700
Date: Tue, 11 Aug 2026 19:18:58 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
cc: alex.zuo@intel.com, imre.deak@intel.com, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/kunit: DP Link: Use if statements instead of
 for loops
In-Reply-To: <20260727190223.2080436-1-jonathan.cavitt@intel.com>
Message-ID: <3853dd80-ea8b-5789-bca9-cc3730fc0a70@intel.com>
References: <20260727190223.2080436-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2128134200-1786468626=:605841"
Content-ID: <53e8e978-dfec-b033-ca30-1d5587a71230@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2128134200-1786468626=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <7349606f-53d0-9e2b-080b-06ca7c76bacf@intel.com>

On Tue, 28 Jul 2026, Jonathan Cavitt wrote:
> The static functions get_target_config and get_fallback_config in
> intel_dp_link_test.c use for loops to determine if the requested index of
> the config set is in the bounds of the config set entry list.
>
> Reconfigure these functions to use if statements instead, as these for
> loops are only run for a single iteration.
>
> Issue caught by static analysis.
>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> ---
> .../i915/display/tests/intel_dp_link_test.c   | 32 +++++++++----------
> 1 file changed, 15 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> index 67c6fe9f1812..89966d6a7e0e 100644
> --- a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> +++ b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> @@ -1215,22 +1215,21 @@ static bool get_fallback_config(const struct test_config_table *expected_table,
> 	struct kunit *test = expected_table->test;
> 	const struct link_config_set *config_set =
> 		get_fallback_configs_for_output_type(test, output_type);
> +	const struct intel_dp_link_config *config;
> 	int i;
>
> 	i = lookup_config(config_set, target_config);
> 	KUNIT_ASSERT_GE(test, i, 0);
>
> -	for (i--; i >= 0; i--) {
> -		const struct intel_dp_link_config *config =
> -			&config_set->entries[i];
> +	if (i <= 0)

Since i is asserted to be >=0 I think this could be restricted to only i
== 0 case.

> +		return false;
>
> -		assert_config_is_supported(expected_table, config);
> -		*fallback_config = *config;
> +	config = &config_set->entries[i-1];
>

I'm wondering also if the blank line here is superfluous since it no
longer belongs to the declaration block.

> -		return true;
> -	}
> +	assert_config_is_supported(expected_table, config);
> +	*fallback_config = *config;
>
> -	return false;
> +	return true;
> }
>
> static bool get_target_config(const struct test_config_table *expected_table,
> @@ -1240,19 +1239,18 @@ static bool get_target_config(const struct test_config_table *expected_table,
> 	struct kunit *test = expected_table->test;
> 	const struct link_config_set *config_set =
> 		get_target_configs_for_output_type(test, output_type);
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
>

same for blank line here.

BR,
Micha³

> -		return true;
> -	}
> +	assert_config_is_supported(expected_table, config);
> +	*target = *config;
>
> -	return false;
> +	return true;
> }
>
> static void test_fallback_seq(struct kunit *test,
> -- 
> 2.53.0
>
--8323329-2128134200-1786468626=:605841--
