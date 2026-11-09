Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2CC606A325
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2026 20:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dXeSFl78
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AC410E214;
	Mon,  9 Nov 2026 20:09:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933CF10E214
 for <intel-gfx@lists.freedesktop.org>; Mon,  9 Nov 2026 20:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794254982; x=1825790982;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8Hc78VDFyAGC64echs974hnV6fYx3S17zj9em2Lmsc8=;
 b=dXeSFl78JozAOJ6TzFhoY1RCSICQe9RMYo2HIgcLwgFzddmxA+ev0sLI
 Cg/JuHEzzUZdhH+abRyHYRUBZQA9zPipUPDhpwlPSzLxgK7T8pQY2Ak63
 4Q6IwK1lZzzwfmVhScZMVNshFfradvsZnS+rsMMbp1Ex89PqKuYyPckbV
 emvjMKXeUhCu5xamK/C33YTKJK3QqImyFwvGN9m0YJrh3/72J1YnKAsaj
 k+1B7FhpBbhE3lcf+92+fG/LH28vwbCp3urTfDrOTfB9Gk5Foo1BqQz/w
 wEVjD8Tjr28q2+XsDqvn7ZF7RU2G+XLbigqvD6GSwqftGR+KfKF7Kp8NU Q==;
X-CSE-ConnectionGUID: Ye0wfg60QXWFkMyZmQmTzw==
X-CSE-MsgGUID: hPkM9mP5Tj21uC9enJRiWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3024618"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3024618"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 12:09:41 -0800
X-CSE-ConnectionGUID: eT4jiAJLTgiHjYKaoOXVCA==
X-CSE-MsgGUID: zghKJgyvQ0ih6PgIBFNp2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7778379"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 12:09:40 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 12:09:40 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 12:09:40 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 12:09:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k++9UdiEZoWTL5TbHNqBF4CMXkO1icqu6Lkj9FuWECzxm2sthkIgE0Ur8KaRLyRBVlUUHST/dvHJ2Y17P40ZU2hLfgYcgRSzzZzk4gILyOyOg+z1O0dedmg4tufJhJPIDiUC9KsYGjTYmHOKPPMNMmPlmgsY88Nkp19wfsP5gK0MWntAGs8T16GpcsYnBUSRe+hKQKILSke7ZJR+7Lj3wriqVLjWghIO+xm+/JVzFymoxmpO6V/fcvA7Bf3lEA6u6FTr1lfvv+lI9byHlqPZxRejBaqPV5WqoZf9TpTfay2DEWtA+413ETUl/KOGDMKenItsmOUkioFlCzSp7OE0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NS5PBPWK6vgDqpb5CYT5RphkX9IfzXj9i/hS8yx9i2E=;
 b=Wc8bV5VH9tKhh5l3KlP1ZAvpQUf6HV9WPVYdRxeoflHiYQrrJeHiCGZZvM+pnKwtqcXTVayeEYawlMpigQuD6GSNj4pFiFzYf7yYZaKVMuC3PCuUDQz/SbtqZKFrAZchiihpXlY3UjImmBK3jZKY3Mu+9ANgeNFs3dd3HEFoyKLijeI4eF5iXMc+JK++TviJ0iCCCEHaOgZX3d5lI3usF8itkbjVfz6EXBzzyiE/aff91ez6H/WriqU6fuEdrUcYu9K12BlRwjqYWmefo+NhKnEpWSztGioGKt3OBS+EGe/d3XNVmx15hMmdmPkRRD4ACn8mGhNvNbv18cuMu0n4rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7010.namprd11.prod.outlook.com (2603:10b6:930:56::19)
 by MW6PR11MB8309.namprd11.prod.outlook.com (2603:10b6:303:24c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 20:09:32 +0000
Received: from CY8PR11MB7010.namprd11.prod.outlook.com
 ([fe80::e26:c52f:6245:a646]) by CY8PR11MB7010.namprd11.prod.outlook.com
 ([fe80::e26:c52f:6245:a646%6]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 20:09:31 +0000
Message-ID: <473e9184-e5c7-4d5b-8c6a-f9f124b1747d@intel.com>
Date: Mon, 9 Nov 2026 12:09:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/guc: Reject unsolicited deregister-done G2H
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <alan.previn.teres.alexis@intel.com>, <julia.filipchuk@intel.com>
References: <20260908232323.1220407-4-umesh.nerlige.ramappa@intel.com>
 <20260908232323.1220407-6-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Narvaez, Jesus" <jesus.narvaez@intel.com>
Organization: Intel
In-Reply-To: <20260908232323.1220407-6-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0304.namprd03.prod.outlook.com
 (2603:10b6:303:dd::9) To CY8PR11MB7010.namprd11.prod.outlook.com
 (2603:10b6:930:56::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7010:EE_|MW6PR11MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: b16b5f5f-0c0a-45a9-2431-08df3e9d5df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|11063799006|4143699003|56012099006|261021121427099003|261028144727099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 5Cf/xeCv4zEMYUdMEc6b2ktwHFTi/GYiJa2ZgpyEFeQCrBQqJb5RSgNh2e/r7ibhDwI7UBcOGjVNciElUleIhi6vfyJeoWEzLKrSO3b2YcOaqo/tMp1VgQvTK24Was9Z+nRADqUrzhMw7vEgdwfxo2MxYVqy0wCjMEnuExoo2Zm7k17+Vz+cqWVGhetgbzvLpqjbSqtNx95+crHHQp3HDGoHjA/5FWWMa1LsdrUz1hyEV+HbVBo+ZPDqmlojYasokndVsIICu2umGbXDlvg1NC3DPf59N+5kFom+tJ/ZmhIyqfzfPhQ419P517/u/LS5vrCamovp2tbbDBveL/vOh4rIsF0NMYBTH4FVELBnwyMb/FJk34sbg8ikgKV4dvUth0HwMD2RCVd37rVZAkrhTJ1lM5L/tJAN/112Je9g/CoyG73k8YFfRuQc24lKzHYd5uEPZT/jX+xiIj0wPXw6amM2+GPOqzEqHiMscmAhAWdtfLt3vFg82Am79t4vYQhVTrQLQAKT9XHgRpxPc84L/9cYtXnpyfEi+e8FrSMvRZpG2VYNeP9ZWWiXoiBF5UR8mJSD5Z1UtzMw+TfBAoC01kulKorpklblKJG5OgRqNAy9yU1nklJKcHEQ3ciWwOJhrzXohQnWT2DQu/0fE5hZpv+RRmMpND5iczzVRpWVIFw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7010.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(261021121427099003)(261028144727099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261102123227099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFYxS0xFelR4LzR1ZklXSTVxd0JDaTVyZGZza1UwZlI5SXlZbXMvRXBlQkQ5?=
 =?utf-8?B?d2FzS2pWRmEyNU5sdmpyNlZvd3luWmxubXNWOE5yQXdNZ1pQWDhsTTYxdC9l?=
 =?utf-8?B?cjhKdlp2TlpxUFVqRkZuTnJGTXlBcllpaHdlNldwZGduTUJLTWZQN2dLaDJo?=
 =?utf-8?B?cHg0azBYUG9JSktsNTlrTW9XVkhuOTVEWVJyZk9RTDFKVHhHZVBMdTRCbFha?=
 =?utf-8?B?M2FrV0VzZnFlazdZaWptSHp0NElFcmwwT21ORnpZSkRHbVV2UHg1MEV5YU85?=
 =?utf-8?B?di9hMzJzcWJKOFNPMVJHNjdZYjgwQjNSUnZsSWJQNEk3eHY0ZXNuY0FqTnJ0?=
 =?utf-8?B?dnJhci9nbmlYSUVtRkZ4azJ5MjVkUUJZRzllQnk2UzNzb0ZDYUI2a1pOWnJ1?=
 =?utf-8?B?Y2ZzV1RXM0tMTVlCeVQydXBoVUQvRmVKMGtLSllUZzZRWXNYajRGKzJrZHcv?=
 =?utf-8?B?a1daUXJJanFrL2pUSHVPTFVyTS9sbWNFZkc3S1JEWW1EdUZSREJGdkFLMmVu?=
 =?utf-8?B?aDJVVHNaVEJBSzVqKzM5TkQvbyttTndPR3R4VWFSVkRabkNSakc4TGFqTUdE?=
 =?utf-8?B?TnVkTE05UXJ5TGczSnhEcktjVlQ3OStwZEZVOWcvZ1ROT1NYLzNJNTZRWXlO?=
 =?utf-8?B?L1ZvaURRNWl2RVlxMW5jek1qbDZkQlpSTGszZzFvbDZuSmZTRVdsSTZOM3h3?=
 =?utf-8?B?akN4emVhc1NmQXVXN25mNk1mSG1wR0ZQUnFTVFJoeGREMEVoM1JVYzhzZVRP?=
 =?utf-8?B?czcwei9TSG5yZU9aTTBSaUlIbENscTAySEUvc2VVNWNhZmNNMWo2MmhNWVIw?=
 =?utf-8?B?NitobnpieFhOaTF1VHBNNFNUb3Iya2UwME9RcEU2NTFwT1dweGhwWEs4Rk92?=
 =?utf-8?B?MGRFV3pCTkFZYmZDdWpYajRKVW50THNhMjVjVDZ5M0tOYitTYkZrVEJwVVFO?=
 =?utf-8?B?RkNpQzRNSXN4dzcyVDdNYk02OGlKYTNoRkxrY0Exd1BDTm9kWkpMdjV0Smpq?=
 =?utf-8?B?ZzMwWVE1MEdTTi91blBaZTg1Y3pieG1sUUcvc1JDSmhtNndxOGg4WXNxRFlL?=
 =?utf-8?B?VUcvT3cyUEl4UWFtU2dURmJGSWJiSWJzcXNsL1Q2ckE3NDl4a3VXSEU5dG1P?=
 =?utf-8?B?ZnFKeEVTeVQzYWw3a0RkTllGTmFSaFNZcXRZNHVmZ3l3TWpwb25LRlI0VHFX?=
 =?utf-8?B?S05ldG9XYWd4MHNTWjcycG9zMnZ0VXFOcjhVNllxM2ljN3hjSUdsUWg3SWpE?=
 =?utf-8?B?WEJodzViSHkwTk0zSTFLblIvM3kvWkFRRVlaTkpWbUdiaWRFdlVnYkJ6aGNm?=
 =?utf-8?B?b1JiU09VRWN0Z2F1QWppenZyZVRZK21zd2JJTWEwTTNJczJZaUwrZlJhM1dZ?=
 =?utf-8?B?UmxaM2NBbjloaUxDZEZJYnE5ZGhBekVEU2ZhVmd5OFhNMzhrK1ZmM2x0M2Jz?=
 =?utf-8?B?QlFNWU5OdjYvRVdqUFUrc2p1SGQ5OGlNYnB0eDJZTXovaVQ1RDU2MmJwenRm?=
 =?utf-8?B?ekV1bkQvUUpjN0NxTXNWVFF5Y3R1SzEyMVhoaldrUEorMno2b2VTZ0xzcDAz?=
 =?utf-8?B?TG9DaHdRT0xoZlZyRVJmSjNadFB1M2h1bXM5S3RqV0p0ZVF0RHU3dUtSeW82?=
 =?utf-8?B?ZlJUQ0pDalV6QXpwQ0hhR1pLZEhmbkN2TEZVWFVVSHRGTDFHYVJvZHg1NGlY?=
 =?utf-8?B?WVpIaE5LRFlVajBBM0lRUW1YYjVBZlNsYUtyUmRMZ2YxSmpHRmM3TmxOSHVa?=
 =?utf-8?B?NkJPaC9XSkVTeUoxNjlBaE5oZkcwOWloR2FGKzRBdVFTNDlyemFjRjhHR0tT?=
 =?utf-8?B?YVZwaDN5bG1XcXlwOW5RV3p6N01JNEVBTlhhbjZabDFDamFKN1cwaWlhWEVW?=
 =?utf-8?B?djZIb1RVUHdLUDlvdC9OelFRN3VzeXo5L1I2SU1GMG8vL0ZNNkViZ2FLbjFK?=
 =?utf-8?B?RzBIRlpkTDVvZUVOR0tzNW5BK2pIR3NYZmp5Y0piOEVqMXdoNWVkL1hJbUMv?=
 =?utf-8?B?YXp3MkRMdy91SzU1UGFKS29iMnp0RzlrRGc2dnlEdnA0TS9GdkxLdElYM0V6?=
 =?utf-8?B?Mm1iWkh2SW5nZXQ3SnIvVVpRK25lR1NSQitFcW1XUWMvTDRZYkxQekRFcnR3?=
 =?utf-8?B?R0QxdVBEcTJnNGVhWXRxUmNVNnBWaGcvN2dDRU9qamU4ZUp5ZGljZHZ2Zmc0?=
 =?utf-8?B?cThjTVg5ZmVPZ0RMUFFGYlZkU3FQZDRSaWZxYlZncjAzV2IvTWpQbEVIWStP?=
 =?utf-8?B?aThQSUZORVdVVElOaFFzUUpsL0NsOU5Ld01Bd0xtVitDWmtaa09IZG1sZ0J0?=
 =?utf-8?B?eHNSd2ZRbUtmUHU3N0ordzdvc09HK3UxdlUxczhXaEVzcjNiMHF1QT09?=
X-Exchange-RoutingPolicyChecked: T3GzrNu5cUNezF6JhmjA8mGF1QiAyVtocXfECnj5S2MwEdRAfj82q5fRoPdBnLS8xQT58aTpenZmTUquOfFujqBEeGdCxPwIBu1EKqAn2ulJ03MqBzgpH1829uBJLUJxwcf3HS++yLHz/A81+U8dcjbZvY8lL4xuJn+UyfIKY7myXCDyK/tnAfLsTDMWkDko++JSri0ZDjfZuYM8EIXAsbKMdc2WDpJ7AV6cNjy3rXFW5LEkRYUQwqXo1mD6p6vSeXsh249DufGg55iCPy7R2L7nAnHB2oPzSd1zz0IrB+m4gIsZtRu8si2wmdymBsaFQRUqoHUiTdcsqkxM53stIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b16b5f5f-0c0a-45a9-2431-08df3e9d5df7
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7010.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 20:09:31.8436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2UBk4ID55Z51Vswh55x6em7m0KeYKnV0EHADcmtHPdVig4rh59nnPmULkGuSnpdc4tp6ImcMAqOflnCZsJZsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8309
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 9/8/2026 4:23 PM, Umesh Nerlige Ramappa wrote:
> intel_guc_deregister_done_process_msg() takes the ctx_id straight out of
> the G2H payload, resolves it via g2h_context_lookup() and then calls
> decr_outstanding_submission_g2h() unconditionally. Ensure that we are
> expecting a DEREGISTER_DONE G2H for that context before changing
> outstanding_submission state. Return EPROTO on error.
Again, I think you need to add "Discovered using AI-assisted 
static analysis confirmed by Intel Product Security." into the commit 
message for this patch.
>
> Fixes: b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC")
> Reported-by: Martin Hodo <martin.hodo@intel.com>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Assisted-by: Claude:claude-opus-5
nit: And also, the "Assisted-by" tag for AI is no longer required. I 
think this can be removed going forward. And with the commit message 
updated:

Reviewed-by: Jesus Narvaez <jesus.narvaez@intel.com>

Jesus Narvaez
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9d3bd16adf40..85fbef30dbec 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -5065,6 +5065,18 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   	if (unlikely(!ce))
>   		return -EPROTO;
>   
> +	/*
> +	 * A deregister H2G is only ever sent for a context that has been put in
> +	 * one of these two states first, so anything else means this G2H does
> +	 * not correspond to an outstanding request of ours.
> +	 */
> +	if (unlikely(!context_wait_for_deregister_to_register(ce) &&
> +		     !context_destroyed(ce))) {
> +		guc_err(guc, "Unexpected deregister done, ctx_id %u sched_state 0x%x\n",
> +			ctx_id, ce->guc_state.sched_state);
> +		return -EPROTO;
> +	}
> +
>   	trace_intel_context_deregister_done(ce);
>   
>   #ifdef CONFIG_DRM_I915_SELFTEST
