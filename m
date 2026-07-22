Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F02C4453A
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Jul 2026 10:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFAE10ED47;
	Wed, 22 Jul 2026 10:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WVduuYFE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39C710ED47
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Jul 2026 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784716120; x=1816252120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=19ovSr3CKm+wEQ6GGX/LUyhHtYmwMXMMefREDGwQEfw=;
 b=WVduuYFEPfoj097UxuDgeRaO5GkeTlRcOB/YkhSOcvZQH3hJUUFJmodG
 sh0wZjyUcX1yCzeZpV9QR/LZVYLjkN37j29x/r6/hJJjGKlCL9MiGtvll
 I1cSZZhgwnQjDMJoGji1vG5gZt4bQ6GSR3yDd/zD89/0ZWQ8VIZs3fZQj
 leEd5mH1iXs8PwJ31rov7ZPQaER7lGRO4Stxnsjt1SyyRTIzzbuJSEML3
 KAXcGklpE2WuaA2GL2J7XxeNyGYW7s/xbw9nvi5ZKehGRiaka5ozt+CAn
 QBli3K7EUgNHn/McAH0B6bCivKF8EpIH4dGmQxeEsDz1uShOnniy1wirk g==;
X-CSE-ConnectionGUID: zYGlkQa+Tf6E5Dfvks03KQ==
X-CSE-MsgGUID: pneLRguLS76hGpUR8wG/TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85110212"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="85110212"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:28:39 -0700
X-CSE-ConnectionGUID: 9+49UyPZSDynC4CclKjirA==
X-CSE-MsgGUID: JAzGoQRKTICQ43X8aQeVUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="254143382"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:28:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:28:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 03:28:38 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:28:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMiOIfTzUGFcCio2xDiGmbZrL/H825fUPF3AAKRZMsy+6PyP04cOWrAAx+PsX0Z9qgrmVG9/DK3fO91+grys/ar9d5ByssufHMmKabLMBTu9iy8WWY3E5+X3o6vFefO2Xus18jrZ2zLqd0XdYOov/NyRrFA4sfJo4aWh//xGwsFR9bfCaU0+NMJsvQpemKbJsYNdA1LJLG6wwaswHaWNvHZRFC51Kyb4ccDmeSs1KwJY1hypAqST7fsJTg80yMpwVfF+IFI5H5j5NH5cNkGkV+vWVkYj6g1Q4EnV7hBDIqJF6HkKn8nDYju5w2sU20uyR5aRE6jTAaZNqYSS1h0QKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9VK1kAaEW6YJh7XO4+pO3zuHPXOjPLMnhNRZ1K5808=;
 b=qztSM6J/1mXhadzDq92ortAzZfDgYzKwmknH3p+3cfQ7F0LAuqaMlNxrsPCtyTp/nC5mTKNFnZxSAovA0gGbTsjlUPmxl5nf72wFAUigZs2Aa/7zXKPsgjg/Xbttcc+KCw1iklGTtBztJoDXYrhm/onE1QOdu06B1SwUFDSBMHLGqOOE2nJrSipGmAHuPJt1+Jj8ROYIbgS6MCj0pZ+JBSGE1sSV13rAgdTmsZlIi/fy2g31JzYuJ2YCjGy/8eDXjl3yvcrrtnbNQydwzpSrg7qOM/eZzN5H/Q0zyEWuu0/fmzPVHhnKdP0ysqs0vgDzaV0lu2kLSQ8HUzg7rG+vuQ==
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
 10:28:35 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <andi.shyti@linux.intel.com>, <krzysztof.karas@intel.com>
Subject: [PATCH 3/6] drm/i915: Convert request/sync core license headers to
 SPDX
Date: Wed, 22 Jul 2026 12:29:20 +0200
Message-ID: <7de4d238315eb45ee15a05bdcec5f7a6f54dd7df.1784713895.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 27dd4c3d-ecec-47e4-6890-08dee7dbfb44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 2EFInAq5iSK1Vst93M8YvFltIAEsY6hT1FlcW2m/5UIt8ZyYYh+uHnryxUbsDYxwG+vbZW8bs8q4WX3uoIGLTnl4yecSe/+jPnNlMAMx7dsPxlhRWfM3PD53gXZOK9U1EwcyM2N4fvbqJ+DQb5Mm0m6XkYPdS75sAqMhUf5lIZrjBEGj/N7FZwsQQPD3tB5djAo+kv/ujYoYcTG0qQ5e66DCEW/V0Rvi2X1c0/bKyLQSsl4ACWOyBPknQr/+X0lwLywu/Sx/08FAaMsdtKXRzX5cqhYiAYs+P5qsWPom1AhTHYTDGYqIj4ZjzAR0bfOTFb52XzQLRinbVV2yD8lOTEX/AO/lyKD4tHzN/pVmOR4CPyIqi1srhmOTmoB9YmAOxLKNXKO55OAePqcQectDyMtddphmnReee9hDaddE2aDzmZif6jEIpXcA6z/Gt5X/ZXZoRiPiCcT+F48ndP+IkzbhckZM19VqsllEWvOla/cnvlNYYSR3YLWkS3oSelP1TOgohDYa5vj2nbaICx+HwJPG73B8vgiyUZ8VFccaERcVsTLUuUMj0GZs0Ixnsx0mAlbPEYS240J3iHU2McVRpZzGguSBb3d0xZ2jeuQR/DUGjYIz1zdY3x0e60ZQzcZJ0iZkT3O/gAJjYxux1dNPWLin/v1BxPSRDioU/7vEM3o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmZSVUNpcEkrT0NNanlvZmhNelRsMWx0QTZTYkhoekhvbE8vQnBIOFkrbnpQ?=
 =?utf-8?B?MDl5L3ZqamJvUHQ2Vm1CN0VaY0liL09LaUxzVm5QVXZvdmpMMkx4eFBaVmcz?=
 =?utf-8?B?RUplWFZYdWh2czdMNk1zWms1bDBmSU5STzdtNXNMaDJaTkt5dFQvUThjS3hP?=
 =?utf-8?B?SzlvcnlOcHVmeWJCWGNWN2FvQ3Uyb0dkRlVpQTNxai9JSGFGL3E3U3dubDBk?=
 =?utf-8?B?aUFwWElJK1BYYUNnWWkybzUyWXJYdkU5SWRHaWpPTkc1cnBCSG5uNmRKYUNN?=
 =?utf-8?B?R3Q1RmRJaWdRRDZLTHdIVDNOOHJLMVZNMGdDRUtrdmZacGtoWENKUlpHbFpr?=
 =?utf-8?B?SSt3SW5wUWdFNUdMTmg2cWRUcjArbjQ1MWwrNXhqMldhMHVtQUptSmtGSFo1?=
 =?utf-8?B?OWtvZjFJc0J2MlJuRjBmQ3VrcUp4dlZxQU9SU2NQZUpOQTNDZks4WU5oYzFT?=
 =?utf-8?B?R1JuOFJQeXhRbFJHcmxud2Y2MmZIN04yaE1rWkVSMGRndHFWNnFhZ0V4QlBJ?=
 =?utf-8?B?THpnenJRL1QyeDZyT1A1WHdwZmNHWlhEVXNvdGxnRUZhek1VdHdVTnJCWkdP?=
 =?utf-8?B?Yk1LVVIyZVpOdEJ0MUNnL205RTZNMDZlditNMGlvWXpNdnIyNmkrOUV2Qmd1?=
 =?utf-8?B?WXF5TGk0MFE0dkhtNEZUUlhGYjlISGN1bkZnSVJxalc4NjZwNDVoc2RxaS9v?=
 =?utf-8?B?UUdXc3d0TXFNR0VKS2RDbmhKMWQ1eUx0YitlbHI3M05ieXNtd1ZHcmsrQkJW?=
 =?utf-8?B?OHFQbFU4Z0JaRmdDRjJHQzliK050SVJkNzAwdXM4azlpc2dJV00rdlNMbmlm?=
 =?utf-8?B?RGRIaWhBSU1lMVdJTVdmaXY5Sy9XMWxlT0IyVWR6MjIrQWRDbVU2UTFDUCsv?=
 =?utf-8?B?b0VSTDBIUUFEZ01zMTNjWEVvcWlha205cXp5NDFYQmQ5UWwrQ2M5WGRWakdJ?=
 =?utf-8?B?M0d1L0NQYTNYVml5dXN5bUhEZWtHRWJDOWhweUU3bk5vRnBlT0hzeE51TTZJ?=
 =?utf-8?B?OWdOcFZnQUNWdEhJdVovZXhzNDNXaWJHK3dTZFRqWDROakQ3WVdzMkdVU0xF?=
 =?utf-8?B?WnE2QlAyeEpPT0pwT1Arb0E3MjNoRitNVm1pMUFtN0RBVlFsZEc1ZDZyVk02?=
 =?utf-8?B?c0g2V2xBa0hKaFc3WHlZL3ExQUJOY3ZLMnFZNjhBalRudkF0TGhKUTlSbmdS?=
 =?utf-8?B?VnFZRHJiM2lQeWhsV3ErOVRiZTc4M1dONFV2MWVLUkxwTVRJZEZpREJCc3VY?=
 =?utf-8?B?Z2RIUnM2RW5oK0RlREZ4bFdaeXFFZm5IL0M0YVNISXpBUFhob3lBd1FOZmxq?=
 =?utf-8?B?VTluU1ZFNVR3MUtOTERLN0E5VDJDVWExL2ZHQUVhK2RJM2xJQjh6OU9EWGpy?=
 =?utf-8?B?M1NJbytma2QxV0hnc3FvVXdPdWxYVHg3aFYyM245K1BQUmtBa2FKZStVRWZC?=
 =?utf-8?B?K0VVMXV1bTRFNWRBSFdBRk5MVDlmSExXSmh3dWEzMDQvWE4vaG9zcy9KRUJt?=
 =?utf-8?B?czdSYkV3VHVDTmYxbW41L0g3WFcrNjlHOVZFNVhIZStlTEVSaGk0VlN5VVpi?=
 =?utf-8?B?QXJsRnhHS2pmbHNWSVEzVUlKRnhJVHpFdVJBOC9lK1pNS2tadEZjNFEzbi9C?=
 =?utf-8?B?bkhTeHhXbVFmd2VSaVplekU0L2dRYkRNMkpkTkJVUUkrVHhyWXRLdkdTdWZ6?=
 =?utf-8?B?b1IzU3Y5WGhJN25rT1JaRms2cFdaSXBvMk81M1ZMclBXQnNLMXpEZldTQm5H?=
 =?utf-8?B?VHBVbUhRcmRlSVBjcEtZbUlhTm9FSzlReldYSWtITHJ6OHFTL2ttdUtyQzBk?=
 =?utf-8?B?L1lpUjN3SkNZSjcyWlBaQ1VYZzRTT0xqUmMvRTVua3l0TFdOUlVBNndPdnhn?=
 =?utf-8?B?SktuTHMydWg3WUUvM3RNQTlDZVFlVnlIdllBN0UyVld0WjNTbnR1RVRzeW9Q?=
 =?utf-8?B?Zy9YNTdXdWZMQnpzLzhrUHRyd3JFQUpvS0lGZ0RETEMrSUNpdXBiYy9Xd2la?=
 =?utf-8?B?VTFhVzVPOGxiNjJVREtiWFNhWFZiMXF0blZPL3JNbS96czNDVVhSNkI4QXVk?=
 =?utf-8?B?NmJkQmhJeExPbHZOYXFhSWVpc0lGOHo4WHl4V0JFZEp1Yzh0Mzh1UDJ2RmFB?=
 =?utf-8?B?Y0gwY1hFVjVMd2hjbkhqMXg4SnVITTBqTUh1c2U5b2xzelZDaEQxOGlBRi9P?=
 =?utf-8?B?anNqREVhQ3YvS0NLeStULzFlNXhoK3VteDVFUHBwOVp6TzNXZ1BjRjl2SEFF?=
 =?utf-8?B?OVJQdFk0VWR3SVhQckNVbGExaFRYbFN4YngwcFZJUzBXR0ttNEU1MWtxR1I5?=
 =?utf-8?B?ZXNWU2phc0poVXpCaUdTYjFjT25lVnYwLzZ5SVhwQ2dZd3RPR1RjK2d1dncz?=
 =?utf-8?Q?7uUeouLymSUnA7EM=3D?=
X-Exchange-RoutingPolicyChecked: sdyQlavJKjIA/pCh0RRO9QcglUdp/Mr5rFRjYh03YO6XP+LK48y2FcVMx0Pea+ZONhYZsppkgzYw+LztQTd33a7H5PWyeSaswzcLbjBJDkA4OZuR4O72dRaEVd7BfIcBVUEkQjO4i1MMqxX/XLVHmxlDWZk0GEdlm4RnSOahEQ5rXgG/eFb1lGwOioEQGENNgpPxjdoVF+qVVK35/PhYDKUMpc9DTIi9FQ3via5wewRb1w8oTHcyWwnR8ePQ5l94dz4D2jS83MK2MQq52gqB0galedzyQLRnwJM1x0tr6TyoBcJvkoGBvvXz3YXc7fwL1oC7XyXhizg5qoJ+xRHAyQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 27dd4c3d-ecec-47e4-6890-08dee7dbfb44
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:28:33.4362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/SVvuVBpFbfMDlnTzNJkucDTZ2pneLqGCSf1c1XKDW5SN9FKCgb8hic7UPWUaExUtBOTJgWIyHFGGfliZeoJfWmPdi7IM5EuprKe3EpBUc=
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

Replace the verbose MIT license boilerplate in the GPU request tracking,
fence sync map and selftest support files with the corresponding
SPDX-License-Identifier tag, preserving existing copyright notices.

No functional changes.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c  | 21 +--------------------
 drivers/gpu/drm/i915/i915_request.h  | 21 +--------------------
 drivers/gpu/drm/i915/i915_selftest.h | 20 +-------------------
 drivers/gpu/drm/i915/i915_syncmap.c  | 21 +--------------------
 drivers/gpu/drm/i915/i915_syncmap.h  | 21 +--------------------
 5 files changed, 5 insertions(+), 99 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index d2c7b1090df0..cceec09d7695 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1,25 +1,6 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2008-2015 Intel Corporation
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
 
 #include <linux/dma-fence-array.h>
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index b09135301f39..731bd0dcd69e 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -1,25 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright © 2008-2018 Intel Corporation
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
 
 #ifndef I915_REQUEST_H
diff --git a/drivers/gpu/drm/i915/i915_selftest.h b/drivers/gpu/drm/i915/i915_selftest.h
index e29ca298e7eb..54f4ac495504 100644
--- a/drivers/gpu/drm/i915/i915_selftest.h
+++ b/drivers/gpu/drm/i915/i915_selftest.h
@@ -1,24 +1,6 @@
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
  */
 
 #ifndef __I915_SELFTEST_H__
diff --git a/drivers/gpu/drm/i915/i915_syncmap.c b/drivers/gpu/drm/i915/i915_syncmap.c
index fbc3a13a4974..abc3e5792fda 100644
--- a/drivers/gpu/drm/i915/i915_syncmap.c
+++ b/drivers/gpu/drm/i915/i915_syncmap.c
@@ -1,25 +1,6 @@
+// SPDX-License-Identifier: MIT
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
 
 #include <linux/slab.h>
diff --git a/drivers/gpu/drm/i915/i915_syncmap.h b/drivers/gpu/drm/i915/i915_syncmap.h
index 0653f70bee82..5169307404d3 100644
--- a/drivers/gpu/drm/i915/i915_syncmap.h
+++ b/drivers/gpu/drm/i915/i915_syncmap.h
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
 
 #ifndef __I915_SYNCMAP_H__
-- 
2.53.0

