Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150D5C4452A
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Jul 2026 12:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A29D10E904;
	Mon, 20 Jul 2026 12:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8xwLHUm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290A010E904
 for <intel-gfx@lists.freedesktop.org>; Mon, 20 Jul 2026 12:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784551921; x=1816087921;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=L9keSUTBB1eDbKyeDuqBHOKHxQCLxzKRXidvDG3Jfrg=;
 b=N8xwLHUmmTboeQ+X7Ag1anXh76f959TJeEJqPcisU08eSy6glAT6pRvA
 K+uBJxN6YPwFrLeAt0lZtutzHfPpuhH/CXteQ/Ezu/tmwyr7lGd2V3T0U
 bgWBrxriGpxckg2sAiTD4yPxHvuHW6Vp21bW9Rgv67yB4EjHHz68Lduej
 68vaX6jthXsDUuXcAvjnis4l8/lqT7XswSFdEelKu4wQdf+/z8Gf/F40z
 w/wZmhnnYvc7ahjjaf55clX96tFfZ9MGGqM/jJswumr2ucFrVV4cQzEZb
 spJTlFm9iBsxT+h5Xgr0M/yOmB+ZX23ycLpRV/7qxx07Z/wwYO4rl41h6 w==;
X-CSE-ConnectionGUID: RcPPcvhDSwCZ9O3/xCV2nA==
X-CSE-MsgGUID: kzb2hIr1QpmdsC303xuD7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="102551828"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="102551828"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 05:52:01 -0700
X-CSE-ConnectionGUID: IVtTwlDnTQO1W4TF4BwdMQ==
X-CSE-MsgGUID: PyLLZMLwQemmkNiydSuVOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="261730170"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 05:52:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 05:52:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 05:52:00 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 05:51:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0qfEVJWdWZpPnkZumcIWFt3ExqxRhmzm8xmGRiKb9L5iZij6koslA6qqxNsjUD/1Pp/xmMHKfQedHRCq78fr4aTPhXYNxGNoBWtRWWhCl9YnHtoEDMq069sE3Bhubbqfk4UB/gsCHlzS6w2ZF3t0A0EO3ReqOZePasmnLkT4Kji+CuXd5vqi5MLu+iTX0YX/mXgMxF1agoycI9MkaQ8hgfvhvwKhnE2NA9g+39U1cB1ait7LHZTq7VDNmrpjoWsvDLG2gLF02qimvyyxEQLV7vHduhhOcNNt1+0NpyLwb9nJWGEzV44tbMVaJLnN4WiGJCDuPf5VYJ6omWxLQewoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHpkuG/byopb47Jul7eowYALF9GMVXK2alEtPPZxmz4=;
 b=fGK6KWJTU6sGHdGI6LT85InyDw7KxpE6uxv9sAxh3J452r5EusgoXYMYEBD+p9SZhy9IPHyMN6uFZKpKELgRzNyE1JQS7p2DA5U/h93K+B8cKreS+XdRu6dh3EhLaZK4paCk0koTq5fTec/lQuXj9SzWLxYus+kSCUQEXKsZ2WCt1E1JhHjcUBJlN1L5a/uUAkbySxm7XhKhW62Hs70evwUUTA5zbU6rkx3Ls3/ydrIAMYsYd53nyU+hNRIYLgrHz6cssdH4F3OQ/Eoqk5Zx586SbJrLrUsnf882OHlNDu54OrH9Zmq171R/vKxqfcp8yPFqu9Q3tLXyKYT7yASbQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 12:51:55 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 12:51:55 +0000
Date: Mon, 20 Jul 2026 15:51:48 +0300
From: Imre Deak <imre.deak@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFp?= =?utf-8?Q?lure?= for
 drm/i915/dp: Enable UHBR link rates on tunneled links
Message-ID: <al4Z5FCzilRRfDnE@ideak-desk.lan>
References: <20260714152700.555527-1-imre.deak@intel.com>
 <178407078764.189998.4252701491440147730@6beec6c84f66>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178407078764.189998.4252701491440147730@6beec6c84f66>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GV2PEPF00023978.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::36c) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|CO1PR11MB5060:EE_
X-MS-Office365-Filtering-Correlation-Id: 425b73ed-05c3-4437-a25b-08dee65dad35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006|5023799004|3023799007|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: 9z7LCOKZzzVPK6gnwVovQTcLNypWzwNUFhGwKcEQRG2Kh0fBA61nB7+B40B2U3/gzxWtWp/SGWXXdFo6naAHmujJ3CF7yjKDTgDCSTMb3xv5mMA89pkkk3MfEh01S4RCOeEO3jCp+3uklkHKkKhcmX92CYabmcj62wdV2KzPJ6diQjgqsDKWkGt7lCiqRACeI/WJLhqRHkABImb4PCWeGSD0ts1tW97GQrqtsPgkstMuRbhi/DHM/Ywn9t0tM1/Lv4YAliYQ26DF6GftNZ2J9hKNke2ZrEI4FA1qpqu1ro3iDeR4n08CuVqoS8baKbSnk9M7UWSFPCKylgl6ytMZwZlaW15Ikt6vZCZpCCrkIyFQNnx2AWgh4PKIoeysFtE2sdXFyEi3PGa2FcJEjzEv/Y6h2wdXz6yrV7RB69y+likF8/Qwg/fZcirS+Cv01CbUidmYX7SYcMBGjSPA5JTmKNUDuVkpvZjElMBNdrn/RMXMYER5ZHaskk48i1fPznD/LEtVRL++p8g9sLuaqSRH/BGqItrYcG23H6yHKGn9iwj9Rot2V2LJCWkgexuKC3HaBlV5qtzdmmelcpyotAFh4QvQNvQX1R7VmpNKAA62KTI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(5023799004)(3023799007)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SZtc9KM+xj/CHPPumYaKyO1vRP5D48xK4waMfQcr6CTqvQ8yXf4SHyVSyd2P?=
 =?us-ascii?Q?ZfhlcTFEqXI+BZ1uUl2/J4ZHKnDGce7WXjikQPlU4idMm4hfb86wqdMb1ZO5?=
 =?us-ascii?Q?s1vUzSA9i06OyOYU1kL+7Qi1q2Pz+ixq71MFGbPuT5B/ENSTtnKuwLP/vS+g?=
 =?us-ascii?Q?pq9CFpb8HQ5LIBYOYpPHQDBkMPLMrgRYFASI9MGBChSaiRp4o2Yg5atCoDzG?=
 =?us-ascii?Q?5bjaTvLG7EypPV8UtNBfvXNqk/79HMjIAiQFQmW9O0fUUwkESZ/9JucfxGUK?=
 =?us-ascii?Q?Hg8PWI4wK2XQVY5kuUQoKon8D+5VBkdqIlHYEQ1sv6Ti3xoCOlAANw0SL48J?=
 =?us-ascii?Q?cIpkYldw/K5CPBc8L0W+nfe8fGU8NYTbJLdsVuPkYLV+j1LWkQmzOHeWYI3W?=
 =?us-ascii?Q?e5vuq54YzeFC0yeNRRxH0BLKlxjgLMqMKG+xEPJmDfYnrI/IOFkoGdOF1GRo?=
 =?us-ascii?Q?t24KCCrcN39rFRrNUpP2X5tK0hPaU4K3pnVqFEaLyWjRnl66LB54eQT2xY4j?=
 =?us-ascii?Q?W1eqn9TTLdhwBotuNNeQgcLh9huhnF+0cvlKt6bRS1kaicwl6qtfkdldym+6?=
 =?us-ascii?Q?RL94tyKdU9frf9NTV+BFK79mZCZIGUywWL1GD+M1xpGALCrTy7bS0H8e5ScE?=
 =?us-ascii?Q?HlLaSrzWuEqkwoT3dRbhvlJ/d0pS73neGUYCV0dt8fQcAZOCuLQLZ2g26EdQ?=
 =?us-ascii?Q?Xb0VPOtxVm9eAdh9ogIH6b0AfnDH1dcRUyWIHHf8J0z7u/9PFwktHQC3bu/E?=
 =?us-ascii?Q?tX/cTpYYzLnB76AjA7pox1CEeThGng4EG9f56yM7MKjcVW7DsY85neD1HqHc?=
 =?us-ascii?Q?UD5/WXWaEWw5U7PktGfh7nNKWkZuoP67ThPectkMgj+fLuUTXaJ9kw7kaHM2?=
 =?us-ascii?Q?39rglT2eqAFRKziJAhojpvWL/RSYWcc554Y+Tw0CabOE6MdXNfyxik7DUfmh?=
 =?us-ascii?Q?CcmEnN46VAFesuNJAmjq/gv7a8n6uhijk8YfuopdxfrxTjwkSkiCYhswZO3F?=
 =?us-ascii?Q?eL44ALy6oP+C5XjftP5ZLUpocB+gO4Ub+cNe7KHZ4WBAfiGx32ipfA+RkKC+?=
 =?us-ascii?Q?/NqVlIV72goAAhagCW1n8ADFLjh1qnFcmnGQv4Q3Ef5kN3a2ConE4NcYh4Ae?=
 =?us-ascii?Q?ET3a2o7S6w7FwUaCg6dMc9a6yqw6bSABpDrwPsXw8Ho5nVOeASNjQzuAx/Zw?=
 =?us-ascii?Q?veFZPTMed9icy1EQ67zolmFVP3c+2XI3K5O4xB++EMzzEHY4qzQZvfVwHkwd?=
 =?us-ascii?Q?2B6lapvi24BAA5OE9GuaDOlZ2rsPuJknK5Gu/M5dOLdKOmslaWXszsnDmAVY?=
 =?us-ascii?Q?IPf5TiooK5JPp+B3x2q8Yziu9QWoC2435MLTQIdZSlXOfoQ3oRP61aDN3GFG?=
 =?us-ascii?Q?1/O0ov1wgqw2nK7b8x/FWJDFh6XLSvSlElA51snzY5/mUMMzJZlULjbfhQLJ?=
 =?us-ascii?Q?fO/kYyiohR1wzdbz9qzil9VJehGar8TwtQTUctUoVo8q1T7mgiWPcJ2V6qAr?=
 =?us-ascii?Q?lM0cMQHKwbNmRdXA8NF3kSeMbjvted4rd9UgQXJe29po4RdDZnAWi1nsHO8j?=
 =?us-ascii?Q?hXfyF7uXo3zvvQPbBh40l9iMqXYhockbALpsMuJFAOP7iswJA8w+EdUqpTPh?=
 =?us-ascii?Q?p9+MpQ3IBoi3CPiytD0PuPkLdq2QpkhR+q8CaGHKBJk58OBTU9VxrzV32I63?=
 =?us-ascii?Q?7YiZoXFPMwuUF7eAt3l5IorQ0iz+uqcFa/q6z8EsVUbkETKOorNP2G4L7qzZ?=
 =?us-ascii?Q?TN+nn6pUgA=3D=3D?=
X-Exchange-RoutingPolicyChecked: Ern3YvmEMEOzqM37xgve+cEX5Aq2EO6DQeTD2kyGjUi9R/S7d8UfTlHuzzZl+bbMmOSgBZDGf+jYxiS8MIQ2UFcV9JDnbfMu3aUZRAFN7P5VVzvTS6VTAWC5k797mQ0G3y79a2Vco9WF68KSYHeY0bsWmmIVvwsV38cQiIaZmxbDGYMol9D1WC4eEZ+V3CHgd2AR6jHRrSOrwZ51FFPUe681Uauq10omWuI0svQTjdQySArrDElIm4oNMEx5rC3Cq1rTWHq9lslru4cUosdx0zUbYNBkL2xfSBhvT8wmOloqTmyYP3T12bQJDGz8q9dQrSX9pHmpnqBxKc3WngPrqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 425b73ed-05c3-4437-a25b-08dee65dad35
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 12:51:55.0529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJc7FYKUNF+wxFK2+m/S8so5orSxeM5mDskBhhYCTVez9KzZCbFh9V9H3tJ3lQjan69Kz3Ny4NFABg506/D0nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
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
Reply-To: imre.deak@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2026 at 11:13:07PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/dp: Enable UHBR link rates on tunneled links
> URL   : https://patchwork.freedesktop.org/series/170425/
> State : failure

Thanks for the review and ack, patchset is pushed to drm-intel-next.

The failure is unrelated, see below.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_18820_full -> Patchwork_170425v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with Patchwork_170425v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_170425v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in Patchwork_170425v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@perf_pmu@busy-start@vecs0:
>     - shard-mtlp:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-mtlp-4/igt@perf_pmu@busy-start@vecs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-mtlp-3/igt@perf_pmu@busy-start@vecs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_gttfill@all-engines:
>     - shard-mtlp:         [SKIP][3] ([i915#16090]) -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-mtlp-4/igt@gem_exec_gttfill@all-engines.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-mtlp-3/igt@gem_exec_gttfill@all-engines.html
> 
>   * igt@kms_psr@psr2-basic@edp-1:
>     - shard-mtlp:         [FAIL][5] ([i915#15871]) -> [FAIL][6] +3 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-mtlp-4/igt@kms_psr@psr2-basic@edp-1.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-mtlp-3/igt@kms_psr@psr2-basic@edp-1.html

All the above 3 failures happened on the same host, with an eDP panel,
which is not affected by the DP tunnel changes in the patchset.

> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_18820_full and Patchwork_170425v1_full:
> 
> ### New IGT tests (14) ###
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [20.75] s
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [20.25] s
> 
>   * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.73] s
> 
>   * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.66] s
> 
>   * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.69] s
> 
>   * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.68] s
> 
>   * igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.77] s
> 
>   * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.80] s
> 
>   * igt@kms_flip@flip-vs-rmfb-interruptible@c-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.75] s
> 
>   * igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.78] s
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-a-hdmi-a-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [10.01] s
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-b-hdmi-a-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [9.75] s
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [9.77] s
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [9.77] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_170425v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#8411])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#6230])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@api_intel_bb@crc32.html
> 
>   * igt@drm_buddy@drm_buddy:
>     - shard-tglu-1:       NOTRUN -> [SKIP][9] ([i915#15678])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@drm_buddy@drm_buddy.html
> 
>   * igt@gem_ccs@large-ctrl-surf-copy:
>     - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#13008])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-copy.html
> 
>   * igt@gem_close_race@multigpu-basic-process:
>     - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#14544] / [i915#7697])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html
> 
>   * igt@gem_create@create-ext-cpu-access-sanity-check:
>     - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#6335])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#8562])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_isolation@preservation-s3:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][14] ([i915#13356]) +2 other tests incomplete
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html
> 
>   * igt@gem_ctx_isolation@preservation-s3@rcs0:
>     - shard-glk11:        NOTRUN -> [INCOMPLETE][15] ([i915#13356] / [i915#16466]) +1 other test incomplete
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk11/igt@gem_ctx_isolation@preservation-s3@rcs0.html
> 
>   * igt@gem_ctx_persistence@heartbeat-many:
>     - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8555])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-many.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#280])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-tglu-1:       NOTRUN -> [SKIP][18] ([i915#280])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_exec_balancer@bonded-semaphore:
>     - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#4812])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@gem_exec_balancer@bonded-semaphore.html
> 
>   * igt@gem_exec_balancer@parallel-contexts:
>     - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#4525])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@gem_exec_balancer@parallel-contexts.html
> 
>   * igt@gem_exec_balancer@parallel-keep-in-fence:
>     - shard-tglu-1:       NOTRUN -> [SKIP][21] ([i915#4525])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-in-fence.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#6334]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-8/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_capture@capture-recoverable:
>     - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#6344])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@gem_exec_capture@capture-recoverable.html
> 
>   * igt@gem_exec_flush@basic-uc-prw-default:
>     - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#3539])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@gem_exec_flush@basic-uc-prw-default.html
> 
>   * igt@gem_exec_flush@basic-wb-set-default:
>     - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#3539] / [i915#4852])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@gem_exec_flush@basic-wb-set-default.html
> 
>   * igt@gem_exec_params@secure-non-root:
>     - shard-dg2:          NOTRUN -> [SKIP][26] +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@gem_exec_params@secure-non-root.html
> 
>   * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
>     - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#3281]) +7 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-3/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#3281]) +5 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@gem_exec_reloc@basic-wc.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#4860])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - shard-glk:          NOTRUN -> [SKIP][30] ([i915#4613])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk2/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify:
>     - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#4613]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][32] ([i915#4613])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_media_fill@media-fill:
>     - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#8289])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@gem_media_fill@media-fill.html
> 
>   * igt@gem_mmap_wc@fault-concurrent:
>     - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4083]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@gem_mmap_wc@fault-concurrent.html
> 
>   * igt@gem_pread@snoop:
>     - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#3282]) +2 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@gem_pread@snoop.html
> 
>   * igt@gem_pxp@hw-rejects-pxp-buffer:
>     - shard-tglu-1:       NOTRUN -> [SKIP][36] ([i915#13398])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html
> 
>   * igt@gem_pxp@regular-baseline-src-copy-readible:
>     - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4270]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@gem_pxp@regular-baseline-src-copy-readible.html
> 
>   * igt@gem_readwrite@beyond-eob:
>     - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#3282])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@gem_readwrite@beyond-eob.html
> 
>   * igt@gem_render_copy@yf-tiled-to-vebox-linear:
>     - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#5190] / [i915#8428])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@gem_render_copy@yf-tiled-to-vebox-linear.html
> 
>   * igt@gem_tiled_blits@basic:
>     - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4077]) +9 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@gem_tiled_blits@basic.html
> 
>   * igt@gem_userptr_blits@coherency-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3297])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@gem_userptr_blits@coherency-unsync.html
>     - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#3297])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@gem_userptr_blits@coherency-unsync.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-tglu-1:       NOTRUN -> [SKIP][43] ([i915#3297]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-glk:          NOTRUN -> [SKIP][44] ([i915#3323])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-cycles:
>     - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#3297])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-tglu-1:       NOTRUN -> [SKIP][46] ([i915#2527] / [i915#2856]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@secure-batches:
>     - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#2527]) +3 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@gen9_exec_parse@secure-batches.html
> 
>   * igt@gen9_exec_parse@shadow-peek:
>     - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#2856]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@gen9_exec_parse@shadow-peek.html
>     - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#2527] / [i915#2856])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@gen9_exec_parse@shadow-peek.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#6412])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-8/igt@i915_module_load@resize-bar.html
> 
>   * igt@i915_pm_freq_api@freq-reset-multiple:
>     - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#8399])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-4/igt@i915_pm_freq_api@freq-reset-multiple.html
> 
>   * igt@i915_pm_freq_api@freq-suspend:
>     - shard-tglu-1:       NOTRUN -> [SKIP][52] ([i915#8399])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html
> 
>   * igt@i915_pm_freq_mult@media-freq@gt0:
>     - shard-tglu:         NOTRUN -> [SKIP][53] ([i915#6590]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@i915_pm_freq_mult@media-freq@gt0.html
> 
>   * igt@i915_pm_rpm@system-suspend:
>     - shard-rkl:          [PASS][54] -> [ABORT][55] ([i915#15060])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-5/igt@i915_pm_rpm@system-suspend.html
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-1/igt@i915_pm_rpm@system-suspend.html
> 
>   * igt@i915_pm_rps@min-max-config-idle:
>     - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#11681] / [i915#6621])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@i915_pm_rps@min-max-config-idle.html
> 
>   * igt@i915_pm_rps@thresholds-park:
>     - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#11681])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@i915_pm_rps@thresholds-park.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#4387])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#6245])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-4/igt@i915_query@hwconfig_table.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][60] ([i915#16182] / [i915#4817])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk3/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-rkl:          [PASS][61] -> [INCOMPLETE][62] ([i915#4817])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-7/igt@i915_suspend@sysfs-reader.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#7707])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#1769] / [i915#3555])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
>     - shard-mtlp:         [PASS][65] -> [FAIL][66] ([i915#5956]) +1 other test fail
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-mtlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-mtlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>     - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#14544] / [i915#5286])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-tglu-1:       NOTRUN -> [SKIP][68] ([i915#5286]) +2 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>     - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#5286]) +4 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
>     - shard-glk10:        NOTRUN -> [SKIP][70] +171 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk10/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#5286])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3828])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#3638]) +3 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4538] / [i915#5190]) +5 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#5190])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>     - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#6095]) +9 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#6095]) +203 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#6095]) +69 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#10307] / [i915#10434] / [i915#6095])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#10307] / [i915#6095]) +52 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][81] ([i915#12313])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#14098] / [i915#14544] / [i915#6095]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#14544] / [i915#6095]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#12805])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>     - shard-tglu:         NOTRUN -> [SKIP][85] ([i915#12805])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#6095]) +3 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - shard-rkl:          [PASS][87] -> [INCOMPLETE][88] ([i915#14694] / [i915#15582])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][89] ([i915#14694] / [i915#15582])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][90] ([i915#15582]) +1 other test incomplete
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][91] ([i915#6095]) +34 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#14098] / [i915#6095]) +44 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#12313]) +1 other test skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#13781]) +4 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_chamelium_audio@dp-audio-after-suspend:
>     - shard-tglu-1:       NOTRUN -> [SKIP][95] ([i915#11151])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_chamelium_audio@dp-audio-after-suspend.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#11151])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
>     - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#16471])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
>     - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#16471]) +2 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
>     - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#11151] / [i915#7828]) +2 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
>     - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#11151] / [i915#7828]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#11151] / [i915#7828]) +8 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-4/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-fast:
>     - shard-tglu-1:       NOTRUN -> [SKIP][102] ([i915#11151] / [i915#7828]) +5 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html
> 
>   * igt@kms_color@deep-color:
>     - shard-rkl:          [PASS][103] -> [SKIP][104] ([i915#12655] / [i915#3555])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_color@deep-color.html
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_color@deep-color.html
> 
>   * igt@kms_content_protection@atomic-dpms-hdcp14:
>     - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#15865])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_content_protection@atomic-dpms-hdcp14.html
>     - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#15865])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_content_protection@atomic-dpms-hdcp14.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#15330] / [i915#3299])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@legacy-hdcp14:
>     - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#15865]) +1 other test skip
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-8/igt@kms_content_protection@legacy-hdcp14.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#15865])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x10:
>     - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#3555]) +2 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-max-size:
>     - shard-glk11:        NOTRUN -> [SKIP][111] +26 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk11/igt@kms_cursor_crc@cursor-offscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:
>     - shard-rkl:          [PASS][112] -> [FAIL][113] ([i915#13566]) +1 other test fail
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x10:
>     - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#3555]) +5 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-3/igt@kms_cursor_crc@cursor-random-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-random-64x21@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [FAIL][115] ([i915#13566])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@kms_cursor_crc@cursor-random-64x21@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#13049])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#13049])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-tglu-1:       NOTRUN -> [SKIP][118] ([i915#13049])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
>     - shard-tglu:         [PASS][119] -> [FAIL][120] ([i915#13566]) +1 other test fail
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#3555]) +2 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-glk11:        NOTRUN -> [INCOMPLETE][122] ([i915#12358] / [i915#14152] / [i915#7882])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk11/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>     - shard-glk11:        NOTRUN -> [INCOMPLETE][123] ([i915#12358] / [i915#14152])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk11/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#13046] / [i915#5354])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#4103])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#4103])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#3804])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_dp_aux_dev@basic:
>     - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#1257])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_dp_aux_dev@basic.html
>     - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#1257])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_dp_aux_dev@basic.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-tglu-1:       NOTRUN -> [SKIP][130] ([i915#13749])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#13707]) +1 other test skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#16361]) +1 other test skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-tglu-1:       NOTRUN -> [SKIP][133] ([i915#16361]) +2 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
>     - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#16361])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
>     - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#16361]) +2 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][136] ([i915#9878])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk4/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#3955])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#16084])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-4/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#16081])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@vrr:
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#16600])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_feature_discovery@vrr.html
> 
>   * igt@kms_fence_pin_leak:
>     - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#4881])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_fence_pin_leak.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>     - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#3637] / [i915#9934])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#9934]) +2 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#9934]) +5 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][145] ([i915#12745] / [i915#4839])
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][146] ([i915#12745])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-tglu-1:       NOTRUN -> [SKIP][147] ([i915#3637] / [i915#9934]) +4 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#15643])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
>     - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#15643])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
>     - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#15643])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#15643]) +3 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#15643] / [i915#5190]) +1 other test skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling:
>     - shard-mtlp:         [PASS][153] -> [DMESG-FAIL][154] ([i915#16175])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-mtlp-8/igt@kms_flip_tiling@flip-change-tiling.html
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-mtlp-4/igt@kms_flip_tiling@flip-change-tiling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-rc-ccs-cc-to-4-rc-ccs:
>     - shard-mtlp:         [PASS][155] -> [DMESG-WARN][156] ([i915#16175])
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-mtlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-rc-ccs-cc-to-4-rc-ccs.html
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-mtlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-rc-ccs-cc-to-4-rc-ccs.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-mc-ccs:
>     - shard-mtlp:         [PASS][157] -> [FAIL][158] ([i915#15733]) +1 other test fail
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-mtlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-mc-ccs.html
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-mtlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-mc-ccs.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#15990] / [i915#8708]) +7 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
>     - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#15989]) +21 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-glk:          NOTRUN -> [SKIP][161] +173 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk9/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-cpu:
>     - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#14544]) +5 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#15989]) +8 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-stridechange:
>     - shard-tglu-1:       NOTRUN -> [SKIP][164] ([i915#15989]) +11 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#15102]) +13 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
>     - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#15991] / [i915#5354]) +10 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
>     - shard-tglu-1:       NOTRUN -> [SKIP][167] +52 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#1825]) +7 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][169] +24 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#15991]) +16 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#15990]) +10 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-stridechange:
>     - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#15102]) +18 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-stridechange.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
>     - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#5439]) +1 other test skip
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-rkl:          [PASS][174] -> [SKIP][175] ([i915#15989]) +7 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-1p-rte:
>     - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#15989]) +3 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_frontbuffer_tracking@hdr-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-blt:
>     - shard-glk:          [PASS][177] -> [SKIP][178] +4 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-blt.html
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk1/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#15104] / [i915#15990]) +2 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-tglu-1:       NOTRUN -> [SKIP][180] ([i915#15102]) +22 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#15102] / [i915#3023]) +11 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][182] +83 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
>     - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#15102]) +18 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#16518] / [i915#3555] / [i915#8228])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_hdr@bpc-switch-dpms.html
>     - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#3555] / [i915#8228])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#3555] / [i915#8228])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#3555] / [i915#8228]) +1 other test skip
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#15460])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#15459])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>     - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#15459])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#6301])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
>     - shard-glk:          [PASS][192] -> [INCOMPLETE][193] ([i915#12756] / [i915#13409] / [i915#13476])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-tglu-1:       NOTRUN -> [SKIP][194] ([i915#14712])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
>     - shard-tglu-1:       NOTRUN -> [SKIP][195] ([i915#15709]) +1 other test skip
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
>     - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#15709]) +1 other test skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
>     - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#15709])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
>     - shard-tglu-1:       NOTRUN -> [SKIP][198] ([i915#16386]) +1 other test skip
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5:
>     - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#16386]) +1 other test skip
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-4/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#13958])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_plane_multiple@2x-tiling-x.html
>     - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#13958])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#13046] / [i915#5354] / [i915#9423])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#12343] / [i915#5354])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-4/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc5-pageflip-negative:
>     - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#9685])
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-8/igt@kms_pm_dc@dc5-pageflip-negative.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#15751])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_pm_dc@dc6-dpms.html
>     - shard-tglu:         NOTRUN -> [FAIL][206] ([i915#16479])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_lpsp@screens-disabled:
>     - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#8430])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#15073])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#15073])
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>     - shard-dg1:          [PASS][210] -> [SKIP][211] ([i915#15073]) +1 other test skip
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#11520]) +3 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>     - shard-glk10:        NOTRUN -> [SKIP][213] ([i915#11520]) +4 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#11520])
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
>     - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#11520]) +4 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#11520]) +1 other test skip
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
>     - shard-glk:          NOTRUN -> [SKIP][217] ([i915#11520]) +2 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#9683])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>     - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#9683])
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-tglu-1:       NOTRUN -> [SKIP][220] ([i915#9683])
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>     - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#1072] / [i915#9732]) +16 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@pr-sprite-plane-onoff:
>     - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#9732]) +3 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_psr@pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@psr-cursor-render:
>     - shard-tglu-1:       NOTRUN -> [SKIP][223] ([i915#9732]) +10 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_psr@psr-cursor-render.html
> 
>   * igt@kms_psr@psr2-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#1072] / [i915#9732]) +9 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@kms_psr@psr2-basic.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][225] ([i915#15492] / [i915#16184])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#5289])
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-tglu-1:       NOTRUN -> [SKIP][227] ([i915#5289])
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#8623])
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#9906])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#15243] / [i915#3555])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-5/igt@kms_vrr@flipline.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#3555] / [i915#9906])
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-8/igt@kms_vrr@negative-basic.html
> 
>   * igt@perf@gen12-group-concurrent-oa-buffer-read:
>     - shard-rkl:          [PASS][232] -> [FAIL][233] ([i915#10538])
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-2/igt@perf@gen12-group-concurrent-oa-buffer-read.html
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-2/igt@perf@gen12-group-concurrent-oa-buffer-read.html
> 
>   * igt@perf_pmu@busy-start@vcs1:
>     - shard-mtlp:         [PASS][234] -> [FAIL][235] ([i915#4349]) +2 other tests fail
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-mtlp-4/igt@perf_pmu@busy-start@vcs1.html
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-mtlp-3/igt@perf_pmu@busy-start@vcs1.html
> 
>   * igt@perf_pmu@rc6-suspend:
>     - shard-rkl:          [PASS][236] -> [INCOMPLETE][237] ([i915#13520])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-5/igt@perf_pmu@rc6-suspend.html
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-4/igt@perf_pmu@rc6-suspend.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#8516])
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@prime_udl@share-import:
>     - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#16420]) +1 other test skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@prime_udl@share-import.html
> 
>   * igt@prime_vgem@basic-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#3708] / [i915#4077])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-3/igt@prime_vgem@basic-gtt.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#14544] / [i915#3708])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-random:
>     - shard-tglu-1:       NOTRUN -> [SKIP][242] ([i915#16066]) +9 other tests skip
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-random.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#9917])
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_pm_rpm@system-suspend:
>     - shard-glk:          [INCOMPLETE][244] ([i915#13356]) -> [PASS][245]
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-glk8/igt@i915_pm_rpm@system-suspend.html
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk1/igt@i915_pm_rpm@system-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-rkl:          [INCOMPLETE][246] ([i915#12358] / [i915#14152]) -> [PASS][247]
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend.html
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-rkl:          [INCOMPLETE][248] ([i915#9878]) -> [PASS][249]
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-rkl:          [FAIL][250] ([i915#13027]) -> [PASS][251]
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>     - shard-tglu:         [FAIL][252] ([i915#13027]) -> [PASS][253] +1 other test pass
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-tglu-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-tglu-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-rkl:          [INCOMPLETE][254] ([i915#16276] / [i915#6113]) -> [PASS][255] +1 other test pass
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-4/igt@kms_flip@flip-vs-suspend.html
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-4/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite:
>     - shard-rkl:          [SKIP][256] ([i915#15989]) -> [PASS][257] +4 other tests pass
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite.html
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt:
>     - shard-glk:          [SKIP][258] -> [PASS][259] +14 other tests pass
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-glk9/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][260] ([i915#15989]) -> [PASS][261] +5 other tests pass
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-mtlp:         [FAIL][262] -> [PASS][263]
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-mtlp-4/igt@kms_hdmi_inject@inject-audio.html
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-mtlp-3/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-dg2:          [SKIP][264] ([i915#16518] / [i915#3555] / [i915#8228]) -> [PASS][265]
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-dg2-1/igt@kms_hdr@invalid-metadata-sizes.html
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1:
>     - shard-mtlp:         [FAIL][266] ([i915#15871]) -> [PASS][267] +4 other tests pass
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-mtlp-4/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1.html
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-mtlp-3/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-glk:          [DMESG-FAIL][268] ([i915#118]) -> [PASS][269]
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-glk3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-dg2:          [SKIP][270] ([i915#15073]) -> [PASS][271]
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-dg2-5/igt@kms_pm_rpm@dpms-lpsp.html
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-rkl:          [SKIP][272] ([i915#15073]) -> [PASS][273]
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-5/igt@kms_pm_rpm@dpms-non-lpsp.html
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-1/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-dg1:          [SKIP][274] ([i915#15073]) -> [PASS][275]
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp.html
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_vblank@query-busy:
>     - shard-dg1:          [DMESG-WARN][276] ([i915#4423]) -> [PASS][277] +3 other tests pass
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-dg1-15/igt@kms_vblank@query-busy.html
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg1-16/igt@kms_vblank@query-busy.html
> 
>   * igt@perf_pmu@busy-idle@vecs0:
>     - shard-glk:          [FAIL][278] -> [PASS][279] +2 other tests pass
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-glk2/igt@perf_pmu@busy-idle@vecs0.html
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk1/igt@perf_pmu@busy-idle@vecs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_ccs@ctrl-surf-copy-new-ctx:
>     - shard-rkl:          [SKIP][280] ([i915#9323]) -> [SKIP][281] ([i915#14544] / [i915#9323])
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@gem_exec_reloc@basic-gtt-cpu:
>     - shard-rkl:          [SKIP][282] ([i915#14544] / [i915#3281]) -> [SKIP][283] ([i915#3281]) +5 other tests skip
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu.html
> 
>   * igt@gem_exec_reloc@basic-write-read:
>     - shard-rkl:          [SKIP][284] ([i915#3281]) -> [SKIP][285] ([i915#14544] / [i915#3281]) +2 other tests skip
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html
> 
>   * igt@gem_lmem_evict@dontneed-evict-race:
>     - shard-rkl:          [SKIP][286] ([i915#4613] / [i915#7582]) -> [SKIP][287] ([i915#14544] / [i915#4613] / [i915#7582])
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@gem_lmem_evict@dontneed-evict-race.html
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html
> 
>   * igt@gem_lmem_swapping@massive:
>     - shard-rkl:          [SKIP][288] ([i915#4613]) -> [SKIP][289] ([i915#14544] / [i915#4613])
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@gem_lmem_swapping@massive.html
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@gem_lmem_swapping@massive.html
> 
>   * igt@gem_lmem_swapping@parallel-multi:
>     - shard-rkl:          [SKIP][290] ([i915#14544] / [i915#4613]) -> [SKIP][291] ([i915#4613])
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@gem_lmem_swapping@parallel-multi.html
> 
>   * igt@gem_set_tiling_vs_pwrite:
>     - shard-rkl:          [SKIP][292] ([i915#14544] / [i915#3282]) -> [SKIP][293] ([i915#3282]) +2 other tests skip
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@gem_set_tiling_vs_pwrite.html
> 
>   * igt@gem_userptr_blits@readonly-pwrite-unsync:
>     - shard-rkl:          [SKIP][294] ([i915#14544] / [i915#3297]) -> [SKIP][295] ([i915#3297])
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>   * igt@gen9_exec_parse@valid-registers:
>     - shard-rkl:          [SKIP][296] ([i915#2527]) -> [SKIP][297] ([i915#14544] / [i915#2527])
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@gen9_exec_parse@valid-registers.html
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-rkl:          [SKIP][298] ([i915#14544] / [i915#16109]) -> [SKIP][299] ([i915#16109])
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@i915_query@query-topology-known-pci-ids.html
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@i915_query@query-topology-known-pci-ids.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-rkl:          [SKIP][300] ([i915#14544] / [i915#9531]) -> [SKIP][301] ([i915#9531])
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-rkl:          [SKIP][302] ([i915#14544] / [i915#5286]) -> [SKIP][303] ([i915#5286])
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-rkl:          [SKIP][304] ([i915#5286]) -> [SKIP][305] ([i915#14544] / [i915#5286]) +2 other tests skip
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-rkl:          [SKIP][306] ([i915#12313] / [i915#14544]) -> [SKIP][307] ([i915#12313])
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
>     - shard-dg1:          [SKIP][308] ([i915#4423] / [i915#6095]) -> [SKIP][309] ([i915#6095])
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-dg1-19/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg1-14/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          [SKIP][310] ([i915#6095]) -> [SKIP][311] ([i915#14544] / [i915#6095]) +3 other tests skip
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
>     - shard-rkl:          [SKIP][312] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][313] ([i915#14098] / [i915#6095]) +4 other tests skip
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          [SKIP][314] ([i915#14544] / [i915#6095]) -> [SKIP][315] ([i915#6095]) +3 other tests skip
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
>     - shard-rkl:          [SKIP][316] ([i915#14098] / [i915#6095]) -> [SKIP][317] ([i915#14098] / [i915#14544] / [i915#6095]) +3 other tests skip
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_chamelium_frames@vga-frame-dump:
>     - shard-rkl:          [SKIP][318] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][319] ([i915#11151] / [i915#7828])
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_chamelium_frames@vga-frame-dump.html
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_chamelium_frames@vga-frame-dump.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
>     - shard-rkl:          [SKIP][320] ([i915#15330]) -> [SKIP][321] ([i915#14544] / [i915#15330])
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-rkl:          [SKIP][322] ([i915#14544] / [i915#15865]) -> [SKIP][323] ([i915#15865]) +2 other tests skip
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_content_protection@srm.html
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-rkl:          [SKIP][324] ([i915#13049] / [i915#14544]) -> [SKIP][325] ([i915#13049]) +1 other test skip
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-max-size:
>     - shard-rkl:          [SKIP][326] ([i915#14544] / [i915#3555]) -> [SKIP][327] ([i915#3555])
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-max-size.html
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2:          [SKIP][328] ([i915#13049]) -> [SKIP][329] ([i915#13049] / [i915#3359])
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x512.html
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-10/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-rkl:          [SKIP][330] ([i915#13049]) -> [SKIP][331] ([i915#13049] / [i915#14544])
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
>     - shard-rkl:          [SKIP][332] ([i915#16361]) -> [SKIP][333] ([i915#14544] / [i915#16361])
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-rkl:          [SKIP][334] ([i915#14544] / [i915#16361]) -> [SKIP][335] ([i915#16361]) +2 other tests skip
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_feature_discovery@vrr:
>     - shard-rkl:          [SKIP][336] ([i915#16600]) -> [SKIP][337] ([i915#14544] / [i915#16600])
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@kms_feature_discovery@vrr.html
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_feature_discovery@vrr.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-rkl:          [SKIP][338] ([i915#9934]) -> [SKIP][339] ([i915#14544] / [i915#9934])
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-rkl:          [SKIP][340] ([i915#14544] / [i915#9934]) -> [SKIP][341] ([i915#9934]) +5 other tests skip
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-glk:          [INCOMPLETE][342] ([i915#12745] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][343] ([i915#12314] / [i915#12745] / [i915#4839] / [i915#6113])
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-glk3/igt@kms_flip@flip-vs-suspend.html
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk5/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>     - shard-glk:          [INCOMPLETE][344] ([i915#12745] / [i915#6113]) -> [INCOMPLETE][345] ([i915#12314] / [i915#12745] / [i915#6113])
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-glk3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-rkl:          [SKIP][346] ([i915#14544] / [i915#15643]) -> [SKIP][347] ([i915#15643])
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
>     - shard-rkl:          [SKIP][348] ([i915#15643]) -> [SKIP][349] ([i915#14544] / [i915#15643])
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-rkl:          [SKIP][350] ([i915#1825]) -> [SKIP][351] ([i915#14544] / [i915#1825])
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite:
>     - shard-rkl:          [SKIP][352] ([i915#14544]) -> [SKIP][353] +26 other tests skip
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
>     - shard-rkl:          [SKIP][354] ([i915#14544] / [i915#5439]) -> [SKIP][355] ([i915#5439])
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
>     - shard-rkl:          [SKIP][356] ([i915#14544] / [i915#15102]) -> [SKIP][357] ([i915#15102]) +10 other tests skip
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-pwrite:
>     - shard-dg1:          [SKIP][358] ([i915#4423]) -> [SKIP][359]
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-pwrite.html
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
>     - shard-rkl:          [SKIP][360] ([i915#15102]) -> [SKIP][361] ([i915#14544] / [i915#15102]) +7 other tests skip
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
>     - shard-rkl:          [SKIP][362] ([i915#15102] / [i915#3023]) -> [SKIP][363] ([i915#14544] / [i915#15102] / [i915#3023]) +2 other tests skip
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>     - shard-rkl:          [SKIP][364] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][365] ([i915#15102] / [i915#3023]) +5 other tests skip
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-rkl:          [SKIP][366] ([i915#14544] / [i915#1825]) -> [SKIP][367] ([i915#1825]) +3 other tests skip
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-render:
>     - shard-dg1:          [SKIP][368] ([i915#15102]) -> [SKIP][369] ([i915#15102] / [i915#4423])
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-dg1-12/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-render.html
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg1-13/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
>     - shard-rkl:          [SKIP][370] -> [SKIP][371] ([i915#14544]) +23 other tests skip
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-rkl:          [SKIP][372] ([i915#14544] / [i915#15458]) -> [SKIP][373] ([i915#15458])
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
>     - shard-rkl:          [SKIP][374] ([i915#15709]) -> [SKIP][375] ([i915#14544] / [i915#15709])
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
>     - shard-rkl:          [SKIP][376] ([i915#14544] / [i915#15709]) -> [SKIP][377] ([i915#15709])
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
>     - shard-rkl:          [SKIP][378] ([i915#15329]) -> [SKIP][379] ([i915#14544] / [i915#15329]) +3 other tests skip
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
>     - shard-rkl:          [SKIP][380] ([i915#14544] / [i915#15329]) -> [SKIP][381] ([i915#15329]) +7 other tests skip
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-rkl:          [SKIP][382] ([i915#3828]) -> [SKIP][383] ([i915#9340])
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html
>     - shard-dg1:          [SKIP][384] ([i915#9340]) -> [SKIP][385] ([i915#3828])
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-dg1-19/igt@kms_pm_lpsp@kms-lpsp.html
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-rkl:          [SKIP][386] ([i915#14544] / [i915#15073]) -> [SKIP][387] ([i915#15073])
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@package-g7:
>     - shard-rkl:          [SKIP][388] ([i915#14544] / [i915#15403]) -> [SKIP][389] ([i915#15403])
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_pm_rpm@package-g7.html
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_pm_rpm@package-g7.html
> 
>   * igt@kms_pm_rpm@pc8-residency:
>     - shard-dg1:          [SKIP][390] -> [SKIP][391] ([i915#4423])
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-dg1-18/igt@kms_pm_rpm@pc8-residency.html
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg1-12/igt@kms_pm_rpm@pc8-residency.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>     - shard-rkl:          [SKIP][392] ([i915#11520] / [i915#14544]) -> [SKIP][393] ([i915#11520]) +2 other tests skip
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr@psr-no-drrs:
>     - shard-rkl:          [SKIP][394] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][395] ([i915#1072] / [i915#9732]) +8 other tests skip
>    [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@kms_psr@psr-no-drrs.html
>    [395]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@kms_psr@psr-no-drrs.html
> 
>   * igt@kms_psr@psr-suspend:
>     - shard-rkl:          [SKIP][396] ([i915#1072] / [i915#9732]) -> [SKIP][397] ([i915#1072] / [i915#14544] / [i915#9732]) +6 other tests skip
>    [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-3/igt@kms_psr@psr-suspend.html
>    [397]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-6/igt@kms_psr@psr-suspend.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2:          [SKIP][398] ([i915#12755] / [i915#15867] / [i915#5190]) -> [SKIP][399] ([i915#15867] / [i915#5190])
>    [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [399]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-rkl:          [SKIP][400] ([i915#14544] / [i915#3708]) -> [SKIP][401] ([i915#3708])
>    [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18820/shard-rkl-6/igt@prime_vgem@fence-read-hang.html
>    [401]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/shard-rkl-7/igt@prime_vgem@fence-read-hang.html
> 
>   
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>   [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
>   [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
>   [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
>   [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
>   [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
>   [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
>   [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
>   [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
>   [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
>   [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
>   [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
>   [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
>   [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
>   [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
>   [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
>   [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
>   [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
>   [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
>   [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
>   [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
>   [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
>   [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
>   [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
>   [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
>   [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
>   [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
>   [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
>   [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
>   [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
>   [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
>   [i915#15060]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15060
>   [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
>   [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
>   [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
>   [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
>   [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
>   [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
>   [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
>   [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
>   [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
>   [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
>   [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
>   [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
>   [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
>   [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
>   [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
>   [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
>   [i915#15751]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15751
>   [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
>   [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
>   [i915#15871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15871
>   [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
>   [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
>   [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
>   [i915#16066]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066
>   [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
>   [i915#16084]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084
>   [i915#16090]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16090
>   [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
>   [i915#16175]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16175
>   [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
>   [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
>   [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
>   [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
>   [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
>   [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
>   [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
>   [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
>   [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
>   [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
>   [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>   [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
>   [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>   [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
>   [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>   [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
>   [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>   [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
>   [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
>   [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
>   [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>   [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
>   [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
>   [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
>   [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
>   [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
>   [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>   [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289
>   [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>   [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
>   [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>   [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
>   [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
>   [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
>   [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_18820 -> Patchwork_170425v1
> 
>   CI-20190529: 20190529
>   CI_DRM_18820: 381c2c353cae7ef6725a3cb7db597d0e2067537d @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   Patchwork_170425v1: 381c2c353cae7ef6725a3cb7db597d0e2067537d @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170425v1/index.html
