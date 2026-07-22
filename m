Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB83C4453D
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Jul 2026 10:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E09110ED4B;
	Wed, 22 Jul 2026 10:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UOioCdX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF3B10ED4A
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Jul 2026 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784716126; x=1816252126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UcBtqq3UqZNany7VICHO/JRUeqMjiFNReSlmq/t5bvQ=;
 b=UOioCdX6YSLpZA+qSORjmZoW0N8TzVq19uPmTy4fdhvjA1Rk9lSmpa5E
 HNeu77wWNS1EBm4bZHt8Lsa9gwmMA3hav26icHBFp/yM/Tgl6nhQXFGWV
 B3WgJI50TttgQvCAkoyi3GkqwTB50yPaTDQ4LKDdBB/HX4NDbL6Kbr7RB
 2HgWVbcy2mtcVHzPjWsz/0LKzoIq5zFfI/Nu17YNg/ceuwNYWGbIgT+IO
 GAx5n8HR9UOghQI2PZvCCPzDdnyO+ZsuRw/GM/yLb+UDdJp1xxDmmuFW0
 C562frinus564kZeUvBwScRFYfcN8T3vxEsRACTNlwotniFwzSwRtwFqo Q==;
X-CSE-ConnectionGUID: gRnhgL6nTu+7wduCJXqGOQ==
X-CSE-MsgGUID: 3/DU0znuTHKZWVBk5wNcyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85294012"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="85294012"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:28:46 -0700
X-CSE-ConnectionGUID: OPaBlPYQTnypHNzD2/0K2g==
X-CSE-MsgGUID: OgLoLmktQf2wDqpPY7nT6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="256264878"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:28:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:28:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 03:28:40 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:28:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9Ce2JAYB8VqkTW9+kgjeANuSJg9UUlAsRQXs0jCear3fWcVFUsJoTI8dysCTM0cn3SwxxY7BoRW/90aSVBx61ndGZPasVOhY7Ma/6NJyI1H9wc6NqtHhsWBT1ZkuJm6qqputL6YlrSq7EV8bneK5qMc9mfS1yFFYwLxWfi8xnlgKfUc6NnOebaU5K9rpkEhPYzwffiFgI//tQyhZusSEKFMKfXrJ8BhNS9DNf0ARVxwmZy6QzExOMN7llyMlIfUpKHG/MbAH9I/BlEJAdik5835asXhu2RrOV+tJYU7bogWXXlY8Kz2p17q8r53/L7kGup/0Jpln8k30AxNN3Msjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqOCSTQpKpC/Kx+ITL+jMlADzXt3q99z9fQnHuAtVE0=;
 b=fXUhcqB6Om1EGB7alj5tSKZ7W7FBiyg3yrCdHMJq3QZOYK5KFGGzFL6UYA/hguKrfEOsYnL2D37BLkh+RYQg+4rSx2z/OXv+Z3jNQf3SEfnM1BaTcqB5onpubGrOssIX0ltJuci0UgRTK+Y2NPAAEuINY3VksB+RShu66xsNTI3ZqxqPOIC2s1jzp8nEWYnTF35xBea7EzdLEryhsNnIz9X8FwEeq6nNbvSVTO8UON5tjoIs3il1RK5Jl+1rzASegoncl8h41XhN3Q3rikfbgR9A9Ov7FY6pPPDHKHz2EMyEqBES5mKyQg8wQWKM4bdfn748OkQjPJVeTUn+6Mj8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW6PR11MB8338.namprd11.prod.outlook.com (2603:10b6:303:247::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 10:28:37 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 10:28:37 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <andi.shyti@linux.intel.com>, <krzysztof.karas@intel.com>
Subject: [PATCH 5/6] drm/i915: Convert debugfs/error/cmd-parser license
 headers to SPDX
Date: Wed, 22 Jul 2026 12:29:22 +0200
Message-ID: <3b7b9f12f92292c7f260bfe6f2d64ff4e1a65508.1784713895.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784713895.git.sebastian.brzezinka@intel.com>
References: <cover.1784713895.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR06CA0016.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::21) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MW6PR11MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe933d5-f646-4e3d-566c-08dee7dbfd71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: PchT+ez9N8gbKsSnkcydT53N4zeRLC34jPwRxP2cZsIrvhVUD/DfQcpPsxtM8zNNwuXEW3o6KqGR8j6zNXeUGt6UkgNBtZJsnD9rnkhiWR9VtikrYErHvUouP2xgolJojFwuXLb/kmYyp3s7V1ckoonNWb/NLGZPq2Iv5lgODxjuS7u6OjwpCFsfey6ukzkdMPRBva94Xu12Xr6bdVxQCQ+dpRVSscOhgNpAaCXtOuqcAPivwtI/M98A55sZSlre3EuGXHP7LDu/epVT7N7lxeexVdGFR5MwFkQWMf1q5LRcq8qCr9Y1Kz34V+yX5s/XTgGyiHtQc8Q1Od/f3lVAnHyTrJOLUs4zj8kBzmiIEDWufpCoceF+k62esPJ8WTtjwZVY/etLKIP3WkdwuPOsUkYvT+ZXwOswfeJw7eekne9Z4oktoQM1+RHzSls67GeEO84zz+D8f5dBb5IKRYd9t6xuioRQSXtisV9t8D1zi7CFH7MjsU0Xqyd/POUSISZdhiZjNHrZWNeTH8c4GLNi640U8UPcyOtOu0HaKrQBSZBh48oC4FD6lR1PzjBa6bUU31yrc4pnUVgRTcvFgsQgWlA9g5CfUbHjc39GLiK59l7fZ6tsdRShqZSJlELFIu0Me9PN86lBiKsO7NmhCplsSDCvNRcIiIX/pJKPDjHupYI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVpSY1gzSzJ3bzJsSkJWUEhscnhmN2w1VTMrYklrbHREQjNFL0VyekRvanha?=
 =?utf-8?B?SzRTYU04SEFjcGF3UTl6eFUwNk1FZ3FSU0doRDZVL3NkaHVNbktiWStmdGZz?=
 =?utf-8?B?NHlCb3ZxMUl1dmUyc2tQSFQ1cW1FVTVsUGdZNENzVGt4TUdLc1g1OHA3ajZy?=
 =?utf-8?B?NEtuNEdVZjRSN2FTVEhyQ2pCNGVsZEZmQStlYUR6RXhrM0lUL2Z2cGs2UmdC?=
 =?utf-8?B?RmlrNUJ3MWZ4SEgvdW1xTTZPaEF2YURlbFoyaDBnU0dCaTJnc2dFTyswdGxX?=
 =?utf-8?B?eHpPNUcxTGFkUjhndm1CUVpqVGsxVVNZTkkvdmtEOWkvT3pObHA1TWZQNUlZ?=
 =?utf-8?B?R1NTOTkzQnVLalNGSWE3dThTRkwyM2tHNDFrcmtqVkMrNTVKS3d3M3ByMHg3?=
 =?utf-8?B?QjZTdFQvUmlQcnZ5emZrOG4vemxtaDRiZFhGck5haDd1d2ZUWlZSY2FkRCtr?=
 =?utf-8?B?THNYRDhKWVFUVGYwd1crNFc5eC9CUVJYekVVbUF6Tjc1dXNyOUYxVXdJeGJZ?=
 =?utf-8?B?Zkc4dmwzNWtSc25kT1JUTTVTOGtzL0hTcjFCZGlsNUNYTmZWL3dicWdPbXhV?=
 =?utf-8?B?cndOM3RwMzNNOUc0Y0Z1S3J6U2NiUmNpL2hLYXVtU3psQ0ZFVFFzd0pwcC9O?=
 =?utf-8?B?TUZ4SmxzKzVUclloVys2a2E2YS8rMWxuTGx4ZlgyQUR2dklKcDUyVCtwajc2?=
 =?utf-8?B?a1ZoV2doWHdvVW4wUnFaUkQ0L0wvbXloTDhqU2dTenp2a01hYkR6Q1VhYkZj?=
 =?utf-8?B?UHd0dE9GbHJvME1MWk9BRmVvNVk4OWpobmZ4N1kzcGFQOE9zRHB0UGhOTmoz?=
 =?utf-8?B?eHBxMmo4UDhlSGFWMWRCTzZnb24rOW8rRTVOKzY3WHlPWkRUZGZOWEsvZGtw?=
 =?utf-8?B?Mnlmc3J0WW81SlVDMXE0eDRZZktkNDY0ZjduLzZIS25LbURQUUx3UStGdlpJ?=
 =?utf-8?B?b2EzdXpUS0p4TXFMSWduc1VPMzZMZDI4Ulp3L3pBMDRnWDZSaXc0SlZ6L0Ni?=
 =?utf-8?B?YS9FR1NiRUdjaE5YaDV5U3IrclRKR0FTZjlsUUpCOGVxNk1lYndYaUR0Tzl0?=
 =?utf-8?B?NmNuNk56R0JmUmJYeitGbG5oM3ZzckFpVC9FZmp0KzM1aG0zM0JrOTIyaGR0?=
 =?utf-8?B?Ry9BTFd1VEJMY2JjM0tjY25UK2RldzlFZm0yUWFiTmF1QXNrK0JtNnNDZTFD?=
 =?utf-8?B?YlI4V2pxbGcxTXQ5N0ZaVEVRSGVVZWhTRjZ4VkMwQlMvYTZxQ2d5czRNYmVZ?=
 =?utf-8?B?TXVXSWVjT0dZbWtvMTRraHNPWERyL1ZRT21oUC9jR2pDTXBCYTUxYlZkS1pH?=
 =?utf-8?B?SGE0bmxXQzF1eWtOYlkvZ2JGMWw1NUhRSmZWL3RwL0tiSDhWY3l5bjN6RlJV?=
 =?utf-8?B?NWZSWkYxK1krL0tOMmJ2WTd3WUorMTRVTFdrQ1UzQjdPMytUbWwxb3EzTElk?=
 =?utf-8?B?S0Y4Z2xjL2VjTVZMN1QzcCtjQjl6RmY0Y3RFUldnZXU1MElWR2ZDbS90TXRw?=
 =?utf-8?B?T0pXTXorRGRyY0wrS1ByYkhIbnlCNG9hMHVQclRYR0FqMnZpZU8xN0ZuRXZK?=
 =?utf-8?B?WVpFNEtmeGtTOGMvTHdOVzVBbUJXS3JaRUNNL0JvaGovMGVhYXpMQSthc05B?=
 =?utf-8?B?TVErd05Yc3BzQU5nWElUV2h2azhYZWN4T2g3b1dzTDgvQTUyQTJORXlvSDA3?=
 =?utf-8?B?NHVhaDBwTEJzb2Z1Q0tTT0lCcHRxNDdMeUxsRWhJWUM3dzF2OEE2eDgzZEZF?=
 =?utf-8?B?Zk4wbmhFbUZveHhFdzVEVXdPZjBlR2IybjVrQmdvMGpMbi9BVWlLUFlDbnJN?=
 =?utf-8?B?U3BRTFJmU3FIcWt4NHA3MStoZHgvNFZaaXRET3F5OHc5c2d0bGNVa3RkZmIy?=
 =?utf-8?B?OXJaRkJoWjg3L0kxT0JILzd1T05aekhNckY1ZThtdVVpaVQzVjhrR2hDQlVw?=
 =?utf-8?B?MkxrVkxtVFNOcHJ4SGlTSERNWTFxZENISElKRit4N0FBMVp3VU4xc2dqQUh3?=
 =?utf-8?B?d1g3cWZSRDJ2Q0NTVDZzb2lob1krN1o5d2h2V1d1WVJsMzdNbVRUNklyUUp6?=
 =?utf-8?B?T1ZhNGxHRWZLeFBnSGJ2UXZQdTNCRXJKTytuNFowNE5nYTA4SldUMnRucUpT?=
 =?utf-8?B?T3VyNmZzalFkU1BsbzBXVDVFaytuTHQyanM0cStnWnV2eFkxSzJqOGd1dzFm?=
 =?utf-8?B?Nk1OdlFaTHM0eWl6WmNSdy81a2pMTmNkb2dRY3o5TmF5WXF6TEZGeklDTEJj?=
 =?utf-8?B?MUdpZTdKeHRsSmRmNTJSR0lhRG1QVlE0NXFSc3p4KzZtVGg2MlFJS0NLc1BL?=
 =?utf-8?B?NUhOVkxqM01XaEZodC9obFRWYjZ2L08wMlhlS1BaWnJaZjZjazhhU3dXSWdO?=
 =?utf-8?Q?LBTIF9jKVxaWvs6I=3D?=
X-Exchange-RoutingPolicyChecked: PMOqXMB++amxFb6fRDqNOoBYKlvi16kfSXZN2lBVZtNK352teV1hlSwjD40qknWIfMQbRSb38lpKVFv5LN9X4ams8zzDbM67lj/dG84+JQPkKSaWC8CxDezQmKX9Oj6qYLphy1c+wLdQKfQP+zF+kTH/C9s+dL8AHAx7FhGQZsd/vT7lbJeRwE4W4/z5r0/4v40BP48otsd5GosXEhfQRST9xUYXXr/BthssUw3SkzXAnrSX6Viart9UC51Mn8qTHAWm/U2Dp9TqQ9B0CASKc796ykg5/L5dP8H6YHT5t/n0ed9bdABg99kfCs89wh1x1/N/8VmVEuTJJsCBoYL1UA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe933d5-f646-4e3d-566c-08dee7dbfd71
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:28:37.0853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfpYau8Wt94VhAP69wRUrjOAqaRzfqIl8dtG4gMYvwvaPrFG/B0NVAJTQw0Z4eDL61skffC9zzsWomnanNBM70x6isqK86nkKxAzp9nK3nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8338
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

Replace the verbose MIT license boilerplate in the debugfs interface,
GPU error capture, command parser, 32-bit ioctl compatibility,
sysfs, memory mapping and fast memcpy files with the corresponding
SPDX-License-Identifier tag, preserving existing copyright and authorship
notices.

No functional changes.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 drivers/gpu/drm/i915/i915_cmd_parser.c | 21 +--------------------
 drivers/gpu/drm/i915/i915_debugfs.c    | 21 +--------------------
 drivers/gpu/drm/i915/i915_gpu_error.c  | 21 +--------------------
 drivers/gpu/drm/i915/i915_ioc32.c      | 21 ++-------------------
 drivers/gpu/drm/i915/i915_memcpy.c     | 21 +--------------------
 drivers/gpu/drm/i915/i915_mm.c         | 21 +--------------------
 drivers/gpu/drm/i915/i915_sysfs.c      | 21 +--------------------
 drivers/gpu/drm/i915/i915_utils.h      | 21 +--------------------
 8 files changed, 9 insertions(+), 159 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
index 41fef2d02449..6a89dd4e2d99 100644
--- a/drivers/gpu/drm/i915/i915_cmd_parser.c
+++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
@@ -1,28 +1,9 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2013 Intel Corporation
  *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
  * Authors:
  *    Brad Volkin <bradley.d.volkin@intel.com>
- *
  */
 
 #include <linux/highmem.h>
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index a3e27f9e4f47..9b859b9eff24 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -1,29 +1,10 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2008 Intel Corporation
  *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
  * Authors:
  *    Eric Anholt <eric@anholt.net>
  *    Keith Packard <keithp@keithp.com>
- *
  */
 
 #include <linux/debugfs.h>
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 5353a9c66694..49a5c720bf85 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1,30 +1,11 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright (c) 2008 Intel Corporation
  *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
  * Authors:
  *    Eric Anholt <eric@anholt.net>
  *    Keith Packard <keithp@keithp.com>
  *    Mika Kuoppala <mika.kuoppala@intel.com>
- *
  */
 
 #include <linux/ascii85.h>
diff --git a/drivers/gpu/drm/i915/i915_ioc32.c b/drivers/gpu/drm/i915/i915_ioc32.c
index 33348960f623..c8bb18166b6c 100644
--- a/drivers/gpu/drm/i915/i915_ioc32.c
+++ b/drivers/gpu/drm/i915/i915_ioc32.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: MIT
 /*
  * 32-bit ioctl compatibility routines for the i915 DRM.
  *
@@ -5,27 +6,9 @@
  * Copyright (C) Alan Hourihane 2005
  * All Rights Reserved.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHOR BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
  * Author: Alan Hourihane <alanh@fairlite.demon.co.uk>
  */
+
 #include <linux/compat.h>
 
 #include <drm/drm_ioctl.h>
diff --git a/drivers/gpu/drm/i915/i915_memcpy.c b/drivers/gpu/drm/i915/i915_memcpy.c
index cc41974cee74..686aefe260df 100644
--- a/drivers/gpu/drm/i915/i915_memcpy.c
+++ b/drivers/gpu/drm/i915/i915_memcpy.c
@@ -1,25 +1,6 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2016 Intel Corporation
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
index fd89e7c7d8d6..97ae0b429175 100644
--- a/drivers/gpu/drm/i915/i915_mm.c
+++ b/drivers/gpu/drm/i915/i915_mm.c
@@ -1,25 +1,6 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2014 Intel Corporation
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
  */
 
 #include <linux/mm.h>
diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index 70e0d8615160..1cc370aed826 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -1,28 +1,9 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2012 Intel Corporation
  *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
  * Authors:
  *    Ben Widawsky <ben@bwidawsk.net>
- *
  */
 
 #include <linux/device.h>
diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index ecc20e0528f4..50b7d9392b6d 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -1,25 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright © 2016 Intel Corporation
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
  */
 
 #ifndef __I915_UTILS_H
-- 
2.53.0

