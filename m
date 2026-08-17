Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA568C5DF7D
	for <intel-gfx@archiver.kernel.org>; Mon, 17 Aug 2026 21:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AAA10E19E;
	Mon, 17 Aug 2026 21:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TbblVJlW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE84710E19E
 for <intel-gfx@lists.freedesktop.org>; Mon, 17 Aug 2026 21:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787000640; x=1818536640;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pveKUen1MUEa7Vhl1otHIypdoHGuyMWEgtNWj5tMNpg=;
 b=TbblVJlWYYRG0VD+BtL8LHwIhYQZfwi06/kx/VdZ1gBuhk3k/yNvTeLz
 aseR5xlDlregmgXuF6yWoyX2w6jMJelLCmaBdxarE+row9uPprHiL5niq
 F4EW6K1tGOYotZ1yA0tWE4iYy9CFY7oFdZLxEn4VcEfHIDYDXzN5Q6Jss
 4i86RQw7IIb7qrVsyh1qfGE2I751y3dpoP5jorVgJoxOMLDcpbPXvCmdv
 d4FeQx7D+jtNblKJNSC97/iRHiN9INw2etNuvEP6eYK2tvm+Aqc2431VI
 mAy1k1K3cJeUOuGaklSTJwAxWoXHe12E0338A+jLEO9oo4UDGqVwivEfo g==;
X-CSE-ConnectionGUID: HmGfTpJ+QnW8OV6Cv++9kw==
X-CSE-MsgGUID: coOQU8LzRdqD904wjbFOTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="89999741"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="89999741"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 14:03:59 -0700
X-CSE-ConnectionGUID: QgRdKiYvTjGUuyejXtp4vA==
X-CSE-MsgGUID: eUtyC71tTCGvbg0hdw1MAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="289829742"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 14:03:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 14:03:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 14:03:58 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 14:03:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IeF/o/kyg7dnTY/ppSzTJOjM1FP8jDn/pkxbq6ZyXeg0c3g5CrjXUYzOOr+Ma5zzesAvqrDNwjsGH8GnmL1Hu6F8ltmu6uwXx/akVLVFVztzDnbkmB/kCrN59JkbKXsZ6PzNj/bmKgh36lwoDva15mT2u11fysVwinboqgFjDmt6hAMab+okYdHQx4w1gaP1DaF6nCcbmO061D9f0lwmJKMWFTvXJ8ru1hdKXZ1NCJrnN2HBh2iKdCz1yyYwlzUoGTEEMf3DwEgRWBzWg8tEta16YyA6sdQCOjaUq9aO/QPG1BS1aovQcNxV5lR+R6c1UhbUYn3iNgmARQMUATzwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFplI70xfyC7Hg5NC+yr5KI+wlG4B4VQVhRxHQ8IxE4=;
 b=J2PqeAYV6AUDjXBenVXqFVAcGQ9m976PakZbVIxgVQEpNRsnSwyW1NU76GQzIFAiCSf9V1mz1wvrRCcTshRO/nKm024gFzYrV7ewdCaQQ1NasomLPFZyGvkGpjTHMaCNoN3OLK/lo8eGZSqxkVu/E0KkbBC/2GH3OeA28Nv7SicdcCbjooEWpMljZOni0J5821MUIvriEL9QM3RXdj4yKE1IUm1kWE/FQoRs12i4HgqR0tOtKMvpI/rSYxokNBAE/8EikRKX+W9ehB+cDuhxXfbH48UvYUy655CqSzP4ZX5ZwCrF1RGN4NxGuui+6mJII2ePGFBWbfKsj9mzwQD+Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by MN6PR11MB8220.namprd11.prod.outlook.com (2603:10b6:208:478::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 21:03:56 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%4]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 21:03:56 +0000
Message-ID: <440c047b-f64a-4354-9961-d39063113e0b@intel.com>
Date: Mon, 17 Aug 2026 14:03:54 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/g?=
 =?UTF-8?Q?uc=3A_Test_GuC_v70=2E49=2E5_for_TGL=2C_ADL-P=2C_DG1=2C_PVC?=
To: <intel-gfx@lists.freedesktop.org>
References: <20260817184548.2905639-2-julia.filipchuk@intel.com>
 <178699549050.60298.8630402058517466518@61270ab9df2a>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <178699549050.60298.8630402058517466518@61270ab9df2a>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:303:85::28) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|MN6PR11MB8220:EE_
X-MS-Office365-Filtering-Correlation-Id: 45e3838f-f3d2-408e-29f5-08defca30cf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|4143699003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: tsfbRZNKO4vYGY4jFyfuJUPlEORgnPm+AqpyMLrCw71YYaRtcrtna+O92Zl8gI4QtJ9szHivepWbUyk4NDEyqunfjVnMqQA66Lb0F3fPoRfryUfTcDHpgP/vaGbsQCZXwUAIO7TzW+JC7S8dVzugE902MZmSYjgYxaMzyV4DdZwDlRLPHTqnUBJwUBS2yDmip8wOoN3OlgIAEtTXtgdkIDebaYLgtDtKMzBzh161uwL0kxZxGr2PdWivt9ROgV7FRH77nompoUCMir1gHSGxPTGSxNsU4uwLWMDCybEfI25yHq3r9h0rfwLgE2e7CZstGNlJcYafjEloRLFUrCNOl14auu0joX6mgz8b66AdHGkX44rDPAu9IG1eOmYhaF5r5m6IVPDtFvy5N0SFTsYRqZ+CbMHumDooWnUEwAVGttUJWbFHoKlhe2yMfNIhgSzZlQBADmgn9+7+GNVD1jgAJvTP1uEQ1o7+qptYHnrTaC6oqoFmgGRBjwGYlMhD0pNj2v9qh7HLHcYTW7/MPPRWDaGXOCgZQo5O604ZXYkLfAhLuZE5p3R69zWFM3plnIUOMAQLRczziL/Ug31v/4t+98oInl9fw0KVK5eZhyMsp3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW5odDJFUUJWYXIxZkc5Z3JOeUo4cHhMdVFMbWYwNW5JSkR6ZGp0OUJ3REhB?=
 =?utf-8?B?UTBhcFBydFFkSENlZGswSUh2U2ZBVEp5SUR6N0F0Z1EwcFhKNW5TZGo3ZFFn?=
 =?utf-8?B?cU5tSklmOXltNVB6bHlQcGdCbXlyL2lONXZqTlRYWldCdkpoanY5SUZRYWJP?=
 =?utf-8?B?UnBLdzdsMy8ranIvczNYbVJjTUZ4QWVEN3VEZXZRZ2ZSbkszR294czN5V2Qv?=
 =?utf-8?B?N3ZYRUVBMURGcUJ2dmNSU1pqbkZURTgxSjUxVTJtR04zelg2SllpU2RkUGdM?=
 =?utf-8?B?bFBNU2s4MnZNVnNyVDVUdDBocUNQUy9FQytVY3VRVmdMYTZ0Y0NHREU2RG1t?=
 =?utf-8?B?NDkra3FVR3g3N1FzMDAwV0h4UmgycTc1VnkwWVhleGQwTVVCZnFOT1FGM0xw?=
 =?utf-8?B?TUF5QmJJNmFETWhaR2NaTmdnNHB6V2gxKzBEUnpKLzc0VDAwUnUrTWpqeFA4?=
 =?utf-8?B?eHVJak1SWk16M3hQUitBOEwveEFQVGVYbWRpYUxoYVRQTkhPRlBEUUVRWFhx?=
 =?utf-8?B?Zmp3dnhVQTM0TEZ2anB5Q21Sa2JSVElmZjJmQnVTYjY3b0IvSzBEV01Nektp?=
 =?utf-8?B?QjVESG5TOS9BaXpWa1FFZVlMWUF2MWhVbjJhck5KeURFVTZuM0ZmSEhTSUxX?=
 =?utf-8?B?OFE3b3JCT2hJOXhDaE1KWkljNHFQU20xeVlRK3lNalhMWk1aUzArS1QyampR?=
 =?utf-8?B?ekQzU1RmREsvempKcTRmU0QrTHAwUFlJWkdLWUdHakhKbzBteVR6YXE5YXNO?=
 =?utf-8?B?REd5cVJmU3I2ays4NDdHM0Ewbm5kZUdFbkxxZ0JOVDVYcXRza0tleitSR0Y0?=
 =?utf-8?B?Q1lMck9VUm45Zmx6SnppNWtZdEdacE92ZFM0alh6a2tGWi9MdkVOZ1hsQWxr?=
 =?utf-8?B?T01XaDZPYW1xVG9kdkhwb2FRMjRVQzRPNWl4L2pyQXNnRFNJTWVOZU9iVW93?=
 =?utf-8?B?SmxSNkRiZ0JnRUttZFcxeWVaL29PeC8rem13ZjlIL3psUHhsZzVBZmQ3Nm82?=
 =?utf-8?B?Vm1sU3NEQVRHN1ptTEt6OUwyWkRHVHNFMm5lcUw1ZkdDd2ljTmRvN1NBcnY2?=
 =?utf-8?B?aTJXOW1ZUGs0b2RFajlrUUxlWG9nNklWUmM1SjdOUW9YRU9IdnA3Y25WT0Fr?=
 =?utf-8?B?OCs4cm9QSmtObS9PYnFhSTl6TjRnNjdHUmpNUVVUaXd0MVhQN2dMU3MxVGJ0?=
 =?utf-8?B?ZzdyWlJpQkpKWVVVNnZyS1pjeUR2UElsdVdta1RwbklWb3A1RHNLb0ZmbXZK?=
 =?utf-8?B?T2VSWmJsamdiTklVVG9lWUpQLzM2R2oxOXdWNFkxeURGL0ZGK2RPSU9ScEpU?=
 =?utf-8?B?bER6UFhZNFRzSGZLLytCem9taXlydEFLVFpDeXA3UW5Tdm9KemlsSC82YmZN?=
 =?utf-8?B?WFk4T3hRNnVSR3pqQ3VDZS8rZmdIbTZXSHVBaWkvcXdDN21RY2ZTTDk5OWhH?=
 =?utf-8?B?M3JFWTZVSkpMVlZWY2pNNkdrM2FaZmZ0Rkw4SzIzNzljaXltQ0l0MEJtd1p6?=
 =?utf-8?B?MXBtMWFEUGxzemltUFZ4R3lpR3FWaFNEY0hxR0hVMEt0aEJBVFVaaGpZVjN3?=
 =?utf-8?B?Z3o3VHhpQVJ2N2VqSEJGNGlKbFVhQldPQ1FOVS9DZ1JXVDRsNHJCS1JMMVNm?=
 =?utf-8?B?dkpaTUhTN1FmREE0cEcwZGpvSTRvYzMyWUx2ZTJvdm9nTVVvZVVBR1ZlRzFj?=
 =?utf-8?B?VlZpVVl5eCtSZndtNGdyc1VSdk5iTXdXRmlkUDM4aWFOc2duM290NkhUamRj?=
 =?utf-8?B?eFlxR2xNVXgrYzVJWW4rNlpmY043ZlFrSkhWTnVoVWR6d2hxUENtRldkL1p6?=
 =?utf-8?B?Y0VXVUFhL250VThHZ3lFQlFTQlA1akNSbkJ0YlNKK2hvZU5VTkxCby9zNFM2?=
 =?utf-8?B?aEoyblcxc0NRNU12cnViTWJNNUhhRDNyZ1NOVGRHbDVBTkFxbFFnaGR0UnBs?=
 =?utf-8?B?bnZNNTUyQldBRXV0cGdmTUtBUm9JRm42Ny94VFBaYXYyNmN2VXZGQllRcllD?=
 =?utf-8?B?OStIeHdFci9uVklnL2JmeUhOVkdUaE1SdjFwV0w5bWk5bkhMdlByWTVDaWV1?=
 =?utf-8?B?NkNXYnBNbTVwTkNRVzVrY0VVQXFKTVNiVlhnK25ielRsK1NCMjNCeTlyeEtV?=
 =?utf-8?B?bXA1VmRFR2VhSVJoSk5RU3JWWXcyNXJqTStzOFhqOEdGZFBBQ0syNEVpV1dG?=
 =?utf-8?B?V0JtSkFBczBSbXFzbGhCeUN6N0VGNnBPRFRzQUg3TExyaTh1ajB5SlpMVVJr?=
 =?utf-8?B?WXFJN01tUnNITHg3UWlsUVdCYjFMMUJrdTVLRCtVcGo1dmVRQUl0YXMvOHNv?=
 =?utf-8?B?WW1OZDNUVWFvWTMvZzVpOVY1VE9ZY2VITnBNVjErY2lpYnJyZytIUUNWMUdC?=
 =?utf-8?Q?RRz/+UUByXZw01Ds=3D?=
X-Exchange-RoutingPolicyChecked: mKt8fXvKLOqAaLB6aISONoSvrbeIbSEl9u1X3H3uWcNUw2toof52ByrMS7TUPQX62xcfjBtFou7L7MS7WFltypmH0G/Z8+juowI2C+L+4MH1bSKQWCs0jTWq7gBjh/0sk+G3eLP8MOvVuWeufjMWAVOjkqFH2HpgO1zlxe8A6DjXgy+aB6kZh67n8Bsqq/aGNOepR3kQD2aoobv+HF8JkX4yrLmqNPJTMrXXVZ+2GIUbC+qgjnjIVLoUPSvzCGT2U95RhZPZLzURvZ+Zze4VXJWff6jDW+JbsazbM2W0anz2Lp1C4KsFGwf+oxRR6Oz9fu9nokxqZWOBT8XJ2iL8QA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e3838f-f3d2-408e-29f5-08defca30cf1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 21:03:56.2730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYpKSiSl1NkxhygN/laupks/Nvc76Zq7MBFlYwhn458OURGE0BdBwa1/wNtMNC7CGoxhWgbrE4fdKJIQFv+TSwyrBA3yHSTcINKelNGCV0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8220
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


Failures unrelated to changes. fi-bsw-n3050 platform unrelated to patch.

On 8/17/2026 12:38 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/guc: Test GuC v70.49.5 for TGL, ADL-P, DG1, PVC
> URL   : https://patchwork.freedesktop.org/series/172351/
> State : failure
> 
>   * igt@i915_module_load@load:
>     - fi-bsw-n3050:       [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/fi-bsw-n3050/igt@i915_module_load@load.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172351v1/fi-bsw-n3050/igt@i915_module_load@load.html

