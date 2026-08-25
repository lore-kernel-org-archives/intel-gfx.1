Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CA3C61DB9
	for <intel-gfx@archiver.kernel.org>; Tue, 25 Aug 2026 15:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B24410EAC4;
	Tue, 25 Aug 2026 15:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g7EmIgLE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A700B10EAC4
 for <intel-gfx@lists.freedesktop.org>; Tue, 25 Aug 2026 15:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787672190; x=1819208190;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jXMyOZRdemCnwWaZsCZgCtBg2pFYZ2pxF3kXxcdq37E=;
 b=g7EmIgLEja1X9LzKQ3o768cMv4oO44I8HyfEDqOHd8j8Tf4gyha7DZb/
 PTChqVD5pbdjVVIWiwzUhRaWlFBxaFET30hQQ4IG3lbbRqUHB5UvEsbfr
 uWPT5zRqS7gmKCKXckLa3U3fHUgpGwbbtluC07W+YnS2GzIc5nk+u3ZB+
 i7fyKWqG2kkcy8WlJjIj1ipyNtzODcljGPek9fKqeOkB0cYqrqOE2XoQp
 CkAwTu2A1xUPXr+GUsnoV8qDsSe+PvRKB4VDeWKxAYm42aDC4Cc+8LAsq
 lX+oYwlVPpCbZM3WXuCScn4taEvLgUU6ECa8bGN7nWLT3d3JwHoHsrHFd Q==;
X-CSE-ConnectionGUID: 45OK/pw3Ri6G2keVOoJuQg==
X-CSE-MsgGUID: 0v+GxIOQTJOCUoYUeHg/yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="99303115"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="99303115"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 08:36:29 -0700
X-CSE-ConnectionGUID: x20wRTwkRmuFM3hvQ2jtNQ==
X-CSE-MsgGUID: 5LW48MCqQQqGZTrx4TGPTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="271518504"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 08:36:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 08:36:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 08:36:28 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 08:36:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+L+CibCIMmrvErm+NDL7mHdqc5C/QReKMuelhG4o2Q3o6hUtEcfBOG3qRa3/bJVcB73YH5LomVhyNQMaP22a+vl8g10vcT1XtO3wz2ZJt4jnQFn85zIz2wbAhoGAmhu+dT5v9dKxv7SmXl3gWBAxd302QsYSsI98iA4bLQ9qtGsE+b0MF/fL3/znafAyg4Fh65IUbJivJjzIzdWP+4B6wKxQ+vHT2hZ0MIdHbO33NYdkvouCbARc/T3OyRdvpn7OVEgcUSqV6j+WQRUKC/XuYAItS5a+3Js8qT5+1hd+nBwfSjEL12n6XTUpKrNLro1qLKd1I5S1gkHdN4oRvG5iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3fPgWJln1kGdprLMoB0H4ChrqQ8SUxAIc35PZ6ACnE=;
 b=Oi7e3MRGZZCdTAyoQT9+54tdLBTVfCuh0e663GM09KUDYMqeba+SbWm/wHyK7xmL3NiGrD4LHolRiE0lJ1/NuJ1pjxkujUIjeU//5KagURNkUXc81HJXmPP7qFC2h/aK4iACbZQCc1b8GdlELxWNZ9xxsSIyIOY7z9NshruCWNMepAOeiSEwbeFgMDI0AAW1jj3W4qQuTVc+qr27E8do9YSsGjxCNn1AoiiRUA1Z0TmDu0OUZQ00jGEMa8dp57Pd/fJcDEcb7IXBUCGQFqF0lEM6ptp8BvhpqMmGeVHKhvyzZT8e/3RC1cP40pNhMXPMNxy9VS6vUkW8y+RavvY2gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SA2PR11MB4811.namprd11.prod.outlook.com (2603:10b6:806:11d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 15:36:24 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 15:36:24 +0000
Message-ID: <6e3703b0-0a50-4c97-bab3-884f03a62d1d@intel.com>
Date: Tue, 25 Aug 2026 08:36:22 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_drm/i915/?=
 =?UTF-8?Q?guc=3A_Test_GuC_v70=2E49=2E5_for_TGL=2C_ADL-P=2C_DG1=2C_PVC_=28re?=
 =?UTF-8?B?djIp?=
To: <intel-gfx@lists.freedesktop.org>
References: <20260817184548.2905639-2-julia.filipchuk@intel.com>
 <178729204091.72787.6448210765808257856@61270ab9df2a>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <178729204091.72787.6448210765808257856@61270ab9df2a>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:303:b5::26) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SA2PR11MB4811:EE_
X-MS-Office365-Filtering-Correlation-Id: 95dc2789-3022-49c0-915d-08df02be9f08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: uz3Lk27Pbfx9UEr3Fp6mKzgyNnco49wM8ksX5kiEOW3yRB7TNgpTZ7FzPRIiM34/Lit/x0LcWJdLuuXLqGCfGo3UJs/bz5Eqk+wUDN5Q7k+ZpvaimM87EB7dCENNcyatRui/JpHP2UFwMJK947vLI+U2RsiiRxhkaBgVzr1d7oJi0+6grXZDtagq9fHnmSPf85b+wNBeIUTsuSW4OUbWLA6tDcGmbCCEQ9uws5Pyfh8dPwOX9VhiMIhHPhF+mhEmQscpXAcmRhpv2nSAkWyGm6PaAiqg+oaTu/75kh4CGI+Tg+Y5q5Jr4r/N4RUzRo0pU59lh9Vl/oUdDm3ohK6uNyiCtpL5xyGSg761tmjNqTVA8i5PoFl1hWKHGm+D3cXB2g+GvD1fAWWGihdSiK70Uh1pe7NN3KnsHl3IAj9ES+/EM9MKEs/pknf6r0AhfDTn2IMwyLr9471nAg5j5EdpHZHIn/DO4butmc94CbWViif+S6JseiUH4pGZEUwoFl5z1C6lZrKtwWSbROExnc1PokzHrRB1IJGmA0OmQifqVn0DnkQSDZ+rtt+k/2rTjHAHzi3P8v5ZPBzRO3U8fOkF6rY+fQ1lTHcgrajhKSOylvs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MERmOTJiMVVleTdLN25KL3REZ3dQSTBVTmVNNVd0Y083Y1krZFFPSElFc2NS?=
 =?utf-8?B?KzdyOXE2TjJsS2dEQzBwVmoveDVDN2U1eDdEbGdMc2plMW5weWlsT2FkdDZE?=
 =?utf-8?B?RFgraVZsTWJTZlRON3hxSStaQWdYV3B3SmJpM01jM3RMUG95cktpNk1OWXJj?=
 =?utf-8?B?aFhndTg4RTEvZDMvMFpEVk9hQ09YUGpINzRpREdJOWJnZWl0UjlPV1RTUG1C?=
 =?utf-8?B?TldRT24vVElpd3ZKdjBvbEt6R1lzSm9hdlJpZXVMc0lrWTRhaHJ3RmZaWlNL?=
 =?utf-8?B?QUVIYUY4NjRDYlRGSFBGWDBlVzEvTjR4aTh4SUJ0eW1GNzFQMnZCbE1KUW1k?=
 =?utf-8?B?cXBiZjlHbzdhV2pTV25wTDc5aTZyT3JwSHo2bUtITUpEblN3K2RvTlNkei9o?=
 =?utf-8?B?MDljRmk0ZlZUY3pUZXk4bVYvbksvVFJNYU5xUERSNS9PKzhjNlJ3QWN6NklT?=
 =?utf-8?B?eUp5aXhTUlp4TENCazU0QjY5S1FVVHF4OS9pNEJPM1ZHUnl5WDVOMFFraFAv?=
 =?utf-8?B?ZEdxR0pzalRlQU5vdjlrSmsyMGdnam9JbXpwaWtXY21rNHlYckVGbFVXekpp?=
 =?utf-8?B?dzhYOHdaQ2wxY1A2YmVaK2hvOGQrTjdsK2hrR3pOamVteENwOVhTcnA5dTNk?=
 =?utf-8?B?UVl1QUNpbUJMVjZwdlk1YXJrZ3ZEbUpVLzdsaVFvOXIzVlZleHZxRHY0WFNM?=
 =?utf-8?B?MUhRcXRwRThsR0lkVmdueHk4MXM5NzZTTGw5WkVrRUdEcGgrY0lQaHRRTUVU?=
 =?utf-8?B?cS8xQlBNKzQrUzU5a1RHMGkzc20xRjVacmtVZUZUUVkwQkNBcEZhQ09NYkoy?=
 =?utf-8?B?SzYrVEUwMlFJV1ZwNUQvK3FNaWxnZklNM09IWFFFM3VvQWpxem52aG11cU1S?=
 =?utf-8?B?Nnd6RWJwVXJwMVhnNFkraXRuK3YvTW1sVG4wRW9BZGRHOE5Fc2VhRUVwQmJh?=
 =?utf-8?B?UjF6aldzSWpXV3NxekFIT3A4K2RZSTJ0UWdqUkluanpIc0FGaGcrRTRBZHJH?=
 =?utf-8?B?SXhRRW9ZY012REhEN2FYN0Fvdk5uRldwSE5GY2FCcnk0b1RLOVM5ZXNHVnlI?=
 =?utf-8?B?Ukcvck9leWpFTGxjQ0lxRk5yZEsrR2ExangwaUthY1NUTW4wSXVlUFVvQjJo?=
 =?utf-8?B?VkEzZ2RIOHFzMnNwaVAvVXpiMS9ndXNaWHlNTFNSZUlZMW45RHRiK29leCt5?=
 =?utf-8?B?MWppVzFzSU5rQ0VCSU1YTDRZWUJTTXB0Ukdqa2llUllaNzVOOHRvMUdsZEN0?=
 =?utf-8?B?Ui9lVGpZUGVaajE0NURodEJxT21Dd1JJZzlUTjdyV0RiWTJldW1TWWs4SXVv?=
 =?utf-8?B?bG5ZSXljdDJvV3JXbmQ0SnRWalAyYjdhR1BZS09kNWd3ZlFhankwN0R4NnRZ?=
 =?utf-8?B?bFFVZkxnTVFYMTVSYkI0dXRZN05lZlhWVklOMHpPN0FzMEh3ZVhTbHhsWGhJ?=
 =?utf-8?B?MmVNVmhwTCtpNE9LeVRONUtKNHlHVUFnb20xQ1pCclFVZUpibkxlSUk0SVB1?=
 =?utf-8?B?amV5RGZiMkxtUlN6UVVRNWVRdmhYSFM4ZGF0R295T1E3YTdGd0RwMWdqTHRR?=
 =?utf-8?B?SzI5RUR5T1lYOXBvRlRMaGx2aWRCR0dmaXk5TWJST25OOENLb05IVnoweXh3?=
 =?utf-8?B?VnhqNlRQMzlRZTAyZVB5aEhPbVpSak9sV2NTRkQyRzBHakJ6NW9SUDk4VXdU?=
 =?utf-8?B?WmpiNHBCNS8wSGFoNG55Zzk4bHc5bWRNdWhoS2ozbjdrc1RUVjhydmsrZGtL?=
 =?utf-8?B?Z3pJVVpOZGVJWWtCeGd5VzNZWnFEajdWQ0g1ZTd4YXNkODBIMXFLZG1KMGhZ?=
 =?utf-8?B?QUN0Sm1IRGNCQnFCcFJoU0hGVGZHaEc0NW9lUGRhYjBCVTIwMDU0ZE45dnpH?=
 =?utf-8?B?bnpuMUNMWFV0cTZWeFVQNEpNaFg3TytvV21vOUl3cVcxK0N0WGpyUjRaWGU2?=
 =?utf-8?B?Y2w1bGNYamtJS0liRDV2N3RJZTY0S2RpR2NCb2NmdWt0NHFid1RMZHUybFY4?=
 =?utf-8?B?RjhVMWVwTHFJYlgxVXJWbmFKc25BZ1lTTk1DQUVlMldieFBKYURpdXlMdFVQ?=
 =?utf-8?B?aGxaR3lQbXd2VnZFNWNIbW5XY21US1NaSVlvaWJ4OENtTFBtVVlaQ2xWZmRn?=
 =?utf-8?B?SmR0aWljaTFhZHlzaW8xM0Y5OXUyV3ZvbFNVQkxmMkpLdTJISGNOZDNFRDds?=
 =?utf-8?B?N24vYlNEMW5yRTd0RFNZZjNYejFjb0l3alVYN0l5b2dCK2VCQzdjY3Fva2hG?=
 =?utf-8?B?SzFPMnhDZDBJank3WHFoeXI0QnNzS1BPRnFjNXB1Y09PZXZlKzlLTDBKL1dY?=
 =?utf-8?B?N09lYXdmWXBtdFVLeHcrY3Y4eEJGdWt3TE1tYjJ6bzljbHBueDhwV2pRUmN3?=
 =?utf-8?Q?jaiilcASj7OZkg5c=3D?=
X-Exchange-RoutingPolicyChecked: NHVDN6AIjK/YNQ6nInNTh6xIejUeUop08oImYkfXRj6SKadvQKZ5p6c/sEmV9P6Uw7SZeMv3knAmlDX97tyLp96doi9kgkq+CtPa6tDZd976GRi723+pH6aUJRWEfrlcw0YC2YH39wrbCEv0QiTY5CGXFFCruQd98yf8023YSm5BEhqmVKt4tGvOYJgcqUeXaR9ra8EgtOBYsM014op5EUv410vPpyIoMezLbG2YWi/MZie7w6TAwjWzxFZ+mdSxr+bMOZNFSJqyHtgP3WINUalCntbRr/ggrnmUFPccj87P1hl0cUh9fu04MNH6jpdayjCV2vHFjgaiiw9DKZkmDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 95dc2789-3022-49c0-915d-08df02be9f08
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 15:36:24.6542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/gSp9BIPGfEJNZBXqLHFTI0iBs2t427UkcmgUKYSVv2AJ1/vXRgY6SfxMM6kcAB/8WUrdS/VmO3IQxojlCFKavF9YQaHcSmjbn93zu5Jho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4811
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



On 8/20/2026 11:00 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/guc: Test GuC v70.49.5 for TGL, ADL-P, DG1, PVC (rev2)
> URL   : https://patchwork.freedesktop.org/series/172351/
> State : failure

...


> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@execlists:
>     - shard-glk:          NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172351v2/shard-glk1/igt@i915_selftest@live@execlists.html

Platform unrelated to changes.

> 
>   * igt@kms_cursor_edge_walk@64x64-top-edge:
>     - shard-dg1:          [PASS][2] -> [ABORT][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19027/shard-dg1-16/igt@kms_cursor_edge_walk@64x64-top-edge.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172351v2/shard-dg1-14/igt@kms_cursor_edge_walk@64x64-top-edge.html
> 
> 
>   * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-d-hdmi-a-1:
>     - shard-dg1:          NOTRUN -> [ABORT][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172351v2/shard-dg1-14/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-d-hdmi-a-1.html


Related to existing issues, abort before subtest.> <6> [615.479876] i915
0000:03:00.0: [drm] Unclaimed read from register 0x73040
> <4> [615.479880] WARNING: drivers/gpu/drm/i915/intel_uncore.c:1783 at fwtable_read32+0x308/0x360 [i915], CPU#2: swapper/2/0

> 
>   * igt@kms_flip@modeset-vs-vblank-race:
>     - shard-rkl:          [PASS][5] -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19027/shard-rkl-5/igt@kms_flip@modeset-vs-vblank-race.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172351v2/shard-rkl-7/igt@kms_flip@modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race@b-hdmi-a2:
>     - shard-rkl:          NOTRUN -> [ABORT][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172351v2/shard-rkl-7/igt@kms_flip@modeset-vs-vblank-race@b-hdmi-a2.html

Related to existing issue. Abort happens before subtest can run.> <4>
[574.254149] i915 0000:00:02.0: [drm] Unclaimed read from register 0xc4000
> <4> [574.254151] WARNING: drivers/gpu/drm/i915/intel_uncore.c:1783 at fwtable_read32+0x308/0x360 [i915], CPU#2: fwupd/3530


> #### Warnings ####
> 
>   * igt@fbdev@read:
>     - shard-dg2:          [FAIL][8] ([i915#16856]) -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19027/shard-dg2-7/igt@fbdev@read.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172351v2/shard-dg2-1/igt@fbdev@read.html
>     - shard-dg1:          [FAIL][10] ([i915#16856]) -> [FAIL][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19027/shard-dg1-12/igt@fbdev@read.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172351v2/shard-dg1-19/igt@fbdev@read.html
> 
>   * igt@gem_eio@kms:
>     - shard-tglu:         [ABORT][12] ([i915#16837]) -> [ABORT][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19027/shard-tglu-10/igt@gem_eio@kms.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172351v2/shard-tglu-3/igt@gem_eio@kms.html

dg2 platform unrelated to patch set. Otherwise existing test failures mentioned
above. "i915#16856"


