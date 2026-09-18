Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65654C982DA
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Sep 2026 12:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C105910E8A1;
	Fri, 18 Sep 2026 12:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLuwCzHn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD4D10E8A1
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2026 12:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789732829; x=1821268829;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=2O5XQEXck4BVNjqUXJySx35gpA+/1EfrAGHH3OutTvQ=;
 b=iLuwCzHnToKGQEDQQuy3TL8MzZXbMtU8UIL2cpCpIToio9FW4+Emw9hB
 Iom/E7DbpOdgQ3y4li35Ia0CVKXZl4MrorWiOxPkt4yHS24UMvGb0F5wt
 Who12D3n1J5Kp3NPrYccJfGoFzPFkJxlz/OkiXHXsy8lmjgI2Z4Nax4je
 yBbBoZByngLE4I2mVYF0hV5pb4NFSqdyestPjKAp1rdahpLBu5Wz9eGMi
 MTlkGseVHzBb0+AchhyG56YHjsSm1eQ2h69WWFhsGF3OKI0SsXhagZtUD
 l+H5VzMJbAzEaJ9EAar+o5s5nAsmZOdJu2FfE36ai3Mqu7cTP2JpLIy4A g==;
X-CSE-ConnectionGUID: Vg4Eh2XHRqWGzCs4aok7fA==
X-CSE-MsgGUID: ODyVoHwUTfW2zHV4kZmvsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="92742661"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; d="scan'208";a="92742661"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 05:00:23 -0700
X-CSE-ConnectionGUID: 1ZreKH4ERLCHEgxwmUXLWw==
X-CSE-MsgGUID: 8HWlLnjcQ4uQB8Kfp3cQZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="2601356"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 05:00:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 05:00:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 05:00:21 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 05:00:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caThuwc/zjm24oiY0il5KUBHWESHfW4mas/HXQV7EWMEP0hHmACdU1FPJ+xPqI6vqOsKz6vhikIrob5b3cdjGZqacBzKmdOszF5R8eLmxyjMAuIWLaI+GyIdvthhO5ch/j9DfzfFyJ1pRGkQ/VXDI56aSt9Evg7aQR+K+tmfFKVSRltPJbVM5ZdsiQetqa3/jcO3rVlzSNlcw6YUeabBEaNtf2CmWfd+6pwSwHCX+bqCm2AOGyhw/1jmM72VrCVcPOaAjtDT47aknG2o3d0373zHbPYE2QqGm2nXbLVjjCYL6gkjm8sJjcfK+M/BDQcPzk5BZ3QnyYhSsn1CH0uHEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVAzdMxfBdCCS/szFVZHksetV1q09PQTpvZ+PeDXXVI=;
 b=xXezfV9ssLBwvH3FdzrWXZkrGbpPW2aM1J/Fpf29CZyPkijBLZi+J6ND4WVOCqdbZf9x2E/FmFESt6vCKJGzchraWIcQaSpCNCFTeZR16StKqHiE4SG5T4qZ9OvmEDWh1lgy+mh1DCQYP2b7uFr/X/fKZVQQ2z/vFkVVpYABf9+fH7wZkxlHgaggp0BCucZQLOn6se9GURVXuXSG+ozQmbkW0Q+DQOWRbwcRsF1/UQrs9yLwIp9Orsw3yK5DYZaMBDbkXsb3Z5Yaf3Rw61R0aHww8JWRdNErhhf0PWARgCGdqJvDgZGGNh7QZfsnwUEGXEG3GaVLTlTO8GTzCljxlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA0PR11MB7306.namprd11.prod.outlook.com (2603:10b6:208:438::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 12:00:19 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0428.008; Fri, 18 Sep 2026
 12:00:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Sep 2026 14:00:15 +0200
Message-ID: <DLIFC0Y2I5M0.2322C84W8AYDB@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH] drm/i915: Use %p for pointer formatting
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 <intel-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.22.0
References: <20260918103725.cfYzL1Wt@linutronix.de>
In-Reply-To: <20260918103725.cfYzL1Wt@linutronix.de>
X-ClientProxiedBy: VI1PR07CA0280.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::47) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA0PR11MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: baf08a23-8ff1-45d5-04c5-08df157c6923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: WCjiHtnLdBlfhPN0ptVgeTKog3xmHKEZxSEEp96RwSac0Vo2nDcGemTR4iB19i93juZCDpOHrw3zdtM5zU3vDgkLodu4qOd45UEFtgBvPxS5li/zZjPGUHaYkGwwQfyieUu34VvYHLXrNqxrH94l+tYshiMGNn7OI7OjYv+2NkhB+B+B4RaMtdEzlgcdY6tDwfMbH/TnZUlWkBHnq4atA3S1QXRKlLOCIjDmTJa4LKO68cywkrnAEN69MybcSnJmRbIWdUGNCcc7SA8lcZMtdaam26myXa2a/K+7WSrzSiLgt6UYcmoAEEegrNJjMVvUf8yVl46S+5DAnewHiPov+GMdAGYXsUlbvOLsGP9PboUGUHTQl3JvEPWR2nkexStYLRYRKsjtcMo16R1EKtcW91nnXjIki0nz2YqxMWs549HUEk5seeltzAsV633bMKhHVMm+6HU3hYAv+Kp9+JeFYPdOiKDMVNjHg9G7G4TKsjml79t7Z24nacJPDoJg2miEYPVvD/9NFhpqZbHvcTtLPun5Trcc15VGe5SquI7MkXWas/BK80atvaBu/9GyYIe5plcPPzr9agj11UWu4gYIu4lNmmBxyg5RjK1Mb97SWTwb+QmIVM6HxO5O67EdvrRXw4+STlCfu5wNfsH8SG+XDo+qCb5CvQ0LGMB/w/GItIw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHFDVXk4dmhMNzhaTHgyWmUxMGhwTFBtODV0ZVN5b3M1WFBoVHZVU0hBU2lz?=
 =?utf-8?B?QjZHUE0rdmpBMmtDQ0tqSWM1RGxkQlQ4bERBQXFQYk11VWFhMk9CMXFoOTFJ?=
 =?utf-8?B?TFNNSDF3cWllS1AyWm5UcnhNd2FEaHE2ZWxJVEFJcXc5cW9acncvMVZlaDE2?=
 =?utf-8?B?ZHZPOXd1WFdwcEVpT1VJWFdzbFZBb2ZJWlQxOEptMXlTTmhnTWo1OEhSWEp0?=
 =?utf-8?B?cHpqN3lVbUFRNVRORlVwSmJ6RG8reDNCZDF1aXhmU24yUzdIazNSNjFDcmFJ?=
 =?utf-8?B?UDdpMmRlUE5QT3o0UjdSaWdOUUZ6VWZLZVBjekFEUStlTXlUUEdOOXlWb1RL?=
 =?utf-8?B?OVdxenVXL0FoU015VEsyQVN5ay9xbDVYRG9lbXRwNHJySTlIeUJraWR0NU5D?=
 =?utf-8?B?UXJKTmpveDBaK0FYUFNtanlwN0daeVhOeHdFeStvQWcyWmNGRldOMHR0TkJM?=
 =?utf-8?B?dmNZbW81WCtOYWhGUk1LcnRabGZqMDlnVHFHOVhqT0hBZzYyMURKMHJ1Lzd6?=
 =?utf-8?B?UU1ySVJRL011NDhiNjFscy9OUTZ1RldRRjhOR04rWDFkSWw3K0FyV01vYy90?=
 =?utf-8?B?VTdLRlhwYWtFSzhDMzVYZHBnanIzSFR3Z3NROFpyRFp2RVdUM01jUVZBdElN?=
 =?utf-8?B?NTBoU1Zpb0xpYThmRUx1ZUswRVpZU1pVL2FBdmdaSlo1bk10TWdrVzNqMlNU?=
 =?utf-8?B?SHo4ZzZrdlppN29aYklFN2YwZWQ0dDk0aCt5RHowK0tLNDkxM2VERS9TVjJV?=
 =?utf-8?B?QXk2NzdmcFFtSXFCS2xvY3pnbGM5WVFnWU5zU3NROTZOSmFrUnVaazQrakl0?=
 =?utf-8?B?Z2JjYndXU3RuanArQWxBV0EvenJXemdIcTBMekNPdVM1Rm8wdkpOMG5GWXlp?=
 =?utf-8?B?Z25wWmhRM0ZsYnVLc2JWVlQ2YlFxakV2bmRmUnRRU1haVXh4eEZ2bHVUREVB?=
 =?utf-8?B?cUFocFlaQWVWbjdCbG1KUFF0S0kxSG1RUkZlY0dLdVo5OW9WUDF0ZDR4anRE?=
 =?utf-8?B?a3FNU0tXRTM3K1hOazhveXMrOC84SUJFQXhkY1AwUW11Y2xXRERJZHl0RXRI?=
 =?utf-8?B?YW9HRVFJbHV5NlIrUGJXaDR6bk9ySEplMWlKb0pMNFhPWmJPblhjMG1RZFVK?=
 =?utf-8?B?MTNEY21EYmtjdGVQYkJQSjU1OUorN2didTNLYkZYTVFveThkWnFOY21Janli?=
 =?utf-8?B?V2NsUEg1OVAwMExsRkIyckRwcTg5NWY2Wk9ZM01vUzIvRmNLN1NOSGgvN2Y4?=
 =?utf-8?B?SDZwT2MrYjVJcGM0eDdmRWk0WS9JMkozSkNGeE9NYzBLZ3pTWHprN05uS3ND?=
 =?utf-8?B?eWRNZjJIWEx2UXNHY2dxbHBoMXBoYWUyNVh3NDJpTXMxbTNvVVBlNUIrbUgr?=
 =?utf-8?B?c3c1MTRYSExkNkhBdkYyNTNBbXdYN1RjQ1UybHowUkJYVXpIdGppcTRycHJZ?=
 =?utf-8?B?cm95Uld2aGJIdkIwSFRFU1JPeDg1N0Rwd3JaUytrOE1VSGZHTTBPdWxpUFdX?=
 =?utf-8?B?aWJhcDMvZ0ZKd3hML01KZnV6SFdVdUkwSStXdWI5NWh3ZjhyNm9MYW1wNWNY?=
 =?utf-8?B?VlEwcys0ci9JdEExRUNnOGM3RFlpSUFDRkprVlZMcGdybGM3cEpzY1FiY3d5?=
 =?utf-8?B?T0ZoZ3pxaXRmQWVlMlBxRWRTSkIzN3p4cmNBZnFhQjY0eHJFU3U0NTNrb3NR?=
 =?utf-8?B?T3VUaXZTQW51Z2NxWDJDcWFMTVV2R0g5NmdwYXNkdkVhTHRwNFprcmQyNFhW?=
 =?utf-8?B?N0dJbE5VdG9HK3hISmdYQWNPUHhEMTdOdDgxMk1KdnMwL1IyZzdvS3l1YzZu?=
 =?utf-8?B?b3RWa0tMOWNOM3pFdjg2aURDWmZJU3cxejNaVnJiSDV2a3JwUmFtNU1kVjRM?=
 =?utf-8?B?VFgzbVp2TEZNQkpiV2h0Mk8yUzMwdFBwR1ZWamhpeFFUc2NuWkN6YTRHWis3?=
 =?utf-8?B?Z1RTVXBsMFRjQ1NmTHBUM0pHZll0ajdhaWJTSVU2aC95V2pIM0lhdm5wQTNT?=
 =?utf-8?B?Y1BiYW54VjZzdXJLR0FvbklBUW9jbFgvN2VpWVI5bnBhOHlISDVlL1RUUnpH?=
 =?utf-8?B?QWpxZ21pWTFsaVExdVV3bWlxVnhmakdpVUd2TkUzZFZXa1FBc2Y4MlF2MTVG?=
 =?utf-8?B?aUNuZEhvakZBc3BaSyt1OGN6OGlIU2F1eEFmZGxhNGFRMDRPRXFITWxkcnh6?=
 =?utf-8?B?bGUyYUVyRWlxRnhPOEJGNjVvWG0wSGxZYlg4b0hxMENhZExrNDFRRFJEd3lN?=
 =?utf-8?B?Tm0rYVdtQjNyWGRxMEZKcmRjMi9NRVlhMFVnRzBTL2piZjd1bThDU3NmSWhh?=
 =?utf-8?B?bHEvMjJRUE1pTGk5UVRpeVlTVGdDUjFlbzlZczZjcWVoK0l3OGdlWDZ3MWxG?=
 =?utf-8?Q?F4HhxTu9/a7sxHRM=3D?=
X-Exchange-RoutingPolicyChecked: bIyecinZz7q2q9QXKfsMSCk3nZfR9GmOY5KYIAt8h8QSpqhMwG+lKcxAnN+cQ36SqL7ByZyQG6cjrbep1MctqL9iN161uaH93CGBGGiL/jeSps+vZBlFy/fPNSIAiJcxBMTaExK9qBh133i82uMpiJuGJ5IA0hi6Io/WP9BtNePOniWVZHqv5J0O0zoaCic/5UJ5g6qg+EUODxuGvK57WoLpuQzRiIMTUtdAZUm0gSzVORzqOHnNW4HJhiKpFBLdl1xE1FDuOflHsXjWSul4+YzdO79HDaJ3PdipPulCJ3IO8J/nj8kVYuJAIJ15uQ/k+UxrIjNdQehHfAUgwYMKSA==
X-MS-Exchange-CrossTenant-Network-Message-Id: baf08a23-8ff1-45d5-04c5-08df157c6923
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 12:00:19.5661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZRveqGPxQtgikwkRcxh64ByuZVUWZi83TrcEGF9PXPUIuHwsiP6+deD6fXfEduFZaTkkbfunaM2YH6bHJ4DpKmWbnNA7zW+wQI7GC4nS9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7306
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

On Fri Sep 18, 2026 at 12:37 PM CEST, Sebastian Andrzej Siewior wrote:
> Commit 2563a4524febe ("drm/i915: restrict kernel address leak in
> debugfs") introduced the %pK modifier in order not to leak kernel
> pointer.
> Since commit ad67b74d2469d ("printk: hash addresses printed with
> %p") pointers are hashed by default and the behaviour can be controller
> by `hash_pointers' boot argument.
> The policy on %p is to not introduce new ones. Keeping the %p allows
> to assign an id to the object.
> Removing %pK makes it possible to remove its handling from the library.
>
> Use %p instead %pK to allow debugging if needed.
>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/gpu/drm/i915/i915_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i=
915_debugfs.c
> index a3e27f9e4f476..93ba7369ba6e2 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -179,7 +179,7 @@ i915_debugfs_describe_obj(struct seq_file *m, struct =
drm_i915_gem_object *obj)
>  	struct i915_vma *vma;
>  	int pin_count =3D 0;
> =20
> -	seq_printf(m, "%pK: %c%c%c %8zdKiB %02x %02x %s%s%s",
> +	seq_printf(m, "%p: %c%c%c %8zdKiB %02x %02x %s%s%s",
Please, correct me if I'm wrong, but i915_debugfs_describe_obj()=C2=A0
prints into a debugfs file read by userspace exactly the case where
Documentation/core-api/printk-formats.rst=C2=A0recommends %pK=C2=A0over %p.
>If (and only if) you are printing addresses as a content of a virtual file=
 in
>e.g. procfs or sysfs (using e.g. seq_printf(), not printk()) read by a
>userspace process, use the %pK modifier described below instead of %p or %=
px.

And it was addedby 2563a4524feb, which explicitly wants to
guard it with kptr_restrict(i mean that it's intentionally stronger).

--=20
Best regards,
Sebastian

