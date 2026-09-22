Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBDEC98302
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2026 22:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF6510EE8F;
	Tue, 22 Sep 2026 22:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMoUmh0Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9182F10EE8F
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Sep 2026 22:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790115122; x=1821651122;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=28diCZSbVP5C17cbh9xOZzKqAY5jbz5V+37DwqQQxUs=;
 b=YMoUmh0Qm8qc9A+bK0HIx22pN1qr4DDJFPqfJmHEnCZ3kUIJChkUG6aO
 PaUsWJE/kmAS/d92Pz76ZyhFP9HFn8c0PiQTVansHrrxhhiUJ1S3stg0o
 ppEbCYFchuBi+pD3lNAl9iP4kqYMcMrfzPe3qYR0q+PKrzxNho3C9rIMR
 RaPz+KGTOFyicKYzANyDJ05vTp/H4ObytMRHDXap5lpKMSUilB+YH4Xa5
 EHHQwBtn5SRjTSoCDkrkFX/H/V94zJpcDPw7cT92xAAu/JSvZuMCn04ZA
 0Wl6v1TxSPf62rSgK9gaQsoAf/ZvBUS8lmGU8t7GwN9FDO58uzA0qwCpE Q==;
X-CSE-ConnectionGUID: QfJMWjoHSiWOF2iBI8KU+A==
X-CSE-MsgGUID: v4GijBFDRB6ow35r1ZEJYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90784911"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="90784911"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 15:12:01 -0700
X-CSE-ConnectionGUID: do4zLOpuSUaS37NUpzm+YQ==
X-CSE-MsgGUID: UiL6HeX6R06uv+AVZoDODQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="4345149"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 15:11:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 15:11:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 15:11:51 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 15:11:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqOshoawWq1MBRgn0t/C3mpe7Wb9Nodbvv1FhX5y6RhSNVn3MZeEQuX7sdev6hK5Vn0d1cSQFCMqSCUTpiddzoGuAoKAHu5w6JKVsfXTgrBegEVFIXlLEUijWtP2GXtfKiBF4FwKu28hU5ZpgzevzfzMhbwgvHl2gddOzitfINSoZN0I0Z/rNAQQpTg+I3SvG2/WwdAImG2AUKjsQYqXXLeaC3SOjlZGKztstwIbS4X4hT2S04cyrUI7Bdv6Kr3juVuFWLJKBpP1monKP+xte9x9w9y3qjLwpUbsxe/ELHu+5cSgqkrkufd+AEwWvvU0InVCHPwsuCDgXW1zkgYO0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxN88834tYNwDdoCZipt1vqMi33+7lvC7TFsUIXUbFQ=;
 b=sU/RbrqhfmEnX3O6x3sVsp2nHUbE/nF1gdFyzb9XOVlu+/Cw0vzZZsA7yTYdoB5iTbcVVvc9bwARKwlw4Nr2zocIk79lE6alWQOWYmtUFuGX8flNqguSnhgeNX6bERac51PXtaIJbJQEvcYuqpeV8VZzDwOSPTzQKRZA/FtUo9PlhV7fNpMnFJ9dU+mk6CXIb+xI/rNdK0njCy7IKfqp12X9xa6YVGX11Zc7BzZUkAj3b79TNqZ72KWP0c5iRv2IEXCdfHOlCWg+NWUnYV+iQ5cN9hwVrQEI6JqrFDhtmxSq0TOP3OaGzaC9Dx/tinN5BMWOQdrD34KONASYQJPkXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH3PPF383C22AA3.namprd11.prod.outlook.com (2603:10b6:518:1::d17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 22:11:49 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 22:11:49 +0000
Message-ID: <edee83e0-5c59-4997-9ec4-9f2fc58b3733@intel.com>
Date: Tue, 22 Sep 2026 15:11:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/pmu: Use a delayed wakeref put in get_rc6()
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20260910184253.1231313-4-umesh.nerlige.ramappa@intel.com>
 <20260910184253.1231313-6-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260910184253.1231313-6-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:254::14) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH3PPF383C22AA3:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d487ec-5885-4852-4ea5-08df18f67f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|6133799003|10067099003|5023799004|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5lSGiV1lemOdomuuOku4BE1/duIpvt1SUqsxms97hU1X6p0rOULK90SOq2Ho2Adi8oOkGHz8m7wG1AV4u01Gm8+f3UctF/lG0SiwrhBlCJkq8hWxeeZUCvFgtwIaVBfehYv42ZpqBsQF9ssKjPPlKRQXQOOaV5ImotDQHawih+jNWVatfNpJKqU8SRpk6vPyxCReqb18WGagNtF22DHcJ3Xsm5wqwS46Bx7goAaCU+OU89gczU5q7jUULDiaqJpqShcfI62Hu4Qk62T67tkK68CfqeolNWlZSRCdGKuwZRDfCkIt0eZZ30737Qj/8VokVL6QgkPSzWRNMhokPsVYWfrDI/NfNTwqTcz+MoCSo0BMjvqvX6iaJzEoLN78nysWpmqOpkq+c+N7w3lBu08Q1UYVgA42aB9KFdCW0+jqbTIL8opMip1tW1HDMuwzhauW9lYXzIQcFshVTHdKGitZdyMuAFC3SFzANtXOeTC2gecEaibVpGXn/sFqaaQzX2so2qxfLwzvNmTrnnQaN0J/YXFL7phiHOAfisR1Lr0PVxI78eSBcUy7digo6nFQ6qSF2iZkL8U5nPOp0HvosVMyFnS2IlFAhJa3da8Yr0vTnqRYR9M8vsB0bipzVf3IG2g22mQCpYdwTLMwlAeAFbpXKRCV10OYSQsaVDkX1diYNaw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(6133799003)(10067099003)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGlwejZnME5mdWdkVkJUTzZCb1VReUJYU3Ird2krNVV4VFFMQ2QzNTBEM0lk?=
 =?utf-8?B?QmNtOE9lZGpKRm0xZENDNm9UbkozMTJsaUtQelduMVJsV3RjZ1AzU0FHWlZW?=
 =?utf-8?B?clh4OER4L2ltTGJnZ2R2U1BuRlNHTk1Ia0doWE1oVGJ5TXdkcUI4ejNwTFVE?=
 =?utf-8?B?bmxGMEM5dGNOL2ZZOUsyb3Qvd2R2L2J2a1NRQ1l4dG0wQm02SGUyVjZJQy85?=
 =?utf-8?B?TVBFelZraXpLYy9PUTdYN2dOU3k0VnZMVHlRVTg5SnRjVU9HRFJkekJHVEQ3?=
 =?utf-8?B?Y1RRYlFtTUJZMm5BQmtyKy9raHdxK2dDVUpvMEJrbXI5eW1YNVF6U0hUS0RO?=
 =?utf-8?B?VEZmL2NpY1QzY2VHUTU0WWpQL2U0bWRIMGpzWHpmNk55OWJiL0Z5d2JsVXNK?=
 =?utf-8?B?RGcrWWhBYXdnWThZK0VrUU1RQTZNaFhmZ29yYU9mUlhxS1BycHNXYytmelJE?=
 =?utf-8?B?enR3cElWWnYzNmVQQ3Jxd0d2ZUJXUHJzMFVnRnVVMitXeWtDNm1vTG8ySzZo?=
 =?utf-8?B?d2ZTeFl1NkJCWGtVeEdtV2o3NGduWUxrbjllK3BnbTQ3cWtmYlh6UmREbmJm?=
 =?utf-8?B?L2doQ3VmamR3NmcwMzhVMEJrSHFmSkY4WlN3MmQ2azdqcElHMUJuNHJqYkdu?=
 =?utf-8?B?OFFEZGIwV1V2SStWRVZqSFJJNW55UDFYdlR3Q1piTG9yOHo4N3ZySkdpQkFR?=
 =?utf-8?B?TFhNV3AzanRCNWpmVURMNlYwNGhQQXkwTWNXWHMzaTNORnpCa1JMbERUTHhS?=
 =?utf-8?B?UWQzaWVlSFJNWnlXT1V3VzYyRFkvL093eENXN0xiQTNSSk1GUHY2dERubS9V?=
 =?utf-8?B?b055QnptcjliNWV5bytLdW92cmJvcHhuRmhYUjdVTzBES1IyVklKdE1FYjBp?=
 =?utf-8?B?NFg3ZklEZkdTTmhJSmkzSUZ2cWp3YVBTNE9PV2RCWXM1S3hwNTlsR0FUajNQ?=
 =?utf-8?B?ZVNXTnlpcStpejhmenVqQkJydWx4NmdBOU11YTY1L1RTOHlZN2NIdWc0M3JY?=
 =?utf-8?B?Ymk2QitmSWxtQTU3eG9wcTUzU09qM3VMVGpLcXMyRTNjYmRQMGVwRDhNcUc2?=
 =?utf-8?B?SmhDRm5ldjdGblFWeHNpdXFiaTRUOUk5WmtDQkVZdzhzdXl1d21NT3NWOW9V?=
 =?utf-8?B?S1hTeGYzaFJ1dTFlSVR4WUZoUVArdlNtVjJ1bkdZRXhsUjd6R2JzSUZRdURY?=
 =?utf-8?B?b2JoT3l3ZWc2MlM0ZVRIRjBQUjdNZzhVS3V0WlJ4VkFNUjVjaWE0WXNkZ0Zr?=
 =?utf-8?B?WnJEdXVtZ1B5YjVsbXMvT3dqTkxEd0xHQ0txMnB0R1Z4K29wWjFpNGRIb1py?=
 =?utf-8?B?SC9SanByaFBKdHlzUjFJOS9NSnVuaHZudkdSMzMyZG9XOFVPbXFLVUNTZUR2?=
 =?utf-8?B?bHBoc21qbkNhTVI5bEs2Z0RSQkRqa0lTODczWVYyaVEyV3dnKzBDY2tXMlZL?=
 =?utf-8?B?c1ZjRXh4RGZ2amRpVitBRWVQRy9aSWRLQnl6TTNMeGlrVFVVTEVWbFFTK1lC?=
 =?utf-8?B?eWwvWG9IOWtMclJkYlh1RVZjczVlWDY3UkdjbCtZV25RMmlTQTZ2QzU2cDhH?=
 =?utf-8?B?dEh0R1RWUUxOUk5kZmRPNkp3dCsyZHlKMVhnL3hIRkZGOUZ3eFJvb3lsaHV4?=
 =?utf-8?B?eGpSNlVCMkpiUDk0a2dNYk9ZMVVkckpDRjBIN3JpQW1CYzFLeHRIeEpROFN3?=
 =?utf-8?B?S21EY1packdoUEZZMGtJV2FUSUdUVGJaTnZiNEFQRHZGemxQUy9SVGVEejVv?=
 =?utf-8?B?RzUvVWFSOFlqYTNKekZJby9KU1FBcnJjUGNqdzJDZkV3NVF4Smx0UGRmVHpI?=
 =?utf-8?B?ZDZMOWFBYktRWi9KTGpqQ0Q2SHR3TnloUFpjUUg1cmJTWEF6VFRVS2U2dVFn?=
 =?utf-8?B?bDJySG1zTjllZGlRVlRIKzZHR1hPUXNaSCszQXN0M2UwbGowZkpUc245UEg2?=
 =?utf-8?B?blIySUxjR0ViWjdXc2tZK3Fiby9JRVVwN01WMnhkbWhMV3RmbmRTQTYxN2Zo?=
 =?utf-8?B?ZzhJUzJ3KzVtcTZ1UkpISkhGd2Z0eW5vOFVOd1YvUnF5bkpJV0FsUVBuYWw4?=
 =?utf-8?B?aW1LQlRBekhCdXF3L3JqKzJCdEdqWmJOUFpMa2VnWEVGUVl6NmpZMUFmYThm?=
 =?utf-8?B?S0Jqa1g4Rm50Y2h3WHVhbUprQXNqRTdWb09QQjZWQVpaZnhKOW9NNG1mWFpt?=
 =?utf-8?B?bWoxbDhxRGRVQTJMYWh4RU93a01ZbFBzTkVSTkpwNjdiN0UzSkN2eWppWVor?=
 =?utf-8?B?Nkw4LzVlRnVWdWEyYURtcGo2VTJuY0pUU0JBOUJHRnpaRHU4blRpMlB5T2pa?=
 =?utf-8?B?ZDEwTkxISnhxRC9aRXl1Rmg5cjBtTHQzVjlUWjBEVGhHbXgrSTM4V25WcFpa?=
 =?utf-8?Q?Sf70aeJ4HQ32QLXQ=3D?=
X-Exchange-RoutingPolicyChecked: 0u17UTdq81W2j/2izX/JyapaF61GYGYWMOq24NK8EOW/cduEVWCWQYd8wBht0j8+Vz1G1apgetWQ7U4TsYGD2M5ECg0/JVZovxXBm1gkuZukFUnuvWYfu2O9LEiSYJ5fhecQjllTz6tjtBIeitvvPRF3/fWJQsZFHwtlbf4l8n49KysdOzZq7/RW79F2mvuZQVXIB6tt5pAmvEcrSUjPSl8+CnSSfJpPjycs4PuA+HlQds7FpspWYRO7QGM6GwYhGhZxFimyoyQykDsTmzha1UZCLok+aCLXbI3cpzahrUAmbGkGbef4Q9pajSHgZEcEHQRbp+VNFffWMLG5Au7JtA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d487ec-5885-4852-4ea5-08df18f67f84
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 22:11:49.3962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Un+s4WIyzY4wOECFWc3pxLIPVqW99v3Z71p7FtLtFr9fPO0EupalAaYaZoAfzyFQ8EV9p5DHnCDxIlE7hH56NwsF2UJ1p172dUGkOBydoOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF383C22AA3
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


On 9/10/2026 11:42 AM, Umesh Nerlige Ramappa wrote:
> get_rc6() has the same runqueue lock deadlock as guc_engine_busyness():
> it is reached from the PMU callbacks, which perf can invoke from the
> scheduler with the runqueue lock held, and intel_gt_pm_put_async() there
> can wake a workqueue worker via try_to_wake_up().
>
> Use intel_gt_pm_put_delay() so the deferred put arms a timer instead.
>
> The remaining async puts in atomic contexts (hrtimer, tasklet, irq_work,
> G2H handlers) cannot run with the runqueue lock held and are left alone.
>
> Fixes: 07779a76ee1f ("drm/i915: Mark up the calling context for intel_wakeref_put()")
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Assisted-by: Claude:claude-opus-5
> ---
>   drivers/gpu/drm/i915/i915_pmu.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 1c3bafda9c70..4598d9b5678a 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -229,7 +229,12 @@ static u64 get_rc6(struct intel_gt *gt)
>   	wakeref = intel_gt_pm_get_if_awake(gt);
>   	if (wakeref) {
>   		val = __get_rc6(gt);
> -		intel_gt_pm_put_async(gt, wakeref);
> +		/*
> +		 * We are reached from the perf callbacks, which perf may invoke

rephrase "We are reached"? There is another put_async in 
frequency_sample(). Do we need to update that as well?

Thanks,

Vinay.

> +		 * from the scheduler with the runqueue lock held. Defer the put
> +		 * on a timer so that it can never wake a task from here.
> +		 */
> +		intel_gt_pm_put_delay(gt, wakeref, 1);
>   	}
>   
>   	spin_lock_irqsave(&pmu->lock, flags);
