Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6A8C98302
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2026 22:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B0B10E17E;
	Tue, 22 Sep 2026 22:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iO4C0M4R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA54710E17E
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Sep 2026 22:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790114961; x=1821650961;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OTjWj/ENUteF5u9KneSHOYwBz0vRnw/zQtgIxKNNoeM=;
 b=iO4C0M4RXIlFKGgWA8SXt4a3eyrK96M95M0zH/bZBLVQwJ3akMbfhNLR
 TboZtWaCdyd46oDde7iWhuzpgHGKNRA+o+c51BY2CODcfop738uYpW7uo
 tQkzzow5873mzVFUZXWz9ORzzpJE6uvuwogMJkxa4/I1FZBnh/u7YnmMy
 JxksFcCx845hLxwDQKqx1TUB4hKwd2+PELrnnI7fVDzSUa2JC6novm4rs
 7CdCXe6eYtwSV+/SDCwwJrKfAnTTjMv1WduY4+x/UAfuqHZyW4jkWKEjr
 ZoFmB3wNo+DyiGe3jb++LryEBcT05C57Tb7ki8NIGbf1ieIorEH40Oiju w==;
X-CSE-ConnectionGUID: NHhh7TKnSmyme7C99COW6Q==
X-CSE-MsgGUID: GTzLmb8fQRGS1Mz7VOcx4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="102117276"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="102117276"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 15:09:21 -0700
X-CSE-ConnectionGUID: DAdLncQ7TzOqTy1NnT/NLg==
X-CSE-MsgGUID: MOCCkPO4QMKYc2Njw/OIaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="301244078"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 15:09:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 15:09:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 15:09:20 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 15:09:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AylZ1RbLbDceZxbs5dMyVx3klZuDjd04Spl3jgmyHrSzOOGt3QL6WWFNqlT3g5uYgIWFbeqe5ZRbksvjgpZoYTP5YswrG6TAJBbS9P40yfwJe1m1cMOpB5Glz3BjjSks4OoeVi4hUFftN5uS4oFY+5bih/YJTI2BYaGdt+7WySD1dm0ch/VBeLrisJ0w8PpbRg2OAOaA54OfMvsOUqXkETQppZq1Ybns0x4Zhim8jkJXc7cqE7LKgfX6ZLNKHrBa+mDnI7a4QNSBp+xsFgCVd3wJBop1qwAM+8IDTd9sMIpiweotawiutviO4CjBYxO0eilTofn3QE49St6tJ8PfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6PQNcr267KnyJRlgDADbFvmrAyxSuBk8GUuaJq8RHM=;
 b=i5eCOOOXLaGaRUogGY7kkm7Wwhz9fozYdblImf55LzQa8o3OSXywj8w78g2X1S0QrrgReLTuMKdMrhVLX/LNK3Ecs2hDUGofQPEysI/du+QPL5qCARSGRZ1ZOlT4t3pDzXQ/THmFuAm+fjO3TXC50D5wkyuUTYvIQih/oIYoRJl476wRQbbh10BBvaEWFqw4rABsFESHJYKyt/a3EdaEsQw2gY79jEDj4CacQSVr+olrCoQ23k4KULwSSK3R06dgd1VuHjC14tzjiw1Lx0gNWyftKhyMG05lBQ4HvO3vIMqjmq6sbAsETSaw09a8AlfNzTqMqS3fhBoHYEptBWXnCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH3PPF383C22AA3.namprd11.prod.outlook.com (2603:10b6:518:1::d17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 22:09:09 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 22:09:05 +0000
Message-ID: <b0337ea8-58db-4cea-a355-54f09a2e2d06@intel.com>
Date: Tue, 22 Sep 2026 15:09:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/i915/guc: Use a delayed wakeref put in
 guc_engine_busyness()
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20260910184253.1231313-4-umesh.nerlige.ramappa@intel.com>
 <20260910184253.1231313-5-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260910184253.1231313-5-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:254::26) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH3PPF383C22AA3:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ca2bf8-35ac-4f9a-964f-08df18f61da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|11063799006|5023799004|6133799003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: milQE0NS0hqtHFAz5/dGV9MsB7uk29F6pRnTDiVUOgQhTL9WYPBL9kmaRt/MH+4Gf3Mkbub7iv0E1MksDv3+WjIP7jaSpr+Zt7g7paRgLHDI23bBzzdlsknI6fNNlBs0R3REMPpCGdmZb4ew0WEmETeMgQVDREL9mZ5M4bcax6BlJNOkWneSZW4VhskwGK7+tRsXCZnk2OhnuCy5qmb3r1IlNMKv2aAjUoThSYzImbndj88cvjGbTw+5pgMfcPG6RxKqxs+U0ZQu8ii/0OfR03g51IJEWgi2fq43MVfmPqZ7mUgXXQYII88ksIrmH6UmMjfIAzNamRXRapQMA6bq/G0oBcKU6MGKXG6YDhEQulXPCrpja1IJ14do7+4Pgp0DsTnjYr9kNHHmzQ/JThqSUjn9KS65Nwv0ITVVxlbhHO5yOmcK8TSbNoFoj7EvRY05n/oVER2uoNIDElX7MiJeI5tDIGqAb5F1hdQSmmr9TiVSNTKrSmnTYOClqbxUpNvLjHFhn9ul7DrHS8Soagps7tRHpkRUA3vvPdBCJ+CwlboBKGUl5NMmMLdPmXYfXI/+oXqfuGC+ea00fKG2C8IgnOve6GU+T0HJihIJ/3CQAxmckCvEiqlNZ2v77/7gM2Ge
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(11063799006)(5023799004)(6133799003)(56012099006)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUNRRmMzOFkwL3V6UTBMcWNJd3FWQWZQRThIUzlobWNhWjVqcStobTNJTUZX?=
 =?utf-8?B?aDQ4VTlTcW10aWNXWVE3MlllTEZKZUtzN0tlUlMyTHFBU3pFZDhXV3BKK0dJ?=
 =?utf-8?B?Z0ZLMHZYdXFwTGFDajBMd1JMU3N6ekZWZGFHcDUrNmFUakFFTnBxN3BGeVpi?=
 =?utf-8?B?eEJUZGlHVXFVQjlaMFczd0FrWnV1bCtaOUd6WjRKR1FoMlRxcGp5ekZrcFVK?=
 =?utf-8?B?eWZlWUwzZ0w3YnlIaVUzdEV0L3BMMGU5UVhoMXoyUXZIWE5rY1ZacVBseUlO?=
 =?utf-8?B?bUF3bHBPSE1nMmExQXRJeUhkcDl1YVRobVk0aTFTenIxVXFVOUl0ZXV2UnBl?=
 =?utf-8?B?SVNzWnBmeWRaMEM4SmpkMGpIUkt0eEUvenNhUk1YZCtQK25pdFhFVnhyZyti?=
 =?utf-8?B?WkErMjFKL1JiaVFXZ2tUNE1heUU0UHAvMXlsUllrbmtndW8rQnlZWmtpenZl?=
 =?utf-8?B?TUNkVWlvM3VVV0xFK3VuMjVXQ25Sd1MwWUdURWNSS1M0MzBzb3FxSTdxUFdR?=
 =?utf-8?B?WE1rWW91ZHQ4eVVUQzl3K0U1eTEvVHZZVGxQM3llRW9RS2Y1b0Z3TGYwenp4?=
 =?utf-8?B?OU5IOCtwS0FKbzhoRlR0M3RXaGJ0Wmt0bE9yUlFrTWQxeXFuSnZ6VFFRMWlj?=
 =?utf-8?B?Nlc0OUlKZGE1bnhzUVhqOUNacnFTSjBvaDU0UkxMdFlUb1lEb2pWdWtaZ040?=
 =?utf-8?B?MmNCM3hUdUNIN2VGT0FkbjFzMzNZWFk4RVAreCtQR2dML2syZTl1cWpnV0Q5?=
 =?utf-8?B?cGVoV3dTeDh4akpWcmJBc0c3MnhmbHd4cGJHYjJMQkFxWHRJM0tETDZyVGVQ?=
 =?utf-8?B?WTIva3JTNVoxWURUVzN1MTdpT24yd3pUbDQzNG1wQU1aN1dCMWVsbVNkOVpl?=
 =?utf-8?B?elA0WE1jY1lqbTdSMGRSMW1aTWtCcnU1aXpwRHlyZ3E5bllYd0t0bUZLelV0?=
 =?utf-8?B?SUU0bXordDc2YzVMREVFU0J3YmdlQjhYbE5QZGsyRXk4RWs3dXFKS25STGFz?=
 =?utf-8?B?akErcTVoQ1pWaWtITDlsM1RxbXU4ZWF1LzZyeTZ5T09nVmdxSkFuNXRDdmE3?=
 =?utf-8?B?dHdCMDhRMnArMXlEcXlMQzBEaGVxWE50YUQxTGpOaEhvOUhKbm9odnVmS0FJ?=
 =?utf-8?B?eVFlcng2d00vUlBxNngyaGx5S2dHaGIvNVp5VlFEU0gvcWV2cWtiUGZvcFJl?=
 =?utf-8?B?TE9HRFNpS3EyTkc3UEo4NWpMY2hTNjd4UCs1T1ZXdXpLY3VGVHJCWkZmUDdU?=
 =?utf-8?B?ZjNwOFFweTZseEpNczhXR3U0TVkrVEI3VW05dlNmUEhuV1FhSGV1ck4xV2o4?=
 =?utf-8?B?eFFlN0VOMDlIWVViOUE1dUNPZmN6Sm5sdmkxYXppN3A2YmJXdUxtYWNRNkxt?=
 =?utf-8?B?K1RlUWZGMjRpQ2t1QmNXQ0U4OTNDZnNLTW1MZ2V5eG5qZkFEMjVJSnFHRzdl?=
 =?utf-8?B?OTJDSTdPWUdlaklSYlNqRWFpSEVkcTNHTEdPalJHbGFjM0diTGpNMGVnMW5T?=
 =?utf-8?B?Q3hIdlo5RU1yUU1pNjVadFlCT21ZcXhYQ0xvSDY4ZHltY3RwMTdqOWlncUxD?=
 =?utf-8?B?amxqWkFKSnJDQVEvaVdYQkJXOTdRTjNNRWFud3FyRVYxUnFOWVdwTjJ0eU43?=
 =?utf-8?B?eUlURE1XU3B2UE1oNVpxMHNaQjIweHVwS0lmTG9KSDZ3dll2RUthZXFHTW0w?=
 =?utf-8?B?T0Y3bmdPV1FQT0ZrN2VxMFZQU0pTVE8yK1VUM2thZHBOc3FObGE4STBROW50?=
 =?utf-8?B?KzdTaHlMbEpWaDVsa2R6QzZOeTJJbzVEdVVqR3ZWaUVjUWJScytaU2g0Vnlx?=
 =?utf-8?B?NXZDbDRHQUdwMkZuWG1hUFhmUVRPRk9EbE1uUDg2UTFOY2QrV0l0a0lPeDNt?=
 =?utf-8?B?cS92QnhudjFGUHduekdYS0JwWHNKTmppYTRiRkxEcXpKMzAyL1dENGtTREFV?=
 =?utf-8?B?QzFPRXQ0dXJzaEVLSzgrQVFob1hoTkNzTXhXSE5JaGNrNlhodTEyWUd3WHd4?=
 =?utf-8?B?SWpzS0JaYVFYclVXRURQNStjNW5XZFRWZlNvQmMvc1hJQXlMQWFha1BHRHFh?=
 =?utf-8?B?R0ZuZVRnVHBlUVlTSDBtOUFCZ2tUeS9zTjlITWlZeThSVUgzbHYrMFl4VFdN?=
 =?utf-8?B?MFA3VWRYZnEvRHlQSy9XbHNqc1labnd1MFpqT2ZGNkRnbTBXRHNZK1RNOGZ1?=
 =?utf-8?B?eHRZeHNoREdMaURMSitwU1ViSHg5LzdWZE1uNzJhUW1pNnhpRktYaWtkL29w?=
 =?utf-8?B?aWVzbnpHbDlHSmZ3SXA3QkVVRHllakdvbjA2VjVXWUl3NXF6T2Y0TElPUkMr?=
 =?utf-8?B?VnZNTWtSeU9uY3ByckhtaXZxazdGWW9tMlhSOFgwK0gxcTlBQ1dMMjRWUEkv?=
 =?utf-8?Q?8oGU/NioPlS1h1ME=3D?=
X-Exchange-RoutingPolicyChecked: 3y+WK6+JYK7f/aFj855VALFVV6cOszx3sSmyG+fpBMhmiBpUBoyn7Y4wyuA5pURK4fEFkhr9fskzc2B5eMzwTzmeb2Vv8tS8OMhGtchLxXqwuBOrbip4MHnSWAldbMFk8/p5BnfH/RVoUlJPp6otzLbW8RY1dG9WQhxdAJKA3R5yKBCZY/THK4ByAn/EqnjdE+JQsxB9OOMdiig4nV42qJA4vRqRqdCQ2t1NfOE6HueY1+feAdQKPPbbn82CFszRidobbmCM9T3QzANBtlMIFftfoF4Kgv3Dhl/0mCnHYOprXWqbN8uVKQd8xbqWhxrAPNcLwlfx2odbXBlWxtJ+jg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ca2bf8-35ac-4f9a-964f-08df18f61da1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 22:09:04.9293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /O2FFDAUnomqT3iYMYEo0AnHSjyEuI9ErwyoDaNXuSXkiaoZ2gNn6hSjHUyUzSWZH7inhrVkUBC4nE7sXpMFPaX7ApY+YvZ6rG7Hb+3nXXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF383C22AA3
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


On 9/10/2026 11:42 AM, Umesh Nerlige Ramappa wrote:
> perf can invoke the PMU callbacks from the scheduler with the runqueue
> lock held, e.g. pmu->del() via perf_cgroup_switch() from
> finish_task_switch(). guc_engine_busyness() drops its GT wakeref there
> with intel_gt_pm_put_async(), which lands in mod_delayed_work() with a
> zero delay. That queues the work immediately and wakes a worker via
> try_to_wake_up(), which then deadlocks on the runqueue lock we are
> already holding. The put also happens under guc->timestamp.lock, so the
> stall blocks any concurrent __guc_context_update_stats() too, and the
> machine hard locks up.
>
> Only reachable when a concurrent put drops the refcount to 1 inside the
> get_if_awake()/put_async() window, which makes it rare and load
> dependent.
>
> Add intel_gt_pm_put_delay() and use it with a 1 jiffy delay. A non-zero
> delay takes the add_timer_on() path in __queue_delayed_work() instead,
> so no task is ever woken from here.
>
> Fixes: 77cdd054dd2c ("drm/i915/pmu: Connect engine busyness stats from GuC to pmu")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16984
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Assisted-by: Claude:claude-opus-5
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_pm.h         | 24 +++++++++++++++++++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 +++++-
>   2 files changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index 6f25c747bc29..24c8b014864d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -72,6 +72,30 @@ static inline void intel_gt_pm_put_async(struct intel_gt *gt, intel_wakeref_t ha
>   	intel_gt_pm_put_async_untracked(gt);
>   }
>   
> +/**
> + * intel_gt_pm_put_delay - release the GT wakeref, deferred by a timer
> + *
> + * @gt: pointer to the gt
> + * @handle: the handle returned by the matching intel_gt_pm_get*()
> + * @delay: delay, in jiffies, before the release is processed
> + *
> + * As intel_gt_pm_put_async(), except that dropping the last reference arms a
> + * timer instead of queueing the release immediately.
> + *
> + * intel_gt_pm_put_async() ends up in mod_delayed_work() with a zero delay,
> + * which queues the work straight away and so wakes a workqueue worker through
> + * try_to_wake_up(). That deadlocks if the caller already holds a runqueue
> + * lock, since try_to_wake_up() then tries to take it again. Callers which can
> + * run from inside the scheduler must use this variant with a non-zero @delay,
> + * which takes the add_timer_on() path and never wakes a task.
> + */
> +static inline void intel_gt_pm_put_delay(struct intel_gt *gt, intel_wakeref_t handle,
> +					 unsigned long delay)

Would a 0 delay make it the same as async? Should we have just one 
function based on delay value then?

Thanks,

Vinay.

> +{
> +	intel_wakeref_untrack(&gt->wakeref, handle);
> +	intel_wakeref_put_delay(&gt->wakeref, delay);
> +}
> +
>   #define with_intel_gt_pm(gt, wf) \
>   	for ((wf) = intel_gt_pm_get(gt); (wf); intel_gt_pm_put((gt), (wf)), (wf) = NULL)
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 788e59cdfac9..32d722c378e8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1361,7 +1361,12 @@ static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
>   		 */
>   		guc_update_engine_gt_clks(engine);
>   		guc_update_pm_timestamp(guc, now);
> -		intel_gt_pm_put_async(gt, wakeref);
> +		/*
> +		 * We are reached from the perf callbacks, which perf may invoke
> +		 * from the scheduler with the runqueue lock held. Defer the put
> +		 * on a timer so that it can never wake a task from here.
> +		 */
> +		intel_gt_pm_put_delay(gt, wakeref, 1);
>   		if (i915_reset_count(gpu_error) != reset_count) {
>   			*stats = stats_saved;
>   			guc->timestamp.gt_stamp = gt_stamp_saved;
