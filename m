Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E1CC4453E
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Jul 2026 10:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00BF10ED43;
	Wed, 22 Jul 2026 10:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LuX4Vp3v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B99410ED4C
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Jul 2026 10:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784716122; x=1816252122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qyVEHGujhEXWUMLbb9VLzzWibD84T7WBi9+qBE2MJgQ=;
 b=LuX4Vp3v76qkIPTbO1MwW4rXE/rrAzrO6mQLv/XuGUIQn3hXlvkC7A/g
 /5u/GyZOWmGoAc5iDGQ0/4Jxn9zVkWc/P2xhFESVUUtBJlozgZhHmfhWT
 7QCLvjIg45YzuqvrJDVBAV6PFK4riIfGx+yuWWtapie3/Q0GTniKjUpmF
 weSSKJdMxrPGlyLWn0bS+6LfBrPTAK//KLT+Lj8RIIAsW5KTEwdSOfNix
 oJlx6fWHLIlvRddZg+jGmWEdzZF1xq11+dO1lk90gsKM5zsblEHev3vtH
 G2CIYB2qIMLX3EBaTNIGDRzaYSkhcCtOijFeW2PBS0BhGyxOGZEijUS13 A==;
X-CSE-ConnectionGUID: uV04w99JTTKx+SnC/BYMVg==
X-CSE-MsgGUID: 5pghw2EBTaaSWO6vscPhow==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85110224"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="85110224"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:28:42 -0700
X-CSE-ConnectionGUID: H0N8nGyBQ/KqbpGUk6Wgtg==
X-CSE-MsgGUID: Fryww1+yQF6HnbFvjgTQ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="254143385"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:28:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:28:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 03:28:41 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:28:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqM7JaEo40PgqEsgK7e0YBS5aHkzjK9gM3glSSm1BcnldVuAkE8KYoRswXmT2zdD7MZ8DkDYRY3+6zjU6fxUtEVzBUtEqQnlH9WwKbQjtuIfALLabDamppy4ga7XCBUDUa3gL0FM597ijfF+ScEKHUh0rNa1B6BaNHUkrFo9wwh+rlMTKkYaJPjtmAkh1NyFJPK4dqJ4p4cFBp8HKwu1mQRf5H+AbR5P7zaLR51p6lTk/N4YwU/i4L+iqYjA38l8wUlc7vrh4VWTeFvVn3JJOuFS10yqtC9KUQbb7D+Z0/1fVj9pEAwWUUppVZ2Qe2L1/Ic8GdVrYibyPsLiYNdt8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQHD8VWE7xTv8Makl71+3qasBDsXRpDfJG8E/OW8ID8=;
 b=CIKvop1Qkgj1Uh0RX9RrgYn4oIBXgzOG8ZTl+iZBTrPHYG+PfVUCM5AmDsZrtK0cbL3BoAdgzvoPGcT7y18Z/o93mxoz4hUIyt+0YuJzesGgYZ5wziuLL6MffS0uGkZT/+iUYpck36a1Te6EMzLqlsWUGpN1OFnsFvi/rbXAVLTrQkUMTtvdJ4q4ZbRqEExaOKJph4Z3LGsyoWrWRfnxa3/EqnrTFA9n7jdgYvCfqmzeQv3VPmYTEwdYdW+s26QgWKSkXR7mubfYLh5jX6vPTauAQPgCAvdyryqYV12Woti/vKvGcdUXCRdeE5pDKqxrIKSv+ZbWI7cuz4KZYd5i1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW6PR11MB8338.namprd11.prod.outlook.com (2603:10b6:303:247::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 10:28:39 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 10:28:39 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <andi.shyti@linux.intel.com>, <krzysztof.karas@intel.com>
Subject: [PATCH 6/6] drm/i915: Convert GVT/vgpu/perf/device-info license
 headers to SPDX
Date: Wed, 22 Jul 2026 12:29:23 +0200
Message-ID: <d43701857e271b0381a105a872908eab59bcc3b3.1784713895.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 92f3e82c-0204-4a71-a35d-08dee7dbfe7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: nkafSU5HRWAb8DZdJRrhlK6fC7gN6lQ0uIJQ7TDJMaBRVZ5tClvL9cX2C8U6Kmas/RyuIVmVx1u7qi599L/tMMVexfjVtOLAdC0LiflRx0vDMphxfH0DKRG7TuIOmn8wiJF4vvDFxSCb1ngP/A5hOh9zDJ+Glc7bdNhX6oa/1lnrSO+DVsc5LzQ2YWbOhxrCba5x4Thr6ArD9TM6mWNEtxNj1foP3jqSQUFf87iRihNiT8wb0oL1X1LwCKh85nyHy7Ld7rYz04I1tMl01TVRQmxUITc1/aE4qNooqhjKEZHHONrhRb297f17fW/jjqK9PNWAE69/+PFzfYuuchFJ2Z4BZwGWLhf8J614t0w0Kd5Py0QnGtB/TR+3plIeIp/zyT05E4ouveR9B160gNk3rbqrho1gGJU4SPEv8gQMz8rTR/z0lg7lU19SCFAZgbjtReXWCGdYTD2lIcZC7TEXmIr0V0n2JTl+6zZJPF2RRibMVQkHbM0Ko26ybo3quFvW1+QJHWCXd7J9MouXht2Mfcej1Ih2rCyO6kYIyn6nC9v2sA28BdZTHa98AziVE4RWZ6oBgLnOADx19XB664iKg52vcoZrMAwXUeo+po7brrTcHDK9orIasoPDQvVnbEwIzXrxOhT78SBZeB5RqAGtQccis+FXvqdEtlN3euVIi6Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejVJOS9XVXFTMTIvQm45UVZwQnBkeWVnemlPWHpxQk1SaDZBNmdRRDdDcWdG?=
 =?utf-8?B?T2F5MkJsM0Riem56dzZjOEw0U1dsQjZ6MHcwb3ArTHErek1aM3pORklEQ1FG?=
 =?utf-8?B?MXZrUE9jbzYzMkJlRis1bXdpUnkyM0UrLzlsd1dPRktsZEVEZnBpN3RubGEy?=
 =?utf-8?B?dkdYL2h0Qk80S3U3YjVCem5scGgrdjEzaW8rMkV6WmNYYnpoSjFTak1ucFBw?=
 =?utf-8?B?bnNqZmxxMHNzZUZhcFdUckdyK0NTWFAzN0dLNEZpdzBuTitsM2FrNWh4ZWt4?=
 =?utf-8?B?NkxmaDFOcFVZK2lzRVhYck0relgvRklURFFaV2tCYTVkWFNGK0NRcVRrZG8w?=
 =?utf-8?B?SWpuVXB6Z2FJQ1ZKZkpvaWFvNDFVOS9BcjFRVmdGNG12OUN2SFVpUHlXNWEv?=
 =?utf-8?B?aGI4M2laV0Y3TzAyUWZSTWFXNUpIbTVTbDFNUzNKSk9NeVFQbmgyZW1ZS3NV?=
 =?utf-8?B?VGlYRnpQQWc1aGVzZS9LQnVtK2UxTFdlL0Q4eTdZdU05bGZET3pUVHVpclJH?=
 =?utf-8?B?MmJoUE9pcVhFZzdTcnRBbFI3UzZjMVFXZFcyOEhiQit6aDR2UExQdFlORjJI?=
 =?utf-8?B?MzJFazVRTEN5dHZZcHlZcTJEV2xWM2lzeHpETnZSQjYrZ29zQm9GbTN5ZmUy?=
 =?utf-8?B?TGlxcmN0eWx4amphNU9XQ2w0ZnloTkhvSmJQRkw1ZDc5a1ZZUlNyZlV0dDhC?=
 =?utf-8?B?TDVvR0prNkp6MnpGaExhd2FHNGRYcUp4VjF6Unc1L2JhT1ljM2RYdFk4S3V6?=
 =?utf-8?B?SXZ5dHdnY2pRNi9kdE8xUUxpU3JWMVhvZHAyajZxUGYvclZNWWVLNHZLbitJ?=
 =?utf-8?B?ZjZOUjZyUXV1RFVqZUEyYWZmRzRXOTJNSkFyazhabzBEa09Tc0c1ZUhBRXgy?=
 =?utf-8?B?dXdtWkM2MGV2ZTQwMTJlSDUxeHp4SGFmSmx2U0ZGMG1GSHlreUdRUi9ETlk4?=
 =?utf-8?B?K1ZhQUhLK2RHTTE5WTNkOSt5MnI3MzFVcTNEaVQ2ZlovT2lCTDZXcnpFbXZo?=
 =?utf-8?B?YnIwMVl5MFFXakt3djJVQlRQcHB5YUNlRFh6ZExzUjMrVmdPeFZTS3J0M0py?=
 =?utf-8?B?Y2FyMWI2dU90RVRMbE11SDE5SWNSYTl2Z2U5WkhNMVpNT2I0bzJETVhObU9D?=
 =?utf-8?B?cFF5L3lwbFh3Mjk4V09CMC9HVzNGVE50akdFeUxxcnNGUFpQd0hVdmhnWlda?=
 =?utf-8?B?QjA1bkpiS1p5aDZ3UktzZDljdE1GVWV4S2hTWUJiclFrazEyanVhblVDMitR?=
 =?utf-8?B?RU8zS1FpVnhUOUZXNDBGcDlIblNhS3EySTFQZmlXa0ErRXY3c2JxUjR0NS9N?=
 =?utf-8?B?d20wZVExdCtZeFJabzFjREEyb0ZzTGtvcTZvbnQrRWdwM0N4VWsyUnJYcmE1?=
 =?utf-8?B?dTE3TWc2dE5zbEc0cmlaY0NwVnBVVUc4YjlycS81SHp5SGpoVmlmU2JVL2FN?=
 =?utf-8?B?S2NZZ3lkeEdQSjZHNEpDaVN4RFhpQm1kQUZwK1ZVRDlLNDBRMHVSQlZTWitj?=
 =?utf-8?B?U1V5RFNxN0V1ZVNnMWxhTUJGU2Q4QkRXTmpLVnRMcmliNEtkbkZwd1RTLzV1?=
 =?utf-8?B?OGFwUVhiVjBKT0ZDZ29tSWowNnU5cmM0VFQ5cWxDb3poMWpodExLNjVLZ3pL?=
 =?utf-8?B?RjlVVWQwdGJFRWdSWENUNVEvbG1hRjUwZ2dXZjBaY0ZUamxuNjJRTjNzY1l1?=
 =?utf-8?B?VlhnZ3RMUkNtdHptbS9EUzU2Nm1UOGdmdkd4T3RQL0E0VHVjU3VSUlJuMENs?=
 =?utf-8?B?SWdRa3Zkb0lvL3p5WWdndFh5M0ZjRDNRTEhmM3lrQkYrckcyTkV2WG81SmFm?=
 =?utf-8?B?WmJ4YXNnQTdVNnlYV0pWQlNudEkzZGZYUUxuNGhtaUt0bm45REZmc3NmNXkx?=
 =?utf-8?B?bDlJcXFHQzVZVHIwTUdEY1dweWo0THUwS3ZtSXErTDNTN2FEN2pzQzBLRjMx?=
 =?utf-8?B?eExUZUdXNThmejlGcmxkQWNydGhUQ0ljbEhWQ3YxeDBsTTdNMHQwMXJKQUkz?=
 =?utf-8?B?cE9FdWE2NTk5TjB3ZGlaVU0xMkNSUTFxbjlLQ3RzbDcvcjR3bmhWZXo4bEJK?=
 =?utf-8?B?am9mVWRwMXdselBFTjk2c0NqSlAyMTh5OTRrenBzU0dXY2ZyMXVFSFVYMEdP?=
 =?utf-8?B?V3ZIM0RhWHBablVKS2FHc0dtenVyNGVteG5CMUM4TzRZVGRHbnB0aUJwc1l6?=
 =?utf-8?B?b2NMdWhXd01QbFd5V01PTXBxeFVvVHpFUmlhME5nQms4SUFLT3JjOCsrWHFM?=
 =?utf-8?B?eWU5clhiQ09STDVLM0ZjTGUvVTFVbjVHbFZRdUxhbGlrOEhzQ3VXZGI0NjNN?=
 =?utf-8?B?R2EyZjJDTzQxcWRwUCt5VmlaV1FUMlU1ZjZBcWxTbmhKeWZ5OVJqZ2dmNFgv?=
 =?utf-8?Q?ITIDy/xkJmxPa2dw=3D?=
X-Exchange-RoutingPolicyChecked: NFWcsWle+q4yep4P4x9OODDBb1gaycVJ2FxFu8w1XE7xeHBQrNajqKQY+YxQJGreWp3Oq2diaR9j0WbWM0t32HbFBWXBK2MnCnUCGWCF6Mlts8sYD9TtGgmd2zRjDb6CwYPfSNfPJK4aFXu/idpH+JvYMj8ZTrZUs+0g/aMge/mJmIQQo/dLfvCDErTmX1lh2X06N2b04r27QpoOi4GDaBOMe5xokuow/Wtsf7HASZ8SGXDJt6Cs18zgsJh1Gcru2RGZryqHSGgqmnmUI8zaGhvVVlfVQbEJvLCxxGRYKS+E10scpIUDIGRi8T4uHytYdSiU6k9c2NjIjq1u8Cagsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f3e82c-0204-4a71-a35d-08dee7dbfe7b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:28:38.9692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdIyGQN+zhDDRiOqjpeFesMIE2MqRTh0E2z9RvhEhxAXXOnnjVp6wfkUbfSltipI3Ca2YTQDKJIvcNMjgEcTBOFWP71cavbZqWrGOuuKrkg=
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

Replace the verbose MIT license boilerplate in the GVT-g host/guest
support, i915 perf, device info and register definition files with the
corresponding SPDX-License-Identifier tag, preserving existing copyright
and authorship notices.

No functional changes.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 drivers/gpu/drm/i915/i915_perf.c         | 21 +--------------------
 drivers/gpu/drm/i915/i915_pvinfo.h       | 20 +-------------------
 drivers/gpu/drm/i915/i915_reg.h          | 24 +++---------------------
 drivers/gpu/drm/i915/i915_vgpu.c         | 20 +-------------------
 drivers/gpu/drm/i915/i915_vgpu.h         | 20 +-------------------
 drivers/gpu/drm/i915/intel_device_info.c | 21 +--------------------
 drivers/gpu/drm/i915/intel_device_info.h | 21 +--------------------
 drivers/gpu/drm/i915/intel_gvt.c         | 20 +-------------------
 drivers/gpu/drm/i915/intel_gvt.h         | 20 +-------------------
 9 files changed, 11 insertions(+), 176 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 19b82427aa41..327194f1407c 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -1,30 +1,11 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2015-2016 Intel Corporation
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
  *   Robert Bragg <robert@sixbynine.org>
  */
 
-
 /**
  * DOC: i915 Perf Overview
  *
diff --git a/drivers/gpu/drm/i915/i915_pvinfo.h b/drivers/gpu/drm/i915/i915_pvinfo.h
index 683e97ac2430..2fce7303534b 100644
--- a/drivers/gpu/drm/i915/i915_pvinfo.h
+++ b/drivers/gpu/drm/i915/i915_pvinfo.h
@@ -1,24 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright(c) 2011-2016 Intel Corporation. All rights reserved.
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
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
  */
 
 #ifndef _I915_PVINFO_H_
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 64e906380131..304b32d2d0ef 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1,25 +1,7 @@
-/* Copyright 2003 Tungsten Graphics, Inc., Cedar Park, Texas.
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2003 Tungsten Graphics, Inc., Cedar Park, Texas.
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
  */
 
 #ifndef _I915_REG_H_
diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
index d29a06ea51a5..617c34510f36 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.c
+++ b/drivers/gpu/drm/i915/i915_vgpu.c
@@ -1,24 +1,6 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright(c) 2011-2015 Intel Corporation. All rights reserved.
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
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
  */
 
 #include <drm/drm_print.h>
diff --git a/drivers/gpu/drm/i915/i915_vgpu.h b/drivers/gpu/drm/i915/i915_vgpu.h
index ffbb77d08048..3c5c3a12d0b0 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.h
+++ b/drivers/gpu/drm/i915/i915_vgpu.h
@@ -1,24 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright(c) 2011-2015 Intel Corporation. All rights reserved.
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
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
  */
 
 #ifndef _I915_VGPU_H_
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index bbe3a24fe3d9..708dcf8741d7 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
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
 
 #include <linux/string_helpers.h>
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 9387385cb418..35344064d40c 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -1,25 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright © 2014-2017 Intel Corporation
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
 
 #ifndef _INTEL_DEVICE_INFO_H_
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index 6b43713899b8..95b73d3206b2 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -1,24 +1,6 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright(c) 2011-2016 Intel Corporation. All rights reserved.
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
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
  */
 
 #include <linux/vmalloc.h>
diff --git a/drivers/gpu/drm/i915/intel_gvt.h b/drivers/gpu/drm/i915/intel_gvt.h
index eb2a2be252ca..7cc88fc6f2ef 100644
--- a/drivers/gpu/drm/i915/intel_gvt.h
+++ b/drivers/gpu/drm/i915/intel_gvt.h
@@ -1,24 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright(c) 2011-2016 Intel Corporation. All rights reserved.
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
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
  */
 
 #ifndef _INTEL_GVT_H_
-- 
2.53.0

