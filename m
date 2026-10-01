Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52833CA5FB3
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2026 07:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D702B10F59B;
	Thu,  1 Oct 2026 07:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kp80jWvi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010EE10F59B
 for <intel-gfx@lists.freedesktop.org>; Thu,  1 Oct 2026 07:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790838878; x=1822374878;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gikezAuTMDz1peYyIbRyD01gAlvzQzs7aXTYyQRGADA=;
 b=Kp80jWvi0MG8ZW/c+2kTd5W0jOfPXHJzqbjGucy/fRCYGTFoIeTRSJzr
 +pcjtiiHYcpo3hITGg4qN+Cx8ZSiAcgVsAiU20m0/5zzrMO1xUyp816Cu
 MmqoG9mJaOcyw1XC8fn1bPNCAUD2k0jYK51CgA5GsuNHOyuMjgLzYllgd
 PJOzPA3YCxZc+kDARnmfgCsrYt+diIVl418vG2fyHf6Vpo9TOMVPzTKGL
 +5CTWDg6SqZDt+DqpnR83rTeZpsHFw0F57x3PlGu07UNlNxW20mZteuE4
 88wFTN8jOfgf0PxPQ0iijXA1CqRBvfHLZYtz2oG9N/7DTMg6UHHgtEXih Q==;
X-CSE-ConnectionGUID: ZOllEDOSSuiifGyr6raWHw==
X-CSE-MsgGUID: fwBBjwLbSy+xHW2nycdeHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102162805"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="102162805"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:14:38 -0700
X-CSE-ConnectionGUID: f9Wb2rwLQUi23DHdjTdfNQ==
X-CSE-MsgGUID: JvGBYB7QQ96lBUsPjbJ3xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="274007897"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:14:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 00:14:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 00:14:37 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 00:14:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRl0yBoQ5ZjG4Dm3O/AChbefb0ktKgtG2Y6gAMTq6GJkLbZE+w8IVy+tWhkwDcf3si4ZO+tF8m7E/jixvPqvm1SIuDPagp1hVkkn7nPaglUNzy6MXaKgA3CKUTHhOb6sOgjpOusqArhz/L7E0h+Y8LQ9ULBBUeyg7LO/dz9bnR9kRYADumOc3slon2vgshad9mNY+PIY9nQyK+IUMrRr21s4rQMopVWPLLzxPlE2nbPdkg3j9UBmFEDoydviXbGnxXBvUle0UFFrKWbH4Bp+0+PrbUFm/EwgAI93pjzf3QrHJbY846dPwjHzmGWeWlK7vA/MiveYk8oIWJDGAkMK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIT0F/mIk5lHuRjsK6kUrlhPAElPHanTelDRtOG2bOs=;
 b=UdPGzj1PFZkXKOH0ertkz9h8FFVM5jPUSRLqco1kmMYvK5IQ8MVIvJFwUKj6qNxVvtHsuzNZNbT7YTmp+59PEcemeCbQ0Z+Seg+Df2UB+y1Dlh0zFF9eTXcZlJME9rbyC1K69uZOk+4ntAPfRZ+pWvaq1dhp8wvkzOcQkF6P4mocQzAzhD75lhFAFOTZaoo/covN8ekgeSbLBkNSkkrD1Qfd1nKzRJQCNjRbzAt3Tbq0Kr+N3ZMkXMfipjfZPV+SJxqHu8WmDOzjNwP6Bk7V7FT3eXDDO1sIEDz9ZZmFGpKg7Db1JXPdNTIdreaJn73+MfwvjdU/hKRtC9nnSOavVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by LV2PR11MB155101.namprd11.prod.outlook.com (2603:10b6:408:417::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 07:14:35 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 07:14:35 +0000
Date: Thu, 1 Oct 2026 07:14:24 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, <chris.p.wilson@intel.com>
Subject: Re: [PATCH v3] drm/i915/selftests: Fix unlocked mm.stolen in reset
 selftest
Message-ID: <qtny2hg7vgifbafgfnxao6rjuj3v6ixwehqjvzhhcsyu47gpkk@pdc3mzuxgosl>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260930113513.15169-1-sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260930113513.15169-1-sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL2P290CA0010.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::8)
 To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|LV2PR11MB155101:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a62c312-e616-425c-c0e1-08df1f8ba5b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: RgY59zdFohRWXzl6p/kwr8pG/fz5SeV8sd00UW7RHeOXSZQqsDrJI5yFhXETInJTrOK4ujDvg/gB5Wi1dG/nFEa2xip+cJAr0xfP69LyFGdO7rPRW5VrwZdLvvfCOE17A1HyyhStQUbEPw67GhZhgyNeN7+rG3gY2KBUVCXVxim1Wylf3m7OtzIgBv79O9E8Rv14H/ZLVksScqNFexDmJPSzfSR3F4jfQySVJoukuySZ1vasM1XS8GJxjMpxtxa+BVV6cKk0aWmUbdv2YX8cKOiG9+nc3kR8PGkMyqOfe4ma7n1eOQFY0aPxags11bP5r4WwQklrNgWCzxZdWyx57AFWagKHCZHndYrxgaO+f/5/rHBk8f3pjej/rWt3fBaSx6b/sGlGOA/c789tVwZL4cwY8ZRbbzR2re8ZfrJex03tfo1m3QmL3P7q70V1xJ4CcBV0UmzpRDjC3koI6BawZS43e1exRuZHP8lsqtZLHv6O+7kGkyLPabHHRDK4t1AQg+h182RowWmBQEuRTjs+PIV6lbeSjLm4YdqrLkQyZKH8u4nh8r7Pu/tkhoTSZxNZ0bpWuRc7j+C9Ydd4WyJLUKR2jTGd7SD10IcS3BGJYmquzuYHdFT687oBQQza4gRe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFJuVzl6T2tLb1E2SXJEZXVSTmlTZ2pRWjRQbis3RFMvVU5qZDBleTBFT3pU?=
 =?utf-8?B?TVN1Q2hvZG0vT2RmSjVEdXVHUVF1WUg4a0w2SDZ2ZE02QTQ1QVdpbGdkVU5M?=
 =?utf-8?B?TnAxSmxpS3pQanM5dDBsdXQ5cm5ENkc5WE9maXF0NGI1TlJ5SjFMRHQwL1Br?=
 =?utf-8?B?RTljUkF6T01YeWtLQ0RkaDRzVzlIemhtdEd6RlAvZFJHVU5ML25SL0p5b2E4?=
 =?utf-8?B?Y3JrdU1UQkFwZ2wrSEV4eTMrSUJ6cW1mZy9IQTZUeEdRQ0VQWFZla2Q1WFpt?=
 =?utf-8?B?UjBVWWpCVng1V1EyNFFtbDRpRjhQRU95ak5SdGhsc09UUWVxR1o3N2UvQmVV?=
 =?utf-8?B?UXNmV1NIWFBvai9oVG1NOThpU1ZRY0lzWVo0QXV0SVBtQ1dRRnczRXZFT0M1?=
 =?utf-8?B?Y3lsS00rcUl2ZTE2N2Z5Qjl0V2t0MVF1VVBWU25QMDJnd2RCY2RTTmpzcURI?=
 =?utf-8?B?RWlyQm1vQ2FNa1JLRUxWSFY0ZnZ6NllQU3h2Y05lZ2xqRjkrZEZMOWpDOXE1?=
 =?utf-8?B?bmNZWWNydS9HaU1acWFGa0FqTXBuVExpeXJLN2tMbm1SNVowdG9KQURsOFN6?=
 =?utf-8?B?d2lxalZnbUd2Q096M0lLbHUrMWQrb1dCTm12R1BGczJDaHpzUDVRT0FMVVVC?=
 =?utf-8?B?YldmNUFpTmZ6bS9GeG5lTTNUTXhLR2duclV0WTJvN3A4SlBDZzZtVCt5TTA3?=
 =?utf-8?B?OWFwNXpQZEdZUmx2VDJCbjhUT3htdjJibVIxRXNYUlFnYlY1ZGgzbVdZR3VY?=
 =?utf-8?B?cEhWbm5qRU1SZSt6UkRrWW9GMWJFcXZHdjRVMW9RT2dzZW9zcXIra2tQaDZ3?=
 =?utf-8?B?S2VmZ2lmQ2hvWlNPSTJRQ0tjL0FXbjM0TWZsYXNnQVZuekJTTU5NOE51VDdD?=
 =?utf-8?B?UXkvV0tzamlyWS9aYnJIUk50OHh4eGNVWTduZTRMd1hqREZ4SkczbkNrcDdS?=
 =?utf-8?B?M2pDVnFJK3BobkdYRW9LV3NLanVPTlpCRUhXUWlXTllVYTcyMzNjVytHMlg2?=
 =?utf-8?B?Yy9EcGQzeTIxbW9POW02RVpEL3F2SEhKUUlMendkTG9zbnBIdzJpQ1Y2T01u?=
 =?utf-8?B?MXhSZTRXK0xwSXBHOXA4clBHYytlZHY3emZHRjVFcG0yL0ZQdXdwZmVQNTA5?=
 =?utf-8?B?T1JHY0EzU29DbmN2VzRIVlV4aW5wV1Uwb3BPT0FkdzZmY2FkU3drekxsNXpC?=
 =?utf-8?B?Ri9NKzlrZEhCaEg5d29GVVFrR3piblBIenZoZzhDQVdrRUlRZzFLQTlvMDNT?=
 =?utf-8?B?SGxGZ1QrdmFxZXhvb0pETmliSTBzRlBRT1MvMXhkTjBuc1pwZTgxY0FXaHhD?=
 =?utf-8?B?YkY5SDhXN2lpeDRybTNpNGpJQW9wb2JOZzQyQy9LY1I0MEp5U3gvZDBOdzFG?=
 =?utf-8?B?SXNySXoyNGdlcU5tQmx3QUp0eEx0cklGSjRUMFBhbHU1ekFKdWN4ZEhMR2wy?=
 =?utf-8?B?dmdPWlg2c2d2Z2dBanZpaGdTSGs1MzJyaXFqdE9QOVhXYnd0RUYxaTZyTm9F?=
 =?utf-8?B?Z3d2WXJhdEJvQVlaVjZTOTFoaGJ5WEprblBhOXlNak04WHY0VkEveHVJVkpo?=
 =?utf-8?B?ZDlJVUdzNUl5SFNLRTVsMVZqd2ZHUDd2OG9KSlYyMGszVnV3UkZaRko3YlBa?=
 =?utf-8?B?Y01hR0Q2SkJJY043bWJZcXYwbjlKSzdwRlQxNWdqWWlST0VKREpiRHBZcEh5?=
 =?utf-8?B?SnBVK0l5TDJTSHpLaWJRY2VFNVhHM2Q5UHpZeTdickRra21OVjYwUGZ6QUwz?=
 =?utf-8?B?bFpETWdiZnpXZGdoWGFhN1JBS1lhQldXSGladmRZc2o0c2lhdnN6elp1eUNV?=
 =?utf-8?B?TVJ6MTEwUUhQS0txN2VEQ1VicEMvOHkxbzZiVlkvNzEwTktjUXRUSlk0R09z?=
 =?utf-8?B?N3RzRW5PMEVZcTJITmEwaktZTjRPVmJFeVpuV0dBZmxXM1RGQS8xYis2UHk2?=
 =?utf-8?B?YVlveXN2dGliK3NoTExBUDZDTUxEeHF4MW4vS2ZpVTBQL1VrUU00cmJrNGk1?=
 =?utf-8?B?NDlPUUVGMytaZTJBK2ZGOTE3Z2ZzRmtCZDhCeVhuVENyUlY4QTFUVlRKVVJh?=
 =?utf-8?B?V28zRzFZQTdVa2ZKWTE0YmVwZjM5ZWxXZEluVGY1eEpJUy9GYmFudENPa283?=
 =?utf-8?B?TVM2UnIydUxPNTJORDhvK3BRbjMvUzFFNHNqdTM2MUFYTjFuTWdvRmI5eFdP?=
 =?utf-8?B?ZlRSUE5mRUt2VmVqUFNjcjF1T1JsQlh2UWYrUnFWcEtkNUlod2laczZWRVVD?=
 =?utf-8?B?OTBTODRQa0FFYURpMkZnUnl3VE54WmE5OFZkbTFIbTZJWUovWTU1YWR0d3R4?=
 =?utf-8?B?MCs5WlJFQkVDRVRPclZUTU1ReXR3Um9tdm4wTHJ3aGxOT2UvN1RKVWhTNWJW?=
 =?utf-8?Q?WGQBvz4wQp9K6jao=3D?=
X-Exchange-RoutingPolicyChecked: 15D/dp+z0EAEZLOjtc2Z/v+QTi7CmQBxc2okIYvlUqjpmh5mTn6og0Z4Q5J/+l2q5zLI44Y71DB0SX9+6fTQRXCd83BhWKOrjgZQgSAe0hY+e5fyERY2FakZ0/WK88Qjmh/N0kWVV1Gu0NzIB8l71okiqez336xlunav+i/nUL9PDxxM/xPALzu5N3HQZKmmfL1MpvWYCYtI8kwNmO5508PWsgfOh3ZCNKdz19Qh3RGoYEj+1auuTOL8ksOswzzeVLnt/5163tVxTcUGwjzDYD8pNnu27NVNvG7Slbo/8/4f0d0E4tKFhVwiv3Vc7fOc1OJCISOpCVWR1nhLJYzO+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a62c312-e616-425c-c0e1-08df1f8ba5b1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 07:14:35.2604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfjQcGvTC9DRKHUJFBeDUqs+3EGw2j4eTxmftOx+0AIch7fxj7VLi7Ib1PPTqYbR5yZcO3CXtrhLKAlmBSWVhJQlb29F8AJJjQ3VSyX2TpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB155101
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

On 2026-09-30 at 13:35:13 +0200, Sebastian Brzezinka wrote:
> _igt_reset_stolen() use via __drm_mm_interval_first(), but
> does so without holding i915->mm.stolen_lock. Every writer of this
> (i915_gem_stolen.c: drm_mm_insert_node_in_range(), drm_mm_reserve_node(),
> drm_mm_remove_node()) takes stolen_lock, so the selftest's unlocked
> reader can race.
> 
> This was observed as a NULL pointer dereference in
> __drm_mm_interval_first() during igt_reset_device_stolen():
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000010
> ...
> RIP: 0010:__drm_mm_interval_first+0x2c/0x90
> ...
> Call Trace:
>   __igt_reset_stolen+0x565/0x6a0 [i915]
>   igt_reset_device_stolen+0x1a/0x30 [i915]
>   __i915_subtests+0xb8/0x250 [i915]
> ...
> 
> Also cap num_pages to i915->dsm.usable_size, which already excludes the
> hardware reserved region from drm_mm.stolen's range, so poison/verify
> writes never touch reserved stolen pages.
> 
> Fixes: 3da3c5c1c982 ("drm/i915: Exclude low pages (128KiB) of stolen from use")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16841
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
> v1 -> v2:
> - Fix always false !__drm_mm_interval_first() check (Andi)
> - Extend stolen_lock over the poison/verify writes, not just
>   the lookup (Andi)
> - Move the lookup into stolen_page_unused() helper
> 
> v2 -> v3:
> - Cap num_pages to i915->dsm.usable_size to avoid poisoning
>   hardware reserved stolen pages (Shashiko)
> ---
>  drivers/gpu/drm/i915/gt/selftest_reset.c | 26 ++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> index 2cfc23c58e90..811ddf991cb2 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> @@ -14,6 +14,16 @@
>  #include "selftests/igt_atomic.h"
>  #include "selftests/igt_spinner.h"
>  
> +static bool stolen_page_unused(struct intel_gt *gt, resource_size_t page)
> +{
> +	lockdep_assert_held(&gt->i915->mm.stolen_lock);
> +
> +	return __drm_mm_interval_first(&gt->i915->mm.stolen,
> +					page << PAGE_SHIFT,
> +					((page + 1) << PAGE_SHIFT) - 1) ==
> +	       &gt->i915->mm.stolen.head_node;
> +}
> +
>  static int
>  __igt_reset_stolen(struct intel_gt *gt,
>  		   intel_engine_mask_t mask,
> @@ -34,7 +44,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>  	if (!drm_mm_node_allocated(&ggtt->error_capture))
>  		return 0;
>  
> -	num_pages = resource_size(dsm) >> PAGE_SHIFT;
> +	num_pages = min_t(resource_size_t, resource_size(dsm),
> +			  gt->i915->dsm.usable_size) >> PAGE_SHIFT;
>  	if (!num_pages)
>  		return 0;
>  
> @@ -95,10 +106,10 @@ __igt_reset_stolen(struct intel_gt *gt,
>  				      ggtt->error_capture.start,
>  				      PAGE_SIZE);
>  
> -		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1))
> +		mutex_lock(&gt->i915->mm.stolen_lock);
> +		if (stolen_page_unused(gt, page))
>  			memset_io(s, STACK_MAGIC, PAGE_SIZE);
> +		mutex_unlock(&gt->i915->mm.stolen_lock);
>  
>  		in = (void __force *)s;
>  		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
> @@ -143,16 +154,15 @@ __igt_reset_stolen(struct intel_gt *gt,
>  			in = tmp;
>  		x = crc32_le(0, in, PAGE_SIZE);
>  
> -		if (x != crc[page] &&
> -		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1)) {
> +		mutex_lock(&gt->i915->mm.stolen_lock);
> +		if (x != crc[page] && stolen_page_unused(gt, page)) {
>  			pr_debug("unused stolen page %pa modified by GPU reset\n",
>  				 &page);
>  			if (count++ == 0)
>  				igt_hexdump(in, PAGE_SIZE);
>  			max = page;
>  		}
> +		mutex_unlock(&gt->i915->mm.stolen_lock);
>  
>  		io_mapping_unmap(s);
>  	}
> -- 
> 2.55.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
