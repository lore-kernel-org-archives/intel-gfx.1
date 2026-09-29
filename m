Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26524CA5FA5
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2026 11:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4B010E0F6;
	Tue, 29 Sep 2026 11:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRfJ4fRt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290BE10E0F6
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Sep 2026 11:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790682159; x=1822218159;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=pjl7VeZjrU9TqipGBENdmc7g9a4OnR5xRApuhvTfd6Q=;
 b=TRfJ4fRtEUBFttIYOUjiSXqWlKY1qiBBVAaSBPuyixtCDGCu+HVtuB0o
 eFSkAMkTTCDAo2BKPZIzp6JxC5MTwUmAxOMT6UD+sGtSpULlL05afd8w4
 dKCQ/akJQi5g3Jc98JkXyRqeejCCte6o3eIkhrfEUfgudJM7+dL1G2Ayh
 4K19Vig9ng3y5BCyDkJgp5HQBkBgrrJocOEkPWKgF0eZ92P0V/Zbod1ew
 EROyk6CwYdhqj5/EaF1kUS/ZZY8V6Ov/xdx5xkCDZQEK3SOwVCU4iwJCT
 qkP5GgR66K88NZv0UzopenVElL8ysLAYBdXYHvLlnYQefWGwf6Tr2dm7g g==;
X-CSE-ConnectionGUID: 1vqv10FvSZqB6coAh8BSpg==
X-CSE-MsgGUID: ybIoF7BsRpq+KITPTpX63A==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101967802"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="101967802"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:42:38 -0700
X-CSE-ConnectionGUID: koNuFfQ3RSOFnE6m+EsIjA==
X-CSE-MsgGUID: bItY+mNAQ/e4wFfF46+O0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="273486349"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:42:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 04:42:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 04:42:38 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 04:42:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bud0R0KBs7gSPVVeqIu1+nvcVw6HSgJufnz3a1ZrP1Qv1MK4DZmMOoR75cLRX90cQt5v/zhAs5DG2/bFpQ5lxyhOCEsTHdE+hdeDTDzHleJHoSFJVhsleW5tN63/mKDmQWfHnveRb/rvniqTqAkegNPy62EM4aKmZkbM1gyuMzhEnK8naMF4vtdN3gnnd0ZjIBLLmR6E9v9GP6w2KelJJRPAhqXBizOwFqdor3emKIMDAGmNSaKNb4BqXZZWIO3LMJH0Pn4e0x946b80z0MT6FPz6u6rcNXFvgADVDWF90Jttjk0nOtLg3k96P1JenAC36CcIhq0k1CI3FF0HLLa+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CL8TpppnTaNreB6o34YtfKEaDDrZxGYQF13VdVkgZig=;
 b=tI3gMiSK0OkWEZTaxjlG6CP7zLxnww10ov1t3h28hpxtP2yKq79DSO1R5GcevHEDZvlTIqGyMK5K7yBMXEgZ9IlzKt91G0U27JBIa1qCVMyLiKM/xNBERWTZ/QGmuQ6jH6FI+uPSuTuBcjVj1NaW8hw8nVNnSdWjMaQ3HVF/kivKPHcYKcSbqjL8oPfowsvRAJsn+BQd8/2JYRkXSNHNvDn72i+yAGiRRaFMLKonzzF7XaUOXP3BJzaUxo+zdwStDlhQeQrfZAS0rIM1K1CawrueiLP0BfkJWUnK/UIwvhu30TWyDb5c8SszmjUlGT9LYKt/A0f0sgZBmAHXlxO2Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH7PR11MB7515.namprd11.prod.outlook.com (2603:10b6:510:278::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 11:42:35 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0451.014; Tue, 29 Sep 2026
 11:42:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 29 Sep 2026 13:42:45 +0200
Message-ID: <DLRRUM4IIQX2.2AYNTH45B6AF0@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Do not destroy uninitialized timer
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>,
 <intel-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.22.0
References: <20260929111259.2359138-1-krzysztof.karas@intel.com>
In-Reply-To: <20260929111259.2359138-1-krzysztof.karas@intel.com>
X-ClientProxiedBy: VIXP296CA0037.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36e::16) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH7PR11MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 06fba4e5-2871-46de-71e9-08df1e1ec161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: /Jo0mRP4x/g4Rf1/gkZ5wtovPTTbZuN3Uzzo7S6YNxQcDbCTFuQlCXF5gonL34ynBfr2IblN/i8oVz8VDbwYtiwJKd7QnnEU8KGOVXTOAg1d6UjO9ntYHK/tVSZUjyN2oGYKG4w0nHd0p4CksSEipsa5QStoYJtHj6OBAGVlaTcPMvnXgQBDIda9Ab3dENBQHzKPE5HL/JVTD85gpiTjPUHo6Ltow3PmWCfL3MvpPwKxgBTUuhGtskYptxPiEdgn4EYGqo8N49BxNVoPNo9P2n9THHijsR6RCKVefO3PXJdpDhBihhDH04vrKExPcP53Y1Em9DCVM22VzoBHW+c+tZWAkmrEGM3Y9RgoHB7olvoWcWFroQ/noneVDrgCBStIL3jfPgbKsrg9MpMUNCZaUwJ8LbOHnkqxtsGW+Di2EXf97h55sjHfXX9XaAx6yd0+xOGO4OIHfyenmyJTEyr2QDAsTJA9+swkWgMx8XR2Gfza8wc5Wu2OxO9vKqzpuZb+aGiGv+AyR7j4hbDdibgcPTcEs4da5wv36keKJxmnreP0iYd55f7XLa017sw8n0j4Po1HzwcwL3nRCm/x1GrZOlWkq0eoAcyTQC7kOmjx5/wpYuI6MUwO0TxT3pXAlXTzZ9dTkXQeFTRGuXkilQ32pfHJY8eoVOuO7sHj2IK0CzA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlhCbzgrbzhvcTVvN3NIclNMTXIrOFJSbU1rZFJaNTZBRThVRFhaY1NHcEtv?=
 =?utf-8?B?dHVmSVJKN2wwSkRDWkcvallTRTVWYUUwNS9DNjg3Y3hhSlJDTTd5Wlo0dVpj?=
 =?utf-8?B?c2VWS2tBOVk2U3FYSnp2UUJuMSt6dnVITWppTnF2L25hRHBIa0UyMDl5UzBy?=
 =?utf-8?B?R1dzQlRKYWdBa2R6d0hvbmppU1JQT0RZd3JaVlc4bUYyM2RSWXdYZklvWGk1?=
 =?utf-8?B?cjRWR242MldZUk5HYXVERU4xZDgvRjViaGRMU09SYUxZd3dLMlNsN2VYY2No?=
 =?utf-8?B?N295cHd5eUNnQ1FVeFN1TmNSdUFoMUpEK2dKVVJwZGVXVXJEa0xFc3ljK3hR?=
 =?utf-8?B?cGNhQXZKNXcwTXRmaXFOSmN1VFVTa0N3VVZ5bHBaLzdJS2VFQThaZVFOaENO?=
 =?utf-8?B?QVVxTTZiUUtpMjhkYmlMcnFpTEtEdzVOc2grcXNCTExOdEIvOC9mOEM0RnBX?=
 =?utf-8?B?MDU5SGVsMk1YR1NSUEg1WmdJWjVsTTVXekZsQzRLL0JpeTNLNUlaMDk4Z1Mw?=
 =?utf-8?B?ZTFLeEllcnJJOXBJWm1ualNmWWxLZGVCS0ZkNjdZQlliOFgvTFE5NE9EWjdl?=
 =?utf-8?B?eENicXpFNHNLMU9GSmpINzNsbE5jZnBXa3F0cml6VU5udmpHQS8zcGduU2c1?=
 =?utf-8?B?Z3BvODlSSlZuRkRxclVGS2E1andWSEdmQlk1eTh6czQzM1AvZDNBZGFXcG5V?=
 =?utf-8?B?cDlzZHNGZTMwdk40UDkzOTUwZHliTlJXc1Y2OCtjUkR1bkNRYUx4ZTBOSnV3?=
 =?utf-8?B?aTZzSk5lZEE0eFVOMGwrZEhBUSs1OGQ0M2xzdTFSUDBzWXdvUkZPdEFIV0lQ?=
 =?utf-8?B?czd0V045NEYxM1dKNGwrQlo1RCswR29aeHJGcDhkbDZzMVVrVm1tM0JMUnZ1?=
 =?utf-8?B?SWIzczZ1QnJkYU13SlJWS1lsNVFYZmFxQ1hraXhURGFSV1ZpYnNJRndPSkJz?=
 =?utf-8?B?TkllQThuVWJud0JnbmZrZ2dFSW5kSmhselovdnp1L3p1dXdabWRvbm9tVHo0?=
 =?utf-8?B?Sm9xREFWU1QxTVZvT3g4ZEJ1aEVuNjBFY29WTTdIYXN4aitLaHVVMWVUYmpu?=
 =?utf-8?B?VElDNWlOMVJJTytCZ0o2V09odHl6d0ZWdGRpMGRta3kyVUVPamxrWCs0ODA0?=
 =?utf-8?B?SWg0OFhHV1hRaUl6VGJtdXVyWVlZWklmQkFiSXhyT0phZ1drSFo1NVdBNVRv?=
 =?utf-8?B?UitqTXBpdDhndkRCck9oN0RkQ2NydXZpdWdQbjkrWURnQnQyeGpVYWlReDJ1?=
 =?utf-8?B?MVQzQU1mRzltVnN0UTROMW9XSGd3OWNDMDd0TVJ4Sk1jWUVrR0NEMkk4Vmdh?=
 =?utf-8?B?NW83dzg3MkVHSTZrMENjelRTWVZkbWptenh6Nm9CRHZ3ZnNFK2JvNjhKdXli?=
 =?utf-8?B?YkJ1YXNvek14UFgxU2ZvaXpleW5NaElHZXpGZkVvUEhGVW9GV0VQZTRSK3Bl?=
 =?utf-8?B?MnpXRGxEUDJaQzljZlJkbStnVkhTUFNCYXBJSnRldXcxNjJSc1pWakNSMW1n?=
 =?utf-8?B?M050QnVQUlhTTFcrUDg1SFQ3UlBHYzJvU0Z5bFhpZ3MwY0hPRHFFQTVaQXZr?=
 =?utf-8?B?N2swbVN5aE1sMXJ6TDNjMThaNGJ6OGZUSGVWdWFFdjhuRFZsNXpsZ2hrT2VX?=
 =?utf-8?B?OElnQ3lYZlhrcTUzL29zWDYvdGlpdjRhNDFPZll1cC9mTzgzNGlkK1ZUa3VB?=
 =?utf-8?B?QzFnbWtQYUg5bnY5SDl3cmVsZGh6Ny9VRkxhb1VIUS92VGhYK3JmZUVvOW93?=
 =?utf-8?B?TkdOM3RMa1pHNUZ0ZWRnOCthOE52eVphNlZNVzJ6OXBpTTU5NW5BQVNOeUFK?=
 =?utf-8?B?NG9EZFRubGpyZkxzTnBUOHpCNmpSWC9ib2ZJUklvTUdQTXVzemtSdzdqczNB?=
 =?utf-8?B?d2dGZjdhbDJ6dTg4Z1dXS1ZjbjNRQm5USG1xTmkvWFJSNTFXQmhYcFRvNmcw?=
 =?utf-8?B?a3h4LzIxZG0xaHRaYSt0ZUNGYmJWTDFtbHlvN0ZzY0E1NEdJclZyK3lYd3Z5?=
 =?utf-8?B?bVEvUnpXdGkzSGxqQXgvQWRnakF2RXVvRDRYZm9Nbmc4ZEEraTB4cC9DRzUy?=
 =?utf-8?B?TUNWTVl3TEhlYTBVdlFxT3NMQW9uK2JzZ2JEY3RBNXFRaEFDRG9BYWN4TUNB?=
 =?utf-8?B?SWhjaUNhN1dDSmlodTJOb3NxYy9HK1QxZGpIRTFYNlh0Qk1GQjhCYzduSml2?=
 =?utf-8?B?U29VNWV5WUgwV0c4bTNDakJkMEczeGwySzZ3TVhsTFYzWWR1b2tBcjc2Mjly?=
 =?utf-8?B?RlhXYXFWWlViRlJyenFtdFFlNXFLMUF6T0E1Ry9IRXk2ZG4rU3NKMUh2ZFRh?=
 =?utf-8?B?M1dDRDJPcHArZGs3b2JVdU9Wdm9rYU4wNEM2a2xKcTM2WTR4R1VlZEtIMXc5?=
 =?utf-8?Q?9Yr3B9WGqPN5kZcI=3D?=
X-Exchange-RoutingPolicyChecked: i1S9ISpcGRm38j3Ta4dXOW/vWYIASvyEE8xvOOFs+zneGXQKtNPpqz0K7GQmsaiodqX6dr1CH8IEuOJN+/1CsEAg3lyn0F+AZ1D1FL2oKhgFExUBtIJQHC/YYVYtFrE4lZtsd8t/nczHw1NqqKFLtvj/0LTFFjGKwU0kWFn0VraAYYm3QDR8caVb4y4na0vEj51P7mcFb5beM7ZqVht3uDIfanmfOuhW2DpckjWjw6LZn/lwF/o5aU2s+3p7HwowkNWxbFkXV9ZaBgLeWjuxc6IjOQD6zBeKDo8ujOfHYgz+NWo18aZlDsiEgmvmpbVn+6mGIg0KUSgAFzBnZByGRw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 06fba4e5-2871-46de-71e9-08df1e1ec161
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 11:42:35.4233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wA43NNu4LOXu7gG+xVg23X+stBAIUe+w33fV8Xg9cax1aKFhOQCbDwCGrSi4AoCdFU6NVXW/qYCQ6CNyoUHAzF8yGpvmmfqsAh2vV6MAldA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7515
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

Hi Krzysztof,

On Tue Sep 29, 2026 at 1:12 PM CEST, Krzysztof Karas wrote:
> If intel_ring_begin() fails in live_emit_pte_full_ring(), then
> cleanup is performed on an uninitialized timer.
>
> Check if the timer has been set up, before trying to remove it.
>
> Assisted-by: Copilot-Claude-Opus-5
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
How about something like this:

diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i=
915/gt/selftest_migrate.c
index 5b986a7687d9..7efdc8d9d8cd 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -626,7 +626,8 @@ static int live_emit_pte_full_ring(void *arg)
                cs =3D intel_ring_begin(rq, sz);
                if (IS_ERR(cs)) {
                        err =3D PTR_ERR(cs);
-                       goto out_rq;
+                       i915_request_add(rq);
+                       goto out_unpin;
                }
=20
                memset32(cs, MI_NOOP, sz);

--=20
Best regards,
Sebastian

