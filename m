Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB5C606A31C
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2026 13:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OrbeoQfX;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ZJUQ1NEd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1950310EC1C;
	Wed, 18 Nov 2026 13:02:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97B910FC06
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Nov 2026 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795006966; x=1826542966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8ROJGUCFpkxdxsPe2nfT5Qo5Zh8UFXC5akVLVE6Y9Xo=;
 b=OrbeoQfXBLR0hXOgk41I/pX9NCwiqeBgEC57/fVBBXNmXDJrDyjlxlQN
 Z506PQDL8KTRodHMYvNHjq2CclyoyWmlcFffKo7KM21szN6YkuzMnN+El
 wS+fDGpW/VgjV8SVcrrkDESHwvxBM1gegLYCp7InOUPdrHw5IQN0B3N2F
 bRvPOkWAR6AgJXElR1NsWIGnBf+i+e67l5/sYX9Z89+xOb4C7wZxZpQ8y
 LviFCboWybc11/33UZzXABpdvO0kWCDjGRLSYrUhKY1e07X/HhOyGh8DR
 FoOTvWVqubNxMK93zAbOIxpx7TyrZMJuqLvdXzxfmOzVMBrsluj9ua6x5 w==;
X-CSE-ConnectionGUID: KOmSdPqcQUayzzFH/PtpPg==
X-CSE-MsgGUID: usiw0ULeRf+Rm1jO0BHdJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3706341"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3706341"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 05:02:46 -0800
X-CSE-ConnectionGUID: DU22DaevSC2bHyYH0JS+dw==
X-CSE-MsgGUID: SPlHETqSRDe1hJSMvp5R/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10478707"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 05:02:46 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 05:02:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 05:02:45 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 05:02:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IN9JEFIudbCjisaNK2f1LeMjZgeZ0XjayVo2EGnJ2i07zhOE8MIMVuOWt/dYCRoE8vAHD86W+h4J5zl1NMleKupsvXuYeNh/BbwEmkxM6g82G/F1Hx1k2dJv8VMEf94tAs1gfIo9KNLLgEbZMgQwQBCc0JTXi5/0KAcPRpM7ZBYJpbKVrDC2svGq63y34MIfyczrgyVfQP8toOeXpFUS0XkEAAo8MSDr+4KfdlGYkbN5b5QdqlpVlsL55jcq0XsHmAGWhLLbkKXHeX1HeFA85HW47ssU58L81/hLhk5lyQYfeRBebte0uwMitwOy27XObjoZsQwGRw6fwTGW1toNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+si8A6gVgz/7SI2lFOSb7kF2mqc+kSBmMACaWiOnUQU=;
 b=i+7QlzFZW+qJBziZ+9ui0hB8Z7mfF3GOuoZBD6kVv0ggQFZlE91RqLQTQE90W25oMYB46wAG4WsvGJI8E9RO+pgZ7zJrn/k5gjBpTohCmuU+nPQU31e/i0MxaCAXxUR47fnYXGW9Yqy+LVuhRmxzZQzUcjXm3fxYKbr1NLttOOqMTnvlz/L0xpy2erFvRa600tcrmM2yCxFrOzglkSMoyu50SV4TichttnTRHfYg4PN3wa0yh3p8cB6f5PdLy8G3F55xfj8pr7M9Au/AG+7+hzEAtui6eYOnqjzjSdcljaJ1PryeWPFmTSEVFuYg/slH7+mmPpwTSSkEym5d5ePk/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+si8A6gVgz/7SI2lFOSb7kF2mqc+kSBmMACaWiOnUQU=;
 b=ZJUQ1NEdJnCfdykYPUacfyJ1tlIScTPrOEX6AHl5msnNX2BroFjR5MwY0vSSKl6bX/i4QpqxD8yi0MO5iP4acn4jAF5ZCVdGk5rOFXCKKrC41vHUN+YnIcDCeUi+a+qw7Fr6ikZ2VuQVZ9OprHf21BrIk0EQZvzZHe4y7i2Chv8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by IA0PR11MB7260.namprd11.prod.outlook.com (2603:10b6:208:43b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 13:02:44 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 13:02:44 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: <andi.shyti@linux.intel.com>, <chris.p.wilson@intel.com>,
 <krzysztof.karas@intel.com>, <krzysztof.niemiec@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v6 1/3] drm/i915/selftests: Fix unlocked mm.stolen in reset
 selftest
Date: Wed, 18 Nov 2026 14:02:18 +0100
Message-ID: <c47b0ea2093da73a92e9e6d62b062f9cc52851d1.1795006734.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795006734.git.sebastian.brzezinka@intel.com>
References: <cover.1795006734.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR10CA0018.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206::29)
 To DS4PR11MB134916.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB134916:EE_|IA0PR11MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: db18a31c-7f39-45be-6955-08df45743c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|261022115727099003|261026121527099003|11063799006|261022075727099003|261009223027099003|261021123027099003|261021121427099003|56012099006|10067099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: A3Q5InFUqK4qE/ZlTgRBG2eLwE22pr63ZUgZEeEBeyLIfTkgIS39U4nmNAQoDJIyHhK4Dth1feoSpt+cdECIZpICjDd74jcSYLjpdaf6Rw132NLviQN0ktNRXKC8fyULH2eVSv/nUok77Wa8bwbJvGrIQV+2zfzdmQRHm3SWDjTJH9mSu1iPl50Am/DWRsTJkWFd8rV4FhRlGJ5ZqbRs+Tr+09MXdjaBlUDVlRjyGg1Y9m0/VvjFpYC+waenJ69h+Bx7uCZ6Lh6DsxS++hJgtAaIX7S12x+Eft84pyIHo7bafP8eLcWDLJsjvLf73zk0SR75Sd2TqiWVyK/29GbU7+EYm1cGb2o/Nrv6vExG55mDVJtxEtAwLFdi47ACtaiR18ACCo1GZItJjk/kQ8Mw2Re1tJ1I7UDo7Gmk4MHTAy/GYmIzY2aIhqg38oxpLibPPzaIvl/WryxNTHuBhhdb6sl6eC5/XwtKwFY8vY+HTtbj5sPlSv4Z7jwmEB2zxK4J1fq9nz1xDmad/PGfgnzvY5FnIGieZxcdQond/moD+JZ+KK5X3892hYqjf+TF8C5A7u2agxe/8E5qwVtzsPmHpYBFepoKdKf/W8EouvJgKnSNDSbe2EHELtcNLPY9Lmf3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261022115727099003)(261026121527099003)(11063799006)(261022075727099003)(261009223027099003)(261021123027099003)(261021121427099003)(56012099006)(10067099003)(261102123227099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9e8b2SCCZxuiCAyv0Yi45VA/USYMjlKEVBQ9fIjlvH7mAX1tyEcUK/h1a7Lu?=
 =?us-ascii?Q?bfNMDlPReXuveulqZRV29k2rlYMhmUWzRnYd0ggwNg6eXdzxtoatNingdptt?=
 =?us-ascii?Q?HBn2tylXioNSLeP5Lq+TM/6Xvlr4IEYRtHOV/52AWvF7FG0w02Y9ImVGgxsu?=
 =?us-ascii?Q?V1gRbvoGAtJ8uoAGBO9pznpIg5L4sCT95++8GszuFlHxsAAIO2d+o4Mktr7s?=
 =?us-ascii?Q?V8c8eExoEGrULZWv11l6JEWUr+vEdw43aly//Zck2glwwt0yVEsvpGbz8Jh7?=
 =?us-ascii?Q?SNSDmejlbIfJJkidUngh1dGxUUJ10vjTN6P4Z0S/sjYFereDgNtOJkv1+kUX?=
 =?us-ascii?Q?WMJ+0X6EIdHs4uxt0Im7kjEhEtZdQDi8seCb4BE2KvrZSXlKJsCLzPSM4wll?=
 =?us-ascii?Q?+CfdisTJvEcXb0xb95UvIXO1jIt4scB0mMoBy0zuwVS8rfwuabMMeDw+LulA?=
 =?us-ascii?Q?UhUf9cODKTQA5HMPpnTEotaNBMu/TaxFkolG94b+VuRgBPUgkl6enxX2IFzf?=
 =?us-ascii?Q?ois+jLLzANJoCJJN5y+DDu6LfxAxDgcql50tOlq2qp3Z2asnbpEPcVYnvD4Y?=
 =?us-ascii?Q?fwTEMXXRnwJfrHBNSi0GRoCHAUiTSr4VwLIqiw25bnEjQPYSL3EvI5wPnKm1?=
 =?us-ascii?Q?dLlQWogJnL1vVQmn7UmQgtU8V1xVPpsA45Hqk8yeKSMkvc7FQUeerCaJRXwZ?=
 =?us-ascii?Q?7fol/rhQTXBz/pelLEH0jreHleC3TevR1xJ16Nuq1z6o+Y113Fx8A0A5n+7x?=
 =?us-ascii?Q?wvC+Uni94YzKntSpfq6qOatkGD+7pou/iNicrjvfqLfsUrB5zYWkUvInADC5?=
 =?us-ascii?Q?34arxRhGsyXj7BRfevBPrJxNPs0VcJ/87Y1ki27SNBgleLhKeHxTRh+llx4h?=
 =?us-ascii?Q?y3kH9N0FM7hIQ+vFSB/gbYyPQe/m5rxvfxPtF8yl9STdHchTr4QYPpB12G9m?=
 =?us-ascii?Q?YJ22jdszdtL1ix7McFTTdNA9a/E6bJlborJZGRr78HvkByQDKfu92JvMAwrQ?=
 =?us-ascii?Q?fQMej2x8ycKX8O24wWW344VUkBm14xRaV0pH+OtlouY3gDIy8kZkFrpp+9oA?=
 =?us-ascii?Q?WqGrvUQ6a3unX7DGt9+9cIxof8GwNl0kyN1OhKOn5rZHs5JyKSoS61ZNEkp/?=
 =?us-ascii?Q?7aOBRBTBr+mEutzlYNxF4/iXdZlCoWXqCGUIIeYcfBAT/ZmsvMeTvOwvUWwt?=
 =?us-ascii?Q?a0nxaGS92C5+qrN92QvQ+f0xtNxxAdfkAR3EoGo3JtTZg+B/D05HK2pHi/4N?=
 =?us-ascii?Q?teXP9nnd8I3mhRPIG1DznoR2B7F8rwGsoNrRP+Uw9wsm7UvlCXXzQuXcHnA/?=
 =?us-ascii?Q?5RYfgN6GWFwm597jD2ZWDIO09EpAsZjBfx2ndJBd0I/6IKzGM0mednwUjaOI?=
 =?us-ascii?Q?wVLM88vN5ItdW4J8PTY23eoXVZvPFvNcnUzoa4ivVV0b4npz5UzA8XvKHTWU?=
 =?us-ascii?Q?lgQJI15wd+ZszrWplBBLYyUKHwfCrXawRk0Ydapt52qNO9miDYQ2k3szJKTP?=
 =?us-ascii?Q?SuWBWxs3J0llO7z0XtGeQKKbAE0d/Mp4xGwFWJoykPJnXdniU3yrXiKh37va?=
 =?us-ascii?Q?C4GT7+NfM0aj07kjJwwVKpIO9FpfHxqBAtCsNDvhyYxp0CwcAtCtiAkWeWUi?=
 =?us-ascii?Q?I38BUItXELc1sE6OhjJLPlDVshwYg9axl4CaAfS/SukbZrcOL3cFdg4N09Pa?=
 =?us-ascii?Q?LnqvshyNU5mFLSrqrg0bXQf32JOZNSibuPzhd5zoWINfN52FDWnsJcvLW4s7?=
 =?us-ascii?Q?iDblAmQbWfB1wqw1VI0oBHv6r9BAo6c=3D?=
X-Exchange-RoutingPolicyChecked: sMwY59ZSfQUcAuqQgYtoke61zH771e9rbsy89JEkcsYJlAXARABskhxxFF05plC/oOw1AJHJdNDF4JP0pQJbIZAs3PyzLt6XWSML20rndEft5Lf5P/1ceV3qrrVMLZWf71OJ148hAAIk3EFsQH+VaygMlPgtcM59cIOC3Rq/RvbKtuqwUSA4jieyASdwHsaxqFT+SvxsAoZ0ywi2ntUcAiziyB6tHxXzyTNYLb1YHsOA0HH/AC/9DlCYM+G5wVLs5QdR6F74cj8BspJFFbaQQpiP+SHI9O5e5i7RMYbsZ8qG9OeIPwCEoqZNTihPHtcnS2P7zdN4g1hxarUDJGuA0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: db18a31c-7f39-45be-6955-08df45743c33
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB134916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 13:02:43.9568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0xkwzUMvVowNdEvkMPPTsZrdHU8mmYZyhSlVfaS/CqrRhZDH5BH+9f+YuVOmoc8n7lQ0pJ5gOPhhVF6e4+nnRw3/c3kyFLKGLwE/RUTpAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7260
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
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

_igt_reset_stolen() use via __drm_mm_interval_first(), but
does so without holding i915->mm.stolen_lock. Every writer of this
(i915_gem_stolen.c: drm_mm_insert_node_in_range(), drm_mm_reserve_node(),
drm_mm_remove_node()) takes stolen_lock, so the selftest's unlocked
reader can race.

This was observed as a NULL pointer dereference in
__drm_mm_interval_first() during igt_reset_device_stolen():

BUG: kernel NULL pointer dereference, address: 0000000000000010
...
RIP: 0010:__drm_mm_interval_first+0x2c/0x90
...
Call Trace:
  __igt_reset_stolen+0x565/0x6a0 [i915]
  igt_reset_device_stolen+0x1a/0x30 [i915]
  __i915_subtests+0xb8/0x250 [i915]
...

Fixes: 3da3c5c1c982 ("drm/i915: Exclude low pages (128KiB) of stolen from use")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16841
Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
v1 -> v2:
- Fix always false !__drm_mm_interval_first() check (Andi)
- Extend stolen_lock over the poison/verify writes, not just
  the lookup (Andi)
- Move the lookup into stolen_page_unused() helper

v2 -> v3:
- Cap num_pages to i915->dsm.usable_size to avoid poisoning
  hardware reserved stolen pages (Shashiko)

v3 -> v4:
- Only verify pages poisoned before the reset; pages in use (e.g.
  rings) may be rewritten and freed during reset (CI)
---
 drivers/gpu/drm/i915/gt/selftest_reset.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 2cfc23c58e90..7d4b0382fe19 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -14,6 +14,16 @@
 #include "selftests/igt_atomic.h"
 #include "selftests/igt_spinner.h"
 
+static bool stolen_page_unused(struct intel_gt *gt, resource_size_t page)
+{
+	lockdep_assert_held(&gt->i915->mm.stolen_lock);
+
+	return __drm_mm_interval_first(&gt->i915->mm.stolen,
+					page << PAGE_SHIFT,
+					((page + 1) << PAGE_SHIFT) - 1) ==
+	       &gt->i915->mm.stolen.head_node;
+}
+
 static int
 __igt_reset_stolen(struct intel_gt *gt,
 		   intel_engine_mask_t mask,
@@ -79,6 +89,8 @@ __igt_reset_stolen(struct intel_gt *gt,
 		i915_request_add(rq);
 	}
 
+	mutex_lock(&gt->i915->mm.stolen_lock);
+
 	for (page = 0; page < num_pages; page++) {
 		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
 		void __iomem *s;
@@ -95,9 +107,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 				      ggtt->error_capture.start,
 				      PAGE_SIZE);
 
-		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
-					     page << PAGE_SHIFT,
-					     ((page + 1) << PAGE_SHIFT) - 1))
+		if (stolen_page_unused(gt, page))
 			memset_io(s, STACK_MAGIC, PAGE_SIZE);
 
 		in = (void __force *)s;
@@ -143,10 +153,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 			in = tmp;
 		x = crc32_le(0, in, PAGE_SIZE);
 
-		if (x != crc[page] &&
-		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
-					     page << PAGE_SHIFT,
-					     ((page + 1) << PAGE_SHIFT) - 1)) {
+		if (x != crc[page] && stolen_page_unused(gt, page)) {
 			pr_debug("unused stolen page %pa modified by GPU reset\n",
 				 &page);
 			if (count++ == 0)
@@ -159,6 +166,8 @@ __igt_reset_stolen(struct intel_gt *gt,
 	mb();
 	ggtt->vm.clear_range(&ggtt->vm, ggtt->error_capture.start, PAGE_SIZE);
 
+	mutex_unlock(&gt->i915->mm.stolen_lock);
+
 	if (count > 0) {
 		pr_info("%s reset clobbered %ld pages of stolen, last clobber at page %ld\n",
 			msg, count, max);
-- 
2.56.1

