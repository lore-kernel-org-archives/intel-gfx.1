Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9374C44536
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Jul 2026 14:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C9E89FEA;
	Wed, 22 Jul 2026 14:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F7Lu7lje";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F7289FEA
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Jul 2026 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784729371; x=1816265371;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2F6cIP774aNkpOjEcY4cQly/c37CPw9CgUEPs0doCC4=;
 b=F7Lu7ljes2Dc7pIR4XIAMGvBnm17gdzHYN6XzP+/cX8DMsP87VM2K6U1
 z5FTXrCWWR2MgiM0pKVFzWTU4DyNUWrgHOjE2YW3GlNNiJfq8lfZ0H472
 7heyP6nEgd8PwWXHIxKcb0NYfnP21rtRtF9jhqi56ixcUE/47qqBbJS1L
 OsnSyyoILZCnBb+sCVjegAIzONOu0oYZfLPOMv5li2EKolWMQVjKGVQYb
 IkFxil+pQqlPGoY73YbmvfNG2VkOwxWSqeCdujpiCVad+TAlVj4gIjTMw
 n0UarNTWYsxNlugQs/zsncj3NW1ZL+F2uZD7/fvynw/6cS3ixXf5YAZaS Q==;
X-CSE-ConnectionGUID: +8KZQX3HQk2EvUoG//+0xQ==
X-CSE-MsgGUID: 5F3s63JRR62odUUW+s4U+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="108154295"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="108154295"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 07:09:22 -0700
X-CSE-ConnectionGUID: HcsxHbe/Rx6X6dX1+4oFRQ==
X-CSE-MsgGUID: 7Vif046kQqSwtHV/6EZbsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="258170192"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 07:09:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 07:09:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 07:09:13 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 07:09:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdG2DWdiJkqobMx7kN+QajdFTy1VyBAg0ryOZqxKxJ4yJvBg6tIWJi4y6xkpSnLY3kK5vIG0INmiCBviGSJNF+arFR1UNR8FVlwe9nKrGf43i/tS4VhAL1bspdwzkU625R1WW4oRCvgp+UV1cKH9CdHFOckpBVlAO/z51hMGZzquvkMt1mXU2GtopDHrmrTepVWxr5/38MCBYT5fpz7y3BNeWeafbcijdG/FQoU4jgB1Cg6hqmKzwWbceutY7/0g7MoSO4CoA44kKjhIUAo71T9OQh3JsfQuaDsx/wXRtOoWa9gr+PUkUN6LSyZzVu/98Vrn49QK7LqDcEz6t6FPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wr/9hl+KUOs4RTV61bBeMXikIUx8EAXLKlC5IhuP8Fw=;
 b=HApA8mwsglJLjp/k7S3RZVNDfl1ZWlniIoRuht5HcWADYrVKIdw4Wggzna25ZxWHLs4zDcDsLVYM7e3WNTAUZvK7R4sd6fJBVbqLW0GLoex2TE6TuOPLJqbxzYEopCOv9ytJjsOyW8j6DIe6DNOKXtHzMtYHZiGz5xb5O2KrJHiur19tSZ3y1NQDnxwxIqbQ6C0eUL/06f0VPcMQnlXkqXhVj1Q4UDQIhI4edYpGcMw5eBSKf2fjvxeX/j0EKtOBo8+d6JMDJVar6k7MRbxYSI63mrZEb0D4wrjQ30sFtEjo/YH+bl3ELLQBtOk4/BuFpjIW5FhV0NPCc8/kfX482A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 14:09:03 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 14:09:03 +0000
Date: Wed, 22 Jul 2026 16:08:45 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <krzysztof.karas@intel.com>
Subject: Re: [PATCH 1/6] drm/i915: Convert driver init/PCI/params license
 headers to SPDX
Message-ID: <amDH7Q1pNN76zcTS@kniemiec-mobl1>
References: <cover.1784713895.git.sebastian.brzezinka@intel.com>
 <3b7af1481b89841e0cfaa17b34068441e975f437.1784713895.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <3b7af1481b89841e0cfaa17b34068441e975f437.1784713895.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0302.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::19) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|SJ0PR11MB5150:EE_
X-MS-Office365-Filtering-Correlation-Id: a642c857-ec30-42b6-9398-08dee7fac8af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZeZcvLyn3u19Em0jxN9vlQ5Xm3H2V76w4ar01y02gsSlBjMhLg0THOzLqDachHAFnUBFkHERNPA2tmhGJItC8G8YFaAGEFzJ3OnTtg2GKsNvjNGAmTzRavc4hBwaIhRp8ISnsH+SOy3Acwc3jpGD/1D5bfamjCfP3eeSGLxYqeQjKCZuwkTwT+WUMQg/GrJOQtaWXgU6y7Qgtp+lp9a6i3WEhq73v1SWDidYKt2HqqLrBMg88P2DnI0IYlTZfEW4bCdcVA4nECg6JeWIZFc5fSBPgtbVA3ZnD8PbqTn5LEDj2Kn/2CQPWLbCfhV6CeUjebMMSzsZiE6+weynfJIrtFRbG/ARPemwHaIqP0VTmISCBsSc0fGBdPACFjuTOJPo6f6ia5iAimhA4iLLMISpWgP5hCpWwoIOpRcbRXMf/SzPbw3oTPdUhEotZvAsWc5XeVeMFdrxoNQVu9uMGeZUlztYlVw/UPHef+UP8BOJjIDXmbG7ykSPeCW1bwVfEA7Jrz0bNBWpYmWhNxWqrIm8SND/82cgpaTgT5YBJEHLr6gf1+hEL+q7vYpD4QtgpMXICyoGGn9EQsLdwB5AmVr17p9RBeSUzSiV/CSo4swgmnVnYmmBmpxitfk+O7ij2hHM3FuLp2cXiEpjK0B9BMga96doa+mSbg+1UQGvoky0LoY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHpXRVUzMGZGeUEzMk1VT09qOEplNC94dG1uaXJGOFhnclYxQm03Qlg1UGpJ?=
 =?utf-8?B?TW9ES3draU9SZWdoVmF2R2dZd0d5ZjZKRThiZzIvZ3UxaGdxdmNIYlJHMHg2?=
 =?utf-8?B?Nk9EKzQyS203NnpVNUx6OTQ2dEU3T2VTcjNzdjFHS0hyVTAvdDlQYWtHVTZZ?=
 =?utf-8?B?Szh5TVRvOWxrdnVaWGM5aUhYTy9vTm1OM1Z6MCs1UkxVZExuaWhTMER4aWlD?=
 =?utf-8?B?ZkdUb3M3ZHpyZWVMM3UyL3d0QlJDSkwzTFFsRS9WcmhnZkgwYkpnVWRsaFRL?=
 =?utf-8?B?aHZlUjVxRHBBUDZCYmN3YzBOR2ttVi96WFllN0I1cCtoVGpBeklRRmhKMEtC?=
 =?utf-8?B?OGpCVEh2UFdDUER3ZjZzaDVsZUlHd2pZc0FBUTRzMnIzbVl5UXRIZm5ySVdN?=
 =?utf-8?B?SVlkdUhtWUpxbWVsendOY2puaDBIUnlubnNmLzhERXl5OURrTStLa1R1cmI0?=
 =?utf-8?B?VFVTeVIrRGpWWWZhSEdpbStuYVliV3FmbHpQSWUvSy93UmVYaHZPcHVOVVU0?=
 =?utf-8?B?UXNGZk1na2FneGVOa3BIakd6L2tqWVArbzhaL1IwTk5qU1FNZnkyWERpTFpk?=
 =?utf-8?B?bFhEUUlrbytITnZ6a0NFOUQ4U25relJHWGJOZElINEUxdjRhMDZSeFVXWUZm?=
 =?utf-8?B?U1I3bTdNZWRQQ0tlQ0RobzBoSDFLdjIzY2pQVVE2L3FZMnA4QituQUw1enRn?=
 =?utf-8?B?OW04M05qZ0ZJTmttMTNtQVQvY3FFTGMrOFdmSmhWeUJnZzhJUE5ObzdsQ3p4?=
 =?utf-8?B?NUdZSE9mQjkvUDE4dWhoOGg1OXNSZlN3cWJZNDVGWFdsVlJFOEhGSnNva0J0?=
 =?utf-8?B?SEkvUk53Tmx0c1BYWXZMNlpjR0svOXdpQklxMjRUVHFPT1hQejdGZ3ExUjJS?=
 =?utf-8?B?N0E2elhRelJvRHhjblp4cWxtUHg0eTJWZ213Szluckk4VmJHZFRKWkRzazJl?=
 =?utf-8?B?MmtUUHZVSkxBTHBIK0pSZWdGTU0zWmo0N1VBVEZDZU5jeDRuWlB6MytrV2lW?=
 =?utf-8?B?QUhPMFZTTGtHT1hwTkYzaHZCZkZvemQzRDIxalFpdGlUdFRNbjFLQXArWHEy?=
 =?utf-8?B?bGNYL0FxdnRqZjkxajJ1UXE2MkJKek9zWmFSMHpkMnM4Vm9LQ2hSR1pycUtD?=
 =?utf-8?B?L21jL2JiRnIrQ1RNU1JCelNJWGs0ekQ4THlXM3RtMTBLU256RFhja1pSa2lE?=
 =?utf-8?B?Qzg3cUErZE9GSU9rL2FaZS83MUJId2sxUnVRb1RNTXU2WUNRL2hTRFROcTBX?=
 =?utf-8?B?TG5jNzlpRmVmeXZOMHJJRk1KOGpuaDlTaHYyQVJZVC9kN2hEMHhoZDJWNEs5?=
 =?utf-8?B?eE04YU9pSENXcThxTlFLSnBHUXB3S0dzaFlpRDRGekUrOWxQaWV6WEJydHg4?=
 =?utf-8?B?SnJFWFBDSHM5R0dZdDQ2TDIrbHgzd0pHL1VIVnQ0ekl6SlY3SWdiYmNxQWlZ?=
 =?utf-8?B?bW45TUZNUFRiZ2dSN1BjODRWMlRyTUtxZVhoZGxpZDhEY2R2VnhKUEN1Vk9u?=
 =?utf-8?B?bmkzOTNQOSt2WWxjNmhNb3ZabFpjVzBlUTUzMlJwaEFTN05jd1IxSyt5NVVX?=
 =?utf-8?B?TklZcFc4aW1qY1FhLzBMenEvR3pnQXZxYWsxbWJFYk1mdzExcC92ZUxiUjBZ?=
 =?utf-8?B?K2RIaktXUXMwQW93Q2kzRkVqY0pzZnJEbjBubHZDYThyVTBLL04zUDlzKzho?=
 =?utf-8?B?Ri9xbmxGanBKMUlVNjhEaXdVODZUc2NNQUl4aDVJNDE0WEJKc1gyUTF3SVcw?=
 =?utf-8?B?MndOUmVpejVwQ0hrQ3pKSU5wN1pUUEhBdTNMKzNodm0zNEVPT3UvNGhRUTg2?=
 =?utf-8?B?REsrMHBUMEtCL2dIQ2hOM0k1enlkZ1hFTkRsY1BtVU04ZjUwa09SR2llWUhi?=
 =?utf-8?B?MVZJcGxFczdpaVN6bXJsWkZublM3NFR0U2FlMy9NTTFmTWdSWTVsbEpScTFZ?=
 =?utf-8?B?NDVzV29yTFdSYmd0cWQzNm01YXhuR29aVFB2UWMvVUhxMlZoNlpKMXExdEVV?=
 =?utf-8?B?T1EzTExTVE5FSnFHSXhyQStHSzhJOWV2V0VMb2kwWFlCcFBWTHM5dmc2TExF?=
 =?utf-8?B?cnl2QUFLMGxyTEVVWTdTRXhpd0g0UkJTaVVvT1VpbkNRY3FTaHZVY25zVUYr?=
 =?utf-8?B?K0JIcUtIRXAzR2x6RDZ5UG02MlFwTXc0Tnk5QU9Ycy9ycmFXRzYySWR3RmVU?=
 =?utf-8?B?b2MzOHl2N3pBRVFlbE9MVWliOXg3Uk56QjNaODVyS1h0Ym4zYzcrL0o0dzE4?=
 =?utf-8?B?YVNJRFU2dTFjWGlWV2lLSXc2WFRUVXpCcVRtUzNiOG44UUMrb2tJK3hrMkZ6?=
 =?utf-8?B?RUxqWGRBS0c2UE9ka1BnZ0F4eXpyUC9sR2wzVUFvYlNPb2VWaHBZczBSL2k5?=
 =?utf-8?Q?nS7Chc9RCrHJ1lgc=3D?=
X-Exchange-RoutingPolicyChecked: rmF7itZ7xMjJUWtvBKnA1F4brcps0bwW0dvGSaKE/Yq4oYsMQVVQfEz1XAVC7G1S4xbxTHgoDV/mHmFabiVQhGLYjX/2d65QpSnyn6At7992IPz4UcutAB9kUU64x6Nk0RRvOmHmiXfx/QjwP5D4dJ7+GSIoMAOf/AvMZkhDi3IOxtOWHdMK4W0fTNmHGOFYSdj6UectcMjztKcPR6FjOsUTXLi4LA+yOWYM/56vIaLUScV8Gvc+4Bwyg2he4ZaORsd9bHANPBaxcU7nJDFUvp6Y60R/QU0Enhb4jeawSO8K1V6btiaxIQS1tsXVXDIYX33yPx6OrH2om8IjbmvtRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a642c857-ec30-42b6-9398-08dee7fac8af
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 14:09:03.0348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbbACeL+LXht3884LRgCfAQBixjCc/CiTNpg1aW7A6xUzsf5NiVdNFiQjE5GidMM5VdK0zY754ynqJH54IFzWlrTAZ0db1Pd2XWnOWscW3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5150
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

Hi Sebastian,

On 2026-07-22 at 12:29:18 +0200, Sebastian Brzezinka wrote:
> Replace the verbose MIT license boilerplate in the core driver
> init, PCI enumeration and module parameter files with the
> corresponding SPDX-License-Identifier tag. This preserves the
> existing copyright notices while removing duplicated legal text, per
> Documentation/process/license-rules.rst.
> 
> No functional changes.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_driver.c | 25 ++-----------------------
>  drivers/gpu/drm/i915/i915_drv.h    | 25 ++-----------------------
>  drivers/gpu/drm/i915/i915_params.c | 21 +--------------------
>  drivers/gpu/drm/i915/i915_params.h | 21 +--------------------
>  drivers/gpu/drm/i915/i915_pci.c    | 21 +--------------------
>  5 files changed, 7 insertions(+), 106 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index ce6d20958320..3beeccbed949 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1,30 +1,9 @@
> -/* i915_drv.c -- i830,i845,i855,i865,i915 driver -*- linux-c -*-
> - */
> +// SPDX-License-Identifier: MIT
>  /*
> + * i915_drv.c -- i830,i845,i855,i865,i915 driver -*- linux-c -*-
>   *
>   * Copyright 2003 Tungsten Graphics, Inc., Cedar Park, Texas.
>   * All Rights Reserved.

I'll ask cause I'm not sure - Can we put an SPDX identifier on this if
there's "All Rights Reserved" in the license? The original text of the
MIT license doesn't have it, so I *think* it would make it a derivative
license. Right now the phrase "All Rights Reserved" is vacuous because
all the members of the convention that requires the use of it are now
also all members of the convention saying that it's implicit; but strictly
technically speaking the text of the license on this file IS different
than original MIT.

It's probably not that big of a deal and/or I'm not fully informed on
this (there's a bunch of files in the kernel, even new-ish ones, that do
"All Rights Reserved" with SPDX: MIT, so maybe this is allowed) - but I
think it's worth double checking.

Thanks
Krzysztof
