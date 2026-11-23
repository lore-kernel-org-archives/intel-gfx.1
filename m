Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D245606A31A
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2026 11:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HCedejQ6;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=PnP1T+yK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED2310E06B;
	Mon, 23 Nov 2026 11:43:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E8610E06B
 for <intel-gfx@lists.freedesktop.org>; Mon, 23 Nov 2026 11:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795434192; x=1826970192;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0+JP0ewercQgKtL7v8P2vLxBJV+R75w8BjA40qpXsYk=;
 b=HCedejQ6N3tu62viaByxbmQY/qRRETejAwBOffDzHsXI2Znpos8Npwm1
 vXaG97jtqgWhfKfasj93dGjPExzbvSSa7gnmNVv0apM+I2MfbOz8bgARu
 Otd1O7XGSsNLEn7pIm66JV6xMWFIkMIokP0ckVhECf6oscJl3G9KLrxf1
 eVfkmrakfPZBT1rlIRJKtw2H9FvcsOAN4ax2SfdV/YiVXG1M6VwFrXKpN
 HP4M9tc8lDxrWdHm8eAlxKxs2IngDtCxMvHxtJRGw0k0arUjw5ErGYCiM
 G41LzeG6DNFNhzKMcLzJ//6V/xBngNG+ejH2IN5fZwHXBJGv+hF9aOdMm g==;
X-CSE-ConnectionGUID: ZQpVmefnSW+rrXpqYSGjYQ==
X-CSE-MsgGUID: EHHn7QEZTeyP5uWu3okoEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4147469"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4147469"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:43:11 -0800
X-CSE-ConnectionGUID: 4KxByJHATS2op8QpO6gTwA==
X-CSE-MsgGUID: MD3DdJsxSCex4WaPs5tVjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11365867"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:43:11 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 03:43:10 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 03:43:10 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 03:43:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNQ5NajOVzGujAW3Ps30PlT/n/kG1w1qeKgC+1fi+uqxhEBrYXPEYVA/C3GuTZKnwMmYbZMKKlIdilnHpLp3RVSg2q4TwEoV4lSPEeV/1002Drzxm2mXB3BthRDzAKLGC91GVF0CKQ8wGwuqNd8dhgLTp0+uyzCrIPjb6AW8lH1Lr5CK52G+OlV46+k1EQEMKoqxuojDmJpYQI+IyssCXX5ndARCNqrgTnJA9MFV/wMNY8XiaphqmHPIjGJJB/1+n5DVEVdt7Msn6LyzZMaI0qCE25FsGyVPK9B06gb2IHD4jnLGerTYbFq52r9I9wLTRluqwmpoXUltJP0sD9/fBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eZwpdzekaeooDv74MBzIwD0sn0Y5G0EoXT9bOv89dE=;
 b=Uf6IDAhnP1U9P2CbxwzR99rpZuyhpBpr7QTveZpqP28iwoAOdjRU9g6WMUGRW3FkjR+N3tcBphADVi0GgNO4tyrzS9Bt1a/g6YEeJSBrUg21o57sL6+8CImyIpdxNSUAuI9hEEwgzL0XYOp+nlRHr0ZxLoYpN0F++diVe8KIAlFZ2c3p1ww/8LmRTB+9Ini2TCf2jDBa/pA17gnhTMVvlB2X1Aps5uIs0UJvXPmA21D6DX9ZH0J8XHpQM2kBwTkHkO7dlVg3hK/NnFXZgakC1XwBga4qOtW9XVHGC9tPF0MHB0CQpzb2PKRUMDb8F4dyrBjjUDs8uGXLfb2EYF9ddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eZwpdzekaeooDv74MBzIwD0sn0Y5G0EoXT9bOv89dE=;
 b=PnP1T+yKptczVdzV1X5N+/RhsuieencFAN4AU+rLK99tJSgEzJwEXONvosdppFyHANnYCodEa6DNF785ZPMQOuD1NxRvTnhtAiWeqih8LnOtnvnnAqqMZ1OhEb8MV3P9sTsmwzMGif7hVLCTQ39/0dMddUz/nKaPsXecLVPCC+c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by IA0PR11MB7909.namprd11.prod.outlook.com
 (2603:10b6:208:407::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 11:43:08 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0639.010; Mon, 23 Nov 2026
 11:43:08 +0000
Date: Mon, 23 Nov 2026 11:42:56 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, Andi Shyti
 <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH 1/2] drm/i915: Annotate flexible array members that
 require minimal changes
Message-ID: <zsgiughdvayvoygtou7twtauqemirkjr3cogs2r2kbkijnyvh4@wlaeapz5cql6>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20261119143510.2971237-1-krzysztof.karas@intel.com>
 <20261119143510.2971237-2-krzysztof.karas@intel.com>
 <av8LS_GQwNClLaJ0@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <av8LS_GQwNClLaJ0@intel.com>
X-ClientProxiedBy: TLZP290CA0002.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::8)
 To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|IA0PR11MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: a299f752-d3a1-468c-309a-08df4956f1e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|261026135527099003|261026121527099003|261026130827099003|261026140227099003|261022115727099003|261022113327099003|261022075727099003|261022105027099003|261028144727099003|261021130227099003|261021123027099003|261021121427099003|261021135927099003|261021133027099003|261102123227099003|11063799006|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: TNcj4x+lce8RMoi/C6DzKbQSDKvglofqxDLY4CJzm+u3E6SYb7zg1SzdEkouz3Pvkt33b7fu3enNlVLeASj+Tl63ldk/bz6m2Ep/xxt6XKVsl+IDb9QpqnlwV6i91THVwccEyzDCOVigZHcW0YkkHKfV6fazGBYQjqvUd1+NhWqkT5W0r68d88Riuybxsi93vPBEb1kuNs+R1kKRzV1RAGk9mL6aoLurYjnc800pjsebOeGJzSgfOoUYNn5QYRJEmiz/vz4nr3t3N8Vk9RoudT18Kg1NAyIpgX1c4jH7GtSxvYSn15O5rPUbLi8wUA+bSuZORbGtFke+fcJpcX6VRYvjyDk8etNtqmTRNJ9dfVL7jLC6Bfs0xg0HpIOFosdcsrGqoPOXf6AeHsaYdG6lOJuh9og+5O8JT/baCRbwDJPsJ79+btdJ9a64aHjrgv3TEZnmRk9EAwSRXwLDorL63+nF5Chni+HHHiu+sx1QEOqxTv1aBZS+a8TaAdPb0P3kyoQVAGy1ylNkBwM+wnrldDBHSTuxCrH1ToOc+NJRNh+yT3WWQbs/39SHMf/q9sR0ty04iBmlpRdV02KN0ZuZUDphwf5P0pzahdPSXuQvvF/1wf5s9qSSVGB7Chp1PRJWV3SQ9LxEGYIZ6p2nSe/tpEfLRfFQwerJIJHL3IA7gVw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026135527099003)(261026121527099003)(261026130827099003)(261026140227099003)(261022115727099003)(261022113327099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021130227099003)(261021123027099003)(261021121427099003)(261021135927099003)(261021133027099003)(261102123227099003)(11063799006)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0RQeExncU9Ia1FETGNKMjNPSERJbWpZZTBFMFM3TGw3RUJBZTVNNGU1QS85?=
 =?utf-8?B?N3JOMFVMOWRVY2o0WFM4aGZielpScm1mNzZuV2NPRFIzNkZQalNGQkp6OE9h?=
 =?utf-8?B?SHZORWJueTR0YWV0KzU4V2JEMjA5SEdVSEN3UUVxd3Mzc09PRUxDTEZWWmU4?=
 =?utf-8?B?RUdqVzU5TGIzTmE4emxNOWRlcEd6SWZPT1d6U2I4OTBURDh0R2VpeWN4ajYw?=
 =?utf-8?B?QmFlWFdtZ0Q3aEZrbjFWM0VsVk5veGJielRMQWFPUHYvaWhCV0xKRDdBTXdM?=
 =?utf-8?B?NzZwMFJ1YlpPSjM4V2ZuN0JzL2ExUUh1bE50cDF1ZEFZZUlkL3UvYkxpNG5Q?=
 =?utf-8?B?MHZUWUNJL1hWRVduVnZrdk9GUUxhMndMeUR2QkRKeWxVcDFnWWNqeE9MNDBF?=
 =?utf-8?B?RkVvKzRwQUx3NlQyWEtsOUdna3ViZm4wSGk0aFVTMEk0ZUx4S0ZhcDR4TXdF?=
 =?utf-8?B?K3dpeWVlb2UwamlsN0cwUGVZd2dETU1CNEdjMU56V2RzQ1ZGSnpocm52Uy90?=
 =?utf-8?B?Nmtlb256d0QwMW9jUmpMRm5HZWxEeFVWRFMzeWV4dDRGZXRDUlNtcWFJWmp3?=
 =?utf-8?B?TXVFZTllc0E5RkZYUkl4cGc2dnhhTTF1M3BJME5SYXAvVjZaM0Q3UHBNRzIx?=
 =?utf-8?B?OEc1N1JkUjBoTHNhL3dDWHY1cEJ3ZE9kZWhtUTNWZDEvZ3kvbnd1NHhMVmV6?=
 =?utf-8?B?bWtDbHE2cjFQY1JpcUlncWdRc09sQlQ1ODAwbWZuYkR6RFAxeFRoYy9nVGZ5?=
 =?utf-8?B?cE5MSzZFOE9IVnZRZWJtanl2eXlsUkt0dU5FN1FRczJkME9YNmVpOVBWU3Nj?=
 =?utf-8?B?QzBzNzkvNmZ5blNSdmpFZmplcEp4cGQwOTlkQ2dIb0ZaZDRodnZadEhQWnhI?=
 =?utf-8?B?ZDBEZWFCL2RmSFhRL29aWkhRM2RJZ0FPeDFwS3NuLzRSRlB6UXRhTXVvNlRk?=
 =?utf-8?B?UCsvajN2YzQydXdnUkZIZml6dFBDVWtBRStkYkxKVGlxQVpmRkIrdERRZ2JZ?=
 =?utf-8?B?eGN3dEFZR1hhaWRmTXlnYTRGR056ZnlTaUFqaExkTHgvUThmcWI4R2xVZjVC?=
 =?utf-8?B?NnBhTEZmWUJ5ZlN6SmtGcW9lWGVHSVpnMW51QjBiZ2tQQUJjbkRTcEhTd2JX?=
 =?utf-8?B?TjhhREpwTTlRWExTOS81bU1LazltaWgzTi9jRnZBQkhYMjJLcmhzRU1IbDRS?=
 =?utf-8?B?MTBnOEptcVI0eDVuSnpHZk5IeDFkbWdHTFZ3cU1Ib0hJQytteGVKRlYrZnZW?=
 =?utf-8?B?U0ZjUEpkZDlpMzZWOGRDMUJsRmFpUGNFSThaako1ZW8xbk9mM2hyTkQ0bHE5?=
 =?utf-8?B?OXU5bEM2M0Z4S0Z3bkVGcWNKbXZLUlZ4bHg1V1c1MktyY29YNldzbUlieGsy?=
 =?utf-8?B?WmRYQ1UyYlZUbFkydW5BZklra1MyZzR2aVpHKzZ1SW5SRUgvTTFrMUFqaDFI?=
 =?utf-8?B?REpUaFRPYWtzZXEwdCtjVlcwOHMwR0h1MytaOUJHRFIzVEVQMlM3V3BZZFh2?=
 =?utf-8?B?TVltMHAwU04wcUc2VnR0RUlPUVMwZ0VYelpucE5lYTYrUHBKWGU4YmZUODNB?=
 =?utf-8?B?U0UrRGM0b1dOQ1RtZFpQTWpmVS9uV0g3NG1RTEY0YnFYWVFqS2hzbHZ5elJZ?=
 =?utf-8?B?b0NTS215clVrMm0vQThkQ2RuM0ZSTHdjcThsQXRvQ1dkSWxDSWJpQVhJVEtu?=
 =?utf-8?B?K3VGZ1NXWnpoekllSmJWV00xZHdvOURseTJCbnFGd0ZEbytOa25xd0VsY3Fu?=
 =?utf-8?B?UDVvSURqcEJUR3Ezd3UyNk9lS0V4Tm04WFlYR2J5bjNHZnFVU1crMDNwMWhF?=
 =?utf-8?B?bjZKSnMvNzMxVUpPOXdERnFqTEgzVDdZZWllamI2K2hiVXFTZ0V5VFVzVEE0?=
 =?utf-8?B?a29LWmRhUVBmZGwyL1piWldIVWxFQWQzK3NocktQaXFZdXdieTA4UFQ0T3Rx?=
 =?utf-8?B?OGdkOU5FRXBqMHlnUUQ5emlZb0RIUURVVzI3OEovSXJSVEpHTVVBeGlhN24v?=
 =?utf-8?B?a1VOTnZkQ05zek1KU3QydmF1eXZhSHgzZzVyZE9CalZCVlo4ZmVnWnRZOWI0?=
 =?utf-8?B?NVpMd0JoWTlHclRLek1SdEU1UFdoVFRKL2VMODRIVzJpMk1pVHRoeVNvTmF1?=
 =?utf-8?B?RFZYeGc0Q2VkekFLcGNrd0pDM3FEZFlndXJXc1pMbU8xUFBjd0xmRmNORWJr?=
 =?utf-8?B?S2ZJZ29YM3YxbEd1bG5ZUnBlRVc1cXBHQXNRR08vampYZStuN2YyNGVqSU1B?=
 =?utf-8?B?dzVLR3FLVGhlRFhmcGtVeVNuSzdWbldNQnh4eTQvd3FKU01uZ0JpNzUxSDI4?=
 =?utf-8?B?LzJ0eS85YWszblJKQURWWjVlc2RYcUVsY0xwK2JDakFqaTF6bmJyeEdUcDBS?=
 =?utf-8?Q?O4GIl3wAxxfWF3bY=3D?=
X-Exchange-RoutingPolicyChecked: E8UMNVsRJ5L7hRpF6dYSmKbI206cX3vWvw+wo9PdhsGEFZiYEFPg0cTn/DE4SdfA7fH67zOszWx507tdhpjyD3JZe6QnnpUTl29yq+qMNA2ZXKWVYsIcgLy46FrbNcpWIDiKnhdZiflvDeiSRjmhWQRBKIuKM1YY6cOwcr2DvXAClMeGmzEWysNqIcya+SIZs0zSFeWMRLrD1GblMW4EBzPmhI2StGI/ltnXFQSUgqUlwyalqUSgLzhv9gamBhrzqbpgA2A358UcJJs10o/WNZqcKu/cy4CsRA9EAjmVSzIg2TDC9rkT3vt5OAYdycoOYQxO5TgojNeKWIttQgaW4g==
X-MS-Exchange-CrossTenant-Network-Message-Id: a299f752-d3a1-468c-309a-08df4956f1e4
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 11:43:08.4846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtrNenrLkfW7+NpmpJSQBzNspM7o6iJH3VgCYzUSSMOmUtBEgt/jCqhX9oveDPBJ002KN6UEw8MLu67WiXr+WLxqTQ5pGynO0sYq9QMJ/Uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7909
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

[...]

> > @@ -468,6 +469,7 @@ init_bdb_block(struct intel_display *display,
> >  	void *temp_block = NULL;
> >  	const void *block;
> >  	size_t block_size;
> > +	size_t data_size;
> >  
> >  	block = find_raw_section(bdb, section_id);
> >  
> > @@ -492,12 +494,14 @@ init_bdb_block(struct intel_display *display,
> >  	if (section_id == BDB_MIPI_SEQUENCE && *(const u8 *)block >= 3)
> >  		block_size += 5;
> >  
> > -	entry = kzalloc_flex(*entry, data, max(min_size, block_size) + 3);
> > +	data_size = max(min_size, block_size) + 3;
> > +	entry = kzalloc_flex(*entry, data, data_size);
> >  	if (!entry) {
> >  		kfree(temp_block);
> >  		return;
> >  	}
> >  
> > +	entry->data_size = data_size;
> 
> Are we actually going to do something with this, or what's point?
Looking at this again, the only place seemingly benefiting from
this change is memcpy() below, which is already limited by
block_size. So we already have a limit...
I'll drop this patch from the series.

> 
> >  	entry->section_id = section_id;
> >  	memcpy(entry->data, block - 3, block_size + 3);
> >  

[...]

-- 
Best Regards,
Krzysztof
