Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7EF606A335
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2026 15:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k/QfaJMY;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DT5KoFg4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DE410E544;
	Wed, 18 Nov 2026 15:34:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA61A10E544
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Nov 2026 15:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795016079; x=1826552079;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4xtcuQYeS30Tp2yZCMKSdw7wfL3KE3zWIvPBNkrgSeY=;
 b=k/QfaJMYUNPkZbQheCf9HXjkeH+aaeIRT3DjiH5molcjugO9Apv96CAo
 ixDsISv5nzWsW642GuaoZUwl1U4IgXBxR7DzO5514eeCLuIvyZGXtGcpf
 VjSPxdXw//Re9is6ygdpOr7yyobx0VmigwCAyRj4L33eDEjuC8//TYWwN
 TpCY1kFbg4XyamNaKq4SqSSu/sAorcaDaBbBjg7T2feDVDUQWtQAo6dMw
 uzFVGHbaDpIbJ1vBIvMFCBetnk3+8XKN3EQJA9WJgBN1TsznqCEqdYR//
 qRf7RrbhmcMw4vy6HPE/wH4ZpGVqc5uUgWHdvsxBoqPByfMnUXOSRQ4uI Q==;
X-CSE-ConnectionGUID: kA7sPhsaTWS27WmCcwiz8w==
X-CSE-MsgGUID: l/704JPuTYyBSZwzv68Z8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3857258"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3857258"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:34:38 -0800
X-CSE-ConnectionGUID: 44ob57gbSmOhQMuwsq7f1A==
X-CSE-MsgGUID: cgkHogIBSF2eZ0zGgSgR7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="11906820"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:34:37 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 07:34:36 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 07:34:36 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 07:34:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCncCsNTfaSYLZzUEd4rcIfXzzJ+W0tlABMpWUebhvgTq3KxWqazlsABU/Zocz9rUiTRMQXxPfE0puqDs47ItOAAr9c8LMCduiPBuhLHRRhJG0AyOZ38MJk/k6rLZKQq57Equ3mAYErKGJapZtNkYAWM2yfeiLmCfst4zWkT7UnniMxolIW2Cvc7eiISu7mx9xG3c5jdw+vK/fXGWZ4z23veCfvT8Ce+NSoNmnELph0rHqU4doeSH3wpDmxJA0VBjXZK80jdrcklS4TNlXSqaKvLDqvqxJn/mBBINZPEYGYZsN7kIOzITAM4lZV1D/5lCRtwAG8wIPFCpkF6HlkZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xEtI0DUMmmEdC2Y6CsgRfBze31XwA4nagxNJ+qmGrU=;
 b=EH+oMs0o1+mWREgQsAOj9q/INtEMHDqvYyI52XjqtHIm7ABAWlCUhjK9PQbi4kQJTCbQWZmYq+cuwreRVguxJxuw6dsiyYx2HpI1/LQu+ugY5lp2LJ5pa2hQ6JayRweFDOYzuIA4SOc4LeJka2V7ymjKE8KrvlZwaNZaCcCNJxRyrF5j/pQ9MY+1ISaV8wSBvCuRCqu84vM+O8eMMFX04KhwhFvRg38TNrfm3GR1KeOrnEPhYbx/8zZJgS79g9woCzJl2s4HWEVW2cmIb5pSKkqlWgWCjk+GWtuPA1Jwex01JcaYhRXIOlFhmtrnsVAosga3RZ2aMrElm2e2ECHRiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xEtI0DUMmmEdC2Y6CsgRfBze31XwA4nagxNJ+qmGrU=;
 b=DT5KoFg47DIYoLm+yU0WiF4Ox7YiHjBMlmiUxA7lsqUI27YdcLz4UgG9jASlhtNeaxGdzwG7KJJz2EclHiq9zvPKSXMi2aFmCnl85zuDP8QK9CoBzkuY3XYDWYMOdjXbIiMPMrcNbtffQx1SXd0A18NAf4BGTx1MgDKXrczO3/M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by SA1PR11MB8811.namprd11.prod.outlook.com
 (2603:10b6:806:467::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:34:34 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:34:34 +0000
Date: Wed, 18 Nov 2026 15:34:24 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <chris.p.wilson@intel.com>, <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v6 3/3] drm/i915/selftests: take error_mutex in stolen
 reset test
Message-ID: <ocssumcrob46pblkatgoctmk5rb5gzaeeoe7ifinknfd65e3tq@ndmwuirrfepo>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1795006734.git.sebastian.brzezinka@intel.com>
 <72a2b16b5a4cf8deffad74e8ae85a586a5d693a2.1795006734.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <72a2b16b5a4cf8deffad74e8ae85a586a5d693a2.1795006734.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DB9PR01CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::19) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|SA1PR11MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 607ab05d-6551-4770-bb8c-08df4589724b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|261021123027099003|261022075727099003|10067099003|56012099006|11063799006|4143699003|261026140227099003|261022115727099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261026121527099003|261009223027099003|22082099003|18002099003|6133799003|27256017;
X-Microsoft-Antispam-Message-Info: W7MqODAQIoUwOMBwoDgEVXbi0xTfZzGHPnWbn67iaL2vOqlVKsTs6NrXx2fhuQ2JY62Rdh2Ogr0WTmH6C4Fl8WTtkAL+pxgRc6w0R6eo9nxeb6KCXSwTfAplnkaWJzncQ1PYnw0VLI2sWNAU2FtNA2nXoMX9vmJzvaCp69tB5qPXG3MpvL71P0s1oXr4G1NdYQphuZ17Yl4RLfp8CGbNJ0Xq6IdteEQRkm8HfdfJvayWZ3/O3Q3sh6NDSYwYI5zyRCJXx0kBBouKyCF8FrWTRKWrmtfQ/No7LdRCwIPSIm3KP2S/PHOIZrzy1NYyYwK8PXAKoHEwQiGb4atSSHMB6mka9lk2WYyJDghfHAi9Qr4p4CNZc+KgcKQAE8RLLbskD1j1KSmmf87JwxKistLB6Fw20D0cV6fdBMnOaFjo3Vxf1CZg8ucADQGKI4JrW4AB1AN8l+nPm3rupeOnOFE9Hy1TD6ydOlsSWrFvD0ECeeN185s2tWWrrjsqBYPpds5E2vaUhaNy9wLy6b/4uozPEzSDeOkJESGobQ2f0DTGOcLlr2ak5Oh7+VOX6dwNcTb1Be+pcFXgVGPhnV5T6wxUp9eBBRGlEH9KVGp9iXH5074ai3QopZZypNej2OrqMHBx36OeMGuRO3SzPx43uAR5u0Y6cPAmJyFsadUTqyNlPTtttrbg673TOJEZgvFuxf750ft2wtHQZG6Kcdwzu5avCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261021123027099003)(261022075727099003)(10067099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261022115727099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261026121527099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2I0UVVPdDgwRzVmeGNUYUk5dGNKSm5vb0M2OGk1a0tHUVd0ekx5cEdvbHhu?=
 =?utf-8?B?Nm16VDZvV0JHekVzNFRIWlZ5alBDRFozbDFoOHJqc0x0V1c0VU8vaWdwejF4?=
 =?utf-8?B?S0xxRW14VGg0REpveGhNeHVNZlgxbWNxTFNyQ3lkdkVnSGRIY3o0ZTR3SkRT?=
 =?utf-8?B?MXU0SjRyNlYvSEZjdWR4dlBOSXp0RTFvalRJZWtRdXVhdndFa09hcDdwU1Vu?=
 =?utf-8?B?OGcyN2lvdVVxZEg5YUgzYlJWa3o0NDF3dG11b2dud0czOEUwRkVqNkhVQXUw?=
 =?utf-8?B?TXI3RU5EYU01R01WVk4rNFdHMVhsRXBteXFBRVg0QWZRd05nUjE1YlIwbWxj?=
 =?utf-8?B?M29HL2J3RTY5UXNPK3V5VEtKSXlYRFVxbllIcnhiZDczc01BeHI4Mk93dlBo?=
 =?utf-8?B?UjZWOWFBSnlBS2hKbytsVEdSZGFaWVRsbDE1OTIzU3VlOG1QdE1FbFMvVUl5?=
 =?utf-8?B?OGpIUEJheHVjSGswc1F4UU1jajJHdzk1Q1prbGh5NzR6S1E5Mzk5ZjdUWTVT?=
 =?utf-8?B?QnhyUDluYWM2NG9KaGxmdU9oM2dCNmx4WUwreVdGN1BmTGJ0YW1wOWpzYjdU?=
 =?utf-8?B?a0hIV1hSeUJzdDBHYnVkclhmRGlzWEZLL0R4ZHpQUVR3K2RCQVRydnBJMWhH?=
 =?utf-8?B?TEdRcERjRmR4V25IZzVJTkNkK1hDSlk4YUpUMlF6UWtGZjJRY1drdnFjOFE5?=
 =?utf-8?B?cnV5bTZzTkZaREtQRGJyVktid0dSQWNIM1JDUjgyUUIrVFZWVEFWOXdITFho?=
 =?utf-8?B?a0w3VUpMdHJUYlUrYUNjL2s5c2lwM3RGY3hsbWhVU0EyRjV3SlFGd3orM01k?=
 =?utf-8?B?c0dORjcrZzNENU03NmJmcDJuRU9PQlJnZ3FycmhDVW16T2x6bmh2UUtxeWRG?=
 =?utf-8?B?Sk00RVN0NmNrZGFDMC9EZkd4VVRXU2F6TTZNaDBlTjZmeUp4OXNsR05DQ3FH?=
 =?utf-8?B?UXhObk1WVHVZcWVkdmRGWitOWTlRVzNsUHlEaFJWckRMVFJtdzc1Y2hoZkhI?=
 =?utf-8?B?NDRsOGc5WElHSUlGTXdBMFU0MnZDQTJqRVh0RFdTaDlMTHNzbFprOWFIckhr?=
 =?utf-8?B?Szd4UWNSTHRTUGpwUk9XeUErUSt0L3BDSXhmQmhzTGVYSDByRHN5YURaN1BF?=
 =?utf-8?B?WW1FVVgvam1uNHhoN1d0Nzg0Vk1wcENLSzJQUjNka3RGMXVLajBId2ovLy9o?=
 =?utf-8?B?UzZSaVlqN2ozakdYOGlFRFFSZFdBSS9heGVZRy8zSjdrUUhvTHBTQm1rREVp?=
 =?utf-8?B?ZWxNdlpKbE5Sekl0cVZ6VjZXbmoyNjNlV1pUZWNicFNvbThjTGx5UXdVMVIr?=
 =?utf-8?B?bHJXbk52M1VUQUdWUWtvYXJJa2NiT0ZIMFVudFdQWXNhcEdHSmo4KzlGWExz?=
 =?utf-8?B?UzdUaFFQOWNyclp6SVdpVnJrRExhUy9nQjNQekF1TXJiV3FleGs5RWxpZ0pZ?=
 =?utf-8?B?bHBVVTZjVThwa2trUk5WNU93THhSS3FZamNZRnhadzF2K0dra05jZmdyV2FK?=
 =?utf-8?B?Y0MyaGxIbWZobGtMREV0b1djMHBqL0ZYQlV3c2NhL2ZtTDdHc2pyNlBxaVFn?=
 =?utf-8?B?RXN4LzlYL1piREp3NWJUOEhEbDllTWp2YjRhaGJlSjlWd21BYmFPNzRtR3F6?=
 =?utf-8?B?a0loV2NDMkd6VnZuR2NoTnJtTzZrTjV4VEpLZGtwM01wc1RnaU91NlVaMHN1?=
 =?utf-8?B?YXV4alg0aWhxK1ZaWGFibXN0V09RMzVVaktkUDA2VFF0WlJxL3RmVU9YVEdr?=
 =?utf-8?B?WURTcVVUTkFKRlhUekI1Q1k1RGZVeVhFZXcwYlZlNUdnRTQrdHJqZDJRSkRB?=
 =?utf-8?B?YUNlSm9VNi8vbkg0SmhKZXpFOUVXYkJQREI2L0dQOU9IYmI0YlRTUGtiYTU1?=
 =?utf-8?B?WVl1T0xTUGFGT2o0WUJiQjNnaTBPSi9LaG9PazJEa05ubytxTHorVEdGRW40?=
 =?utf-8?B?K1c3M1o2R1o2YWM0TTdtcC9UbGppM0M3NEdWbndFbU9DTmREQlhTa20rS1N0?=
 =?utf-8?B?WmcwRTRtdWp3REpwSjlpTEI4WkZlN0tMYWZWaG9wbUd3amtTeFVEZ3pxOUF1?=
 =?utf-8?B?UC9RSmNSZ3A5QWxySkVtMVozM2VaWGZ2dVFaTzJPR3FvY2RGNWxYeVFyUGtW?=
 =?utf-8?B?eGh0R29NN2JheFU2d1ZRRGVGSGlHQVdxZC9DVEQ5eGQzOGdJSVdvQVFNYm9K?=
 =?utf-8?B?b3RHSlAybzFNelROMWpUeVdKSVJHSHRpMkxhRFhuTjRsUlRKbEs4UWdsdHVR?=
 =?utf-8?B?RlJWc2hnYnh5VFNGYkl3Nk15ck83VGZ2SHZnNkYzK1lvd0F2dk16VENNSVNS?=
 =?utf-8?B?NjVXWTdVL1cvZENHQ01CNzNXcEFETVhMVHFDT0F4N0VMbERwL2hVUWlRbmRo?=
 =?utf-8?Q?9TniViBb0aZc53Cw=3D?=
X-Exchange-RoutingPolicyChecked: SR/7+X8PB1uDaV0uujp7vvxZAX9yi8/Tjzv6Dgd31jn7n+P8klTpcmM4Lzjqq8VLm0SosEmhFR6wGNtJWkWjv6LXdjbwA5i7OKUA7Vls9CevcL/BITgjX+eBKjyeL5rHQLrUwr3OGWjXMGCSUs/5vwQW9EltIvy1RsSPtqVdxwEmRDrUXea+ggceZa/KQ3WO/WoX1UNHL2dCyOLRvuluTiTS0/lwx5trHz+on2qsaReL7W/ZbnQNMg8udnmrFW14SqmH6vvCcBCiPttcmcYcxlP29F/1Yjxn7gzCZRy5LuiK56twS6sW8guA9OSVnROC25wbsTbWXcAbvdCLSiCZqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 607ab05d-6551-4770-bb8c-08df4589724b
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:34:34.0891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbmjLqKdVPIc36gZ3Ju+kYNQpXjl71Mp5WORQD2HqW+xy4oY5k7n5Nh69PDY1rrD28bNeEI0YORyNqbAR3SDn0XhfqwjWl+fI4rI/gGa/Xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8811
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

Hi Sebastian,

On 2026-11-18 at 14:02:20 +0100, Sebastian Brzezinka wrote:
> The stolen reset test reads and writes stolen pages through the ggtt
> error_capture slot, but it does not take ggtt->error_mutex. The DEBUG_GEM
> poisoning of stolen pages, which runs from the object free worker, and
> the GPU error capture use the same slot, and both take that mutex.
> 
> So the free worker can change the slot while the test is using it, and
> part of its poison ends up in the page under test. The page then looks
> partly like STACK_MAGIC and partly like POISON_INUSE/POISON_FREE, and the
> test wrongly reports that the GPU reset modified stolen memory.
> 
> Take ggtt->error_mutex, nested inside stolen_lock, around each sampling
> loop. Don't hold it across the reset, as the GuC CT worker can take it
> from the error capture path while the reset flushes that worker. Use
> raw_insert_page when available, as i915_vma_coredump_create() does.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_reset.c | 26 +++++++++++++++---------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> index 09a08a91e610..bd5876da6449 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> @@ -36,6 +36,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>  	intel_wakeref_t wakeref;
>  	enum intel_engine_id id;
>  	struct igt_spinner spin;
> +	void (*insert_page)(struct i915_address_space *vm, dma_addr_t addr,
> +			    u64 offset, unsigned int pat_index, u32 flags);
>  	long max, count;
>  	void *tmp;
>  	u32 *crc;
> @@ -90,18 +92,19 @@ __igt_reset_stolen(struct intel_gt *gt,
>  		i915_request_add(rq);
>  	}
>  
> +	insert_page = ggtt->vm.raw_insert_page ?: ggtt->vm.insert_page;
The explanation in commit message focuses on the locking itself,
so changes to insert_page calling seem unrelated. Could you
split it into another patch or, if it is required for this part
to remain here, document it above?

> +
>  	mutex_lock(&gt->i915->mm.stolen_lock);
>  
> +	mutex_lock(&ggtt->error_mutex);
>  	for (page = 0; page < num_pages; page++) {
>  		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
>  		void __iomem *s;
>  		void *in;
>  
> -		ggtt->vm.insert_page(&ggtt->vm, dma,
> -				     ggtt->error_capture.start,
> -				     i915_gem_get_pat_index(gt->i915,
> -							    I915_CACHE_NONE),
> -				     0);
> +		insert_page(&ggtt->vm, dma, ggtt->error_capture.start,
> +			    i915_gem_get_pat_index(gt->i915, I915_CACHE_NONE),
> +			    0);
>  		mb();
>  
>  		s = io_mapping_map_wc(&ggtt->iomap,
> @@ -120,6 +123,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>  	}
>  	mb();
>  	ggtt->vm.clear_range(&ggtt->vm, ggtt->error_capture.start, PAGE_SIZE);
> +	mutex_unlock(&ggtt->error_mutex);
>  
>  	if (mask == ALL_ENGINES) {
>  		intel_gt_reset(gt, mask, NULL);
> @@ -132,17 +136,17 @@ __igt_reset_stolen(struct intel_gt *gt,
>  
>  	max = -1;
>  	count = 0;
> +
> +	mutex_lock(&ggtt->error_mutex);
>  	for (page = 0; page < num_pages; page++) {
>  		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
>  		void __iomem *s;
>  		void *in;
>  		u32 x;
>  
> -		ggtt->vm.insert_page(&ggtt->vm, dma,
> -				     ggtt->error_capture.start,
> -				     i915_gem_get_pat_index(gt->i915,
> -							    I915_CACHE_NONE),
> -				     0);
> +		insert_page(&ggtt->vm, dma, ggtt->error_capture.start,
> +			    i915_gem_get_pat_index(gt->i915, I915_CACHE_NONE),
> +			    0);
>  		mb();
>  
>  		s = io_mapping_map_wc(&ggtt->iomap,
> @@ -167,6 +171,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>  	mb();
>  	ggtt->vm.clear_range(&ggtt->vm, ggtt->error_capture.start, PAGE_SIZE);
>  
> +	mutex_unlock(&ggtt->error_mutex);
> +
>  	mutex_unlock(&gt->i915->mm.stolen_lock);
>  
>  	if (count > 0) {
> -- 
> 2.56.1
> 

-- 
Best Regards,
Krzysztof
