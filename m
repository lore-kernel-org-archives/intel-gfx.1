Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CA5C61DC4
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2026 08:49:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B047210E270;
	Wed, 26 Aug 2026 08:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EKxumznz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F3210E270
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 Aug 2026 08:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787734180; x=1819270180;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=69W60P1liR05z76kZDTlUoTVEEfDHKGC3Xn5cADSR4k=;
 b=EKxumznz3/NQOql1r8olcXT/fCpUJM13MEjXQ/Hg9mOfADKkezOrQguw
 e7xP50lBHUZycKoiHyQhwzbc5/hk7dHc9NiEbTVV3zC2p5maYGlB/k5yW
 ZbwkgG8EmrptKaioy3QkRgiBu2Z56DemSui2ScGlezlOKeIWQYCRJ1QMa
 wKlgCSY4HX9z+r0iWc1KQ9ultw0TnfBeyHo+E+pJgqiianu4V/BTt8yrN
 r75PVbUUw0/coMIZC6/6t3mhlFoMZHDj5phVJvTjlMu5fCZyMU8ANq3TY
 cv6eQY7wff9/dRGmfC3Hhk6PAl3DSZQSWqkNFF1pNL+eTJhP+yfyened2 Q==;
X-CSE-ConnectionGUID: SwUukfuYTteWFUMNGxJhfA==
X-CSE-MsgGUID: 5AB69p/VQUuadxr6rJmJ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88089503"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88089503"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 01:49:40 -0700
X-CSE-ConnectionGUID: GjLlUlmMQMOyeTaKTXcsLQ==
X-CSE-MsgGUID: UsdsjnIFSw+dsT5nCdyCZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="266944794"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 01:49:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 01:49:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 01:49:39 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 01:49:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ru3B/8+R0m01xA8wmQIS9wQFIQvxpZwqacQ1WYrJLuYucqV/pLUwfrMEmIVRgr4BycuykTnZk+XWuiZ96QeClL27YiO8BVYG6Hg2QKnmwvWoy+i1Ri/6lmlPImS1Vvd6TMeJJJ2RWv//NcNYghuZZXX1E217WhNj4HXxer87jWF106Lg8jxL37SdljctlJb5y1W33GRkFPaTiG1LpNCDaNUPH2DoEpM/NTG89+syLG8TNi7e3vGnbxatMTr7MFgYavPmX/WZ1+Hq+IhpZBxW7jCM1nwa08qb7kvHvEzrDTseZCfjp9dwHrJ0zyGSs602+d0uTwcNsKKbMLGXmB7Fvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63WyiPs+SYQZ2UeLuvNO5y6f6ye3T8aCcnCaX7fAqMs=;
 b=skqWAP6XWgjM4KOM68nK1qdGIqRGXzrJHB05MZSBeBHcI4mgm7Dhow/dVGvkl3WN+QTcms7ru4wvls7r6UOLIcdjgjhMDN7HBV8dHt3g41F1hZvcqu6Ty3VHNX7vKefLMmBpYi3dN2tTsKQKRaXwzCzKGhWIL7pLqSZ4WjnvGjadlSgcqI8byY3jWOH9FIWNELTUzHxN+X7HOfkKgwYOHmm/iNadRYL47A3LY+dOpcLcHsaVoipT03NKmWV+2ljoqZ2gAauDlvYJABqWATaGzglgHJondaTZ+Ze16v7cURNZ0fTgd+8JCWJ19hH5SyweDNq4aQDRsW0TrgGz1EDLhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by PH0PR11MB4872.namprd11.prod.outlook.com (2603:10b6:510:32::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 08:49:37 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 08:49:37 +0000
Date: Wed, 26 Aug 2026 08:49:27 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, <chris.p.wilson@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Fix unlocked mm.stolen in reset
 selftest
Message-ID: <gtwlq6zu74cvjm2k3xbs76s64v7ex3srq2umj6ix3mfote4h2r@7rtohsh6hgs5>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260821134044.15908-1-sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260821134044.15908-1-sebastian.brzezinka@intel.com>
X-ClientProxiedBy: AM9P250CA0029.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::34) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|PH0PR11MB4872:EE_
X-MS-Office365-Filtering-Correlation-Id: c678b06b-2f7f-4527-4050-08df034ef51f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9Siquacu4ne2jtrkrqy8xr0SR1mJss3mTO5INmWyL5BzwCzIb0D/VuXrvcbAOH5o5d8L7sVb8SW10iQunQm4FMY3k5auEx57UE63JtDE7JlCdziyngi+WiAEpQD0FeA4uuwpQTU/JQuK+KRa2AyJQhncTxkDy9JAHy9REl2DhoPGhov/42aUg4VvtGkAc2CyxdL8YKklawzy3I6eMDkVAfj5F/JKmw1q1aZX8ylX+mOaDSzRwENEocRWwq+tlSWMZ58+hCpGm0D2mjAMhFjgqg8qLLRypi6otZ1GvqTjsKv8tm5Mgq46o+g3F5V8QpBzKw9bmekv6q4Z6T3DJ/zpCTNIR3TcVBFhy7xokZihC28zWYxGJnpe0uk2DD2AJPt6huk+P7FSyPVjPpcHligWqFfhm4PLqBbT5zKzGQN2A19R6vlOHFckHaGufIH19KtM16Gh8fFTDKQ+/D7wEWD5VQacYp1u4gB+DXv1QRcaL52Kgl2cTCqcgmTZ0MCjZSj0gn2rS3eAqFflHaXbywI3aentK8RBd/5AdEGH1NGG6kWLxG1LbwPEwrf+Av1tnmwYQOS/xM/FZ+qPPWMjpKboS1UOJ+iZNecils+VmILeXQLmPkJpjHjruZ+B+bYEd36s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek9oYnJsdGUrdGNJL2pwWXRxenk0MHNYMWJOQmZSeTFPYlhvVWNHK0N0VXph?=
 =?utf-8?B?b2tBbGpCSmtHbU55NXZOUDNMREwxbDBsNk9kZTVTNTFZYVJoc1Fxam1jS1Ax?=
 =?utf-8?B?MUtKeSs5TjFRZW5WUUk3dTd2RCtMUFE1ak9qNlIyWXc5cjJPWGhhbU5QRW9F?=
 =?utf-8?B?SGhERDlxZVM4TEwvUE5XQmk1Tkl0M2pKY0szZmI5S29ZQ1hXTll4enRrcTJT?=
 =?utf-8?B?dVE4d2xYbkIxZzNVa1lQVTBjMTZWTlJBS1VYTjRxSE9paE5iTkoyMVh0SkRz?=
 =?utf-8?B?UVBIbTdQcWUrZ0dSSlpQV2JOdis4TnRWOGVvaE1paThoTkJ5MHY4OENtQ2p5?=
 =?utf-8?B?bHJKTnFxTVpYY3p1blJXVWJCbnpHZlFjQXZDSVBNZytlNllTM2dCMHViVFc1?=
 =?utf-8?B?TkVpb1FqUGJkLzdZVDhENkdXL1JjVTJNY0E1b1BzMUp1V1QrK3d5QWZKQ0xp?=
 =?utf-8?B?SCsxbjQxVGJ1UVVqWXhUR0YrSE1hOEE2blZLV09WUUpUdEs5U0NZZmk1UXQr?=
 =?utf-8?B?YUtCQkszcnlIYlh2RUxtL1JaRWdRaUtkcUxSUldCOHRmaTE0NnFqWUFxMWNj?=
 =?utf-8?B?TGMybXFSdVdrcFdodDdoVXhvN0xRdzYrdmZmakdPQnlkSWRXRkN6OFVIdVd1?=
 =?utf-8?B?Qzh6SDd5UkhwVHgxOEpWR21haWJMbVRQc2gyWUIvMjBNRTQ4d1IvQ0VhZTlM?=
 =?utf-8?B?RWxhcE4wOFNjMW16aVNTUkRSZFJKMmF0dnVHdndkMTVnU1o1Y0lSZVJPTkVz?=
 =?utf-8?B?WmZBcmxlRnVzZ3pPWG1zbTdaVTBucHBoSnBhN3lvMzZSUVN3SzVvQW1DOGVM?=
 =?utf-8?B?NkVuQjZDOFBoTUl2V0VWa3Y4dlN2MmZGYVB3OTFMbENDR0ZXRlQ2azlVOGtT?=
 =?utf-8?B?SUttMi85eEM4bDczNElicVErVkh4RU1JdGg5aE5IL2k1RU80cEcxMXlGNUtu?=
 =?utf-8?B?OS9mUWQ5cUhCTWhELzdKYXg1cUpINEFYRVM4VzVPSVlVekVyOWcwd1VmenMr?=
 =?utf-8?B?SFhRL0R1MDBuaDdLSnNwYzNoRDRQTUx4Ri9lMnpUTzdwWjdYYXlmMVAvQ3ZY?=
 =?utf-8?B?K1lRL09nVDBpQ1MwQTZoSnk5cEU3dEV1UXBPYklZM25uT3dGUmNVSFdrM1lk?=
 =?utf-8?B?Yy9qWFN4bW1UVE9aODUxVkVWSk1odXhSaE16aEdoQU0zNGJMWTRpQ0lMcjF2?=
 =?utf-8?B?VEJkSzNuSmdsYS9BdTBvRGlNTSsvNTArdmpmVmJpL01QNVV4N1duaWRzTEVX?=
 =?utf-8?B?bTBxTG5EaTNXY2V6c0g4ejVra3NWOCsrMFVLQk9PQ2prMHBvUTBlYW1XZVd2?=
 =?utf-8?B?RDk5NjIycFI1b1V1bHNiZ2YyampwLzhsNUFkNWY4WFk5SHhEVmQzUWZHVWY3?=
 =?utf-8?B?RXVoVmVYc3VVeXd4L0VPWGNyWFh6S1gwaDRlRzl6dEsyQ295ZDNYN3JvREtR?=
 =?utf-8?B?WTRDWmRNTHZ0dzZOMzN5Nkc2bjd4RUJqNG05TFM4TDJjU3RSZ0htbkc1T04x?=
 =?utf-8?B?WFg0NTdLTFFBa0V0VW9kd2RPVkQxd3pWZVp5bkxMR28ycno4aHErbG5XaG93?=
 =?utf-8?B?YkhCMXk4TW5weWRSV2tPWWRpaTFKUzhSTDNNR1E4ZkY5cXdGSC9rRE03b2gv?=
 =?utf-8?B?UG1idEdEaGtwaGxVVklOMVlhQW4veGJGOFpVWGxxZWphZ2ZoNlNDMFBETlI4?=
 =?utf-8?B?MHJ1b0ZmQWw4SnRId0E2c3J1YW5UWFNIQjM0TGhKN3NZL2o1Ylk1V01nWERQ?=
 =?utf-8?B?OGl0RzVTYzhvV1lEeDdtUmhBQkNla0JNZG00S0V0ZkR5ZkdRTytzb2xxdS9I?=
 =?utf-8?B?dHE0ODFiUmp6YkNJVEphOFBTZFJnazJxZmZqNm1WYTFJRC9YQWJ1WjRHaE8y?=
 =?utf-8?B?WmVodkhSQThwbnJWcEtrU09mL1FwRy9jVjVrc09sVkZiTkwxaEtqVng1VlVL?=
 =?utf-8?B?Vm40VXpLQ1dPeXJhR3g1NjhXeHVFcVFyK3dZTzFmWDBGNGNCOVhDenV1OHZC?=
 =?utf-8?B?TUpZY2xuY0txVnhIMFdDd3dQcDdFcW5zZUZyNUp5QkFEbVlGYU5ZMXEzOU83?=
 =?utf-8?B?KzdYbU1PdWtVMjcxeUlrRnVNNjA5YnpTbjF1ZzNic3FDQzdFckZFcUFvS3FU?=
 =?utf-8?B?dUVUdmttZVgxVVdQUGROR2VDM21OUURzVERxUWVMRTZHaGk5TDE2SFhVSTJE?=
 =?utf-8?B?NVdzek8xWWFrdDdSWW9RcUpVcEhsZHJndk5zc0phNHU1MklydWNnTkxjUmdR?=
 =?utf-8?B?MVhoOVNvVGJ0REdhaGhtekNxWGJTcWVyZTBrK2UzWHljSGczcStGVEFqSjRM?=
 =?utf-8?B?OWk1bncvNkYrMCt0MlhHRFBJNnhkMEx5bkNNVjF3bzBTZHd1TGZHZndDY2ZE?=
 =?utf-8?Q?Qu5jcLTACgiKZa80=3D?=
X-Exchange-RoutingPolicyChecked: AvfdM+rafwwqvR86wbwlRBZ1Ho9VxZcfZTqkh67lBfHeUMKFsgE/WfGtNq62SB3RJDeSmKDff9r6MhiBk6U7VcAZJr/9mA5cUSeUatpNsX8C05LVu+AzQkOiOlTeorYSxjNo6kQZpAqDWIW0wV681scaQW34/vI+MjRnZ2nvxHLF8XY2cDv4sG0XZ3KqExoG/ykPx6YjZs888zlSBoswYr9vt3fSAGl0Tv8znc8YsigO5HDhiAU9O0m1Xu41yJRJsjg8HuHntXgqc2SLrORF7mDLP4dAMUKLkGYxLtPLsTyiySoQ++q1jwSI0auod5WT6bngJ2WtlUFMEPafwk9I0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: c678b06b-2f7f-4527-4050-08df034ef51f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 08:49:36.8447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqPdJcRCBeS44kAkK+d7qsuMe1Xkw9l1m1vI2xE7Mmq8W1QhIiDgrxD657BOY44SmN98HlmeMaXaEIomVW3wudQVJSQKpBqj3pR9wldS+9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4872
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

Hi Sebastian,

On 2026-08-21 at 15:40:44 +0200, Sebastian Brzezinka wrote:
> __igt_reset_stolen() use via __drm_mm_interval_first(), but
> does so without holding i915->mm.stolen_lock. Every writer of this
> (i915_gem_stolen.c: drm_mm_insert_node_in_range(), drm_mm_reserve_node(),
> drm_mm_remove_node()) takes stolen_lock, so the selftest's unlocked
> reader can race.
> 
> This was observed as a NULL pointer dereference in
> __drm_mm_interval_first() during igt_reset_device_stolen():
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000010
> ...
> RIP: 0010:__drm_mm_interval_first+0x2c/0x90
> ...
> Call Trace:
>   __igt_reset_stolen+0x565/0x6a0 [i915]
>   igt_reset_device_stolen+0x1a/0x30 [i915]
>   __i915_subtests+0xb8/0x250 [i915]
> ...
> 
> Fixes: 3da3c5c1c982 ("drm/i915: Exclude low pages (128KiB) of stolen from use")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16841
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_reset.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> index 2cfc23c58e90..eb6b2261329d 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> @@ -30,6 +30,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>  	void *tmp;
>  	u32 *crc;
>  	int err;
> +	bool unused;
You should ensure the mutex is initialized:

if (!drm_mm_initialized(&gt->i915->mm.stolen))
    return 0;

>  
>  	if (!drm_mm_node_allocated(&ggtt->error_capture))
>  		return 0;
> @@ -95,9 +96,12 @@ __igt_reset_stolen(struct intel_gt *gt,
>  				      ggtt->error_capture.start,
>  				      PAGE_SIZE);
>  
> -		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1))
> +		mutex_lock(&gt->i915->mm.stolen_lock);
> +		unused = !__drm_mm_interval_first(&gt->i915->mm.stolen,
> +						  page << PAGE_SHIFT,
> +						  ((page + 1) << PAGE_SHIFT) - 1);
> +		mutex_unlock(&gt->i915->mm.stolen_lock);
> +		if (unused)
>  			memset_io(s, STACK_MAGIC, PAGE_SIZE);
>  
>  		in = (void __force *)s;
> @@ -143,10 +147,12 @@ __igt_reset_stolen(struct intel_gt *gt,
>  			in = tmp;
>  		x = crc32_le(0, in, PAGE_SIZE);
>  
> -		if (x != crc[page] &&
> -		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1)) {
> +		mutex_lock(&gt->i915->mm.stolen_lock);
> +		unused = !__drm_mm_interval_first(&gt->i915->mm.stolen,
> +						  page << PAGE_SHIFT,
> +						  ((page + 1) << PAGE_SHIFT) - 1);
> +		mutex_unlock(&gt->i915->mm.stolen_lock);
> +		if (x != crc[page] && unused) {
>  			pr_debug("unused stolen page %pa modified by GPU reset\n",
>  				 &page);
>  			if (count++ == 0)
> -- 
> 2.55.0
> 

-- 
Best Regards,
Krzysztof
