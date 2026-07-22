Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E38C44512
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Jul 2026 05:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDA610EC3D;
	Wed, 22 Jul 2026 05:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZ6teDvp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4742C10E68E;
 Wed, 22 Jul 2026 05:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784699301; x=1816235301;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=rCwsAhXuTPsgr/yWisG9AaopvxHhkgplbzirEJCw5t4=;
 b=fZ6teDvp3nSZW1vmgMTzTUn6wCCeec2Pl62ryNRQDvPhONvJcUiAe9u+
 p/firLGjhIbokpa16smgddk7+sVJfkkE1xzktwE+nQD8147Ugit0og9dl
 SXtKs1k9DrUoeQNEukNL18sCS7PE8uF8cwN9el6LL13bQ+vzM90+jHjxz
 keJgfMLzy/oOUofUuk65XEhm3QxJQZNJ86Gk+/zgcu3HJNtmzz8utA5aJ
 +04leZ9WKxwZtZ/+aHi+sIqbLSjk2ilU/bZlWN9fTeqS0IBwocfk9t4Uf
 HFmYIS/8iRLHnItYEsDh4IlGbIPEjTS3YxmWEzbWqYtUI2hQLSX54PBqp Q==;
X-CSE-ConnectionGUID: SZt5L7TjTQ+TtA57OZrzNA==
X-CSE-MsgGUID: T4erJDIGTxerwoj31TuINw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="88999962"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="88999962"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 22:48:20 -0700
X-CSE-ConnectionGUID: IuoCVXYOTQ2nTHirHkXIKQ==
X-CSE-MsgGUID: IA10hMJvRDil1d25fYKJkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="262269584"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 22:48:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 22:48:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 22:48:19 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 22:48:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfTGVOwn7Ka98TFhbmY6PEBL+6v3Ozv9i/c0lW6vyJOPE7Xo2t/fmMIKgN0Zn1t9LmciMV9xXCvWxJFccuo/r+Ynlz8IYqfiRAL0KOzaGY1SESEjjHGJo8dPVcprtnVIDi+h6EWgj3t2Ke1B1pGHTNjt3zv6xVcVA0fIR7fpFT5fD/kQ1vJ5+JAhhyUGnzkuqpVFGjnsT6J3qBK0YfT4QhX+vbnWGNg8VjVv1DV/EtcqVGDeeou00VPzaUmVVBWciT+ftrI8hU95eutxG7AheFHLyAsbkdcPU542dTC/Xdu25nDzFM7DQUL10mry4MHMAiUIXEEnNOfHxdWK/t2DNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JDI0j4iKlU1Ng7vh8JFk1dOuSd2V8d56iWIufCW18c=;
 b=SDCZ8JHu5HHwd9Aul2Lz4BG+b9nE73RuiUzL7F1q8xmQ3Sy64FrYHR1GEI/sxxt0Ez6AXF//uW5CDJJxjr/Eb9RyYMw2WmWED7tob96ByJrCjwW9TMeReDokQ8Jty8ScecQ9f9PR7BYDHbo0UsWSlILu72kC0SMm/GeGu5/TxAW/T8+0mGdel4zFeHyEbXkqmKDUfAOYcAwjjFHsfvy+ENmzyHcM62ayEJSO/M9xCceFKKO5Bq1OAS+vCp8SGZH0gOlIF5Ai6rYAl9fwdDXgTD/8n3Px1szaGaQOjWkaFnb/xffe/vbcwLunLIq3cNE17vMNIZ6bWQG83ilGLxHqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SN7PR11MB6994.namprd11.prod.outlook.com (2603:10b6:806:2ad::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 05:48:11 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Wed, 22 Jul 2026
 05:48:10 +0000
Date: Wed, 22 Jul 2026 05:48:01 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_drm=2Fi91?=
 =?utf-8?Q?5=2Fselftests?= =?utf-8?Q?=3A?= Disable live_pphwsp_runtime on
 graphics version 12
Message-ID: <wd7mmts2cukvs4jz2lzsxd4ilcxlz4hp5snxjzczzbwze56hmk@rpzzsqhbzvsr>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260721091615.2680038-1-krzysztof.karas@intel.com>
 <178468878488.213858.11193583754731411941@6beec6c84f66>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <178468878488.213858.11193583754731411941@6beec6c84f66>
X-ClientProxiedBy: DUZPR01CA0196.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::23) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SN7PR11MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ef7578-dc75-42a1-051d-08dee7b4cfe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|6133799003|3023799007|4143699003|10067099003|56012099006|11063799006|5023799004|27256017;
X-Microsoft-Antispam-Message-Info: 8SYd1KpvpEX0trGho/uJ16530ctyYfwTznw46Z1ply1CRY5DMbFSZM0izo/CGOp0T2CWLVgIT+9vAcxhPDsiWw9DnZLzbf/LPxOgsmBOeg3h3jk21mXYv1k0Fc7DP6xwBZ4qBFIbfvTJgoqWLe6mMEC0EbwSzooC4RFtKmDBteioWg7OBC/xG7dnEh85jU4vnXbA7cGR9wy+0mS3Df32GSByia1oWP3JpY4e6PebjQk0V1+RlV+RDxDagu/nPY7rkSZ2ch3sVFNvCPUCD+0NUn/k1F5XGb1sQIZjM0J5Iis5rCVEdUHL3w3bZZDN8KNSYk7goLl3+Kppg3USp5sF0nRjt8TAPrOydTpTz8iC69TEnbmj6Cjomd9HtNU9EMqBzW5cxuj70qfUNNbVZaa5Z3GkYR/3if5DSkXLt7z7CMbciPGZ1GT/zsy6rY2E8qbMux1gcXZYeBIj6aQKnqr5X+deOvKs9FW+87bXjA5OI3bIoSNMOsFSINGsncSB48UOTVTYCJSaV7V+H+5bBP2iJs5JYImAHSjUaipeioRNisQAA/s7cJCNdVb4JP6s7EQxcNsVUmngGitmWhHJO/h9pb7pRZ/lxPoY1Bmuh3V37XL85I6QfN++c3MJR5HItwxzCChSONHktUwzj0/jVrofBuinWQX6H8WEg02Bm9WgENc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(3023799007)(4143699003)(10067099003)(56012099006)(11063799006)(5023799004)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXlPSHkzem5WZzlQTlp6TWlBMkJEMDdhdEV5UFZBS3dRMG1wUkExTWNid3Zp?=
 =?utf-8?B?bWZFdFhtWktNK3hRWVNjZVlra1FFUlhMRmRVZ1R2VUFqQzUzS0dHaW9sV1Jn?=
 =?utf-8?B?b2ZzNzBKWEZVd0NpOTRIck94OWdKNEl2N0Fqd0E1d3V6bnRrU1FScHBCTlFq?=
 =?utf-8?B?Ukl4WnlXZ3RzSGlZMDBhSnZobUVidEVNWjJBRzY4VHp1VXFRUHVkVlZOQ0x5?=
 =?utf-8?B?UkhYOW1jM3lGN2NoanFiMnJGNHZsb29pQ3BpTWt4a1MwUkszR2JqTlppa3BP?=
 =?utf-8?B?OHhuQWJrT2VOVnlER2VTR3RPdGpzT2pveUxTaVlIeUNRTmJqcnpVNi9UYXVP?=
 =?utf-8?B?Qk45aGpETjBWUmY1ZnBJMjRzaDlLRkEyd0dRK3NSVjZzenAvWk1qbU5pM09n?=
 =?utf-8?B?d01EdS9LSUNZZDcrTUlNUkhlZDloc2dKU29tcC9mZmFYZDFzZGg0NEdzb2FL?=
 =?utf-8?B?czk4L21wckdiRTFLYmpSdFdReWlFT21tQVkxbkJqeVlrclptYmV0OE9MZDlY?=
 =?utf-8?B?Mm1qUUZuVzBpeE84Qks1ZkpEaGNJNlVnTnM5MmZxUGNRTVNveVYrMzVYTXJL?=
 =?utf-8?B?NEpOVDR6NVROd0h0eVRpZGdKVkJJeHg1Q2N3Ykc4UnNTb1RvLzZRZktUWHY3?=
 =?utf-8?B?ZEdzc2w2NUZBRllaOTV3MGY2U1YwUmliVHV1Y2JCdnZqbDh6RDNyWmNvSWpH?=
 =?utf-8?B?SGdMQm5JWDlSMXJXQ21JOHRhNSsvb29sbVhWakswbXpEYlRRalB0WWhncGt0?=
 =?utf-8?B?eXA0ZkQ0MW1ZekdaRG0rUExZYU1wS1psUTZuUGxJOUZPazNTZFBUUTByOEF0?=
 =?utf-8?B?VWlrR2RyRk1YTVpDYnRpeENpQ1h6Y29Zd2ZiR0dldk1FVnY0a2xiSkdGYUhv?=
 =?utf-8?B?Z1FhKzVCeDNoaVROYkgwYTF6bDJrTkY3SVZ1NWFHRjRJRU8zcWl4SFE1anMz?=
 =?utf-8?B?bDZsT3JBMml4bmdUTjNnOFBieHpyVHBwbko5cGgwQzNvTlhhOE1TNVJGY091?=
 =?utf-8?B?SHhmWU1abVRPdGNsWE9OYzBJYnpJTXQyMTlCbEk0cWRvYzRuRngraFJEM3RI?=
 =?utf-8?B?cEs2WFNZaUMwQW13OThoNTY3dDRpUzlZSThaSnpDV0VScC9RVHA1MGora213?=
 =?utf-8?B?V0tpTm8zZU52QmQwcXJ5L09VZjdWa21SS1NkR3dTN0JvN20xQXdnajNEcjMw?=
 =?utf-8?B?RndoNFVpU1BxMmNaaEVaVlZxQjVZSmF2MlhmSy84d0tmQnpNcHdta0JaODBM?=
 =?utf-8?B?NkM0QjM1VzVtYmRpUld3L2tTenlGSk92bkdIQW00Um9sRWlkZlViNnVDUTNm?=
 =?utf-8?B?SWQ5c21pSm5sQUFqU1pQQVJmNFFjNGZwMmdtc2tDSzVJRXZFSDd6aGJUZkVs?=
 =?utf-8?B?NEJsNWViTlk3QVk5aDBmb1QrTVc3YUJHQVprYk04Z3RmUzZ5dXN1T0dRSHZ6?=
 =?utf-8?B?dWU2eXN5ZTZ4K0hLTjdIWmM4SUI2aDhlYXc2VlJDWG1meVpxY0V6MVlFTEtL?=
 =?utf-8?B?NmNaUmNiVHZDTzAvYXkrY0dnNE9haDl2ZjVNdUxWMU0wWUJ5a0grMjhwV1o3?=
 =?utf-8?B?QkxkTDllQTVDRkZCaVpkaG12dGVRNXh5ZU5WdTVWZjFoWDlqb05xK0t0ZnZw?=
 =?utf-8?B?dUFKYjRTMHh3dERjekQxK3RSU1daTzZtZUpkb2tUUmlPeGs4QVFsWExBcnB5?=
 =?utf-8?B?b2ZsQnIzSXMwQ2tNcHVLVzBsZE9QUDVrTDIvbVZtU1FwQkZjZ2tVbkxwcnJw?=
 =?utf-8?B?TlcxSWNPSkUzTTdiU3ZyaGlRQlZka0Z3SUc2Y2RlSHdyc2wvSkxlaUw1ZDJH?=
 =?utf-8?B?TmxTK3BmN3JOZUZDNFBSQVBEM3N0TEw0b0ZlemxpVUdLb25Hd0JBQ2JuVUdE?=
 =?utf-8?B?YzhrRTlWQ0ZZcnFDS0JlVzBKS2MrY3FSM2ZrMU9INnpOcHRDTVU3eGNRSjlk?=
 =?utf-8?B?QmVZSzBpRTRER2x1cG5TV083Vkl5LzFZSGd4N3k4bENWNXM5akRGSlNOV1p1?=
 =?utf-8?B?eTc2REhnQjlVd1ZMNlhuSW43cmNQdEVmdEI3enBzc3VHdm5sMG13TlpIWkNZ?=
 =?utf-8?B?NEU0QXpoV0VralFRQ1FqR0hXM0VQTG9LbmkwSzA4dTl4VDZtdXJiZ2R6UUVR?=
 =?utf-8?B?Wkk3anorY3M0TE5HMDhhNHFXRWdSS1I3SUJBaXg3MlF4UDhQOTNyNzFWK2FD?=
 =?utf-8?B?dVZVbE1IMGtDaVVWa2ZXNzdDUWRBcUdzcVIvaTEzZXg0cDNRbUxWSkZMZmlw?=
 =?utf-8?B?UmNUZEJoZ3EwWFh5enh4cnNTRFNRZTJJZjFEZGkwVkx2QkZ1bDA1MS9QR0Y5?=
 =?utf-8?B?RWx0VE50cXc0OEl4WWlOUUMvNG1mNitPNkZkRHJNRjV3b05QeXR6VlFRMm1o?=
 =?utf-8?Q?3Dl0i/Z3YmEAZB9U=3D?=
X-Exchange-RoutingPolicyChecked: qT2QT2fz6llGGbnPLh+qjjBEQD7wVwq9zjnfaZWvrT+67hkDMW9SOb44VvaF7D+vdEslTIAf3KxHys9YCa8E9JOvmA4sEuhGiMikBRrGm+wu5bgTr/hLcXNq5LXx+8TxeN+Tw0VzrlBIRpPgJURUbV/BCFp4CfdOIH63z/Se2XCpLTpa/pbLMk8nv42dH0Gun9MliQODWmQL26qTHhTBAYbV+bvMTwvww9UIcKDO5ZG1w1imJXFd8usjlL5AlQqkOMoa9IeGG/zMSeq/ggy7HIebIaUSO1Q9OUqHpExf9v38uj7GKYywKosVhLLTIR/0BlK7bIyBSLmokXctWhm0aQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ef7578-dc75-42a1-051d-08dee7b4cfe5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 05:48:10.6054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8oaofgD9/HdWjfddANIOAYo9O14kdiB4Fp665LiSUzk8btJ7Vn4f2eM3OUS2pIQwA45qxVbi7yC6dxrTh54Od5f+AYNKapnnM/6MdGUKdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6994
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

Hi,

below report stems from kms testing (part of display) which my
change does not touch. Could I get the tests retriggered on this
patch please?

On 2026-07-22 at 02:53:04 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/selftests: Disable live_pphwsp_runtime on graphics version 12
> URL   : https://patchwork.freedesktop.org/series/170801/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_18864_full -> Patchwork_170801v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with Patchwork_170801v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_170801v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_170801v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-all-transition-fencing:
>     - shard-mtlp:         [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-mtlp-6/igt@kms_atomic_transition@plane-all-transition-fencing.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-mtlp-3/igt@kms_atomic_transition@plane-all-transition-fencing.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_18864_full and Patchwork_170801v1_full:
> 
> ### New IGT tests (4) ###
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [8.06] s
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [8.00] s
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [8.00] s
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [8.00] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_170801v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#8411])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@gem_ccs@block-copy-compressed:
>     - shard-tglu:         NOTRUN -> [SKIP][4] ([i915#3555] / [i915#9323])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@gem_ccs@block-copy-compressed.html
> 
>   * igt@gem_ccs@block-multicopy-inplace:
>     - shard-tglu-1:       NOTRUN -> [SKIP][5] ([i915#3555] / [i915#9323])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@gem_ccs@block-multicopy-inplace.html
> 
>   * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
>     - shard-dg2:          [PASS][6] -> [INCOMPLETE][7] ([i915#13356] / [i915#16348])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg2-4/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-3/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-tglu-1:       NOTRUN -> [SKIP][8] ([i915#7697]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_ctx_isolation@preservation-s3@bcs0:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][9] ([i915#13356] / [i915#16466]) +1 other test incomplete
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk1/igt@gem_ctx_isolation@preservation-s3@bcs0.html
> 
>   * igt@gem_ctx_isolation@preservation-s3@vecs0:
>     - shard-rkl:          NOTRUN -> [ABORT][10] ([i915#15131])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-1/igt@gem_ctx_isolation@preservation-s3@vecs0.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
>     - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#5882]) +7 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-dg1:          [PASS][12] -> [DMESG-WARN][13] ([i915#13390] / [i915#4391] / [i915#4423])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg1-18/igt@gem_eio@in-flight-suspend.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg1-16/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_exec_balancer@parallel-contexts:
>     - shard-tglu:         NOTRUN -> [SKIP][14] ([i915#4525])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@gem_exec_balancer@parallel-contexts.html
> 
>   * igt@gem_exec_capture@capture-invisible:
>     - shard-glk11:        NOTRUN -> [SKIP][15] ([i915#6334]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk11/igt@gem_exec_capture@capture-invisible.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-tglu-1:       NOTRUN -> [SKIP][16] ([i915#6334]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_flush@basic-wb-set-default:
>     - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#3539] / [i915#4852])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@gem_exec_flush@basic-wb-set-default.html
> 
>   * igt@gem_exec_reloc@basic-gtt-read:
>     - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#3281]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@gem_exec_reloc@basic-gtt-read.html
> 
>   * igt@gem_exec_reloc@basic-softpin:
>     - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#3281]) +4 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-8/igt@gem_exec_reloc@basic-softpin.html
> 
>   * igt@gem_exec_suspend@basic-s3:
>     - shard-glk:          [PASS][20] -> [INCOMPLETE][21] ([i915#13196] / [i915#13356]) +1 other test incomplete
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-glk6/igt@gem_exec_suspend@basic-s3.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk2/igt@gem_exec_suspend@basic-s3.html
> 
>   * igt@gem_lmem_evict@dontneed-evict-race:
>     - shard-glk:          NOTRUN -> [SKIP][22] ([i915#4613])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk2/igt@gem_lmem_evict@dontneed-evict-race.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][23] ([i915#4613] / [i915#7582])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html
> 
>   * igt@gem_lmem_swapping@heavy-random:
>     - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#4613])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@gem_lmem_swapping@heavy-random.html
> 
>   * igt@gem_lmem_swapping@parallel-multi:
>     - shard-tglu-1:       NOTRUN -> [SKIP][25] ([i915#4613])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@gem_lmem_swapping@parallel-multi.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#4613]) +2 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-9/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_mmap_gtt@bad-object:
>     - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#4077])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@gem_mmap_gtt@bad-object.html
> 
>   * igt@gem_mmap_wc@read-write-distinct:
>     - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#4083])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@gem_mmap_wc@read-write-distinct.html
> 
>   * igt@gem_pread@snoop:
>     - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#3282]) +2 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-8/igt@gem_pread@snoop.html
> 
>   * igt@gem_pxp@hw-rejects-pxp-context:
>     - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#13398])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@gem_pxp@hw-rejects-pxp-context.html
> 
>   * igt@gem_readwrite@read-write:
>     - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#3282])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@gem_readwrite@read-write.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][32] +160 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk2/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#5190] / [i915#8428])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
> 
>   * igt@gem_userptr_blits@dmabuf-unsync:
>     - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#3297]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>   * igt@gem_userptr_blits@forbidden-operations:
>     - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#3282] / [i915#3297])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html
> 
>   * igt@gem_userptr_blits@readonly-unsync:
>     - shard-tglu-1:       NOTRUN -> [SKIP][36] ([i915#3297])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@gem_userptr_blits@readonly-unsync.html
> 
>   * igt@gem_workarounds@suspend-resume:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][37] ([i915#13356] / [i915#14586])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk4/igt@gem_workarounds@suspend-resume.html
> 
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-rkl:          [PASS][38] -> [ABORT][39] ([i915#15152])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-8/igt@gem_workarounds@suspend-resume-fd.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-1/igt@gem_workarounds@suspend-resume-fd.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#2527]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-8/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@gen9_exec_parse@bb-start-cmd:
>     - shard-tglu-1:       NOTRUN -> [SKIP][41] ([i915#2527] / [i915#2856])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html
> 
>   * igt@gen9_exec_parse@cmd-crossing-page:
>     - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#2527] / [i915#2856]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@gen9_exec_parse@cmd-crossing-page.html
> 
>   * igt@gen9_exec_parse@secure-batches:
>     - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#2856])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@gen9_exec_parse@secure-batches.html
> 
>   * igt@i915_module_load@fault-injection@intel_connector_register:
>     - shard-glk11:        NOTRUN -> [ABORT][44] ([i915#15342]) +1 other test abort
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk11/igt@i915_module_load@fault-injection@intel_connector_register.html
> 
>   * igt@i915_pm_rpm@system-suspend-execbuf:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][45] ([i915#13356] / [i915#15172])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk9/igt@i915_pm_rpm@system-suspend-execbuf.html
> 
>   * igt@i915_suspend@forcewake:
>     - shard-dg2:          [PASS][46] -> [ABORT][47] ([i915#15140])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg2-6/igt@i915_suspend@forcewake.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-10/igt@i915_suspend@forcewake.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-rkl:          [PASS][48] -> [INCOMPLETE][49] ([i915#4817])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-5/igt@i915_suspend@sysfs-reader.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-tglu-1:       NOTRUN -> [SKIP][50] ([i915#12454] / [i915#12712])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#1769] / [i915#3555])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#1769] / [i915#3555])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>     - shard-tglu-1:       NOTRUN -> [SKIP][53] ([i915#5286]) +3 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#5286]) +4 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-9/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#5286])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#3638]) +2 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
>     - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4538] / [i915#5190])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#5190])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#12313])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
>     - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#6095]) +49 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#12805])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][62] ([i915#6095]) +34 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
>     - shard-glk:          [PASS][63] -> [INCOMPLETE][64] ([i915#15582])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-glk5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#14098] / [i915#6095]) +45 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#14544] / [i915#6095]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#14098] / [i915#14544] / [i915#6095])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#6095]) +199 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#10307] / [i915#6095]) +99 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#6095]) +75 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-8/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][72] ([i915#3742])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-tglu:         NOTRUN -> [SKIP][73] ([i915#3742])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_audio@dp-audio-after-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#11151])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_chamelium_audio@dp-audio-after-suspend.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
>     - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#11151])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-9/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2:          NOTRUN -> [SKIP][76] +2 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
>     - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#16471]) +1 other test skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-9/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#11151] / [i915#7828]) +3 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-8/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_edid@dp-mode-timings:
>     - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#11151] / [i915#7828]) +4 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_chamelium_edid@dp-mode-timings.html
> 
>   * igt@kms_chamelium_frames@vga-frame-dump:
>     - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#11151] / [i915#7828])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_chamelium_frames@vga-frame-dump.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd:
>     - shard-tglu-1:       NOTRUN -> [SKIP][81] ([i915#11151] / [i915#7828]) +3 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd.html
> 
>   * igt@kms_color@deep-color:
>     - shard-dg2:          [PASS][82] -> [SKIP][83] ([i915#12655] / [i915#3555])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg2-10/igt@kms_color@deep-color.html
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-1/igt@kms_color@deep-color.html
> 
>   * igt@kms_content_protection@atomic-hdcp14:
>     - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#15865]) +1 other test skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-9/igt@kms_content_protection@atomic-hdcp14.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#15330] / [i915#3299])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
>     - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#15330])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#15865]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-8/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@suspend-resume@pipe-a-dp-3:
>     - shard-dg2:          NOTRUN -> [FAIL][88] ([i915#7173]) +1 other test fail
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-10/igt@kms_content_protection@suspend-resume@pipe-a-dp-3.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x10:
>     - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#3555]) +3 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#3555]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#13049])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x42:
>     - shard-tglu:         NOTRUN -> [FAIL][92] ([i915#13566]) +5 other tests fail
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#13049])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21:
>     - shard-rkl:          [PASS][94] -> [FAIL][95] ([i915#13566]) +1 other test fail
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-64x21.html
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [FAIL][96] ([i915#13566]) +3 other tests fail
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#9723])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#3804])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_dp_aux_dev@basic:
>     - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#1257])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_dp_aux_dev@basic.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-dg2:          [PASS][100] -> [SKIP][101] ([i915#13707])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg2-10/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-tglu-1:       NOTRUN -> [SKIP][102] ([i915#16361]) +1 other test skip
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-with-bpc-bigjoiner:
>     - shard-tglu:         NOTRUN -> [SKIP][103] ([i915#16361]) +4 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
> 
>   * igt@kms_dsc@dsc-with-formats-ultrajoiner:
>     - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#16361]) +1 other test skip
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@kms_dsc@dsc-with-formats-ultrajoiner.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#3955])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@hdr:
>     - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#16600])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-9/igt@kms_feature_discovery@hdr.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>     - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#9934])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-panning:
>     - shard-tglu-1:       NOTRUN -> [SKIP][108] ([i915#3637] / [i915#9934]) +3 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#9934]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#3637] / [i915#9934]) +4 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>     - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#9934]) +1 other test skip
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][112] ([i915#12745] / [i915#4839])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk10/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][113] ([i915#12745])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk10/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#15643]) +2 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-tglu-1:       NOTRUN -> [SKIP][115] ([i915#15643])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#15643] / [i915#5190])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
>     - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#15643]) +3 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#15643])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-tglu-1:       NOTRUN -> [SKIP][119] +56 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
>     - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#15989]) +10 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][121] +81 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-9/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move:
>     - shard-glk:          [PASS][122] -> [SKIP][123] +7 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#15989]) +3 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-stridechange:
>     - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#15989]) +12 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
>     - shard-glk10:        NOTRUN -> [SKIP][126] +239 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#1825]) +3 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#15990])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#15991]) +5 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:
>     - shard-rkl:          NOTRUN -> [SKIP][130] +42 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
>     - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#5439])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-rkl:          [PASS][132] -> [SKIP][133] ([i915#15989]) +7 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen:
>     - shard-dg2:          [PASS][134] -> [SKIP][135] ([i915#15989]) +2 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt:
>     - shard-tglu-1:       NOTRUN -> [SKIP][136] ([i915#15989]) +11 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#15104] / [i915#15990])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
>     - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#15102] / [i915#3023]) +12 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-rte:
>     - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#15102]) +5 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
>     - shard-glk11:        NOTRUN -> [SKIP][140] +151 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#15991] / [i915#5354]) +6 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-tglu-1:       NOTRUN -> [SKIP][142] ([i915#15102]) +18 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#15102]) +29 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#15102]) +10 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-suspend.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#12713])
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#3555] / [i915#8228])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#16644] / [i915#3555] / [i915#8228])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-8/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-tglu-1:       NOTRUN -> [SKIP][148] ([i915#13688])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#15458])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_mst@mst-suspend-read-crc:
>     - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#16451])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_mst@mst-suspend-read-crc.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#6301])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-9/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-tglu-1:       NOTRUN -> [SKIP][152] ([i915#6301])
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
>     - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#14712])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-glk:          NOTRUN -> [DMESG-FAIL][154] ([i915#118] / [i915#16396])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
>     - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#15709]) +1 other test skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
>     - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#15709]) +1 other test skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
>     - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#15709]) +2 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
>     - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#15709]) +1 other test skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][159] ([i915#13026]) +1 other test incomplete
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#3555]) +3 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#13958])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-tglu-1:       NOTRUN -> [SKIP][162] ([i915#13958])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
>     - shard-tglu-1:       NOTRUN -> [SKIP][163] ([i915#15329]) +9 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#12343])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#12343] / [i915#5354])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-8/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#12343] / [i915#5354])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#15948])
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-tglu-1:       NOTRUN -> [FAIL][168] ([i915#16479])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-rkl:          [PASS][169] -> [SKIP][170] ([i915#15073]) +2 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-8/igt@kms_pm_rpm@dpms-lpsp.html
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-dg2:          [PASS][171] -> [SKIP][172] ([i915#15073]) +1 other test skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#15073])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>     - shard-dg1:          [PASS][174] -> [SKIP][175] ([i915#15073])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#15073])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-glk:          [PASS][177] -> [INCOMPLETE][178] ([i915#10553])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-glk3/igt@kms_pm_rpm@system-suspend-modeset.html
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk8/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#6524])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
>     - shard-glk10:        NOTRUN -> [SKIP][180] ([i915#11520]) +5 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#11520]) +4 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
>     - shard-glk:          NOTRUN -> [SKIP][182] ([i915#11520]) +5 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>     - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#11520]) +2 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#11520])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
>     - shard-glk11:        NOTRUN -> [SKIP][185] ([i915#11520]) +1 other test skip
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk11/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>     - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#11520]) +2 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#9683]) +1 other test skip
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#9683]) +1 other test skip
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#1072] / [i915#9732]) +7 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-8/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 
>   * igt@kms_psr@pr-sprite-plane-move:
>     - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#9732]) +14 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_psr@pr-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-no-drrs:
>     - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#1072] / [i915#9732]) +2 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@kms_psr@psr-no-drrs.html
> 
>   * igt@kms_psr@psr2-sprite-mmap-gtt:
>     - shard-tglu-1:       NOTRUN -> [SKIP][192] ([i915#9732]) +8 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-gtt.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][193] ([i915#15500] / [i915#16184])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk9/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#5289]) +1 other test skip
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_selftest@drm_framebuffer:
>     - shard-glk11:        NOTRUN -> [ABORT][195] ([i915#13179]) +1 other test abort
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk11/igt@kms_selftest@drm_framebuffer.html
> 
>   * igt@kms_vblank@wait-busy-hang:
>     - shard-dg1:          [PASS][196] -> [DMESG-WARN][197] ([i915#4423])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg1-19/igt@kms_vblank@wait-busy-hang.html
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg1-12/igt@kms_vblank@wait-busy-hang.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#11920])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-8/igt@kms_vrr@lobf.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#9906])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-2/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>   * igt@perf_pmu@busy-idle@vecs1:
>     - shard-dg2:          NOTRUN -> [FAIL][200] ([i915#4349]) +2 other tests fail
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@perf_pmu@busy-idle@vecs1.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#8516])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#3708])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#16066])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_isolation@preservation-s3@rcs0:
>     - shard-rkl:          [INCOMPLETE][204] ([i915#13356]) -> [PASS][205]
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
> 
>   * igt@gem_exec_gttfill@basic:
>     - shard-mtlp:         [SKIP][206] ([i915#16090]) -> [PASS][207]
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-mtlp-4/igt@gem_exec_gttfill@basic.html
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-mtlp-2/igt@gem_exec_gttfill@basic.html
> 
>   * igt@gem_exec_suspend@basic-s0:
>     - shard-dg2:          [INCOMPLETE][208] ([i915#13356]) -> [PASS][209] +1 other test pass
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg2-1/igt@gem_exec_suspend@basic-s0.html
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-7/igt@gem_exec_suspend@basic-s0.html
> 
>   * igt@gem_mmap_offset@clear-via-pagefault:
>     - shard-mtlp:         [INCOMPLETE][210] ([i915#16021] / [i915#16108] / [i915#16202]) -> [PASS][211] +1 other test pass
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-mtlp-4/igt@gem_mmap_offset@clear-via-pagefault.html
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-mtlp-2/igt@gem_mmap_offset@clear-via-pagefault.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - shard-rkl:          [ABORT][212] ([i915#15131]) -> [PASS][213]
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-1/igt@i915_suspend@basic-s2idle-without-i915.html
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-2/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:
>     - shard-dg2:          [SKIP][214] ([i915#15989]) -> [PASS][215] +10 other tests pass
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu:
>     - shard-glk:          [SKIP][216] -> [PASS][217] +11 other tests pass
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-glk3/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:
>     - shard-rkl:          [SKIP][218] ([i915#15989]) -> [PASS][219] +8 other tests pass
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-dg2:          [SKIP][220] ([i915#16518] / [i915#3555] / [i915#8228]) -> [PASS][221]
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg2-6/igt@kms_hdr@static-toggle.html
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-10/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-dg1:          [SKIP][222] ([i915#15073]) -> [PASS][223]
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg1-17/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-dg2:          [SKIP][224] ([i915#15073]) -> [PASS][225] +1 other test pass
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp.html
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-rkl:          [SKIP][226] ([i915#15073]) -> [PASS][227] +1 other test pass
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-mtlp:         [FAIL][228] -> [PASS][229] +2 other tests pass
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-mtlp-2/igt@kms_vrr@negative-basic.html
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-mtlp-7/igt@kms_vrr@negative-basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_ctx_isolation@preservation-s3:
>     - shard-rkl:          [INCOMPLETE][230] ([i915#13356]) -> [ABORT][231] ([i915#15131])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-7/igt@gem_ctx_isolation@preservation-s3.html
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-1/igt@gem_ctx_isolation@preservation-s3.html
> 
>   * igt@gem_exec_reloc@basic-cpu-read:
>     - shard-rkl:          [SKIP][232] ([i915#14544] / [i915#3281]) -> [SKIP][233] ([i915#3281]) +2 other tests skip
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-read.html
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@gem_exec_reloc@basic-cpu-read.html
> 
>   * igt@gem_exec_reloc@basic-scanout:
>     - shard-rkl:          [SKIP][234] ([i915#3281]) -> [SKIP][235] ([i915#14544] / [i915#3281])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-5/igt@gem_exec_reloc@basic-scanout.html
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@gem_exec_reloc@basic-scanout.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - shard-rkl:          [SKIP][236] ([i915#4613]) -> [SKIP][237] ([i915#14544] / [i915#4613])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-5/igt@gem_lmem_swapping@verify-random.html
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_readwrite@write-bad-handle:
>     - shard-rkl:          [SKIP][238] ([i915#14544] / [i915#3282]) -> [SKIP][239] ([i915#3282]) +1 other test skip
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@gem_readwrite@write-bad-handle.html
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@gem_readwrite@write-bad-handle.html
> 
>   * igt@gem_tiled_pread_pwrite:
>     - shard-rkl:          [SKIP][240] ([i915#3282]) -> [SKIP][241] ([i915#14544] / [i915#3282]) +1 other test skip
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-5/igt@gem_tiled_pread_pwrite.html
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@gem_tiled_pread_pwrite.html
> 
>   * igt@gen9_exec_parse@unaligned-jump:
>     - shard-rkl:          [SKIP][242] ([i915#14544] / [i915#2527]) -> [SKIP][243] ([i915#2527])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@gen9_exec_parse@unaligned-jump.html
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@gen9_exec_parse@unaligned-jump.html
> 
>   * igt@gpu_buddy@gpu_buddy:
>     - shard-rkl:          [SKIP][244] ([i915#15678]) -> [SKIP][245] ([i915#14544] / [i915#15678])
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-5/igt@gpu_buddy@gpu_buddy.html
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@gpu_buddy@gpu_buddy.html
> 
>   * igt@i915_pm_freq_api@freq-basic-api:
>     - shard-rkl:          [SKIP][246] ([i915#14544] / [i915#8399]) -> [SKIP][247] ([i915#8399])
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@i915_pm_freq_api@freq-basic-api.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>     - shard-rkl:          [SKIP][248] ([i915#5286]) -> [SKIP][249] ([i915#14544] / [i915#5286])
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-rkl:          [SKIP][250] ([i915#14544] / [i915#3638]) -> [SKIP][251] ([i915#3638])
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-rkl:          [SKIP][252] -> [SKIP][253] ([i915#14544]) +10 other tests skip
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-rkl:          [SKIP][254] ([i915#12313] / [i915#14544]) -> [SKIP][255] ([i915#12313])
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
>     - shard-rkl:          [SKIP][256] ([i915#14098] / [i915#6095]) -> [SKIP][257] ([i915#14098] / [i915#14544] / [i915#6095])
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          [SKIP][258] ([i915#14544] / [i915#6095]) -> [SKIP][259] ([i915#6095]) +3 other tests skip
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
>     - shard-rkl:          [SKIP][260] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][261] ([i915#14098] / [i915#6095]) +3 other tests skip
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-rkl:          [SKIP][262] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][263] ([i915#11151] / [i915#7828])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-read.html
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_content_protection@atomic-dpms-hdcp14:
>     - shard-dg2:          [FAIL][264] ([i915#7173]) -> [SKIP][265] ([i915#15865])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg2-10/igt@kms_content_protection@atomic-dpms-hdcp14.html
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-1/igt@kms_content_protection@atomic-dpms-hdcp14.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-dg1:          [SKIP][266] ([i915#15865]) -> [SKIP][267] ([i915#9433])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg1-19/igt@kms_content_protection@mei-interface.html
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg1-12/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2:          [SKIP][268] ([i915#15865]) -> [FAIL][269] ([i915#7173]) +1 other test fail
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg2-6/igt@kms_content_protection@srm.html
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-10/igt@kms_content_protection@srm.html
>     - shard-dg1:          [SKIP][270] ([i915#15865]) -> [SKIP][271] ([i915#15865] / [i915#4423])
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg1-18/igt@kms_content_protection@srm.html
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg1-16/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2:          [SKIP][272] ([i915#13049]) -> [SKIP][273] ([i915#13049] / [i915#3359])
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-rkl:          [SKIP][274] ([i915#14544]) -> [SKIP][275] +9 other tests skip
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-rkl:          [SKIP][276] ([i915#13707] / [i915#14544]) -> [SKIP][277] ([i915#13707])
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
>     - shard-rkl:          [SKIP][278] ([i915#16361]) -> [SKIP][279] ([i915#14544] / [i915#16361])
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-rkl:          [SKIP][280] ([i915#9934]) -> [SKIP][281] ([i915#14544] / [i915#9934])
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-5/igt@kms_flip@2x-plain-flip.html
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-dg1:          [SKIP][282] -> [SKIP][283] ([i915#4423])
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-rkl:          [SKIP][284] ([i915#15102] / [i915#3023]) -> [SKIP][285] ([i915#14544] / [i915#15102] / [i915#3023])
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
>     - shard-dg2:          [SKIP][286] ([i915#10433] / [i915#15102]) -> [SKIP][287] ([i915#15102])
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2:          [SKIP][288] ([i915#15102]) -> [SKIP][289] ([i915#10433] / [i915#15102]) +1 other test skip
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:
>     - shard-rkl:          [SKIP][290] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][291] ([i915#15102] / [i915#3023])
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-rkl:          [SKIP][292] ([i915#1825]) -> [SKIP][293] ([i915#14544] / [i915#1825])
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-render:
>     - shard-rkl:          [SKIP][294] ([i915#14544] / [i915#15102]) -> [SKIP][295] ([i915#15102]) +3 other tests skip
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-render.html
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-gtt:
>     - shard-rkl:          [SKIP][296] ([i915#15102]) -> [SKIP][297] ([i915#14544] / [i915#15102])
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-rkl:          [SKIP][298] ([i915#12713] / [i915#16644]) -> [SKIP][299] ([i915#16644])
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-8/igt@kms_hdr@brightness-with-hdr.html
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-1/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-rkl:          [SKIP][300] ([i915#14544] / [i915#14712]) -> [SKIP][301] ([i915#14712])
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
>     - shard-rkl:          [SKIP][302] ([i915#14544] / [i915#15709]) -> [SKIP][303] ([i915#15709])
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-rkl:          [SKIP][304] ([i915#13958]) -> [SKIP][305] ([i915#13958] / [i915#14544])
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-y.html
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-dg1:          [SKIP][306] ([i915#3828]) -> [SKIP][307] ([i915#9340])
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg1-12/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>     - shard-rkl:          [SKIP][308] ([i915#11520] / [i915#14544]) -> [SKIP][309] ([i915#11520]) +1 other test skip
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr@pr-primary-mmap-gtt:
>     - shard-rkl:          [SKIP][310] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][311] ([i915#1072] / [i915#9732]) +2 other tests skip
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@kms_psr@pr-primary-mmap-gtt.html
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@kms_psr@pr-primary-mmap-gtt.html
> 
>   * igt@kms_psr@pr-sprite-render:
>     - shard-rkl:          [SKIP][312] ([i915#1072] / [i915#9732]) -> [SKIP][313] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-5/igt@kms_psr@pr-sprite-render.html
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@kms_psr@pr-sprite-render.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2:          [SKIP][314] ([i915#15867] / [i915#5190]) -> [SKIP][315] ([i915#12755] / [i915#15867] / [i915#5190])
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>     - shard-rkl:          [SKIP][316] ([i915#14544] / [i915#5289]) -> [SKIP][317] ([i915#5289])
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-rkl:          [SKIP][318] ([i915#8623]) -> [SKIP][319] ([i915#14544] / [i915#8623])
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18864/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern.html
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html
> 
>   
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
>   [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
>   [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
>   [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
>   [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
>   [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
>   [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
>   [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
>   [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
>   [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
>   [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
>   [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
>   [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
>   [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
>   [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
>   [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
>   [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
>   [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
>   [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
>   [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
>   [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
>   [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
>   [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
>   [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
>   [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
>   [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
>   [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
>   [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
>   [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
>   [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
>   [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
>   [i915#15140]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140
>   [i915#15152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15152
>   [i915#15172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
>   [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
>   [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
>   [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
>   [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
>   [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
>   [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
>   [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
>   [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
>   [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
>   [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
>   [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
>   [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
>   [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
>   [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
>   [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
>   [i915#16021]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16021
>   [i915#16066]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066
>   [i915#16090]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16090
>   [i915#16108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16108
>   [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
>   [i915#16202]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16202
>   [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
>   [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
>   [i915#16396]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16396
>   [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
>   [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
>   [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
>   [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
>   [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
>   [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
>   [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>   [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>   [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
>   [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>   [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
>   [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>   [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>   [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
>   [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>   [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
>   [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
>   [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>   [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
>   [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
>   [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>   [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_18864 -> Patchwork_170801v1
> 
>   CI-20190529: 20190529
>   CI_DRM_18864: 74d5c695a145d1d6394a84ba483549d3310eb2d9 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_9015: c656c9ccd7e45834f4ca191dbf729e7ba4676f6b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   Patchwork_170801v1: 74d5c695a145d1d6394a84ba483549d3310eb2d9 @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170801v1/index.html

-- 
Best Regards,
Krzysztof
