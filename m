Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A343EC53219
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Jul 2026 07:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A7610E528;
	Tue, 28 Jul 2026 07:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GoBw/ZMJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EC510E528
 for <intel-gfx@lists.freedesktop.org>; Tue, 28 Jul 2026 07:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785222785; x=1816758785;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cER5qhExUUNIOdiLO1jm3cbzcwEwNUqvoyalbbHy00c=;
 b=GoBw/ZMJPJ9csM/BeaB+tp3DcT/4iLVdV7IUPfFScW48M0srSUboKJZl
 7P/SBcC/VIMbg4sKTHbOMSUCqn6H/mEf32RAtdv+SpAARxL2w1VGrDI94
 lmq4UtfmN4sPpWHXZUCu1DRf9Do570RpYYTlBbHHfZquQxNjTA6e5QlGs
 masIx0GsVHhkVs6sIB3P2UX6dZEurmc/QhZJMiQGYYVBGi8SQoF8+Fs61
 GgT7qBobFluVYFi6ECaDCE8w3TkWCJehVbLI0EwdnDkIk52MGSZs55ny5
 wLDTuBBdyulRMTNdTF8/TAtyFxD4NPLtJegZpt5cZa1W2a28fe67YbZt2 A==;
X-CSE-ConnectionGUID: Zd8q9iZRRZGGyxKowoMrGw==
X-CSE-MsgGUID: BsA3iq+IT5m0qavVf+vCIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85812615"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="85812615"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 00:13:05 -0700
X-CSE-ConnectionGUID: 24hlsyrzR2G+70CVwRPSDg==
X-CSE-MsgGUID: Hle0OORkS5iTQsexGydNtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="260277812"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 00:13:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 00:13:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 00:13:04 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 00:13:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwB264yjKG6k3UZlFjhAYC5/vk8IwqioFx4qR43Q7Kh6FXnMj9gItoo5njAQPp5JeMqllNGWzmbS/hgmp1ljee0W8KxKT/l1tADbmOJD8XVe+YxPoliuzz4IEfMnlC+b3AO0GMygYrxkIdrIkhBEPHM7m4psfAtRqMCi9No/lUW0GhbxEiddenfcHiznFyUlhw6HSRRAc92Rd8PD6c0OO6oWFb4zolYSjBuehSJJaTukdGPU2ho+6eXOThwRL//qDBgpFZsztFegq0F3Z2ZFiV987b0S0+KrdbbYHyNb1mCfvjYFAhYcGqICziMEq/MfzPgUs7/QoKbgULlizByteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/JFjHVLw/MFHsh8mZM8V4sU5tZNcsWaAOq+AoZkUcQ=;
 b=cBHrVll8fa0qx/iG/uwBIn3fFF+ii4totJgVIlcrflp2SEwQkeUtCByrk8w5e+fvadTwmZU6sLAJN40BBeg48rZwDWrJ5Ix2bKgSO0oh/dEYlW+uEwWMyLNcpzy+P6r8lVDFBUHptlK5QEYSZtNZQV3lJCYh8eTuojVP/fmyA4axrQjWto78A1jGt5+4aLVa+Jpre5MJ8Tsg2l3e5dRqNQJvi3YoWjOcbSW0OIcLWyP48NKogaoOfD6lp1kXBNnOwU6rm56YAqz5Y95bJQe1qZPCawW0JCT5Ova/xOmJ80bjedBv74kH7DGApKtWcXhnR1RPLvjmhHfT2ricWa5Tjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 07:13:02 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 07:13:02 +0000
Date: Tue, 28 Jul 2026 07:12:52 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <alex.zuo@intel.com>,
 <andi.shyti@linux.intel.com>, <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v5] drm/i915/gt: Use poll_timeout_us in place of sliding
 sleep window
Message-ID: <4j2757n3ovoglhhcxzkueahkwywwuqdsaqqaac6swe5taqo6y3@5uzzfsukf7n6>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260727143828.2031386-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260727143828.2031386-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: DB9PR02CA0009.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::14) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc2342c-1a44-4fd9-7b21-08deec77a948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CcC2rtTJH4Woz0LPrYxFZ8obsdZz4UHigrbJn60fcNnUXpMkYLEgD2QSvpIdMB330SXub5mv+ZPFAtx/CFKxfWldnXy27QYilYTMWytHod5AVafM1Jq3o9kmzvPghXt/EcHaEOpOIdIrxQ1lf9G5J+qIHsKEs7tuT9xc9SMo/uS65cRog2AN/hzpIa6t6xW/TfA+c+MgvuXoqWDHfzhIgbpU/gsSAhHN15vsGI5NNsQQiYDFErSzecXSMth7eBgFBEZr/0zOM2BvXPIvv3fr0x8Q23b2VpZxcLOGlqrawMisl/U/072GrkelhFOSl5Z+aJP3bQqJbfPGzMSc+EVIJm/p5xqZYkjqgXvMi9k/JIiQ96/qouJaw+ko4TXQvj7rnqexT0L8tuwhheVg0FZjLi8QOqOYKWQ0VVbfmMso8OVLKyf6DpbI0XPQBG7YNc2rPw3QsgpW36f0ZTJ4kPYtEO23l3Hwc+8WTuNAL0kI5KV3g6yrW8Ip+GgBUzGOYHt6I8hgfCwwXBPHybsYIFqFuanSsBLhLr13CFZf6nfzBcQZ1+C4UbYTHhJMyvPAicnCoUFbLIFDeACk5stl4/mHi0bbap39ab7HtUc4FEWbpLKNPRCnH5nB4hRoFrQ8eBAfFje70Qt3cu94QZFg0DpnBpFz+bVpjK6lvmGA6syCN5k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3BCVCtxOTZoUTRZNkNaclVKdk9sbHQ0ZVFqTTZ4bjhZOERJVEdRelk5TmpZ?=
 =?utf-8?B?WGdKdTU4eEswWk02NSsxd2RWU1JCV29HdTVLWVptVVAybllwdTRadTdTNERn?=
 =?utf-8?B?U1NjZE1zVmxDUS9mWkt2Rm9KNnRRdnNnMm90bS9Jc0ZxUFVNSFdIM3h2RHMr?=
 =?utf-8?B?OXo4ZW5MdUJ1ODRnY25BQ080bUx1eHRLZEMya1RuSEk3Z0xOeURZS3EvU1Y1?=
 =?utf-8?B?aFRXZGZ1SlBxT2U4OUNjaCtwbkx5WEVyMjJ4bG9VTlh4WWdlcWxIZExBU21k?=
 =?utf-8?B?dmtQTno5RkVvSDJCdlozZWc2cjhmUEZ0UzdIZkljbm9QeEZIUFVjb3hKYURL?=
 =?utf-8?B?VW5iRzBBdTAxTnhoVko3K3g4V1N5MjlLbWVuN3lrZzhVNVAxREtSUXpzbkp5?=
 =?utf-8?B?cEN2VlRMMkg4amdvL2pYVkRxMWZFbzEzYkExUWwwTkRsWElaSzVSVlhFaHhl?=
 =?utf-8?B?bzJXYU81TGR1b0Z5S1NIR2l3NGgwWDlGZTk3ZUpyYmZOeW9zRzY3MXlUY0VI?=
 =?utf-8?B?VFlRWjRYdksvYVM0LzFjQmdZUDdSSFg0QnRMV2FsRThUR1c3ekJHRi9ERTFZ?=
 =?utf-8?B?eWh6cnVNS2FUdEFQeTgxN2ZzZWtOVFdlNGFBeS9QV2Y0M0xnUC95RGVZWjcz?=
 =?utf-8?B?ZnVIeEo4YkJxdkMwNEppY0prSERRc3B0bWVKam5lSGcrYjNjVkJYUVZHdzVp?=
 =?utf-8?B?UGs2ZzRmb1BlWlN4cXpia2pEWUFQNE1uc21LcjVtZS9QdWw4YjBtU2JnaHBG?=
 =?utf-8?B?NnZLMTViTk9YZE90UzZVMStkbkRiQmF3V2c5RGNIL0ErSGwwZmVjdGdyS2k1?=
 =?utf-8?B?dXVuMUZuNjFzaHNzNTZTRjBwdmhtdHRsYm1PeklsQTVnVkh2T2ZEUWN5Q21R?=
 =?utf-8?B?SFVWNWVFZDc2R0s2VW1GWTQydWNyTzVqNEZuaFhocjRVREtlOURmSXhZandR?=
 =?utf-8?B?amVMbm5aK2V6Nkw4WE1PYkpoclhBeUQxYklBRUJhTVRmc3c5czlIcHk2cURJ?=
 =?utf-8?B?VVdTYVgyKzQ3djMxMU1yNnl3VzIvTkxMbEZmSzIrb3RDRjVJeUdtMHJYYlgz?=
 =?utf-8?B?SVp2em1wQVVyOThyWkFreVlDRzBwclBuV0FHcm9UNGxFQ1RjeGxYMWZQQVFZ?=
 =?utf-8?B?V3UvL3ZpOHdneVdPbWFIMTRBZnI0QW92U2xiUXhKdXVCV0hYN254RExPaFcv?=
 =?utf-8?B?SER6OVkzUEJLT3EvY0JYYlMrR1B4SDlsUjl6Z1JmOWJra2RjeW5CTTZiVitq?=
 =?utf-8?B?bFcxbGJmYXdBUSt6UE81S1VCQjRSWHVVYUpndWs5bnJ4eUJvZHhzWFhLTW1w?=
 =?utf-8?B?TVdPTU43M1llSEp2NDRPdEJSeitLdkZvc0RYeVJOWTF0R2gzeEZWbk8yMk9i?=
 =?utf-8?B?cTVwNWFna0UvSHpndHR4alljRUQ2Q0FFR0VVM0FSdFJJRkVOOEFYTzVVUGE1?=
 =?utf-8?B?WjVicHd4TGNWOFlwNlB3bndXdWtmaTBQbTZhU2tReGw5UnFUdmNqZ29WYkJi?=
 =?utf-8?B?TzJCYWJScFl2NE1FbGw2TkFOTkNxQlZrYlhQSFdHdWc5dndTMnMvSmlsVlA4?=
 =?utf-8?B?Y1BubURiV2h3SGxRbmtBUk43blJVYTNtWkVWdGxnWEI0b29xeWlyRElHeEFj?=
 =?utf-8?B?NG1ZVHZyMHVVRFQ2ZmNjN0Jpak1tUUlDNDFIYTdwNHZ6QUo0OUdlMlFwaDVZ?=
 =?utf-8?B?cWR4L21zdWtuUWY4bFhaQmthaEVJQ3lPYjM0QWtsY3pjMTRvU1lrZ3luSUpp?=
 =?utf-8?B?OG43b2JVZWpTbWpObmkrQ0NaWk9tK3R6a2RwNlBXTU9jTUJZWU8xSEJBeXYz?=
 =?utf-8?B?bml5S1d4ZU1USGxqUEVpb3Z6L1V1RXhCZVZaSjFwM0lxNkFQQzlPWTBnRWlu?=
 =?utf-8?B?TWx5NVZDWDQ1SEMwZUNVVWdaaEZsNE44a0liRDdpdmY0Z0VuTkMzVXk1R0g1?=
 =?utf-8?B?emdYUjZSYXZmRzBqNkZqK2puQjRkcExabysyeDFJRlgzU2pXdGdKLzFvVHVL?=
 =?utf-8?B?cXJsMG9jbGIxK3R6ejFzcVpHb3pQV0MwQ3dTKzVkRE1jRlFMa0daNUhWUVN1?=
 =?utf-8?B?b0RqM05MK25ndDJEQ2pCREVYVFVseXRVQTVFYW16ZXZsenFrSE1jcjYreXhH?=
 =?utf-8?B?cGNLTER0T3N3OVBXRE9ZaExqTW1LWWNLb3pGa1lOVGJ0K1ZtU3FUbklxc3E3?=
 =?utf-8?B?TUMxS096eHlMUTE0dkE0SlIxaVhkcDExUnUxY1c3Y0JCZGlXK1d1Zy8wMEpv?=
 =?utf-8?B?ZG5LR3ViUHNIZjBVUzQ0a1Z6bGZ2YndZb05POGdPeFEwK3hlVXVKd0JVMSsw?=
 =?utf-8?B?Skt2TmR2bHZUUW9jL2ZrcW1aVjN0ZnJTbW80TVRBeWpBSUYzRUlKYnl2U05J?=
 =?utf-8?Q?/keK/xSlSqfSk1YA=3D?=
X-Exchange-RoutingPolicyChecked: m0+eJpiRPNdo0wVgM3SpKdveQSMzalf77ODhNXft83PL8PL4BbK+Bhzc6c3jQFrQCr5JChuTOFUtTBR+3trlPw2OQhT6uA6ZAT2Wx8CLhc9HbVAVqbfdyp1qlG/Pmm8IuYEK1tR3T/BPdEdLow2JvUNaFUelV1hUgAmjoWlnMtlFJOPRjS4lbUo+3NkrGd5er9s9LqC/C/GzQNjZbC0eEBMSUHI6OtOLsBNNQ+c8hA0eLBkVcfA03JcpHHp7NLb6bdD0DVlVjwBUV+lUVo5UIJ7nz6oEQJeuQssY5EHrAPXPzPDVCxEaXmuO3SO1ZqLkrtzYeOjVlpxHz/h7HSaTXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc2342c-1a44-4fd9-7b21-08deec77a948
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:13:02.0241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RK2iUg0t9rfiaNVEU5V1+IBJ3BfioKISKZou1VuG14h/JUt/0cAdDD9sANNClIqslfS3XqEt8rXYdp4DVM0ID3h1xdCX0qTAdFXY/V/V/6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
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

Hi Jonathan,

On 2026-07-27 at 22:38:28 +0800, Jonathan Cavitt wrote:
> The functions intel_guc_send_busy_loop and ct_send can theoretically
> loop forever.  In the former case, intel_guc_send_busy_loop can iterate
> forever if intel_guc_send_nb repeatedly returns -EBUSY.  In the latter
> case, ct_send can loop forever if the guc-to-host or host-to-guc buffers
> get stuck in a full state.
> 
> Rework the functions to use the poll_timeout_us family of functions
> instead of calculating sleep_period_ms repeatedly.  In both cases now,
> if the loop condition is not met after 10 minutes, the function will
> report it as a failure.
> 
> This also resolves a static analysis issue involving sleep_period_ms
> overflowing after several shift-left-logical calls.
> 
> v2:
> - Reduce default sleep/udelay duration (jcavitt)
> 
> v3:
> - Use atomic in ct_send (jcavitt)
> 
> v4:
> - Rework ct_send reimplementation to better preserve original logic
>   (Andi)
> - Define 10 minutes to remove magic numbers (Krzysztof)
> 
> v5:
> - Use non-atomic poll_timeout_us in ct_send (Andi)
> 
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Andi Shyti <andi.shyti@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---

The failure from i915.CI.Full seems to be unrelated to your
patch. The code looks good to me, so:

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
