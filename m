Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35299C61DBD
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2026 07:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C5310E266;
	Wed, 26 Aug 2026 07:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbroaXmu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FEE10E266;
 Wed, 26 Aug 2026 07:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787728984; x=1819264984;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CRcujporaARf/MKS2mKV2zZ6SNcpOmucPxdLQakj92U=;
 b=PbroaXmulxsa1wdbb5f6J0kuWo04JLGEqyg1uQr4vB45oXG+sMJqChF2
 Rr03A6noqk8p6CX9ClWmdnqdWM9PN9LKyTZbENNfXxggrZNyWqIgrKqCB
 dgj2Wk/JGUFpRQIW8CktHm4ZDWi6xV/+ADaqAyA+3lWadBHzg1uMBLCMF
 7mIispdogmSqEFCGh3paBABIp6K9LJQirQV19WEmr/Vn3gFG+1dm6zO4A
 cY4K7Cij13iWtZkrITfpLBt6FRDSN6YD39GZWv4mwoCIULgWftDp9768c
 kKe4mejbfgyNyvubsBzt/c8yUb7RS326+MFzoBmleGMNd9C5Q7GyGaEKI w==;
X-CSE-ConnectionGUID: Jq51MVtFTEGW2m2Hr8kqbw==
X-CSE-MsgGUID: j/Ec5VlTRQuqUT9HU2DC+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="92067195"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="92067195"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 00:23:03 -0700
X-CSE-ConnectionGUID: la6xhgCdRXCGMvbiioc2Ig==
X-CSE-MsgGUID: j7BkPAloR4qRUv+J21ev/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="291029174"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 00:23:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 00:23:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 00:23:02 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 00:23:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqAVAmedbdNwZjuxHLa9LbNcd8RrBGu4lOnrghei8ZV7BuW45EqraJUvfBr63yGGyMaIB2ftRBFv5AsFvRDqgu5Yt3b0KEfURd+Dd/TPHy69qJSze6hWBEfbeerXmCbUWwFGa9OrZMFnNPJCq/IWcC6t8rLjO65KBCa08YUk2T2BEecR9+nzIGRYqSBtm9YuhseTv71d745XtGB+PhH8C5uRNDeMZWB7H6f+6rqIO8m5BK0SsoJpOHPm3xiMpCQmaf8UnCXNft+QmkO6sp+bU4qP3HEVp/VUEVI/FiUr1t4MRdj+OEJA6Rh9yTWoIYWilFWzMWw0LOf/zMfTvpV40A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0wpGt4lriE8qm84tGdsZG/+LI/Lp4uO7TFkygZBpxE=;
 b=lwj2KpfpR5k4eltPygJ+KQAIiFxxUrE+zyG20vs/O46PnXiLxHPi+flZPM7y4Ab9ZjVSSYnJh2OWGvlNYsdKEYR7v/Un5wTmqJyrtVkPS6sezXwlwgrjwK0L6soFChIyuAQrZDAHWccX2IILUPFh9Xe1391WEXJxIOHiqeihvoeXwLUPeCKplqzwiD4gkox/27NPNIiepJavcTBRf3zRhpXPEASiBxjDaJ/7dmpUxZ1DG2B3udsAYUlarhr0nHrWywKzswXbHyyrfw+pfTUmWArqwtAoAx7eKOpdQk1n8B4jRawbQxp1zJVvY5PHD45pfACfwZA1SNuipHkg575VAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by DS0PR11MB9454.namprd11.prod.outlook.com (2603:10b6:8:28c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 07:22:55 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 07:22:50 +0000
Date: Wed, 26 Aug 2026 07:22:37 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/i915_module_load: Ignore missing PCI
 reset
Message-ID: <de2edq6fy74esmyxzr5t6g324eylmolpqump62qugnchydfqxr@ewystlifzhuc>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260820184304.1968012-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260820184304.1968012-2-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: TL2P290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::19) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|DS0PR11MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: bae0437b-3e48-474b-6c71-08df0342d5a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003|27256017;
X-Microsoft-Antispam-Message-Info: FiLd3yiPCjNQ7EpIQFmGTiUo4qoWgRcwUth99FmbkF5hzp30mTZgitsHVSqCutfrpsRp2jV+eqAaVxycUI3DW/Ta39JtoQCgZLF7H8pmXJAKlNeqxC+R8wL+fnmdsP/1c6xOyjkjxbdw0Kmzp6D8CeP6REnHP+A/Li0tXYGy+VUfG08AD6PtYNBLm0ZdmzYIrDP3GocoxSW23yiJLOF0QsOMXIhWIbtbrozxLJudGSRC6DIq6IjaRK6jauYDkYS0aM/b3LJOGhYpFiE5kEH3EK45AGrkteC6eMZAGiLll6Qu5TsNNFhSBBbmvCbneSUlCXND6slsVaEvKo72b4/ZLhOFpPo6itAb1kVitXWrw6JMVISQA1GQ+K2ZxuDSzEESamUGWJ3X5YmJy0pOqMIIly7QCCwhUbEyqsWdeJYXChwYyE7a+j8GBNlHmYzleKunjyvy1WkS83k6+omIiuj1i74wORummKnKbLG/BbZzhCENXfLvetsQGBN/uCROlkdThkKuj+QMaE7H74pkxOemcvRRX9pZQjLD8CpFVS2ZdJpzKB3pULD1fEUytww4AHeOQn7ppWRSO0ueXcsn0OOKbCuP4IqeLSXDkcTa7tKzWDiqqtcAkl8Yo8o5OPpUKcghhIDtz/9hRc3jQHtwCxR5CR5+3ThT2oJ1ppuYFpNwZ+wGfeHmMKpE6ivfH+YrlA84iblqLBXS5h1CA5WogwoqLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vkk4MGQvTWVYV0xhd1U1YUNxaCtEU3JwbEQ0SmNScHRlSEpzR3dISnhTQzhh?=
 =?utf-8?B?Q0tSV3VGTERRaUgyclJTbDVVankrZ0paekd0K1UvOEt4Zk5ocnJLU3lRRFo3?=
 =?utf-8?B?M1ZJdCtPc3YrdXBMLzgyRWZYWTBEeGgzMWg5VjJyS2NRUS9VMzQrRkdOd2h3?=
 =?utf-8?B?UG1XbGJzSEdNc3c2bFVZMnJ5eGJCMVFzWTZ1WEZiMEpCQU0zWHU1RWZuenUr?=
 =?utf-8?B?d3JZdmZmdGlyOHhySnNnOW5TYXJ2TjBtQlcwcjBTcmRTc2YvaGRTNTJJL2xH?=
 =?utf-8?B?ME11SHpJVVc5UEVsUytaL3Y2MTRyTWpmZER5VGpBNWwxbEszRXhjMUN4bGlj?=
 =?utf-8?B?QjlySFZXY1dSSktuMXJkQlgxTnVNM3pnbWh0Q0ZvUCtGTjVwclIrc204Zytl?=
 =?utf-8?B?bXkxSGFNOTFZaUFyL0lYbE1pUHlnMEVrSDQwWTgwOERYVC8rRzdYM3RvOElD?=
 =?utf-8?B?dDhSaGp6OENRNVBSWDRRczhSNUs3KzlUOHZWeiszdVBMYldRb2h3QndlNzhj?=
 =?utf-8?B?a0dQZXg1ci9LZmprQ0pCS0Jwd1hxRnUxVEZPNE9JaWV3bi9aeXZxQWVLYTVm?=
 =?utf-8?B?M2ZUUkFjQk5XK3hvMWVBYW8rRHd2eFNCM0tRZGR2R0E4bHU3YUZJczNieDB3?=
 =?utf-8?B?ayt4T29iNmV2ZnhtU2ZieXVneDVPaVJ1YUxMSXAxeU9aWWZMWXk2UUZKL3hF?=
 =?utf-8?B?Q1JxUlhZOTIrWllZWHRJQ1ZzMm9KTlB1akVrS3R4eVFGYjZtL0c0b2tud3Ix?=
 =?utf-8?B?Ym4yMFZJNS81MnE4NitrOFpDVExTM28wUzdWY1doMlFOY1h1T01zY0lLM05G?=
 =?utf-8?B?dHJNajF5SzRSMDM3cUZuL3lWWU4wOE96aWhvbUlpTjlreENhenhEa0xORUIw?=
 =?utf-8?B?aVBuNGgwRDdZR3pMdW1UWENGWXEvMkgvcyt2WC9CWUkyS0VCRTRDRnF1amRI?=
 =?utf-8?B?aFFUZDhRb3dZTW53b1FLNURCb0VXd3VIdkhyRDUvdmpsUXJVTm9vZFdBcHhZ?=
 =?utf-8?B?MmNXdlF3c3hjaSs3b0dlQ013R0RwVzRFOTdaek1YSTZJeWRJbFNBTkxZcWQx?=
 =?utf-8?B?bGF2K29KM2wwbGwrNjVaZmx2alJINk1CaXgxdGM4eUhabjR4bGE5VXEzRm4w?=
 =?utf-8?B?MUpXcVF4QjB5NE9uR2haUXZHYzJnUldzYUpZWFl3L212V2tHbXNjb2NUTElp?=
 =?utf-8?B?MEFLOXRPb2NtbUsrZWJoS0hjK3VVaHlGeUFZbjRXeW5IQWtxR293bjMzdldq?=
 =?utf-8?B?bS9qTDZCTUNjZnJQN0xsYTVWQU9vV0hoU2w0eUJHUm51cGQxc1cxWVF4K1k4?=
 =?utf-8?B?MXc5K0szVFFHcFFXb05neWZKbitQYThFTjJUellDZmIvZVFUanZsNGwvdzc0?=
 =?utf-8?B?MUlyWEpDcUJhcHZ1bzhKbm1ZeDFCcjVaZ1JlWjQ0TXZGUmxSSnZDUWI3VVpO?=
 =?utf-8?B?aXR6aUpqNlQ0SnJsMWZZWEQzMktGdENxVzNVUXpaYkRWdUJpdmZHZzlOWlpG?=
 =?utf-8?B?WGErSG9oajFjb0V3dW5PTmJRWlZrRFY3NlZqOW4rSFdSRk9HV2VySzFKOGRQ?=
 =?utf-8?B?b2FFWnJRVXd2S241UFVyT1ZBckMwdGFPLzM1NXhKOXhqMW9sVENzSXMxU0tY?=
 =?utf-8?B?ZzFBcDZBU1ErYnd0MnRrdWRvcVlKUFEzVjA1dFFGNGZDOHRTTkNnRDE2Vk1z?=
 =?utf-8?B?S2k1QnRFQjdnbW1PU2NFKzYwNk0xa0NUYVg0alJxQnI4bktiNHpGbEN0V0pa?=
 =?utf-8?B?ajJWSWJOZFU1NDFKSzIvbklMcmpNLzNFVHpMZnpPRGdLbTBhdG1VYW1lbDN6?=
 =?utf-8?B?d1FZY0tMRzFmY0h3QnNZbytsVmFpbHVKZERsckczMmUyT0xOSE93Rk1hN1dQ?=
 =?utf-8?B?eStLZDVadTQ1azdKWFBETFZhNGtXTjY2TVFVMC9rdnZ4RXN5cXVhbWRJVVpD?=
 =?utf-8?B?Z0ZadTU3dWhHK3RwM0lIcldGVXdTaG9NemJQVnFzUndhYXhtUTQ0TXIyUDZC?=
 =?utf-8?B?Zko0SUw1WlU5WG5iSnAzUkVKNWY5eTVUWHhNeXFxMytuUEdtaEhSSnF2NS8y?=
 =?utf-8?B?bHd4V0lzNHJ6bDdiNVE4L1RLZzg4UWJ2aFZuSnN3b3RtQzB2K3dIU1dZMDVy?=
 =?utf-8?B?LzZBRDh5VHlab1VwYStkVm5kR0t5Sm1QRlMvR3dtdytrWDJ3ZWJ3eDQ5T0xt?=
 =?utf-8?B?MjVBNld5cnJ3T2dhQXNNYjBQcjJYMFc3TTd3a3Z5Z3BzM0hGUUl4V1JpcU5a?=
 =?utf-8?B?NDc2RFhrSXdPclhyblBpWjdRcHRvVGNKMkY2VGw2TFJmWUFtK2xJdmR6dm9W?=
 =?utf-8?B?NldkeGl0OUxkcFNCNjlzdGFmSHVQWXlodVVQajlSWTRlWit4Ym5ZNFRIU3VI?=
 =?utf-8?Q?2rzHZtyPj7C5HbO8=3D?=
X-Exchange-RoutingPolicyChecked: BCd2Ek95dkvSl92QMsBKK0nF7ptOqv9/dmypP3aBE+VLJm5fGbulc80TgsBo/+Unpp6r921CL7h4WGa34Cx5Q4FJzjAOikUHQou7coy6QDo7Y+4Dg/++bXnRkOjxebPzYPxueF7IzMIQr1aFPw6VrQg0Gz/sAz7J/H3avsJLVBgI879k/pif2uzsPKyIwzym6qWx9UjU06yhUYp4JIBqYeiDlZQPEvRLx8x1v0LoUDm+xrxpGlS3lVi9J+ErIRnWmXThIeWfLemMuaA0UBEricNYuUYG6OWx1fL/vfpI6yleHUZZNNCtXaOtmtrXMFCFzWhdnHaC9K+iQP+GUH7lBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bae0437b-3e48-474b-6c71-08df0342d5a9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 07:22:49.8579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alwuqZmd0UOmAo0rsorh7XFr3RCdCmc8tfYb5FjQqQ24tuyp7lYrM0cWDaOW+GQ0Ge9TdIZ4S8JkGXPYkf+AFGXL4AClRPKbEbBQJ7gBIH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9454
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

Hi Janusz,

On 2026-08-20 at 20:41:43 +0200, Janusz Krzysztofik wrote:
> Subtest fault-injection now performs PCI device reset before every driver
> bind attempt and fails if that reset doesn't succeed.  That was OK if all
> devices being tested supported a PCI reset method.  However, machines
> with DG1 SKU 0x4905 used in CI suffer from device breakage and system
> freezes after any PCI reset attempts, triggering CI job aborts.  That's
> going to change soon with an upcoming kernel patch that disables PCI
> reset capabilities on that card.
> 
> Attempt PCI reset and fail if not successful only if supported, otherwise
> submit a debug message and continue the exercise.  With that in place,
> the subtest should no longer abort CI jobs on DG1 as soon as the above
> mentioned kernel fix is in place.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  tests/intel/i915_module_load.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
> index 26e30a1000..68e2386465 100644
> --- a/tests/intel/i915_module_load.c
> +++ b/tests/intel/i915_module_load.c
> @@ -463,7 +463,8 @@ inject_fault_probe(int fd, const char pci_slot[], const char function_name[],
>  	injection_list_add(function_name);
>  	set_retval(function_name, inject_error);
>  
> -	igt_assert(igt_sysfs_set(devicefd, "reset", "1"));
> +	if (!igt_debug_on(!igt_sysfs_has_attr(devicefd, "reset")))
> +		igt_assert(igt_sysfs_set(devicefd, "reset", "1"));
>  	igt_kmod_bind("i915", pci_slot);
>  
>  	err = -errno;
> -- 
> 2.54.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
