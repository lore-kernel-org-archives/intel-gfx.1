Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB920C5DF81
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2026 08:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149A010E180;
	Thu, 20 Aug 2026 08:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJsRi27o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C5110E180
 for <intel-gfx@lists.freedesktop.org>; Thu, 20 Aug 2026 08:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787213932; x=1818749932;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ftQawko3ZW5UkHQHoBjRwPg8EyY1tn+bd/wX1CaFsV0=;
 b=TJsRi27odSH9CcRHe7Zswpl4vWJpzJv2gGEzp7cMldVXYCg9/7x0KX3W
 vR7IxNvjou94xr2jFpVJluyk4ick6x3WbRbH9RyqgGBFHfJHvPJZBF3K4
 Ey7Vva6+BO1qOxxlopLA17dNwiZaNzGsbv32CmgJuECa0RwhcLJsV+FDt
 3gUbYXFrmDfE81F07VeNnXHRZDsWmWjoYobtvGCKqATc2/sJyE68euyoa
 6+Y2fciFlXzGdeBY1O9IvBLxCb1QSS0sSEl8w+rLytQwhK2eh/lzXAmKV
 9Cf0ffGbjwnVedfjAx3ISnQ5kq+nsPGQVCEVCTKVonGnw1iqqDDo2RTeI A==;
X-CSE-ConnectionGUID: YyazgJbnSPSbc+rpRYqCqA==
X-CSE-MsgGUID: kEdFssSSQdeX24geJjKmNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87863654"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="87863654"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 01:18:52 -0700
X-CSE-ConnectionGUID: 2gc2uCdTR/yhtBEYKURfWQ==
X-CSE-MsgGUID: t0XxwruOTzaNqHlbx/whjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="264584689"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 01:18:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 01:18:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 01:18:51 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 01:18:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoGTvbhW/t6I8t4JHzfT/Ta6Zjcs5UBoOxwisDv7DDLSfacz2iyisRRQjYZ0W+90gsXlWubwHfn4tWKlIdtwOE6qql0PsfJJOsXs4xj97pY7MA28t/9NrQKBQibEoAoVKtrQ4rryBPadGU3zd4pci6OkpVxlb6lt1E/jBv16wS6OkrTxCVhzIwKjT8SGa7SfZm3XokHzB6+RhFaUPQTrjdMBRTl5b6w4Tj2K0va88Rk1wVAYmf+9uyBD1JV6a94+PKMzA0qVCyzVyER+FMP9GRWCIWOaWjr3upZaAqS6Osv4kXdb4Aly4AVA8pc1BzJiu7phLXC24NqISWnxuPaIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beFa8GphNp+Crswxd+8EAPVN01PttNg7rET7NRFyJFY=;
 b=DPfkuj8AaDI19sdaQqUMvZ53y/km6w2rtcZV2j3g6cBxZAem5ilElYMz5kHNmjn6v9gh3XFaJdO1zBTp1G5lbThcgX1KrYIJYKEzfhxUCsneqVBLxkLhZCM8kpkqx/IbyIopcXm95jm//bmcMlt+dBx8wjB6Wg/Pad5g6nTwk+WhRdMnhyb0sb9L0HlyayAKipdHyer3jnVXK36Te3BoXHK01Npu88Ck6XrpWs39Rwd1mONuInLNKYLs9I3THMqeRD8m9xgDYic5kO3xpcEPsld+4CYFgBQQ7zXMN+LEul22JToD1r/kIaKIL/zS6p/xr3aHFz+j3dy9jUUVPgyAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by CH0PR11MB8141.namprd11.prod.outlook.com (2603:10b6:610:18a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Thu, 20 Aug
 2026 08:18:40 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 08:18:40 +0000
Message-ID: <9c06fa6d-9d23-4b78-af68-cc9743bbf5cd@intel.com>
Date: Thu, 20 Aug 2026 13:48:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/selftests: Report missing RC0 power as an error
To: Sk Anirban <sk.anirban@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20260729112446.2919206-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260729112446.2919206-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0304.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::9) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|CH0PR11MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: d522327f-0f5d-496d-b46a-08defe93a41d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ziRy1BMB8oFIee8Gfvnf/WWgWhvGCOuBkQUMRKRw6CUaQPuGl4Aliy7VvtZhToePVkVzgNWpvkQKmEldf03xFGJxQwTJIUN0as286E9sB6iDQhpSeDmSkiv1WPNS6eopDndfR9lLhnt35jM/mWe5j/zry99MfBAwHJ9Y/2rPaxAKkNfkA0qmBKqVKbZyeArbIS2RYEuwB24B3SNolhd1tup+X8fDgEPFkF8rN5N3HDFSHOoqrmRdmvZB0g6RkBF7fQQeY/7rAS370lB7kqIuzVZOyIQlc875+Pp/iwCIEbfKOLlPwjxiTeZzmAjY5XwbUQ8jvpgbDWPRaD95Thkh0hqhFShde9v+vBPSSTcoRCm8bTfEvTcd5oO6+FnlqccbuE83Jp22OsrVQ+MHyih04LkiJ5d3vvOYbdy95qhj1OjSPYRz4bGlCXI4su2NUvtfuQhALQx3qbele862lUSuPIzdQ6oCjT/8sCAikWh/IgawZH4hMTHKiUBoMX7lUWS6xFDLFBOnpiPXuWmY7t4X+ySChREcVInpl0F8qP2aCV6GfcsiSPBEG2MI3Z5o0p1P7oOBicw+8G/8JI4xbjm5efTLjbuSKb/lX/rB37omUofEyN1IOJPqYH1tvhP3Oc9YPQWwtP9ML3OrGUemPZ7+b6eiMQOVuygpYhqkUYKcuh8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXR3RTlDazd1S2lRZnFFazRXUS9QcUs5MmhyUmFsQVkyUlFsQTNOMGlEdWFJ?=
 =?utf-8?B?UXRvOHpBVklKdWNXMEorem5pb2pWMHgzKzA0Vll1S1cyRUxCMi9hT0VyUDhq?=
 =?utf-8?B?REVtNFVEL3hTLzdZSE5keVVtRitJVjJMeEpkYUpPY0JoSCtKMnZhcW8yYWJL?=
 =?utf-8?B?NFR2M1V4Y3lNeHJZeDlLVEVoTUxlaUhHUzgzMnJweTNEV2VFb1huSVVtTUlX?=
 =?utf-8?B?OFBNVjVxWnRrbzVLRGRBN1F6UDBLQlY5aEk5N1ZUVlovdlZyZmdJYUhUQlNp?=
 =?utf-8?B?L0N0OXNqNis1RldHRzdHOHJyMThPUFJ1amxtM0s2Z1NYTlRFY3loWGhsR01v?=
 =?utf-8?B?bGVzRnVLYWk3RTRvcVNRRnN2MDZnQ1p1c3REZEh5SWs3Zmt3TDAvaWJIVUIr?=
 =?utf-8?B?ek5YdTVJWllnY1JzbkxtUlhMSm1JRmtjMDE3eG1FYUV3ODd4cW5zQ2FIWFRD?=
 =?utf-8?B?Q0VKT2ZSeWtCNERhTElldE42MmNCSFFDZWJFTDZSYlROZ2Qvb3AxSXZRc2tn?=
 =?utf-8?B?THZ3RkIzb3ZESnhMemFoUnlLbVMwQVZQRUVDNFZnK3RWZHRMZFh2M2FuMXFL?=
 =?utf-8?B?eFJ3NHNzbjd2akV2UzZDV3RBaFZkb0JYQWJhdkNrWnBCZmdGNzhhT2hFVU5p?=
 =?utf-8?B?WDV1Z1hpNFZ5c09vUVZTdENDYmFGb1RoY2tTU1U0VHdTQ0VRbXBjVG9GS1lD?=
 =?utf-8?B?TGx2MTRSN0tOTVBmVnZsUk11cEg1dVB6ZXMrdW9wMmdiVEpmK3hUWTV3RkJz?=
 =?utf-8?B?MVhVaFNXb3NNTlNRSWlTc0dHcWlrb0EzcE1aSElUbGxnM1pzY1ZCdG5HR0RE?=
 =?utf-8?B?NEZ1MmtpODNFcnJ1OGE0M3d3NzhudE9RZE1pcitDYk91aUp3VWFScFNiMFo0?=
 =?utf-8?B?RWpOOXRDd1cyZ3luVU9qSWZlL0VOQSt6blBPdDJldFFlRm92VjkzcTY1WWdv?=
 =?utf-8?B?SHVaVGRWTkV4R3lBSmdKRDNXVnF6R0ZzajVhWjRxOFRNR2F3UkFpWUpWSDVY?=
 =?utf-8?B?RmZaNUMvZGQ0UEh2QWJpam8rVml6NGNSd3VkVWdDT0ZaRzhJbFJFZVF4RFNu?=
 =?utf-8?B?aU9vZTZVRXphV01ZYU1mQUY1S0xWMjB6T3k3cjdSZkNpdUR5bCtVUGIxSGo1?=
 =?utf-8?B?UWdkeE9LZ250Z1hmR3ZqbEFzK01PODh5N1ArVzZKNnRacExGK2xWajYyQy96?=
 =?utf-8?B?OUZjZGViY204eTl6a1JDclQ2NHAvV09KQ1FWOG1OcGRna3pENW0yU1JUNzVz?=
 =?utf-8?B?ZGczb1ljeXEyNmZReDkwZ21hMlRMVUNUZTRTTzJNd3VKOGtUUC83SGFQUXFi?=
 =?utf-8?B?V2FZK0dtTmtkSnBuSi94Y2MwRG1mVERUdkRodHlaNFJvQS91Z3J0a1VKL291?=
 =?utf-8?B?MEw3Vkg5RXpMcjJYcmIyQVArSk1RR0xHS1V0RHpsa3NSUDB4ZitUU0VoVTB1?=
 =?utf-8?B?SDVwUnBLZG1NRC94dnZVdlBuaDRpZS9ScnVWZFhGV0FBQjJpcEFDT0VoSCty?=
 =?utf-8?B?SXVPREhSRnNROXl2MUtZbFVyYXBaOE5ZSk11RGtGeVN6aTlEcW9nNktIVHR5?=
 =?utf-8?B?QXZNaWNJVmxlRnFBK0tWK1pXQWxyYlZXVENvRFBEUVZCSzZTMWV5VUxkVHVu?=
 =?utf-8?B?WmRzNWdCRmVsbWhtVXJlcE9MU0VxY3JFNmJVdkx5Z2srY3lLUjZwVGFxRUhP?=
 =?utf-8?B?dVY2NTlwQk9SRVRPRDBNU0daK3VaR1RocTkrV2ozM3liUE9WZkJpUmJuSlkr?=
 =?utf-8?B?ZlU3OXM4Q2hlQ256dWFlbmc0TWtMT1RXdFhCaFRmOS9ySWNqTHlPakJXNm9u?=
 =?utf-8?B?Wk9CYjkwWlVDMC9uMUhFZHVlVzdhdW9YVUJBdE5JSTJjTjUybGRHRjZLVVEy?=
 =?utf-8?B?L0xrSyt0aTdnSzI0ZHZrcGdtelBNR2R4SzlDTkVoTFF6NHYxeEVXTkR4MDl3?=
 =?utf-8?B?d3luTldEM2JHbU5QZTlOK21ac3UvOTVXNUdGWFZ1bHdSNFhpeWhnTmxvL3JN?=
 =?utf-8?B?cElwLzZGWUQ4RkgzLzB1cWd6TXFCT000R2FPVGQzKzlVOGgzUVNFcmVRQW1S?=
 =?utf-8?B?RmlPNWNSd0krNE1QTUJtNWRGaXhTY1AyaXhlVElENW5sYkNFcGVndVYxTWRR?=
 =?utf-8?B?ZHAxU25UclNDbHBLMmppTmJTNUI2TUtPK3liRmpuazBxSHRNRVBnQWhTUmJS?=
 =?utf-8?B?Qm5KOTVIbEpFeEh2QzBHeXErZ2hwMmhiMlhoQUxGemZVNHZxbVAvWCt5YzdZ?=
 =?utf-8?B?OXhqcW5kZCszak8rVFNGaFI5SHdncUhJSGk2ckdWbU5MNURCTVhMRDhpOUt0?=
 =?utf-8?B?NFFsWXl0KzlUaXo3VFlXc3FQczlDc28xMUo2eDlFZ25SdDhEZ1BRdz09?=
X-Exchange-RoutingPolicyChecked: CJtgg4SufBPaYekpzk4JXyU45Xnu0LqOQZ9iBIYr2dY6tEVNZnH5u2biL66OMFizhueRLnPlfS67CswIl7+y/wd/Fxaj7PDQew6SqHGVH1VZ9gm/S3mUcmETZ7x67TFdsS4S/yb2lBCAAsfeY2V8V//dCt0TuADHmsxwjin2GvXYpQoRRwon1MKlik4ahIUebTyRimt6HMsKYKfj6vaaiMpjMS8SiY9k/mOZ6tnCedkzk+jaQIlub0n4SBlQOX3DtK/FxBpE0IFgPQl3nHUGvkMHIyfy3007lrjBgkGXqZzEq6rifwbp33H3jZVgb3ecRQgKkQ6BqZ8c+nMUwHcqBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d522327f-0f5d-496d-b46a-08defe93a41d
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 08:18:40.3341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9oPdHx+0HGCmZNRaeuasEHT/VLH8O0rv1FuMWqM4Qt2DRBUhqH1ZFNqGZnTdipu+P1FjNt/CC33uG1NX50nOvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8141
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


On 29-07-2026 16:54, Sk Anirban wrote:
> The RC0 no-power case is a hard failure (-EINVAL); log it via pr_err
> instead of pr_debug so it is captured in default kernel logs.
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/selftest_rc6.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/selftest_rc6.c b/drivers/gpu/drm/i915/gt/selftest_rc6.c
> index 90f30b988d68..68fb1830d411 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_rc6.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_rc6.c
> @@ -92,8 +92,8 @@ int live_rc6_manual(void *arg)
>   
>   		if (!rc0_power) {
>   			if (rc0_freq)
> -				pr_debug("No power measured while in RC0! GPU Freq: %uMHz in RC0\n",
> -					 rc0_freq);
> +				pr_err("No power measured while in RC0! GPU Freq: %uMHz in RC0\n",
> +				       rc0_freq);

Looks good to me.

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

>   			else
>   				pr_err("No power and freq measured while in RC0\n");
>   			err = -EINVAL;
