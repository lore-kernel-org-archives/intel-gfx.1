Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39A0606A32A
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2026 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E4eWKUFi;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=f2PD/9PP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5225510FDC6;
	Wed, 18 Nov 2026 15:23:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3111910FDC6
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Nov 2026 15:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795015406; x=1826551406;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sGW3n37XeiAX6R/X2plSxA6c1Ul4YOswVckKyWof5e8=;
 b=E4eWKUFicM3gAITduA83BHbuFL8Td48OSRaTEJ1J/pRlDNoESVN0nIZk
 ONV/G5BhWvPOQnkOvgtSMOd/zR6DWqK46fcw2VAMBRRn7dQ993f4vXoR8
 xwOzX40eCoxzTp04l9Z5ipbfdUOSlDuTS95Vy7B0lbFIeCEyvWrFnxWk3
 +Vu+yG41NUL2jINmTU/ICOnpnSOmVbpERPfSpPqLCPAxBe04p9h/N1Kl2
 1YLQWAXEcDD0SC3G1CNsqBomZRrk83mvd7CdGFid25xvNz/4QHyTMOuS4
 1zg4QLq3/hE09n7hLmGkdah12WZLvyGqwDWsdctlhKTwPirTiO1MAN5jb w==;
X-CSE-ConnectionGUID: acJRlTdDR2OPGeMrR1Wb6g==
X-CSE-MsgGUID: yBpA0+A/QS68dqUNvUZKbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3908165"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3908165"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:23:26 -0800
X-CSE-ConnectionGUID: o+HrK3t1RLqREZqN3/tILQ==
X-CSE-MsgGUID: N5rDlavuR2afLE/nJO4WWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10432958"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:23:25 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 07:23:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 07:23:25 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 07:23:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBLq0H9THjGNGRYmFCU2h4xuHnkf4RZvZJrCT5P/05uq+k8+ttab39CO31gqJ+r90/73NuZsYDYaFp8VyDmuOO1KHq9pQXcVHww9dc7j8dsMNmWDF16nOR4Uwv5tkWW8hbf8Ni0bkCBPU6Vi7B1JF+bdDbTAcNlrjgrPvTKZeaH7iv/MLN8E0D5VKZhKfeTlB75AkuBLAkWFXyUo/pZupIWSlho2Q6g8aNXfaVXmdIumKSVDnXLsi9WJuP0QgJzMuWuWH9qfpzNmqIMXsharI05Ka+Ksqhz9X9I9bgpONAAAwunQbprGSM3twkM0h6CqKaRzM6MB5/Diell3pK2IWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/h0yNXPQJQQ2dJny6t0lnDYsDEO11W1vc8tYfbkxog=;
 b=J/HIDIvMptmDD/xhqd3Jf7b5fN1KSvxGpYwa71QRKpI51d/XRud6WJvYwUDZp+lQmSkp3zbOzUXebx9hl1llNVlIHZ6etx3tujSeoQvKC8p6v5Yk1UJ5DMlijsn3epRHCysUAAdlNgLlua7qfLc2nYbK7Eiun1cLFCmTlw+khEu+KddWV7lDNLd9gtgiU+0DBHlQjj6BvMdq72oBeAoVY2aEaXxzAh3sHMM0aLoar6Myirj7IhQMmwOZ3Gi1y0v4CcG+I2fhmRyhTgGrKCYyN0Dp6G6vt7ycoYroFIyPdSOy8jU589OWPDq/4eSfqmTRCS+mgdOSU7SLQdT5O4DncA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/h0yNXPQJQQ2dJny6t0lnDYsDEO11W1vc8tYfbkxog=;
 b=f2PD/9PPtGuwcbcE2BGw0F7JmA0rrxiOXalhVmjYFgcmbQOruLym8nTKKQmk81x5ZEUuhFye8FPlh6lEjheBLHD7hWP7H9SgIv4GQFOh/Zrt74BTF3jGIH2r5mvf/3L2stxXju6H8/hOurGEf5ccLz7LrPtqb+A5ppIRDaHsxX0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by DS0PR11MB6469.namprd11.prod.outlook.com
 (2603:10b6:8:c3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 15:23:17 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:23:16 +0000
Date: Wed, 18 Nov 2026 15:23:07 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <chris.p.wilson@intel.com>, <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v6 1/3] drm/i915/selftests: Fix unlocked mm.stolen in
 reset selftest
Message-ID: <dveqarxlsulf7nwrfjgolsp5ntcqlhkbziwsyth5pdzqeiqlrc@znzrnadm3rie>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1795006734.git.sebastian.brzezinka@intel.com>
 <c47b0ea2093da73a92e9e6d62b062f9cc52851d1.1795006734.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c47b0ea2093da73a92e9e6d62b062f9cc52851d1.1795006734.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU2P250CA0022.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::27) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|DS0PR11MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: ce28d077-f3eb-4764-2938-08df4587dea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|4143699003|11063799006|56012099006|261022115727099003|261022075727099003|261102123227099003|261021121427099003|261021123027099003|261009223027099003|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: pDxpo1y21XsSZNvoZItC3DCDE+BC2eSeMcTSw7x7fjvItaTorISHZtcf10ScnWnyWiyME9oDptgP2GrskqWFLZIvTSJxFjjUT9Q+NHZtSWDsUQET2zTLmGojrTpcdrWb0X7W1PIaEbzehxuRL+6/Jdn+nrO5sQRWJQlZupDymBz+fFnWeLmKMfJSbZWUW+NnjupOepKmx88JAqjOkyKEimGI8RvGUaD6wx3HNwFo5Zo92onFzSqozlcD1GXZqLLQY/myTTdJBpB4AkIhwR8iUhXHL7p8ci613r+DaImXz207c8EUhkRQKGevKWFc3c1iL52DbazzXF0H+/Xjkf6ZRj0PGNqo3VgYlWO5gxnE2MB7u4ameXokX0mVRnV1belQL0uAjAEOa0ZEt9MD1WLwo0W2IJGvNYvLScMUaF67U+9JbzRdzr9/RGaEijzStaa1DMyoWUZSCYAWbaAxWiUFw4aZ4XH2o96AUFdtEoSQRW1bkxswsRZg82k+uW3h4XdjDyfNEZAM9BWLBKmI3JoMAI+SG1q9dco0ien6l5qsy9GG71Em+UWNyiwez8m8HN9eAT0Lj8U0VrXngrVm/VBSkMYmslBPLoZQzb8Rq7CqVyDLtivdKmwRv5B9qYbBKmEE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(261022115727099003)(261022075727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003)(10067099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vkl2VzBXdGx0N0J2RkhuNXNFNDhVcU8xakdRVlpEdWJjeEd2dE9wZWwvc295?=
 =?utf-8?B?S3BaVEs3Q1NUYzQ5bkxUckZwZlh4b25zNkp2OEtnMEIyc2tWMUxqRHhkNktE?=
 =?utf-8?B?SVBBR0JGSFU4SitkMTZKZ3FTcitPaEgyY2xDRS9Uak1NenBwWlBlTE1IZGhS?=
 =?utf-8?B?TThuazB3bkxSYUhKRnJCWlVXSGRsV3krQW5LUzlrRjZISnpQMzU0VFJIWG5s?=
 =?utf-8?B?Mk1uUHFVZkZsQlpqWEpuUjdSMVNyRlp0KzlsbnZqSlphWC9VU253L05vTTFi?=
 =?utf-8?B?Qncrd0todFVxTmN6ZEk3RnhObnk2dFdKNEdlWjVsOUJWNG81Q1E0K1dOK1hz?=
 =?utf-8?B?VXNZN2N5ZE1jMXFRYWJDU1NDVzFGMDgvR09BZGYyblpwTFozaW5MQjV0KzBL?=
 =?utf-8?B?dnJTaU11Q1MzRFg4T3l6WTd0ZDRMM3lqdTFQTXUyYWVZQXFxZmNKd2xwTWJS?=
 =?utf-8?B?dG1NUVFKVXNyb29FeHRoRkVrRk1yM3dzRWVyNkFoejNCeDd5d1lZcmRVN1Jy?=
 =?utf-8?B?M29WR1VRM3N3TXN2d0M0ckZFQUZpNDE2QnUvVlFQNFErU2RoN2pCMmJoY1R6?=
 =?utf-8?B?WnlzdWUzb1ZpT0tqNHc5R3ZrRENjSWZqdi9TbTlKRU5PSlk1eFpUSzBvMGRJ?=
 =?utf-8?B?bDNGVVVBMGlqWkZFdEhueVlrbEFNc2JLRytsUlBRWDZablBzMkVGZkNKbWwz?=
 =?utf-8?B?dzN4V1VGYSs3dTAwcTlPdUg3NTJjQjV2MUExdStReHVMejlYSzMvTlBNNTRm?=
 =?utf-8?B?U1oySjBjQnBLVnJhYnZMdUY0Y2xtYjN1TDNpeWpMWXhxY0N4ZGFDVy9pYnNo?=
 =?utf-8?B?Qk9odU02UEFLT1JxQU1CUHdHUjVqb3htUWEzQnA4K094ZGM1VU8rUlpsMjRH?=
 =?utf-8?B?MVpab25wb2RWQXEvbm00N1JTbGFoTjlabTdkK3pvZSsrdlpvOXdZejV1cE96?=
 =?utf-8?B?UThON0Q4TmloNk4xTm4vSFlnVEdJNUxjWVF0dlFaVmIycHF0aENHTEFMSWZL?=
 =?utf-8?B?cDRWTUlRcmJXN1dXci9GVU83K1ZqYmRVT2kyVUtiT2lnZWp6MGU3UHIvcDBR?=
 =?utf-8?B?akxJS0xZWVUwRFRERGN3MDYwd2dPOVptSkZ6b1o1WmVsbXZ0NTFzUC9ueWhN?=
 =?utf-8?B?ZGVIWVZBSTQxbjl0YnBrRFBBOHhGZUkvQStGaStWSEZpaGkzRHJsWE5pS21n?=
 =?utf-8?B?dVprMWZrNkEvSzhlV1dnR1dkYW1VYVU4T2d3dUY4QnpOay9ud2FRaHZEVzBy?=
 =?utf-8?B?aytjRXpEVTNLTHZpVGZBTUNIQXRSZXk4K3BBR2g4MDRKcjVUZWpwbGZ2L0tw?=
 =?utf-8?B?OGcwYXFVMUlmbWhrTXJST004OS9kb3ppNEV3bG1EbVZ0cVZsNitLZXFXUnRY?=
 =?utf-8?B?WktJR2lSRnYyZlNEMG5HcjVtNFhZVU92OThDM1d0eno1cS9rU2R2ZGFJUkhq?=
 =?utf-8?B?bnBobnJYQkNxTW9WRkM4UW9uN05jQit1NDZuUTA3VFlLMGxHZWtOQWdPa09X?=
 =?utf-8?B?UlF4aUJTQ25HOXJuNGcyNWY5cjFmcEtmZjYvbjNSa2h4a05kbWFublVFM2x5?=
 =?utf-8?B?ZS90QTUrUS9wQzExcHA4bjN6WExaQlExWWNXZHcwVkdlOXFyVkg5SG5sTWdr?=
 =?utf-8?B?M0R2SmJ1QW5Ra0s5TFBxdzhzN2pFRFRORE9TRHpUVjF6YzRLZThGa09CR0R0?=
 =?utf-8?B?WDh3SHdoZUFsdmhWYkduRDA5NlZmWkl0V1FHbXdsR2pFY0Z6S2xlRzBaakFK?=
 =?utf-8?B?c3Q4N1hTOHZncVJ0ZTBybmhRTWZlUmJjTTN5SjNZMUlFVHFicTFCRG1JVHMx?=
 =?utf-8?B?M0M2WXpTd1BDOVhTeXVWS2FZbjd1US9XSGlZbEtHUENZWmI5VXI0YkN1T0xN?=
 =?utf-8?B?QTV1TWdKQ0FYNUNTUXlRUDl6V1Y1UjRGNTdqTk5OSXpYbGF1Nmo4Vm11dHRT?=
 =?utf-8?B?UkQwUy9ReWxYT05JTmx5bHpZa09qSy9QOC9NY2FWeGZDbmE3YmJYMVJERElh?=
 =?utf-8?B?Qjh0NjN5T2ZXcHZXVGw4TTI1elNyMmJLa3FiemNzOGxINzB5YUZqMUNFbHBz?=
 =?utf-8?B?eE9oOE93V3RCMk40aHp6blVGblRvT1oxZ0ZXVXNPYzZSUlZEVmhPMTdOZnVS?=
 =?utf-8?B?czAraEpyMmt0S2dyNGJ6SUNncDJydVJIcWUwWkZhU2RsSG1uZ1pObWVVWDBK?=
 =?utf-8?B?QU5mWFpMV1luQVN6SjB3ZXZ0ai94WmRucmtWTllDcEQwT3BWQjJ4S3AwOWJy?=
 =?utf-8?B?MUsvdUZhV3FVNDUwT2FSaUxCWVJLRTZ2N1Nabk5mL3V1dnBidVVrakRURFlX?=
 =?utf-8?B?ODY0dEV1dFdRQUFESU9zR0dQV0M5aTBKZVZ6SzVCRk1VYmZWL0xRUjFTejVB?=
 =?utf-8?Q?k44Q5Me758msZEZY=3D?=
X-Exchange-RoutingPolicyChecked: HuEal/d+9lcLXrkvOtGzORVsm83Aw/HQxofsNzOI3WqqtudirnQ1S0oaAETZD+clNJyE54mDMO0hLyaqzijDvfieKSyf/avt+MpHRHjCgwgfcopQLzNW+ST9+0qn5w077S4aWRznQ86Wj0751mq9qQ9uei/0+3hLg44xOdZM+i3hX7OerDoAbZGTlalMVbzJyX0bpxQBcMduiW1d/s85aHR32UZQZAA92fxKvXNQTZonv4g6o6G/pSLm/+iesZfXrC0QSYUSsVRGAGmmTO+y/cdpwE+pp/JWc9bvbpuQqZUgbxMkHnmfgD+boXI0S1Gy2nESxaiDouZoKe2c3SNvEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ce28d077-f3eb-4764-2938-08df4587dea7
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:23:16.9265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: El0cd6rxp1B++8fu59SWIr5lDlBHqwcNd1MCT+iH6NeiMEKt4FHcAvkHUCuiqhlRzye6NkGUpo6fVDohi5eRWyUxn74Vksgy5BpPAljnhFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6469
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

On 2026-11-18 at 14:02:18 +0100, Sebastian Brzezinka wrote:
> _igt_reset_stolen() use via __drm_mm_interval_first(), but
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
> v1 -> v2:
> - Fix always false !__drm_mm_interval_first() check (Andi)
> - Extend stolen_lock over the poison/verify writes, not just
>   the lookup (Andi)
> - Move the lookup into stolen_page_unused() helper
> 
> v2 -> v3:
> - Cap num_pages to i915->dsm.usable_size to avoid poisoning
>   hardware reserved stolen pages (Shashiko)
> 
> v3 -> v4:
> - Only verify pages poisoned before the reset; pages in use (e.g.
>   rings) may be rewritten and freed during reset (CI)
You forgot about the changelog for this version :)

Not critical, so:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/selftest_reset.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> index 2cfc23c58e90..7d4b0382fe19 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> @@ -14,6 +14,16 @@
>  #include "selftests/igt_atomic.h"
>  #include "selftests/igt_spinner.h"
>  
> +static bool stolen_page_unused(struct intel_gt *gt, resource_size_t page)
> +{
> +	lockdep_assert_held(&gt->i915->mm.stolen_lock);
> +
> +	return __drm_mm_interval_first(&gt->i915->mm.stolen,
> +					page << PAGE_SHIFT,
> +					((page + 1) << PAGE_SHIFT) - 1) ==
> +	       &gt->i915->mm.stolen.head_node;
> +}
> +
>  static int
>  __igt_reset_stolen(struct intel_gt *gt,
>  		   intel_engine_mask_t mask,
> @@ -79,6 +89,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>  		i915_request_add(rq);
>  	}
>  
> +	mutex_lock(&gt->i915->mm.stolen_lock);
> +
>  	for (page = 0; page < num_pages; page++) {
>  		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
>  		void __iomem *s;
> @@ -95,9 +107,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>  				      ggtt->error_capture.start,
>  				      PAGE_SIZE);
>  
> -		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1))
> +		if (stolen_page_unused(gt, page))
>  			memset_io(s, STACK_MAGIC, PAGE_SIZE);
>  
>  		in = (void __force *)s;
> @@ -143,10 +153,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>  			in = tmp;
>  		x = crc32_le(0, in, PAGE_SIZE);
>  
> -		if (x != crc[page] &&
> -		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1)) {
> +		if (x != crc[page] && stolen_page_unused(gt, page)) {
>  			pr_debug("unused stolen page %pa modified by GPU reset\n",
>  				 &page);
>  			if (count++ == 0)
> @@ -159,6 +166,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>  	mb();
>  	ggtt->vm.clear_range(&ggtt->vm, ggtt->error_capture.start, PAGE_SIZE);
>  
> +	mutex_unlock(&gt->i915->mm.stolen_lock);
> +
>  	if (count > 0) {
>  		pr_info("%s reset clobbered %ld pages of stolen, last clobber at page %ld\n",
>  			msg, count, max);
> -- 
> 2.56.1
> 

-- 
Best Regards,
Krzysztof
