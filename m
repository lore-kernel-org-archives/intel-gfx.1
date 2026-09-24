Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0026C98318
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Sep 2026 17:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785E310F6DC;
	Thu, 24 Sep 2026 17:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eW7YZsIk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4981310F6DC
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Sep 2026 17:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790272547; x=1821808547;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tRBtduG4yLdYayRiK353B8SPcE+TAPbWaMlq/DtKLjY=;
 b=eW7YZsIkgRl6aXlBLM6GtWhXnhy/Fri1w2OcXBeXYglCEOcRywPKUGVR
 ZKzAhiXytfECwit65nx2pZYboqoefiagGFEde12vf1eFQpcy1UX5B3YgS
 8R6Vw2tk25OUEuvMJnB+z9fMywxjQTeIE604CDvnfD2hl0MIaQeI+J6VC
 GAFizbuJDJdvIjk+sfIcVdBQkxgII713eQuOLABK3HWolgke15vMYaRZB
 nxm7vwg4gU664Znp+eaY98Yb2VzbPU4AwB5LNnOVTu427SF7GMDdTeZZh
 wFANqFm4/81cnIvFmYwAJ5OgH0MoKGovzSMkrhNJselt5if7hx57Mi3NM w==;
X-CSE-ConnectionGUID: ndYvmL+JQtyxyqWGX60V4A==
X-CSE-MsgGUID: +Qj4pK6aTXO9Ty/cnh1l9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89825052"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="89825052"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 10:55:47 -0700
X-CSE-ConnectionGUID: KuMUhtzhQVqMXn+rpiJPdA==
X-CSE-MsgGUID: sDuRiSy0QLCcMo+WYCFXRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="277860878"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 10:55:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 10:55:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 10:55:46 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 10:55:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqXpcbkr9BP7GmMtGR6+gMd26B7zTV73FfwZGuVU9ZwvZxLS5NgMYgzwwixcNeu95WSmW0Uy0jTBPIgoaM4DCmiX9tgC8LcdSjbhJcECHtcrPzylmw72uNxrLHS3eGMkB1ddP/zdWYE0NFGsqU1yvsIoDJ2hJFrwYYR4rdFVY+FRHRdqJnXE9pbq58RzdDc/z72tmJIS+xWKcf4M4DtLY/PWl+QlibtVqYmtsvFUQFeAU/kZIYUaP+bAKMrWXIlBDeF3jfmWe6fbMXADJoXmYNH/87nXsSR3QhHAzD9mg3sXHM+mzNxtQiNl1PN5qo3jdjUqy37y9sso4E7MHcDPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aklFesRYnPer6zGOgmnUo8DvQ+wxi1ufERCkG8qyskI=;
 b=P5ZXZOQw6j3EE52I6usndSLDw7TuOmBIRRuRUKEoYrOKr9duq+T1Zp4WQgHY3uzhiht0a5o3fISr1mUoNiD4bFUl6YdJ9U4jQxVFSpezpt4lDtMh73MPwPcTQN9gb9EJJhpkwDWDIBpycLMESf5Euzqx4iI/w5PJ70OCESmsP+J87CogphMJT+Oe8WVojP/yk1Iua/1JX5QszbZyCG6tyee2f+3PKDy4B+W+VkgfMbErElXdb0tAd1ajj+Do+vNXG4Jbh6AAaUOCUxMoLPJrSuvwfyPXESpNQUdyvveW1ikB5gHfRhUQzPoARyB3wws7KzygMi8W2DWg5/6/E2tb1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by FT1PR11MB263857.namprd11.prod.outlook.com (2603:10b6:170:e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 17:55:42 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 17:55:42 +0000
Date: Thu, 24 Sep 2026 10:55:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/i915/guc: Use a delayed wakeref put in
 guc_engine_busyness()
Message-ID: <arVkGyo7yQHOB99g@soc-5CG1426VCC.clients.intel.com>
References: <20260910184253.1231313-4-umesh.nerlige.ramappa@intel.com>
 <20260910184253.1231313-5-umesh.nerlige.ramappa@intel.com>
 <b0337ea8-58db-4cea-a355-54f09a2e2d06@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <b0337ea8-58db-4cea-a355-54f09a2e2d06@intel.com>
X-ClientProxiedBy: MW4PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:303:8c::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|FT1PR11MB263857:EE_
X-MS-Office365-Filtering-Correlation-Id: 17228cf9-b293-4ebe-bef6-08df1a650ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|56012099006|6133799003|22082099003|18002099003|4143699003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: Na95yGwkzlu66fRS7zqeMbxEtYiCIzq+elBcCN6p57yS7KeyQ/BlLJXzl9f9tyACHp4nxRtD5b31SsW14k95nEXIeKJ6f8eFUBllipOYsq+LkRyDAlxmvAt8TC920A5s4IPyHy5BXz/Nf9Beu9MtG7QPa01TysRr8yvojclChihKm3tgVXa+B1aG4Ps7WA9a6dayEU19fiqUSNrL2KgQSzl9uPn4yxgqNJgPc2x9yrximbXZzQEj5/JZmtnpkRWKNBq28lDMKMYKxH9Yuz3vBldaOtHGzqdsEyRPklJy7F4moHH9X3mczI6pe07g2zAKyfNaWdzkMr5AGf45m8lFEGhDgmzt/eksJmtpqOabH8u8FagOCrKfESirLqF6HkjxxgDgr1XQgEb6pgHaj4SP4VKqYHJ3wj7Foe3kRX1/+8Bjh79KsJgpVisFv2Vwf9ntFejXkqWLKbGudDHOfh/2u1KyC3/4B01Bv6u68lxMe2OAiO1yvPdVZ6fUj6bJaJVY01m7hUqPX/PB93rAbmZ0UDN2Y1Kgw818UNvNsuFYkEmdG8CObiguJKPnIoRNAilACNpkIUatYOT8l2XrioFFAMtpAXBOtI90sIQVRdLurAiELLQZ4Y7yxBNzUYeaJDeR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ukd3akFmaHEzM3ZIYVdJbXhtRFB3cWJuMThiL3hrK2gxdGtTd1JoT080UUox?=
 =?utf-8?B?WTNGVzBDeXBrOFNzNStHNkRGc093NUpVQlY5U1Q1U1ZiM0xyeUFKTTk3OXRR?=
 =?utf-8?B?Z2IvM25KU09LbTlRSUZUL1FGWHRyT0VkdGl1YlViL1JHUTV2V1poUElVVkZH?=
 =?utf-8?B?ekhOaVlmdE8zNS8wZ0NzTHVUZlJuMFhQSmdpOUFoVUlieVdJSW5Xd1g1em4x?=
 =?utf-8?B?a1RkNXMzekZURm5seEVPbGljZUFObVVyQm5vUVZxMkd3VnJTbGx3Um1KbHgz?=
 =?utf-8?B?NUIzcGZyUW44dXBoTlZRZmIxUmQ4c3M0MkNoSlkweEpmWkpJdkZtYm92MTRi?=
 =?utf-8?B?dWE3bFJSUkFISzRML0pnK2QvM1hqdmdpcXRodlNUbUkrTVc0eFU2NGFYT3U4?=
 =?utf-8?B?VENhZE4yTklWR2dBakVveHNzN1M1S1RraWpLcWxBdjZuQmpIbGk3Z2dBRC83?=
 =?utf-8?B?UlRJNmw2OUJ2cmd1YkZnWVZrb3FDNEhKT0oweTZldmZxYTliZ2VKVVRtOXNo?=
 =?utf-8?B?MGhLTnBINEliWHFGTGx1aDhCOU5FOUJTdURHS2I5VHFLdGlwTE0vWlhCYW5R?=
 =?utf-8?B?VWw2aHhtK1JSc1VBeEFETmFLVWRYMUljOFVGUHNPUERhTnIveUtVK3NUbGdF?=
 =?utf-8?B?MG9aQkhvVDVpdkxlaHlOWGlPZmc2cWo1KzdXZGQxUno3QUtYZ2U5eERta21B?=
 =?utf-8?B?M1BwTG8wQ2JabVBjejd1eUVJVlFkM0c5RVZQN2FYejZTeXdyanN4Uk14MHov?=
 =?utf-8?B?SkRqb0ZQUW9NamZPQTNEUVc2NWdxTDhlNXBvU3JFMzBqc2p3VEttTExIZ1Rl?=
 =?utf-8?B?dmd6ZUFiTmNwcnJmdVoxOWVBYUVsN0FJS2NIT3lNV0Y2dlI0ZnJ1NkJ1ZjRv?=
 =?utf-8?B?L0I5VlVjTnRaSXVaQnIxVGMzTFRZUjJxeDVhK0JXcHpTTEQ1eTVXUzN0Q2dI?=
 =?utf-8?B?WXBsbi9DZy95MUhBcWlNODNsR1ZuWEdGRVFiTTdTSkR0OG5ORG93T3A5Mytn?=
 =?utf-8?B?dmt4ODhlOG1lR1dmU2tQRUx5Nkd2Qkd4NDJGalhGeTFRWFpZRHNwZFZwZHM5?=
 =?utf-8?B?cmhaQ25OUHpySklpZ3p3cUMxczFybG5ublVkdmRpK3hvbVVYUzZHS3dxUWFr?=
 =?utf-8?B?bEJNNnoxTUpsM3lpdlUrTnFEZUY1QVBCTzl6STQ4MER0RzZsbkNQdHprQXdQ?=
 =?utf-8?B?L3lsNDVBQjQyUU9sdUJsQTBQbjd6STV2ZUxpTmNlK2kxcTJuSmZ4WjBEenFo?=
 =?utf-8?B?TVFEdHovM2dNaVFrT1lmWHREVk1jRE1tTXVMTjNFb1pwNXJFM29ySjV2TzNP?=
 =?utf-8?B?Nk9NYyt2dzdPRjZnZ1poS3V6MEtUNmJETHJwNWFacjlaVnlGRW56enptRUNq?=
 =?utf-8?B?NEhpTkUwVTBHb3hlUTlUL1Q0NXdVQzV4Z05uazcrK0xNakY2dFJDeFRteGMy?=
 =?utf-8?B?SlFPYlZEMFkrZHJLa1hMVHFlbXV6MmFLalIwZlQxdjVsejRoWDhkYTR0MGFo?=
 =?utf-8?B?LzFITlVsdFpTa2w5WUNhend6b3piVHFOQzBhdVNFcUEyUHpWS1NDREl3UEZk?=
 =?utf-8?B?VTZVbGIxT1RQSXMzK3N3UXppd1NoQ3RkRXFlUGlOYkJGMmVTSmlsdE9zTjlO?=
 =?utf-8?B?bmF0alc4bGFMaFpjZVBJVnE5aUlIaUh0Nmgrd1U5aHV3TXpwSGNHbklDWlds?=
 =?utf-8?B?MlBkbzYxSU11emdvOXpBN0ZQbGhtK1NYTVVCM0JUUzd4NUNaUnBmRzQ1clFL?=
 =?utf-8?B?ekZvVnVoTHY1N01Ea1I1d0ZjSm9Cc1BWb2xFbUZpVENRY0xqVFMybVJKQldX?=
 =?utf-8?B?bnRvODQzTEZha2JxOTJibzdMMmQ4aEFKdDlCNkxEY3FXeHl2dEFUME8rTEhY?=
 =?utf-8?B?bU5rcVpwMkluckpUVVBPUElBbjFYZWJEeG9GNG9wR011VVNKcWgyd0wvbUVq?=
 =?utf-8?B?Ly9Fb1ZRYWlvcDZNVllnQjFNWUpKT25YR3hobFgxdGg4WmRtUllLQjlSUWg2?=
 =?utf-8?B?czREeWMwM0tFaURFa2drR0VYLzdMWWFXSWJqdTVmM25yS2p6aXNMaWgxck5V?=
 =?utf-8?B?RFYvbEovakhqWTFmWjZtSWxtSE9PdDRGUy9NbjlHbXR0Wmx0aTNKejZENGNm?=
 =?utf-8?B?bnRtdDdHTTljZUM2Um91RDNNQXpiR21SYUQ1SVY0NkpiM0QveXNqN2RhZnQ1?=
 =?utf-8?B?NkJHaW52Tk1MMmE0bmtucjhsQnZlRnFBRC82N0NHNlVQRlNHMnlxVmZKR1Rt?=
 =?utf-8?B?TTdyUU5NR2R5ZFdKS2kvVFFMM2ZOTVdncXVqRzJUdWY3QVVLYW5IYnJ2M2ZE?=
 =?utf-8?B?QlZRV0ZxYlQySXYyOTlJRm1rM0xzclRBMmhNVk5lQld2VndUbm8rZE1Mb0VY?=
 =?utf-8?Q?ZAnA8cn5AbQsUEnqvvt6NFlVvNl+dcfKtBAyC?=
X-Exchange-RoutingPolicyChecked: WDwjaWNZ/L1t6m5xssbYFMTOaBA2Kys8FQsVjBgYBZwuHJ09n7QjVHmU8eUV9XGwCeT/sbQQgOY69I473pJdreeiAUt9bgPSNzGJew1/MzYFSpaxyp75K6UiZDnwag6as7Icmt/wxyLk7goZ83vxfWLc8Qaqyxv+TFslxFHShxE5QOztTlKCqPlPfLyTpV1ApFJo/FeF3mpPXZVseegdUq8f3Ju+PaMNg3I5smNnIRHx1yso4QdCqtrLbWZWlckFotLBJfLX+vqXN0mjiaZ/OEiOMSku08BiwZ7R7ArDDb5UHwnxSejOAQF3K8X6BqIfFXoFJWTcAMl3Q6nTWdapqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 17228cf9-b293-4ebe-bef6-08df1a650ce4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 17:55:42.2286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jC7tKWwhzrkx3ZqC6dDPuzGjSi2UxsvqBcNZ+fGJJnbjt6oEtXKcnfiFIDT4Aob0mLYBJE5jc6QhnqL7S1Qv/PWRLUD1n5UWyvE5BgSj98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB263857
X-OriginatorOrg: intel.com
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

On Tue, Sep 22, 2026 at 03:09:03PM -0700, Belgaumkar, Vinay wrote:
>
>On 9/10/2026 11:42 AM, Umesh Nerlige Ramappa wrote:
>>perf can invoke the PMU callbacks from the scheduler with the runqueue
>>lock held, e.g. pmu->del() via perf_cgroup_switch() from
>>finish_task_switch(). guc_engine_busyness() drops its GT wakeref there
>>with intel_gt_pm_put_async(), which lands in mod_delayed_work() with a
>>zero delay. That queues the work immediately and wakes a worker via
>>try_to_wake_up(), which then deadlocks on the runqueue lock we are
>>already holding. The put also happens under guc->timestamp.lock, so the
>>stall blocks any concurrent __guc_context_update_stats() too, and the
>>machine hard locks up.
>>
>>Only reachable when a concurrent put drops the refcount to 1 inside the
>>get_if_awake()/put_async() window, which makes it rare and load
>>dependent.
>>
>>Add intel_gt_pm_put_delay() and use it with a 1 jiffy delay. A non-zero
>>delay takes the add_timer_on() path in __queue_delayed_work() instead,
>>so no task is ever woken from here.
>>
>>Fixes: 77cdd054dd2c ("drm/i915/pmu: Connect engine busyness stats from GuC to pmu")
>>Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16984
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>Assisted-by: Claude:claude-opus-5
>>---
>>  drivers/gpu/drm/i915/gt/intel_gt_pm.h         | 24 +++++++++++++++++++
>>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 +++++-
>>  2 files changed, 30 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
>>index 6f25c747bc29..24c8b014864d 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
>>+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
>>@@ -72,6 +72,30 @@ static inline void intel_gt_pm_put_async(struct intel_gt *gt, intel_wakeref_t ha
>>  	intel_gt_pm_put_async_untracked(gt);
>>  }
>>+/**
>>+ * intel_gt_pm_put_delay - release the GT wakeref, deferred by a timer
>>+ *
>>+ * @gt: pointer to the gt
>>+ * @handle: the handle returned by the matching intel_gt_pm_get*()
>>+ * @delay: delay, in jiffies, before the release is processed
>>+ *
>>+ * As intel_gt_pm_put_async(), except that dropping the last reference arms a
>>+ * timer instead of queueing the release immediately.
>>+ *
>>+ * intel_gt_pm_put_async() ends up in mod_delayed_work() with a zero delay,
>>+ * which queues the work straight away and so wakes a workqueue worker through
>>+ * try_to_wake_up(). That deadlocks if the caller already holds a runqueue
>>+ * lock, since try_to_wake_up() then tries to take it again. Callers which can
>>+ * run from inside the scheduler must use this variant with a non-zero @delay,
>>+ * which takes the add_timer_on() path and never wakes a task.
>>+ */
>>+static inline void intel_gt_pm_put_delay(struct intel_gt *gt, intel_wakeref_t handle,
>>+					 unsigned long delay)
>
>Would a 0 delay make it the same as async? Should we have just one 
>function based on delay value then?

Yes, 0 delay is same as async. We could have one function, but that 
common function is __intel_wakeref_put() for all these variants and it 
looks sufficient. Note that the delay variant is just to bypass a 
specific path in the queuing of delayed work so that it avoids taking 
the run queue lock, so IMO, we should keep it separate for readability.

Thanks,
Umesh

>
>Thanks,
>
>Vinay.
>
>>+{
>>+	intel_wakeref_untrack(&gt->wakeref, handle);
>>+	intel_wakeref_put_delay(&gt->wakeref, delay);
>>+}
>>+
>>  #define with_intel_gt_pm(gt, wf) \
>>  	for ((wf) = intel_gt_pm_get(gt); (wf); intel_gt_pm_put((gt), (wf)), (wf) = NULL)
>>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>index 788e59cdfac9..32d722c378e8 100644
>>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>@@ -1361,7 +1361,12 @@ static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
>>  		 */
>>  		guc_update_engine_gt_clks(engine);
>>  		guc_update_pm_timestamp(guc, now);
>>-		intel_gt_pm_put_async(gt, wakeref);
>>+		/*
>>+		 * We are reached from the perf callbacks, which perf may invoke
>>+		 * from the scheduler with the runqueue lock held. Defer the put
>>+		 * on a timer so that it can never wake a task from here.
>>+		 */
>>+		intel_gt_pm_put_delay(gt, wakeref, 1);
>>  		if (i915_reset_count(gpu_error) != reset_count) {
>>  			*stats = stats_saved;
>>  			guc->timestamp.gt_stamp = gt_stamp_saved;
