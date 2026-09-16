Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D75FC88E5C
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2026 11:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EA810E031;
	Wed, 16 Sep 2026 11:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jS7UmVO8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263BE10E031
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Sep 2026 11:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557483; x=1821093483;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=hYDpwNTUFrcPYYrtvaivtTUp2V1H1yaIULwLDKTeWDA=;
 b=jS7UmVO82mDvtCxi1l1UcDCz9T6lDCze7DrM2OvxPH+AdugtUspdqjKV
 x527/z6Pm8N4upfzESyxxulth4tV3lhMbN18OsfG13vYWYv/g+w9Fgbu+
 drbiPdVR00RbJD/OHdqhbHny+jFF/1V4KAt/XSCftmaXTtbROPo2R/NTF
 9CLh9ZraSb3q+cuFSqbrWvcVsVE4rYX9j3YAHe9Y4WYrH1P5jajCsT6z2
 L/eDWjd4++ucLUAwrOmgKVrzQOJF2N9dtvHBCxQb/+6IiPQGyO+/plcF9
 yVYWXSaR0cg8s1oWiPQboZk+wfjufSU13ARCtcxR+suYADZXyj8ZNnvPc Q==;
X-CSE-ConnectionGUID: QGTfKYu7QGOqYZvQaySrZA==
X-CSE-MsgGUID: qVX9aINeSVSElYdxNoQ21Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92437882"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92437882"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:18:02 -0700
X-CSE-ConnectionGUID: nC8L7iiTTXaLvYaTE9i17w==
X-CSE-MsgGUID: e9EXT1iSSwGBnf4+IF9+yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1534938"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:18:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:18:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 04:18:02 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:18:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XP6VFNnTBx/4jYi/rRQmMhNQC27+PCkag1zijbQyCbvqoEzoimRdaXSXqpvoIth6wyHrJhH1LH/+j+yXZoqDEJOmtSWbSYVQKjpenpt0HUUQQGTZ/53Zktzg8Gyg1rtp1eCyKrua0/zkhD6zxujP1dB5G1BKGxX5bo0tTGzcycG6ZYqT1+BXwT4hwcJsDe/XwVFMJqgeTs80DpOut30UOxSpZNYkTfRqZO6p/yRJ7GRxUk1xUs3CfhAivk1jXxV0R6tYLHMdp61wlznbCw2Ex8Ia1o5ZYrwIm8tdqtAbYUDK9KyUzx6kTGY1RjLNsTEUKIeg4b4JRaDImZrjtQsu3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8NiQloa0wunBVfLUi8QuUpFmdM3JawSlfNaEtG3Qfw=;
 b=bere5DlCOqd8Od5iDZCRZXyetVsekQdHw+VKfjr4qq64vgRmJuF67eR8kmRsYUyy1FYUjhA28Ksx/SXrVeHTl+k48khXXdbuIYdncmARxtwxTC/5tusfWy3lhsi/zzR8du2NHWXjm1xk4kQLHMcZJ3pWKDhoblb/IVbQUahU3e/MvaohDMr+tJUNxgO1vwm4hLlii9x/8d/m4FTAixqHfjeKF6TudmxZpMOCxQm0KZWMOIXsfFMMSK05I7p8s0wNgQ/FRXCO+MMoj8KM5rbCGdYO2u14Ge1v+PfOX8gF2TiiTfx4bUKAYrHZW0sIfD9+dSbfHzDzdpBRqpkXB4xFIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by DS0PR11MB7786.namprd11.prod.outlook.com (2603:10b6:8:f2::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.12; Wed, 16 Sep 2026 11:17:56 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 11:17:56 +0000
Date: Wed, 16 Sep 2026 14:17:50 +0300
From: Imre Deak <imre.deak@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>
CC: <intel-gfx@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIGk5MTUuQ0kuRnVsbDogc3Vj?=
 =?utf-8?Q?cess_for_series_starting_with_=5B1=2F2=5D_drm=2Fi915=2Fdp=5Fmst?=
 =?utf-8?Q?=3A?= Fix configuring FEC for a disconnected stream
Message-ID: <aqp63uEwGm3PRH0m@ideak-desk.lan>
References: <20260907174413.741851-1-imre.deak@intel.com>
 <178884270008.132775.5675930735600233497@61270ab9df2a>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178884270008.132775.5675930735600233497@61270ab9df2a>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GV3PEPF0001DBA9.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6f8) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|DS0PR11MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: ca7a1e17-9fb1-4d9d-334a-08df13e42813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|4143699003|11063799006|5023799004|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: SlYdIKw/6UZt76FMvxArX2AlqmgEOhhsfzbMEC43zfDZGWwnI0I3of+RwG/94MpiJKuNTBk5k65K8ee8bCpW+r7jNIi2o0Op6KGFN/C+od30oR6raYzAdEXG32kZlryZLI/qfabZfOg2BGVtabtEOQcgz3eCELruzWHJCXMbYS4T2+LKkDsJGliZ4ZDsoxlMyh+wo1K8MuPKBuAii7SLfpaOmvuzaVIelP5sd4hOaRGuy7mNLOSZwEsYm78Vy70o6tNGwgcmjWzM3y0gwlcZQXBLxH0hA/oifLQo54zYwqRjJPN87HrDR5Ok0IW1F7yvBW+v4jYni55N21gbESDV3Fi3OFv8sO5psQ9dEL1L1yndHr+MlOxtx+ZSsJv1sn/go7WbEL+crjBg1+mQ510qh16WhkG0RocEs3K5RRiKD14QVw9jliveFG/ldyLI40ibVnxmWCWDftIhq4p/+thdEzPVqGwWV9L8appe2SeouHJ5rMpN8I3Tv8+JEkeqYVn+m/377316VD2v6GvAXRJQQhCylkZ1MHEsFRomCRnW2iBzGxaBlPqCT1JT2FGdCzUXxQgcDJ91BixOS7SE0HvRx+I4hcdr2VoDARoQZRI/NYg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(4143699003)(11063799006)(5023799004)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3a5goSRUpgTxZLJX+/7g1enuW9UEw54XxAL52F7vZHVeeIeIDBdlPJm3OINa?=
 =?us-ascii?Q?gfkzz3FTV5A6BbrTdkqfFQ615TRkMcOJfj/utfKwdGfICw8V/mAcTqISvLmA?=
 =?us-ascii?Q?1tn8pQeVer6exeJcwTwC7mwIUdpc2BQm1lkCq1+yaon8KggwC60IKtnGutdW?=
 =?us-ascii?Q?rjLhWXvhJi8em35uxMZk6vXJWKdALFFK4nPpr1QwmC5xEhxJRdHIIbN/3KMA?=
 =?us-ascii?Q?tmRQ57buq4qIcoSydFtc1ot5JN30jBH+wwtjN51XHs43UGmElR2GbxojiSny?=
 =?us-ascii?Q?CCQr4D0SdOsCTBgqW//6c2p5cF2s2Wh1x7ACvAa5D3KfQt6GCFCbvD2mJN5o?=
 =?us-ascii?Q?vqU6NOMVMY1NoZiST2tOnNwkwrTMO9065YqGiWgx7YQjihkoy8zElfeyEnCN?=
 =?us-ascii?Q?7H9gPQ49Nx+RrVUSDKppjCZX+NENh+l1VLqKJx4/QdkbJdtsHmYDAemb8aqE?=
 =?us-ascii?Q?wKLsgpOad3cNRLOluuVwvwarq7mgWH+0tB6w3776d6hoioqJRZZ+83sugRPM?=
 =?us-ascii?Q?OAXuLIYHih2KjB7/muYUvRv0h5yN1ztldOeRPcsLUkr7zalhJiL2Q6jCZZB+?=
 =?us-ascii?Q?ulAIdPN2bdCCNI1aVCKLgm4LAJM/HgrcW38LRWLjFAe1XjAAXoKbPy8SBgSR?=
 =?us-ascii?Q?vDe3iMlWCf3hBUAlSkPTSb4SESuEZ2U1c5EXtnA3ERL3JdF5ZF5kr2/ABglS?=
 =?us-ascii?Q?f9+Tf4mutR2/zULg2uXWaUKTT18l9yfirXzzET8a/0KGzcwMeI7+GnXAwHSc?=
 =?us-ascii?Q?ybCl9MiJX+LbOpOuoQLDE+QOaLfmywreOK0vH2FLQZSuQq2L9592NoQ+5rth?=
 =?us-ascii?Q?NW0A+xs41rNQmmoHSkfPm3eR9l5Fb1kcOBY2Jw0xarJPJXyj/BGkrfgSk3ZU?=
 =?us-ascii?Q?ZZpdRh9IRLH3DZtid1YvM8GYWe11u7yB1kENemaW2UwERTHoigrZ3zOYqBi3?=
 =?us-ascii?Q?tyLxF9WllGrLbw3jQQ/TPGvrhX3UiBZ5ssZHfa8fWPzLYF/4PPhovsOtlpGo?=
 =?us-ascii?Q?Q5dt3Mg25+A4m3Rs/cC8QNQE+BqerNwMT2690yIL2v06bqmtzKvatbVifTR+?=
 =?us-ascii?Q?UHjIYlBwyxKtRxkTHscBof9xvkvZ296+D8Pg3Knna1n1WM1AiiGpnHRAZJzy?=
 =?us-ascii?Q?ApIfazLECZ0cjHr25yNGtL1WvZLtfnGvXn8WI4qrvJoMI88MSBwy5Qtu61KD?=
 =?us-ascii?Q?IPiBTjOljPvW4/ZDSC2GKmq+44QvegaPaVcC2b4HESJgm8sPAytaFCwU/Kok?=
 =?us-ascii?Q?X4Aub+A5vxmDxZsHK8YeHRD45VnHOzBfiZxcs8iZIzV7XVQhrR7mtALNY66K?=
 =?us-ascii?Q?R9k4u13/RL6BnenezKUrzTR7lZK+ZxNVQhIyCG4z0MGsrOW+nuLYQpgWzA8n?=
 =?us-ascii?Q?hU2YZSjaEhXEKY7Eb7HKD2v7JOgd7Zj/8YWym6Eplk2432i69wjj3rlfdLH5?=
 =?us-ascii?Q?RmgV6RyVSS8womoesh+8sXnqi5vsmJLtQ+M+DWca3sy/JOy/2bWcYbNaBIp3?=
 =?us-ascii?Q?azDqvubwEXiIWQ3qoudfgZ8JIq3znx5RlMQmI9PauLsjIVgSwlXmOkGkqahY?=
 =?us-ascii?Q?1o6znFrTGLHtmbmWlCJ9Eu0Lhmr+WsJEdt3OOYfan7mRUhxqse5v/YhUPhKd?=
 =?us-ascii?Q?uTr+LI6CcpKVzCbLFdrGJLejbTT8yYeeOm8k9orVgfhdaKvj6sbOGsbxupql?=
 =?us-ascii?Q?lEDCAgFt9BE6B12yt8kZPkDwLLQY6ZwVWzNIOeFt8WQjevtbIfaKxJ0UoAWm?=
 =?us-ascii?Q?uOd1c3q7KQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: dRl6uo/w/N/dLt/dQd/SFthya4ysn29kpeV3Tmq4jlpAlPaJzS/hT8BlNW/g0zFAFyks4VwrrcPd+BMStwbh8NZgj2liqT1DAXfI4IJoOZYu2r5lhcsfq/RomJdzI2QhICbCgUt99RXLlNBA+JG690kbEuAGdksxlLPXUf+gqZCKvTbimMIdF/YOmCyyWUy5rI3gUugXgzhBZVX1Zsh/wa5licb9Cav0rdoeysWMHLLQrHoZzL68aTeapErWdBKmLQL7MSJYAQdTcGmXLPxxJc4uxinYFkc4+GPTTc0EKD51ZjV/Lg5yKiIVdLEjDMu6Tw7zzTGgMndX88sj4emtrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7a1e17-9fb1-4d9d-334a-08df13e42813
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:17:56.3552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCR4RCaDqKw8Px4X27ExMjuLN0hdr4vF3mlDRF8L4s54Lj4qiAh+e2Y7i3pSOhSqblsXZcCg9VDQDhRkJHKTtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7786
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

On Tue, Sep 08, 2026 at 04:45:00AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/2] drm/i915/dp_mst: Fix configuring FEC for a disconnected stream
> URL   : https://patchwork.freedesktop.org/series/173531/
> State : success

Thanks for the review, patchset is pushed to drm-intel-next.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_19097_full -> Patchwork_173531v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_19097_full and Patchwork_173531v1_full:
> 
> ### New IGT tests (3) ###
> 
>   * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-a-hdmi-a-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.57] s
> 
>   * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-d-hdmi-a-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.41] s
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-c-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.59] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_173531v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-dg1:          NOTRUN -> [SKIP][1] ([i915#6230])
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@api_intel_bb@crc32.html
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-tglu-1:       NOTRUN -> [SKIP][2] ([i915#11078])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@device_reset@cold-reset-bound.html
>     - shard-dg1:          NOTRUN -> [SKIP][3] ([i915#11078]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@device_reset@cold-reset-bound.html
> 
>   * igt@gem_ccs@block-multicopy-compressed:
>     - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#9323])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html
> 
>   * igt@gem_ccs@large-ctrl-surf-copy:
>     - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#13008])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-18/igt@gem_ccs@large-ctrl-surf-copy.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-tglu:         NOTRUN -> [SKIP][6] ([i915#9323]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-8/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][7] ([i915#13356] / [i915#16348])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg2-7/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-tglu:         NOTRUN -> [SKIP][8] ([i915#6335])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-7/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_ctx_persistence@hang:
>     - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#8555])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@gem_ctx_persistence@hang.html
> 
>   * igt@gem_ctx_sseu@engines:
>     - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#280])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@gem_ctx_sseu@engines.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#280])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-2/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#280])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-7/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_exec_balancer@parallel:
>     - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#4525]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@gem_exec_balancer@parallel.html
>     - shard-tglu:         NOTRUN -> [SKIP][14] ([i915#4525]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-3/igt@gem_exec_balancer@parallel.html
> 
>   * igt@gem_exec_balancer@parallel-balancer:
>     - shard-tglu-1:       NOTRUN -> [SKIP][15] ([i915#4525])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@gem_exec_balancer@parallel-balancer.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-tglu-1:       NOTRUN -> [SKIP][16] ([i915#6334]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_flush@basic-wb-rw-default:
>     - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#3539] / [i915#4852]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-18/igt@gem_exec_flush@basic-wb-rw-default.html
> 
>   * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
>     - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#3281]) +6 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-write-read-noreloc:
>     - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#3281]) +14 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-noreloc.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts:
>     - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#4812]) +3 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-18/igt@gem_exec_schedule@preempt-queue-contexts.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-threaded-none:
>     - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#4860]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-threaded-none.html
> 
>   * igt@gem_lmem_evict@dontneed-evict-race:
>     - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#4613] / [i915#7582])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#4613]) +3 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-glk:          NOTRUN -> [SKIP][24] ([i915#4613]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk6/igt@gem_lmem_swapping@random.html
> 
>   * igt@gem_lmem_swapping@verify-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][25] ([i915#4613]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@gem_lmem_swapping@verify-ccs.html
>     - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#12193])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@gem_lmem_swapping@verify-ccs.html
> 
>   * igt@gem_lmem_swapping@verify-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#4565])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@gem_lmem_swapping@verify-ccs@lmem0.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#4613]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-10/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_media_vme:
>     - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#284])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-8/igt@gem_media_vme.html
> 
>   * igt@gem_mmap_gtt@fault-concurrent-y:
>     - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#4077]) +5 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-18/igt@gem_mmap_gtt@fault-concurrent-y.html
> 
>   * igt@gem_mmap_wc@write-read:
>     - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#4083]) +5 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@gem_mmap_wc@write-read.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-tglu-1:       NOTRUN -> [WARN][32] ([i915#2658])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pxp@hw-rejects-pxp-buffer:
>     - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#13717])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-buffer.html
>     - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#13398])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-10/igt@gem_pxp@hw-rejects-pxp-buffer.html
> 
>   * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>     - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#4270]) +3 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-18/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>   * igt@gem_readwrite@write-bad-handle:
>     - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#3282]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@gem_readwrite@write-bad-handle.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][37] +310 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
> 
>   * igt@gem_set_tiling_vs_pwrite:
>     - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#3282]) +7 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-2/igt@gem_set_tiling_vs_pwrite.html
> 
>   * igt@gem_softpin@evict-snoop-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#4885])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@gem_softpin@evict-snoop-interruptible.html
> 
>   * igt@gem_tiled_pread_basic@basic:
>     - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#15656])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@gem_tiled_pread_basic@basic.html
> 
>   * igt@gem_tiled_pread_pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4079]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@gem_tiled_pread_pwrite.html
> 
>   * igt@gem_userptr_blits@coherency-unsync:
>     - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#3297]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@gem_userptr_blits@coherency-unsync.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#3297] / [i915#3323])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-8/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@forbidden-operations:
>     - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#3282] / [i915#3297])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>     - shard-tglu-1:       NOTRUN -> [SKIP][45] ([i915#3297]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
> 
>   * igt@gem_userptr_blits@relocations:
>     - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#3281] / [i915#3297])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@gem_userptr_blits@relocations.html
> 
>   * igt@gem_userptr_blits@unsync-overlap:
>     - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#3297]) +1 other test skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@gem_userptr_blits@unsync-overlap.html
> 
>   * igt@gem_workarounds@suspend-resume-context:
>     - shard-rkl:          [PASS][48] -> [INCOMPLETE][49] ([i915#13356])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html
> 
>   * igt@gen9_exec_parse@batch-zero-length:
>     - shard-tglu:         NOTRUN -> [SKIP][50] ([i915#2527] / [i915#2856]) +3 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-7/igt@gen9_exec_parse@batch-zero-length.html
> 
>   * igt@gen9_exec_parse@bb-start-far:
>     - shard-tglu-1:       NOTRUN -> [SKIP][51] ([i915#2527] / [i915#2856]) +2 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@gen9_exec_parse@bb-start-far.html
> 
>   * igt@gen9_exec_parse@bb-start-out:
>     - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#2527]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@gen9_exec_parse@bb-start-out.html
> 
>   * igt@gen9_exec_parse@secure-batches:
>     - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#2527]) +2 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@gen9_exec_parse@secure-batches.html
> 
>   * igt@gpu_buddy@gpu_buddy:
>     - shard-tglu-1:       NOTRUN -> [SKIP][54] ([i915#15678])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@gpu_buddy@gpu_buddy.html
> 
>   * igt@i915_drm_fdinfo@busy-check-all:
>     - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#11527]) +5 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@i915_drm_fdinfo@busy-check-all.html
> 
>   * igt@i915_drm_fdinfo@virtual-busy-hang-all:
>     - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#14118])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@i915_drm_fdinfo@virtual-busy-hang-all.html
> 
>   * igt@i915_fb_tiling@basic-x-tiling:
>     - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#13786])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-18/igt@i915_fb_tiling@basic-x-tiling.html
> 
>   * igt@i915_pm_freq_api@freq-basic-api:
>     - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#8399])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@i915_pm_freq_api@freq-basic-api.html
> 
>   * igt@i915_pm_freq_api@freq-reset-multiple:
>     - shard-tglu-1:       NOTRUN -> [SKIP][59] ([i915#8399]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html
> 
>   * igt@i915_pm_rc6_residency@media-rc6-accuracy:
>     - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#16080] / [i915#16166])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle:
>     - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#14498])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#4387])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@i915_pm_sseu@full-enable.html
>     - shard-tglu:         NOTRUN -> [SKIP][63] ([i915#4387])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-10/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_query@test-query-geometry-subslices:
>     - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#5723])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@i915_query@test-query-geometry-subslices.html
> 
>   * igt@i915_suspend@forcewake:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][65] ([i915#16182] / [i915#4817])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk2/igt@i915_suspend@forcewake.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-glk11:        NOTRUN -> [INCOMPLETE][66] ([i915#16182] / [i915#4817])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk11/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#7707])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-3/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
>     - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4212])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-dg1:          [PASS][69] -> [FAIL][70] ([i915#14888])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-dg1-15/igt@kms_async_flips@alternate-sync-async-flip.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-16/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:
>     - shard-glk:          [PASS][71] -> [FAIL][72] ([i915#14888]) +1 other test fail
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [FAIL][73] ([i915#14888])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-16/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [ABORT][74] ([i915#15132])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#1769] / [i915#3555])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [ABORT][76] ([i915#16837] / [i915#16866]) +1 other test abort
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-glk11:        NOTRUN -> [SKIP][77] ([i915#1769])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>     - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#5286]) +6 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
>     - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#5286]) +2 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4538] / [i915#5286]) +3 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-tglu-1:       NOTRUN -> [SKIP][81] ([i915#5286]) +3 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#3638]) +4 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#3638]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4538]) +2 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-rkl:          NOTRUN -> [SKIP][85] +110 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:
>     - shard-glk11:        NOTRUN -> [SKIP][86] +75 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk11/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][87] ([i915#12313])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#14544] / [i915#6095]) +5 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#6095]) +154 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-16/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#12313])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][91] ([i915#6095]) +39 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#6095]) +7 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#6095]) +59 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][94] ([i915#14694] / [i915#15582]) +1 other test incomplete
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#12313]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#6095]) +61 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#14098] / [i915#14544] / [i915#6095]) +2 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#10307] / [i915#6095]) +76 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#14098] / [i915#6095]) +47 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#3742])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#3742])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-3/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#3742])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_audio@dp-audio-after-suspend:
>     - shard-tglu-1:       NOTRUN -> [SKIP][104] ([i915#11151])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_chamelium_audio@dp-audio-after-suspend.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
>     - shard-tglu-1:       NOTRUN -> [SKIP][105] ([i915#16471])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
>     - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#16471]) +2 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-8/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
>     - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#16471]) +3 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-tglu-1:       NOTRUN -> [SKIP][108] ([i915#11151] / [i915#7828]) +5 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#11151] / [i915#7828]) +4 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#11151] / [i915#7828]) +7 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#11151] / [i915#7828]) +7 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-18/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_color@deep-color:
>     - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#12655] / [i915#3555])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-8/igt@kms_color@deep-color.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#15865]) +2 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#15330] / [i915#3299])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
>     - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#15330]) +1 other test skip
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
>     - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#15330]) +1 other test skip
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#15330] / [i915#3116])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-8/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@legacy-hdcp14:
>     - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#15865]) +1 other test skip
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-18/igt@kms_content_protection@legacy-hdcp14.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#15865]) +1 other test skip
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-3/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][120] ([i915#15865]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x42:
>     - shard-rkl:          NOTRUN -> [FAIL][121] ([i915#13566]) +8 other tests fail
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85:
>     - shard-tglu:         NOTRUN -> [FAIL][122] ([i915#13566]) +3 other tests fail
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-tglu-1:       NOTRUN -> [SKIP][123] ([i915#3555]) +3 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#13049])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
>     - shard-tglu:         [PASS][125] -> [FAIL][126] ([i915#13566]) +3 other tests fail
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-tglu-3/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-5/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#13049])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#3555]) +2 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#13049])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>     - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#13049])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x32:
>     - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#3555]) +5 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][132] ([i915#12358] / [i915#14152] / [i915#7882])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk10/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][133] ([i915#12358] / [i915#14152])
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk10/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-tglu-1:       NOTRUN -> [SKIP][134] ([i915#4103]) +1 other test skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#4103])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#9723])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>     - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#9723])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#13691])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#13748])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_dp_link_training@uhbr-mst.html
>     - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#13748])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-3/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-tglu-1:       NOTRUN -> [SKIP][141] ([i915#16867])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
>     - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#16867])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-18/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
> 
>   * igt@kms_dsc@dsc-basic-ultrajoiner:
>     - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#16361]) +3 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@kms_dsc@dsc-basic-ultrajoiner.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#16361]) +2 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-8/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_dsc@dsc-with-formats-ultrajoiner:
>     - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#16361]) +3 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-8/igt@kms_dsc@dsc-with-formats-ultrajoiner.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
>     - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#16361]) +1 other test skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-glk11:        NOTRUN -> [INCOMPLETE][147] ([i915#9878])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk11/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#16081])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-10/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#16081]) +1 other test skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-2/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@dsc:
>     - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#16600])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-8/igt@kms_feature_discovery@dsc.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#658])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-8/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-tglu-1:       NOTRUN -> [SKIP][152] ([i915#658])
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_feature_discovery@psr2.html
>     - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#658])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_feature_discovery@vrr:
>     - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#16600])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@kms_feature_discovery@vrr.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#3637] / [i915#9934]) +4 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank.html
>     - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#9934]) +5 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#3637] / [i915#9934]) +7 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-10/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#9934]) +13 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-8/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank:
>     - shard-dg1:          [PASS][159] -> [FAIL][160] ([i915#14600])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-dg1-18/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-14/igt@kms_flip@flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:
>     - shard-dg1:          NOTRUN -> [FAIL][161] ([i915#14600])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-14/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@b-hdmi-a1:
>     - shard-snb:          [PASS][162] -> [FAIL][163] ([i915#10826])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-snb5/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@b-hdmi-a1.html
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-snb6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-dg1:          [PASS][164] -> [FAIL][165] ([i915#13027]) +1 other test fail
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-dg1-16/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-19/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-glk11:        NOTRUN -> [INCOMPLETE][166] ([i915#12745] / [i915#4839])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk11/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>     - shard-glk11:        NOTRUN -> [INCOMPLETE][167] ([i915#12745])
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk11/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race:
>     - shard-tglu:         [PASS][168] -> [ABORT][169] ([i915#16838] / [i915#16876])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-tglu-8/igt@kms_flip@modeset-vs-vblank-race.html
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-8/igt@kms_flip@modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a1:
>     - shard-tglu:         [PASS][170] -> [ABORT][171] ([i915#16866] / [i915#16876])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-tglu-8/igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a1.html
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-8/igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#15643]) +1 other test skip
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>     - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#15643]) +1 other test skip
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
>     - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#15643]) +2 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#15643])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#15104] / [i915#15990]) +1 other test skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg1:          NOTRUN -> [SKIP][177] +60 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#15990] / [i915#8708]) +5 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][179] ([i915#10056] / [i915#16593])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk8/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:
>     - shard-tglu-1:       NOTRUN -> [SKIP][180] ([i915#15989]) +10 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-rkl:          [PASS][181] -> [SKIP][182] ([i915#15989]) +3 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:
>     - shard-glk:          [PASS][183] -> [SKIP][184] +7 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:
>     - shard-tglu-1:       NOTRUN -> [SKIP][185] +64 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
>     - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#5439]) +1 other test skip
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
>     - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#15989]) +26 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
>     - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#15102]) +28 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#5439])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#15102]) +25 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-indfb-fliptrack-mmap-gtt:
>     - shard-glk10:        NOTRUN -> [SKIP][191] +76 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-indfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#15990]) +12 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
>     - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#5439])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-pgflip-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#15989]) +16 other tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#15989]) +12 other tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#15102]) +52 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#1825]) +7 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-tglu:         NOTRUN -> [SKIP][198] +87 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#15102]) +35 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#15102])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pwrite.html
> 
>   * igt@kms_hdmi_inject@inject-4k:
>     - shard-mtlp:         [PASS][201] -> [SKIP][202] ([i915#15725])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-mtlp-5/igt@kms_hdmi_inject@inject-4k.html
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-rkl:          [PASS][203] -> [SKIP][204] ([i915#16644] / [i915#3555] / [i915#8228])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-1/igt@kms_hdr@bpc-switch.html
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-2/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#3555] / [i915#8228]) +1 other test skip
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-8/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#16644] / [i915#3555] / [i915#8228])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#3555] / [i915#8228])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#3555] / [i915#8228])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_invalid_mode@bad-htotal:
>     - shard-dg1:          [PASS][209] -> [DMESG-WARN][210] ([i915#4423]) +1 other test dmesg-warn
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-dg1-16/igt@kms_invalid_mode@bad-htotal.html
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-19/igt@kms_invalid_mode@bad-htotal.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-tglu-1:       NOTRUN -> [SKIP][211] ([i915#15458])
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_joiner@basic-force-ultra-joiner.html
>     - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#15458])
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#15460])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#15458])
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_mst@mst-suspend-read-crc:
>     - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#16451])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_mst@mst-suspend-read-crc.html
>     - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#16451])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-3/igt@kms_mst@mst-suspend-read-crc.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#6301])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_panel_fitting@atomic-fastset.html
>     - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#6301])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-3/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#6301])
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-tglu-1:       NOTRUN -> [SKIP][220] ([i915#14712])
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
>     - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#14712])
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
>     - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#15709]) +2 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
>     - shard-tglu-1:       NOTRUN -> [SKIP][223] ([i915#15709]) +1 other test skip
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
>     - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#15709]) +2 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
>     - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#16386]) +1 other test skip
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-modifier:
>     - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#15709]) +4 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][227] ([i915#13026]) +1 other test incomplete
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane_alpha_blend@alpha-basic:
>     - shard-glk:          NOTRUN -> [FAIL][228] ([i915#12178])
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk1/igt@kms_plane_alpha_blend@alpha-basic.html
> 
>   * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [FAIL][229] ([i915#7862]) +1 other test fail
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk1/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#3555]) +5 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_multiple@2x-tiling-4:
>     - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#13958])
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@kms_plane_multiple@2x-tiling-4.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#13958])
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@kms_plane_multiple@tiling-4:
>     - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#14259])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-8/igt@kms_plane_multiple@tiling-4.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
>     - shard-tglu-1:       NOTRUN -> [SKIP][234] ([i915#15329]) +4 other tests skip
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
>     - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#15329]) +3 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#12343] / [i915#5354])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#12343])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-8/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#12343] / [i915#9812]) +1 other test skip
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-10/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#12343] / [i915#5354]) +1 other test skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc5-psr-suspend-resume:
>     - shard-tglu-1:       NOTRUN -> [SKIP][240] ([i915#16914])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_pm_dc@dc5-psr-suspend-resume.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#3361])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-18/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#15739])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_lpsp@screens-disabled:
>     - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#8430])
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html
> 
>   * igt@kms_pm_rpm@cursor:
>     - shard-snb:          NOTRUN -> [SKIP][244] +19 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-snb6/igt@kms_pm_rpm@cursor.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-dg1:          [PASS][245] -> [SKIP][246] ([i915#15073]) +2 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-16/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-dg2:          [PASS][247] -> [SKIP][248] ([i915#15073])
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-dg2-6/igt@kms_pm_rpm@dpms-non-lpsp.html
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#15073])
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-rkl:          [PASS][250] -> [SKIP][251] ([i915#15073])
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#15073])
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#15073])
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_pm_rpm@package-g7:
>     - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#15403])
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_pm_rpm@package-g7.html
> 
>   * igt@kms_prime@basic-crc-hybrid:
>     - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#6524]) +2 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-7/igt@kms_prime@basic-crc-hybrid.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#6524])
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@kms_prime@basic-modeset-hybrid.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
>     - shard-glk:          NOTRUN -> [SKIP][257] ([i915#11520]) +10 other tests skip
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>     - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#11520]) +9 other tests skip
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
>     - shard-glk10:        NOTRUN -> [SKIP][259] ([i915#11520])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk10/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>     - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#11520]) +6 other tests skip
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>     - shard-tglu-1:       NOTRUN -> [SKIP][261] ([i915#11520]) +4 other tests skip
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
>     - shard-glk11:        NOTRUN -> [SKIP][262] ([i915#11520]) +2 other tests skip
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk11/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#11520]) +6 other tests skip
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
>     - shard-snb:          NOTRUN -> [SKIP][264] ([i915#11520])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-snb6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@pr-sprite-mmap-cpu:
>     - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#9732]) +17 other tests skip
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-10/igt@kms_psr@pr-sprite-mmap-cpu.html
> 
>   * igt@kms_psr@psr-sprite-plane-move:
>     - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#1072] / [i915#9732]) +13 other tests skip
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@kms_psr@psr-sprite-plane-move.html
> 
>   * igt@kms_psr@psr2-sprite-mmap-cpu:
>     - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#1072] / [i915#9732]) +24 other tests skip
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-2/igt@kms_psr@psr2-sprite-mmap-cpu.html
> 
>   * igt@kms_psr@psr2-sprite-mmap-gtt:
>     - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#9732]) +8 other tests skip
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-gtt.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-tglu-1:       NOTRUN -> [SKIP][269] ([i915#15949]) +1 other test skip
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#15949])
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>     - shard-glk11:        NOTRUN -> [INCOMPLETE][271] ([i915#15500] / [i915#16184])
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk11/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
> 
>   * igt@kms_selftest@drm_framebuffer:
>     - shard-rkl:          NOTRUN -> [ABORT][272] ([i915#13179]) +1 other test abort
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@kms_selftest@drm_framebuffer.html
>     - shard-tglu:         NOTRUN -> [ABORT][273] ([i915#13179]) +1 other test abort
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-10/igt@kms_selftest@drm_framebuffer.html
>     - shard-glk10:        NOTRUN -> [ABORT][274] ([i915#13179]) +1 other test abort
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk10/igt@kms_selftest@drm_framebuffer.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-rkl:          [PASS][275] -> [INCOMPLETE][276] ([i915#12276]) +1 other test incomplete
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][277] ([i915#12276]) +1 other test incomplete
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk6/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#11920])
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@kms_vrr@lobf.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#9906])
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-8/igt@kms_vrr@max-min.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#9906])
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@perf@per-context-mode-unprivileged:
>     - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#2433])
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-12/igt@perf@per-context-mode-unprivileged.html
> 
>   * igt@perf_pmu@busy-double-start@vecs0:
>     - shard-mtlp:         [PASS][282] -> [FAIL][283] ([i915#4349])
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-mtlp-6/igt@perf_pmu@busy-double-start@vecs0.html
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-mtlp-8/igt@perf_pmu@busy-double-start@vecs0.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          [PASS][284] -> [FAIL][285] ([i915#4349]) +4 other tests fail
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg2-4/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@enable-race:
>     - shard-glk11:        NOTRUN -> [DMESG-WARN][286] ([i915#118]) +1 other test dmesg-warn
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk11/igt@perf_pmu@enable-race.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-tglu-1:       NOTRUN -> [ABORT][287] ([i915#13029] / [i915#15778])
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-1/igt@perf_pmu@module-unload.html
> 
>   * igt@perf_pmu@rc6-all-gts:
>     - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#8516])
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-8/igt@perf_pmu@rc6-all-gts.html
> 
>   * igt@prime_udl@share-import:
>     - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#16420])
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-18/igt@prime_udl@share-import.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#3708]) +1 other test skip
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-15/igt@prime_vgem@fence-read-hang.html
> 
>   * igt@prime_vgem@fence-write-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#3708])
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@prime_vgem@fence-write-hang.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
>     - shard-dg2:          [INCOMPLETE][292] ([i915#13356] / [i915#16348]) -> [PASS][293]
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-dg1:          [DMESG-WARN][294] ([i915#13390] / [i915#4391] / [i915#4423]) -> [PASS][295]
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-dg1-19/igt@gem_eio@in-flight-suspend.html
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-14/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_softpin@noreloc-s3:
>     - shard-glk:          [INCOMPLETE][296] ([i915#13809] / [i915#16193]) -> [PASS][297]
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-glk8/igt@gem_softpin@noreloc-s3.html
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk4/igt@gem_softpin@noreloc-s3.html
> 
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-rkl:          [ABORT][298] ([i915#15152]) -> [PASS][299]
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-1/igt@gem_workarounds@suspend-resume-fd.html
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-2/igt@gem_workarounds@suspend-resume-fd.html
>     - shard-glk:          [INCOMPLETE][300] ([i915#13356] / [i915#14586]) -> [PASS][301]
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-glk8/igt@gem_workarounds@suspend-resume-fd.html
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk5/igt@gem_workarounds@suspend-resume-fd.html
> 
>   * igt@i915_pm_rpm@system-suspend:
>     - shard-rkl:          [ABORT][302] ([i915#15060]) -> [PASS][303]
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-1/igt@i915_pm_rpm@system-suspend.html
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@i915_pm_rpm@system-suspend.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-snb:          [TIMEOUT][304] ([i915#16162]) -> [PASS][305]
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-snb5/igt@i915_pm_rps@reset.html
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-snb6/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_power@sanity:
>     - shard-mtlp:         [SKIP][306] ([i915#7984]) -> [PASS][307]
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-mtlp-7/igt@i915_power@sanity.html
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-mtlp-4/igt@i915_power@sanity.html
> 
>   * igt@i915_suspend@fence-restore-untiled:
>     - shard-rkl:          [INCOMPLETE][308] ([i915#4817]) -> [PASS][309]
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@i915_suspend@fence-restore-untiled.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:
>     - shard-glk:          [FAIL][310] ([i915#14888]) -> [PASS][311] +3 other tests pass
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
>     - shard-rkl:          [INCOMPLETE][312] ([i915#12761]) -> [PASS][313]
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         [FAIL][314] ([i915#15733] / [i915#5138]) -> [PASS][315] +2 other tests pass
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-rkl:          [INCOMPLETE][316] ([i915#12358] / [i915#14152]) -> [PASS][317]
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-7/igt@kms_cursor_crc@cursor-suspend.html
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-5/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-rkl:          [INCOMPLETE][318] ([i915#9878]) -> [PASS][319]
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-8/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
>     - shard-rkl:          [FAIL][320] ([i915#14600]) -> [PASS][321] +1 other test pass
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-2/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-2/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
> 
>   * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-vga1:
>     - shard-snb:          [FAIL][322] ([i915#10826]) -> [PASS][323]
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-snb5/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-vga1.html
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-snb6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-vga1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-dg2:          [FAIL][324] ([i915#13027]) -> [PASS][325]
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-dg2-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg2-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-rte:
>     - shard-rkl:          [SKIP][326] ([i915#15989]) -> [PASS][327] +11 other tests pass
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu:
>     - shard-glk:          [SKIP][328] -> [PASS][329] +15 other tests pass
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-glk4/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-rkl:          [SKIP][330] ([i915#16644] / [i915#3555] / [i915#8228]) -> [PASS][331]
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-3/igt@kms_hdr@static-swap.html
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-dg2:          [SKIP][332] ([i915#15073]) -> [PASS][333] +2 other tests pass
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-dg2-3/igt@kms_pm_rpm@dpms-lpsp.html
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-dg1:          [SKIP][334] ([i915#15073]) -> [PASS][335]
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@perf_pmu@frequency:
>     - shard-rkl:          [FAIL][336] -> [PASS][337] +1 other test pass
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-5/igt@perf_pmu@frequency.html
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-7/igt@perf_pmu@frequency.html
> 
>   
> #### Warnings ####
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-rkl:          [SKIP][338] ([i915#11078]) -> [SKIP][339] ([i915#11078] / [i915#14544])
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@device_reset@cold-reset-bound.html
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@device_reset@cold-reset-bound.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-rkl:          [SKIP][340] ([i915#6335]) -> [SKIP][341] ([i915#14544] / [i915#6335])
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-3/igt@gem_create@create-ext-cpu-access-big.html
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-rkl:          [SKIP][342] ([i915#280]) -> [SKIP][343] ([i915#14544] / [i915#280])
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-3/igt@gem_ctx_sseu@invalid-sseu.html
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_eio@kms:
>     - shard-dg1:          [ABORT][344] ([i915#16931]) -> [ABORT][345] ([i915#16837] / [i915#16912] / [i915#16931])
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-dg1-19/igt@gem_eio@kms.html
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-14/igt@gem_eio@kms.html
>     - shard-tglu:         [ABORT][346] ([i915#16837] / [i915#16866]) -> [ABORT][347] ([i915#16837])
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-tglu-7/igt@gem_eio@kms.html
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-tglu-4/igt@gem_eio@kms.html
> 
>   * igt@gem_exec_capture@capture-recoverable:
>     - shard-rkl:          [SKIP][348] ([i915#6344]) -> [SKIP][349] ([i915#14544] / [i915#6344])
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-8/igt@gem_exec_capture@capture-recoverable.html
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
> 
>   * igt@gem_exec_reloc@basic-wc-gtt:
>     - shard-rkl:          [SKIP][350] ([i915#14544] / [i915#3281]) -> [SKIP][351] ([i915#3281]) +1 other test skip
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@gem_exec_reloc@basic-wc-gtt.html
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@gem_exec_reloc@basic-wc-gtt.html
> 
>   * igt@gem_exec_reloc@basic-write-read-active:
>     - shard-rkl:          [SKIP][352] ([i915#3281]) -> [SKIP][353] ([i915#14544] / [i915#3281]) +4 other tests skip
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-8/igt@gem_exec_reloc@basic-write-read-active.html
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html
> 
>   * igt@gem_exec_schedule@semaphore-power:
>     - shard-rkl:          [SKIP][354] ([i915#14544] / [i915#7276]) -> [SKIP][355] ([i915#7276])
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html
> 
>   * igt@gem_lmem_evict@dontneed-evict-race:
>     - shard-rkl:          [SKIP][356] ([i915#4613] / [i915#7582]) -> [SKIP][357] ([i915#14544] / [i915#4613] / [i915#7582])
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@gem_lmem_evict@dontneed-evict-race.html
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify:
>     - shard-rkl:          [SKIP][358] ([i915#4613]) -> [SKIP][359] ([i915#14544] / [i915#4613]) +3 other tests skip
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify.html
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>     - shard-rkl:          [SKIP][360] ([i915#8411]) -> [SKIP][361] ([i915#14544] / [i915#8411])
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
> 
>   * igt@gem_tiled_partial_pwrite_pread@reads:
>     - shard-rkl:          [SKIP][362] ([i915#14544] / [i915#3282]) -> [SKIP][363] ([i915#3282]) +1 other test skip
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@gem_tiled_partial_pwrite_pread@reads.html
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@gem_tiled_partial_pwrite_pread@reads.html
> 
>   * igt@gem_tiled_pread_pwrite:
>     - shard-rkl:          [SKIP][364] ([i915#3282]) -> [SKIP][365] ([i915#14544] / [i915#3282])
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@gem_tiled_pread_pwrite.html
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@gem_tiled_pread_pwrite.html
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>     - shard-rkl:          [SKIP][366] ([i915#3297]) -> [SKIP][367] ([i915#14544] / [i915#3297])
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-rkl:          [SKIP][368] ([i915#14544] / [i915#2527]) -> [SKIP][369] ([i915#2527])
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@gen9_exec_parse@bb-start-out:
>     - shard-rkl:          [SKIP][370] ([i915#2527]) -> [SKIP][371] ([i915#14544] / [i915#2527]) +3 other tests skip
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@gen9_exec_parse@bb-start-out.html
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html
> 
>   * igt@i915_pm_freq_api@freq-reset-multiple:
>     - shard-rkl:          [SKIP][372] ([i915#8399]) -> [SKIP][373] ([i915#14544] / [i915#8399])
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@i915_pm_freq_api@freq-reset-multiple.html
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-rkl:          [SKIP][374] ([i915#14544] / [i915#7707]) -> [SKIP][375] ([i915#7707])
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@intel_hwmon@hwmon-read.html
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - shard-rkl:          [INCOMPLETE][376] ([i915#12761]) -> [ABORT][377] ([i915#15132])
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@kms_async_flips@async-flip-suspend-resume.html
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-1/igt@kms_async_flips@async-flip-suspend-resume.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-rkl:          [SKIP][378] ([i915#5286]) -> [SKIP][379] ([i915#14544] / [i915#5286]) +1 other test skip
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-rkl:          [SKIP][380] ([i915#3638]) -> [SKIP][381] ([i915#14544] / [i915#3638]) +2 other tests skip
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-rkl:          [SKIP][382] ([i915#14544] / [i915#3638]) -> [SKIP][383] ([i915#3638])
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-rkl:          [SKIP][384] -> [SKIP][385] ([i915#14544]) +58 other tests skip
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          [SKIP][386] ([i915#14544] / [i915#6095]) -> [SKIP][387] ([i915#6095]) +3 other tests skip
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
>     - shard-rkl:          [SKIP][388] ([i915#6095]) -> [SKIP][389] ([i915#14544] / [i915#6095]) +10 other tests skip
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>     - shard-rkl:          [SKIP][390] ([i915#14098] / [i915#6095]) -> [SKIP][391] ([i915#14098] / [i915#14544] / [i915#6095]) +14 other tests skip
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-c-hdmi-a-2:
>     - shard-rkl:          [SKIP][392] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][393] ([i915#14098] / [i915#6095]) +3 other tests skip
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-c-hdmi-a-2.html
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-rkl:          [SKIP][394] ([i915#14544] / [i915#3742]) -> [SKIP][395] ([i915#3742])
>    [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html
>    [395]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>     - shard-rkl:          [SKIP][396] ([i915#11151] / [i915#7828]) -> [SKIP][397] ([i915#11151] / [i915#14544] / [i915#7828]) +7 other tests skip
>    [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
>    [397]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
>     - shard-rkl:          [SKIP][398] ([i915#14544] / [i915#15330]) -> [SKIP][399] ([i915#15330])
>    [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
>    [399]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-rkl:          [SKIP][400] ([i915#15865]) -> [SKIP][401] ([i915#14544] / [i915#15865])
>    [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-3/igt@kms_content_protection@lic-type-1.html
>    [401]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-rkl:          [SKIP][402] ([i915#14544] / [i915#15865]) -> [SKIP][403] ([i915#15865])
>    [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_content_protection@mei-interface.html
>    [403]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-rkl:          [SKIP][404] ([i915#13049]) -> [SKIP][405] ([i915#13049] / [i915#14544])
>    [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>    [405]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-rkl:          [SKIP][406] ([i915#13049] / [i915#14544]) -> [SKIP][407] ([i915#13049])
>    [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [407]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>     - shard-rkl:          [SKIP][408] ([i915#3555]) -> [SKIP][409] ([i915#14544] / [i915#3555])
>    [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
>    [409]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> 
>   * igt@kms_dsc@dsc-basic-ultrajoiner:
>     - shard-rkl:          [SKIP][410] ([i915#16361]) -> [SKIP][411] ([i915#14544] / [i915#16361]) +2 other tests skip
>    [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@kms_dsc@dsc-basic-ultrajoiner.html
>    [411]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-rkl:          [SKIP][412] ([i915#658]) -> [SKIP][413] ([i915#14544] / [i915#658])
>    [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@kms_feature_discovery@psr2.html
>    [413]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-rkl:          [SKIP][414] ([i915#9934]) -> [SKIP][415] ([i915#14544] / [i915#9934]) +2 other tests skip
>    [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@kms_flip@2x-absolute-wf_vblank.html
>    [415]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-rkl:          [SKIP][416] ([i915#14544] / [i915#9934]) -> [SKIP][417] ([i915#9934])
>    [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html
>    [417]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-glk:          [INCOMPLETE][418] ([i915#12745] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][419] ([i915#12745] / [i915#4839])
>    [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-glk3/igt@kms_flip@flip-vs-suspend.html
>    [419]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk9/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>     - shard-glk:          [INCOMPLETE][420] ([i915#12745] / [i915#6113]) -> [INCOMPLETE][421] ([i915#12745])
>    [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-glk3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
>    [421]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-glk9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-rkl:          [SKIP][422] ([i915#14544] / [i915#15643]) -> [SKIP][423] ([i915#15643])
>    [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
>    [423]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-rkl:          [SKIP][424] ([i915#15643]) -> [SKIP][425] ([i915#14544] / [i915#15643]) +1 other test skip
>    [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
>    [425]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - shard-mtlp:         [SKIP][426] -> [SKIP][427] ([i915#15672])
>    [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-mtlp-5/igt@kms_force_connector_basic@force-load-detect.html
>    [427]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-mtlp-1/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-rkl:          [SKIP][428] ([i915#1825]) -> [SKIP][429] ([i915#14544] / [i915#1825]) +4 other tests skip
>    [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
>    [429]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:
>     - shard-rkl:          [SKIP][430] ([i915#14544] / [i915#15102]) -> [SKIP][431] ([i915#15102]) +5 other tests skip
>    [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html
>    [431]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:
>     - shard-rkl:          [SKIP][432] ([i915#15102]) -> [SKIP][433] ([i915#14544] / [i915#15102]) +28 other tests skip
>    [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html
>    [433]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-rkl:          [SKIP][434] ([i915#14544]) -> [SKIP][435] +14 other tests skip
>    [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt.html
>    [435]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:
>     - shard-dg1:          [SKIP][436] -> [SKIP][437] ([i915#4423])
>    [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html
>    [437]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-suspend:
>     - shard-rkl:          [SKIP][438] ([i915#15989]) -> [INCOMPLETE][439] ([i915#16056])
>    [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-suspend.html
>    [439]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-suspend.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-rkl:          [INCOMPLETE][440] ([i915#15436]) -> [SKIP][441] ([i915#16644] / [i915#3555] / [i915#8228])
>    [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html
>    [441]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-rkl:          [SKIP][442] ([i915#15459]) -> [SKIP][443] ([i915#14544] / [i915#15459])
>    [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-8/igt@kms_joiner@basic-force-big-joiner.html
>    [443]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-rkl:          [SKIP][444] ([i915#15458]) -> [SKIP][445] ([i915#14544] / [i915#15458])
>    [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@kms_joiner@basic-force-ultra-joiner.html
>    [445]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-rkl:          [SKIP][446] ([i915#14712]) -> [SKIP][447] ([i915#14544] / [i915#14712])
>    [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
>    [447]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
>     - shard-rkl:          [SKIP][448] ([i915#14544] / [i915#15709]) -> [SKIP][449] ([i915#15709])
>    [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
>    [449]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
>     - shard-rkl:          [SKIP][450] ([i915#15709]) -> [SKIP][451] ([i915#14544] / [i915#15709]) +2 other tests skip
>    [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
>    [451]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-rkl:          [SKIP][452] ([i915#12343] / [i915#14544] / [i915#5354]) -> [SKIP][453] ([i915#12343] / [i915#5354])
>    [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html
>    [453]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-rkl:          [SKIP][454] ([i915#15948]) -> [SKIP][455] ([i915#14544] / [i915#15948])
>    [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-8/igt@kms_pm_dc@dc6-psr.html
>    [455]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-dg1:          [SKIP][456] ([i915#3828]) -> [SKIP][457] ([i915#9340])
>    [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html
>    [457]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-dg1-16/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-rkl:          [SKIP][458] ([i915#15073]) -> [SKIP][459] ([i915#14544] / [i915#15073]) +1 other test skip
>    [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>    [459]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-rkl:          [SKIP][460] ([i915#14544] / [i915#6524]) -> [SKIP][461] ([i915#6524])
>    [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_prime@d3hot.html
>    [461]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
>     - shard-rkl:          [SKIP][462] ([i915#11520]) -> [SKIP][463] ([i915#11520] / [i915#14544]) +6 other tests skip
>    [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
>    [463]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@pr-no-drrs:
>     - shard-rkl:          [SKIP][464] ([i915#1072] / [i915#9732]) -> [SKIP][465] ([i915#1072] / [i915#14544] / [i915#9732]) +11 other tests skip
>    [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-8/igt@kms_psr@pr-no-drrs.html
>    [465]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_psr@pr-no-drrs.html
> 
>   * igt@kms_psr@psr-suspend:
>     - shard-rkl:          [SKIP][466] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][467] ([i915#1072] / [i915#9732]) +2 other tests skip
>    [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_psr@psr-suspend.html
>    [467]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_psr@psr-suspend.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-rkl:          [SKIP][468] ([i915#15949]) -> [SKIP][469] ([i915#14544] / [i915#15949])
>    [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [469]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-rkl:          [SKIP][470] ([i915#5289]) -> [SKIP][471] ([i915#14544] / [i915#5289])
>    [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [471]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-rkl:          [SKIP][472] ([i915#14544] / [i915#3555]) -> [SKIP][473] ([i915#3555])
>    [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html
>    [473]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-4/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-rkl:          [SKIP][474] ([i915#15243] / [i915#3555]) -> [SKIP][475] ([i915#14544] / [i915#15243] / [i915#3555]) +1 other test skip
>    [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-3/igt@kms_vrr@flip-dpms.html
>    [475]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-rkl:          [SKIP][476] ([i915#9906]) -> [SKIP][477] ([i915#14544] / [i915#9906])
>    [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-virtual.html
>    [477]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>   * igt@prime_vgem@basic-read:
>     - shard-rkl:          [SKIP][478] ([i915#3291] / [i915#3708]) -> [SKIP][479] ([i915#14544] / [i915#3291] / [i915#3708])
>    [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-4/igt@prime_vgem@basic-read.html
>    [479]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-rkl:          [SKIP][480] ([i915#3708]) -> [SKIP][481] ([i915#14544] / [i915#3708]) +1 other test skip
>    [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19097/shard-rkl-3/igt@prime_vgem@coherency-gtt.html
>    [481]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/shard-rkl-6/igt@prime_vgem@coherency-gtt.html
> 
>   
>   [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
>   [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
>   [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
>   [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
>   [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
>   [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
>   [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
>   [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
>   [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
>   [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
>   [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
>   [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
>   [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
>   [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
>   [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
>   [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
>   [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
>   [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
>   [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
>   [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
>   [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
>   [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
>   [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
>   [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
>   [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
>   [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
>   [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
>   [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
>   [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
>   [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
>   [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
>   [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
>   [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
>   [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
>   [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
>   [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
>   [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
>   [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
>   [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
>   [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
>   [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
>   [i915#15060]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15060
>   [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
>   [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
>   [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
>   [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
>   [i915#15152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15152
>   [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
>   [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
>   [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
>   [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
>   [i915#15436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436
>   [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
>   [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
>   [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
>   [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
>   [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
>   [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
>   [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
>   [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
>   [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
>   [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
>   [i915#15725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725
>   [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
>   [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
>   [i915#15778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
>   [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
>   [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
>   [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
>   [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
>   [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
>   [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
>   [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
>   [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
>   [i915#16162]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16162
>   [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
>   [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
>   [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
>   [i915#16193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193
>   [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
>   [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
>   [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
>   [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
>   [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
>   [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
>   [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
>   [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
>   [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
>   [i915#16837]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837
>   [i915#16838]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16838
>   [i915#16866]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866
>   [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
>   [i915#16876]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876
>   [i915#16912]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16912
>   [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
>   [i915#16931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16931
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
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
>   [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
>   [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>   [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>   [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
>   [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
>   [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
>   [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>   [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
>   [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
>   [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>   [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
>   [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
>   [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
>   [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
>   [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
>   [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
>   [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
>   [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
>   [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
>   [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
>   [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_19097 -> Patchwork_173531v1
> 
>   CI-20190529: 20190529
>   CI_DRM_19097: 16562a45b1291d85f8402628a1f7d3778e2bebce @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_9085: 9085
>   Patchwork_173531v1: 16562a45b1291d85f8402628a1f7d3778e2bebce @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173531v1/index.html
