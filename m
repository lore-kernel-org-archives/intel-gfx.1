Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA648C9830E
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2026 09:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7124010F98E;
	Fri, 25 Sep 2026 09:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2xDQ1h5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071D410F98E;
 Fri, 25 Sep 2026 09:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790328634; x=1821864634;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xTqkna7qtPQZfvnLLY+FDYJUCDeObwkgGF6D1WAGOgk=;
 b=F2xDQ1h5XSFtxIP4JEj6SotHSo8g7ImYSICpH9O/f6hsH8i2kSqq3Hqk
 Jk8NM76S2p8npVLWDNTjqo6we2aRqhqshpu44f/H5UOP9hoPUZLJmI9aO
 ikHRPF2e7fAWNUP7K5FMxYiLD4/NtKxJFyBJNCdLUof7BmV+bHlm+Ud89
 MY7Y+WWmiDHiB6Sl8VXIWyzP7JFXxwh7yVO7Y/Abbw/2ncbrTiZmabrIC
 yVvmkQnG++1LzPY02S78cBYP9uod/LHz4XdRcBbsfbO/E1eR2ctopV2rx
 LtRUaBifP9rkW1eRxJvBpSHKBv4g1PPFLVzwWXzp43oKtkDELfPwVs6jN Q==;
X-CSE-ConnectionGUID: omd6L+wPRr6mD84Ws0wvpw==
X-CSE-MsgGUID: yD3AI6ofTTO5COTJ965HEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89976561"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="89976561"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 02:30:33 -0700
X-CSE-ConnectionGUID: Rh5gEt7dQXyANJB2xKKU8Q==
X-CSE-MsgGUID: M1cZfAftQM6qzXZZAHOMRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="272413203"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 02:30:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 02:30:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 02:30:32 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 02:30:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3eMD/10rui2U26iLkgnt6MH0PASYnFnPWPCnJfJPMke745VoG0CXvjELuCo1BK/UlBhfX4ZKLsi1InOKXyT5PaPK8hEXp55HxxLbWxE0JLBiFVKeBZwVFXTP2jcXWnoti64l3yqkO2VvSm1CfaEAhDFfKsvrEHtFk/RidcuprRGDdnsZhMElYS0jI1yovZLotHwd+4TStKu3SYxdQbTjxCW9HfUXFG5TjBGqX9R4ep3y5GMi6Yjeg1VK8NQIuEs24+Chl9Zz9pMQt/CWdHxwqwv4GxWHTNsbH3Hn8V4UNk8PWn2PovzXkzkTObDPZUt+EQ9KZ6xUZ/uhGFgttwLTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scFuzW+DdO8ddC+NLJf6lDOsk24KRrNz4SaeyD7RHvM=;
 b=fHdOkQRAc21DUsRfRjS1j72Zt2YCvakFcIUUjnmX9jJ1DI8//UWrCqxRJdcVoLos4M32rck4i1PPRqy717cvcfJTOLShIt/BdgQKBTt6Lvl2VWTKY/MA50aC3neoJUUdUqPAsj18g6/Cpq3dj7vWkqCnxHOPo5H4bcXwFFAgY6hTALComdLt/KEFsB1+qbsz47vWMGPolPKidXa7/t1yVjwhFTejzxhIAmSKTUsLpclx9O4IzsyT10oev2OGWKSTipPCdxSMqfR96fnnvPEgwPchoZa44+eSYRXbDkRN2OBC7Y2gC+vjlf4jT0BcqkQUvGfL5//dj8Z+bv8xMW7z9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 09:30:29 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 09:30:28 +0000
Date: Fri, 25 Sep 2026 09:30:16 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, Zbigniew
 =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/gem_softpin: Skip safe-alignment
 without full-ppgtt
Message-ID: <kiqllezfp66r4mjm4atttgkn2uukafy5abrphdxg5yj54n4yi5@u3cefkzkltho>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260924152443.829382-4-janusz.krzysztofik@linux.intel.com>
 <20260924152443.829382-5-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924152443.829382-5-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: VI1PR06CA0221.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::42) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|IA0PR11MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: a9cee8c5-1d77-421c-8e8d-08df1ae7a2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|10067099003|11063799006|5023799004|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: Z9IH0AEoDgt8f5kFa44VNg3d6Ra7htrspSL30cFH1NuFtTSWqvd/3acAg6PKKyynLWWEyPYUVcCaZRaXJdebbAHXqLAeW6aeucdb7NQ4rsiZluZgABEHnqhpCB5pFzRXz2RDdJ3fBOTE4WgZNnCgC0gsFPOqJ+bGyvgKHxokFWbLAFyIFmdpfOYwloXDV6k8senfziIvt5MzLyDj0YiSDHdsG6JXSVN1KCfIZ0wgrmzEcGjl9r6jtCVj+DCGLsRXzMrG/UuVjHvH6HcxkD4h93AnSK2pEj2KufuNqiK+h3B7jbKkwhVzMgo+BwD5p7ZrdsvCHBhY085bNf/svralaQ1xiH6RFgF81qgpa9bDXlQABJ9s7gmBaGhI3WRvjcTrw8T1b/WP4AuKGcHh1qgpZHrK1a3Sd6dNdAy1RWCWI98E/HX0FQEatlNDiITjWvQ/Hbf2+gZ7B9mNgG4AKOAj9N3cZBLpxCpB6D8IcYToF2pEPqgbMTHxnl4xGvWu/fsRVk70C09GFcBtU5mwGeI+YxXxbyctB3g5gZftRRkDnU1mbCxDTsIdTXPUw7BtgEUh6lwtWPAER+hXD7eTvL3XxgNdZVthLykjjp9TFNTNVYWdjCCUwthWDcuhlupbTDLp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(5023799004)(22082099003)(18002099003)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1BabXJOYTFIOFlRdzB0R1NZTGlPSFFNUEFNUHFJSXdzQmozNVl4eS9yS09F?=
 =?utf-8?B?YXd2TGt1dVVKWmFuNVl3THMvZkN3aTlHL3BaMTZyTjNwRFZLaHFUck1Pekxk?=
 =?utf-8?B?cDVsK2JVWjZleTVrMzBYTHpxTHpEVGdaVTVWaHhSbzlQODZlU0ZNaGJRazB1?=
 =?utf-8?B?OVNyYVduQ1VyV0ZXcjNYeEx3NEoxdHljNExtdmsrbXhERkdlWTNlOVBJSXg0?=
 =?utf-8?B?eFFWc1ZhTE5wbnRma3hwd3lRMzIxWmQ5ZmR2RmR6UDFMZnduQVFtMDh4cnRO?=
 =?utf-8?B?dG5YeEEvaEd0K1lyNndLOFJIZmNlUHpMSzFhMnVNMFB4Sjl3b09tNnJrc0JN?=
 =?utf-8?B?TlcxUGNJVGd5ekVpRXlEL0o3V0hjSFc2RVYranMyYzRGd25Qb0dOZE1vL3gz?=
 =?utf-8?B?WGk1RExCc1VEV3NMM1hQM0RoclpENnJqREI2dWlrWi81NndoeXhjaVoxNjFP?=
 =?utf-8?B?RTBiWmlMUVp5NFVNK01OWGZwcFhKaFc5QVE2dWh5bEJSVGo4aVN6Z0l2SmVT?=
 =?utf-8?B?SjgxQjZLYTBxTlZhdXF0SVdNTEJ6cTgyTlAyWWxiSVdBdmp3Mkx0cG9jcC9v?=
 =?utf-8?B?Z09wR2V3bzJKMkE1eEF1Ly8zNkQrU0VRdlR4M0VpNml1WmMza0lzQmMzeCt2?=
 =?utf-8?B?ZUNsNitFbGwvcTRxYlQ5ME9hVGcyNmdvUWxZYWd3OTE0aFFUN2llRU5BdElp?=
 =?utf-8?B?M2RtbXJBN1g1QVlZMTBxRnI2SGtrc05IeFRFcnEwa3R0VlpiOFZ4Q3pSK0xz?=
 =?utf-8?B?dVo4S1hpNnlGVW91MDZOQjgrTHJWYW5jSkErekJZd0IrcW1iaEpOeWNTczI2?=
 =?utf-8?B?anF2Zko1Wnd0S2hSRWdxditxazhIdlg1TEpBZTQxOURvR3dpN2FEcnpQdktS?=
 =?utf-8?B?VElzTUJvUWJTbG9BcFQwRWMzcXp1YWtpaVNHSGc2aXE5N3k1a2ptODFNTWVF?=
 =?utf-8?B?Y2RZU1EyZXBRajVIeStqSFFCRGVNd3NTOWsyKzd5ZEdKUllybkM4bFBBei9x?=
 =?utf-8?B?S0ZMckxXRXl3OGN2YTkzMDlaSDN0dkJ6czI0Wkl5WW1uejR0bGhlaWtsWmhC?=
 =?utf-8?B?NzdkcGg1a2g2NmZWckZGTTBKT2ltcWRsTGRNWVhqc2crNFJRVThlUnpoUTl4?=
 =?utf-8?B?ZUhEOE55SW5ZYTJvTkV6bk9wbVpIYitwZEd3eXdYMndLN2ZWQThuVEw4V080?=
 =?utf-8?B?VDJyVGFBYmRMWGJ0U2cvMUp4cjQyTWtJaGZoeUVXWFVpSCtwVGRleE5uVjJa?=
 =?utf-8?B?bTBXN3FuU3lvd0NUMlAwM1RCaFpxTC9IdjR2NVg1TXJxRkdTdk5OMkpjSkxG?=
 =?utf-8?B?K2Q2ejdZbmdXb2IyWmlEaWxwVlpjVzZHMWRYK2VtV09iOFNteGR0SS9xUzh5?=
 =?utf-8?B?U2wzNDV6YkxVMDUwZ04zSG5SaW5RMUxJdk9QUElwdkVhaXFxbEJJTTdaN29j?=
 =?utf-8?B?QmdHK0VVS2tUVENQcXM0bmJ4SXdIZUZhM0xWVDNZVnZnQnIrRTdzU1dkZkkx?=
 =?utf-8?B?UGd1VUtLeDY0NkFrWG1QLzQyNTlhZ1NHT1JiRm1GeDdLZnhSR2l6VDNOVTNK?=
 =?utf-8?B?c2V6eTZPUGJ5NE5SY1BrejlNSW9PbTlpZU9KRVRKcDhRVE9nZStxZFN4OFpp?=
 =?utf-8?B?c1RPa3Y3T0xmd1ZBbVFHcjVCYTJDaWZvR0JWK1hoYWoxSjYreDVGU21FbnBH?=
 =?utf-8?B?QVR4NUV1cGxPU00vM0tEMnZOZGRSNWdZT1orM2MxemxHNytPRk1BUHRFdnh0?=
 =?utf-8?B?dStPUkl0TEhBaGdyd2tBTlF1NmVRRER2QnIyb0hSLzVKOHBDZ2kzYWN4aE9k?=
 =?utf-8?B?WTRXditnT0M5Wjk1L3kxRHB6L1k4NXdQenhLYVEvU3BhRjdOcms2dXBwNHox?=
 =?utf-8?B?N2pxZ2VqZ0lFNTJrbWRkK2pJYW1nMXBORzBZNWtoWEtqRDY0anFnUXNSNmlQ?=
 =?utf-8?B?QzAzWGxqRHEvWmd6THZjQzdxRHJFWGVXd2dDZUR0ZTNwRWlKeXorY0dXQ3dJ?=
 =?utf-8?B?a096QWk5NGFRc0ZIcU9IMGRXQklxWENOMHE2ZWIwcG5tb0dwYTkxWWlTcHc3?=
 =?utf-8?B?Z09BcVc2eTRiSnJBZCswaVZlWUx2L0NQQ2VnZW1IZVBmZnM2NzZrSEgyUUlZ?=
 =?utf-8?B?MnR2d0wvYThDTHVEMFcxUkpreCt2M2V3WjhTSjV3b1p3Um5ERjhPb3V0SWt3?=
 =?utf-8?B?V2hrcHFKUlpac3JKWk56OVR4NGdGd2hjR0JPQkdKYUJudE81MGhnYWFMcGF6?=
 =?utf-8?B?aWNVMzlvZjdTVzZDZHp5cy9RbWlLL2o3VVU4UTZjMkdzQmR0am9xTTNVdGNN?=
 =?utf-8?B?cU5Uc3E2MU04RGFSSEZGVXNOM0tvanlIbEhEajgwUHBzaGxyRCsvT1BtWHBj?=
 =?utf-8?Q?QMQ4cTi/ppQzDKdc=3D?=
X-Exchange-RoutingPolicyChecked: UD2iVjfNxPge6tqb00x8+kA1aByTqx4fiDaZiHyIKc7djm16VZm+fToqYtvseCoG8L/jrJ6lIqwGCwlaLSUyP5QnBybnAnnY2XZyJMR0JjYH6Ivr6rA+JeTP29E2S/48igzIH5BuNqbNTHPOiaRWreE07UB/qKqZ5vKlgYYaHFbgwR9I50A1XoFZuIfIlyz2Pkk5glS1tKgL7ofRmUQiIH9UmiNWEwg6srRPxNHZi0tu0wCiZqDD+EtB2DZagyvT3qYt9Zz+WH3tzMsNF6H6ofpiR0487Reb7Q7MF6UkV4yFK5gA38b1zucrcxit9Sr6sYIalfAQYBqFxq/IBTGSKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9cee8c5-1d77-421c-8e8d-08df1ae7a2f4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 09:30:28.5052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yr9m8uS3tGGqU6uri3+8M0z9XuO3YOpRuJxrsy0Qr0ngIhYJDSZsmxWoTL8losFG8TgAWU7IusQIgi1HIeRHrRHe0iP6kLon4hHFg8eF5E4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7283
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

On 2026-09-24 at 17:24:17 +0200, Janusz Krzysztofik wrote:
> gem_detect_min_start_offset_for_region(), gem_detect_safe_start_offset()
> and gem_detect_safe_alignment() exist solely to bootstrap
> intel_allocator's start offset and default alignment. Without
> full-ppgtt the kernel can't see the ranges intel_allocator considers
> reserved and may hand them out to other users, so calling these
> helpers is pointless there, as already acknowledged by
> __intel_bb_create() which enforces relocations and skips the
> allocator entirely in that case.
> 
> gem_softpin@safe-alignment called these helpers unconditionally,
> outside the file's full-ppgtt gated subtest group. Require
> gem_uses_full_ppgtt() directly on this subtest so it is skipped
> instead of exercising meaningless values.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/15527
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Assisted-by: GitHub Copilot (Claude Sonnet 5)
> ---
>  tests/intel/gem_softpin.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
> index e67259b001..3fafde94ba 100644
> --- a/tests/intel/gem_softpin.c
> +++ b/tests/intel/gem_softpin.c
> @@ -1573,8 +1573,19 @@ int igt_main()
>  	}
>  
>  	igt_describe("Check start offset and alignment detection.");
> -	igt_subtest("safe-alignment")
> +	igt_subtest("safe-alignment") {
> +		/*
> +		 * The min-start-offset/alignment probing helpers exist
> +		 * solely to bootstrap intel_allocator, which the driver
> +		 * itself only relies on under full-ppgtt (see the comment
> +		 * in __intel_bb_create()). Without full-ppgtt the kernel
> +		 * can't see the ranges intel_allocator considers reserved
> +		 * and may hand them out to other users, making the detected
> +		 * values meaningless.
> +		 */
> +		igt_require(gem_uses_full_ppgtt(fd));
>  		safe_alignment(fd);
> +	}
>  
>  	igt_describe("Check softpinning of a gem buffer object.");
>  	igt_subtest("softpin")
> -- 
> 2.55.0
> 

Nothing to be nitpicky about :)
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
