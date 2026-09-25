Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC84C9830E
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2026 10:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1FE10F9CC;
	Fri, 25 Sep 2026 10:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzHDCj1u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A4810F9CC;
 Fri, 25 Sep 2026 10:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790332898; x=1821868898;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vfrNUIOjQEF5otVEPfKGuyJalXVng4Tj9Aoi1OYwgYE=;
 b=BzHDCj1uVK/0h4SS4BgV2pYFF7f9oZDJs8P3Y56TBXHi9jl4PRMclosI
 G7X022tWL+yDsRVthWySOFn12wJ0mJoF/FM2N+RierOQGEcQ8N2CLGH/U
 Ai9k7HTbNQX+ei4dLTs8ccbA52uYS6Yi7GEkDnuPjbednHnTykO1MnZlC
 TJI9WYK0+vfy8fhVvMptY7j3MTyHkPJq0tneU0E99En1GNvlUf9D7H/Bl
 +RAeGgJIKcoSmocimxB485IOFwguWPWbDbrt2rHEQD4Odk9SUsdwCCcJz
 LQ/Fer++igthJ4Z9US4Y9Oe1r+el3Wu47dBCMzT58Ikox2FX72pAZZeqe Q==;
X-CSE-ConnectionGUID: Bihf/O+5ShqrOHyGG4skKg==
X-CSE-MsgGUID: FZnDEdD7SFGmrZOZQoZ5GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89980665"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="89980665"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:41:38 -0700
X-CSE-ConnectionGUID: 99eO0ljwT/ePDl9E8x9T+A==
X-CSE-MsgGUID: YP/pqP+kTDSFPg7kJUQ5uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="272432930"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:41:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:41:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 03:41:37 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:41:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkCtbTlWIv8yADwm7kmLk4LxlFvPx3uVbHbfOWUfMd79993sKZ59zvxDPfDZ0QypIqolIo2a6rKMeTSok5BzPtuTUGg4CbA2XwJxA/sOHsbYKm6VSO+5EU581B1PZXP4uZr8zftNOK7nFkxg0w0v9jGLBci+Rc06XXr7gI9niBsShq2s05kyw3wYP5oBHl3J1YF2cewbF8uH2mpQmD0biLOFWYRJFWJjvwTBIAakyoxYRh3ucaS4TKjDys+vE2UqtDgcr83NW+JU8/wdSCXeExse1bZjeaj/B1q2/xtjROpzaZtF3utyQ9fOYdJBidchJNpEUDWT6CX9S+k3v1VaXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUdgi8CKBQCoQfJ4tJgAO99jAPS3ZlB1RFJ2Iyggm5M=;
 b=sbXmpXF30M+QztZ3pWqa96OW4hGJcbKuY5nt4pDTkQi1ef5yxuuQfwxGAEz6xNQvZ/8aD5YBw/kvg2VZ9hQmCQTA4Y6TQ0F+7bqz/u/ASb9TfNL4cmelA8GQ0lV9zDjUpS4eDr5A7HpI2E0mWVfZpipwTsylUJRIZDHhPkxLrFFtnACZUU1CRS2hPiF+14MOXqW1bp1s2PWcGTRIA+7fEERRqE0PuRuLF+a4FpygughSffHeEdBXYQlV/T6VE7UaVV/uEMPYAAyx+qzCGInOCcr5S+xT6SFmF2CHcf8GjMxPQaeaMGt4NU6grZRqryKl+7qFRhs5NC+pawBAbrYNxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by IA1PR11MB7919.namprd11.prod.outlook.com (2603:10b6:208:3fa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 10:41:32 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 10:41:29 +0000
Date: Fri, 25 Sep 2026 10:41:18 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, Zbigniew
 =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/gem_close_race: Skip offset
 probing without full-ppgtt
Message-ID: <re6q3ilbzhuedoitpwg4a2ulqll43ly4fbldsbnb57zvy2hiyp@ow7aklzpotrt>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260924152443.829382-4-janusz.krzysztofik@linux.intel.com>
 <20260924152443.829382-6-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260924152443.829382-6-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: DUZPR01CA0345.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::28) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|IA1PR11MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 4901890a-cf30-47dd-2291-08df1af18eab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Jo+MbNUoRYcUKCRkbnin6EUAwBiIpRKeiYwCD3OCcHqNnracRnnXRbw84lRXkqRcgF1WQo2jq7aLcpDD9gdV8tYLDOzzsRqYU3FFB56CsQplOb37BhJhuZAajKvxHHAcjmbsK3jU9kP3mZgeu/HPFqnn9+0efM+H/Sr0Gy2qF7+5BVWu0ITIhVaTZPHXULsfkJe9TIrXCZcl0p/7Si8TbWLp/Dg28Qq2K0c2MD+V4ANU8zicvB5N9kM1/iVvM8F/HsnI3kQBIHhmZmZjnA9VW/qkFLClES/ZY7tXvySMw2sBT7Sa1JSeDefHdQ9bDEQfyTz3iVD2wsIf1ru2a7VnQvdjjRtr9dwk9v/yPNumoUickoUZvWyi7S4xvgnVI5+QvE5/6W6ovRyxWiArnoCqpwBg153900ii8vRHmj96dIp+ay5SoJ9Xjb6aj6y8KnTqVCiEDcTrkIHSQAN4H1p8i1ZZYwpR8kualdQfI5KC8Kxs23fwoSyu+AoxcogaAh5mTG/cTxSgVl0J1/WeZtUNUtVFj+c0O/BXviOJTN4IrK9/WWW/1hOnHTN/94IYBtYjhcTqbGAnF3Q4FWHVYwU2b89cjZdRb3WER/8enlAaX8OZL65/UPCwbvI1L+QevpFcUFwCcUzfK7junmNXRQ7sWn26gRmkfifXCCH4nwNRXt0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEVmTndFMFFrTW5TaWdDOUlFYW9NeDFqUXZuWC9ndzJGNUx4OTdveXR6azdI?=
 =?utf-8?B?MjVSenZCanhSTy9nZkhMQ1lOR3NmWW4yNmNrTWluMk5UYXF0ODRaS0VUdm9n?=
 =?utf-8?B?V0FjMTBtcGovRmtIMUVaVTFOc09Mb3FXdkNROUpraUpIMlBHTEkyemhpZDRI?=
 =?utf-8?B?V2ZoYTlVSkVnbUtMU2hPQnJ6QSsxZGJVV2w3NmVYTnAzMU9WOHJTREdtNi9I?=
 =?utf-8?B?NFVFYk94ZWh0WDFJTkNXRFRrWGhyMVdyQkI5dWQ1TFcweEhMSW8xRGNvQUp5?=
 =?utf-8?B?dmovMGsyelJXWWduWlVZM3RNRjRBZm55YU1FUU9zLzczODVhamRtSC9KOGpQ?=
 =?utf-8?B?dnRQeWNrWHhBQmsyaUdNc2RCMFNsbHluejVQSDVPMUhYZEM0b3hkdER1alU5?=
 =?utf-8?B?bERJaTNwMlpwa3Y0VEExMUk1czhFUU1taE12Wi83Wm81N0pTWlg2MXpYSDB4?=
 =?utf-8?B?dVJZcWJqbU5tdnZNcFlIemhQWDdzU3E1SDZsdkd5dXNsUlVZN29qbGZBSWdq?=
 =?utf-8?B?UzgvT0N2WGwvV0FsNVVaSmJLdDF6MlRkTjI5V3NRTG9oUmRzK1JhTENXWU9E?=
 =?utf-8?B?RFlVOGZnbW13NFEybTdiSFNLaEJyaXhlZDlSaWgvTW5XYmVwTW5kMFVYQVFZ?=
 =?utf-8?B?TnY4U1NHdVg2T1o4Q082dkNJUnJZcXFXenZSYjU0UlVFMHFyNmozVkZXTHdM?=
 =?utf-8?B?b0IxSVhLMTRLWWpPSUxWTGpBbjNEbHE0elppTTlNRDE5Q1J2S094ckZiaWRa?=
 =?utf-8?B?YTBsc2lqRGlIS2hoVS8zUWpFcithS1A0c0xsdlhmam53UXNRc2ZsMWdJS1Bp?=
 =?utf-8?B?R0E5UlhjclZTOGw0T1hhdDVaVmJvTExua1dZdGt6cFBxQVFTWUtIY0FCRk51?=
 =?utf-8?B?YkFmUkJBN2grUGN6L25JYUJTTG5sWk5sTWZsMHhMbFdFSUVuaWhEZk8vVVpp?=
 =?utf-8?B?V2xaT051K1FvY281QjdyMEpZTW1QZXlYVW9BVkJoMWdFYVlFYkw4MEtHVmFP?=
 =?utf-8?B?OVNCekc1STc0SzRqZ2tkaEdSWTE4NEQzNEdoMngvbElBcFVMZWZwS2xOLzlT?=
 =?utf-8?B?RmpncSs0Ym1EWkgxajJsZTJMd0V1V1BWbldCcjZQMUx2eEViS2w3N0Y4aHk2?=
 =?utf-8?B?TjJMV3pkcEtuVkFKcXdTSCtRbEJmQ3FmS3FSSVV6aktQK21yYUhVRjIvRG9H?=
 =?utf-8?B?N1UzOUFYQWJIcTB5QjlwM2lWNW5tc3RZQ2thaGh5REJhQUU2VWpxbHhzRU5M?=
 =?utf-8?B?c3BUU05zRXJsYTFtUDM1My9rblVSMVlFcHVnenhiTEVBRU0wbUtWMUlhdVFn?=
 =?utf-8?B?bWk5ZGhRSE1uUmtyd2RXVzZDd1Q4ckNOcnlHVzVlTm1vbkNxV2twdW1kR2JG?=
 =?utf-8?B?YkJrVDZFMEdZSGV2OTZjL2pIbFV0aytNTjQ3Q1pwUEhLT3RVb0c1RE9XcnlD?=
 =?utf-8?B?aVdxNWkxZ1BxY2lYOHpDVS9JbkJEdVZic3lRUHg4MExoZWlxZVF2dUJDTzdz?=
 =?utf-8?B?OVJHbFplTDIvMFd5N1Z1RUpKN3pqN2pXZFlqbER1bU9qOEd5Y0xSeGhLTkpi?=
 =?utf-8?B?YnlSKzdvNzd0QmQxQ2s0N2tEK2FlNnpRb2ZZczl0bkNiUlNyajRHZG82SGxv?=
 =?utf-8?B?NWN2aVhTRkVDTlVPeGI1aTJDYlhCNGd4b0Z3RXFxRHI0aGk4QzZLaERqZnY1?=
 =?utf-8?B?bStvbC9uZEFGTTFDNDZjTElZMENBNzkrbFBCdytYWi9QK2t5c0tKcUVYVERh?=
 =?utf-8?B?czlmNkxPbnBmVEl2UkVzd0ZYT0VvaXkwYzNCK2xoVElYQ245aTdZd2RJaWYv?=
 =?utf-8?B?Ti9xRnVNWTNEYm9ibkY3emhFeHlZTTN0eTRjZU5pOC9WTUlIcDhXcysyanVz?=
 =?utf-8?B?QkR3ZUZqb0JOQmxmeXl4Y3ZWN1V2VjJrM3BKUno4OGVYVytYZW1OVW9kN2ox?=
 =?utf-8?B?aVJhNEd3akhaLzh6WjgydTlIN2UvYTV6TUFpTDBjb3k4N0hPV3ZDazk4cjFj?=
 =?utf-8?B?eC9mWlo1WkNpS2xyTldZdGZEZjNTazExN25wcWUvek8zbDkwdmJlWUk4VHJK?=
 =?utf-8?B?SWtPWFluQVczQjlJWGdad0xzYktqK2VFZ3p2WHNXb0RDRUNsTU1UZVpMcVFq?=
 =?utf-8?B?ZU9HamVIakg3b0hBYzV6TnEycEVWaExtSGtGNzZPRERwcUo0TklrejQ4Wkxh?=
 =?utf-8?B?V1ZHS0ovanNjWmkvTDk1bGdyWk9DNWM3SDJkckZyU3ZnVStjYmRJb0pYOCt3?=
 =?utf-8?B?VWpvNmpZZTVmL2lDK3JVaFRSaVBFUzc4Y1A2dzNHTjJ3SlZRSTNmb1hxR2cv?=
 =?utf-8?B?czZWTFE0VHoyWVlHc3Bkc1NXTFlXVW1FTkl1Q1lSZmZkZGg1NmVJZm9CaE1O?=
 =?utf-8?Q?cPP8M5x9AV75qEQ0=3D?=
X-Exchange-RoutingPolicyChecked: 0dkpf7xxidMtFSW3l5GF090ekAUsms1kIm2e7oRwkl9x1n3Ty0tmKxHxieM9SUD9hsNFCzUfsPn8HcksZzgiN+wdWV8JNkQJY5olFZAo0DWBmxqKySO0ioO3/dPCFPIApb9Yf3beXT9Ekn3rN+mFw+B9elzX7q2+g9YWN7j3RBa7uwUMtqn7wm6dbgsHPYLoJBF7RxGETtUIi6nSsCuCvHg486J45vpzA5N5N87ce9lQk/zFp8k71kZDt1QQ9dZXOcjQqG5PZtCsZjBoyVpvn5MswFCOxa15lzZ9g9KtNYHdZFyGXUGdp7y0zqcig5bQMcAyShNkUzcSou4vw4o2Yg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4901890a-cf30-47dd-2291-08df1af18eab
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 10:41:29.3827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4+5IodWB19WcEkgohsg9i3vZoRkBCHzcV5Yb1vb6tD9zLmBh8Cmb+E7xoq1vqtFnYP1y2pdHO5jKHfF2Z3Xv15yF2SGpQvRp/aD620+lZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7919
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

Hi Janusz,

On 2026-09-24 at 17:24:18 +0200, Janusz Krzysztofik wrote:
> gem_close_race computed exec_addr/data_addr via
> gem_detect_safe_start_offset() and gem_detect_safe_alignment()
> whenever the kernel disallowed relocations, without checking ppgtt
> mode. Those helpers exist solely to bootstrap intel_allocator and are
> meaningless without full-ppgtt, since the kernel can't see the ranges
> intel_allocator considers reserved and may hand them out to other
> users, as already acknowledged by __intel_bb_create() which enforces
> relocations and skips the allocator entirely in that case.
> 
> Require gem_uses_full_ppgtt() as well before enabling the softpin
> path, mirroring __intel_bb_create()'s logic, and skip the probing
> calls otherwise so the existing relocation fallback is used.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Assisted-by: GitHub Copilot (Claude Sonnet 5)
> ---
>  tests/intel/gem_close_race.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
> index b2688774d7..ff2877f67e 100644
> --- a/tests/intel/gem_close_race.c
> +++ b/tests/intel/gem_close_race.c
> @@ -348,11 +348,20 @@ int igt_main()
>  
>  		devid = intel_get_drm_devid(fd);
>  		has_64bit_relocations = intel_gen(devid) >= 8;
> -		has_softpin = !gem_has_relocations(fd);
> -		exec_addr = gem_detect_safe_start_offset(fd);
> -		data_addr = gem_detect_safe_alignment(fd);
> -		exec_addr = max_t(exec_addr, exec_addr, data_addr);
> -		data_addr += exec_addr;
> +		/*
> +		 * Without full-ppgtt the kernel can't see the ranges the
> +		 * detected offsets are meant to reserve and may hand them
> +		 * out to other users, so pinning at a detected offset isn't
> +		 * meaningful; fall back to relocations in that case, same
> +		 * as __intel_bb_create() does.
> +		 */
> +		has_softpin = !gem_has_relocations(fd) && gem_uses_full_ppgtt(fd);
> +		if (has_softpin) {
> +			exec_addr = gem_detect_safe_start_offset(fd);
> +			data_addr = gem_detect_safe_alignment(fd);
> +			exec_addr = max_t(exec_addr, exec_addr, data_addr);
> +			data_addr += exec_addr;
> +		}
>  
>  		gpu_count = igt_device_filter_count();
>  
> -- 
> 2.55.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
