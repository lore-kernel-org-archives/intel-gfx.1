Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC346C61DE2
	for <intel-gfx@archiver.kernel.org>; Mon, 31 Aug 2026 11:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB2010E6B2;
	Mon, 31 Aug 2026 11:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CgJJgvlq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4860910E195
 for <intel-gfx@lists.freedesktop.org>; Mon, 31 Aug 2026 11:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788174963; x=1819710963;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CmvskQIUQmdYCRjUSVChWmMM1G1PKVRCrKkoQxLmw7k=;
 b=CgJJgvlqgDeyQFNpg28xW1L/fbiUM7vxbVCw3dBmNxE7GgKu2KpPzXMJ
 IAffscyLOWRB2caIhJ8f1Ccd/sWPu8pRc18TafNoYyG6QUYEUMxK/XylI
 DS5v5QjpxuWlX93sK7/G2SAz5loz1aFX2j0wty5OUbxy1gilXzW7lAznl
 uNiQLWK9dXr+n5LABc0eBrQr9Ibtpe+qAdonNGj3NqCQEYXiJjn0fbMs+
 itPZg/SviBjR1pTvGGfRwCOkVSwD/lLAhptDIGJfmMsxMWYSBy2ZtU2Oe
 0s7YN5QTeLjLxxke+8M27FdJIkIDRYub/Y4Fv3Eubk4OKXcOwLRISSJxh A==;
X-CSE-ConnectionGUID: TDxENeQ7QZGoPf4Kp4WPWA==
X-CSE-MsgGUID: xXiJa8DYQ/O32hOzkTPoog==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="111352454"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="111352454"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 04:16:03 -0700
X-CSE-ConnectionGUID: WI6S9IKdRNqfdV04Hbw8Rg==
X-CSE-MsgGUID: QumKB0dfQEOqdx4vr/bYwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="272567479"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 04:16:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 04:16:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 04:16:02 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 04:16:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWzZ/jW6OrT3ttlYoDNUWiT/wUlS1MOv6vA3C66V3NEhusgvbwTsHnDbBTp3uKN7zGduP6WWIXqb+lvdLAM8PtR8ttJw/oIptUuGpKrcS9ntTOZvzvV5m0lgb1KEWBur4GxhnFaoeLowII5H7eckNq3HwBJvmb4wbe0HyX804OVKTDEPLBmZIvoBVnooReui7CT7cbrJml+Qr0WaQQ6pO5mFdrAS8pWjmsMt4O2gSyPywtC1wH65zo+B8xE3m+8TOcecq7Ce6qqbS8eNOhOUxWfNp5o8lz4R6bLSl89QxrOoZ59OlJXCS6Vf3wiJ6JTFMg7VjTC6mFaCAa1b7hZk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qj4ajLVPMAZgpU24SBP1vGZTrROxllLMR3lSpiLxyHo=;
 b=jMc/nzxW1P7hXUh6curR5YdlTDZBtwKia67nEhKiyfzPtg57zjXm6XllpLTR8Ydr1BMglFdwiC9GY0xp4k7oMCls9JhTGcwitiQDuy0LU6vnhlHA1hCcWFFDVFZ8jyJdnT8CoEm/zkHuMyDd2I2tDKF7BxMzb3QoGVg2B5tOa/KGNMA/40QoqfaXrwye6uPIOqIoVl6NuE3mhr3OwoBD2+14vQIe0FexqHMy0iV4cYAua+j6yYrzCD7L7Nb4tmWzLd41a0dmR3i+UhKr7LYx/8MEdMenr64OPF70NZmKVHYs4guG6IPjGSDavcCrIO7n9Q/DnvWW/Cqj0uZ/QCdMUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by SJ2PR11MB8516.namprd11.prod.outlook.com (2603:10b6:a03:56c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 11:15:55 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 11:15:55 +0000
Message-ID: <ce6b59a5-e029-4c24-802e-7c1665f00687@intel.com>
Date: Mon, 31 Aug 2026 16:45:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/i915/hdmi: Read EDID over GPIO when the
 debugfs flag is set
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20260826152444.2822821-1-ramanaidu.naladala@intel.com>
 <20260826152444.2822821-3-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260826152444.2822821-3-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0315.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::16) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|SJ2PR11MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: 546b8c9e-65cc-4915-dad3-08df0751398c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: eCUcSmd+/kKMCF8SpZaGx2bQV2h4+D3Pu7irMAKQ0y+LPrkvlK9E6gLXXHcDFccogDqjWtlfKCCafflrFwqq2P+w+89rdstDk2oFR1SSE5NMQ+u5MjXnH0bkB9xtX/iH4RAjBJdD1h3RAyvbyE0EFHit68+z4QOpeeJPe+2uSKWXR0R0KyjeA2WHC5/dcKnvld6SWO5oFZ1h2Ri59tMlz2rOVGBihXr9iSQC78D+oZvRcnZWf3+gV2cPkSYYnPnm5HO/1LL8nhIlskMxyNFShWn3nr6Mx5qZc8ZWzaykKbBGKIyYKUVifIEPm4j9w5s0IptI7QcNOlQmxpCLfYDncLLNviIS+64luekO88PVWWJFFYV8TmBevRv494/+C5l6B4fFUD+dS/Xz5AIQv6z6xPy7cRO2oOsvIbWTyyU6A2QkuDNhzyLhQfX1tdQ/WLUhi8aB57GocyXQO/5aXW5OTxIe3NbbXT/oyNaee/KvRckhBkBD1Yzqm70UQj9X9E0C37+2B1iglXl2IJw1BX1ZZcgE0pcxN32JeY4RfWMKA/wIcFnhbJ59DFx7dDtCJgfNH9BLFlxR2bUxVl4ZyogR6UXd29h5GG5bxP1dxxMHo4V790kWdxVLzsmy4246OZUzS7FPMDIPtyB3UOylLz1a2XJWBCCc9PkmajfEI8qFnRA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0xwQy9vZktrOVlmQ2xobzhVTSs3RFcvTDBwZnNJakMzV0M3QXJPT05zazBI?=
 =?utf-8?B?NWVtcVFXSGgyYmxjdXVTdU9pNjhyYkliU1V6TnF1NzE5VlJSbUV2NkRjK0hN?=
 =?utf-8?B?SGJUcE01SDFaWjVIZGo3UXhuQmdkdyswZXlJdEtpTzRSYnhha1hzai83cG1F?=
 =?utf-8?B?THliTUxqYy9JOHZ3SGFuMXZlc0ZWQ2Q2TWg2ZDZGb0FiWkE3alp5RDQrOG9B?=
 =?utf-8?B?ZHQvUU9LVTVZQVNtd2RuRGFCei9iZUhtTS8rYzJWYmlPUUlxS3lQZHQrd2E2?=
 =?utf-8?B?L0VxYTBuOGlqN2tQWnhhWGVFRjJsbzVmOVdhcVd1S1RxMFdoMGlOYlAxMlpB?=
 =?utf-8?B?SkNsdGdYQmFoZTVqZ2plQWduTnhmc2R5VXJXbEU2OXQ0UEpybXU5aWtVMEdX?=
 =?utf-8?B?SitVaVMxV3NPWUxWQmtSSVNxVnZEKzZyaUFYWGRZaUZRZHIzWkxUNHFBUUZX?=
 =?utf-8?B?aTdVd1BoN0o3alE0STMyRTUzK3cyKzU4R09ieDd0Mjk2VmZINkhUci9wKy82?=
 =?utf-8?B?aU1ZWmkzY0pSK2JjTjF1aGcvUlgzWlE1R1puclVqbCtCVHVkakV1UVliSEFR?=
 =?utf-8?B?WTc2OGltTUZmbHBLV1QySEdKeTc2R01jSDNOUVhGQmVJZlp3U3VDbGlTekF4?=
 =?utf-8?B?QWc3VUhrU0JTd1BuSGd3Q21RSlpyem1vaWpIUGxCRHNiazdtVlFPNlp4Y1hC?=
 =?utf-8?B?Y3R5cVYxRlhvQVpPa2FSY3p1cytaNWNuQlYzd2hBN1VrS2pmQUNXRVpTaEt1?=
 =?utf-8?B?b2NNSU53VnlZWWEya2F0UFZGWkZWM1ZoTFBsRWdZWGNjSUtLK0EyNGphKzBj?=
 =?utf-8?B?cE5rQXdxRGM4YWtFRmd2MGNEVlRDaHJlcDJTMFZaVHdhNkhFY3RpK2c5OTBY?=
 =?utf-8?B?MUFoM2ZNY245NFpTeVN6SEJXMnliOTdZdGNGQStkZ2U4ZGJRKzR5TXFET3Jn?=
 =?utf-8?B?aGlxSmZ6L3MyZ3ZZaFFoYWFRR25YMktaV3BHQUFrRG9BZmdNeVVmclNqSkx4?=
 =?utf-8?B?M0tsaDZlZ0RvUjJpVEEwcSs4dzVRVU43clRlMmpPeUNEV1k3dGVpOU1BOEky?=
 =?utf-8?B?N3BUVUVDWTR1RDVQMlNLWmY5SlhKV2JDTFBSM1FVS255V3dXWTZTYWk5a3Za?=
 =?utf-8?B?U2ZkVUNjVTBqdk1XdWtoWE1mblhwL1BpU3NDVmQvZ2N1b2Z1VmsxR2dsekVw?=
 =?utf-8?B?SXkreFJ0TEt0ckd1ZkpKZW9RK2RXREJkZ043T2xZWlh5SW1pN1RYZTFIWWpL?=
 =?utf-8?B?SzRLZWt4RGV3cU5XVGpqYlRLYTJKdzVvbFJDYkg5Tjg2aGxiSGZ4WWpuOStL?=
 =?utf-8?B?ckhGdmQ4aEJGbmgvYUtZQ2ZpL3BMNEJhbE9UV2FlL2NxZUhOZlNaUkdBbldB?=
 =?utf-8?B?d0xRSUcva295VVFOcUgvT0U0d2NNTXFaald3a3hlWUZ4Mnd1UjBvZVRnT2JN?=
 =?utf-8?B?TXJXZEZ3YVVHVTdhMjZuZ1gwOGxxR2pJcUIvL3ZKT0dHdGlzQmVCbU1yaGxa?=
 =?utf-8?B?TzJCa3RSTmRzUXk2cTVma0t0TXFpOElKazF6YkwyeUFNd0k0ZUJaNzROOHgw?=
 =?utf-8?B?TnFjaUR5UnhURU1VaVNWWXNmTjJlaXgyanhYSUNGSWRGQW0xZFJGR1p4Ry8x?=
 =?utf-8?B?Y0E0VXRFNmM4SlYxdXYyb20yY0dIbkhvQkorOGtDeFJoTWcyMHRTQWdNTE44?=
 =?utf-8?B?bnpnU2ZmRGJMSEJYcmRCWXA4M3FsSjBDK0FtS2RzbElrKzZmQVpRQk5vN2tE?=
 =?utf-8?B?QjIzcGszbFEzRHZZTE5KMVZFSVorbFRWL0NCTllZNGNWVWhTQ2RiaWttcWds?=
 =?utf-8?B?SVhreUdjaGZsbVlMK3dHbUoxNFdhSTVudzJOMU9MK05VRzB4SllzVk50MjM3?=
 =?utf-8?B?dk5EckFvRG91TEVYRWV0NGlxZTUyN2hBeWFtdjBPeXlHcFJtQVg4cWhhZ1gx?=
 =?utf-8?B?STdqTjdKbi94S2pWMzdJL1lJTURuLzF5S3dFcnlxQklVQWdCNGxJWjM3cEZ6?=
 =?utf-8?B?UEJ3UEZrZnZQNG1URVlreld3UVZJU0E4N1gvaVJHMXFsZy9QazZKU2hWRDdo?=
 =?utf-8?B?NVV2Ryt0dTFXNWdLeEdzL1BDSnhvdEUrYXlQVEkxTDd1RHNZYjNCS2VlNU4x?=
 =?utf-8?B?WUM0a0N0UmJ2WnoydVRoTjhHZ2xLbHVJUXQxcUNlSUE4OW9EWWlLWUdHd2dJ?=
 =?utf-8?B?dGdtR3p1TU9JWkVLL1MrU0hqd2F4WDk1aVY3MkJlNW4xR0JjODc1alA0TXR6?=
 =?utf-8?B?YVBZcHZScC9LSHZTUDRsUWJQWGwvbXdtK01qR0NNRXpiR2diRlhLR2ttQ0ty?=
 =?utf-8?B?bGtkZTROMjRpU3pNK0Q0bnhzS0p5TElUd0ozUnFaVk1LelpGNklESTdEa3VQ?=
 =?utf-8?Q?U94QjbMdd2E7cLhw=3D?=
X-Exchange-RoutingPolicyChecked: Apyn84zdY/0stwIX5HyrQfgcbtNdtPGZIUDGHY2i+ISThJZ8rojyIuRjnSG3hefjzRlyIOA0AvM7H7Dk3FY8ZJxeF8sLPUUAR4Tp02lOoLyX7gg6Zg3pSDmZ/37wAOiXqxRwurL/FvghHs/D7/G600HDN4Yk/p7ahwHDc9F1r3iabyBs4VNduYeIwWHZJZNWcWjFlS1+AwN3DyjVwObK2tP8Av7I0GatcuBjnLdk66ksISPlIJsQaQ14HB3W7xd+jMQAnd5DA92/PfS95jzDliE+JTYQVKLFu+yrz8ZV26mbL4dBNT0hsGfS2i0acqFsBOx86UxYNqdH4fPuq92z/w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 546b8c9e-65cc-4915-dad3-08df0751398c
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:15:55.3302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daVxws6hGVpEKEZBbqixFYK3iNCPEm7cHyy9YwhHZlgTsjv3YvAnDWMPs44WRBewSYgiur9NrihEtP9RYsiWehKbB0B5o0F4UwQcV+U+/sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8516
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


On 8/26/2026 8:54 PM, Naladala Ramanaidu wrote:
> Normally the EDID is read over GMBUS, and GPIO bit-banging is only used
> if that read fails. Now the debugfs flag is checked first. If it is set,
> the DDC adapter is put in bit-banging mode before the read and put back
> after it.
>
> The flag is read once with READ_ONCE(), so the enable and the restore
> always match even if the flag changes at the same time. The GMBUS retry
> is not needed in this case, because the read already used GPIO.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_hdmi.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 38915f19d3e5..462ccfc840d4 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2555,13 +2555,23 @@ intel_hdmi_set_edid(struct drm_connector *_connector)
>   	struct i2c_adapter *ddc = connector->base.ddc;
>   	struct ref_tracker *wakeref;
>   	const struct drm_edid *drm_edid;
> +	bool force_bit_banging = READ_ONCE(intel_hdmi->force_bit_banging);

Please drop the READ_ONCE(). No other display debugfs knob uses it.

force_dsc_en and family all are plain reads. Also, we can re-structure 
the below calls to avoid using the local variable altogther.

>   	bool connected = false;
>   
>   	wakeref = intel_display_power_get(display, POWER_DOMAIN_GMBUS);
>   
> +	if (force_bit_banging) {
> +		drm_dbg_kms(display->drm,
> +			    "[CONNECTOR:%d:%s] HDMI EDID read forced to GPIO bit-banging\n",
> +			    connector->base.base.id, connector->base.name);
> +		intel_gmbus_force_bit(ddc, true);

We can perhaps pull the force_bit/read/force_bit sequence into a helper:

static const struct drm_edid *
read_edid_with_gpio_bit_banging(struct intel_connector *connector)
{
         struct i2c_adapter *ddc = connector->base.ddc;
         const struct drm_edid *drm_edid;

         intel_gmbus_force_bit(ddc, true);
         drm_edid = drm_edid_read_ddc(&connector->base, ddc);
         intel_gmbus_force_bit(ddc, false);

         return drm_edid;
}


This part will then become:

if (intel_hdmi->force_bit_banging) {
         drm_dbg_kms(...);
         drm_edid = read_edid_with_gpio_bit_banging(connector);
} else {
         drm_edid = drm_edid_read_ddc(&connector->base, ddc);
         if (!drm_edid && !intel_gmbus_is_forced_bit(ddc)) {
                 drm_dbg_kms(...);
                 drm_edid = read_edid_with_gpio_bit_banging(connector);
         }
}

This keeps force_bit(true) -> read edid -> force_bit(false) together in 
one place, which is easier to follow.

It also covers the existing fallback below, which open-codes the same 
three lines.

This also takes care of the concern in the commit message. The enable 
and the restore sit in the same helper and no longer depend on the flag, 
so they always

match on their own. We don't need READ_ONCE() to keep them in sync.




> +	}
> +
>   	drm_edid = drm_edid_read_ddc(&connector->base, ddc);
>   
> -	if (!drm_edid && !intel_gmbus_is_forced_bit(ddc)) {
> +	if (force_bit_banging)
> +		intel_gmbus_force_bit(ddc, false);

In case of force bit-banging failure, I was earlier thinking of falling 
back to the original path.

However, on second thought it makes sense to let the case fail.

I think this should be documented in the commit message, and we can drop 
the READ_ONCE() paragraph from it.

Since we are not falling back here, please also add a drm_dbg_kms() when 
the forced read returns NULL. Otherwise the failure is silent.

Regards,

Ankit



> +	else if (!drm_edid && !intel_gmbus_is_forced_bit(ddc)) {
>   		drm_dbg_kms(display->drm,
>   			    "HDMI GMBUS EDID read failed, retry using GPIO bit-banging\n");
>   		intel_gmbus_force_bit(ddc, true);
