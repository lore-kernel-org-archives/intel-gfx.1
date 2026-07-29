Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6397BC53219
	for <intel-gfx@archiver.kernel.org>; Wed, 29 Jul 2026 08:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CB410EAF2;
	Wed, 29 Jul 2026 08:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnA3pKOU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA44E10EAF2
 for <intel-gfx@lists.freedesktop.org>; Wed, 29 Jul 2026 08:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785312430; x=1816848430;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cNFDldWw7mjmSPK3UkHwAe0hcAlSnayxHyL4Qt53b7c=;
 b=ZnA3pKOUero6esixqxUNlTaub3N3f7gKCavOJ7s18NJ2NMghThFa/eVj
 AG2uic7qdWQoAbzYV+D6FWkNmJOTgVNeo63tzkCdHICsRoR9f22ZNQgBA
 u5sejZ9AuxdmO6pNy7GCba9m6n1mhAx8pT7aPKs8GtwHMK2HiiI974wDq
 Hhs8HiYXHblfu37VzXrF0t48lC1XEcYmmp+IVxZb7Q8XChFl61W9ae3tg
 HP94R5dWvaSXiaS1nbXMQQ3a0+1jd8E0dYNj0fS6WsQ3QHuJkxdFBidJo
 E+GiOa89JYT5VUQp263keX+NK2VSkIbLeLCG/CfZfY+tY6EGnjCg6+FF9 A==;
X-CSE-ConnectionGUID: 6jHhkJPeRDe2bYp1vmCsSw==
X-CSE-MsgGUID: Q26nXB7PRZK6lElP+4cGNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108707354"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108707354"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 01:07:07 -0700
X-CSE-ConnectionGUID: txPkXFAPTwq50MILIkYm1Q==
X-CSE-MsgGUID: Eh4F8bd3SieKxRM4pTAzMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="256026791"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 01:07:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 01:07:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 01:07:06 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 29 Jul 2026 01:07:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yy5skABLlafQQvqiNZN/wqwL99cTokPkrdGTBmEekDALUWTpWwMRzRbwURMv0HsXfZAOdv42vO9eJWeYDpoPKuXICmCZW76A/yyZVf/bi3APxUAhw7i88iz6cklD2nHPCGvZ8LgbJIbjXNHk569tp3Gziy+WilCrgCKpiPvikyvNotPf2C6LIvDcfEBGfD7ws4EtkhZNQzaeyV2A8luOTsI/nW82wIufdR9YRReuWp799JQxy5itzBIK6lHBfYN5aorQcxpg02Ml9OQlPBQrBwAmq/U+CNiBsaYRpZvwmAD2w/pdgU01Xiqj0LUzgKu0aSVIu4MDsnxphN7UmbiXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6PSFs+PTJ7oQdA1V/EVSSFtEZWzhwYnGQNk/7nJEJM=;
 b=LIYzhsnzw+mWFNJZHkjYsQruQpCQY3CpFZaW+4NqH4lHfeT7T8EYrtqSmUFD8scAtDdJje+JHm4mwYjbZQshzsAT+agUJn29vqGM2Zgvad/RKegrgA+LKbpq5kXl1kcBZJNKgjJgG/OGi0JDRlacbZgr2j/PZ3ZckP9T2BARnZZshKPBpdk6PesUFMZnAyt0leNBgnMnYgwGegPLc26+6NfCCIriPmQoF/aHMKQVM7ur9Ianal9jnhyFWOlm3VlN8WtyqMEnVlQvI84U0kOvuBycIJR4g5qwRs5ryULeYn4gOE3d3KKRg8GiSxhl1oYtBDyQS01RKqiwZ91EMJ9c7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by DS0PR11MB6494.namprd11.prod.outlook.com (2603:10b6:8:c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 08:06:45 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 08:06:45 +0000
Message-ID: <92ddca76-3752-4509-84bf-2291351cc76c@intel.com>
Date: Wed, 29 Jul 2026 13:36:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/dpt: remove unused include
To: Jani Nikula <jani.nikula@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20260728175959.622050-1-jani.nikula@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260728175959.622050-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0364.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::14) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|DS0PR11MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: df98cde0-109f-46fb-28e3-08deed4854e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: nXhayeWT+Ve5rhwIzrXdoTX3mnoQrgrj6pvszYBz16Mau6HEgzZvJ58A4sJ3MlJVYzJIn2aHbvT1jZIYZzkjEocJTzn6LaMB2I/gHAei1V5Gb828y7F6UgktiQ1icywdxqpmT6qk9TQEl65M8uBacQ0y+yai8y9NUuyuu3/j89RSj+FU3mxbj4ROIS+01yK/1QnO7yGlRU5AJk6KwE0UYo+gP6ccz011/I9u5eCKuBw7u16MwICEcTzMd3fyHFEeiidnfPMnWCZUpzCAUhkPso+BKEvUz/pVmydfPO8NQ5CzSSbQ8KP9lRBzpDH+t0SzKEE8ojL21tzATBGs/WVltq2WTCy5D1L8RaCoJP25JmwPQ3kV8D4kIf/NcTt+3ZMOSj4oz+7goKOHRor+1QjgIf29/j7Ky9I+EpEtja2VmxBe0bjGd5RCg213XqOLkBim2m3uIxCJxsVc2mTgCVUI4kavntuTBtedvrMxCOwYYYUYg95xzsmu5C2tv7g2BzgRCB266xrXt0Vtv7afbruqY79TbSiVUsu6Q1uSlmKzYhKth99zewWSgCxkSxKPp3QZa8I13hNhbz8rLkTNoNO0BMHM8C/K614Sy5S71grN4MQRwsW8xzJrYPGpEosvvOyqrxTKla696Jhq4Ez/qJxynFvDnB+SLJ/Ez1KJSiFI0Po=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWd0N04xRDd3RldMT0ZrdFZCbEkwZjYrRytOQnRPRVkvbnFQZnBGVERKVTdq?=
 =?utf-8?B?OEYwa0I1cjVraTMwN3ptK20wSGZteFJxYmdkbGkvZlJXeDJzRWpoWUhGd1lN?=
 =?utf-8?B?eGpYSDkxdms0MkZxZkxzZXVsWFNORHZoZHpWaUZDUDFDc1BDSWpqejhoa2M0?=
 =?utf-8?B?ZU0waWVGYzRJN1MzODdOR0xJSmY0T1ZHT0sxSmZGbE1MdlRuckZVSzN6elRC?=
 =?utf-8?B?YmYyOHd2amlKNzFuQm9PcHF2NHZQOEhNUHErOUladDhTcS9iTHNORldpR1VY?=
 =?utf-8?B?cWRPc3hlcG93OU5BZnUrZmF2b1Y0eGQ3bnk3VmpxMFkvQmlTaldxRnNFVDVH?=
 =?utf-8?B?MStyMVRZcjgwcHI1Q2VPS3JGY050dDRIa3l1NktNZ3hUdkozeS81djFvam1O?=
 =?utf-8?B?MXl5QlFvQW0wVkhJR0VQQU9YY0p5YmRwYndvUFhsWGxyUTZjcmEzaDFmNzd6?=
 =?utf-8?B?bFlZME1CNnY4ZUZKaFJqVEtvazY5SWRVZ01NS3NSUWpQUnFFV2hXaWdNWlJD?=
 =?utf-8?B?bmNET0lSbmFtVjVnTnpreHZwazlrS3BIdEZtZzc5dVUwSG90MFRZVjkwZ1pM?=
 =?utf-8?B?Q3E0K0hBTmJ5OWU1MzdiSG9xMkpjSUs5aG5kUksxZDZFcWcwVkhuY3pZS2Ju?=
 =?utf-8?B?azdCMXhBaDE4dHRubklrUEV2RmRVRWJvak0zQ2h3blJmbDVUa2FPVW5pL0RP?=
 =?utf-8?B?Sk1WUU4vMVYzMmdIVXJ1YkZZZ0pGdlE1TFRINlZFQWRJUWR2WVAxQXRCSlB1?=
 =?utf-8?B?b3RiVk9ETys5VjA3cGxZdm1zb3g4a2xpZHNRdUwvbk1UOEkxWklsMVI0RE8w?=
 =?utf-8?B?VWgxL2xYSklUU1FrR3Q1eFNtV1kraW9ZTStVTHkwMU1YbVVIeU5TSmhWUWRv?=
 =?utf-8?B?LzVqd1hPOC9DVm1FV3l2L0pBRUh2M2hSZ20waWV4RmxaWGlzTlg3NUxIWUNK?=
 =?utf-8?B?RWJxU0dpSFhBWUxZOU1OT2tMem14VS8yYTJad3FrSGg3RTBRK2VJbzZJTXZX?=
 =?utf-8?B?YW9GaUVrdzhxWG5FY1hrOEdyK2RSK2pJOS91aC9Qcm9lU2gwUldkMW9JaUpa?=
 =?utf-8?B?ak9RQjFXdUZSKy9uSUNDU1RpcGYyUTRuVTRNOWNNWXZoTGdFNlExWVdGRUF4?=
 =?utf-8?B?QWp4dmNDWjAzNkoxc1ltMElNdFlKbUIzeVhNMFRBWHF2azB5dlYrd0w0ejVX?=
 =?utf-8?B?UnRuVWVOSWwySHZKMXRXd2xxZ3NvSUxaR3VIbXd0cGx6TmlUV0dHMWZGVG94?=
 =?utf-8?B?VzVtWU41aWprZVhESVBpQzJ3aW5Xd09HdzV3L2hYMFV1ZDIvYTBaeXRBbVVW?=
 =?utf-8?B?VGdWdU1xUHdBVU5jY1haWlU5WU5sN1k1SmxzdWhvV0R4TmlPQ2pEQ3FLYSty?=
 =?utf-8?B?MThTbjBxT3dTeEhPWkV5OXJGZFRhYUsrbmpkRjdqTHV3a2lSWEc0RllrdlhU?=
 =?utf-8?B?am1wbTIybTRiNGdteHhtbDlUekVOUnBGQ2RLQjBhZ2NHM0ttVW8zYm94cjZs?=
 =?utf-8?B?bTJ2SUdPODFpcXVtQlU0TDdQQ0p0cllFMVBlalphMkcyK0t6Tm5TMnJ0ZGdv?=
 =?utf-8?B?dmkyWWxtYll6MnhhME1CTmg0VEZnR3Y1MlRMVEo1enVWRjdRWlpWdlpTRDVj?=
 =?utf-8?B?TXhrSUhPTVRCRXdIM2ZlZlBtVEU4NGI4b1k2TEpramFzR0s3MUh2U0RZYlM1?=
 =?utf-8?B?MUhJSkF4bHNCRUxyR1d1U0o1QmF2Z1A2b1dKVnQ5aVlESEpBWGcvK1M0NGZS?=
 =?utf-8?B?SDdweXZva2tET1BvQ2JQczMweGwxWGwvSnA2Skxqa1liaWVYVmpqUXVCajNE?=
 =?utf-8?B?c0xYZUVjWHlEOGk5ZkFQY0FIeW5aeERjWXlLT3FEMElCbXRpTXJJOVBrL1FI?=
 =?utf-8?B?dDg3cFEwSkNiVEZRVXdMK2pBUjB4ZFg2bFNsQVQzYzlJc0NOY1poSEt2RTBE?=
 =?utf-8?B?RzJKMFJXeVh2eHI1MUp3UkdhWkt1cXplUmhiUFRzaWtlU2lBYVJ6YlRuRmFv?=
 =?utf-8?B?OGhwbWdINTJsc0dwNVdIUDFoNjhzQ2JDelNhcGV5aXl0MWZRN3MyNFFWcGdT?=
 =?utf-8?B?ME45QXpGbVB1Zk9kbFhhOVlOSDVmTVI3MVRocTVoWVdTaDNyQk5pSHI5bHRD?=
 =?utf-8?B?eFN2UDhNckU4SlQ3NGFMcVFzRnpOQjZUc2xlOHBPeG53cGQ4aHQ3ZDRjbUl3?=
 =?utf-8?B?a3k2ZXhScHFHZUtldlZ1WndVUjdKMm9IYll2SlJuWTlsREQ2L0RuQ0sxVW5h?=
 =?utf-8?B?WFZ6YS94TjcxMndsMUVxbElyT3FjbmsrUEJQWjFVcmt6SDJMWFozNzdYYkFM?=
 =?utf-8?B?dFlxSUZRQ1F2clpRZmNhajZ2RGoyWElvYmNJbFRGWGxkU1dnZFJtR1pvUE04?=
 =?utf-8?Q?zLS9NLqi7zr/1teI=3D?=
X-Exchange-RoutingPolicyChecked: TBBrKRDridvKR5dXUgvIwsT8wAGT2WIOHR7qmxugcP/IqIlBpnbt/QKQox2hfke4KMcLpX9/YuHFbhSUjiSSdmtClihGE193/XJMraToiTeHCKuaSGQ3E02XDIZQsCf2Lv/Av/Alx/x73aJPaUKWIQPYxVDcnDb9BFPxER3zrHRVk2KLj9T26pm+NoW2rz6ChSTNah2YfQySkJTBBFDSMbW51kJmkSL9FOntzr28oSvom8ze81YEk6il7mN7O/j4VINFG5IpQzWFPZ4fgEK6lauRDaRw0sPGBDaidCxOQdrb4p3fTuTYsvhZjOKBraXzkMsGTmxq6aHKhS+IuK+BOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: df98cde0-109f-46fb-28e3-08deed4854e2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 08:06:45.4776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYOYO51+2fGXxPGmu7L38mDF7w/ZBm/QNeNTjKoHp2FSz//fC3igggTMIWj7pgvM/J01PYgVwHMzVaayuWvd/Bx3WrzplY0FKXK8xK8Yp0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6494
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



On 7/28/2026 11:29 PM, Jani Nikula wrote:
> i915_dpt.c no longer needs intel_display_core.h, remove.

LGTM,

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_dpt.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_dpt.c b/drivers/gpu/drm/i915/i915_dpt.c
> index fcd7cced771d..e01dc4de1788 100644
> --- a/drivers/gpu/drm/i915/i915_dpt.c
> +++ b/drivers/gpu/drm/i915/i915_dpt.c
> @@ -6,7 +6,6 @@
>   #include <drm/drm_print.h>
>   #include <drm/intel/display_parent_interface.h>
>   
> -#include "display/intel_display_core.h"
>   #include "gem/i915_gem_domain.h"
>   #include "gem/i915_gem_internal.h"
>   #include "gem/i915_gem_lmem.h"

