Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E6ACA5FCB
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2026 12:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DC810F635;
	Thu,  1 Oct 2026 12:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fD4QRwK+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8AB10F635
 for <intel-gfx@lists.freedesktop.org>; Thu,  1 Oct 2026 12:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790856376; x=1822392376;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=Isour+zGQCnBiscZJL8o06ddPzQJ5JoktBc2FD+EQnU=;
 b=fD4QRwK+PCFrJmdDIjXXsoWDro+5NRA2SRYaHg+Hm3E5Uf2q0baM0Ssp
 B7/mE00ULxYqmg3lytghn6aQdOqjlqqSG10YY05QeBpPRpNedXq4/MSRn
 MtyXsKUmBjdi++rrmn267SgrYP2cmItmRiyduEnYecVB18ZvtE0hk1Jt3
 wl3h0oC1Uvbdo4BKHNtCr9rB8KbmS4sWG+vyADfxqyvszqeEffJLAosyI
 WHbjSvOy3k6nFlwkx42T1aRVMuci1WVo3c6k5I3M682C4zQDfSVHZ3PyX
 kJigtd4BTd/odRNsE1Kxqhk2aVo3u9ZOiSvHtQ/Bd+6rU5nwcwFXfpl+L w==;
X-CSE-ConnectionGUID: 4Aavj1zdSVOj5p4koykNvg==
X-CSE-MsgGUID: XzrHBdElRb+VIYEVQK86Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90511231"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="90511231"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 05:06:15 -0700
X-CSE-ConnectionGUID: emyqyMtCTMGqnCVHNXpOtQ==
X-CSE-MsgGUID: FM+jVj0OQ72IiAueBISadQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279758252"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 05:06:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 05:06:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 05:06:14 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 05:06:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WeTN5ifWLMazCvUaROmglhxQ1Wr6NBnCoP8koH4Hkze8o2rYTSq3NSO6up35arZkITrcMtwgLrDUBvy+Lh/NHmdXXhCDgEYO/a2pTMAURHfG1+3l3+SpKvN5BRAkGV9hewoZFEY5BtdnNvOxGRJqSlc6+okZisi5wA6z3XuDBMObd/EAAjI95TXUf40tuvt0X4t6KtdXTft1bx6NtyRaSuhJ2iFx75DSJcCNGa8LL3ZTm/KHPsk7VfzEN2CbBQZdqz7AX0ISlPDO5W4TI0hD9rCNu40g5WiZI2AOAkJ5IQjRh7HBLJ/KGPlgJv6qV8K2EUSAzkRMLBIZLMDwFcFNeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgVuqd60u3hisGiEPLVehT53cDpfbs3yU7FuN7x6CRc=;
 b=gTwIJW5WIQkSd32kzCZh9y6vOpolQ3kehuQNfJe0iTKIRLA7vDf4YF5DGrucnI/f19yJTz5nhSLb7qrBWN+rldP8oW1RyBULAcOh0JFAPBK49mgVGX7FD+iywpjsXnsPR5b9HikC1TDFAzI0UgdJi6g1KqEMfQnDscNYiDs8FVvcH+jkixHKGhc+sFl04AxxyzkKKZXhhlvW0wTdHsk0l5MQAVP1EkU31nD6vuBzwr29WCknIwyqu0pxff+jqQagllvxRrtTv0gHz+twpDK92lxJTEKv6DAi78ZCpw6AJorHs9z9Ybd8s15WDUH3yfcXlEmzuTR7oLKe55aRVprEkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DSVPR11MB9957.namprd11.prod.outlook.com (2603:10b6:8:3bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 12:06:10 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 12:06:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 1 Oct 2026 14:06:21 +0200
Message-ID: <DLTHLS3RB2RB.1UHVXLAFM1CEI@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v2] drm/i915/gt: Do not destroy uninitialized timer
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>,
 <intel-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.22.0
References: <20261001071757.2688815-1-krzysztof.karas@intel.com>
In-Reply-To: <20261001071757.2688815-1-krzysztof.karas@intel.com>
X-ClientProxiedBy: VI1PR0102CA0077.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::18) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DSVPR11MB9957:EE_
X-MS-Office365-Filtering-Correlation-Id: 17958518-f092-4e5e-6144-08df1fb461d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|56012099006|10067099003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Hnui9dU+XkNYmvARyBgjdcb4c7HXgGUhasLaUNJJyFColsP1xtdlpcNw3h0dZ640uAghsm47tACSPB8lHaxmkS2jv+tHuXW2xnQeWdptk0R2Z3817sAHUAoRqhSKumuNzomFCaE7aKs8x17DN6yY41cAy4DSg2F0gvCoiiRQHGSdhDuxNy3c+DxVzb/1LZJrJQOVRcN2LiVXp+8a95vYh+GDIBniw8SSIu6qEUEuuU0evWUpEbEHaHMhiHd3GJfYquq45k+H4Xsz3Qp+ZzCKY7IGEcK1tZPJMx5HK/KXZzDZ1HQK1vfYz6dI9EVhgb1LGEVe5uqs5L+CpaGq3LRkVrNiJCmPVenFE/jA4Pgg0+/TEaZoyDfdQjtmqKBZJxz+XnkKYq/Q0Jo1jsbdo2Q43e1LTKP1TCczI7qzojGGm2QTMCZRndTCAwLKEUjL+iNZ2V8VLZs/gV9b3di+M6c/T5k+rawdBNe9PYrzIzpdFWzyINPgtEEgTE6Gci/z4+jpVhNVGyX9Kz0ypuo1VkD95/puD7WH9sjorxAPNkFd1P5mYK6v222zKniLFoc9C5Ze6s/DZJsD1ijMDCIzVPBDmnxANliMG1k1M3U9pI13ylzmQde1Z3zb5QTyCu3WV/e3t21ufQ8Pmu7oHqFf8xwc9oXy6StUKFKhiJ7KqXraN2g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(11063799006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFVrWEthNk54Y0ZUZkpFdmZmUmdLd01RNVVsZWF3c1NLVXJ3YmF6N1dkRnlT?=
 =?utf-8?B?ZE9pTlR1WkRUekcyRitRNm1lN21KYWlXRWx3WUg2OEQ1ODV4TXIvNE5qQjBv?=
 =?utf-8?B?cDVZUjRqb2dUR3hlazl4ZjRHZXFMNE9rT1hHTjFHb0ZmTzBKN0JUWE9waDRq?=
 =?utf-8?B?b2pacHVadTZ1dFVxVDB4d05xNWZVYUxuWTFwNmVsN3BVelQvaldDY0J1QWhk?=
 =?utf-8?B?cTJhNS9nT0xWaXU5Znl3VUwxSXdxWnFTNXJveXI5Y3BmTVY2OW5aNm9Oc25H?=
 =?utf-8?B?c1hBY3dIZVBqR1lSVFRneTdidFEzSHNxU3poSS8xMjcxd25md1NDQkxvblJI?=
 =?utf-8?B?b0lMQmowSDl3MFp0WWl0SmRpQ0g5dExyTGZrWlM1TFdTSExoSHpmNVo4aHVs?=
 =?utf-8?B?eURnU2g2RnRkTmZja25DRmltaXNpa1NXUFgxZFUxNWR1WEIvYitsY1hZNGVX?=
 =?utf-8?B?MHQxcU80TU1sby82cXFxSEQ2M1IzMEszc1RkSlVnQUZjMi9XZTJmS0xkaUVl?=
 =?utf-8?B?c2htT0FnaHJIaDRqS2Z4TEtzK2FNQVU2TXhvbXlnVk1MaHdWR3hNaWpUOUVC?=
 =?utf-8?B?aE5hdnpSZ214L3IwNVVCT0JOcFhMcHk5NnRiaVMwYm16TFA2eVFEOFFjNzFB?=
 =?utf-8?B?VHJOQXpYWmRIWkg4a0dSYzRrWXRvWjJ3OEhJOVR0Wlpza0pOSUV5V0RhMTRF?=
 =?utf-8?B?TCt6cHQzR0NWUE0yVStuVG1FWTJzdHNVKzNGbFlKRHNZK3pZQ2xaR1ovRjlZ?=
 =?utf-8?B?bm1sNDRDWWdIQWpmYnBsc0sxYW4yRWxsN0pGdDAyZHAvdnl6bjAzbEw5NFhm?=
 =?utf-8?B?b2ZpV1M1MHhMemhhdE8wNU45ZGIzZ1pnNEQrbnM4RnljTk5JNmkzS1l5Unlm?=
 =?utf-8?B?TjFBN1lnVW8vdDltUmJxSElxa29XNUJIc3VpZE53eXdoSXc5UHIvcVNpYUtG?=
 =?utf-8?B?WXh5cTZjMzRZUGJhaDB2K3VhVElvcFVYTytuMFZpTm0wUVZmSTFmOXVyZm9a?=
 =?utf-8?B?bUNwdnJldFgxUlJRS2krNlc5QlRhVjdFVEhTMTlkdDNtMGF4MGVzN1F2VVNx?=
 =?utf-8?B?V0I0bWJnS05ZTHk3SWRJd1plSHh1ajJ4eVdwQzhOWkRZMjJGZlFMdVViMDU4?=
 =?utf-8?B?Y0tDeVlEY1RuVjIvVnZWemo5Y1RLYTJ4WjEzZXhNelRsYm4xaUhtUGhBZGxC?=
 =?utf-8?B?ejZWQUdDWEdLYWljMitBY2FwSXZad0tDMzhVN2I5bnp0TXZsSk1EZTNpb0s4?=
 =?utf-8?B?UU1CTmVIR0JmVW5FSjNEK0ZlUEJGY1JBcWdyc0JHT3VIT1NPQVIyOHlLNW1k?=
 =?utf-8?B?ZWl6RGxXa2VjZ001UXFUWXREcllZcTFCT2ZqVEZiVWl1U1NnVXc5bCs4MGpw?=
 =?utf-8?B?UlhDSkprNmVXTGxKSlczUDRUVW85UFYvaDBwTTBpdVZicGNIMTgxemcyNENn?=
 =?utf-8?B?WDU4VXNmNmxJY1FlRHlqSGJacFpmRHYwcStQd014ZmVaY2M3U2FvOXArSm9u?=
 =?utf-8?B?ajRVNWpZNEJIQ0JQYm1RbGh3QnR6MkJFMHBTYTFhczhYZUk0SEw4NjlkQXlQ?=
 =?utf-8?B?cEFaTzVkQktURG5CeGE2R0N6cm10WjY2SzcrQ1lYdndqL0lYbk1NWXBIRURB?=
 =?utf-8?B?bm9sbzZBNTBsNUhCYkJQSGZiY2VIR3htYzg0akVtTTZGZEcyYzBOWnJVa0hh?=
 =?utf-8?B?L2ZaeU1nSVNzNHpYcDNxdU92YkVibjQ3RHFaRVlqaXdob3V3Z0hOK1VIeXhl?=
 =?utf-8?B?NEtjcmw5YzFOekEvOEZPNDhBZk0rM1JWa1V2eG5qbWdiaUtoWXhIUC9vNmU0?=
 =?utf-8?B?MzVvN0dXQ0tHUUhYbVRNYW5TNkVFeEtGYncza0ZDNWRZanl4SEJuVTFtYklG?=
 =?utf-8?B?UXNSUXYzNnAwcjhoTG5uMVBsUFJ3ZlozMUN3Sy8vdXZPUFBnczlxOW9ramZG?=
 =?utf-8?B?RlVlZWxpem4rZWNnREpqMngzVEh6ZXRUdWRUUjU5eEppVHY3U0s1cUtZK1A3?=
 =?utf-8?B?dkVIRVZsMzVnQm9pMHI1U2lOR2k5VC92WUIybXFFWDVMNnlkSVB5TzBQVDky?=
 =?utf-8?B?Q015MUJyODhlRHRXeUxJOUNYT2t3Y1h4b1Zqb0ZSSUFkRFRaYmEybSsxR1FQ?=
 =?utf-8?B?MVdpTzRuSVV4ZUV6cUpUZjJma3BQT1FFNnJmcHdEcWw3YUZZemlOUUQ1emdn?=
 =?utf-8?B?QWw0UDk1cDZuV3FKaDBFZ1l3RFVZN1ZMa3NQOEZqUi9hS09NWmwwbFpXRk14?=
 =?utf-8?B?R1ZKeHBBYUx1SWx6RmdDMVdmL1ViNTFCcmJFZlVqOFhLbUY2UnoxVEpJRTN6?=
 =?utf-8?B?S1l4L3ljS3k0cVlaRVVBU1VUcUtxa3BNVkRBOWc5WTJmcy9OQTk4ZzlpMVlX?=
 =?utf-8?Q?T9UOVC1cPYTrS9QM=3D?=
X-Exchange-RoutingPolicyChecked: nBOTvtthSPLfzXRQc2aIvv/yWaQByzfGoeTCrT7XtAg0r/ciBt3aoXPVmhaNXc1oFbH+zWnMDPT/rtMKRUufWBq9imtVPBk9Af3o2bAgs7CZ8m4GukmIvs239wJlaUsbGWlfkbD4WehR9oKm8jernmA8oCYZ5OCovZ27JdtYl1gyi5fW2Ul+ANwONwDGhiOVnkRYFOoN6xM7oyhrLzbJqUrKgLZv0G1L+XPymWkrGWzDSLtj8PXcaLEPWWvbB0CldFPmD9X18LoPeDPgng93Wt/F+ZEA5KoKAJHpDhX5r4XTSJECGSPWhFNzWyOGgth2RFGPLD6hh/LCX0l3YRveug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 17958518-f092-4e5e-6144-08df1fb461d1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:06:10.6974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6IwrPc/a4eCOPu8U8mjYaa6qHPm05dXqKKBAI6mj892wACvGoji9EazBe3k8nc5JnkaqXfcyUQGQkTDotL6b3PjKUcHpjPnO4HGHe9+P5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9957
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

On Thu Oct 1, 2026 at 9:17 AM CEST, Krzysztof Karas wrote:
> If intel_ring_begin() fails in live_emit_pte_full_ring(), then
> cleanup is performed on an uninitialized timer.
>
> Prevent that by jumping to a dedicated label for driver removal
> cleanup.
>
> Assisted-by: Copilot-Claude-Opus-5
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_migrate.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm=
/i915/gt/selftest_migrate.c
> index 5b986a7687d9..5e3a9b5a83eb 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> @@ -651,17 +651,18 @@ static int live_emit_pte_full_ring(void *arg)
>  	len =3D emit_pte(rq, &it, obj->pat_index, false, 0, CHUNK_SZ);
>  	if (!len) {
>  		err =3D -EINVAL;
> -		goto out_rq;
> +		goto out_timer;
>  	}
>  	if (len < 0) {
>  		err =3D len;
> -		goto out_rq;
> +		goto out_timer;
>  	}
> =20
> -out_rq:
> -	i915_request_add(rq); /* GEM_BUG_ON(rq->reserved_space > ring->space)? =
*/
> +out_timer:
>  	timer_delete_sync(&st.timer);
>  	timer_destroy_on_stack(&st.timer);
> +out_rq:
> +	i915_request_add(rq); /* GEM_BUG_ON(rq->reserved_space > ring->space)? =
*/
>  out_unpin:
>  	intel_context_unpin(ce);
>  out_put:
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

