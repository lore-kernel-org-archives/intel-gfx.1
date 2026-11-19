Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89DF606A32C
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bbl1q+Sy;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=QNiYYesv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D441112281;
	Thu, 19 Nov 2026 10:45:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D1A112284
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 10:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795085136; x=1826621136;
 h=content-transfer-encoding:date:message-id:to:cc:subject:
 from:references:in-reply-to:mime-version;
 bh=yyDrivi6agbAJzxJs3pL3dHrQ8QZa3eBot4xu0CMDlI=;
 b=Bbl1q+SywiDxI7skUryZBOjatVvVYrxtgFwkYSz7KbhCalGpBTKh5S7Q
 KASa/KL2Gsy2M0rWvVdYMSTFjXSWukttVSXAEU1bQUKiJ6vYYefjFGtY/
 ShzzP/trJJ0ehqFC8IgmQye+KaU6IvPg5xgQ09GM69FObIZsNhKc6SvdU
 IjiE9HeqT55KHm5Gm2V2TpyIF89q5V/3P0RYIlnLo+gwQFadsEWVLwWlg
 iznhF36wyhl3A1RRVre2XyQ1nYog8iiNxh3hcX4LgOgXpUtPLv7VMn9Zj
 MN/0qI9UqT4CDZcHdq0LqPW42N/eqICVSGFX9UfFD2qHFJcI8Bh68uFbk g==;
X-CSE-ConnectionGUID: I2PurKwSQ6CDa3MYlWTCxg==
X-CSE-MsgGUID: PWIKv2hjTqyrvKQmbrcVbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3817613"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3817613"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 02:45:35 -0800
X-CSE-ConnectionGUID: kixZF19pSmmVPlqELKxU6w==
X-CSE-MsgGUID: ctGdzpjVQT6HSnNFg1Ix4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="12146384"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 02:45:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 02:45:35 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 02:45:35 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 02:45:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jd+ubmNLe80cp4t6IdY17x6mIp5tNJeEP0Xz+RHg+mrqB1UyehtW1b+HgQbvphQ3uGXdHf2ltKpnN8dUPlk0WiRrkJaXY5A6rbX7TJ7gMZ/daOM4N52A60YbsAfSsjfu6FYl1Qy+s2aEXl3BAfSrvCe3qFOC7dTTwH7r0HMIs7aCTQhf+aJQEslTLSfVe/4AgfimECh2zzVLp6+6Z3IoSsqzfhg/t2b/cr9ZakhfASN7WZr109vZwo1xtFroiywMnf+6KGq08hATyckp5IPytqmCkzbE62GduBCk6JDyxD1mKgUKd3ugim1QSKwopSpPKXs98ujmW5Lj7STkBF/fFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6l976OHD11XUr4v+twJxjPh8RUJswTqbhpOUzVoQrg=;
 b=zTyzk3E0EeFJnGwyatOV5RMBfSg/CTQqTmFzSgNl6fmZK9fuWosd1Ga23T0OdMwKCp8SvG+AoWfVC7dvD1+dhhYrRt6CPVUkdg6mtxYBBj/d9Q7b3kuRxJSk7TdgmoHFu0yu+yP6z/LLjTJM3UBDu49djwp1hlMPPskvLDN1+Fz2nHIafPKnK494GgXIWMlsZxgnrsUt7VAZ811GoifRyhmum/JkfN3Q8uJK1cILAFtGnoOY9IxaTP6PiVGDTuMqtgGZJq7ujAWr3ZXtEqlGZ4TX+HwPZMfYfsjjYcuk+pLAz2iE/eTewyoHrJcL/a39nq/n1q73aXhEkrPiCm9o1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6l976OHD11XUr4v+twJxjPh8RUJswTqbhpOUzVoQrg=;
 b=QNiYYesv2MQGeAUF9szOGJ4+s7HctTnMTUCWXNtChDCisOMzdXimGRfI8eD9NSzff85YufJezklmLwoUkHr3+b2QxfSnstYcQNjww3YeO8Ylq68opnY9RDXzKQlaLpXVK3lSQolqSPeyZ1s4Kri50NGXkLvgUhW4TzXOyK9LhXo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by CYYPR11MB8359.namprd11.prod.outlook.com (2603:10b6:930:ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 10:45:26 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 10:45:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 11:45:21 +0100
Message-Id: <DMZ4KGKCCK8A.2E0HP1AV6ZRQD@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <chris.p.wilson@intel.com>, <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v6 3/3] drm/i915/selftests: take error_mutex in stolen
 reset test
From: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.22.0
References: <cover.1795006734.git.sebastian.brzezinka@intel.com>
 <72a2b16b5a4cf8deffad74e8ae85a586a5d693a2.1795006734.git.sebastian.brzezinka@intel.com>
 <ocssumcrob46pblkatgoctmk5rb5gzaeeoe7ifinknfd65e3tq@ndmwuirrfepo>
In-Reply-To: <ocssumcrob46pblkatgoctmk5rb5gzaeeoe7ifinknfd65e3tq@ndmwuirrfepo>
X-ClientProxiedBy: VIZP296CA0004.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::11) To DS4PR11MB134916.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB134916:EE_|CYYPR11MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ec91d7d-0f7e-487e-3c61-08df462a38b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|261026140227099003|11063799006|4143699003|261028144727099003|261022075727099003|261022105027099003|261021121427099003|261022115727099003|261026121527099003|261021123027099003|261102123227099003|22082099003|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: oX7LdxU06eDFPhfl4EgKT5cgO404uEAvF+m5W2HlCHj/ptJQpJBe/xGkLPAcrwHekBkx/cM5y7w4lTO2m31/VETEgXvBEp7TtHqUoxZOc5ujZgsMqBf6JTdODdl438QMV+i+WPlnM8O/rHrW8eMNXd5Kqz/XP2Ljpb4Ys6dhyswgsj+90ax8GEOINNSpNFRKEqp1CVZkcrFPVNBamzsxHy/TxpjMogzkX2PYK7U/kM6FW1sKJHsSwG5rLcUBqB/aK6gsRIPwiEf0G1xiFrz/6Bx5/MIxl2+ezTfrK9a9CKHoaKe60j6X4bURDtGuPo+/Ec0Xu9HlY8gN7Zo85sPaggXQDV3U9Q2GysGznKp4UHmECt3g0JyqhjtqfxOTRZaL4VTdmZES0VuO3zNgqEhC/nwzy2bGVMMnHLnWseZrR2vJr7A1Z7qbNZrudGG1M/HKysbLPKNXPaEuSNbTcCC8W/RiUmVVyczTraIsLhR04N0Axcv8LusqIe62mQIuM7X11bW3RenDunX9BjRXgq7Hat+jMYz+IIqHMGqCv2v5Va/gwiuZbwuk4bpfImTSa1QFQ2uA/aJXvQ3rCtjOIOwcAMTBDfWwac5FDTtsRa07vbYbZiYo2jIukhnOWYY46so8R5PwkKPvlObIvTPoRT+5G+fDtemEPklKF0hY2pCqf68=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(261026140227099003)(11063799006)(4143699003)(261028144727099003)(261022075727099003)(261022105027099003)(261021121427099003)(261022115727099003)(261026121527099003)(261021123027099003)(261102123227099003)(22082099003)(261009223027099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE5aZEpuVHZKSyswYUZIdjRQcHVuMjlkVTAzVk4zU1VDNGJ0ZnpTYmkyVU1P?=
 =?utf-8?B?d0ZpdEs2STdlSVNnWDRvZzIyQ3dJS1VlL1J0d05XRTdydFVpUGoxOVRpQjB3?=
 =?utf-8?B?M25zTXdZcU1zS1FiaFJNZXZFakRXNi9vM1ZEZUUyMlZRdnVRS2FqcDhmZGV2?=
 =?utf-8?B?R0E2dGJTQUpTVTQyVTlEWDJpM3BsNDFNb1NmUkN4LzF4NGgwUXFQNGk4THNI?=
 =?utf-8?B?Tm9tM1FEZUM3K2tFSlp5bjZpTi94aXExbnFrUTVSNFZjRS9tdG1JMmcxaUhZ?=
 =?utf-8?B?QnQ1R3ducUFGWVVUbGxhbFhoU05GSnAvbytrenJDbTRER0VGN1Y2dDc2dkxH?=
 =?utf-8?B?V3g5QW1vSG0vS3d2Y1cxVDF0MU91L0NXeVZabENPUHcydnhqUzVGVmNsT1lw?=
 =?utf-8?B?RWNGeDIzcDBZR2RMT1BGaFZBSC9wN01aUmVHcmN4YStpM1FpcUpZa3R6U3ph?=
 =?utf-8?B?RUxnclNUNEVibnJLTlRHYjE2VHBaWHRSZ25oeFovRFRuNmhnbHVzU09pSWxm?=
 =?utf-8?B?OXUxME9YSzFGWVljb2h2UHltL2toY0Z1U1JhS2NWTThYaXdpLzNpRXRNNEpR?=
 =?utf-8?B?UnpWQzBkVWZtNzNCcTYvV09UTXNaaUExMlZHKzdtTlh5azAyN093THV4cWJq?=
 =?utf-8?B?NjkvTFkzbnpqK3BRRVRncHhqZ2hYNVdnZDBVU0dNYlV5VzRraVo3ajJ3R2x0?=
 =?utf-8?B?d0xRSUIrby9tK0VxR2NyUnc3bE1icmVCb2J4MGw0R3pJUlE2ako0bVBoZE40?=
 =?utf-8?B?MEowQ1ZDbkYzUVJoUkw0RE9CeCtabHVoaVp0U0ZaeTBDQVM3U0RXdVlSQlVE?=
 =?utf-8?B?ZytQUmljOUhNVTdoZ014aDFzSTZqU3VaVHFNYlVQR1EyUlI4cVljTkQrZXZL?=
 =?utf-8?B?Z0FZVHFFcHptRjhpYmZSSTIyTVFnb01PdzZmaU5YUUdoTGhrYXppWnpSU1Mx?=
 =?utf-8?B?ckE2RUJpUjFnbDdCKytyR1pWKzVzWmZGcEQ4NnFDVnpoNCt5NkFOajUzWkU1?=
 =?utf-8?B?ZjZmV1psZTg3QnJqWDc2RC8wRU41VGdKMFNrcnorc255TGVHQWc0eWlnbTMy?=
 =?utf-8?B?SElOaWVrNVYrWUZnajcxdGZkbGluWUhuejZtN2Z5a2swOHo2bFhQSmhJSW5h?=
 =?utf-8?B?RW1MNUdFK2xQelh5bDgzZkt6MFdCZ3Q0NktIUUxJUWZlbThRWWdrQ2FYTTk5?=
 =?utf-8?B?NlI2VTBsQVZ0RFc3eDVVY0dLNEM4Ty9IcEZpT3RmbHFBcUJCU0tFT0dwWTlp?=
 =?utf-8?B?dE1tYUs5UUNUSzJMVXI3dHpuMWw1Y3dFallWb3JCcnF6cGVYWk1ZYWVFK0dr?=
 =?utf-8?B?RHQ0MHZFSTdITHI2bTlwWFQyUE84MkNUdjVoVUNpUXhWOFJpSTVmYzc1NTVK?=
 =?utf-8?B?K01oZzdaZUl1Tys3cFFad0xwbEVoeXlPMEpVZ3B4RityTmRJME9LbExQM3RV?=
 =?utf-8?B?R05XczhYSHNHdXFURHhJM1dKOXphM3ljYnNGR0VaMVpPb2FxMEJGWVQ4Rlht?=
 =?utf-8?B?cXpEajQ4NUNDVndUbXd2VGhXbnNHMDR4ZVlXZEU4V1h2NmR0MEtlWWMyN2VY?=
 =?utf-8?B?TzdEQlBTTEgzdWZROUF1QUo4eldqN3A0WVlzekxOMHBBVUZtQWVoWFQxcHZi?=
 =?utf-8?B?N3MxT1c5ay8wc2R3ajg2eFIxYXZrRnhZYzMrdDdFcFFYdmJOWnp0aDB3SitY?=
 =?utf-8?B?bmh3WDllbW5RQXhhZXpLZ1BzSHc0bURGZzBKSGxkZlBheHRFOXUrNkw3cU9C?=
 =?utf-8?B?eWljVmZBTUUxRS9LUWJhNTgvT1BseUdRR1Z1NUpRWXZ4VG9RaXVyZURWcGVl?=
 =?utf-8?B?VXpjaUhKYXBDL1pwVWdaSUhXZmNDWUxmMi9lMkp6V2pQRExZNmhMcWE4KzBL?=
 =?utf-8?B?UnNwc29iTnZabzcwdUlEaU5tdm1zK0FoaEJqczdoWDd5ZlMzTWs5SFlRUE4z?=
 =?utf-8?B?YktRRHlXRU85WURxdy9hOU1JcFBVbTRxUlNScStxY2N2SXpLN000RXYrbGsx?=
 =?utf-8?B?cnlaY1ZZRXlNMUdiZHlBaGhaalZGWTZqTTRNYjJGODV0MzRjRjJCZzBmbXhk?=
 =?utf-8?B?MExQbHB6OHlHTFZHTWI3Q29GN25Td0F0WVYzdG5KcDd2Y09sYmtPQkRFeTJF?=
 =?utf-8?B?VHRQVFozaFQvN0d4VVJReDRaRC8yclYyWGxoOUdvdGozbnlMTEUyUXNHbHBG?=
 =?utf-8?B?TS9XWlJEbnBLd2pDd2tveEVHWHI4Rml1dHo5ZnV5bzdnN21oYlROczhRSzVG?=
 =?utf-8?B?a213bDZZTTJyZnJIbHRZcDhPUGpGb2xHc0pFUS9lZUhzZGZiT2JPZk5kOUZD?=
 =?utf-8?B?cnVGeHZQMmppTmNOa2lFUlNDWUorMW8vN0ZJM3VORHFyZFVza2MwcGVIODkw?=
 =?utf-8?Q?HNZShgX20iQVDf9o=3D?=
X-Exchange-RoutingPolicyChecked: HH1DLKwu5VvUNpcJfQ1n0QpXtqcaZSfNokT+r5Ead7xFHOettBgNeSA1VSSTip8B9qOAAm/B5AQ0qhZykyTXBBxro5uL9jupxHZa4qoqWcr9vpP/fA4pvEfWkThlnY2s1ZhO8ZouNXdejbv7Jft7z//DfP+4T8/HCVViV7k2VwOFxuChXYoWQA1xqULYe2NC8FDofMh/l5Rv/1+3CyFPRKuGGBuI/zNrrr6tLMxk3q3GoTWlgUTWXbm0NpRf/cZLs0aFlYv/SFEeS5KnYMVgXrpbj0wER8LsSuKrmcZAZ5P1UTUQx4sVI1t3NS/PUMgonRYvWb3iGHFRNRGPvJEGfA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec91d7d-0f7e-487e-3c61-08df462a38b5
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB134916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 10:45:26.4622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8GCFUeKf9QArCakfejWQCG3CdaFMwcqMqphX6/VPAodc+ZYltU8CrJsZk04lREeZbs3jWPw/O5VquPOQyoEdcupKyj2XjlLq6Xtrmn1RwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8359
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

On Wed Nov 18, 2026 at 4:34 PM CET, Krzysztof Karas wrote:
> Hi Sebastian,
>
> On 2026-11-18 at 14:02:20 +0100, Sebastian Brzezinka wrote:
>> The stolen reset test reads and writes stolen pages through the ggtt
>> error_capture slot, but it does not take ggtt->error_mutex. The DEBUG_GE=
M
>> poisoning of stolen pages, which runs from the object free worker, and
>> the GPU error capture use the same slot, and both take that mutex.
>>=20
>> So the free worker can change the slot while the test is using it, and
>> part of its poison ends up in the page under test. The page then looks
>> partly like STACK_MAGIC and partly like POISON_INUSE/POISON_FREE, and th=
e
>> test wrongly reports that the GPU reset modified stolen memory.
>>=20
>> Take ggtt->error_mutex, nested inside stolen_lock, around each sampling
>> loop. Don't hold it across the reset, as the GuC CT worker can take it
>> from the error capture path while the reset flushes that worker. Use
>> raw_insert_page when available, as i915_vma_coredump_create() does.
>>=20
>> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/selftest_reset.c | 26 +++++++++++++++---------
>>  1 file changed, 16 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/=
i915/gt/selftest_reset.c
>> index 09a08a91e610..bd5876da6449 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
>> @@ -36,6 +36,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>>  	intel_wakeref_t wakeref;
>>  	enum intel_engine_id id;
>>  	struct igt_spinner spin;
>> +	void (*insert_page)(struct i915_address_space *vm, dma_addr_t addr,
>> +			    u64 offset, unsigned int pat_index, u32 flags);
>>  	long max, count;
>>  	void *tmp;
>>  	u32 *crc;
>> @@ -90,18 +92,19 @@ __igt_reset_stolen(struct intel_gt *gt,
>>  		i915_request_add(rq);
>>  	}
>> =20
>> +	insert_page =3D ggtt->vm.raw_insert_page ?: ggtt->vm.insert_page;
> The explanation in commit message focuses on the locking itself,
> so changes to insert_page calling seem unrelated. Could you
> split it into another patch or, if it is required for this part
> to remain here, document it above?
raw_insert_page is needed because the test now calls insert_page
with error_mutex held. On Cherryview and on Broxton when VT-d is on,
insert_page uses stop_machine(), which can cause a lockdep warning.

Should I send v7 with this added to the commit message, or can it be
included during the merge?

--=20
Best regards,
Sebastian

