Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EB1C4450A
	for <intel-gfx@archiver.kernel.org>; Thu, 16 Jul 2026 11:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACF910E325;
	Thu, 16 Jul 2026 11:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DY/YVemM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320F710E325
 for <intel-gfx@lists.freedesktop.org>; Thu, 16 Jul 2026 11:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784201059; x=1815737059;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=k34sxuXv8b/0YE6y6+k+TfRo88E0sukGTy4pOZiS/KE=;
 b=DY/YVemMzmEDHUuP/ZAPPyotUfu8CGqQNw2XVft+3/55PutlDBfI0+Uc
 Fu2hycydfdXPotaIHK/MJUSk7L3PeDXrabxg1jCDUJRDXPYO1wRALYpew
 pOoia3k/qsdJLRqUUcXe+G91shgb82I4Q50oIGBgWKQq1mnlaxTU0DHrJ
 UW2K2ge8aXGI6OCkQusN7WZ5Dl8GMGHWz7NvjnCPH/qtxDbMcoAVoY8ll
 kkHYsHcAcb2X9lHrK/4xJa5/C7Ot4JLyLW8zqwSGR+jzfCGPWbQ36erwi
 fmo1Y4LY88aW+j/CNPEnG5u7DklQJSIMV5zJWPMZevMLKYVncaqBQqz0O w==;
X-CSE-ConnectionGUID: 89yJV6DqQpm510MBpd0WrQ==
X-CSE-MsgGUID: OGOzWf0tRZum2l3wgqkXDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="107653563"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
 d="scan'208,217";a="107653563"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 04:24:18 -0700
X-CSE-ConnectionGUID: MIwkTMmHRAW8yCzu4hP8bw==
X-CSE-MsgGUID: HXA5L1mgTSea4i+Je2b0Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
 d="scan'208,217";a="260050978"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 04:24:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 04:24:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 04:24:18 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 04:24:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGlRbX72H+vcfoIdFwxgvYbXVJAsFJC9eUrSbeTloHNd6nYrfmdrN8GMok0lfT4d+TxFIxbihaQA+pNK7IHeiezTndZoo6KAL6r+E/sUzCFj77jwqK4hFn39t70O5LBWss5bhPN/g0jJNBWJio/OeOPf0F+WNpi6e7sPBkogdxjzSIq51U0vKEl30X8mty9NtEbhnbUb+XvpPFO+TPJSNVZ9Cg08iP3mpkXLoVilPZnM0v9y+2y9rzhy840X70vnciRUR7RyQJazv/j7/ZeAGrUlzi9Fmuezvv6gAmjH8y+VLaEg4EvsctgC1z3S1nTFky2jRXPlt2aUqxFcVsJwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfY4y9XQLWipMYX/8PLb6VOp1UgAfg3fsmgioFPnvPs=;
 b=Nf1vh6WhEsFttv6TTQAMJNrWQZIWvcLfhYL4j0grr7VQekMTbu6kPOMYMDtp7Ky7E3ULqseyCn+yIPYzGUYETN3FA7EiLfVAyRWqWpJt38nU/3QXEBPbm274rzEuIZgxnX0Bq6BV2OaSg2Fn6AzAfDBe6xiGv+QsFATIJLr0T/p8zwTFn/1JYs/fzBC69OdsHaRatqu9ylNoFdTDudGoSLh2oajg+2SK8zFmO9iT5zK27TOoE1mXWHt1nYPVXD6MVqMHsvBwTxXoiAer+joj8rLXYGUjiChcT52vhKrKa08jEepiSuje6FO+n4qNon5XOykhX56MmvSahHW/snmR2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by DSVPR11MB9577.namprd11.prod.outlook.com (2603:10b6:8:388::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 11:24:11 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 11:24:10 +0000
Content-Type: multipart/alternative;
 boundary="------------z8zy40bfu59uKdeVbG03wwwi"
Message-ID: <b2821da6-e1d3-4267-8eec-51ec699e1e70@intel.com>
Date: Thu, 16 Jul 2026 16:54:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] drm/i915/vrr: Add per-CRTC vrr/cmrr debugfs control
To: <intel-gfx@lists.freedesktop.org>
References: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260714103938.2371448-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260714103938.2371448-2-mitulkumar.ajitkumar.golani@intel.com>
X-ClientProxiedBy: MA5PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::16) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|DSVPR11MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4a82b5-c3e7-4811-2483-08dee32cc1a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|6133799003|56012099006|4143699003|11063799006|10067099003|8096899003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YOTZvMilvwN2bs4aI3NaiATRFklckQKVX5PyLhU1kmtMJVITZ37k2sOYBmJB9fMwfJPo6xAf3nwTjb0cBd7JIeEXOaflD3W1/jq/u/Y6aO9WyXVumxdzRG9+jlvW6wRRiY5/UWScFTZAyTzehSLvfzhQO2wcUfzd7Ont1VuZtSNjhaEAVIseQJzPL0/jJx5P8Hwp9lcjU6DV5lctxhSVaFvaxRWdrq0HugzRzfSNmL/h7SZ6CDhwn5czhTE9yqS5V9y7nnSYTIieGyUmXf2Wud6TLBLKV5aacblnGPDIfzuBCTz38/nnAtODTt1dpSrM4L24W470RuBaMz08zk1QzaMBA1A8UmsdwjceaK7Wz2vSXqJiSLIzq7geLt0N8qXXcAV1vEX9SOEHuOl3qXf6af44wreEvJ6ZZDZjWX3OpyxVzkoklS9Naiva0k9S9W3/QSmNpCqGkQO28Rf0AlyX8Cws3JW4TTcW0ryw1rKITbsr3dycecA//77hEYdVh4Zd2z5o8HXAjh13moNexihUmNd8OHFXsRE5JLeuLhdSZQEf99lLXdDQMfnCCnIX6IDWS8Ue/j4hUKvdNcb8xfIUl5ULR114DUeCMP1B7yhoLLjCMMZJtFiAxxnWIacgk+MJjea9BhUndU4lESyhmAB0F0PyzOY8+nTwv/Rp6GPG8m4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(8096899003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlIrRmYwWDZjeFdPa2R5SjZMUmZRQm9jaXllaTZGaUsxMVVVbkpwMkxtWXc0?=
 =?utf-8?B?MzBLOUxPWUZnZ3orZzhnZXhhakVDZjVpcWJrdEduSElrWFRmK3VqdzNXNzdL?=
 =?utf-8?B?VUdUUFRsMnJXVE5sVTc0MDZHOTR2RERhNUI0L0R1Ny9VQ0tQYnhybHc3V0t6?=
 =?utf-8?B?eDV6MUlXMXpvc3Bua1NMSmRkcjNpQmUxQ29qOEdTNVR1Q2JGcFRIbkNCZDlo?=
 =?utf-8?B?bUZ2ZGNFUjdEOUhjdU9qMGNYL1hxczBQQ3FyNzNzR0hTMUpPT01nSWJLZWdI?=
 =?utf-8?B?bEsrWkx6b1c3RGVqWFladWx2Tnh2MXAxaGZ2T01xalJ2STFEdTloSVhGZFVa?=
 =?utf-8?B?RHlRaFQ4NU04ZkNVdkliMEo5RXUvbHNaTHFmamhSbFlja1Rmc05mS3IxZFNK?=
 =?utf-8?B?aUpudnplMlFUVkNVZHBZOGhVNXBjdzJHbEEvZ1F3blgvNDNNZ3J3UWEyci8x?=
 =?utf-8?B?NTdKZkpTS0EzWXB0ZHZucnd3NENhR3I3cHZmbThBL09rTTNmN1hCU3BiTGpL?=
 =?utf-8?B?YTY4OWwyK1o4OXRMakZ3ZytvYW0yYnNmZDFRaDVZQkNGV2h4ek5YbHMvRklV?=
 =?utf-8?B?bjFzeUg0VTJrbXd0UjExTWs2ODRVNUhlQkh2cXlYT25LdFBRL2VzS3BRWlZN?=
 =?utf-8?B?Z014NkVIQ2pTSG8zSDA4d3ptaGtGTVA3di8vSjJxN2ppenRVL1lIU3RFeS82?=
 =?utf-8?B?bUUyQ0ZMa293SUpkU0djWkFETDEyRFFFdlNYZW5DcmxPdWxSYnNaVDhMR01C?=
 =?utf-8?B?dXgweWdOZVRFTWhZbDF5eGx2RE5iakVlUWJvUHMyV1FHTllMcXNXR29vUkhE?=
 =?utf-8?B?b21KU0hzRitoVVdZRVRtcEdtWWFyd1NZdDVGUlJTZ2pBOUNPbWI1by80V1Rw?=
 =?utf-8?B?YXNMbTIrU0NxQWt6U2w5a28rL2tPeldiZFNFN2QrR3B3QUxkSHAwdTFDNDNr?=
 =?utf-8?B?bzlOdEVnZXdNSmdnU1ZsVXVRUDNQcTcwNFNtZDVVeVJMaHQ1ekpCeXlpQkEw?=
 =?utf-8?B?YnlrYXJ5Y3pFQmVxMXU5K0pJOVFqSzM5TWc2OStDdElWRklUTkdXeDF6d2ps?=
 =?utf-8?B?QW1qYjloRzFhK2dkZlVwdnk0dFVCSTFMSFIybVZHNHRVT0lsZjI0cHJiaHdR?=
 =?utf-8?B?UGZBV3hxRHJTS0kwYWw0eXZ0RDZXdDhiRXpxaHVRVnVDOGJrUDZtWHNrdlZC?=
 =?utf-8?B?cittY2RkVHlHV1FLbUE1K284M3J0MFJ3aktLMzNHSFRsYk1UMndpUlgvbFB3?=
 =?utf-8?B?WkwvbCtTY3NCUUV0WGtnVDR0Z2hiN0lTb1N2TnY3MDZuOERoZEFwME02KzJW?=
 =?utf-8?B?MTdBR0FnRTk1QkNndHhsSGpNQ0g3TVBxbEFKNERjN0pXR2w3QXpWbHFBQ01R?=
 =?utf-8?B?Uy9YMVBDT2U2N21pM0IySXZFcUZ2V0sybFZUWmFUdVJyeTBNQ28wSk1KOC80?=
 =?utf-8?B?U2pXVTFHTjFhaXNRd3N3VkRJT0RBRncycVluRityclpWSzlJU3JuRUlSZzVM?=
 =?utf-8?B?YnBuUmlCMnpDMlFSWExJaTZpeERVa2FKa2Vvd2xiQzdNT0JsMHNHenZmS3VF?=
 =?utf-8?B?THZmN2cyQVVENWtpNWRJMFRaTVN3bnJiMjdnY3VlcnBKaXVlc0xneEE0a0Rq?=
 =?utf-8?B?UG9iRW1MVkg1OEQ0dVRWaFM5T3Q0bW9GTDRSRzUrYWxWeFRhNzhLZFRTTnM3?=
 =?utf-8?B?QnlJVEI1OTRVVlY4NUU2ZDN5SEhjUG9vZ1pvSDl1c1VaenZTZ3FRK093aGps?=
 =?utf-8?B?bXRUaFordkRHY0YrTU8vSjNKRVh4YUxtTlhEYmlNK040QVRQYWxuUzE5SGNW?=
 =?utf-8?B?Qnp1VWZVbldmdkNsaVlDbXFGNnpTNTFDRXVGcS9ra2ZwR2w1N1V6czZ1THl4?=
 =?utf-8?B?cXJrdUNWNHdPdWJNd01ZMXVOamxGR2orRzZHZW5xV1pMTUg4TVN0eFVqeWM0?=
 =?utf-8?B?WTJnSE4zVUpXc2s4WVVvN09qYzgvQi9DRFZSZlVidWxKckpqeGt4N1QvK2pM?=
 =?utf-8?B?SnlscjZMWW5NY1lTRW4wTTNCRzA5Rm9SNWt4cDI0WGpqM3JJVFhqbWVxbGdG?=
 =?utf-8?B?RnloK0VZZ0ZCb0F0MmU2TWQvOVJ3ZUo2SHpQMkFHMDlDT0txYVJGRFBTZ3NV?=
 =?utf-8?B?Z0o3dThMNkNsRFBzS3BNZkNNbmdnTXM3MXZaTXE3REVVenVwQkNrVU5FSzdI?=
 =?utf-8?B?OTRaQ3NBMEExVHNGUnpVQmg3MTRFNkJYOWtiM09qMnlvLzFSenA2eCtONnE0?=
 =?utf-8?B?OGFoMmEwSWtrYlZjR0h1U2M0SUVnQmI4ejNPMVlrcE5GUHI4NlpKSE53YnNS?=
 =?utf-8?B?M0NqdVJxejllaWw5ajNLWE4ybkxNd1dnTjdFTzZwN3FvRDhSRlNReDJkZ1Jy?=
 =?utf-8?Q?5zSPIxPQezrGN4lw=3D?=
X-Exchange-RoutingPolicyChecked: GuUneligu9uz5VsVxIwDPwF4SfAu67ux2L8sThN8sK906tLMTmdy9PGk0J6r9uLmZzp9cps1Y8ZawLfBBIwuVUCfcyprZkIuwxBMxDQicwSOua87nhKDWwWBJR42ym/qbhr9YkPAJclRDYiHTkDAl/CMjKfagYZl3ILl+rvUOdy/rXTVcldTSJyCqOhvCOQ8yQnNaHuBYj1KDfdIoJrC2Ib3ncON2nM6utsElR3zpCzGb9rXBsn6ddiFV5cJAyreBYpCWjXDlIAwyXMzlN4N2olP9Mk7lIvGW6ni3w98Q3FtBAKR8yvqQvCjK7G1oRa5d0vGiwZtGTy7NhU/gIFgmw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4a82b5-c3e7-4811-2483-08dee32cc1a9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 11:24:10.4468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GDunNsGr5MVTQx5zPZxSqyFTbXFA12HmMJnWR+3T5WavVE4/JzLDA6ON+b54802fFwfia+APX3KIN4/2iUJHOxl0Beno1Sjrypv3vEKMtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9577
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

--------------z8zy40bfu59uKdeVbG03wwwi
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mitul,

On 7/14/2026 4:09 PM, Mitul Golani wrote:
> Add a per-CRTC debugfs file 'intel_vrr_cmrr' that lets the user force a
> CMRR target refresh rate and video-mode requirement.
>
> The file uses a "numerator/denominator" format:
>    - numerator:   requested refresh rate in milli-Hz
>                   (refresh rate in Hz * 1000, e.g. 60000 for 60 Hz)
>    - denominator: 1000 for a 1:1 ratio (no video timing) or
>                   1001 for the 1000/1001 video timing
>
> Reading the file reports the currently stored values; writing updates
> them. The file is created only on platforms with VRR and CMRR support.
>
> --v2:
> - Drop the "vrr" debugfs subdirectory and expose a single flat,
>    intel_-prefixed "intel_vrr_cmrr" file (Jani, Nikula)
> - Rename struct intel_crtc.cmrr to force_cmrr to make its purpose
>    explicit (Chaitanya)
> - Fix parse comment: numerator unit is milli-Hz, not KHz (Chaitanya)
> - Add debugfs/intel_ prefixes to the debugfs handler functions (Chaitanya)
> - Expand commit message with debugfs entry semantics (Chaitanya)
>
> Signed-off-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>
> ---
>   .../drm/i915/display/intel_display_debugfs.c  |   2 +
>   .../drm/i915/display/intel_display_types.h    |   5 +
>   drivers/gpu/drm/i915/display/intel_vrr.c      | 103 ++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_vrr.h      |   2 +
>   4 files changed, 112 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 3f02868ef105..2bbf4760dc30 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -49,6 +49,7 @@
>   #include "intel_psr.h"
>   #include "intel_psr_regs.h"
>   #include "intel_vdsc.h"
> +#include "intel_vrr.h"
>   #include "intel_wm.h"
>   #include "intel_tc.h"
>   
> @@ -1395,6 +1396,7 @@ void intel_crtc_debugfs_add(struct intel_crtc *crtc)
>   	intel_drrs_crtc_debugfs_add(crtc);
>   	intel_fbc_crtc_debugfs_add(crtc);
>   	hsw_ips_crtc_debugfs_add(crtc);
> +	intel_vrr_crtc_debugfs_add(crtc);
>   
>   	debugfs_create_file("i915_current_bpc", 0444, root, crtc,
>   			    &i915_current_bpc_fops);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index c048da7d6fea..84a6d016e226 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1546,6 +1546,11 @@ struct intel_crtc {
>   		u64 flip_count;
>   	} dc_balance;
>   
> +	struct {
> +		u32 numerator;
> +		u32 denominator;
> +	} force_cmrr;
> +
>   	int scanline_offset;
>   
>   	struct {
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 51e4f3309b8b..8b6e36ee9f55 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -4,6 +4,10 @@
>    *
>    */
>   
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include <linux/string.h>
> +
>   #include <drm/drm_print.h>
>   #include <drm/intel/step.h>
>   
> @@ -1231,3 +1235,102 @@ int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_st
>   
>   	return intel_vrr_vblank_start(crtc_state, VRR_DCB_VMAX(tmp) + 1);
>   }
> +
> +static
> +int intel_vrr_cmrr_parse_ratio(char *str, u32 *numerator, u32 *denominator)
> +{
> +	char *sep;
> +	int ret;
> +
> +	/*
> +	 * Parse a "numerator/denominator" CMRR ratio string. The numerator
> +	 * is the requested refresh rate in milli-Hz (refresh rate in Hz * 1000)
> +	 * and the denominator selects the timing: 1000 for a 1:1 ratio
> +	 * (no video timing) or 1001 for the 1000/1001 video timing.
> +	 */
> +
> +	sep = strchr(str, '/');
> +	if (!sep)
> +		return -EINVAL;
> +
> +	*sep = '\0';
> +
> +	ret = kstrtou32(strim(str), 10, numerator);
> +	if (ret)
> +		return ret;
> +
> +	ret = kstrtou32(strim(sep + 1), 10, denominator);
> +	if (ret)
> +		return ret;
> +
> +	if (*numerator == 0)
> +		return -EINVAL;
> +
> +	if (*denominator != 1000 && *denominator != 1001)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int intel_vrr_debugfs_cmrr_show(struct seq_file *m, void *data)
> +{
> +	struct intel_crtc *crtc = m->private;
> +
> +	seq_printf(m, "%u/%u\n", crtc->force_cmrr.numerator, crtc->force_cmrr.denominator);
> +
> +	return 0;
> +}
> +
> +static int intel_vrr_debugfs_cmrr_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, intel_vrr_debugfs_cmrr_show, inode->i_private);
> +}
> +
> +static ssize_t intel_vrr_debugfs_cmrr_write(struct file *file, const char __user *ubuf,
> +					    size_t len, loff_t *offp)
> +{
> +	struct seq_file *m = file->private_data;
> +	struct intel_crtc *crtc = m->private;
> +	u32 numerator, denominator;
> +	char kbuf[32];
> +	int ret;
> +
> +	if (len >= sizeof(kbuf))
> +		return -EINVAL;
> +
> +	if (copy_from_user(kbuf, ubuf, len))
> +		return -EFAULT;
> +
> +	kbuf[len] = '\0';
> +
> +	ret = intel_vrr_cmrr_parse_ratio(kbuf, &numerator, &denominator);
> +	if (ret)
> +		return ret;
> +
> +	crtc->force_cmrr.numerator = numerator;
> +	crtc->force_cmrr.denominator = denominator;
> +
> +	return len;
> +}
> +
> +static const struct file_operations intel_vrr_debugfs_cmrr_fops = {
> +	.owner = THIS_MODULE,
> +	.open = intel_vrr_debugfs_cmrr_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +	.write = intel_vrr_debugfs_cmrr_write,
> +};
> +
> +void intel_vrr_crtc_debugfs_add(struct intel_crtc *crtc)
> +{
> +	struct intel_display *display = to_intel_display(crtc);
> +
> +	if (!HAS_VRR(display))
> +		return;
> +
> +	if (HAS_CMRR(display))
> +		debugfs_create_file("intel_vrr_cmrr", 0600, crtc->base.debugfs_entry,
> +				    crtc, &intel_vrr_debugfs_cmrr_fops);
> +}
The debugfs interface accepts non-zero values, but fails to reset the 
value to zero.
> +
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
> index 55e9c429f579..19c7990be1b2 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.h
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.h
> @@ -56,4 +56,6 @@ int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_sta
>   int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_state);
>   int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_state);
>   
> +void intel_vrr_crtc_debugfs_add(struct intel_crtc *crtc);
> +
>   #endif /* __INTEL_VRR_H__ */
--------------z8zy40bfu59uKdeVbG03wwwi
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Mitul,</p>
    <div class="moz-cite-prefix">On 7/14/2026 4:09 PM, Mitul Golani
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260714103938.2371448-2-mitulkumar.ajitkumar.golani@intel.com">
      <pre wrap="" class="moz-quote-pre">Add a per-CRTC debugfs file 'intel_vrr_cmrr' that lets the user force a
CMRR target refresh rate and video-mode requirement.

The file uses a &quot;numerator/denominator&quot; format:
  - numerator:   requested refresh rate in milli-Hz
                 (refresh rate in Hz * 1000, e.g. 60000 for 60 Hz)
  - denominator: 1000 for a 1:1 ratio (no video timing) or
                 1001 for the 1000/1001 video timing

Reading the file reports the currently stored values; writing updates
them. The file is created only on platforms with VRR and CMRR support.

--v2:
- Drop the &quot;vrr&quot; debugfs subdirectory and expose a single flat,
  intel_-prefixed &quot;intel_vrr_cmrr&quot; file (Jani, Nikula)
- Rename struct intel_crtc.cmrr to force_cmrr to make its purpose
  explicit (Chaitanya)
- Fix parse comment: numerator unit is milli-Hz, not KHz (Chaitanya)
- Add debugfs/intel_ prefixes to the debugfs handler functions (Chaitanya)
- Expand commit message with debugfs entry semantics (Chaitanya)

Signed-off-by: Mitul Golani <a class="moz-txt-link-rfc2396E" href="mailto:mitulkumar.ajitkumar.golani@intel.com">&lt;mitulkumar.ajitkumar.golani@intel.com&gt;</a>
---
 .../drm/i915/display/intel_display_debugfs.c  |   2 +
 .../drm/i915/display/intel_display_types.h    |   5 +
 drivers/gpu/drm/i915/display/intel_vrr.c      | 103 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vrr.h      |   2 +
 4 files changed, 112 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 3f02868ef105..2bbf4760dc30 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -49,6 +49,7 @@
 #include &quot;intel_psr.h&quot;
 #include &quot;intel_psr_regs.h&quot;
 #include &quot;intel_vdsc.h&quot;
+#include &quot;intel_vrr.h&quot;
 #include &quot;intel_wm.h&quot;
 #include &quot;intel_tc.h&quot;
 
@@ -1395,6 +1396,7 @@ void intel_crtc_debugfs_add(struct intel_crtc *crtc)
 	intel_drrs_crtc_debugfs_add(crtc);
 	intel_fbc_crtc_debugfs_add(crtc);
 	hsw_ips_crtc_debugfs_add(crtc);
+	intel_vrr_crtc_debugfs_add(crtc);
 
 	debugfs_create_file(&quot;i915_current_bpc&quot;, 0444, root, crtc,
 			    &amp;i915_current_bpc_fops);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c048da7d6fea..84a6d016e226 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1546,6 +1546,11 @@ struct intel_crtc {
 		u64 flip_count;
 	} dc_balance;
 
+	struct {
+		u32 numerator;
+		u32 denominator;
+	} force_cmrr;
+
 	int scanline_offset;
 
 	struct {
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 51e4f3309b8b..8b6e36ee9f55 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -4,6 +4,10 @@
  *
  */
 
+#include &lt;linux/debugfs.h&gt;
+#include &lt;linux/seq_file.h&gt;
+#include &lt;linux/string.h&gt;
+
 #include &lt;drm/drm_print.h&gt;
 #include &lt;drm/intel/step.h&gt;
 
@@ -1231,3 +1235,102 @@ int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_st
 
 	return intel_vrr_vblank_start(crtc_state, VRR_DCB_VMAX(tmp) + 1);
 }
+
+static
+int intel_vrr_cmrr_parse_ratio(char *str, u32 *numerator, u32 *denominator)
+{
+	char *sep;
+	int ret;
+
+	/*
+	 * Parse a &quot;numerator/denominator&quot; CMRR ratio string. The numerator
+	 * is the requested refresh rate in milli-Hz (refresh rate in Hz * 1000)
+	 * and the denominator selects the timing: 1000 for a 1:1 ratio
+	 * (no video timing) or 1001 for the 1000/1001 video timing.
+	 */
+
+	sep = strchr(str, '/');
+	if (!sep)
+		return -EINVAL;
+
+	*sep = '\0';
+
+	ret = kstrtou32(strim(str), 10, numerator);
+	if (ret)
+		return ret;
+
+	ret = kstrtou32(strim(sep + 1), 10, denominator);
+	if (ret)
+		return ret;
+
+	if (*numerator == 0)
+		return -EINVAL;
+
+	if (*denominator != 1000 &amp;&amp; *denominator != 1001)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int intel_vrr_debugfs_cmrr_show(struct seq_file *m, void *data)
+{
+	struct intel_crtc *crtc = m-&gt;private;
+
+	seq_printf(m, &quot;%u/%u\n&quot;, crtc-&gt;force_cmrr.numerator, crtc-&gt;force_cmrr.denominator);
+
+	return 0;
+}
+
+static int intel_vrr_debugfs_cmrr_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, intel_vrr_debugfs_cmrr_show, inode-&gt;i_private);
+}
+
+static ssize_t intel_vrr_debugfs_cmrr_write(struct file *file, const char __user *ubuf,
+					    size_t len, loff_t *offp)
+{
+	struct seq_file *m = file-&gt;private_data;
+	struct intel_crtc *crtc = m-&gt;private;
+	u32 numerator, denominator;
+	char kbuf[32];
+	int ret;
+
+	if (len &gt;= sizeof(kbuf))
+		return -EINVAL;
+
+	if (copy_from_user(kbuf, ubuf, len))
+		return -EFAULT;
+
+	kbuf[len] = '\0';
+
+	ret = intel_vrr_cmrr_parse_ratio(kbuf, &amp;numerator, &amp;denominator);
+	if (ret)
+		return ret;
+
+	crtc-&gt;force_cmrr.numerator = numerator;
+	crtc-&gt;force_cmrr.denominator = denominator;
+
+	return len;
+}
+
+static const struct file_operations intel_vrr_debugfs_cmrr_fops = {
+	.owner = THIS_MODULE,
+	.open = intel_vrr_debugfs_cmrr_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+	.write = intel_vrr_debugfs_cmrr_write,
+};
+
+void intel_vrr_crtc_debugfs_add(struct intel_crtc *crtc)
+{
+	struct intel_display *display = to_intel_display(crtc);
+
+	if (!HAS_VRR(display))
+		return;
+
+	if (HAS_CMRR(display))
+		debugfs_create_file(&quot;intel_vrr_cmrr&quot;, 0600, crtc-&gt;base.debugfs_entry,
+				    crtc, &amp;intel_vrr_debugfs_cmrr_fops);
+}</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">The
      debugfs interface accepts non-zero values, but fails to reset the
      value to zero.&nbsp;</div>
    <blockquote type="cite" cite="mid:20260714103938.2371448-2-mitulkumar.ajitkumar.golani@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
index 55e9c429f579..19c7990be1b2 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr.h
@@ -56,4 +56,6 @@ int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_sta
 int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_state);
 int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_state);
 
+void intel_vrr_crtc_debugfs_add(struct intel_crtc *crtc);
+
 #endif /* __INTEL_VRR_H__ */
</pre>
    </blockquote>
  </body>
</html>

--------------z8zy40bfu59uKdeVbG03wwwi--
