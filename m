Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C578CC44539
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Jul 2026 10:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C3610ED46;
	Wed, 22 Jul 2026 10:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTXLKfko";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8F410ED47
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Jul 2026 10:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784716120; x=1816252120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AWgquyLvBfWgLqMPn8YVO/hCSnIY3pw6W9aFpRSZTKw=;
 b=HTXLKfkoDYKuW4T1dYr1AAAvXtT6chqSo92HAlNGH4ikfRWE6Vr1imzy
 B+dlZk2cr6BYxhHuLM1+WIhRskdfksY/e9h9WpRGZAucMqxUCycyGaPoZ
 M36dXyoJVI892FfwmVXyIvblVIEMtHm8IiYu2A9KEGKz9AopLrKdLisNI
 9Tu9AjPg6nVAdmUYnlwjltDvk/UpM5IiiXH+MnHmA+SPOzEAcx48cnwtw
 zKiihB9Z5cD7+2kN8V4bMQVmZjPOq3DzY+NVnMQUypn3IcTGr69BLyKuD
 dDJoiX5RAQfODOHPygXfEhvFxMEkGkStdYQj2tOorC/FmurCfsxBWjA7n Q==;
X-CSE-ConnectionGUID: BVqstr61T6qR3HYq9Wu2fQ==
X-CSE-MsgGUID: 5NlnHU4yR+i71G3BBIxEug==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85110215"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="85110215"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:28:40 -0700
X-CSE-ConnectionGUID: rNryMZ+wRYuj59rzpl8WkA==
X-CSE-MsgGUID: y/ovVUGsTTSYi2W4lqWYhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="254143384"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:28:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:28:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 03:28:39 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:28:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PM6RWo/QDoQutGnpcscQD/RiGhN693rHGOskpgAydiS9ICbotkWebcqu/u6vFJVLttWZ6vGsEXAIlBRbUJiC9DLd5Bmnd4rK3+JfLwQI3/cUcyEPAOMIMqWg28T44YJ7VLl9ZoUerJ/L5D8lhBf1Szd257/XZv8GHEpTCie7Jv0w71YYXOdKwYZVsytFKZGQ/O6LJtjlHg1H9zFGwuEwil//UG8n/H2VGP4sUxXkJEjKmHYKYI1N2wkf2PoJ4Koj8+wmi2+O5Qc5WGd7ZNlVgSMfIxu5VngL3LJ3qkBkIHV9WSRwqagEmdTZHlwHsZSFii3PbDBtEHdttZpnSCqo1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiEkm2GSC8581CPinFnS3o7rklwi5/Sdolf1F4q844M=;
 b=TT9otyAk6ohqVgkA2PhgDr4GfX/MiMPqEl9SFgL/COPY1Ri0PjkUWr7uQpnIjWwB031bpSiZdW9pDJYZODd+ZniAmuqy8bWi4gFeE0yxwVzOVyPX5Gp0vmUDlKLOLr1fEyX7j2/H0bpoYT4sIdUfk7dWRX+ey1zzqU229upuz4PU0brJVNea3p1gUJq8TvN2mvB/ci1e/exmkD3v7abs0ykSGo91C9qWhmTuOp9rAMhIezQRJIT3PLOOBA1JAeVIR+hCjvnV3B1xLi0wvOr35+TR4/KzgEEeStFSBoSxbNM7i8nbeR3hVe+sTjSV0k/ASPCf7m2Sm/nDZzp0ZEozxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW6PR11MB8338.namprd11.prod.outlook.com (2603:10b6:303:247::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 10:28:36 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 10:28:36 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <andi.shyti@linux.intel.com>, <krzysztof.karas@intel.com>
Subject: [PATCH 4/6] drm/i915: Convert IRQ/uncore/power license headers to SPDX
Date: Wed, 22 Jul 2026 12:29:21 +0200
Message-ID: <74002516f4421d5bc1b1d8acb36a02109e22a6dd.1784713895.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: bde85164-5393-4432-7d84-08dee7dbfc49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: d5eTTTmchGGoobYVPjKyn5vbyDVEPvklLtBc0RqG5bAceCnEgG3+U/UfnxrmagM4HmhrAUea+mMZs7K0lc527zJhLAxprgA0Tyht6HH0ih+UVSUz6Zh5nUiH3yV1sErlXGSxcwb2haGbAPOeitfLXVLOHNvevaWUEfnbW4d9tTvPcfgSgd81gHY87U8rJZ8K4oWl7jEl7Q86l7kgm9gtK5blJQH7qWrbBigCLAT5VlGYDT1OZt26f125Xn8RnEI2mTc/wGbjZXGDqrckMxzWGYrmuM+amyaipDqLtJMbotx53njwehkpMtasXBxcrXF0MiqhkLme41mS7inB9onTTZDhADWm2PlF7z5AcTWJnPHLeNFhUdZXM5HinHzgAuUxj6xMdwkohmSu/BjIEP/PQlUQGcQJg8bXHY/+I7u+wdQnNUN3QkDig4IvKbnE7/VyQVO9m89fTDuaWYptIUA05FC6YydWCbPjCUfVJ8kbSPq1puwXb6TTtLLQzUyN447FldahakZVPyB8A68mzDjH6uYED0ztg8xFy6CUj8j8sRAdcfjiunL4SGHBiOTXjYNZnY4JWZsOemgaT2SS8jSaEctFFWDLvcnB1CcStnsj+E5FSxIUhBv0AhQbqfEGlpOSXuYmuOYblXU3/NGIQbuDkQayO8HsczeszCfvgUF4ccY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVQ0cjk5L3puRXhEdWpWU2t3NWFOU1lPU20yZVk2NlNGNWRqNjRvRzlhVjhP?=
 =?utf-8?B?NWpCUnJtZW9rdE1QNHJSUnN2UnYrYWxtempzeENpd1JGd05sSEZuZnVuN1Fm?=
 =?utf-8?B?M0FvRU0rNnZDTTFVT1RQWjIzbGg0QU1FYnh2TjVidzczSWtOb3JoZWwxY01N?=
 =?utf-8?B?RW84OFhUQjNha2U2QWNaWlBYTFBvbGJBc201Z0hHcllQREtadXA5cHRkblpk?=
 =?utf-8?B?UTQ5emlia0taZkFUYUVVZHFlRndNTnJGblcyekhFbk5wSjE3Q0wwaXdZQTlo?=
 =?utf-8?B?N0duQVVFejNuWGhUU2NFWWlwL01iTS9oVDhTeWw3dFRxL3l4SDFUUmpCNldD?=
 =?utf-8?B?cGZaSElPMXNFYTRaTTZwWHlNMGlWL2JSUjZOakF5LzZEeGFKU1RLZ0tQYng5?=
 =?utf-8?B?ckdaelFnajRqVzJBQ0hkc0JWeGE4RlExVXV6NlE3RnBIZGxxMGJMWGdjVHJY?=
 =?utf-8?B?b0VweU5UcHBzZXljcDVqZkh5aDIwZkJXN3JZRGhTdTBWd2xGQVlOTmNtUWZC?=
 =?utf-8?B?a3lmZ2RralR0VlgvNlA4RU1JckJTcURKY2FVMDRmY3RWTUtSY05qWDVNcU55?=
 =?utf-8?B?YUxQSm9kUTZkb0xXSC9hTnBZendFQlhSY3doZHppSkVOaFhNeFVRazRQdUwy?=
 =?utf-8?B?ZURKOFBFN1Q0bXVhZTM1UDZWclIvREJlTG1rOFBsdW0vbzhqaVc2WWttN0py?=
 =?utf-8?B?T1g0WGU2SnhrcEZWWU5JbURTY1h2MVdQYnYwc2NaZUJQTUZSeVpQalB0YURz?=
 =?utf-8?B?UnVGdnR5cTZJSWt5QnltTzVpNGRUbnZvTnlubnVrdU53UFJvUmwwYlVUOVFj?=
 =?utf-8?B?K3lSMlVWRUlBTmdFWitFaGNYbTVXTzNtZDEwYytwNlZUUWlXaVdoZ3FWd3dw?=
 =?utf-8?B?eVIwdFp3QUp3U3ZRVWt5RkZnUUdiYjhZVFVSK1ozT3d3dmxMdlA1emNNK3V1?=
 =?utf-8?B?aVVBTnppQ3d4LzNDaFBpRkZjMXJaaVIyVG9ScnpDc2xLS3FhYVhBaVhENzhU?=
 =?utf-8?B?bVpONjE3VThJYlR1eDdIeUZDcXp0QmgwZWFtTzU1MnlaMnEyVkJjdCtmY2xL?=
 =?utf-8?B?WkxJZU16ei9GQmE4SitPaEgxYWVzSUV4V1RWVExnYmZQa3RJR2xMdWhVNTVw?=
 =?utf-8?B?MHBWZXJDb3dFcWV1Q1FHVjBOd25SMVNnVFYyNllidU5TWmZSOWFTZ1hqeUg3?=
 =?utf-8?B?N3BvNkpFbWFyVEQ4T0gvTHpySndSWW1JNGVpMnBmRzdJU2QvNklFdnhwT0pk?=
 =?utf-8?B?LzBpa0RJV3NnYktqWlRLS3pXdDhZbllQZ1FIdnBqM0ZHQnYveWRleGNLUkl2?=
 =?utf-8?B?N0puTXp5UmR6aGc0WEZFcDE4cUY3RFR2WnYvTE5ZM0tJT3M4TXllWUJLTGlP?=
 =?utf-8?B?RDJ4NVZGTUJUUVVSampHcnlXUHAvdm5GUUdYN3RXSDZic1hoYmlqTGxRNVpm?=
 =?utf-8?B?eDlXdCswa3B5VHl4OXM1MVlJOWo0S2xBY2R5SlJCMUUwRDkwTFhjVlhFOWEy?=
 =?utf-8?B?NFpIdUliK2ROMXRyM1VqU3oxSjJaME5vQWdPZE9taDdyNDFWMDk0RUhqYmo3?=
 =?utf-8?B?QllzckdMd2ZKd1ovbkMyMU1VUVlZc2R1QXN5UCt2b2xlZ1N2VmVGVmsxUktM?=
 =?utf-8?B?c0E4S0Z5OGlTT0dJQmxEWTcyQzZZR3lYV29XMXpXNFNEdUUvb0tuVTF6T0d6?=
 =?utf-8?B?TlU5dm9Zd0dxczZKekp5ekVPK1N1cGltaDZ1Z1d2SGJkTVQ5QURUaVY2QmNV?=
 =?utf-8?B?OW94c0RYOVBCblZaNGtTRFhLVlFTRk9pWG4rRGphaEM5V3RpMmgvbzNTeVBX?=
 =?utf-8?B?MDJLVDE1WE9nNzc3WGVpZmE4K2h5WmpOT0Z1N2xGMXltZWlkUjlaTmk2aW50?=
 =?utf-8?B?RWxIRG5FKzA0Q0xHU0szbVlwRWVRRk5yV2JDaEQrRXJ6aXZRcjZBVHpsQXpv?=
 =?utf-8?B?dFpNSDI5c1U1VVhPRzc5eGU1NUdkeVYrK1VOWEg4QWl2RG1uSzFWVXAvUHFn?=
 =?utf-8?B?aEV0SGJXb0pMdE9sa09sZlFSUnEwWVdMN0lOUWhlOVN5MWNEYURaWWtsWWs3?=
 =?utf-8?B?RjhpTHB1NjJEd2duTHp3S3NobzVyOUgyK1RTdUFkbWlJQTdEb1F1dFcxMkVx?=
 =?utf-8?B?YWc5Mk5oRzFvc3FRNUV4YzF1Z2Foa3F1STlBWjZaL2pWOFRaOUpXQWNUZ0VK?=
 =?utf-8?B?N2E4UC80b2JzZjNoaDV2Q2ZzcXFkODJ5RlFjVFZXMlF6VDZFdVcraDFoblU4?=
 =?utf-8?B?RmZHWE5IdlBENGJUWUdWeVJmODZkaWhxeEdRMkZyd1hTYWUxYlJKeERRVC93?=
 =?utf-8?B?cW96V28rbm9xNkZyc3FheS9LeURuWXFCek1xMjlWU2VweFlaejYrZUdSeTdU?=
 =?utf-8?Q?VNa1qCxl9gkSEdOI=3D?=
X-Exchange-RoutingPolicyChecked: Dce7h8DshSPffKL93tyJBWEIxQiLjxj24XPzxqCnKhwg/re6NJ2AgooCJgv+LgiTDbyMIA8pd9oPQdNUdVBG1Ffp/oqPb8yBe6qUyjgSelaUhkTvfBmrhQqb/cOvziOVDNb6DX1n7CX7TjqFs9cfKbawFh2KDxP2iZ4V0vwNhCptls5HJLLuhBjN9G5qRLa3X2drSB+qBPQvtd7zbJID8Ns1k+dShXJ8i7BTdyms9FtadWDofKy3+a2/F06TsQ312GBc9BnQ4D/EHFEvBzzgbC6Ie2aKJXKnDUBJOM20/O71h9jpSQ6x86u8Rhx+e9Lw93l9McIHmVt9yHCPItvX+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: bde85164-5393-4432-7d84-08dee7dbfc49
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:28:35.1425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYOtX0wkeTrJX+4WCsDw3R/HyWk2xTdUpluoR6z6/mDojB5QfnAJE2bPYeIOvofMCr3ZGu6lmivlfZmEsTzxzOQ2BSaqKpK6BiGN4KhI6EE=
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

Replace the verbose MIT license boilerplate in the interrupt handling,
MMIO uncore access, runtime PM and clock gating files with the
corresponding SPDX-License-Identifier tag, preserving existing copyright
and authorship notices.

No functional changes.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 drivers/gpu/drm/i915/i915_irq.c           | 26 +++--------------------
 drivers/gpu/drm/i915/intel_clock_gating.c | 21 +-----------------
 drivers/gpu/drm/i915/intel_runtime_pm.c   | 21 +-----------------
 drivers/gpu/drm/i915/intel_uncore.c       | 20 +----------------
 drivers/gpu/drm/i915/intel_uncore.h       | 21 +-----------------
 5 files changed, 7 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 932409b943ad..0c193c06d93e 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -1,29 +1,9 @@
-/* i915_irq.c -- IRQ support for the I915 -*- linux-c -*-
- */
+// SPDX-License-Identifier: MIT
 /*
+ * i915_irq.c -- IRQ support for the I915 -*- linux-c -*-
+ *
  * Copyright 2003 Tungsten Graphics, Inc., Cedar Park, Texas.
  * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
- * IN NO EVENT SHALL TUNGSTEN GRAPHICS AND/OR ITS SUPPLIERS BE LIABLE FOR
- * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
- * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
- * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 86bdeb20f427..daa256d8ad9b 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
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
  *    Eugeni Dodonov <eugeni.dodonov@intel.com>
- *
  */
 
 #include <drm/drm_print.h>
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 0d5b2624fe66..d59e7a298a9a 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -1,29 +1,10 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2012-2014 Intel Corporation
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
  *    Eugeni Dodonov <eugeni.dodonov@intel.com>
  *    Daniel Vetter <daniel.vetter@ffwll.ch>
- *
  */
 
 #include <linux/pm_runtime.h>
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 170e83a8c9fc..47ba2db6a52d 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1,24 +1,6 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2013 Intel Corporation
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
  */
 
 #include <linux/pm_runtime.h>
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index fafc2ca9a237..19fecfc22089 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -1,25 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright © 2017 Intel Corporation
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
 
 #ifndef __INTEL_UNCORE_H__
-- 
2.53.0

