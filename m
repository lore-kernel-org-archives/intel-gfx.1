Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1732606B11D
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Nov 2026 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=miB6IzbB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FFF10E7FF;
	Tue,  3 Nov 2026 11:09:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB70110E7FF;
 Tue,  3 Nov 2026 11:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793704179; x=1825240179;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=797wgBsj0inlylksc0PUHLb7NOxEIwwxScwiczLutSU=;
 b=miB6IzbBu2eak4cvIdeAM2rcl8ry1uHgNoUyh5EXdXNe9eYfZDtYxipn
 O6GYzPaxpP7n6RxguppNPCV4yIIMD63+KvGga2es2ep51JsBPFTY67G1L
 aQb5sBGj5eVY8ucDNnYPPU+dSxs6FDK528oGFI1WWr3uE1swBO6ZjW5cE
 g43AJQyiU0CiszZyp/HLrH5nrUy4z9J7QelEG99G+g9uu+/ZzoW5yeBok
 MXrMKDk1uMFemaufmHFuwOItwXhds/7Tx8yvvHslF2UDP5HrQYkX5rQIB
 TxIxBwmn7hlJsVtalU5AQch0gnZG45kqaCLeLHc5sGXB7N0HYVzB5pJm/ g==;
X-CSE-ConnectionGUID: gY5tNMAaRU+Ez/4E5OheZA==
X-CSE-MsgGUID: 6f67YWqkRcCbGhSgjQrAQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2426232"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2426232"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 03:09:25 -0800
X-CSE-ConnectionGUID: Y6SOZLjGSwaKsEUGmG4org==
X-CSE-MsgGUID: 5Buhqa74Sqe7ye43cuBpjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6771263"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 03:09:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 03:09:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 03:09:24 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 03:09:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vK6JOBZIMwHNfasBoo5I1UUp6OBNr0QWbWqbJNh2k8DlGH2aNH7qYA6rxhIReUxPgY9DrgcXJZotaeJeKpwjkjuVWoGmSRaHnHbzyKRf9yiAxM34i7jN72OHKAP+nKIoFbusBIGOGfjUDgnlhNkkIFD8OuvXAlU3Q/jVwlEGzazQ75yKy30dlT4Lk2N7sUP132kMcvtu8AXafx7YXyzs2gUeZ6dNSdHsB998IHdTrm2whc6pVDKd93UWpq/voaa+6snHPIrOAT6l4sxpEBUPyuvk1PpEkntkhTahuNoL2Jf11t8meiMy6KF+saCyOcRLVEf135IiCsWvis/rKDAaeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hh0aYJdcYbAF008sqCnvVEka32MRZxW8gxN2Wj54zNo=;
 b=kbqJ0s1h63tRgdHdi6/S5qMfm6TnmX/7oRf17RKIIvxqTULjYiQqS19RC0IBNpiK6hKZeTK6inVLejONb5/oAe5WFIN1lktLh6hn85Fr4P4g3qELGYCgTG/Yi2N+JMN/bhTEeTrk5qn8kwElcBAXQeHTJEmk+pkbPSSgzI6kfmEgjLWY4YnTuZec5MSRnt4sNg63G9s3hXauKSwXjpSebY+jUuT2Bbe7r021D5mey1lRmZRxAepUwV0luaQMCNEtTag+LKmB1xDNTu71mowJevzvLSwlMDNSaTiJ3uTJwBR7es8HKl35Z/KLf8bwy2IPXkNBr/V2X21yjdUQ+x7OyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by PH7PR11MB8501.namprd11.prod.outlook.com (2603:10b6:510:308::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 11:09:18 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 11:09:18 +0000
Date: Tue, 3 Nov 2026 13:09:11 +0200
From: Imre Deak <imre.deak@intel.com>
To: Mika Kahola <mika.kahola@intel.com>, <I915-ci-infra@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFp?= =?utf-8?Q?lure?= for
 drm/i915/ptl+: Fix eDP support on TypeC PHYs (rev2)
Message-ID: <aunA1xpjenEGiRQi@ideak-desk.lan>
References: <20261029113017.618286-1-imre.deak@intel.com>
 <179339602495.96240.5855184382454981326@221881a7231d>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <179339602495.96240.5855184382454981326@221881a7231d>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GVX0EPF0005F6CE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::64b) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|PH7PR11MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: c2444521-2007-4d68-a4e5-08df399ae74e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|261026121527099003|261026135527099003|261026140227099003|261026130827099003|261028144727099003|261009223327099003|261009220027099003|261009223027099003|261009221727099003|261009221227099003|261102123227099003|261021135927099003|261021130227099003|261021123027099003|261021121427099003|261021133027099003|261022113327099003|261022115727099003|261022075727099003|261022105027099003|5023799004|11063799006|4143699003|3023799007|56012099006|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6gEpUa7LTriu4OpNVqmC7x+BzN2l5ZLZdNfEAhhkjfPKLYM4o5prTi4ALHdufZMnWpdvCi/Ztq7Mg50KVJhsuLUx2TzJXe2U44/1aGCr9CZ7iDnF34io24TFOTK6yTsVv2rV+e/XcXxzQm0Uway7QhEG5R80wAgRHztloK7VoEDihbofSRsFU9Vk2+7yW4ZhPPhek/pUQwk1FXQeztUghEPD7lcEACAQYUYLdCdXj2R/K0ocbqsXeDFMoUTvAjLIygRkgN88eoxv3Y8yUU9kqGow6On7Geqtf0inAocoTXMvDprQJocIdaMIaiuCy+3wMTKV6VPFw3KciIhJWuzSS7LZQOOi5Vdu4kqtDvLDBwg8IpxLttJ2eqcShjOLCKp989Xp77kBVNe4fZ6tPxXGIjdMG2l0+OZnoXiO3LJFZ5VYd37DGt0a7Wimj9kCzGWZ8KqKUawMIxQDH4knvRlkBydB7z69NLtJlA7VMt6+RQ+BKU4usRQbZxrskrXQH6Lwb1PoEi44Ggl+6wlN6BwNSfr9RwALrrjrAK82DTiqo6eaNy/iIMhwXcU68v3wpCr7J5+MZWbGR7uuuHtbZMTEPccccDcs46586v/MvVVnPQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261026121527099003)(261026135527099003)(261026140227099003)(261026130827099003)(261028144727099003)(261009223327099003)(261009220027099003)(261009223027099003)(261009221727099003)(261009221227099003)(261102123227099003)(261021135927099003)(261021130227099003)(261021123027099003)(261021121427099003)(261021133027099003)(261022113327099003)(261022115727099003)(261022075727099003)(261022105027099003)(5023799004)(11063799006)(4143699003)(3023799007)(56012099006)(6133799003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gjxffxNRmV2uA6UrLX51nwRf2VWlCmGr6brNwUFlPRcrs+eRsuKq9bNhqN32?=
 =?us-ascii?Q?wsndgCdxfGHw+ZJIU6wZ6BC3zH+4wHJPaIgfkC9JySnBmK2osOMoyKjh4/Yd?=
 =?us-ascii?Q?s2mJafOb8GIPV4qWdm0vVUk5qXmW5vZlpsfWuHDhIcJJ/b1W8XN5N6C+rSZx?=
 =?us-ascii?Q?QHmlmnYPL4JlbjjocSO53KtfeOOq93nHjwpZaTSUNuvXa37ejhDeen5fxWIC?=
 =?us-ascii?Q?CQQe9JX7i1m5L/HJbb15sc02RxVudrQNNgh4E9X0ZKmY+zB4/lLW444xwY+R?=
 =?us-ascii?Q?1OBXs6OUijcTvWbw3K7okuhh4uCfU+WrFJ93kscgIc69rAyiAUaLQZpuPku5?=
 =?us-ascii?Q?aY/MBuyYmrjmNDZ2dVJgrhZMp0HSR2vBH1LnMiOtK+o71WbmnOLTzuMR68p2?=
 =?us-ascii?Q?/oRQbWmJhaQ2YmshvU/yfvp/OTNokGQgW2KhaKCXRBljrmisNtLb4RLM73D+?=
 =?us-ascii?Q?SImvw945UX3IaZsRVkwEO+Gl24oVbFRdIIZzoFgE0PQtXgG2ltiB/AL9HTah?=
 =?us-ascii?Q?C0gmYBT8UxGztXC33/D3jsy/+YO1k3jPwo91Iza7yxMDe1KyuXA4FU7LQB9j?=
 =?us-ascii?Q?5dTGUAfikdS/Rwztw4cNqhVa+70NZEntIv6643/OllljCDpU28uxXyI7Fdkm?=
 =?us-ascii?Q?z9P1tbMdP4y3YV1B8f6t+tVzJTr0F7z5SyuKLzwv5+RgX5EPM63r/0VpMfQZ?=
 =?us-ascii?Q?e4y4wUyGfm8u8fO5PHdypYUua7AyaFW8CURMMrEAD25m7UVL4QlmdRC1oA3e?=
 =?us-ascii?Q?pkYGPNhPqQEYJcaZFy/M+5P+3J4k+R6JaPose9smoLpdTY4o7nc0XirL3mbj?=
 =?us-ascii?Q?8FzGkXRhs+VSDdKZ38yoIR7Mj4rNebFCScKGdOIVKk0bclWwqn8ypJtYGM2D?=
 =?us-ascii?Q?Kg+EI44xXrNIyxiYjfbkOpaSKvzDuOGwWRxWAT/C6grRxvDlrA0sezNgJNIg?=
 =?us-ascii?Q?ctT7d1K9y+AdcKclmDEL+oQwvdAEPkW1KWwAhSj+r/rWUd1aS8lk/WMv7qrx?=
 =?us-ascii?Q?X00+iX7pT4AD+TXw7Fnv9wIeJYsxiGYgRr4JaUi0NquYxFaAYUVTo38ZtKjY?=
 =?us-ascii?Q?SJDCnVsIZGxTm+oTrYVokShgqCFmovXI0NDPv1Kfer72Q0SBPtm2Fy5okfFw?=
 =?us-ascii?Q?RhfKpGldZ48pmcns26Tuftn8D8HS7kjldQwotsTl97bN6f1yVtf0wwzt91xi?=
 =?us-ascii?Q?p6Sgx8cmdVPkbMh2eJC/UvPzlaVH1T+89uYOyp468wE7gqUaoJO3qunW1HEt?=
 =?us-ascii?Q?UPPBTWh+rTqk5uBABYsatp/Q1/xlxM16KWUvrEbVNdIsMwYXrmIr/dmdov1k?=
 =?us-ascii?Q?oxgWLOtFKbh0QgyUmAMODqwVQFprstbpW7qDQAaymaIu3vCtqRXL79+Zva5X?=
 =?us-ascii?Q?wjvXJLSGT44FJ/Ra6PjVqYIvncKKhmpxchuCspO7C5XHsUdU6uYr7YsiWl6Y?=
 =?us-ascii?Q?56O8PFGiSCJZnq9IV7pPMaVvkgnvDfG+jU5chQa48tjvt226+Cxc/3E4L/B1?=
 =?us-ascii?Q?fbBBGmTM4yIdtSXlLIqto9bFie8IWC37BB57gCrNXyajpk3p94t9/O0c/FTc?=
 =?us-ascii?Q?VHBbZcGY5N3cguTWBw5yUVbCLJNx/vvH/ahbUFJAt9jEVYKEieVpT2VCm7sb?=
 =?us-ascii?Q?oA0DfDok/Blxx5yw4EUxOJMhGaWVDAwBz/9MLYHSmXVRJ76j/4LAK34jfsjP?=
 =?us-ascii?Q?xcoJaBInqVRm6leHXAQB5Si65VXdLdxWO9rdb0oJi3qeSWgbzj3LP/y5vDoQ?=
 =?us-ascii?Q?qacZbbWE1Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: gejYFNw+LmoXHwI+schxaDy98i0y/zXRLqe1fxfcGd+odvu7l+k9hfSsJ3uIMkDVLML4jEVwxZRlspPiNr4+tjM0irmlG9XMeC7DHtfogcrjeocUKIPukbUXt2F5D6GKBD6Lqp8Av8I4bKchnWvldEPNBP1BYjjZ/7AIqOqmWoo87QoyWeR7df6wla4iojjW1VODfe3A5+Wjtg/ubeIDnfBh469jwCGoqWwofbR6yUE5hKJXi9X9EJq6xwBDdGDkNxberyrNrKoC0jmQHLMePovCy8ambUzzYYCXUOzu+lZz2RYidXITfYHlPYclEOY26vRO5OyQcCX/kc5ZH+cKzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2444521-2007-4d68-a4e5-08df399ae74e
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 11:09:18.4734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1VFEhcqluVz2tUgQfF3BCquzj95DS9kq+aEKFH1t79H5r9RpmpM3L8UReN47PSWNiKZEG7NFAV0+fyxL/Dagg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8501
X-OriginatorOrg: intel.com
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks for the review, patchset is pushed to drm-intel-next.

The failure is unrelated, see below.

On Fri, Oct 30, 2026 at 09:33:44PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/ptl+: Fix eDP support on TypeC PHYs (rev2)
> URL   : https://patchwork.freedesktop.org/series/177148/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_19418_full -> Patchwork_177148v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with Patchwork_177148v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_177148v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_177148v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-mtlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-mtlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

The issue is
i915 0000:00:02.0: [drm] vblank wait timed out on crtc 1

after system suspend/resume. The system is not an eDP on TypeC port
platforms, so it's not affected by the changes.

The same problem happened also in
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19422/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html#dmesg-warnings3194

for instance, but also rather often in the following runs, albeit not
always in suspend tests:

CI_DRM_19401/shard-mtlp-4/24/dmesg.log:<4>[  557.598393] i915 0000:00:02.0: [drm] vblank wait timed out on crtc 0
CI_DRM_19402/shard-mtlp-4/2/dmesg.log:<4>[  253.096194] i915 0000:00:02.0: [drm] vblank wait timed out on crtc 0
CI_DRM_19405/shard-mtlp-4/24/dmesg.log:<4>[  301.927754] i915 0000:00:02.0: [drm] vblank wait timed out on crtc 0
CI_DRM_19419/shard-mtlp-4/11/dmesg.log:<4>[  328.927392] i915 0000:00:02.0: [drm] vblank wait timed out on crtc 3
CI_DRM_19419/shard-mtlp-4/16/dmesg.log:<4>[  688.988504] i915 0000:00:02.0: [drm] vblank wait timed out on crtc 0
CI_DRM_19422/shard-mtlp-4/14/dmesg.log:<4>[  363.011809] i915 0000:00:02.0: [drm] vblank wait timed out on crtc 1
CI_DRM_19435/shard-mtlp-4/23/dmesg.log:<4>[  210.173393] i915 0000:00:02.0: [drm] vblank wait timed out on crtc 0


> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_177148v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][3] ([i915#8411]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-12/igt@api_intel_bb@blit-reloc-keep-cache.html
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#14544] / [i915#8411])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#8411])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#11078])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@device_reset@unbind-cold-reset-rebind.html
> 
>   * igt@dmabuf@dma-buf-fence-chain:
>     - shard-glk11:        NOTRUN -> [SKIP][7] ([i915#17712])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@dmabuf@dma-buf-fence-chain.html
> 
>   * igt@drm_read@empty-block:
>     - shard-dg2:          [PASS][8] -> [SKIP][9] ([i915#17359])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@drm_read@empty-block.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@drm_read@empty-block.html
> 
>   * igt@fbdev@pan:
>     - shard-snb:          [PASS][10] -> [FAIL][11] ([i915#15792])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-snb4/igt@fbdev@pan.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-snb4/igt@fbdev@pan.html
> 
>   * igt@fbdev@write:
>     - shard-dg2:          [PASS][12] -> [SKIP][13] ([i915#2582])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@fbdev@write.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@fbdev@write.html
> 
>   * igt@gem_basic@multigpu-create-close:
>     - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#7697])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@gem_basic@multigpu-create-close.html
> 
>   * igt@gem_ccs@block-multicopy-inplace:
>     - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#14544] / [i915#3555] / [i915#9323])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-glk10:        NOTRUN -> [SKIP][16] ([i915#17568])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#6335])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-2/igt@gem_create@create-ext-cpu-access-big.html
>     - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#6335])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-glk:          NOTRUN -> [SKIP][19] ([i915#17530])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk2/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_freq@sysfs:
>     - shard-mtlp:         [PASS][20] -> [FAIL][21] ([i915#16505] / [i915#9561]) +1 other test fail
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-mtlp-6/igt@gem_ctx_freq@sysfs.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-mtlp-7/igt@gem_ctx_freq@sysfs.html
> 
>   * igt@gem_ctx_param@set-priority-not-supported:
>     - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#17444])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-12/igt@gem_ctx_param@set-priority-not-supported.html
>     - shard-glk10:        NOTRUN -> [SKIP][23] ([i915#17535])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@gem_ctx_param@set-priority-not-supported.html
> 
>   * igt@gem_ctx_persistence@hang:
>     - shard-glk:          NOTRUN -> [SKIP][24] ([i915#17527])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk2/igt@gem_ctx_persistence@hang.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#280])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-2/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-tglu-1:       NOTRUN -> [SKIP][26] ([i915#280])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_exec_balancer@bonded-sync:
>     - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#4771])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@gem_exec_balancer@bonded-sync.html
> 
>   * igt@gem_exec_balancer@parallel-bb-first:
>     - shard-glk:          NOTRUN -> [SKIP][28] ([i915#17547]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk2/igt@gem_exec_balancer@parallel-bb-first.html
> 
>   * igt@gem_exec_balancer@parallel-keep-submit-fence:
>     - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#4525])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@gem_exec_balancer@parallel-keep-submit-fence.html
> 
>   * igt@gem_exec_endless@dispatch@bcs0:
>     - shard-glk:          NOTRUN -> [SKIP][30] ([i915#17571])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@gem_exec_endless@dispatch@bcs0.html
> 
>   * igt@gem_exec_fence@submit3:
>     - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#4812])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@gem_exec_fence@submit3.html
> 
>   * igt@gem_exec_flush@basic-uc-ro-default:
>     - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#3539] / [i915#4852])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@gem_exec_flush@basic-uc-ro-default.html
> 
>   * igt@gem_exec_params@rsvd2-dirt:
>     - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#17453])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@gem_exec_params@rsvd2-dirt.html
> 
>   * igt@gem_exec_params@secure-non-root:
>     - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#17416])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@gem_exec_params@secure-non-root.html
> 
>   * igt@gem_exec_reloc@basic-write-read-active:
>     - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#3281]) +6 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@gem_exec_reloc@basic-write-read-active.html
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - shard-dg2:          [PASS][36] -> [INCOMPLETE][37] ([i915#13356])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@gem_exec_suspend@basic-s0@smem.html
> 
>   * igt@gem_exec_suspend@basic-s3:
>     - shard-glk11:        NOTRUN -> [INCOMPLETE][38] ([i915#13196] / [i915#13356]) +1 other test incomplete
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@gem_exec_suspend@basic-s3.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#4860])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-glk10:        NOTRUN -> [SKIP][40] ([i915#17456])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@heavy-random:
>     - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#4613]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-2/igt@gem_lmem_swapping@heavy-random.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random:
>     - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#4613]) +2 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-8/igt@gem_lmem_swapping@heavy-verify-random.html
> 
>   * igt@gem_lmem_swapping@parallel-multi:
>     - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#14544] / [i915#4613])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-glk:          NOTRUN -> [SKIP][44] ([i915#17503] / [i915#4613]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk2/igt@gem_lmem_swapping@random.html
> 
>   * igt@gem_lmem_swapping@verify-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][45] ([i915#4613])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@gem_lmem_swapping@verify-ccs.html
> 
>   * igt@gem_madvise@dontneed-before-pwrite:
>     - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#14544] / [i915#3282]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@gem_madvise@dontneed-before-pwrite.html
> 
>   * igt@gem_media_vme:
>     - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#284])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@gem_media_vme.html
> 
>   * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
>     - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4077])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
> 
>   * igt@gem_mmap_wc@invalid-flags:
>     - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4083]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@gem_mmap_wc@invalid-flags.html
> 
>   * igt@gem_partial_pwrite_pread@write:
>     - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#3282]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@gem_partial_pwrite_pread@write.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>     - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3282]) +6 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-glk:          NOTRUN -> [WARN][52] ([i915#2658])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk2/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pxp@protected-raw-src-copy-not-readible:
>     - shard-glk10:        NOTRUN -> [SKIP][53] ([i915#17521]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> 
>   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>     - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4270])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-12/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
>     - shard-glk11:        NOTRUN -> [SKIP][55] ([i915#17521])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
> 
>   * igt@gem_pxp@verify-pxp-stale-ctx-execution:
>     - shard-glk:          NOTRUN -> [SKIP][56] ([i915#17521])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk8/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
> 
>   * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
>     - shard-glk11:        NOTRUN -> [SKIP][57] ([i915#17492]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html
> 
>   * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
>     - shard-glk:          NOTRUN -> [SKIP][58] ([i915#17492]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>     - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4079])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> 
>   * igt@gem_softpin@noreloc-s3:
>     - shard-rkl:          [PASS][60] -> [INCOMPLETE][61] ([i915#13809] / [i915#16226])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-5/igt@gem_softpin@noreloc-s3.html
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@gem_softpin@noreloc-s3.html
> 
>   * igt@gem_tiled_swapping@non-threaded:
>     - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4077]) +10 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@gem_tiled_swapping@non-threaded.html
> 
>   * igt@gem_unfence_active_buffers:
>     - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4879])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@gem_unfence_active_buffers.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-glk10:        NOTRUN -> [SKIP][64] ([i915#17507])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gem_userptr_blits@forbidden-operations:
>     - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#14544] / [i915#3282] / [i915#3297])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>     - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#3297])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
> 
>   * igt@gem_userptr_blits@unsync-overlap:
>     - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#3297])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@gem_userptr_blits@unsync-overlap.html
> 
>   * igt@gem_workarounds@suspend-resume-context:
>     - shard-rkl:          [PASS][68] -> [INCOMPLETE][69] ([i915#13356])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-8/igt@gem_workarounds@suspend-resume-context.html
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@gem_workarounds@suspend-resume-context.html
> 
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-rkl:          [PASS][70] -> [ABORT][71] ([i915#15152])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-1/igt@gem_workarounds@suspend-resume-fd.html
> 
>   * igt@gen3_mixed_blits:
>     - shard-glk:          NOTRUN -> [SKIP][72] ([i915#17688])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@gen3_mixed_blits.html
> 
>   * igt@gen3_render_linear_blits:
>     - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#17455])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@gen3_render_linear_blits.html
> 
>   * igt@gen3_render_mixed_blits:
>     - shard-glk10:        NOTRUN -> [SKIP][74] ([i915#17532])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@gen3_render_mixed_blits.html
> 
>   * igt@gen7_exec_parse@basic-allocation:
>     - shard-glk:          NOTRUN -> [SKIP][75] ([i915#17505]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk8/igt@gen7_exec_parse@basic-allocation.html
> 
>   * igt@gen7_exec_parse@basic-offset:
>     - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#14544] / [i915#17455])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@gen7_exec_parse@basic-offset.html
> 
>   * igt@gen7_exec_parse@batch-without-end:
>     - shard-glk11:        NOTRUN -> [SKIP][77] ([i915#17505])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@gen7_exec_parse@batch-without-end.html
>     - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#17455])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@gen7_exec_parse@batch-without-end.html
> 
>   * igt@gen7_exec_parse@load-register-reg:
>     - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#17455]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-8/igt@gen7_exec_parse@load-register-reg.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#2527] / [i915#2856]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@bb-oversize:
>     - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#2527]) +2 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@gen9_exec_parse@bb-oversize.html
> 
>   * igt@gen9_exec_parse@secure-batches:
>     - shard-tglu-1:       NOTRUN -> [SKIP][82] ([i915#2527] / [i915#2856]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@gen9_exec_parse@secure-batches.html
> 
>   * igt@gpu_buddy@gpu_buddy:
>     - shard-glk11:        NOTRUN -> [SKIP][83] ([i915#17514])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@gpu_buddy@gpu_buddy.html
>     - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#15678])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@gpu_buddy@gpu_buddy.html
> 
>   * igt@i915_drm_fdinfo@isolation@rcs0:
>     - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#14073]) +5 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@i915_drm_fdinfo@isolation@rcs0.html
> 
>   * igt@i915_fb_tiling@basic-x-tiling:
>     - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#13786])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@i915_fb_tiling@basic-x-tiling.html
> 
>   * igt@i915_hangman@engine-engine-error@bcs0:
>     - shard-glk:          NOTRUN -> [SKIP][87] ([i915#17580])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@i915_hangman@engine-engine-error@bcs0.html
> 
>   * igt@i915_hangman@gt-engine-error@bcs0:
>     - shard-glk10:        NOTRUN -> [SKIP][88] ([i915#17580])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@i915_hangman@gt-engine-error@bcs0.html
> 
>   * igt@i915_module_load@fault-injection@__uc_init:
>     - shard-tglu-1:       NOTRUN -> [SKIP][89] ([i915#15479]) +4 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@i915_module_load@fault-injection@__uc_init.html
> 
>   * igt@i915_module_load@fault-injection@intel_connector_register:
>     - shard-tglu-1:       NOTRUN -> [ABORT][90] ([i915#15342]) +1 other test abort
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@i915_module_load@fault-injection@intel_connector_register.html
>     - shard-glk11:        NOTRUN -> [ABORT][91] ([i915#15342]) +1 other test abort
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@i915_module_load@fault-injection@intel_connector_register.html
> 
>   * igt@i915_module_load@fault-injection@intel_gt_init-enodev:
>     - shard-glk11:        NOTRUN -> [SKIP][92] ([i915#17600]) +4 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@i915_module_load@fault-injection@intel_gt_init-enodev.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#6412])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-2/igt@i915_module_load@resize-bar.html
> 
>   * igt@i915_pm_freq_api@freq-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#8399])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@i915_pm_freq_api@freq-suspend.html
>     - shard-glk11:        NOTRUN -> [SKIP][95] ([i915#17526])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@i915_pm_freq_api@freq-suspend.html
> 
>   * igt@i915_pm_freq_api@freq-suspend@gt0:
>     - shard-dg2:          [PASS][96] -> [INCOMPLETE][97] ([i915#13356] / [i915#13820]) +1 other test incomplete
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress:
>     - shard-dg1:          [PASS][98] -> [DMESG-WARN][99] ([i915#4423]) +1 other test dmesg-warn
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg1-15/igt@i915_pm_rpm@gem-execbuf-stress.html
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-18/igt@i915_pm_rpm@gem-execbuf-stress.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#14544] / [i915#17434] / [i915#17450])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#4387])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-glk:          NOTRUN -> [SKIP][102] ([i915#17584])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@i915_query@hwconfig_table.html
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#16109])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@i915_query@query-topology-known-pci-ids.html
> 
>   * igt@i915_query@query-topology-unsupported:
>     - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#16079])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@i915_query@query-topology-unsupported.html
> 
>   * igt@i915_query@test-query-geometry-subslices:
>     - shard-tglu-1:       NOTRUN -> [SKIP][105] ([i915#5723])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@i915_query@test-query-geometry-subslices.html
>     - shard-glk11:        NOTRUN -> [SKIP][106] ([i915#17673])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@i915_query@test-query-geometry-subslices.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][107] ([i915#4817] / [i915#7443])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-8/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@i915_suspend@fence-restore-untiled:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][108] ([i915#4817])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html
> 
>   * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
>     - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#4212]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-glk10:        NOTRUN -> [SKIP][110] ([i915#17668])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - shard-rkl:          [PASS][111] -> [INCOMPLETE][112] ([i915#12761]) +1 other test incomplete
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_async_flips@async-flip-suspend-resume.html
>     - shard-glk:          NOTRUN -> [INCOMPLETE][113] ([i915#12761] / [i915#13356]) +1 other test incomplete
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk2/igt@kms_async_flips@async-flip-suspend-resume.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#9531])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#14544] / [i915#1769] / [i915#3555])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>     - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#4538] / [i915#5286]) +1 other test skip
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
>     - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#17432] / [i915#5286]) +2 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#14544] / [i915#4538] / [i915#5286])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>     - shard-tglu-1:       NOTRUN -> [SKIP][119] ([i915#17432] / [i915#5286]) +2 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
>     - shard-glk11:        NOTRUN -> [SKIP][120] ([i915#17478]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>     - shard-glk10:        NOTRUN -> [SKIP][121] ([i915#17478])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>     - shard-glk11:        NOTRUN -> [SKIP][122] ([i915#17557])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
>     - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#5286])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-glk:          NOTRUN -> [SKIP][124] ([i915#17478]) +5 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#4538] / [i915#5286]) +4 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#17431]) +2 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-glk10:        NOTRUN -> [SKIP][127] ([i915#17500])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#3638]) +1 other test skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-glk11:        NOTRUN -> [SKIP][129] ([i915#17524])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
>     - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#3828])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:
>     - shard-mtlp:         [PASS][131] -> [FAIL][132] ([i915#15733] / [i915#5138])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-mtlp-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-mtlp-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-glk:          NOTRUN -> [SKIP][133] ([i915#17500]) +1 other test skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
>     - shard-glk11:        NOTRUN -> [SKIP][134] ([i915#17500]) +2 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#17431] / [i915#3638]) +2 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#4538]) +3 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>     - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#14544] / [i915#4538])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#17432])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][139] ([i915#17432]) +1 other test skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#4538]) +3 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#17432]) +4 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][142] ([i915#6095]) +19 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#14544] / [i915#6095]) +5 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
>     - shard-glk:          NOTRUN -> [SKIP][145] ([i915#17491]) +31 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#6095]) +99 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
>     - shard-glk:          NOTRUN -> [SKIP][147] ([i915#17490] / [i915#17491]) +11 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#6095]) +116 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-12/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#12313])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
>     - shard-glk11:        NOTRUN -> [SKIP][150] ([i915#17491]) +29 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][151] ([i915#17525]) +2 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#6095]) +39 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-glk11:        NOTRUN -> [SKIP][153] ([i915#17525])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#12805])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>     - shard-glk10:        NOTRUN -> [SKIP][155] ([i915#17490] / [i915#17491]) +7 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:
>     - shard-glk10:        NOTRUN -> [SKIP][156] ([i915#17491]) +19 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#6095]) +7 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#12313]) +1 other test skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#10307] / [i915#6095]) +148 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#14098] / [i915#6095]) +60 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#12313]) +1 other test skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
>     - shard-glk11:        NOTRUN -> [SKIP][162] ([i915#17490] / [i915#17491]) +11 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-rejected-max-dotclock:
>     - shard-tglu-1:       NOTRUN -> [SKIP][164] ([i915#17099])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_cdclk@mode-rejected-max-dotclock.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#3742])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio:
>     - shard-glk10:        NOTRUN -> [SKIP][166] ([i915#17483]) +3 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_chamelium_audio@hdmi-audio.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#11151] / [i915#14544])
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-glk10:        NOTRUN -> [SKIP][168] ([i915#17489])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-glk:          NOTRUN -> [SKIP][169] ([i915#17489])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk2/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
>     - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#16471] / [i915#17427])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:
>     - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#17427])
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:
>     - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#14544] / [i915#17427])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:
>     - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#17427])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
>     - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#17427]) +1 other test skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
>     - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#17427])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html
>     - shard-glk11:        NOTRUN -> [SKIP][176] ([i915#17497]) +1 other test skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
>     - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#16471] / [i915#17427]) +1 other test skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
>     - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#16471] / [i915#17427])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-2/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
>     - shard-glk:          NOTRUN -> [SKIP][179] ([i915#17497]) +1 other test skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
>     - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#16471] / [i915#17427]) +2 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
> 
>   * igt@kms_chamelium_edid@vga-edid-read:
>     - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#11151] / [i915#7828]) +2 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_chamelium_edid@vga-edid-read.html
> 
>   * igt@kms_chamelium_frames@hdmi-frame-dump:
>     - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-fast:
>     - shard-glk:          NOTRUN -> [SKIP][183] ([i915#17483]) +5 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk8/igt@kms_chamelium_hpd@dp-hpd-fast.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:
>     - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#11151])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html
>     - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#11151])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-2/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>     - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#11151] / [i915#7828]) +4 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm:
>     - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#11151] / [i915#7828]) +3 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
>     - shard-glk11:        NOTRUN -> [SKIP][188] ([i915#17483]) +1 other test skip
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#11151] / [i915#7828]) +3 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_color@ctm-0-75:
>     - shard-dg2:          [PASS][190] -> [SKIP][191] ([i915#12655] / [i915#17373]) +1 other test skip
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@kms_color@ctm-0-75.html
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_color@ctm-0-75.html
> 
>   * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-4:
>     - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#16990]) +15 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-4.html
> 
>   * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
>     - shard-dg2:          [PASS][193] -> [SKIP][194] ([i915#15529]) +1 other test skip
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html
> 
>   * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:
>     - shard-glk11:        NOTRUN -> [SKIP][195] ([i915#17510])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html
> 
>   * igt@kms_color_pipeline@plane-lut1d:
>     - shard-glk:          NOTRUN -> [SKIP][196] ([i915#17510])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk2/igt@kms_color_pipeline@plane-lut1d.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-c-plane-3:
>     - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#16990]) +15 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-c-plane-3.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:
>     - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#16990]) +7 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4:
>     - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#16990]) +11 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-2/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-glk10:        NOTRUN -> [SKIP][200] ([i915#17508])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@atomic-hdcp14:
>     - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#15865]) +4 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@kms_content_protection@atomic-hdcp14.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
>     - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#15330])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-glk11:        NOTRUN -> [SKIP][203] ([i915#17502])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_content_protection@dp-mst-type-1.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][204] ([i915#15330] / [i915#3116] / [i915#3299])
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@legacy-hdcp14:
>     - shard-glk:          NOTRUN -> [SKIP][205] ([i915#17508])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_content_protection@legacy-hdcp14.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#15865]) +1 other test skip
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@kms_content_protection@mei-interface.html
>     - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#15865])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-2/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-tglu-1:       NOTRUN -> [SKIP][208] ([i915#15865]) +1 other test skip
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-glk:          NOTRUN -> [SKIP][209] ([i915#17504]) +1 other test skip
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk2/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#13049]) +1 other test skip
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-glk:          NOTRUN -> [SKIP][211] ([i915#17533]) +1 other test skip
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#13049])
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [FAIL][213] ([i915#13566]) +1 other test fail
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-64x64:
>     - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#17356]) +3 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-64x64.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#13049]) +1 other test skip
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html
>     - shard-glk11:        NOTRUN -> [SKIP][216] ([i915#17533])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#3555]) +2 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-12/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
>     - shard-glk10:        NOTRUN -> [SKIP][218] ([i915#17504])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#3555]) +5 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-32x10.html
>     - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#3555]) +5 other tests skip
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-glk11:        NOTRUN -> [SKIP][221] ([i915#17504])
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#17428] / [i915#17454]) +4 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#4103])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
>     - shard-dg2:          [PASS][224] -> [SKIP][225] ([i915#11190] / [i915#17356]) +1 other test skip
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-tglu-1:       NOTRUN -> [SKIP][226] ([i915#17428] / [i915#17454]) +1 other test skip
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>     - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#9067])
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-glk:          NOTRUN -> [SKIP][228] ([i915#17457]) +1 other test skip
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#4103])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#3555] / [i915#3804])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>     - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#1769] / [i915#3555] / [i915#3804])
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#3804])
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#3804])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-glk:          NOTRUN -> [SKIP][234] ([i915#17560])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk2/igt@kms_dp_link_training@non-uhbr-mst.html
>     - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#17289])
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
>     - shard-glk:          NOTRUN -> [SKIP][236] ([i915#17531])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-glk:          NOTRUN -> [SKIP][237] ([i915#17477])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk8/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dp_link_training@uhbr-mst-direct-train:
>     - shard-tglu-1:       NOTRUN -> [SKIP][238] ([i915#17285])
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_dp_link_training@uhbr-mst-direct-train.html
> 
>   * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
>     - shard-glk10:        NOTRUN -> [SKIP][239] ([i915#17477]) +1 other test skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#13748] / [i915#14544])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_dp_link_training@uhbr-sst-direct-train:
>     - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#17285])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_dp_link_training@uhbr-sst-direct-train.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#8812])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-gtt.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#16361]) +2 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-12/igt@kms_dsc@dsc-basic.html
>     - shard-glk10:        NOTRUN -> [SKIP][244] ([i915#17458])
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
>     - shard-glk:          NOTRUN -> [SKIP][245] ([i915#17458]) +1 other test skip
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
>     - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#14544] / [i915#16361])
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
>     - shard-tglu-1:       NOTRUN -> [SKIP][247] ([i915#16361])
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#16361])
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>     - shard-glk11:        NOTRUN -> [SKIP][249] ([i915#17458])
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
>     - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#16361]) +1 other test skip
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-8/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][251] ([i915#13356] / [i915#9878])
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#16680])
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@kms_fbcon_fbt@psr.html
>     - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#16680])
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-2/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-glk:          NOTRUN -> [SKIP][254] ([i915#17516])
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#16081])
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@kms_feature_discovery@display-3x.html
>     - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#16081])
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-2/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-glk11:        NOTRUN -> [SKIP][257] ([i915#17570])
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_feature_discovery@dp-mst.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][258] ([i915#16599])
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@dsc:
>     - shard-glk10:        NOTRUN -> [SKIP][259] ([i915#17539])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_feature_discovery@dsc.html
> 
>   * igt@kms_feature_discovery@hdr:
>     - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#16600])
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_feature_discovery@hdr.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-glk:          NOTRUN -> [SKIP][261] ([i915#17707])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#658])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_feature_discovery@vrr:
>     - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#16600]) +1 other test skip
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_feature_discovery@vrr.html
> 
>   * igt@kms_fence_pin_leak:
>     - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#4881])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@kms_fence_pin_leak.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>     - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#3637] / [i915#9934]) +4 other tests skip
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>     - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#14544] / [i915#9934])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#9934])
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#8381])
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][269] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk8/igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][270] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183])
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk8/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#9934]) +2 other tests skip
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>     - shard-tglu-1:       NOTRUN -> [SKIP][272] ([i915#3637] / [i915#9934]) +2 other tests skip
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#9934]) +11 other tests skip
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-2/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][274] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][275] ([i915#12745] / [i915#13356] / [i915#17183])
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race-interruptible:
>     - shard-dg2:          [PASS][276] -> [SKIP][277] ([i915#5354]) +2 other tests skip
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#5354])
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
>     - shard-glk:          NOTRUN -> [SKIP][279] ([i915#17522]) +5 other tests skip
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
>     - shard-dg2:          [PASS][280] -> [SKIP][281] ([i915#3555] / [i915#8813]) +3 other tests skip
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#15643])
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#15643]) +2 other tests skip
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
>     - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#15643])
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-glk11:        NOTRUN -> [SKIP][285] ([i915#17522]) +1 other test skip
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>     - shard-glk:          NOTRUN -> [SKIP][286] ([i915#17484]) +2 other tests skip
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#14544] / [i915#15643])
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-valid-mode:
>     - shard-glk10:        NOTRUN -> [SKIP][288] ([i915#17522]) +1 other test skip
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-tglu-1:       NOTRUN -> [SKIP][289] ([i915#15643]) +1 other test skip
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>     - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#15643]) +2 other tests skip
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
>     - shard-glk10:        NOTRUN -> [SKIP][291] ([i915#17484])
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
>     - shard-glk11:        NOTRUN -> [SKIP][292] ([i915#17484])
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - shard-glk10:        NOTRUN -> [SKIP][293] ([i915#17465])
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite:
>     - shard-dg2:          [PASS][294] -> [SKIP][295] ([i915#16708]) +1 other test skip
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite.html
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
>     - shard-dg2:          [PASS][296] -> [SKIP][297] ([i915#16708] / [i915#5354]) +4 other tests skip
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#17428] / [i915#1825]) +6 other tests skip
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#16708] / [i915#5354]) +2 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#17428]) +50 other tests skip
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-glk10:        NOTRUN -> [SKIP][301] ([i915#17559])
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
>     - shard-tglu-1:       NOTRUN -> [SKIP][302] ([i915#15989]) +8 other tests skip
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move:
>     - shard-glk:          [PASS][303] -> [SKIP][304] ([i915#17517]) +3 other tests skip
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move.html
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite:
>     - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#17428]) +59 other tests skip
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
>     - shard-rkl:          [PASS][306] -> [SKIP][307] ([i915#15989]) +15 other tests skip
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#15990] / [i915#8708]) +16 other tests skip
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#14544] / [i915#17428] / [i915#1825]) +1 other test skip
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#15102]) +24 other tests skip
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-glk:          NOTRUN -> [SKIP][311] ([i915#17559])
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#15990])
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-indfb-fliptrack-mmap-gtt:
>     - shard-glk10:        NOTRUN -> [SKIP][313] ([i915#17482]) +33 other tests skip
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-indfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#15991])
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
>     - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#14544] / [i915#5439])
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#15989]) +18 other tests skip
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-mmap-gtt:
>     - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#15989]) +14 other tests skip
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-glk:          NOTRUN -> [SKIP][318] ([i915#17517]) +20 other tests skip
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-2p-rte:
>     - shard-tglu-1:       NOTRUN -> [SKIP][319] ([i915#17428]) +31 other tests skip
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-2p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#15990]) +21 other tests skip
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-modesetfrombusy:
>     - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#15989]) +11 other tests skip
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-modesetfrombusy.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#9766])
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-12/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
>     - shard-glk10:        NOTRUN -> [SKIP][323] ([i915#17534])
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
>     - shard-tglu:         NOTRUN -> [SKIP][324] ([i915#15102]) +26 other tests skip
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#15104] / [i915#15990]) +2 other tests skip
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#15102]) +30 other tests skip
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-rte:
>     - shard-rkl:          NOTRUN -> [SKIP][327] ([i915#14544] / [i915#15102]) +6 other tests skip
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#15990] / [i915#8708])
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-tglu-1:       NOTRUN -> [SKIP][329] ([i915#15102]) +13 other tests skip
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-cpu:
>     - shard-tglu:         NOTRUN -> [SKIP][330] ([i915#17428]) +46 other tests skip
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render:
>     - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#16708]) +3 other tests skip
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render:
>     - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#14544] / [i915#17428]) +17 other tests skip
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-move:
>     - shard-glk:          NOTRUN -> [SKIP][333] ([i915#17482]) +54 other tests skip
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-mmap-gtt:
>     - shard-glk11:        NOTRUN -> [SKIP][334] ([i915#17482]) +29 other tests skip
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-mmap-gtt.html
> 
>   * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][335] ([i915#13356])
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
>     - shard-dg2:          [PASS][336] -> [SKIP][337] ([i915#17357])
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-rkl:          [PASS][338] -> [SKIP][339] ([i915#16644] / [i915#3555] / [i915#8228])
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_hdr@bpc-switch.html
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_hdr@bpc-switch.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][340] ([i915#3555] / [i915#8228]) +1 other test skip
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#3555] / [i915#8228]) +1 other test skip
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-glk:          NOTRUN -> [SKIP][342] ([i915#17498])
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-glk11:        NOTRUN -> [SKIP][343] ([i915#17498])
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#16644] / [i915#3555] / [i915#8228])
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-2/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_invalid_mode@bad-vsync-end:
>     - shard-dg2:          [PASS][345] -> [SKIP][346] ([i915#16746] / [i915#3555])
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-3/igt@kms_invalid_mode@bad-vsync-end.html
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_invalid_mode@bad-vsync-end.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#15460])
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@kms_joiner@basic-big-joiner.html
>     - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#15460])
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-2/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-rkl:          NOTRUN -> [SKIP][349] ([i915#15458])
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-2/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#13688] / [i915#14544])
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#15459])
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>     - shard-glk10:        NOTRUN -> [SKIP][352] ([i915#17678])
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-dg1:          NOTRUN -> [SKIP][353] ([i915#15638] / [i915#15722])
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#14544] / [i915#15815])
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][355] ([i915#6301])
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
>     - shard-glk:          NOTRUN -> [SKIP][356] ([i915#17540]) +1 other test skip
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
> 
>   * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
>     - shard-glk10:        NOTRUN -> [SKIP][357] ([i915#17540])
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
>     - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#14712])
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-untiled:
>     - shard-glk:          NOTRUN -> [DMESG-FAIL][359] ([i915#118])
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
>     - shard-glk11:        NOTRUN -> [SKIP][360] ([i915#17479]) +1 other test skip
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
>     - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#16386]) +5 other tests skip
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
>     - shard-rkl:          NOTRUN -> [SKIP][362] ([i915#15709]) +4 other tests skip
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][363] ([i915#15709])
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
>     - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#15709]) +1 other test skip
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
>     - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#15709]) +1 other test skip
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-7:
>     - shard-tglu:         NOTRUN -> [SKIP][366] ([i915#16386]) +1 other test skip
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-7.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
>     - shard-dg1:          NOTRUN -> [SKIP][367] ([i915#16386]) +1 other test skip
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html
> 
>   * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
>     - shard-dg2:          NOTRUN -> [SKIP][368] ([i915#16112])
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-8/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
> 
>   * igt@kms_plane_alpha_blend@alpha-transparent-fb:
>     - shard-glk11:        NOTRUN -> [FAIL][369] ([i915#10647] / [i915#12177])
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
> 
>   * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
>     - shard-glk11:        NOTRUN -> [FAIL][370] ([i915#10647]) +1 other test fail
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-max:
>     - shard-glk:          NOTRUN -> [FAIL][371] ([i915#10647] / [i915#12169])
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk8/igt@kms_plane_alpha_blend@constant-alpha-max.html
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [FAIL][372] ([i915#10647]) +1 other test fail
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk8/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-tglu-1:       NOTRUN -> [SKIP][373] ([i915#13958])
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-dg1:          NOTRUN -> [SKIP][374] ([i915#13958])
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_scaling@invalid-parameters:
>     - shard-dg2:          [PASS][375] -> [SKIP][376] ([i915#17356] / [i915#9423])
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@kms_plane_scaling@invalid-parameters.html
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_plane_scaling@invalid-parameters.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
>     - shard-dg2:          [PASS][377] -> [SKIP][378] ([i915#15329] / [i915#17356] / [i915#9423]) +1 other test skip
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
>     - shard-rkl:          NOTRUN -> [SKIP][379] ([i915#15329]) +3 other tests skip
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][380] ([i915#15329]) +4 other tests skip
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
>     - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#15329]) +4 other tests skip
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d:
>     - shard-dg2:          [PASS][382] -> [SKIP][383] ([i915#15329] / [i915#17356]) +2 other tests skip
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d.html
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20:
>     - shard-dg2:          [PASS][384] -> [SKIP][385] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423])
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-20x20.html
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20@pipe-b:
>     - shard-dg2:          [PASS][386] -> [SKIP][387] ([i915#15329]) +8 other tests skip
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-dg1:          NOTRUN -> [SKIP][388] ([i915#12343])
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_dc@dc5-dpms-suspend-resume:
>     - shard-glk:          [PASS][389] -> [INCOMPLETE][390] ([i915#13356] / [i915#16938])
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-glk1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk8/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
> 
>   * igt@kms_pm_dc@dc5-pageflip-negative:
>     - shard-rkl:          NOTRUN -> [SKIP][391] ([i915#9685])
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@kms_pm_dc@dc5-pageflip-negative.html
>     - shard-glk11:        NOTRUN -> [SKIP][392] ([i915#17495])
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_pm_dc@dc5-pageflip-negative.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-glk:          NOTRUN -> [SKIP][393] ([i915#17564])
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk2/igt@kms_pm_dc@dc5-psr.html
>     - shard-tglu:         NOTRUN -> [SKIP][394] ([i915#15948])
>    [394]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-8/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc5-psr-suspend-resume:
>     - shard-glk:          NOTRUN -> [SKIP][395] ([i915#17495])
>    [395]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_pm_dc@dc5-psr-suspend-resume.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#3828]) +1 other test skip
>    [396]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-tglu-1:       NOTRUN -> [SKIP][397] ([i915#15948])
>    [397]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html
>     - shard-glk11:        NOTRUN -> [SKIP][398] ([i915#17564])
>    [398]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-rkl:          NOTRUN -> [SKIP][399] ([i915#15073])
>    [399]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-dg2:          [PASS][400] -> [SKIP][401] ([i915#15073]) +1 other test skip
>    [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [401]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
>     - shard-rkl:          NOTRUN -> [SKIP][402] ([i915#14544] / [i915#15073])
>    [402]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-rkl:          [PASS][403] -> [SKIP][404] ([i915#15073]) +2 other tests skip
>    [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [404]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>     - shard-dg1:          NOTRUN -> [SKIP][405] ([i915#15073]) +1 other test skip
>    [405]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-tglu:         NOTRUN -> [SKIP][406] ([i915#15073]) +1 other test skip
>    [406]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_pm_rpm@modeset-pc8-residency-stress:
>     - shard-tglu:         NOTRUN -> [SKIP][407] ([i915#17434] / [i915#17450])
>    [407]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_pm_rpm@modeset-pc8-residency-stress.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-glk:          NOTRUN -> [SKIP][408] ([i915#17569])
>    [408]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_prime@basic-modeset-hybrid.html
> 
>   * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>     - shard-rkl:          NOTRUN -> [SKIP][409] ([i915#11520] / [i915#14544]) +1 other test skip
>    [409]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>     - shard-rkl:          NOTRUN -> [SKIP][410] ([i915#11520]) +10 other tests skip
>    [410]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][411] ([i915#11520]) +4 other tests skip
>    [411]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
>     - shard-tglu-1:       NOTRUN -> [SKIP][412] ([i915#11520]) +1 other test skip
>    [412]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
>     - shard-glk:          NOTRUN -> [SKIP][413] ([i915#11520]) +4 other tests skip
>    [413]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>     - shard-glk11:        NOTRUN -> [SKIP][414] ([i915#11520]) +2 other tests skip
>    [414]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
>     - shard-glk10:        NOTRUN -> [SKIP][415] ([i915#11520]) +3 other tests skip
>    [415]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>     - shard-dg1:          NOTRUN -> [SKIP][416] ([i915#11520]) +6 other tests skip
>    [416]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-glk:          NOTRUN -> [SKIP][417] ([i915#17546])
>    [417]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>     - shard-tglu:         NOTRUN -> [SKIP][418] ([i915#9683])
>    [418]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-glk11:        NOTRUN -> [SKIP][419] ([i915#17546])
>    [419]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_psr2_su@page_flip-p010.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][420] ([i915#9683])
>    [420]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>     - shard-rkl:          NOTRUN -> [SKIP][421] ([i915#1072] / [i915#9732]) +15 other tests skip
>    [421]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][422] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
>    [422]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html
> 
>   * igt@kms_psr@pr-basic:
>     - shard-glk:          NOTRUN -> [SKIP][423] ([i915#17480]) +8 other tests skip
>    [423]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_psr@pr-basic.html
> 
>   * igt@kms_psr@pr-cursor-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][424] ([i915#1072] / [i915#9732]) +17 other tests skip
>    [424]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@kms_psr@pr-cursor-mmap-cpu.html
> 
>   * igt@kms_psr@pr-sprite-mmap-cpu:
>     - shard-tglu:         NOTRUN -> [SKIP][425] ([i915#9732]) +13 other tests skip
>    [425]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-8/igt@kms_psr@pr-sprite-mmap-cpu.html
> 
>   * igt@kms_psr@psr-basic:
>     - shard-glk10:        NOTRUN -> [SKIP][426] ([i915#17480]) +5 other tests skip
>    [426]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_psr@psr-basic.html
> 
>   * igt@kms_psr@psr-primary-mmap-gtt:
>     - shard-glk:          NOTRUN -> [SKIP][427] ([i915#17480] / [i915#9732])
>    [427]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@kms_psr@psr-primary-mmap-gtt.html
> 
>   * igt@kms_psr@psr2-primary-page-flip:
>     - shard-glk11:        NOTRUN -> [SKIP][428] ([i915#17480]) +4 other tests skip
>    [428]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_psr@psr2-primary-page-flip.html
> 
>   * igt@kms_psr@psr2-sprite-mmap-gtt:
>     - shard-tglu-1:       NOTRUN -> [SKIP][429] ([i915#9732]) +5 other tests skip
>    [429]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-gtt.html
> 
>   * igt@kms_psr@psr2-suspend@edp-1:
>     - shard-mtlp:         [PASS][430] -> [FAIL][431] ([i915#17226]) +1 other test fail
>    [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-mtlp-8/igt@kms_psr@psr2-suspend@edp-1.html
>    [431]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-mtlp-8/igt@kms_psr@psr2-suspend@edp-1.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - shard-tglu:         NOTRUN -> [SKIP][432] ([i915#5289])
>    [432]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-rkl:          NOTRUN -> [SKIP][433] ([i915#5289])
>    [433]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][434] ([i915#5289])
>    [434]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
>     - shard-glk10:        NOTRUN -> [SKIP][435] ([i915#17488]) +1 other test skip
>    [435]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-glk:          NOTRUN -> [SKIP][436] ([i915#17488])
>    [436]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-tglu:         NOTRUN -> [SKIP][437] ([i915#17432] / [i915#5289])
>    [437]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg1:          NOTRUN -> [SKIP][438] ([i915#17432] / [i915#5289])
>    [438]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-tglu-1:       NOTRUN -> [SKIP][439] ([i915#3555])
>    [439]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-center.html
>     - shard-glk11:        NOTRUN -> [SKIP][440] ([i915#17501])
>    [440]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk11/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_selftest@drm_framebuffer:
>     - shard-dg1:          NOTRUN -> [ABORT][441] ([i915#13179] / [i915#16508]) +1 other test abort
>    [441]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-12/igt@kms_selftest@drm_framebuffer.html
>     - shard-glk10:        NOTRUN -> [ABORT][442] ([i915#13179]) +1 other test abort
>    [442]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@kms_selftest@drm_framebuffer.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-tglu:         NOTRUN -> [SKIP][443] ([i915#8623])
>    [443]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vblank@query-idle:
>     - shard-dg2:          [PASS][444] -> [SKIP][445] ([i915#17356]) +37 other tests skip
>    [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@kms_vblank@query-idle.html
>    [445]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_vblank@query-idle.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-rkl:          [PASS][446] -> [INCOMPLETE][447] ([i915#12276])
>    [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-8/igt@kms_vblank@ts-continuation-suspend.html
>    [447]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-3/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][448] ([i915#12276])
>    [448]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-3/igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-rkl:          NOTRUN -> [SKIP][449] ([i915#15243] / [i915#3555])
>    [449]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-2/igt@kms_vrr@flip-basic.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-glk:          NOTRUN -> [SKIP][450] ([i915#17520])
>    [450]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk8/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@perf@unprivileged-single-ctx-counters:
>     - shard-glk:          NOTRUN -> [SKIP][451] ([i915#17704])
>    [451]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk6/igt@perf@unprivileged-single-ctx-counters.html
> 
>   * igt@perf_pmu@rc6-all-gts:
>     - shard-tglu:         NOTRUN -> [SKIP][452] ([i915#8516])
>    [452]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-2/igt@perf_pmu@rc6-all-gts.html
>     - shard-glk10:        NOTRUN -> [SKIP][453] ([i915#17583])
>    [453]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@perf_pmu@rc6-all-gts.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-dg1:          NOTRUN -> [SKIP][454] ([i915#8516])
>    [454]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@prime_udl@share-import:
>     - shard-dg1:          NOTRUN -> [SKIP][455] ([i915#16420])
>    [455]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@prime_udl@share-import.html
> 
>   * igt@prime_udl@share-import-addfb:
>     - shard-glk:          NOTRUN -> [SKIP][456] ([i915#16420])
>    [456]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk2/igt@prime_udl@share-import-addfb.html
>     - shard-tglu:         NOTRUN -> [SKIP][457] ([i915#16420])
>    [457]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-8/igt@prime_udl@share-import-addfb.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - shard-dg1:          NOTRUN -> [SKIP][458] ([i915#3708]) +1 other test skip
>    [458]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-14/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-read:
>     - shard-rkl:          NOTRUN -> [SKIP][459] ([i915#14544] / [i915#17448] / [i915#3291] / [i915#3708])
>    [459]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-glk10:        NOTRUN -> [SKIP][460] ([i915#17467])
>    [460]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk10/igt@prime_vgem@coherency-gtt.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-tglu-1:       NOTRUN -> [SKIP][461] ([i915#17448])
>    [461]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-1/igt@prime_vgem@fence-flip-hang.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_read@short-buffer-block:
>     - shard-dg2:          [SKIP][462] ([i915#17359]) -> [PASS][463]
>    [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@drm_read@short-buffer-block.html
>    [463]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@drm_read@short-buffer-block.html
> 
>   * igt@fbdev@unaligned-read:
>     - shard-dg2:          [SKIP][464] ([i915#2582]) -> [PASS][465]
>    [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@fbdev@unaligned-read.html
>    [465]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-3/igt@fbdev@unaligned-read.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
>     - shard-dg2:          [SKIP][466] ([i915#17356]) -> [PASS][467] +71 other tests pass
>    [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
>    [467]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
> 
>   * igt@kms_color@background-color:
>     - shard-dg2:          [SKIP][468] ([i915#17373]) -> [PASS][469]
>    [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_color@background-color.html
>    [469]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-1/igt@kms_color@background-color.html
> 
>   * igt@kms_color@degamma:
>     - shard-dg2:          [SKIP][470] ([i915#12655] / [i915#17373]) -> [PASS][471] +2 other tests pass
>    [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_color@degamma.html
>    [471]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-8/igt@kms_color@degamma.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-ctm3x4:
>     - shard-dg2:          [SKIP][472] ([i915#15529]) -> [PASS][473] +2 other tests pass
>    [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html
>    [473]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html
> 
>   * igt@kms_cursor_crc@cursor-random-128x42:
>     - shard-rkl:          [FAIL][474] ([i915#13566]) -> [PASS][475]
>    [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x42.html
>    [475]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@kms_cursor_crc@cursor-random-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
>     - shard-tglu:         [FAIL][476] ([i915#13566]) -> [PASS][477] +1 other test pass
>    [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-tglu-10/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
>    [477]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-tglu-5/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-rkl:          [INCOMPLETE][478] ([i915#12358] / [i915#14152]) -> [PASS][479]
>    [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend.html
>    [479]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-2/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
>     - shard-dg2:          [SKIP][480] ([i915#11190] / [i915#17356]) -> [PASS][481] +4 other tests pass
>    [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
>    [481]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-3/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-dg2:          [SKIP][482] ([i915#1849]) -> [PASS][483]
>    [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_fbcon_fbt@fbc-suspend.html
>    [483]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-1/igt@kms_fbcon_fbt@fbc-suspend.html
>     - shard-rkl:          [INCOMPLETE][484] ([i915#9878]) -> [PASS][485]
>    [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html
>    [485]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2:          [SKIP][486] ([i915#5354]) -> [PASS][487] +12 other tests pass
>    [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_flip@flip-vs-suspend.html
>    [487]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-8/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
>     - shard-dg2:          [SKIP][488] ([i915#3555] / [i915#8813]) -> [PASS][489] +5 other tests pass
>    [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
>    [489]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
>     - shard-dg2:          [SKIP][490] ([i915#16708]) -> [PASS][491] +1 other test pass
>    [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
>    [491]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
>     - shard-dg2:          [SKIP][492] ([i915#16708] / [i915#5354]) -> [PASS][493] +9 other tests pass
>    [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
>    [493]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-rkl:          [INCOMPLETE][494] ([i915#10056]) -> [PASS][495]
>    [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [495]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render:
>     - shard-glk:          [SKIP][496] ([i915#17517]) -> [PASS][497] +16 other tests pass
>    [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-glk2/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render.html
>    [497]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:
>     - shard-rkl:          [SKIP][498] ([i915#15989]) -> [PASS][499] +6 other tests pass
>    [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html
>    [499]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html
> 
>   * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
>     - shard-dg2:          [SKIP][500] ([i915#17357]) -> [PASS][501] +1 other test pass
>    [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
>    [501]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
> 
>   * igt@kms_invalid_mode@bad-hsync-end:
>     - shard-dg2:          [SKIP][502] ([i915#16746] / [i915#3555]) -> [PASS][503] +3 other tests pass
>    [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_invalid_mode@bad-hsync-end.html
>    [503]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_invalid_mode@bad-hsync-end.html
> 
>   * igt@kms_invalid_mode@overflow-vrefresh:
>     - shard-dg2:          [SKIP][504] ([i915#16746]) -> [PASS][505]
>    [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_invalid_mode@overflow-vrefresh.html
>    [505]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_invalid_mode@overflow-vrefresh.html
> 
>   * igt@kms_plane@plane-panning-top-left:
>     - shard-dg2:          [SKIP][506] ([i915#8825]) -> [PASS][507] +4 other tests pass
>    [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_plane@plane-panning-top-left.html
>    [507]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-1/igt@kms_plane@plane-panning-top-left.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
>     - shard-dg2:          [SKIP][508] ([i915#15329] / [i915#17356] / [i915#9423]) -> [PASS][509] +3 other tests pass
>    [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
>    [509]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:
>     - shard-dg2:          [SKIP][510] ([i915#15329] / [i915#17356]) -> [PASS][511] +6 other tests pass
>    [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html
>    [511]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-1/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
>     - shard-dg2:          [SKIP][512] ([i915#15329]) -> [PASS][513] +20 other tests pass
>    [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
>    [513]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>     - shard-dg2:          [SKIP][514] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423]) -> [PASS][515] +1 other test pass
>    [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
>    [515]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
>     - shard-dg2:          [SKIP][516] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#6953] / [i915#9423]) -> [PASS][517]
>    [516]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
>    [517]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
> 
>   * igt@kms_pm_dc@dc5-dpms-negative:
>     - shard-dg2:          [SKIP][518] ([i915#13441]) -> [PASS][519]
>    [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html
>    [519]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-8/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>   * igt@kms_pm_rpm@drm-resources-equal:
>     - shard-dg2:          [SKIP][520] ([i915#17446] / [i915#3547]) -> [PASS][521] +1 other test pass
>    [520]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_pm_rpm@drm-resources-equal.html
>    [521]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_pm_rpm@drm-resources-equal.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-dg1:          [SKIP][522] ([i915#15073]) -> [PASS][523] +1 other test pass
>    [522]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [523]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-dg2:          [SKIP][524] ([i915#15073]) -> [PASS][525] +1 other test pass
>    [524]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [525]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_properties@colorop-properties-legacy:
>     - shard-dg2:          [SKIP][526] ([i915#15347]) -> [PASS][527]
>    [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_properties@colorop-properties-legacy.html
>    [527]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_properties@colorop-properties-legacy.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          [FAIL][528] ([i915#4349]) -> [PASS][529] +4 other tests pass
>    [528]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-4/igt@perf_pmu@busy-double-start@vecs1.html
>    [529]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@rc6-suspend:
>     - shard-rkl:          [INCOMPLETE][530] ([i915#13520]) -> [PASS][531]
>    [530]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-3/igt@perf_pmu@rc6-suspend.html
>    [531]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-2/igt@perf_pmu@rc6-suspend.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_ccs@block-copy-compressed:
>     - shard-rkl:          [SKIP][532] ([i915#3555] / [i915#9323]) -> [SKIP][533] ([i915#14544] / [i915#3555] / [i915#9323])
>    [532]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html
>    [533]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-rkl:          [SKIP][534] ([i915#8562]) -> [SKIP][535] ([i915#14544] / [i915#8562])
>    [534]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@gem_create@create-ext-set-pat.html
>    [535]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-rkl:          [SKIP][536] ([i915#14544] / [i915#280]) -> [SKIP][537] ([i915#280]) +1 other test skip
>    [536]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html
>    [537]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_exec_balancer@parallel-bb-first:
>     - shard-rkl:          [SKIP][538] ([i915#4525]) -> [SKIP][539] ([i915#14544] / [i915#4525])
>    [538]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@gem_exec_balancer@parallel-bb-first.html
>    [539]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-rkl:          [SKIP][540] ([i915#14544] / [i915#4525]) -> [SKIP][541] ([i915#4525])
>    [540]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html
>    [541]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>     - shard-rkl:          [SKIP][542] ([i915#14544] / [i915#3711]) -> [SKIP][543] ([i915#3711])
>    [542]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
>    [543]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> 
>   * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>     - shard-rkl:          [SKIP][544] ([i915#14544] / [i915#3281]) -> [SKIP][545] ([i915#3281]) +4 other tests skip
>    [544]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
>    [545]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-write-read-noreloc:
>     - shard-rkl:          [SKIP][546] ([i915#3281]) -> [SKIP][547] ([i915#14544] / [i915#3281]) +3 other tests skip
>    [546]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html
>    [547]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random:
>     - shard-rkl:          [SKIP][548] ([i915#4613]) -> [SKIP][549] ([i915#14544] / [i915#4613]) +1 other test skip
>    [548]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random.html
>    [549]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html
> 
>   * igt@gem_lmem_swapping@verify-ccs:
>     - shard-rkl:          [SKIP][550] ([i915#14544] / [i915#4613]) -> [SKIP][551] ([i915#4613]) +2 other tests skip
>    [550]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html
>    [551]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@gem_lmem_swapping@verify-ccs.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads:
>     - shard-rkl:          [SKIP][552] ([i915#3282]) -> [SKIP][553] ([i915#14544] / [i915#3282]) +2 other tests skip
>    [552]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html
>    [553]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-rkl:          [SKIP][554] ([i915#14544] / [i915#3282]) -> [SKIP][555] ([i915#3282])
>    [554]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html
>    [555]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@hw-rejects-pxp-context:
>     - shard-rkl:          [SKIP][556] ([i915#13717]) -> [SKIP][557] ([i915#13717] / [i915#14544])
>    [556]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-context.html
>    [557]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html
> 
>   * igt@gem_userptr_blits@readonly-pwrite-unsync:
>     - shard-rkl:          [SKIP][558] ([i915#14544] / [i915#3297]) -> [SKIP][559] ([i915#3297]) +1 other test skip
>    [558]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html
>    [559]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>   * igt@gen3_render_tiledy_blits:
>     - shard-rkl:          [SKIP][560] ([i915#14544] / [i915#17455]) -> [SKIP][561] ([i915#17455]) +1 other test skip
>    [560]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@gen3_render_tiledy_blits.html
>    [561]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@gen3_render_tiledy_blits.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-rkl:          [SKIP][562] ([i915#14544] / [i915#2527]) -> [SKIP][563] ([i915#2527]) +2 other tests skip
>    [562]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html
>    [563]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-rkl:          [SKIP][564] ([i915#14544] / [i915#16109]) -> [SKIP][565] ([i915#16109])
>    [564]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@i915_query@query-topology-known-pci-ids.html
>    [565]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@i915_query@query-topology-known-pci-ids.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-dg2:          [SKIP][566] ([i915#17356]) -> [SKIP][567] ([i915#1769] / [i915#3555])
>    [566]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>    [567]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-dg2:          [SKIP][568] ([i915#17431]) -> [SKIP][569] ([i915#17356]) +1 other test skip
>    [568]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>    [569]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-rkl:          [SKIP][570] ([i915#14544] / [i915#5286]) -> [SKIP][571] ([i915#5286])
>    [570]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html
>    [571]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-rkl:          [SKIP][572] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][573] ([i915#4538] / [i915#5286]) +1 other test skip
>    [572]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [573]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-rkl:          [SKIP][574] ([i915#4538] / [i915#5286]) -> [SKIP][575] ([i915#14544] / [i915#4538] / [i915#5286]) +2 other tests skip
>    [574]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [575]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-dg2:          [SKIP][576] ([i915#17356]) -> [SKIP][577] ([i915#17431]) +3 other tests skip
>    [576]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_big_fb@linear-16bpp-rotate-90.html
>    [577]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>     - shard-dg2:          [SKIP][578] ([i915#17356] / [i915#5190]) -> [SKIP][579] ([i915#4538] / [i915#5190]) +12 other tests skip
>    [578]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
>    [579]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2:          [SKIP][580] ([i915#5190]) -> [SKIP][581] ([i915#17356] / [i915#5190])
>    [580]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-3/igt@kms_big_fb@y-tiled-addfb.html
>    [581]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-dg2:          [SKIP][582] ([i915#4538] / [i915#5190]) -> [SKIP][583] ([i915#17356] / [i915#5190]) +8 other tests skip
>    [582]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [583]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-rkl:          [SKIP][584] ([i915#14544] / [i915#17432]) -> [SKIP][585] ([i915#17432])
>    [584]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [585]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-rkl:          [SKIP][586] ([i915#4538]) -> [SKIP][587] ([i915#14544] / [i915#4538]) +1 other test skip
>    [586]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [587]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
>     - shard-rkl:          [SKIP][588] ([i915#14098] / [i915#6095]) -> [SKIP][589] ([i915#14098] / [i915#14544] / [i915#6095])
>    [588]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
>    [589]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-rkl:          [SKIP][590] ([i915#12313]) -> [SKIP][591] ([i915#12313] / [i915#14544]) +1 other test skip
>    [590]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>    [591]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-dg2:          [SKIP][592] ([i915#17356]) -> [SKIP][593] ([i915#10307] / [i915#6095]) +14 other tests skip
>    [592]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
>    [593]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>     - shard-dg2:          [SKIP][594] ([i915#17356]) -> [SKIP][595] ([i915#12313]) +3 other tests skip
>    [594]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
>    [595]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-rkl:          [SKIP][596] ([i915#12313] / [i915#14544]) -> [SKIP][597] ([i915#12313]) +1 other test skip
>    [596]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
>    [597]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
>     - shard-dg2:          [SKIP][598] ([i915#10307] / [i915#6095]) -> [SKIP][599] ([i915#17356]) +5 other tests skip
>    [598]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
>    [599]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>     - shard-rkl:          [SKIP][600] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][601] ([i915#14098] / [i915#6095]) +2 other tests skip
>    [600]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
>    [601]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
>     - shard-glk:          [INCOMPLETE][602] ([i915#13356] / [i915#15582]) -> [INCOMPLETE][603] ([i915#13356] / [i915#14694] / [i915#15582]) +1 other test incomplete
>    [602]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-glk4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
>    [603]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - shard-dg2:          [SKIP][604] ([i915#12313]) -> [SKIP][605] ([i915#17356]) +1 other test skip
>    [604]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
>    [605]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>   * igt@kms_cdclk@mode-rejected-max-dotclock:
>     - shard-rkl:          [SKIP][606] ([i915#14544] / [i915#17099]) -> [SKIP][607] ([i915#17099])
>    [606]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_cdclk@mode-rejected-max-dotclock.html
>    [607]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_cdclk@mode-rejected-max-dotclock.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2:          [SKIP][608] ([i915#16017]) -> [SKIP][609] ([i915#17356])
>    [608]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@kms_cdclk@mode-transition-all-outputs.html
>    [609]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-rkl:          [SKIP][610] ([i915#14544] / [i915#17427]) -> [SKIP][611] ([i915#17427])
>    [610]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_chamelium_color@ctm-0-75.html
>    [611]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-rkl:          [SKIP][612] ([i915#17427]) -> [SKIP][613] ([i915#14544] / [i915#17427]) +2 other tests skip
>    [612]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-5/igt@kms_chamelium_color@degamma.html
>    [613]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
>     - shard-rkl:          [SKIP][614] ([i915#14544] / [i915#16471] / [i915#17427]) -> [SKIP][615] ([i915#16471] / [i915#17427])
>    [614]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html
>    [615]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-rkl:          [SKIP][616] ([i915#11151] / [i915#7828]) -> [SKIP][617] ([i915#11151] / [i915#14544] / [i915#7828]) +3 other tests skip
>    [616]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-read.html
>    [617]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
>     - shard-rkl:          [SKIP][618] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][619] ([i915#11151] / [i915#7828]) +4 other tests skip
>    [618]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
>    [619]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>     - shard-dg1:          [SKIP][620] ([i915#11151] / [i915#7828]) -> [SKIP][621] ([i915#11151] / [i915#4423] / [i915#7828])
>    [620]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
>    [621]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2:          [SKIP][622] ([i915#17356]) -> [SKIP][623] ([i915#15330] / [i915#3299])
>    [622]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-0.html
>    [623]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2:          [SKIP][624] ([i915#15330] / [i915#3299]) -> [SKIP][625] ([i915#17356])
>    [624]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-3/igt@kms_content_protection@dp-mst-type-0.html
>    [625]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
>     - shard-dg2:          [SKIP][626] ([i915#17356]) -> [SKIP][627] ([i915#15330])
>    [626]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
>    [627]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg2:          [SKIP][628] ([i915#15865]) -> [SKIP][629] ([i915#17356]) +2 other tests skip
>    [628]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@kms_content_protection@legacy.html
>    [629]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-dg2:          [SKIP][630] ([i915#17356]) -> [SKIP][631] ([i915#15865]) +1 other test skip
>    [630]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_content_protection@mei-interface.html
>    [631]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-1/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-rkl:          [SKIP][632] ([i915#14544] / [i915#15865]) -> [SKIP][633] ([i915#15865]) +2 other tests skip
>    [632]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_content_protection@srm.html
>    [633]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-rkl:          [SKIP][634] ([i915#3555]) -> [SKIP][635] ([i915#14544] / [i915#3555])
>    [634]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html
>    [635]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2:          [SKIP][636] ([i915#17356]) -> [SKIP][637] ([i915#13049])
>    [636]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [637]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>     - shard-rkl:          [SKIP][638] ([i915#13049]) -> [SKIP][639] ([i915#13049] / [i915#14544])
>    [638]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [639]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-dg2:          [SKIP][640] ([i915#17356]) -> [SKIP][641] ([i915#3555]) +4 other tests skip
>    [640]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html
>    [641]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-rkl:          [SKIP][642] ([i915#13049] / [i915#14544]) -> [SKIP][643] ([i915#13049])
>    [642]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
>    [643]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2:          [SKIP][644] ([i915#17356]) -> [SKIP][645] ([i915#13046] / [i915#17454] / [i915#5354]) +7 other tests skip
>    [644]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [645]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2:          [SKIP][646] ([i915#11190] / [i915#17356]) -> [SKIP][647] ([i915#4103]) +1 other test skip
>    [646]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [647]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-rkl:          [SKIP][648] ([i915#4103]) -> [SKIP][649] ([i915#14544] / [i915#4103]) +1 other test skip
>    [648]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>    [649]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-dg2:          [SKIP][650] ([i915#13046] / [i915#17454] / [i915#5354]) -> [SKIP][651] ([i915#17356]) +4 other tests skip
>    [650]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
>    [651]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-rkl:          [SKIP][652] ([i915#14544] / [i915#4103]) -> [SKIP][653] ([i915#4103])
>    [652]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [653]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2:          [SKIP][654] ([i915#4103]) -> [SKIP][655] ([i915#17356])
>    [654]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [655]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-dg2:          [SKIP][656] ([i915#17356]) -> [SKIP][657] ([i915#13691])
>    [656]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_display_modes@extended-mode-basic.html
>    [657]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-dg2:          [SKIP][658] ([i915#17356]) -> [SKIP][659] ([i915#17289])
>    [658]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst.html
>    [659]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-3/igt@kms_dp_link_training@non-uhbr-mst.html
>     - shard-rkl:          [SKIP][660] ([i915#17289]) -> [SKIP][661] ([i915#14544] / [i915#17289])
>    [660]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst.html
>    [661]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
>     - shard-rkl:          [SKIP][662] ([i915#14544] / [i915#17287]) -> [SKIP][663] ([i915#17287])
>    [662]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
>    [663]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
>     - shard-dg2:          [SKIP][664] ([i915#17286]) -> [SKIP][665] ([i915#17356])
>    [664]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-3/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
>    [665]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
> 
>   * igt@kms_dp_link_training@uhbr-mst-direct-train:
>     - shard-rkl:          [SKIP][666] ([i915#14544] / [i915#17285]) -> [SKIP][667] ([i915#17285])
>    [666]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst-direct-train.html
>    [667]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst-direct-train.html
> 
>   * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
>     - shard-dg2:          [SKIP][668] ([i915#17356]) -> [SKIP][669] ([i915#17285]) +2 other tests skip
>    [668]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
>    [669]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-8/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
> 
>   * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
>     - shard-dg2:          [SKIP][670] ([i915#16867]) -> [SKIP][671] ([i915#17356])
>    [670]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
>    [671]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
>     - shard-dg2:          [SKIP][672] ([i915#17356]) -> [SKIP][673] ([i915#16361]) +4 other tests skip
>    [672]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html
>    [673]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2:          [SKIP][674] ([i915#16361]) -> [SKIP][675] ([i915#17356]) +2 other tests skip
>    [674]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@kms_dsc@dsc-with-bpc-formats.html
>    [675]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
>     - shard-rkl:          [SKIP][676] ([i915#14544] / [i915#16361]) -> [SKIP][677] ([i915#16361]) +2 other tests skip
>    [676]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
>    [677]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
>     - shard-rkl:          [SKIP][678] ([i915#16361]) -> [SKIP][679] ([i915#14544] / [i915#16361]) +1 other test skip
>    [678]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
>    [679]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
> 
>   * igt@kms_fence_pin_leak:
>     - shard-dg2:          [SKIP][680] ([i915#4881]) -> [SKIP][681] ([i915#17356])
>    [680]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@kms_fence_pin_leak.html
>    [681]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_fence_pin_leak.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-dg1:          [SKIP][682] ([i915#9934]) -> [SKIP][683] ([i915#4423] / [i915#9934])
>    [682]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg1-19/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>    [683]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-19/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-rkl:          [SKIP][684] ([i915#14544] / [i915#9934]) -> [SKIP][685] ([i915#9934]) +1 other test skip
>    [684]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>    [685]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-glk:          [INCOMPLETE][686] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][687] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
>    [686]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [687]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-rkl:          [SKIP][688] ([i915#15643]) -> [SKIP][689] ([i915#14544] / [i915#15643])
>    [688]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
>    [689]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-rkl:          [SKIP][690] ([i915#14544] / [i915#15643]) -> [SKIP][691] ([i915#15643]) +1 other test skip
>    [690]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
>    [691]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:
>     - shard-dg2:          [SKIP][692] ([i915#16708]) -> [SKIP][693] ([i915#15104] / [i915#15990])
>    [692]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
>    [693]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2:          [SKIP][694] ([i915#15990] / [i915#8708]) -> [SKIP][695] ([i915#16708] / [i915#5354]) +6 other tests skip
>    [694]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
>    [695]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>     - shard-dg2:          [SKIP][696] ([i915#15991] / [i915#5354]) -> [SKIP][697] ([i915#16708] / [i915#5354]) +19 other tests skip
>    [696]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
>    [697]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:
>     - shard-rkl:          [SKIP][698] ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][699] ([i915#17428] / [i915#1825]) +2 other tests skip
>    [698]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
>    [699]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite:
>     - shard-dg1:          [SKIP][700] ([i915#15989]) -> [SKIP][701] ([i915#15989] / [i915#4423])
>    [700]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg1-15/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite.html
>    [701]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2:          [SKIP][702] ([i915#15990]) -> [SKIP][703] ([i915#16708]) +11 other tests skip
>    [702]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
>    [703]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg1:          [SKIP][704] ([i915#17428]) -> [SKIP][705] ([i915#17428] / [i915#4423]) +1 other test skip
>    [704]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg1-15/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-render.html
>    [705]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:
>     - shard-dg2:          [SKIP][706] ([i915#15989]) -> [SKIP][707] ([i915#16708]) +10 other tests skip
>    [706]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html
>    [707]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
>     - shard-dg2:          [SKIP][708] ([i915#16708] / [i915#5354]) -> [SKIP][709] ([i915#15990] / [i915#8708]) +12 other tests skip
>    [708]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html
>    [709]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
>     - shard-dg2:          [SKIP][710] ([i915#15102]) -> [SKIP][711] ([i915#16708]) +14 other tests skip
>    [710]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
>    [711]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
>     - shard-dg2:          [SKIP][712] ([i915#15104] / [i915#15990]) -> [SKIP][713] ([i915#16708])
>    [712]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
>    [713]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
>     - shard-dg2:          [SKIP][714] ([i915#16708] / [i915#5354]) -> [SKIP][715] ([i915#15102]) +16 other tests skip
>    [714]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html
>    [715]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
>     - shard-dg2:          [SKIP][716] ([i915#16708] / [i915#5354]) -> [SKIP][717] ([i915#15991] / [i915#5354]) +33 other tests skip
>    [716]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
>    [717]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>     - shard-rkl:          [SKIP][718] ([i915#14544] / [i915#15102]) -> [SKIP][719] ([i915#15102]) +15 other tests skip
>    [718]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
>    [719]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-msflip-blt:
>     - shard-rkl:          [SKIP][720] ([i915#14544] / [i915#17428]) -> [SKIP][721] ([i915#17428]) +29 other tests skip
>    [720]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-msflip-blt.html
>    [721]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][722] ([i915#15991]) -> [SKIP][723] ([i915#16708]) +26 other tests skip
>    [722]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
>    [723]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2:          [SKIP][724] ([i915#16708]) -> [SKIP][725] ([i915#15990]) +22 other tests skip
>    [724]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [725]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][726] ([i915#16708]) -> [SKIP][727] ([i915#15102]) +27 other tests skip
>    [726]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html
>    [727]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][728] ([i915#16708]) -> [SKIP][729] ([i915#15989]) +22 other tests skip
>    [728]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
>    [729]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-dg2:          [SKIP][730] ([i915#16708]) -> [SKIP][731] ([i915#15991]) +41 other tests skip
>    [730]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html
>    [731]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-rkl:          [SKIP][732] ([i915#17428] / [i915#1825]) -> [SKIP][733] ([i915#14544] / [i915#17428] / [i915#1825]) +2 other tests skip
>    [732]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [733]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>     - shard-rkl:          [SKIP][734] ([i915#17428]) -> [SKIP][735] ([i915#14544] / [i915#17428]) +22 other tests skip
>    [734]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
>    [735]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>     - shard-dg2:          [SKIP][736] ([i915#15102]) -> [SKIP][737] ([i915#16708] / [i915#5354]) +10 other tests skip
>    [736]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
>    [737]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
>     - shard-rkl:          [SKIP][738] ([i915#15102]) -> [SKIP][739] ([i915#14544] / [i915#15102]) +14 other tests skip
>    [738]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html
>    [739]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-dg2:          [SKIP][740] ([i915#16518] / [i915#3555] / [i915#8228]) -> [SKIP][741] ([i915#17356])
>    [740]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@kms_hdr@bpc-switch-dpms.html
>    [741]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-rkl:          [SKIP][742] ([i915#12713] / [i915#16644]) -> [SKIP][743] ([i915#1187] / [i915#12713] / [i915#16644])
>    [742]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html
>    [743]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-dg2:          [SKIP][744] ([i915#17356]) -> [SKIP][745] ([i915#16518] / [i915#3555] / [i915#8228])
>    [744]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html
>    [745]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-3/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-dg2:          [SKIP][746] ([i915#6301]) -> [SKIP][747] ([i915#17356])
>    [746]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@kms_panel_fitting@legacy.html
>    [747]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>     - shard-rkl:          [SKIP][748] ([i915#17455]) -> [SKIP][749] ([i915#14544] / [i915#17455]) +2 other tests skip
>    [748]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
>    [749]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
>     - shard-rkl:          [SKIP][750] ([i915#14544] / [i915#15709]) -> [SKIP][751] ([i915#15709]) +1 other test skip
>    [750]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html
>    [751]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-dg2:          [SKIP][752] ([i915#17356]) -> [SKIP][753] ([i915#3555] / [i915#8821])
>    [752]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html
>    [753]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-1/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-rkl:          [SKIP][754] ([i915#13958] / [i915#14544]) -> [SKIP][755] ([i915#13958])
>    [754]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html
>    [755]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-dg2:          [SKIP][756] ([i915#17356]) -> [SKIP][757] ([i915#13958])
>    [756]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-y.html
>    [757]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-dg2:          [SKIP][758] ([i915#13958]) -> [SKIP][759] ([i915#17356])
>    [758]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-5/igt@kms_plane_multiple@2x-tiling-yf.html
>    [759]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2:          [SKIP][760] ([i915#6953] / [i915#9423]) -> [SKIP][761] ([i915#17356] / [i915#6953] / [i915#9423])
>    [760]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html
>    [761]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
>     - shard-rkl:          [SKIP][762] ([i915#15329]) -> [SKIP][763] ([i915#14544] / [i915#15329]) +3 other tests skip
>    [762]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
>    [763]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
>     - shard-rkl:          [SKIP][764] ([i915#14544] / [i915#15329] / [i915#3555]) -> [SKIP][765] ([i915#15329] / [i915#3555])
>    [764]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
>    [765]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
>     - shard-rkl:          [SKIP][766] ([i915#14544] / [i915#15329]) -> [SKIP][767] ([i915#15329]) +2 other tests skip
>    [766]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
>    [767]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-rkl:          [SKIP][768] ([i915#15948]) -> [SKIP][769] ([i915#14544] / [i915#15948])
>    [768]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html
>    [769]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-rkl:          [SKIP][770] ([i915#9340]) -> [SKIP][771] ([i915#3828])
>    [770]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html
>    [771]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>     - shard-rkl:          [SKIP][772] ([i915#11520]) -> [SKIP][773] ([i915#11520] / [i915#14544]) +2 other tests skip
>    [772]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
>    [773]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
>     - shard-rkl:          [SKIP][774] ([i915#11520] / [i915#14544]) -> [SKIP][775] ([i915#11520]) +3 other tests skip
>    [774]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
>    [775]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-rkl:          [SKIP][776] ([i915#9683]) -> [SKIP][777] ([i915#14544] / [i915#9683])
>    [776]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>    [777]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-sprite-mmap-gtt:
>     - shard-rkl:          [SKIP][778] ([i915#1072] / [i915#9732]) -> [SKIP][779] ([i915#1072] / [i915#14544] / [i915#9732]) +4 other tests skip
>    [778]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html
>    [779]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html
> 
>   * igt@kms_psr@pr-no-drrs:
>     - shard-rkl:          [SKIP][780] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][781] ([i915#1072] / [i915#9732]) +6 other tests skip
>    [780]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_psr@pr-no-drrs.html
>    [781]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_psr@pr-no-drrs.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2:          [SKIP][782] ([i915#12755] / [i915#15867]) -> [SKIP][783] ([i915#17356])
>    [782]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-3/igt@kms_rotation_crc@primary-rotation-270.html
>    [783]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-7/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2:          [SKIP][784] ([i915#17356] / [i915#5190]) -> [SKIP][785] ([i915#12755] / [i915#15867] / [i915#5190])
>    [784]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>    [785]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-rkl:          [SKIP][786] ([i915#14544] / [i915#17432] / [i915#5289]) -> [SKIP][787] ([i915#17432] / [i915#5289])
>    [786]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [787]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg2:          [SKIP][788] ([i915#17356] / [i915#5190]) -> [SKIP][789] ([i915#5190])
>    [788]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>    [789]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-dg2:          [SKIP][790] ([i915#17356]) -> [SKIP][791] ([i915#12755] / [i915#15867]) +2 other tests skip
>    [790]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-90.html
>    [791]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none:
>     - shard-rkl:          [SKIP][792] ([i915#14544] / [i915#3555]) -> [SKIP][793] ([i915#3555]) +1 other test skip
>    [792]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-none.html
>    [793]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_scaling_modes@scaling-mode-none.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2:          [SKIP][794] ([i915#17356]) -> [SKIP][795] ([i915#8623])
>    [794]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [795]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-rkl:          [SKIP][796] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][797] ([i915#15243] / [i915#3555])
>    [796]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@kms_vrr@flip-dpms.html
>    [797]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-dg2:          [SKIP][798] ([i915#17356]) -> [SKIP][799] ([i915#15243] / [i915#3555])
>    [798]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_vrr@flip-suspend.html
>    [799]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-3/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-dg2:          [SKIP][800] ([i915#17356]) -> [SKIP][801] ([i915#3555] / [i915#9906])
>    [800]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-dg2-7/igt@kms_vrr@negative-basic.html
>    [801]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-dg2-5/igt@kms_vrr@negative-basic.html
> 
>   * igt@perf@mi-rpc:
>     - shard-rkl:          [SKIP][802] ([i915#2434]) -> [SKIP][803] ([i915#14544] / [i915#2434])
>    [802]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@perf@mi-rpc.html
>    [803]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@perf@mi-rpc.html
> 
>   * igt@perf_pmu@rc6-all-gts:
>     - shard-rkl:          [SKIP][804] ([i915#14544] / [i915#8516]) -> [SKIP][805] ([i915#8516])
>    [804]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html
>    [805]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-7/igt@perf_pmu@rc6-all-gts.html
> 
>   * igt@prime_udl@share-import-addfb:
>     - shard-rkl:          [SKIP][806] ([i915#16420]) -> [SKIP][807] ([i915#14544] / [i915#16420])
>    [806]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-7/igt@prime_udl@share-import-addfb.html
>    [807]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-6/igt@prime_udl@share-import-addfb.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-rkl:          [SKIP][808] ([i915#14544] / [i915#17448] / [i915#3708]) -> [SKIP][809] ([i915#17448] / [i915#3708])
>    [808]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19418/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html
>    [809]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/shard-rkl-8/igt@prime_vgem@fence-flip-hang.html
> 
>   
>   [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
>   [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
>   [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
>   [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
>   [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
>   [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
>   [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
>   [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
>   [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
>   [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
>   [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
>   [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
>   [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
>   [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
>   [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
>   [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
>   [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
>   [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
>   [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
>   [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
>   [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
>   [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
>   [i915#13441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441
>   [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
>   [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
>   [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
>   [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
>   [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
>   [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
>   [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
>   [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
>   [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
>   [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
>   [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
>   [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
>   [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
>   [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
>   [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
>   [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
>   [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
>   [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
>   [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
>   [i915#15152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15152
>   [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
>   [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
>   [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
>   [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
>   [i915#15347]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15347
>   [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
>   [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
>   [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
>   [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
>   [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
>   [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
>   [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
>   [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
>   [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
>   [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
>   [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
>   [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
>   [i915#15792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15792
>   [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
>   [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
>   [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
>   [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
>   [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
>   [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
>   [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
>   [i915#16017]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16017
>   [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
>   [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
>   [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
>   [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
>   [i915#16226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16226
>   [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
>   [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
>   [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
>   [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
>   [i915#16505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16505
>   [i915#16508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16508
>   [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
>   [i915#16599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599
>   [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
>   [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
>   [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
>   [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
>   [i915#16746]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
>   [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
>   [i915#16938]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16938
>   [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
>   [i915#17099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099
>   [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
>   [i915#17226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17226
>   [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
>   [i915#17286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286
>   [i915#17287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287
>   [i915#17289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289
>   [i915#17356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356
>   [i915#17357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357
>   [i915#17359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359
>   [i915#17373]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373
>   [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
>   [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
>   [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
>   [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
>   [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
>   [i915#17434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
>   [i915#17444]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444
>   [i915#17446]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17446
>   [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
>   [i915#17450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450
>   [i915#17453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453
>   [i915#17454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
>   [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
>   [i915#17456]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456
>   [i915#17457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
>   [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
>   [i915#17465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17465
>   [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
>   [i915#17477]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17477
>   [i915#17478]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478
>   [i915#17479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479
>   [i915#17480]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480
>   [i915#17482]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482
>   [i915#17483]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483
>   [i915#17484]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484
>   [i915#17488]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488
>   [i915#17489]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489
>   [i915#17490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490
>   [i915#17491]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491
>   [i915#17492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492
>   [i915#17495]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17495
>   [i915#17497]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497
>   [i915#17498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498
>   [i915#17500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500
>   [i915#17501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17501
>   [i915#17502]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502
>   [i915#17503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503
>   [i915#17504]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504
>   [i915#17505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505
>   [i915#17507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507
>   [i915#17508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508
>   [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
>   [i915#17514]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17514
>   [i915#17516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516
>   [i915#17517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
>   [i915#17520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
>   [i915#17521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
>   [i915#17522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
>   [i915#17524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524
>   [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
>   [i915#17526]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526
>   [i915#17527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17527
>   [i915#17530]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17530
>   [i915#17531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17531
>   [i915#17532]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17532
>   [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
>   [i915#17534]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17534
>   [i915#17535]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17535
>   [i915#17539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539
>   [i915#17540]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540
>   [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
>   [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
>   [i915#17557]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17557
>   [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
>   [i915#17560]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17560
>   [i915#17564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564
>   [i915#17568]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17568
>   [i915#17569]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569
>   [i915#17570]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17570
>   [i915#17571]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17571
>   [i915#17580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17580
>   [i915#17583]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583
>   [i915#17584]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17584
>   [i915#17600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17600
>   [i915#17668]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17668
>   [i915#17673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17673
>   [i915#17678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17678
>   [i915#17688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17688
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#17704]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17704
>   [i915#17707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17707
>   [i915#17712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17712
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
>   [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
>   [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
>   [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3711
>   [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>   [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>   [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
>   [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
>   [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
>   [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>   [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
>   [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>   [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
>   [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
>   [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
>   [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
>   [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
>   [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>   [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
>   [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
>   [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
>   [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
>   [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
>   [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
>   [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
>   [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
>   [i915#9561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561
>   [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>   [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_19418 -> Patchwork_177148v2
> 
>   CI-20190529: 20190529
>   CI_DRM_19418: 29f9258a2788a1066c0910c480e65c80887f4d20 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_9171: 9171
>   Patchwork_177148v2: 29f9258a2788a1066c0910c480e65c80887f4d20 @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177148v2/index.html
