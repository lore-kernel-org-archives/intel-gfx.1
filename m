Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE18606A320
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 10:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D4ozruWW;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DPRy1mQL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDF810E66D;
	Thu, 19 Nov 2026 10:32:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0BB10E672
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 10:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795084338; x=1826620338;
 h=content-transfer-encoding:date:message-id:from:to:cc:
 subject:references:in-reply-to:mime-version;
 bh=XHQxepFNgP0YxE+Pp1h9pQZGL1RSQihtA0Wj+8nRRps=;
 b=D4ozruWWL+rTbPjwdZo+dEBmCeM1AAqBizTjdPyki73mMMI+CkY9mzwx
 o3I7CHTjVU3z/bcfllGZbJeaG7RXgtYMzlgD8VQJFmK8t/gfVVtTgTuhv
 yNet2fAjV+uDF+ruT+kACrh9bIiOLqIhY6ULJHk/HEk8k+tnD5xbjPays
 F1KX5bj5tNyb9tzssGS0/9KxBbGFNT3eoj57VDXyKDUhwTkCLtRK0sIwe
 gkexSApiSGqv8zmEliRLfSB4IZJlg4i/PQnsjQD6xYTPOOOZeY98dwCEC
 WLrgcFx2H6lrnwwm817KvZNaSS5M+qT382NHlrahdFdLRM4o2O8lSfrlH g==;
X-CSE-ConnectionGUID: pR56xzrWS/Wha8B3Ht7mgg==
X-CSE-MsgGUID: gOSvSGVvTRy/Q9taMybzRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3954703"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3954703"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 02:32:17 -0800
X-CSE-ConnectionGUID: Fccpx4q2QHu9yUvG37tdTA==
X-CSE-MsgGUID: ea61L0vkT7OkGa4ld/DbLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10754109"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 02:32:17 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 02:32:16 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 02:32:16 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 02:32:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOryrN3HSWD5gXuvrph6bOKCxqpKBGCRFhFWPR2+mpGklPUlXRqBPVhiP6qyfGIbY8JQqj+q7yXhRWtapgFj/pNy96wAkOSXjh3UsXmu6g6J9+GjokIMtOwWNGGCswWvPGBXbae0GlMNkmVXjgAnrkvP5mKhIinybQpOhYdxvV8WCYJjSuUYNnrm7xlWrgrNvqimSySCpOL1xJ0Zz5BJZVKAL4aqz2llxjyo6DDe5B75UTF/xT0P4qL91I8KVwJSRntHa6WSjtiB1L7JtaMsdEgl3m0Zs2eFAiUZr9gUWfJsWMLsMl5HX4ZYPHaq3is9n19vSf1i96IxDo6NddLoaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlirvRZO8CJbqOC4fMR+glU5WcSX8wKjOOzt/MpKJMg=;
 b=EeNEHRzKXTZgLmC2R4eGztMtimTD9mqN69Y/LYKVTFF9dfU2ufflKm0+RKj1hlxy6IgjEf00+h9TcOgS7gnT/AQ2U/I3sVetNmEtsUC8uxMxzppKPRfhIdiGF9FAN9rGQMcBj3BOyyVkontf4zeFLNGH08XcCIU0xSOq7j7+uhgDUVj/cduObGTbbDe6KRxxHocwue3icR0niCcupah0rnM0+ITNSj69ZAVuBhntHI/GjT8GZlr3UCyeg8YQY/HLIe7RH9sj9vRY1B28m3bsY8x6T1mEnGQWjLdAeqHvoX+6ljjcQBpwi2a8ZXVjd6rFIJHlalyQS0QC6M+iDBjZEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlirvRZO8CJbqOC4fMR+glU5WcSX8wKjOOzt/MpKJMg=;
 b=DPRy1mQLyHWnpXVI/6Nokxh7R8JPLiSsayL5T9luXz0b33i7V4dh208Tv0XYXW6prKomlOo2dAy474RW/wznGggr40rEkBHlSUDubS+V4uIyBPZ0g1PfAXYTFeyeh6Kllvqs9LFI9I3C79/pziXqBnaAory9VqoXMDZzLb04S78=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by DM4PR11MB6333.namprd11.prod.outlook.com (2603:10b6:8:b4::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.10; Thu, 19 Nov 2026 10:32:13 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 10:32:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 11:32:09 +0100
Message-Id: <DMZ4ACDNRWED.LAR9KL21OIDK@intel.com>
From: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <chris.p.wilson@intel.com>, <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v6 1/3] drm/i915/selftests: Fix unlocked mm.stolen in
 reset selftest
X-Mailer: aerc 0.22.0
References: <cover.1795006734.git.sebastian.brzezinka@intel.com>
 <c47b0ea2093da73a92e9e6d62b062f9cc52851d1.1795006734.git.sebastian.brzezinka@intel.com>
 <dveqarxlsulf7nwrfjgolsp5ntcqlhkbziwsyth5pdzqeiqlrc@znzrnadm3rie>
In-Reply-To: <dveqarxlsulf7nwrfjgolsp5ntcqlhkbziwsyth5pdzqeiqlrc@znzrnadm3rie>
X-ClientProxiedBy: AS9PR06CA0019.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::12) To DS4PR11MB134916.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB134916:EE_|DM4PR11MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: 6db3b69f-48ab-4802-52d0-08df46286047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|11063799006|4143699003|10067099003|261022075727099003|261026121527099003|261022115727099003|261021121427099003|261021123027099003|56012099006|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: PpleNiLoSQatxg4nri4+JgO60bAH0PTolA3VqDCpZid3QDPYHrEvyxTWTtm6cABPRlZNGdTXM5ru8O/71U3ckRNvvMpRXK2rrAQtOxDEEBKj7pcJABBZAdLA8ab/twZfk4BsfQ+8cKAPQRmsfRa0VeGh/F/eWW4dA7a3HuR9H7o4ZRFf19zBVMQYOAQKhmw06jGPzFc5KWYBJNOJoxZ/v5CeCP9xioByCyEkXQJwPIRPcP2N7vqcd8MmTVDln/yYNosjHrIdActtspnEm/3uonpDWAvqMD1Mj/PUvWOFlUrtfBAgbU03PeuRBxcNvyYSDfBssMVDsZpALK9mkAhT92hhPVZEzrKzpaNLK+14dxipaYeVV3QqeiDavJ6E9L3rR/i7ndpHQYeZM8bBTUcFCrTcAZ8Pn5j01axiIkSJ5+17rBH2WtEaV9B4HXimTYYgdobnyGERbRkEWRYTA4+C1C1yKdYaD/Y7PVr/y5wTS36CFlpsx+hwbSpk9VSToROgyrcWA7fNip+5whnzCgqWg/sBIJVdicskExM7E6aFnlR7RQq9pPZC2ST4+3rgnPLST/8VgJ5EdokFpAWPJHrDJdZQWsqxNH4soQde7/ySrm0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(10067099003)(261022075727099003)(261026121527099003)(261022115727099003)(261021121427099003)(261021123027099003)(56012099006)(261009223027099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enYwb2hRNGw5SkdEaTc2M1k0RFB5REFsblRqc2txdENydnVFbUUzWVA1a2M4?=
 =?utf-8?B?RFRTcmhGT3hwajVGTXRlQldYbWl5bktsUEg0dHJUa293M2pqNTVlMkRKY2Ji?=
 =?utf-8?B?WFhEai9uLzVnSnBGU0RlcFN2UUZnSmRNcXd2U1lKcmNCV3EvYzhJZnVQV091?=
 =?utf-8?B?L0FYa1VzQjl2UmIzcENGd2MvSzFQSXpUc0hKYmVlaTFXRkJUMnpqMFlyNHVu?=
 =?utf-8?B?YVgySkNxQUhSNU1iamdURmVLZFBnVjY2NHJmZk41RkJ4b3dCTUJPcm0waDds?=
 =?utf-8?B?d3orTEhVZUF5THBiZmxPZjNwZmJFMFdqY1pFVTQ5a3RSbCtZSVR4TGZpcFBK?=
 =?utf-8?B?OWNoUUlhYlJzNGdJUnVKMEltYkhWcCs5aUNSNTcvTmlNRnhyWGV4MUJ1WVZn?=
 =?utf-8?B?SWFrZkkrdEc5NjJaZjVSSG40RWsrSHRnYStsSHJLSFVWTEZUT0F0K2drY0tJ?=
 =?utf-8?B?cWVsZmtTZFVUYlZkZ3ZpU051Z0ZjYU9NbjNHVzBQbUxPOWhVeXZBNkxwL2NP?=
 =?utf-8?B?bWlQWThkNk1UQWdRa1J4RU5oMHZJekphQVMxdXVnaTllbUVLcTBVcGU2cy9C?=
 =?utf-8?B?YkE0MlRha2xxSk42R1QvRVZRWXBYa2VkVW5LM0JjZTk5ZUI3Ukk2cDc2WXJr?=
 =?utf-8?B?QlNNYTJmZmkzZW9wbjBMbDgwbEZtcGFtYTQxYkRpZG0xUGhIMW42MnJxbm4v?=
 =?utf-8?B?ZFNrZjQxMnhrMzd3RDJid2ZXdWhLYko4S29WcUh3RjBVdStxTW9yS2Q4R3Nk?=
 =?utf-8?B?T3c3Y0F3MlcvQ2t3RE03anNhS1lqb0QwdVg4RFhvYUNLR2VncW41UC95YWpn?=
 =?utf-8?B?ZmpKR2FkRkhqZ1l1VE5pZjN0RjZMUk5uTFQxOUdYMzFJY0dpdzBrZko4QnpF?=
 =?utf-8?B?ajZpRk5qN1gydnNsTk1CNUxTTXhlVXpaRmZBUnM4Y2FHbGJ0d0s1NElYWjVh?=
 =?utf-8?B?c0kwWGZNeTh4QXFaQVozaVhZZTFsUHhWYXYvSHJlTXV1M1hTUGxuQytORW1S?=
 =?utf-8?B?a1c4ek00Y2htSzk0dS9aSDFXSXFOWVd5V1ZZSjMvM2dJczdaVjFGQlk3K1Vx?=
 =?utf-8?B?T04vTUhTeXZOU0ZkaUJyN1RZdGt3NlNGbUVaR0Y1NUJzOG5SdUkyTVc5K0lq?=
 =?utf-8?B?dFdVbjZIVFlhcVg0ZGFOSy9pM3dPZ1hYSnVBYUhpaUQwZWZNbW8xbVpzUFV1?=
 =?utf-8?B?bEdEeUlxcU9jKytEVFdFeDdtQTl0Y090MGk1K2pzWkNYajV5NkkyaThnMzhR?=
 =?utf-8?B?MjRxYkl6dXF3cTgySE5OdENMM1hscXArMmpiS1N2dnUxR1BkZ0ZINzU1VS9l?=
 =?utf-8?B?MURnTFhDcU1KdjNHNW1weCs2aGZ4T1FsVThYL2duUDhRMU14QzlHU3l0dDd5?=
 =?utf-8?B?aTgveW1ZSHBHQXVTZWozVGFLeThkNVhicld0SHlsUnJFbVg4WlYrTllVNXFX?=
 =?utf-8?B?ZzNTMjVRT1pnTEdIZXp4eHhHVFlzakU4N1ErS2Z6T21LWTBmM25FYjFIT1Nu?=
 =?utf-8?B?M1hxTjh0c2F1MzNUZUxIcDNvWjcxMk5KSFU3Q05KQjNIVTBoaWloSmxKQ1dq?=
 =?utf-8?B?TjJDWlBweHQwd0owT3o2UnlnUlpMUHJtYWIzeUVWbm84MU03QXBTQkl1eUw5?=
 =?utf-8?B?NmMrY1gwdkUySENYTVl4VVJ6OTVhaHpiK0hNZUp0UVVYdUY1MitmUHdFek9u?=
 =?utf-8?B?bW5pS0I5c2xWUmI0TzhBNFd6WG82dE9PVmp6S2JsVS95U2NtQnp2SzlZMXRC?=
 =?utf-8?B?d0E0ellNZjZ0TnNvbzRKeWl5SnZrZHBpVUZXTmpvNmZWTUJVRk1xWWlUb1Ax?=
 =?utf-8?B?eDJTMVRvNVRBU3lmUlgwU2tmVXJoczF0djFVNThxQnlyd2MvaE5YRWdhQWZO?=
 =?utf-8?B?bzRBUUV6ZklkZFhHWW9sNUVybmsrcVFqSmkrSStKYzhQcnBxc1VNQTBGNkQ1?=
 =?utf-8?B?TXJHMmZ5VGVUWXAwOXJXd3k3a0tFV1gvcHZIVTcwY1JDNUlFRnIvL3hEQVFT?=
 =?utf-8?B?THdralJvamk0KzMwdFhQSmZJc2hHTVh0OER2dVlXVitBbU40blA3ZzZPZnRw?=
 =?utf-8?B?RVlXSnlSYVZGemk4bEpzakFxd05lWlFqZ1NETnNLSVdkTVBMWjBtQlErR3ZG?=
 =?utf-8?B?WW5wbW41alJPTGNEUVFxaGhGMTFoZFk2WVM5WmJ6MnJ4QVZzbytJMzlQQnFx?=
 =?utf-8?B?aGQ4NXdWSThNK29IUGV6MFJMcWpoNS85cFZpWFgxUlFob2FURFZZUjFKMDRl?=
 =?utf-8?B?Ny9jOTFBWVp6bm1hanB4R3FSZDdxckhsZ2tvNXErdGVOekRkN1VrMzVITG1z?=
 =?utf-8?B?ekVsWFhCVEpmV3FrZ3loNzdTRkRPUUdxbVBNcTM2empMMHNJbHFrZndXUzNR?=
 =?utf-8?Q?WPjKEvs5xTixbkUc=3D?=
X-Exchange-RoutingPolicyChecked: lRetQEp4mukrOol6E/4ut4NwPwjBvrzfRBjY8HgpE3cUC11LvGWDmOXPc8IuWO7GwH/QBGQDx83NKnfQz0Ua2zZ75qtBl1UZonBwa0PUYFu6xi7D8XXqfVJ+KIUxdqjGxpaVoiFy1fCxojqP3DL/1obfa0vo/2kXDeBi7r4Sz+7KwvDbbBlkmv/xrsEBlkcgYE8b/YH++PsjDNuUdDSLY5f9igYIY+xDgzJNsIhBYVVsWfuM/ckXS6fdyER6Gb4wpL5CHLGevJBu1/u/EcONfFJoXdRX4zTqXeHAxrtBOz6jsgIq8qmTRKyVgLJ75fSTfUE/a/W5cRRz6D9+BPKYzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db3b69f-48ab-4802-52d0-08df46286047
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB134916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 10:32:13.8885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7EDXn/6K93YfqKwQ9kmv0TSl0DLOKScYaPlk6N9KCrf5PQTQrznLQHwSuP4pl38za0qKYz69pwhA/1vpUtztS7rSeabcwNSdBrpgfsFw/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6333
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Wed Nov 18, 2026 at 4:23 PM CET, Krzysztof Karas wrote:
> Hi Sebastian,
>
> On 2026-11-18 at 14:02:18 +0100, Sebastian Brzezinka wrote:
>> _igt_reset_stolen() use via __drm_mm_interval_first(), but
>> does so without holding i915->mm.stolen_lock. Every writer of this
>> (i915_gem_stolen.c: drm_mm_insert_node_in_range(), drm_mm_reserve_node()=
,
>> drm_mm_remove_node()) takes stolen_lock, so the selftest's unlocked
>> reader can race.
>>=20
>> This was observed as a NULL pointer dereference in
>> __drm_mm_interval_first() during igt_reset_device_stolen():
>>=20
>> BUG: kernel NULL pointer dereference, address: 0000000000000010
>> ...
>> RIP: 0010:__drm_mm_interval_first+0x2c/0x90
>> ...
>> Call Trace:
>>   __igt_reset_stolen+0x565/0x6a0 [i915]
>>   igt_reset_device_stolen+0x1a/0x30 [i915]
>>   __i915_subtests+0xb8/0x250 [i915]
>> ...
>>=20
>> Fixes: 3da3c5c1c982 ("drm/i915: Exclude low pages (128KiB) of stolen fro=
m use")
>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/1684=
1
>> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
>> ---
>> v1 -> v2:
>> - Fix always false !__drm_mm_interval_first() check (Andi)
>> - Extend stolen_lock over the poison/verify writes, not just
>>   the lookup (Andi)
>> - Move the lookup into stolen_page_unused() helper
>>=20
>> v2 -> v3:
>> - Cap num_pages to i915->dsm.usable_size to avoid poisoning
>>   hardware reserved stolen pages (Shashiko)
>>=20
>> v3 -> v4:
>> - Only verify pages poisoned before the reset; pages in use (e.g.
>>   rings) may be rewritten and freed during reset (CI)
> You forgot about the changelog for this version :)
This series started as a single patch. When I split it into a series,
I moved the changelog to the cover letter.

>
> Not critical, so:
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
>
>> ---
>>  drivers/gpu/drm/i915/gt/selftest_reset.c | 23 ++++++++++++++++-------
>>  1 file changed, 16 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/=
i915/gt/selftest_reset.c
>> index 2cfc23c58e90..7d4b0382fe19 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
>> @@ -14,6 +14,16 @@
>>  #include "selftests/igt_atomic.h"
>>  #include "selftests/igt_spinner.h"
>> =20
>> +static bool stolen_page_unused(struct intel_gt *gt, resource_size_t pag=
e)
>> +{
>> +	lockdep_assert_held(&gt->i915->mm.stolen_lock);
>> +
>> +	return __drm_mm_interval_first(&gt->i915->mm.stolen,
>> +					page << PAGE_SHIFT,
>> +					((page + 1) << PAGE_SHIFT) - 1) =3D=3D
>> +	       &gt->i915->mm.stolen.head_node;
>> +}
>> +
>>  static int
>>  __igt_reset_stolen(struct intel_gt *gt,
>>  		   intel_engine_mask_t mask,
>> @@ -79,6 +89,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>>  		i915_request_add(rq);
>>  	}
>> =20
>> +	mutex_lock(&gt->i915->mm.stolen_lock);
>> +
>>  	for (page =3D 0; page < num_pages; page++) {
>>  		dma_addr_t dma =3D (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
>>  		void __iomem *s;
>> @@ -95,9 +107,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>>  				      ggtt->error_capture.start,
>>  				      PAGE_SIZE);
>> =20
>> -		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
>> -					     page << PAGE_SHIFT,
>> -					     ((page + 1) << PAGE_SHIFT) - 1))
>> +		if (stolen_page_unused(gt, page))
>>  			memset_io(s, STACK_MAGIC, PAGE_SIZE);
>> =20
>>  		in =3D (void __force *)s;
>> @@ -143,10 +153,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>>  			in =3D tmp;
>>  		x =3D crc32_le(0, in, PAGE_SIZE);
>> =20
>> -		if (x !=3D crc[page] &&
>> -		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
>> -					     page << PAGE_SHIFT,
>> -					     ((page + 1) << PAGE_SHIFT) - 1)) {
>> +		if (x !=3D crc[page] && stolen_page_unused(gt, page)) {
>>  			pr_debug("unused stolen page %pa modified by GPU reset\n",
>>  				 &page);
>>  			if (count++ =3D=3D 0)
>> @@ -159,6 +166,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>>  	mb();
>>  	ggtt->vm.clear_range(&ggtt->vm, ggtt->error_capture.start, PAGE_SIZE);
>> =20
>> +	mutex_unlock(&gt->i915->mm.stolen_lock);
>> +
>>  	if (count > 0) {
>>  		pr_info("%s reset clobbered %ld pages of stolen, last clobber at page=
 %ld\n",
>>  			msg, count, max);
>> --=20
>> 2.56.1
>>=20





--=20
Best regards,
Sebastian

