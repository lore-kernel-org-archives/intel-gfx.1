Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A41606D832
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2026 19:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bANXXUyz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B0A10E8C5;
	Wed,  4 Nov 2026 19:17:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC9810E8C5
 for <intel-gfx@lists.freedesktop.org>; Wed,  4 Nov 2026 19:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793819869; x=1825355869;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4Q0IVB7nbjoo/ArMt9U/uLWGhwTa9p/8WbqMNVj5oXM=;
 b=bANXXUyzK9oHoxI97Gle4rsLTAamCW6mKLCOvis26UWY36TcoIo6YTKg
 xCas84QoHs+sgxxr8BKvvtC/PGhjbhsTU0BEKgCRUDOs/tNTBcEgjiKY/
 +vnYXXn9ycEMaA1L2KpqK/xV0buMPiNHDT5vwu/8gbKMIpYiu3eejyPm2
 wvzbrTPAN9F4YmY3PWMEDKJ9c0m8SNwePr933viGgx9zVw4Cgd8m56YDH
 ZvaJNEc0H/aXPxGZ6K2K04GtOL1//+gaU/L2bwLG6BjmIEfHL+vHJsmXW
 jYktaxo58T/FM2Fn5vWSIB5qbLOnUIpn4ydtkH3nvko1aBzTk/b2R3FS4 w==;
X-CSE-ConnectionGUID: xfyHJIl9SeGLYv/eS+FiFQ==
X-CSE-MsgGUID: WpTPwZisSUSaplI6yC0G+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2603839"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2603839"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 11:17:48 -0800
X-CSE-ConnectionGUID: mehQiuXiQGCSX/6mzvNkNA==
X-CSE-MsgGUID: xLBEdzt/Sa2LhAY1WSB3Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6853739"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 11:17:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 11:17:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 11:17:47 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 11:17:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ms5C526meefFDquB94Bw4eRfT9A1gB4yPeEyAZAJ6TnJlnb7pfCp36UqvUGBevHt3fep8kb+Vz6/62n6wMcuiHmqJjjnkP5q++Iu6i4S43qfw1kkq6jlY+ia8TFdKaj3J7PrARFCPMRbi86VGmhQn6yptYEDk4bbJ/G+SUHfTPcSojl0Pw/H8/Orjwl3gZZey2OuhZWdJMA0DUioWVxxtVvSUkIAARNKes85Ckt9oKZwBN80BD2Xj2FQkbGcApzig0Ktb2LmqTpKU1fcobcVWH+KBN99s3whUm8VWKjKK4S62zX/qJLWqTyHBR2I7WycoOHiT2A/v7B1DmQSZrhPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkSprTJc5zGARFVlytpzUaup2VouSwDQFL1GM5df4CQ=;
 b=lWRA0Mh9OE7AvDWlj7tq+w3aIgaBu9ugCBku2nRytvXlfLAv8/8Cv3n/qN1/yy/d817Xy3vXK+DBRjPKOApnVw82v025KhL0rhJPc6K0FDuCrArtzUmS3mN74qP07ROLmTMF1dZ3+sUimNIVwwecO2negHJ7tqbATJXuJrxe5JaCFj07hrcoAT906M2CN2Z+s80PzC4nkwe7qX+TJPSuuZvKrRsl5TS1+/RdazICYH5Oz9QMQGYjLlDXlABX/d6FW/uhJmT2k+IJzxS2xJPKSCSXTlAIY3BuO6j6k3ZYDhCkUR3WctG4ufuqgrxfk8241ppd44G3KM67Ba2OgSf1Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SN7PR11MB7668.namprd11.prod.outlook.com (2603:10b6:806:341::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 19:17:45 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 19:17:45 +0000
Message-ID: <9a10e9be-d926-481d-81ca-bb002f760a63@intel.com>
Date: Wed, 4 Nov 2026 11:17:43 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/g?=
 =?UTF-8?Q?uc=3A_Test_GuC_v70=2E83=2E0_for_DG2=2C_MTL_=28rev2=29?=
To: <intel-gfx@lists.freedesktop.org>
References: <20261102221518.546010-2-julia.filipchuk@intel.com>
 <179373464478.112219.15978167081953155286@221881a7231d>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <179373464478.112219.15978167081953155286@221881a7231d>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0355.namprd03.prod.outlook.com
 (2603:10b6:303:dc::30) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SN7PR11MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 661d1d87-3955-498a-9fcb-08df3aa84e28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003|261009223027099003;
X-Microsoft-Antispam-Message-Info: w1nXZbzFoBqRB21+1O+abZOLEhPa8RTvhGjhuYQuVuT5AKLf8OwOa4CuJMC3tQ8cLUjB9KgQ3KrCUeZMFMuuOSzsoqh49xrQYvxsIpN2JSsntIFHbBmtRQLQ8l6WxDAVFnbhD6STSjiNxCnwYhOFuRmx9xZ6trosrqXL8zNB9eSZRezqEUgAxQ3YaCg+kfKooCrzF/P3X5Q3pIrR+rfSZ1+c0cfeWpEzUJlR9AE5r+lr2oOW3WYAejvfvUTQJkOp4Ze6G3thYa1dQIERIUzhrtD3dG2O1PSAWGFocBoLKiM4HDwDUze6d8XnRR91CEU8Ypw6culVA8JhVZ0qWPJBQa3Po/UO8PWpZLpcSzQgIsu214rokAjt62jmvQVkqdaS5FaLbrfUgDyWEBfEO7lx2BU5z2OZrCnpZEcRGHsUV+4fEk7M0B3y43e8NU9DSuVKROlKDOW0gyxVKfGKOh8pNF+Fri8pMgq+Cmoaa+G5XHmMQ8K9qEoy7y40c0iDDtFQG2qUl+G1dlKcrdJOTMS2v+7xF0CZUpXK3XooiE65u/7OetaKfiiblxD3+Lu8e+rmpgfndQfBKakqXEbOBeqNDK0pHygtuU2Bge7lAe1RGEiG9MkX6NzpxbWZATygsNTIMc05FY+HL0YGFQ9gXTXYx28WZOscPZdlgFcvQoBIQ0Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEtCSlRmK2JkOERYREE5V1pFY1poV1gzN0IvUjlTVUdISDlWM29DV1BzQlRp?=
 =?utf-8?B?WURYdGJVTXRvSHBoUm9acTVhV1ltZmNBZktKWFVxS2QwanhkeEF3QkdmUUE2?=
 =?utf-8?B?QXhHa25saWpIblA1VmZmaytSL0RlaUlUSUFDZG41NG9SNk4vT21zUmg5Q2Z3?=
 =?utf-8?B?N01iTlkvQU9Rb3gwN0k2blloWjRtMm94OS95V3VHUExjVFpIYzBZNjdSQzk4?=
 =?utf-8?B?M0RXU3dMQkRlUi9XZ2lwYnlycTI4WGVyOVp2RlBVei9jdHRQVXNTUkRBNWtW?=
 =?utf-8?B?QWJ0cW1aUlFYN2o4VGxFaHFuTG9LVXZra2JVeXY1a2xaS3V1dVdSZFgxUTFl?=
 =?utf-8?B?Rk9UQ2VSNklkdW8wUi9oc1ZDYXZxcFJ5SkV3cnNnQUxhMGk0RHZ2MWpmUjdF?=
 =?utf-8?B?MVpQS3BBY0h3Rm5nK3NqR21EQitlWDdGR1pRZE01eUJ2VkdIMlgzVjJzdFRu?=
 =?utf-8?B?WGZDV1V3V2JEVThCRmFiTWdWdml6dFlERnkyeU1IRW56dFNKNTdRd25qa0lI?=
 =?utf-8?B?STBmMGdXT0NGMW1YNWk0M2FKRGQrWktUUEhXclgzc25kaUgwTUFiTWhKdEV4?=
 =?utf-8?B?Vys2M0ozeEpJT1BEVy9UZlpGMFVSbDRxVkxpdkpPZzBHbVFUYm1Tb3hHQXBy?=
 =?utf-8?B?SWZsb0t1d1BzYTBkNHB6UVlycHh3RnhYdWhMRkpWWlF6dzNZNmlDUVU5T0dx?=
 =?utf-8?B?M2ljWUJmeUNOV3lVQ0JPSm9rcnAzQmJuWWRFMkUxZFpwZW8xM1h2b1Fka1Iy?=
 =?utf-8?B?ZEw4bXlOR2RqaWFKazgraGlxWDNHSmtQM2ZRUjEvbFdoWnoyTW55am81MGs0?=
 =?utf-8?B?aXB1Zm45WlFKcHFCb0gyLzUrMW1BeVh4dk4zdkpwMXBzK2RadTFQRXVSMFRN?=
 =?utf-8?B?d2dCWS96TnFuYVB3T0lhbGZMOW9CSDJCQnVaRkpxYUZTc00xTzRUYXFWVmJZ?=
 =?utf-8?B?WWoxT2wrc1Q2aGVDMFJxMkM5cCtkeFVadVU3bktKOXFRcFljQjlqWGRCQkJO?=
 =?utf-8?B?WkxQS1NYWTg5eXZmeFVzWkhYSWlTQzNYYS9qNmtNcUVkbEtublBRWXJmSnJr?=
 =?utf-8?B?UnFtTXp0Sk1PaGhESm5yTUQ5L2JqUENqNjNXNkRFZURQZ3dodzNXM3pqVm1W?=
 =?utf-8?B?QTZPUmd6WnUxU1o3QW9nY2gyeFlYcFdQcW9OaXpDdUhnSWVIVG5HMXJ3Y2pQ?=
 =?utf-8?B?bXdyM2JjeURVaFd3OUord0hMVXdSZk1NNkVKTUk4eW04cHdpaGl3eU1pN0Jz?=
 =?utf-8?B?c292aUlXUzZBdktRaFdxSWlNUXRWakVWWkIrVTNiR20xZFYxRWo0MVg3L2o5?=
 =?utf-8?B?RGE1cWZOOElXVHEweSttU0hRNyt6TkxzeFJob25KUG9OdjNJNmYweHVBWUdF?=
 =?utf-8?B?WTFYYm5ueFVZcHRsM09oWDJGRjBjWGVkM3cwYVFFSVZuNDY2VVlNM2pMbkFB?=
 =?utf-8?B?d2NWN1Q3TnVPeUV2OWF4WWZGamo3dTF6QWJtczJwU0sxUGw2c3plTlBCM3VS?=
 =?utf-8?B?SitCektTZUorSy9FL1A0VWFnTkEzMG9xTTl5WmwrVU94L2tRL3BVVzRpckVT?=
 =?utf-8?B?YlZpMUwzWkxYZEhmMHVRWnQvSDVTUmNzY2JsdExFWDRPWThvWGh3VFNpYWQx?=
 =?utf-8?B?WGR3dHBBVnQzZ0pVQWxXMXN0QVh0dUxxcDdSWmNHSStrN1pFcGR5RTFxVWtG?=
 =?utf-8?B?VFNNa3Q5V1JmQXlKS0dLYjU5YWsySVF4SEJQS095TWptWFUwNHk4YWtHdGM1?=
 =?utf-8?B?NGk1NFp5cnZ3a0IyVm5wc29VRXA2Zlg2L2RIdHZlNFo4d0Q0dCt2U1hDa3Rv?=
 =?utf-8?B?dzYrejd4MEc4VzlkZnUxVnJPTHp1ekFPRWV4ZHFORlN5WTd1d1krR2Z5L1dn?=
 =?utf-8?B?YWt3S3E3cXlGbUF1bmU5RVBuRWdoQXp1WE1PS1VNSUtubC9qbkxBaE5RVzAr?=
 =?utf-8?B?bFk3ZysxZEdMZ08zL1lNNjZkd3FNUFpsQkN6N1ViWWk0UEJBMGpjYlVRakUw?=
 =?utf-8?B?ZGZEblJBMlhvaDZHbVM3K2xrNm84OTRQSFBheFZwN0kvRzJ1R28ybk94UXNK?=
 =?utf-8?B?Q0V3SGFKaExGeHk4N01ieFBqWnJhWjlTS1FEemc5eXRWMEdKUXVFZFUwS0ND?=
 =?utf-8?B?UlBiZFg2cmVQekV1SXhBeWlXenBUcC9Yc2xNc2lNbVhTZFFKWEFMVXVFNlRv?=
 =?utf-8?B?UnppSnhwK3VUQ051TEh2SDlnb2RzdHpOY3plcWphSzhMTk5GQUlnSXBwMmto?=
 =?utf-8?B?VHBVdGJXZzVOVTVDbkMwcVdqZ2s0MFd5T1Z6VDZhbWNjS2dscEVQVmgxOG5y?=
 =?utf-8?B?aUFDMENCOGZHanhlYkI5dWVscmdySnliMzJTZzlyM0U1ZmwxUldYS0NzTXBY?=
 =?utf-8?Q?AaY21ObrWtoTAgw4=3D?=
X-Exchange-RoutingPolicyChecked: ycHIhShOuZ4TvJL0DH2/mRU82CWD6OvAFfLoVmdczAa+rOBrefGyHAX+slN3gMPU/6v94X7JBFTsl/Ccb+zoRrJkIsxPPB0gHUP0sG66t1pwz/urcRHvZzk03OP8uo2UkUWz5bXRvkxt91Wm3/zcdoRIsKiJg4bjEDNPCH4tQQKzgWzICbCT6Zo2rtebf2DJGulYBaH6vjSeFRoVD3/z3BvQmxic384Rar16cwS0+XfZfM+cFiR66RofoNaiCnaKN04Co5c2uW5lx6V0bfygodwk9Qf8TUgoEEtXXFbHqcDNs6QigNUuRouGp/ewb1OKbpYiHew1Tmhk7gLju/fwsQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 661d1d87-3955-498a-9fcb-08df3aa84e28
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 19:17:45.2598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oU5U/zKwYZxJxvvzYU/A8PLH+3yNmt6qrCYXvX267s2hPolvED52HAuIRHs96J2OceIhMp+esrZ43N04YSpXhEhtiz91KIrxtXf3cENO/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7668
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Missing hosts not relevant as pool has other dg2, mtlp machines.

On 11/3/2026 11:37 AM, Patchwork wrote:
> Participating hosts (40 -> 38)
> ------------------------------
> 
>   Missing    (2): bat-dg2-13 bat-mtlp-9

