Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25042606A32E
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Nov 2026 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lopq9JLY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7232810F9DD;
	Wed, 11 Nov 2026 09:13:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7563010E19E;
 Wed, 11 Nov 2026 09:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794388393; x=1825924393;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2lt2VoF2l5FIJUw7iQFIW7cdBoAezlvvOYkZBk5qaAw=;
 b=lopq9JLYCcjz55DfbwrGEkxRHdZSsmNWtjMa6rUvkwMvnbmlKFY+kM+g
 bAkbQ3yrsIdbnbB9TgNKnNwkCmUTPfhfHLsziFq8VIKlDC4SHaP3pLYAK
 LZgpd6eGykBvOZ8zjT5zI77d/c5yZBbnj9kL2xKFT0r3GdmfQjaxgJ4a1
 b93YkAlZ7y5y8FwGEnNIrHIdT89gYlDgw04gfO8zhDdByMUKSKvjEBcJZ
 J83aOg/G+OxvIxiQj6B10Ga/BDeOOTDFQ4oMKvzAkQL/4pRDEv7m3jXGp
 nYZtDaAIWGwi35/hadXPPqNCJ+dvgYOSJnWiCOIxCErsdO1ytS0hK6TqP Q==;
X-CSE-ConnectionGUID: GLPl161wQyOlYPTYsbPHDw==
X-CSE-MsgGUID: i4Uc89ZmTYGxjAOJ1Uy3LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3028683"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3028683"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 01:13:10 -0800
X-CSE-ConnectionGUID: cYed6vxbSCK2ZNFWBtLDgg==
X-CSE-MsgGUID: S/fHW4z9QmOWsEFj92WM3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8351523"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 01:13:11 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 01:13:10 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 01:13:10 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 01:13:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpwhjhDfQpdeivCcguFjr421XAYKltw04Bcar4ATyeS3v8h87ebw4sZKgK7PfVxTKJXClWbQVjDIinLjEMrGlDXyqnk9GLG5UdLhJHXR5YGAfdpHKkcYbKnEIoBDL1xIiLvnZlaBlBQMd67SPdlMJ0LGbbxwF+qJMbZwWBbCI9tEGB66yyPnNvFntWP+WeSNxFst/A/FL9c1JYLr3g6yKHRVyczYUG5Fq6NOTgpwjpvJikNcZOD0DgUDKw15fuVJ+OfdHcaKz36uWeFP7CNIKqhL9SK/GHAWf4+PhhoNQyofOWHRj5h0sQ/hWowmLndZQ3ZrS/zfLPOVFMbouRiEQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqBYyi1Z18djt2EyyKT/hZV1AtUAbkTd2JWU0RwbITk=;
 b=mqUD3rpE+aD2qb2zbyjZjvAn3Rc+DXEPyn5u4wuP8q7eh2AxjlWFES9ZSDL20ACkSFJv/lziERgMal8B7oO3L0Ql5Cb/nUyAQLCHsMJVBQ0ab9ZsZocYsxuftZoRU3SfrGRlXXS0maUXAgnLjdl6iOyF1OkPuR1BmdwG+Z64m4CLMs0XnXTjXsfBY4ednccwkv2uo3WYpOjYkHyHC6ekHo1xuduyAoM71G51xbWshT93qTm1THtp67O4WMUmM5SgTQRBl8+fdzh4zQx2K+qZwXMidmaCgHdLq23cOoXDBp0fAkkxGevLSHvHBZJIddzkxnv4XmUmoTtnPrajk5KVbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS3PR11MB088214.namprd11.prod.outlook.com (2603:10b6:8:43e::10)
 by DS0PR11MB7684.namprd11.prod.outlook.com (2603:10b6:8:dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 09:13:08 +0000
Received: from DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3]) by DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 09:13:08 +0000
Message-ID: <c046fb4b-6e67-4d8f-adfb-c6bc24e60850@intel.com>
Date: Wed, 11 Nov 2026 14:43:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/xe_gt: Add function to toggle efficient freq
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
References: <20261111013216.3651641-3-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20261111013216.3651641-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0286.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::9) To DS3PR11MB088214.namprd11.prod.outlook.com
 (2603:10b6:8:43e::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR11MB088214:EE_|DS0PR11MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: 68cdf8d6-e1f5-43a5-1b3f-08df3fd40032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|261102123227099003|11063799006|261021121427099003|261022105027099003|261026140227099003|261009223027099003|56012099006|261026121527099003|261022075727099003|261028144727099003|18002099003|22082099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: 7A4twsPj5kLrZNwNwaOOdtPZInedS6yA1maQjk3bcW0QuMYWiQaHXU17pN49shTUd01C8haabBnIZMYHoOLboFASPhKjPAb3NtllLpKvaPDZVue6yZFTEV4W4wxnGNc88CpAexdUNLYchh+Q5iUimC9RKz9fjGEEZ+Pl8pv9iu7Yq3/dqpHkgY7UssaSlbJM/LZqs2vtAQMW9p5hziRoFZCuNdfoCDC0owMn7mZenAouZgXCl3aPwOUsQP5rHfKr3HSOeNh8moK3Tc1RT7y5OxAtRevFrOE9nWAtH2XpFhbupS2v94cJT7MH5SCuFcNQplB9ty9+W25wHTsJmXrGZfi8pquyQZclHDG7ij8SyJGw1WHoPvHkZSfmI8LO2ji7amzdR8EwxzFlRWD676lICeo5/lX2c0bvBf11Pt4LbEN90uytVSNzGjStLAkcEXPYgReTFZvlVrlHpIBrI5AKbPl2XaSY5JaxsmNKi4VPkDXEArHlp9QPs4ltwuKyrRrM5qOXMlJyub//0bXR+3OEUSdao1ogMc90eEE1tETBBVx6YDBHQP0zs3WsJxieoTQvMG2jk4rHSgfX/HWvY/5PG6vhH76nPdficLJHTXPWtdmgDqMNe/PtmdsYenpzSXTKEA1ey96G6/idrHe6Z5yuhePsAET1+TEvjuJC8K6NOGw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS3PR11MB088214.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(261102123227099003)(11063799006)(261021121427099003)(261022105027099003)(261026140227099003)(261009223027099003)(56012099006)(261026121527099003)(261022075727099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0VORnRQdFNLaXF4bDJwYkpBU3pDeXVKam41dVcyNzhNbk9NQWlEZzBjc05a?=
 =?utf-8?B?Z2pVaFJ1UXI1UlY5dHdvYkc2ZFNGK2RDSDF5eVRESTYreXdwbkhxOUZJbmdO?=
 =?utf-8?B?YjVscm9WQkdYRjRQYTgzd2w1cFI1d0NWY1FzWGRGN1lORWpKRmNBNzNWMzlB?=
 =?utf-8?B?eERRRHRiWjFNSmJ4Q2owd1krd3VvK2Z6eEQ2S0RkTHZ0MjVTaUJralJvV2tp?=
 =?utf-8?B?SWZxMDVXamxGSmhSNG45WXdTTWt5SzQ5ZVpJOUVRZ3JrZmk0RG5hcGNodys4?=
 =?utf-8?B?c2hPeURFTDh4bVNaZld2dlVNS1Z3WERaSitiR2I0NWlJcmFTMGU2L1YxN0Mz?=
 =?utf-8?B?VXRycnlkV0hXS0ZCMkVwd0x3c2gwTjlnU3JHRVRvbVM1VHhOaU0zcWFhVGpl?=
 =?utf-8?B?bU1pZVN0Sm5WOWhtM3czOGd1QzNOMlRWa2FUQXhoTE9PVkprdk0xblVQQi93?=
 =?utf-8?B?YnBQMWh0dE1takhCL2I5K3RtTjhqMWpZTTBDUHZSR0xVZEJtVlhQQlRseHBU?=
 =?utf-8?B?SkRwZVpwTW44SFQ4WGVXZjRWSXlTZFhpd2pRSllLd1QvVnNsWkt3ZFA2UXQ0?=
 =?utf-8?B?SzZDQ29TNml2bXNpQ2hYdFZ6RlhBeS9hOXE4M2I2cmlTajNDQTFiamRraUJi?=
 =?utf-8?B?L1BsZGxPM0ZiNmVCWnBWYVZ0aWZqTnNvVmgrWGhpRUIyTTZnOXQ1bHJhQ2l2?=
 =?utf-8?B?Qk5uQkFQSCtsVFE0THREOFRJRzNrV0VRc01Iem1DZWNyWmdKb1NDWjFQQWRB?=
 =?utf-8?B?dVFnNFUzb2RwUjRQWUgzNE9DbXdTRThSOE9NRkNLRzJTZkZOblZ3RkdPL0JI?=
 =?utf-8?B?eFhNRDlCdTdJamhDVzV6ajhSdXNUQy9JMnB3VHByMk93S1B3VXNxbHA4eDZN?=
 =?utf-8?B?a3h4eDBpbklCOE1rYnBnZ3BYc292NlVPQnNROGZNOXBpaUtTTENtTGtoOU54?=
 =?utf-8?B?MEFIRk9LRkxXZnJjMlBmU2pDc2NmcldkTk9hVVEzWkwwYWZyWEhaOWlWOWdE?=
 =?utf-8?B?S2F0M2J2S3pUeU9pajJTT1oyb0NZMEpDRTZJN09PcjlmWlM1bE03YmszTjc4?=
 =?utf-8?B?bHRYazUzTjdwazZhSGtHRnVFRVdsR1RaZWFkUnNyd1NzZWdFeVVzZGRkYzZY?=
 =?utf-8?B?Z1E3VkxxOFhNay9BbGUxQkpIVHFvcURHcEEwQUdjUzg2TnA5VzJWMGtsTGhE?=
 =?utf-8?B?dzV5Zk9Ub09HeS84U2hvcGVlaVEvODh2dHc1eFBxaUpId1MzYkgxUnpHZ0dm?=
 =?utf-8?B?aHhCVEZoYjNERVl2ZXRDbW5adDJYWFRCWGFOd3cxTVAydWpSU1BSZEx5a2dx?=
 =?utf-8?B?ZThabnVFWGtvOGxKYndTOVpIb2VGRThNRDVtTHVLTDRiOWYwOE9UbWJQZzVK?=
 =?utf-8?B?RU4yTnFORmVoQ3E1YkZGOXk1N2JMcmZub3lUNGNpSkgzTm91RUJFVGoxNG5o?=
 =?utf-8?B?MHJTYXdSazBFaVpPT2FmZ3JkTGgvYmV5SDVJVTRXVGt3K1dSYzBaNW9YN0NM?=
 =?utf-8?B?dlVLbjZ4VDBaeWRJanpGc0FFV1NDeUdBRmFvN0xpLzY0RFdUYjhxUzM1MUl2?=
 =?utf-8?B?MWFjUXByQUZsbk03bDRxMDBFbVJ6eVF3NXMvOVRTd3RNZDI0ZG9nL0F6ZXVF?=
 =?utf-8?B?V0hSVFdSaGNuRDEzZk1JOFZhQy82V0ZyVHdOTFUzNU5ncmRFZ0hTTHNsR0hT?=
 =?utf-8?B?UXlpMWVGQmMweVdrakFRRjBuTlhRaXA5bzZKRGNndzllNk4wTHdZUGhoKys1?=
 =?utf-8?B?ZndtK25YbXlVN0hRODBRdVNpLzZ1dURMVnk5Rm0zUU4yU0xPVExTbkVWR1RT?=
 =?utf-8?B?Wk52REdQbTlnQ2ZHU3lTL3l4bVFudEZ6L3lGeWpkKzIycTJZNkNhV05ZS2RZ?=
 =?utf-8?B?VExXVzU5dS9kVFIvRHNmR3hrSU9RUGJDczQzM000UXhQMktudzEzaWdzVDg4?=
 =?utf-8?B?U3NuWjNlL1liTDVZeVNhejBwYTgxZUw3bDE1d0RDREwzc01YMkxRNnE2Yitl?=
 =?utf-8?B?ZEtmTi82RFhNb1F3K3l2ZkVGQjlHQ0RnYzdDNlh6Tjd2Zm9YUXFVVXRVcGRB?=
 =?utf-8?B?cEYwaWRmQ1FDb2ZPSkVLNXNBQXJMQ1JaaU50MkFXTytObU1GLyt6eDhXVmNh?=
 =?utf-8?B?a09NcGg0cUtkSWZuVUJibnZyN3ZHbngxSEJrd01NQmxlRkkrTnFoWWdqMVF4?=
 =?utf-8?B?V0kxVXh3RDJCZkpzYVBJN0tUeHJub3YwR0JKSTU2M1B6bks5ek5OdzBiVG1E?=
 =?utf-8?B?ZE10NXdnUGdla1dNSWZtMXpDV0RjNm1WbEJ6Y1F4TDFDNjZockhDbFVERVl1?=
 =?utf-8?B?aUhKZzZ3UlptNTBoM3hMWnZMYmgvL3I2MXJQa2pBU25yVHhXL3o1Zz09?=
X-Exchange-RoutingPolicyChecked: 1OCCun0QYMnibq6paBQqbqRAAU+qYIOAzfyiK6Mo4Z26iM/7+0eNdnA4S0pTXDvr2rj5nTIMZzSBcXPQLqBAjV+ajRj+GH6YUEuD4V8ywvdtXEl5qPYmguTBnSgNGEwA2k5fZbeRHxBbwnV5tO9A/5KS2lKrkOFPG2QMopODiCK+vT7YNLxiLlApbbbGjPPUYct0Xwtn7tDimFaQVyfavHg+OdB+cYu6h0WrVuekHGBrq4UxI2YBfFeOnrQ6Kg3d/XcJlx5a3v/llCtF81dMipnhQsZL97yLem3H/eN0po6536eNUoo6DuFFMYPJe1e2Qese+zUItOROMgVIKcPgrg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 68cdf8d6-e1f5-43a5-1b3f-08df3fd40032
X-MS-Exchange-CrossTenant-AuthSource: DS3PR11MB088214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:13:08.1816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGu/kqoxweeA2yLDm/tGclGiNYEpsd2upRXe7jhAz4jRY2c+27emSYsgEUyN17BeqDbYK3Rf+5I/JycVQD2zGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7684
X-OriginatorOrg: intel.com
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vinay,

On 11-11-2026 07:02, Vinay Belgaumkar wrote:
> This writes to the use_rpe sysfs interface to toggle the use
> of GT efficient frequency.
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   lib/xe/xe_gt.c | 41 +++++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_gt.h |  2 ++
>   2 files changed, 43 insertions(+)
>
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index 1f0b77986..62004d17b 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -345,6 +345,47 @@ int xe_gt_set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
>   	return ret;
>   }
>   
Could you please add a documentation block for both functions that 
describes @fd, @gt_id, parameters, and the return value?
> +int xe_gt_set_use_rpe(int fd, int gt_id, uint32_t val)
> +{
> +	int ret = -EAGAIN;
> +	char use_rpe_attr[NAME_MAX];
> +	int gt_fd;
> +
> +	snprintf(use_rpe_attr, sizeof(use_rpe_attr), "freq0/use_rpe");
     Is this sysfs entry already available in Xe? Could you please 
provide the link to the kernel changes that introduced it?
> +	gt_fd = xe_sysfs_gt_open(fd, gt_id);
> +	igt_assert_lte(0, gt_fd);
> +
> +	while (ret == -EAGAIN)
> +		ret = igt_sysfs_printf(gt_fd, use_rpe_attr, "%u", val);
Can we do like this igt_sysfs_printf(gt_fd, "freq0/use_rpe", "%u", val);?
> +
> +	close(gt_fd);
> +
> +	return ret;
> +}
> +
same as above.
> +int xe_gt_get_use_rpe(int fd, int gt_id)
Expected return type is uint32_t here.
> +{
> +	int err = -EAGAIN;
> +	char use_rpe_attr[NAME_MAX];
> +	int gt_fd;
> +	uint32_t use_rpe;
> +
> +	snprintf(use_rpe_attr, sizeof(use_rpe_attr), "freq0/use_rpe");
> +	igt_debug("Opening attr: %s", use_rpe_attr);
Better to use "\n".
> +	gt_fd = xe_sysfs_gt_open(fd, gt_id);
> +	igt_assert_lte(0, gt_fd);
> +
> +	while (err == -EAGAIN)
> +		err = igt_sysfs_scanf(gt_fd, use_rpe_attr, "%u", &use_rpe);

same as above if we can pass the literal directly here.

Thanks,
Anirban
> +
> +	igt_assert_eq(err, 1);
> +
> +	igt_debug("gt%d: %s use_rpe %u\n", gt_id, use_rpe_attr, use_rpe);
> +
> +	close(gt_fd);
> +
> +	return use_rpe;
> +}
>   /**
>    * xe_gt_get_freq:
>    * @fd: pointer to xe drm fd
> diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
> index 9ef15d7dd..ce09d6e6a 100644
> --- a/lib/xe/xe_gt.h
> +++ b/lib/xe/xe_gt.h
> @@ -29,4 +29,6 @@ int xe_gt_count_engines_by_class(int fd, int gt, int class);
>   
>   int xe_gt_set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq);
>   uint32_t xe_gt_get_freq(int fd, int gt_id, const char *freq_name);
> +int xe_gt_get_use_rpe(int fd, int gt_id);
> +int xe_gt_set_use_rpe(int fd, int gt_id, uint32_t val);
>   #endif
