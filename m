Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4184C88E42
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Sep 2026 06:45:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495BB10F4E5;
	Fri, 11 Sep 2026 06:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4FP2TSS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A0710F4E5
 for <intel-gfx@lists.freedesktop.org>; Fri, 11 Sep 2026 06:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789109143; x=1820645143;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0hV08EXWwQXuqv2PuAnZVgd7bwQr8onS4Vf1yFVwxG4=;
 b=Q4FP2TSSWbbZ9ePcAzdAxaRKPlokcaBU7Ir8PI/w7aDzFfg//8g3mrnM
 5BHAi/M+QqOfXQaqLfsfJjfCMSFKWY9W+oMKD5ZNvgaR5CdbB5JS0FNSf
 PuarasK1pux9HpQ4Q9L0ROYU1i/QO70gKHYK0u94hOb6hkBaeQfhjO2ir
 CgtMbpDhX9u8G2Ur0dOrtbellx3OkHqPHDMyrnHlVKPoOtM+RXW0QbtQ2
 vqs7pbdlaf6/0iuEcXXZ5qUNxx62US2qT91MCzpU1Gle0A9X/1wKSKWmg
 2WtowsZ3qrqVZJSchUJxgNVO9Sz3/OE8ba9ZEmGZSDrqaL9/PKd1PSqlj A==;
X-CSE-ConnectionGUID: Sm9L30h/SkajT0neRQS3uQ==
X-CSE-MsgGUID: aOCYaFouQSWGfbBmXBGU2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="79916"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="79916"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 23:45:37 -0700
X-CSE-ConnectionGUID: 5szuDJm8S/Ootc8meDR6Qw==
X-CSE-MsgGUID: UoUnfW62TEyZwc3zdWnBYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="142891"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 23:45:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 23:45:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 23:45:36 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 23:45:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgfFzEqYrgf0bXIkxLUCBDfKCDzZre35ypxoraAOMPZmSt1LUBGWiliat9OfVtFUxVFJWG9eUgRxtZ7BeDGezM9AJZamN3UtnNNkXZMV9rn86/yRpStRvniXyDBIJitRZcVSuiPKXf4s4k2JAlzbbEsP6i7PIe/M14bhigR7EhWEK6ol2EPnj2JWIJ2MIhK6Vy8159MJ3JuNlSJiIn/ij+2GQtUIDmmVfNW9SfY8L5ZAI/PJCCCbxDYZvQ8Pkf/R9SD70pBwQAiSalVPowo3bzcKeWBbEI7LHX3ES8Tf/4unxoee8s/CkHF2G2j1dcRL6+0TCK03FVFDJ0WSx9iCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfH+ncEN/bauZoPIzhbuncQEWSSGpn+FTWDaWuz3kx8=;
 b=yGoT1fu+Du9c9dgz5QvzrMly+SYqb8cgRHRtarFYdLJdnE8YahP0Wo+KuAwXkT3fujwme6x5H++UYiuibov3BAKxvLqgTaK26MACcBiPBl+fVTFM4zqPb174vigKRylQT6sLvt0xLQ4jvpckFtFQWDRLyHnuRYNJxikC9ZZwsZPKznf7Cy/owspKrS/UWYL3ow/xwQPdFn7Mdb/PKPJ0UmQptnRx4kC1tUw8J6kHi7T1Goi+sEReJjsLdsT4yNFlmwR3jJDBJYeiPGUOiAt0ieBMTsU6lGfQzgf3jkeyRd4ZaiSjem9wMfDY6yF8JPx2nyHqGQgSKmxsoLkNTQcFPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by LV3PR11MB8532.namprd11.prod.outlook.com (2603:10b6:408:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 06:45:30 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 06:45:29 +0000
Date: Fri, 11 Sep 2026 06:45:20 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 drm/i915/gt: Unmask interrupts only when ACTIVE is true
Message-ID: <cvk7ja2j2wsio4bucxidafe6v47gtgw65siydrtycnc44fzenq@yl2f4bajb2pm>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260910081329.3300417-1-krzysztof.karas@intel.com>
 <178907891272.148519.17122674309201812250@61270ab9df2a>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <178907891272.148519.17122674309201812250@61270ab9df2a>
X-ClientProxiedBy: DU6P191CA0027.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::27) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|LV3PR11MB8532:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee3856a-f48a-45a0-4b95-08df0fd044f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|6133799003|3023799007|18002099003|22082099003|4143699003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: 6kUg1cpeiwEMro5DrW0xZn7RU9azNajxlnQvambqBykUIyiygIVCS+gJqlWS6KH/f+wiaGnEAnsVAyqsX3najVPvQcV2MR5P/5Y0Lv2FOda1+iuVBnZsuhtL2vzM41Br/4zDJ9/dneVtaIErypuXCFvmiviPplvyGjOhSE30SEI0yayXEecpR8lk/BJq9QeWmCXntWloGjoEbXv1GixahvB0xtHk57pjkQImcAKZfAlJecMUNg8Ea5da29lIowWeqLwg7U1/Sq2fPBoS1HC6jMdaaewBtFRcetBOSfjVPsPlLnchtjX2t8yewqAd6IaXSnr4qoaYX2CYSGyfc1WQ3da6Hl+Mce4/+l3l6jpLa8rOP5OHa0n7AMaaLvgLr8d7ez4skR8bQsPGR5QG3kGM7eJD3eGhO9DYDP1HYF2kpOdflyLsfq4WuGj0Jdo0EObeP0LqG56H0jubj8YQIrHRCiUOxagaGCP2PpG4kR0ugvgbcXVf7lYrak5DjTldFO7d9fFxwND4+5L2GlPICM7W35oivw6BK0njM9SSCiRwKz2YtSRaFD8WFKxbLJUUCqyZGBSyr4IOTi3HfBkehKwwrxeW10GtrOFW7KdrDwillug=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(4143699003)(11063799006)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU1HSElJZW9WeEtqWEtFTTg4S1BNaVgxa3ZlcWtrS2pRcjZJMkxvOG1vb3VO?=
 =?utf-8?B?T1h0N3E4UWgrQWw4U080Z05oVGdKU3J3SUtTV0tOVE16eWJSN25wZHVrZld0?=
 =?utf-8?B?UERUK2tnK3FCT0FUcmxvRTNOdmRZMU1SVERzcHhoVGpFUXh5a2djZ1l6Nmti?=
 =?utf-8?B?R1I2OXg2UjVUc2phYURMZStlZU1rOEdtTG1wWVlQbEdEOWJ0cHNmYmZ1QzlT?=
 =?utf-8?B?TVM0Sm9JcEVmZkV0clFhUnlrK3VPZzZSOVNlZDZkQjErTWczOGVnMXA5MGpq?=
 =?utf-8?B?N2xVSk51U0VkcDN3c3B2Z1NtSzl3QVlxQUdiTkNleUFYaEw2R0FobXV1Nkhj?=
 =?utf-8?B?YmU2M3RwZUllOGc0clBubGo1REtFdnJ1UUl3RlZQOEo4elZpL080SnhtSEUv?=
 =?utf-8?B?TkFrVGZnZXVrNEFrYnJZRFduZzdTZEtTcXI1bW1VN01YSTVEV0xpdktTK3I1?=
 =?utf-8?B?bzdkR3ZIbEJwNFRnYmduVzErQkQ4djRpQ3pjNTNkdTlWSFMxVHUyeHV4R0ZZ?=
 =?utf-8?B?UW1VVldYdWZGbVJrd3FVUFBJS3VFcXF6QzRMdFYrUGhtKzR6bVZ4ekxySFVH?=
 =?utf-8?B?Yk1FaUdWWm1DcXNZOXdCMm12bGg2ZWMzV2pHakZVS21LTUdITUFVbHBEcm9w?=
 =?utf-8?B?SVFCVll2MlM3eThNWUdPWFk1U20xWFRLSVE2VEp4MlZIRlpBL243bTZWaTg3?=
 =?utf-8?B?d3Y1eTNueTREVCtzQmJaZzc3VkZaek5zZElUUnBTL1hmN1YyUTFjTUFQcURp?=
 =?utf-8?B?M0lMb3BEMEpFZGhSdk1maWlTS3QxWDRTRGJuaTkrSVJhcm1pQXR1eUdoVzNq?=
 =?utf-8?B?MVBzOG5NL2p0WmtDanhNREZpbmtLUVVLWGZydUtmMzVsTElVaDUxTmxVZk5a?=
 =?utf-8?B?Q3hqaDdubjlFWXhwNStndFUvU0RYOWFudTFpZzcxUzNnMkV2VG5pdVdUNlNG?=
 =?utf-8?B?elg0MXJYdFdtYUZlTzVvcE1qOStoUnBmTTJ4eFMrSVFtTDRJallLLzdvQVg0?=
 =?utf-8?B?enNFaW90VnZGbVBQQWF5bU94Q0t6ak5sdVNjMGsySWZ6Y0VCV01DUHlha0lh?=
 =?utf-8?B?SmNuak5abmZ4Vk92TWl4M2NFNkNyNkNhZURqTnRsaFlZLzdsWnVSUGxzNmgz?=
 =?utf-8?B?YnBlREMrT0N1R0psbkJQWUZRdHJjRjZhT2UvTFVsaW5USVJ5bUlyeTJIZFFp?=
 =?utf-8?B?aGcwOWJtTm1xLys1VUlRSEpuWmlvQWx5dTVEM1owRDdvNVhDbFJHMmFTQlJN?=
 =?utf-8?B?SXd1V1NBZk9hQnJrWFQySEhYL3lJeDFCS2hmOVVWZ0pNam1QNitnS2E2Zm42?=
 =?utf-8?B?aVNXV2pmSlEvTGNEU0psNEc1VmZuTm4zSnlkQW9OTjdEK0dHZXlCUFg3ai9r?=
 =?utf-8?B?c29CWnFiWEUxYkNuaWtIQWN3eUhURWM3YnNWM1cyVXBNMW85TGpBQWFKanE2?=
 =?utf-8?B?SGMzRUw5SGdMWXM3ZUxiNys1ZHFucDhOd2hORTk2VWkxand1bmo1cjQ3dEVy?=
 =?utf-8?B?dVBtMDdaYjcyNksyTFl1bDB0SmI5UndiaVJlNkhLd05pV1E1ZUFML2R3Y3BV?=
 =?utf-8?B?aVE3WUxTZnlLTDV2aElaNURzeXNydjVNK2lUaU15d3I2Um41UjBxMFRMUzZI?=
 =?utf-8?B?Z1NYWmlyQmQyejNsUVRRaDVXelliU2prdldjdHl6RDR3MzM2VHBsMFEvZWsz?=
 =?utf-8?B?U25MZFUySnhJVUhNOHdDRDJJSnZXMCtlUEwwUS9ORDRxa1BvcWpWVm1KTlVh?=
 =?utf-8?B?akZlb2RkLzdCaVBMVlZWV3NJSzJkQW5wVFVrYkZQRTVtZ0J5dzA0QjYycGI1?=
 =?utf-8?B?Nmc2OHJSKzAxUEZPbGJpL0tVT2NCUkZKZlpSeEJDK2Faa1VQMy8yWitzZnh3?=
 =?utf-8?B?ZjIyUVFaUWhDRWJsSzFVS09EcGpZY0pjSDg0SVhwQk1xZkFDVDJSbTJTTVV4?=
 =?utf-8?B?M01yUXc5WDMvSlBqenZIQ1g4ZWFUa3p4OHpQSnMwQVBndXZiTFRLa2MvbGpF?=
 =?utf-8?B?RnBBQy9UeEk0dGJCVENBRmVsOGlrL3k4RE1kVVZsNGJjNlpjcFNGd0xkalJC?=
 =?utf-8?B?Q2lsOE1zdjFwdzJSWFR0TXNiVUFsRS9ndUxVeTUxN1FpemR3L3JWSndHVkxQ?=
 =?utf-8?B?THM2N3U4Y2tyY0V3N0F0RktNZFlLc21WeFFQZVRndFVrb1ZDSHYwT3gxN3dW?=
 =?utf-8?B?dTFuZXo3UmZodk5DRWw2MlNKTGk0eUJoU1gzRmd4bnJYK1JkbmlXMWMzTEJi?=
 =?utf-8?B?dVRzYkVndWZnbmVlckJob3paQzNHeVBobGFhU2lkZVlOVGVnWVhTR2NpKzBz?=
 =?utf-8?B?SENMUVU2N2pWWkh6QmZiMXdNODJLQ3hzekNVb1FHVTlLTnpnZzZPUS9RNTN6?=
 =?utf-8?Q?crH4BNpArkVBabhs=3D?=
X-Exchange-RoutingPolicyChecked: hfl3itkmXYCRxf7delVn3BJY3W3l2dDM67eEcJ/9m9bThsbmWJE7mSCVdnuIoW1YNpmHcShp/cMZbLkIqeCU/LNv4ARfUe0D9o/UJCB+62NF1sPVrnmXPtINiSE2SeIiBcMRoKpvfOHjHau5KcgiCBi5DDngKuDga7eWZ7K8k7AAWejZBCwCvHnLQOlZ3WmSPeoVYsn3izskg0XznaL/2oNcU3dnbV3E3MFwyYP43uwtYzaiV7BG4BjxtBbiBuzjq94jXFzPyKhUdkU1j5gYKfJXXrLeTUDr8ZY+SGuilZB3nFeLB7nEP6IQ16fiw/hEEJZwNSlyz4FOM9WX7nzZaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee3856a-f48a-45a0-4b95-08df0fd044f9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 06:45:29.8522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uy8AXba13hJztHud9hOc8NpaIQV256cWsp/o6Nyb9dvNsls+0luyg0AWFNnTCKkBmxOvrNNZmCN7IhwpzsTa5WYjX8V8f7PcGI/EgNHQAfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8532
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

Hi CI-infra Team,

below issues are not caused by the change in my patch.
Please re-report.

On 2026-09-10 at 22:21:52 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/gt: Unmask interrupts only when ACTIVE is true
> URL   : https://patchwork.freedesktop.org/series/173760/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_19115_full -> Patchwork_173760v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with Patchwork_173760v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_173760v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (11 -> 10)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_173760v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][1] +3 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-mtlp:         [PASS][2] -> [INCOMPLETE][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-mtlp-3/igt@kms_fbcon_fbt@psr-suspend.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-3/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@d-hdmi-a3:
>     - shard-dg2:          [PASS][4] -> [FAIL][5] +1 other test fail
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-dg2-7/igt@kms_flip@wf_vblank-ts-check@d-hdmi-a3.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-8/igt@kms_flip@wf_vblank-ts-check@d-hdmi-a3.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_173760v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#8411])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>   * igt@gem_bad_reloc@negative-reloc-lut:
>     - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#3281]) +7 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html
> 
>   * igt@gem_ccs@block-copy-compressed:
>     - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#3555] / [i915#9323])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-4/igt@gem_ccs@block-copy-compressed.html
> 
>   * igt@gem_ccs@ctrl-surf-copy:
>     - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#3555] / [i915#9323]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-5/igt@gem_ccs@ctrl-surf-copy.html
> 
>   * igt@gem_ccs@ctrl-surf-copy-new-ctx:
>     - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#9323])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@gem_ccs@large-ctrl-surf-copy:
>     - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#13008])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@gem_ccs@large-ctrl-surf-copy.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#9323]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_close_race@multigpu-basic-process:
>     - shard-tglu:         NOTRUN -> [SKIP][13] ([i915#7697])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-5/igt@gem_close_race@multigpu-basic-process.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#7697])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#6335])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#8562])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-2/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_persistence@engines-mixed-process:
>     - shard-snb:          NOTRUN -> [SKIP][17] ([i915#1099]) +2 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-snb6/igt@gem_ctx_persistence@engines-mixed-process.html
> 
>   * igt@gem_ctx_persistence@hang:
>     - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#8555])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@gem_ctx_persistence@hang.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-tglu-1:       NOTRUN -> [SKIP][19] ([i915#280])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#280]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-2/igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_eio@kms:
>     - shard-tglu-1:       NOTRUN -> [ABORT][21] ([i915#16837])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@gem_eio@kms.html
> 
>   * igt@gem_exec_balancer@bonded-true-hang:
>     - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#4812]) +3 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@gem_exec_balancer@bonded-true-hang.html
> 
>   * igt@gem_exec_balancer@parallel:
>     - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#4525]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@gem_exec_balancer@parallel.html
> 
>   * igt@gem_exec_balancer@parallel-out-fence:
>     - shard-tglu-1:       NOTRUN -> [SKIP][24] ([i915#4525])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@gem_exec_balancer@parallel-out-fence.html
> 
>   * igt@gem_exec_fence@submit67:
>     - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#4812])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@gem_exec_fence@submit67.html
> 
>   * igt@gem_exec_flush@basic-wb-rw-default:
>     - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#3539] / [i915#4852])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@gem_exec_flush@basic-wb-rw-default.html
> 
>   * igt@gem_exec_reloc@basic-range:
>     - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#3281]) +7 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@gem_exec_reloc@basic-range.html
> 
>   * igt@gem_exec_reloc@basic-write-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#3281]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@gem_exec_reloc@basic-write-gtt.html
> 
>   * igt@gem_exec_suspend@basic-s0:
>     - shard-rkl:          [PASS][29] -> [INCOMPLETE][30] ([i915#13356]) +2 other tests incomplete
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-7/igt@gem_exec_suspend@basic-s0.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@gem_exec_suspend@basic-s0.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#4860]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
> 
>   * igt@gem_lmem_swapping@massive-random:
>     - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#4613]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@gem_lmem_swapping@massive-random.html
> 
>   * igt@gem_lmem_swapping@parallel-multi:
>     - shard-tglu:         NOTRUN -> [SKIP][33] ([i915#4613]) +3 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-5/igt@gem_lmem_swapping@parallel-multi.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][34] ([i915#4613]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - shard-glk:          NOTRUN -> [SKIP][35] ([i915#4613]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk6/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@gem_lmem_swapping@verify:
>     - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#4613])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-2/igt@gem_lmem_swapping@verify.html
> 
>   * igt@gem_lmem_swapping@verify-random-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#12193])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@gem_lmem_swapping@verify-random-ccs.html
> 
>   * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4565])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html
> 
>   * igt@gem_media_vme:
>     - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#284])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@gem_media_vme.html
> 
>   * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
>     - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#4077]) +4 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
> 
>   * igt@gem_mmap_gtt@medium-copy-xy:
>     - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4077]) +8 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@gem_mmap_gtt@medium-copy-xy.html
> 
>   * igt@gem_mmap_wc@coherency:
>     - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#4083]) +4 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@gem_mmap_wc@coherency.html
> 
>   * igt@gem_mmap_wc@invalid-flags:
>     - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4083]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@gem_mmap_wc@invalid-flags.html
> 
>   * igt@gem_partial_pwrite_pread@reads-uncached:
>     - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3282]) +3 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@gem_partial_pwrite_pread@reads-uncached.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-glk:          NOTRUN -> [WARN][45] ([i915#2658])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk6/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pread@uncached:
>     - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#3282]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-4/igt@gem_pread@uncached.html
> 
>   * igt@gem_pxp@hw-rejects-pxp-context:
>     - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#13398])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-5/igt@gem_pxp@hw-rejects-pxp-context.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-1:
>     - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4270]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-off-1.html
> 
>   * igt@gem_readwrite@beyond-eob:
>     - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#3282]) +2 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@gem_readwrite@beyond-eob.html
> 
>   * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#8428]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html
> 
>   * igt@gem_userptr_blits@coherency-sync:
>     - shard-tglu:         NOTRUN -> [SKIP][51] ([i915#3297]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@gem_userptr_blits@coherency-sync.html
> 
>   * igt@gem_userptr_blits@dmabuf-unsync:
>     - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3297]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>   * igt@gem_userptr_blits@forbidden-operations:
>     - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#3282] / [i915#3297])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@gem_userptr_blits@forbidden-operations.html
> 
>   * igt@gem_userptr_blits@readonly-pwrite-unsync:
>     - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#3297]) +2 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>   * igt@gem_userptr_blits@unsync-overlap:
>     - shard-tglu-1:       NOTRUN -> [SKIP][55] ([i915#3297])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@gem_userptr_blits@unsync-overlap.html
> 
>   * igt@gen3_render_tiledy_blits:
>     - shard-mtlp:         NOTRUN -> [SKIP][56] +10 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@gen3_render_tiledy_blits.html
> 
>   * igt@gen9_exec_parse@batch-zero-length:
>     - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#2527] / [i915#2856]) +5 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-5/igt@gen9_exec_parse@batch-zero-length.html
> 
>   * igt@gen9_exec_parse@cmd-crossing-page:
>     - shard-tglu-1:       NOTRUN -> [SKIP][58] ([i915#2527] / [i915#2856]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@gen9_exec_parse@cmd-crossing-page.html
> 
>   * igt@gen9_exec_parse@shadow-peek:
>     - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#2527]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.html
> 
>   * igt@gen9_exec_parse@valid-registers:
>     - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#2527]) +3 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@gen9_exec_parse@valid-registers.html
> 
>   * igt@i915_drm_fdinfo@busy@rcs0:
>     - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#14073]) +5 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@i915_drm_fdinfo@busy@rcs0.html
> 
>   * igt@i915_drm_fdinfo@virtual-busy-hang-all:
>     - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#14118])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@i915_drm_fdinfo@virtual-busy-hang-all.html
> 
>   * igt@i915_module_load@fault-injection@intel_connector_register:
>     - shard-tglu:         NOTRUN -> [ABORT][63] ([i915#15342]) +1 other test abort
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-8/igt@i915_module_load@fault-injection@intel_connector_register.html
> 
>   * igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:
>     - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#15479]) +4 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-8/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html
> 
>   * igt@i915_pm_freq_api@freq-basic-api:
>     - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#8399])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-2/igt@i915_pm_freq_api@freq-basic-api.html
> 
>   * igt@i915_pm_rc6_residency@media-rc6-accuracy:
>     - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#16080] / [i915#16166])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle:
>     - shard-tglu-1:       NOTRUN -> [SKIP][67] ([i915#14498])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>   * igt@i915_pm_rps@thresholds-park:
>     - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#11681])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@i915_pm_rps@thresholds-park.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-tglu-1:       NOTRUN -> [SKIP][69] ([i915#6245])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@i915_query@hwconfig_table.html
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-tglu:         NOTRUN -> [SKIP][70] ([i915#16109])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@i915_query@query-topology-known-pci-ids.html
> 
>   * igt@i915_query@query-topology-unsupported:
>     - shard-tglu-1:       NOTRUN -> [SKIP][71] ([i915#16079])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@i915_query@query-topology-unsupported.html
> 
>   * igt@i915_query@test-query-geometry-subslices:
>     - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#5723])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html
>     - shard-tglu:         NOTRUN -> [SKIP][73] ([i915#5723])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-4/igt@i915_query@test-query-geometry-subslices.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - shard-rkl:          [PASS][74] -> [ABORT][75] ([i915#15131]) +1 other test abort
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@i915_suspend@basic-s2idle-without-i915.html
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-1/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@i915_suspend@debugfs-reader:
>     - shard-glk11:        NOTRUN -> [INCOMPLETE][76] ([i915#16182] / [i915#4817])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk11/igt@i915_suspend@debugfs-reader.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#7707])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#7707])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-5/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_addfb_basic@clobberred-modifier:
>     - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4212])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_addfb_basic@clobberred-modifier.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#12454] / [i915#12712])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - shard-rkl:          [PASS][81] -> [INCOMPLETE][82] ([i915#12761])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-2/igt@kms_async_flips@async-flip-suspend-resume.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_async_flips@async-flip-suspend-resume.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][83] ([i915#12761])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
>     - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#5286]) +5 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-5/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4538] / [i915#5286])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#5286]) +3 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html
>     - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#5286]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         [PASS][88] -> [FAIL][89] ([i915#15733] / [i915#5138]) +2 other tests fail
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-tglu-1:       NOTRUN -> [SKIP][90] ([i915#5286]) +2 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#3638]) +2 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#3828]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3828])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#3638]) +1 other test skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4538]) +4 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
>     - shard-glk10:        NOTRUN -> [SKIP][96] +78 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk10/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#6095]) +19 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#10307] / [i915#6095]) +71 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#14098] / [i915#6095]) +35 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-5/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#14544] / [i915#6095]) +2 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#14098] / [i915#14544] / [i915#6095]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#6095]) +122 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#12313])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
>     - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#12313])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#12805])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#6095]) +7 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][108] ([i915#15582]) +1 other test incomplete
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][109] ([i915#12313])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#12313])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#6095]) +109 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#6095]) +44 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][113] ([i915#12313])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#12313])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#6095]) +58 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-glk:          NOTRUN -> [SKIP][116] +103 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk6/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#3742])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#17016]) +3 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-8/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_chamelium_audio@dp-audio-after-suspend:
>     - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#11151])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-2/igt@kms_chamelium_audio@dp-audio-after-suspend.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
>     - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#11151])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-edid:
>     - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#11151] / [i915#7828]) +6 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_chamelium_audio@hdmi-audio-edid.html
>     - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#11151] / [i915#7828]) +13 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-10/igt@kms_chamelium_audio@hdmi-audio-edid.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
>     - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#16471]) +1 other test skip
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
>     - shard-tglu-1:       NOTRUN -> [SKIP][124] ([i915#16471])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
>     - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#16471]) +1 other test skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
>     - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#16464] / [i915#16471])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
>     - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#16471]) +2 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-2/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
> 
>   * igt@kms_chamelium_frames@dp-frame-dump:
>     - shard-tglu-1:       NOTRUN -> [SKIP][128] ([i915#11151] / [i915#7828]) +2 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_chamelium_frames@dp-frame-dump.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#11151] / [i915#7828]) +1 other test skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#11151] / [i915#7828]) +3 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-fast:
>     - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#11151] / [i915#7828]) +6 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-fast.html
> 
>   * igt@kms_content_protection@atomic-dpms-hdcp14:
>     - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#15865])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_content_protection@atomic-dpms-hdcp14.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#15865]) +1 other test skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-hdcp14:
>     - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#15330]) +1 other test skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
>     - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#15330])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
>     - shard-tglu-1:       NOTRUN -> [SKIP][136] ([i915#15330])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
> 
>   * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
>     - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#15330])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-4/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-tglu-1:       NOTRUN -> [SKIP][138] ([i915#15865])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#15865]) +2 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#13049]) +3 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x10:
>     - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#3555]) +1 other test skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [FAIL][142] ([i915#13566]) +1 other test fail
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#13049])
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-64x21@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [FAIL][144] ([i915#13566])
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-8/igt@kms_cursor_crc@cursor-random-64x21@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#3555]) +3 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#3555]) +3 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#13049])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][148] +76 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#4103]) +2 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-dg1:          NOTRUN -> [SKIP][150] +47 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>     - shard-tglu-1:       NOTRUN -> [SKIP][151] ([i915#9067])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#9723])
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
>     - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#9723])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#9723])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#1769] / [i915#3555] / [i915#3804])
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#3804])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#13749])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#13749])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#13707])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
>     - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#16867])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
>     - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#16361]) +6 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-5/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#16361]) +1 other test skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:
>     - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#16361]) +1 other test skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-4/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
>     - shard-tglu-1:       NOTRUN -> [SKIP][164] ([i915#16361]) +1 other test skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
>     - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#16361])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#16680]) +1 other test skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
>     - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#16680])
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-4/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#16081])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#16599])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@hdr:
>     - shard-rkl:          [PASS][170] -> [SKIP][171] ([i915#16600])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-1/igt@kms_feature_discovery@hdr.html
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-5/igt@kms_feature_discovery@hdr.html
>     - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#16600]) +1 other test skip
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_feature_discovery@hdr.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#658])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#658])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-5/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>     - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#3637] / [i915#9934]) +2 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#3637] / [i915#9934]) +10 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop:
>     - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#9934]) +3 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
>     - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#9934])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][179] ([i915#12745] / [i915#4839])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][180] ([i915#12745])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#9934]) +7 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>     - shard-tglu-1:       NOTRUN -> [SKIP][182] ([i915#3637] / [i915#9934])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check.html
> 
>   * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-hdmi-a1:
>     - shard-tglu:         NOTRUN -> [ABORT][183] ([i915#16866] / [i915#16876]) +1 other test abort
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>     - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#15643]) +7 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>     - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#3555] / [i915#8810] / [i915#8813])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#8810] / [i915#8813])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#15643]) +1 other test skip
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
>     - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#15643]) +1 other test skip
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#15643]) +1 other test skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>     - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#15643])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#15990] / [i915#8708]) +12 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
>     - shard-tglu-1:       NOTRUN -> [SKIP][192] +54 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#1825]) +3 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#5439])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-pwrite:
>     - shard-glk:          [PASS][195] -> [SKIP][196] +16 other tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-pwrite.html
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#15989]) +14 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html
>     - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#15989])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
>     - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#15989]) +11 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#15991]) +17 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][201] +139 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary:
>     - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#15989]) +7 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:
>     - shard-rkl:          [PASS][203] -> [SKIP][204] ([i915#15989]) +14 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][205] ([i915#16056] / [i915#16593])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
>     - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#10055])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#15104] / [i915#15990])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#15990] / [i915#8708]) +1 other test skip
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite:
>     - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#15991] / [i915#1825]) +13 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
>     - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#15102]) +21 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#5439])
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#15102]) +21 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#15990]) +27 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#15989]) +28 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-onoff:
>     - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#15991]) +4 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-4/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-suspend:
>     - shard-glk11:        NOTRUN -> [INCOMPLETE][216] ([i915#16056] / [i915#16593])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk11/igt@kms_frontbuffer_tracking@hdr-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#9766])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#15102]) +32 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
>     - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#15102]) +63 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#15990] / [i915#8708]) +2 other tests skip
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#15991] / [i915#5354])
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#15102]) +1 other test skip
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#15990]) +2 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-farfromfence-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#15990]) +9 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_frontbuffer_tracking@psrhdr-farfromfence-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite:
>     - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#15989]) +11 other tests skip
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-rkl:          [PASS][226] -> [SKIP][227] ([i915#16644] / [i915#3555] / [i915#8228])
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-1/igt@kms_hdr@bpc-switch.html
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#12713])
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#16644] / [i915#3555] / [i915#8228])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-5/igt@kms_hdr@invalid-metadata-sizes.html
>     - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#3555] / [i915#8228]) +1 other test skip
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#3555] / [i915#8228]) +1 other test skip
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-5/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-tglu-1:       NOTRUN -> [SKIP][232] ([i915#3555] / [i915#8228])
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#15460])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#13688])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-6/igt@kms_joiner@basic-max-non-joiner.html
>     - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#13688])
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#15458])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#15460])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#15459])
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#15458])
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#15458])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#15638] / [i915#15722])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#15815])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][243] ([i915#12756])
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#14712])
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
>     - shard-tglu-1:       NOTRUN -> [SKIP][245] ([i915#15709])
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
>     - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#15709]) +4 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
>     - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#15709]) +1 other test skip
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-5/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
>     - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#15709]) +3 other tests skip
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
>     - shard-tglu-1:       NOTRUN -> [SKIP][249] ([i915#16386]) +1 other test skip
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html
> 
>   * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
>     - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#16112])
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-4/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
>     - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#16112])
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#11614] / [i915#3582]) +1 other test skip
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#13958]) +1 other test skip
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-2/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#6953])
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
>     - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#15329]) +3 other tests skip
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
>     - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#15329]) +4 other tests skip
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#12343] / [i915#5354])
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-4/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-tglu-1:       NOTRUN -> [SKIP][259] ([i915#12343] / [i915#9812])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#12343] / [i915#9812]) +1 other test skip
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-4/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc5-pageflip-negative:
>     - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#9685])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_pm_dc@dc5-pageflip-negative.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#3828])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_lpsp@screens-disabled:
>     - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#8430])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-2/igt@kms_pm_lpsp@screens-disabled.html
> 
>   * igt@kms_pm_rpm@cursor:
>     - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#4077])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-6/igt@kms_pm_rpm@cursor.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#15073])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-5/igt@kms_pm_rpm@dpms-non-lpsp.html
>     - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#15073])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-dg1:          [PASS][267] -> [SKIP][268] ([i915#15073])
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp.html
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-rkl:          [PASS][269] -> [SKIP][270] ([i915#14544] / [i915#15073])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#15073])
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-dg2:          [PASS][272] -> [SKIP][273] ([i915#15073]) +1 other test skip
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_pm_rpm@package-g7:
>     - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#15403])
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_pm_rpm@package-g7.html
> 
>   * igt@kms_prime@basic-crc-hybrid:
>     - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#6524])
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_prime@basic-crc-hybrid.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#6524])
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#6524])
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-5/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#11520]) +5 other tests skip
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>     - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#11520]) +6 other tests skip
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>     - shard-glk10:        NOTRUN -> [SKIP][280] ([i915#11520])
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk10/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#11520])
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>     - shard-tglu-1:       NOTRUN -> [SKIP][282] ([i915#11520]) +3 other tests skip
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][283] ([i915#9808])
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#12316]) +1 other test skip
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>     - shard-snb:          NOTRUN -> [SKIP][285] ([i915#11520]) +10 other tests skip
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-snb4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
>     - shard-glk:          NOTRUN -> [SKIP][286] ([i915#11520]) +1 other test skip
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>     - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#11520]) +9 other tests skip
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#9683])
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#9683])
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-5/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#9683])
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-2/igt@kms_psr2_su@page_flip-xrgb8888.html
>     - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#4348])
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-sprite-render:
>     - shard-snb:          NOTRUN -> [SKIP][292] +412 other tests skip
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-snb7/igt@kms_psr@fbc-pr-sprite-render.html
> 
>   * igt@kms_psr@fbc-psr-primary-mmap-cpu@edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#9688]) +5 other tests skip
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_psr@fbc-psr-primary-mmap-cpu@edp-1.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#1072] / [i915#9732]) +11 other tests skip
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-render:
>     - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#1072] / [i915#9732]) +14 other tests skip
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_psr@fbc-psr2-sprite-render.html
> 
>   * igt@kms_psr@pr-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#9732]) +29 other tests skip
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_psr@pr-dpms.html
> 
>   * igt@kms_psr@psr-cursor-plane-onoff:
>     - shard-tglu-1:       NOTRUN -> [SKIP][297] ([i915#9732]) +10 other tests skip
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_psr@psr-cursor-plane-onoff.html
> 
>   * igt@kms_psr@psr2-cursor-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#1072] / [i915#9732])
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-6/igt@kms_psr@psr2-cursor-blt.html
> 
>   * igt@kms_psr@psr2-suspend:
>     - shard-glk11:        NOTRUN -> [SKIP][299] +8 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk11/igt@kms_psr@psr2-suspend.html
> 
>   * igt@kms_rotation_crc@exhaust-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#4884])
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@kms_rotation_crc@exhaust-fences.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][301] ([i915#15500] / [i915#16184])
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#5289])
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#5289]) +1 other test skip
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>     - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#5289]) +1 other test skip
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#5289])
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_selftest@drm_framebuffer:
>     - shard-snb:          NOTRUN -> [ABORT][306] ([i915#13179]) +1 other test abort
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-snb6/igt@kms_selftest@drm_framebuffer.html
>     - shard-glk:          NOTRUN -> [ABORT][307] ([i915#13179]) +1 other test abort
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk2/igt@kms_selftest@drm_framebuffer.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#3555] / [i915#8809])
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#8623])
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#3555]) +10 other tests skip
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-mtlp:         NOTRUN -> [SKIP][311] ([i915#8808] / [i915#9906])
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@perf@mi-rpc:
>     - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#2434])
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@perf@mi-rpc.html
> 
>   * igt@perf@per-context-mode-unprivileged:
>     - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#2435])
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-2/igt@perf@per-context-mode-unprivileged.html
> 
>   * igt@perf@unprivileged-single-ctx-counters:
>     - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#2433])
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@perf@unprivileged-single-ctx-counters.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-snb:          NOTRUN -> [ABORT][315] ([i915#15778])
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-snb6/igt@perf_pmu@module-unload.html
> 
>   * igt@perf_pmu@rc6-all-gts:
>     - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#8516])
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@perf_pmu@rc6-all-gts.html
> 
>   * igt@perf_pmu@rc6-suspend:
>     - shard-rkl:          [PASS][317] -> [INCOMPLETE][318] ([i915#13520])
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-8/igt@perf_pmu@rc6-suspend.html
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@perf_pmu@rc6-suspend.html
> 
>   * igt@perf_pmu@semaphore-busy@vcs0:
>     - shard-mtlp:         [PASS][319] -> [FAIL][320] ([i915#4349]) +2 other tests fail
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-mtlp-5/igt@perf_pmu@semaphore-busy@vcs0.html
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-2/igt@perf_pmu@semaphore-busy@vcs0.html
> 
>   * igt@prime_udl@share-import-addfb:
>     - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#16420])
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-7/igt@prime_udl@share-import-addfb.html
> 
>   * igt@prime_vgem@basic-write:
>     - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#3291] / [i915#3708]) +1 other test skip
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-2/igt@prime_vgem@basic-write.html
>     - shard-mtlp:         NOTRUN -> [SKIP][323] ([i915#10216] / [i915#3708])
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@prime_vgem@basic-write.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#3708])
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-14/igt@prime_vgem@fence-read-hang.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-dg2:          [INCOMPLETE][325] ([i915#13356] / [i915#16348]) -> [PASS][326] +1 other test pass
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-dg2-6/igt@gem_ccs@suspend-resume.html
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-4/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_ctx_freq@sysfs@gt0:
>     - shard-dg2:          [FAIL][327] ([i915#9561]) -> [PASS][328] +1 other test pass
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-dg2-8/igt@gem_ctx_freq@sysfs@gt0.html
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-3/igt@gem_ctx_freq@sysfs@gt0.html
> 
>   * igt@gem_eio@kms:
>     - shard-rkl:          [ABORT][329] ([i915#16837]) -> [PASS][330]
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-8/igt@gem_eio@kms.html
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@gem_eio@kms.html
> 
>   * igt@gem_softpin@noreloc-s3:
>     - shard-glk:          [INCOMPLETE][331] ([i915#13809] / [i915#16193]) -> [PASS][332]
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-glk8/igt@gem_softpin@noreloc-s3.html
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk2/igt@gem_softpin@noreloc-s3.html
> 
>   * igt@i915_power@sanity:
>     - shard-mtlp:         [SKIP][333] ([i915#7984]) -> [PASS][334]
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-mtlp-4/igt@i915_power@sanity.html
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-5/igt@i915_power@sanity.html
> 
>   * igt@i915_selftest@perf:
>     - shard-tglu:         [ABORT][335] ([i915#17018]) -> [PASS][336] +1 other test pass
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-tglu-3/igt@i915_selftest@perf.html
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-10/igt@i915_selftest@perf.html
> 
>   * igt@kms_3d@basic:
>     - shard-mtlp:         [SKIP][337] ([i915#15726]) -> [PASS][338]
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-mtlp-1/igt@kms_3d@basic.html
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-3/igt@kms_3d@basic.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
>     - shard-glk:          [FAIL][339] ([i915#14888]) -> [PASS][340]
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-rkl:          [ABORT][341] ([i915#16837] / [i915#16866]) -> [PASS][342]
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-rkl:          [ABORT][343] ([i915#15132]) -> [PASS][344]
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-1/igt@kms_cursor_crc@cursor-suspend.html
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-5/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_edge_walk@128x128-top-edge:
>     - shard-tglu:         [DMESG-WARN][345] ([i915#16685]) -> [PASS][346] +1 other test pass
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-tglu-5/igt@kms_cursor_edge_walk@128x128-top-edge.html
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-tglu-4/igt@kms_cursor_edge_walk@128x128-top-edge.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-mtlp:         [TIMEOUT][347] -> [PASS][348] +1 other test pass
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-mtlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - shard-mtlp:         [SKIP][349] ([i915#15672]) -> [PASS][350]
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-mtlp-1/igt@kms_force_connector_basic@force-connector-state.html
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-3/igt@kms_force_connector_basic@force-connector-state.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-rkl:          [SKIP][351] ([i915#15989]) -> [PASS][352] +6 other tests pass
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt.html
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-glk:          [SKIP][353] -> [PASS][354] +1 other test pass
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-glk1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
>     - shard-rkl:          [INCOMPLETE][355] ([i915#13476]) -> [PASS][356]
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-2:
>     - shard-rkl:          [ABORT][357] ([i915#16866]) -> [PASS][358] +4 other tests pass
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-3/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-2.html
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-4/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_pm_rpm@i2c:
>     - shard-dg1:          [DMESG-WARN][359] ([i915#4423]) -> [PASS][360] +1 other test pass
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-dg1-18/igt@kms_pm_rpm@i2c.html
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg1-18/igt@kms_pm_rpm@i2c.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-rkl:          [SKIP][361] ([i915#15073]) -> [PASS][362] +1 other test pass
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-dg2:          [SKIP][363] ([i915#15073]) -> [PASS][364]
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@perf_pmu@semaphore-busy@vecs0:
>     - shard-mtlp:         [FAIL][365] ([i915#4349]) -> [PASS][366]
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-mtlp-5/igt@perf_pmu@semaphore-busy@vecs0.html
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-2/igt@perf_pmu@semaphore-busy@vecs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
>     - shard-rkl:          [SKIP][367] ([i915#14544] / [i915#4525]) -> [SKIP][368] ([i915#4525])
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-rkl:          [SKIP][369] ([i915#4525]) -> [SKIP][370] ([i915#14544] / [i915#4525])
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-2/igt@gem_exec_balancer@parallel-ordering.html
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_exec_capture@capture-recoverable:
>     - shard-rkl:          [SKIP][371] ([i915#6344]) -> [SKIP][372] ([i915#14544] / [i915#6344])
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-7/igt@gem_exec_capture@capture-recoverable.html
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
> 
>   * igt@gem_exec_reloc@basic-gtt-read-noreloc:
>     - shard-rkl:          [SKIP][373] ([i915#3281]) -> [SKIP][374] ([i915#14544] / [i915#3281])
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>     - shard-rkl:          [SKIP][375] ([i915#14544] / [i915#3281]) -> [SKIP][376] ([i915#3281]) +4 other tests skip
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
> 
>   * igt@gem_lmem_swapping@heavy-multi:
>     - shard-rkl:          [SKIP][377] ([i915#14544] / [i915#4613]) -> [SKIP][378] ([i915#4613]) +1 other test skip
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@gem_lmem_swapping@heavy-multi.html
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@gem_lmem_swapping@heavy-multi.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-display:
>     - shard-rkl:          [SKIP][379] ([i915#3282]) -> [SKIP][380] ([i915#14544] / [i915#3282])
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
> 
>   * igt@gem_tiled_partial_pwrite_pread@reads:
>     - shard-rkl:          [SKIP][381] ([i915#14544] / [i915#3282]) -> [SKIP][382] ([i915#3282])
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@gem_tiled_partial_pwrite_pread@reads.html
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@gem_tiled_partial_pwrite_pread@reads.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-rkl:          [SKIP][383] ([i915#14544] / [i915#3297] / [i915#3323]) -> [SKIP][384] ([i915#3297] / [i915#3323])
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-cycles:
>     - shard-rkl:          [SKIP][385] ([i915#14544] / [i915#3297]) -> [SKIP][386] ([i915#3297])
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>   * igt@gen9_exec_parse@basic-rejected:
>     - shard-rkl:          [SKIP][387] ([i915#2527]) -> [SKIP][388] ([i915#14544] / [i915#2527]) +1 other test skip
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-8/igt@gen9_exec_parse@basic-rejected.html
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@gen9_exec_parse@basic-rejected.html
> 
>   * igt@gen9_exec_parse@bb-start-cmd:
>     - shard-rkl:          [SKIP][389] ([i915#14544] / [i915#2527]) -> [SKIP][390] ([i915#2527])
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@gen9_exec_parse@bb-start-cmd.html
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@gen9_exec_parse@bb-start-cmd.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-rkl:          [SKIP][391] ([i915#14544] / [i915#4387]) -> [SKIP][392] ([i915#4387])
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@i915_pm_sseu@full-enable.html
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-rkl:          [SKIP][393] ([i915#5286]) -> [SKIP][394] ([i915#14544] / [i915#5286]) +1 other test skip
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>    [394]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-rkl:          [SKIP][395] ([i915#14544] / [i915#5286]) -> [SKIP][396] ([i915#5286]) +2 other tests skip
>    [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [396]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-rkl:          [SKIP][397] ([i915#14544] / [i915#3828]) -> [SKIP][398] ([i915#3828])
>    [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
>    [398]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-rkl:          [SKIP][399] ([i915#14544] / [i915#3638]) -> [SKIP][400] ([i915#3638]) +1 other test skip
>    [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
>    [400]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          [SKIP][401] ([i915#6095]) -> [SKIP][402] ([i915#14544] / [i915#6095]) +1 other test skip
>    [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html
>    [402]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
>     - shard-rkl:          [SKIP][403] ([i915#14098] / [i915#6095]) -> [SKIP][404] ([i915#14098] / [i915#14544] / [i915#6095]) +3 other tests skip
>    [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html
>    [404]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          [SKIP][405] ([i915#14544] / [i915#6095]) -> [SKIP][406] ([i915#6095]) +11 other tests skip
>    [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
>    [406]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
>     - shard-rkl:          [SKIP][407] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][408] ([i915#14098] / [i915#6095]) +11 other tests skip
>    [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html
>    [408]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-rkl:          [SKIP][409] ([i915#12313]) -> [SKIP][410] ([i915#12313] / [i915#14544])
>    [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>    [410]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
>     - shard-rkl:          [SKIP][411] ([i915#11151] / [i915#7828]) -> [SKIP][412] ([i915#11151] / [i915#14544] / [i915#7828]) +2 other tests skip
>    [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-7/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
>    [412]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-rkl:          [SKIP][413] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][414] ([i915#11151] / [i915#7828]) +2 other tests skip
>    [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
>    [414]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-rkl:          [SKIP][415] ([i915#15865]) -> [SKIP][416] ([i915#14544] / [i915#15865])
>    [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-7/igt@kms_content_protection@atomic-dpms.html
>    [416]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
>     - shard-rkl:          [SKIP][417] ([i915#14544] / [i915#15330]) -> [SKIP][418] ([i915#15330])
>    [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
>    [418]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-rkl:          [SKIP][419] ([i915#14544] / [i915#15330] / [i915#3116]) -> [SKIP][420] ([i915#15330] / [i915#3116])
>    [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html
>    [420]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-rkl:          [SKIP][421] ([i915#13049]) -> [SKIP][422] ([i915#13049] / [i915#14544])
>    [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>    [422]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-rkl:          [SKIP][423] ([i915#13049] / [i915#14544]) -> [SKIP][424] ([i915#13049])
>    [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [424]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-rkl:          [SKIP][425] ([i915#14544] / [i915#3555]) -> [SKIP][426] ([i915#3555])
>    [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_cursor_crc@cursor-random-32x32.html
>    [426]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-rkl:          [SKIP][427] ([i915#3555]) -> [SKIP][428] ([i915#14544] / [i915#3555]) +1 other test skip
>    [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-max-size.html
>    [428]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-rkl:          [SKIP][429] ([i915#14544] / [i915#4103]) -> [SKIP][430] ([i915#4103])
>    [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [430]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-rkl:          [SKIP][431] ([i915#14544] / [i915#16867]) -> [SKIP][432] ([i915#16867])
>    [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [432]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dsc@dsc-basic-bigjoiner:
>     - shard-rkl:          [SKIP][433] ([i915#16361]) -> [SKIP][434] ([i915#14544] / [i915#16361])
>    [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-2/igt@kms_dsc@dsc-basic-bigjoiner.html
>    [434]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_dsc@dsc-basic-bigjoiner.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-rkl:          [SKIP][435] ([i915#14544] / [i915#16361]) -> [SKIP][436] ([i915#16361])
>    [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
>    [436]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-rkl:          [SKIP][437] ([i915#14544] / [i915#16084]) -> [SKIP][438] ([i915#16084])
>    [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_feature_discovery@chamelium.html
>    [438]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@vrr:
>     - shard-rkl:          [SKIP][439] ([i915#14544] / [i915#16600]) -> [SKIP][440] ([i915#16600])
>    [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_feature_discovery@vrr.html
>    [440]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_feature_discovery@vrr.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
>     - shard-rkl:          [SKIP][441] ([i915#14544] / [i915#9934]) -> [SKIP][442] ([i915#9934]) +4 other tests skip
>    [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
>    [442]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>     - shard-rkl:          [SKIP][443] ([i915#9934]) -> [SKIP][444] ([i915#14544] / [i915#9934]) +1 other test skip
>    [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
>    [444]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-glk:          [INCOMPLETE][445] ([i915#12314] / [i915#12745] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][446] ([i915#12745] / [i915#4839])
>    [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [446]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk4/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>     - shard-glk:          [INCOMPLETE][447] ([i915#12314] / [i915#12745]) -> [INCOMPLETE][448] ([i915#12745])
>    [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>    [448]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-rkl:          [SKIP][449] ([i915#14544] / [i915#15643]) -> [SKIP][450] ([i915#15643]) +1 other test skip
>    [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
>    [450]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>     - shard-rkl:          [SKIP][451] ([i915#15643]) -> [SKIP][452] ([i915#14544] / [i915#15643])
>    [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
>    [452]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - shard-mtlp:         [SKIP][453] ([i915#15672]) -> [SKIP][454]
>    [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-mtlp-1/igt@kms_force_connector_basic@force-load-detect.html
>    [454]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-plflip-blt:
>     - shard-rkl:          [SKIP][455] ([i915#14544]) -> [SKIP][456] +34 other tests skip
>    [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-plflip-blt.html
>    [456]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-rkl:          [SKIP][457] ([i915#1825]) -> [SKIP][458] ([i915#14544] / [i915#1825]) +1 other test skip
>    [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
>    [458]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
>     - shard-rkl:          [SKIP][459] -> [SKIP][460] ([i915#14544]) +20 other tests skip
>    [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
>    [460]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt:
>     - shard-rkl:          [SKIP][461] ([i915#15102]) -> [SKIP][462] ([i915#14544] / [i915#15102]) +9 other tests skip
>    [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt.html
>    [462]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>     - shard-rkl:          [SKIP][463] ([i915#14544] / [i915#15102]) -> [SKIP][464] ([i915#15102]) +22 other tests skip
>    [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
>    [464]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-rkl:          [SKIP][465] ([i915#14544] / [i915#1825]) -> [SKIP][466] ([i915#1825]) +5 other tests skip
>    [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [466]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-mtlp:         [SKIP][467] ([i915#1187] / [i915#12713] / [i915#16490]) -> [SKIP][468] ([i915#12713] / [i915#16490])
>    [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
>    [468]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-mtlp-4/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-rkl:          [SKIP][469] ([i915#14544] / [i915#15459]) -> [SKIP][470] ([i915#15459])
>    [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html
>    [470]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_joiner@basic-force-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-rkl:          [SKIP][471] ([i915#15458]) -> [SKIP][472] ([i915#14544] / [i915#15458]) +1 other test skip
>    [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>    [472]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
>     - shard-rkl:          [SKIP][473] ([i915#14544] / [i915#15709]) -> [SKIP][474] ([i915#15709]) +2 other tests skip
>    [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
>    [474]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
>     - shard-rkl:          [SKIP][475] ([i915#15709]) -> [SKIP][476] ([i915#14544] / [i915#15709]) +2 other tests skip
>    [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
>    [476]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-rkl:          [SKIP][477] ([i915#13958] / [i915#14544]) -> [SKIP][478] ([i915#13958])
>    [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html
>    [478]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
>     - shard-rkl:          [SKIP][479] ([i915#14544] / [i915#15329] / [i915#3555]) -> [SKIP][480] ([i915#15329] / [i915#3555])
>    [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
>    [480]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
>     - shard-rkl:          [SKIP][481] ([i915#14544] / [i915#15329]) -> [SKIP][482] ([i915#15329]) +2 other tests skip
>    [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
>    [482]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-rkl:          [SKIP][483] ([i915#14544] / [i915#15948]) -> [SKIP][484] ([i915#15948])
>    [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html
>    [484]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc5-psr-suspend-resume:
>     - shard-rkl:          [SKIP][485] ([i915#14544] / [i915#16914]) -> [SKIP][486] ([i915#16914])
>    [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_pm_dc@dc5-psr-suspend-resume.html
>    [486]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_pm_dc@dc5-psr-suspend-resume.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-rkl:          [SKIP][487] ([i915#14544] / [i915#15073]) -> [SKIP][488] ([i915#15073])
>    [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [488]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>     - shard-rkl:          [SKIP][489] ([i915#11520]) -> [SKIP][490] ([i915#11520] / [i915#14544]) +1 other test skip
>    [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
>    [490]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>     - shard-rkl:          [SKIP][491] ([i915#11520] / [i915#14544]) -> [SKIP][492] ([i915#11520]) +2 other tests skip
>    [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
>    [492]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>     - shard-rkl:          [SKIP][493] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][494] ([i915#1072] / [i915#9732]) +7 other tests skip
>    [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
>    [494]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@psr2-cursor-plane-move:
>     - shard-rkl:          [SKIP][495] ([i915#1072] / [i915#9732]) -> [SKIP][496] ([i915#1072] / [i915#14544] / [i915#9732]) +8 other tests skip
>    [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-7/igt@kms_psr@psr2-cursor-plane-move.html
>    [496]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-6/igt@kms_psr@psr2-cursor-plane-move.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-rkl:          [SKIP][497] ([i915#14544] / [i915#15949]) -> [SKIP][498] ([i915#15949])
>    [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [498]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@perf_pmu@rc6-suspend:
>     - shard-glk:          [INCOMPLETE][499] ([i915#13356] / [i915#16236]) -> [INCOMPLETE][500] ([i915#13356] / [i915#14242] / [i915#16236])
>    [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-glk6/igt@perf_pmu@rc6-suspend.html
>    [500]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-glk1/igt@perf_pmu@rc6-suspend.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-rkl:          [SKIP][501] ([i915#14544] / [i915#3708]) -> [SKIP][502] ([i915#3708]) +2 other tests skip
>    [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19115/shard-rkl-6/igt@prime_vgem@coherency-gtt.html
>    [502]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/shard-rkl-3/igt@prime_vgem@coherency-gtt.html
> 
>   
>   [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
>   [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
>   [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
>   [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
>   [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>   [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
>   [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
>   [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
>   [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
>   [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
>   [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
>   [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
>   [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
>   [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
>   [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
>   [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
>   [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
>   [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
>   [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
>   [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
>   [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
>   [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
>   [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
>   [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
>   [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
>   [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
>   [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
>   [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
>   [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
>   [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
>   [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
>   [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
>   [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
>   [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
>   [i915#14242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242
>   [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
>   [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
>   [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
>   [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
>   [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
>   [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
>   [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
>   [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
>   [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
>   [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
>   [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
>   [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
>   [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
>   [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
>   [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
>   [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
>   [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
>   [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
>   [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
>   [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
>   [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
>   [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
>   [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
>   [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
>   [i915#15726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15726
>   [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
>   [i915#15778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
>   [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
>   [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
>   [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
>   [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
>   [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
>   [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
>   [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
>   [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
>   [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
>   [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
>   [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
>   [i915#16084]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084
>   [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
>   [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
>   [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
>   [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
>   [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
>   [i915#16193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193
>   [i915#16236]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236
>   [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
>   [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
>   [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
>   [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
>   [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
>   [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
>   [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
>   [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
>   [i915#16599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599
>   [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
>   [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
>   [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
>   [i915#16685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685
>   [i915#16837]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837
>   [i915#16866]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866
>   [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
>   [i915#16876]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876
>   [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
>   [i915#17016]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17016
>   [i915#17018]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17018
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
>   [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
>   [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
>   [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>   [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
>   [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>   [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
>   [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
>   [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>   [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
>   [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
>   [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
>   [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
>   [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
>   [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
>   [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>   [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>   [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
>   [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>   [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
>   [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
>   [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>   [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
>   [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
>   [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561
>   [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>   [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>   [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>   [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
>   [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_19115 -> Patchwork_173760v1
> 
>   CI-20190529: 20190529
>   CI_DRM_19115: a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   Patchwork_173760v1: a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173760v1/index.html

-- 
Best Regards,
Krzysztof
