Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2561C5DF97
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2026 09:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5546610EC5D;
	Wed, 26 Aug 2026 09:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KixLS1Xl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261E710EC5D
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 Aug 2026 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787735430; x=1819271430;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=ugkh1WtGh4D8PO8bPLGu7V0lPLtYuqgV6w89lWEjNOg=;
 b=KixLS1XlNIlhxXBhlkGYlNCKvadAe+a+z+ZOU0qi5uwNGStXrwGpQBq9
 LrAarwzlXcQJ4PoVvZti7EMYbC0AYLmWaw6wcYXwLFSyg+Kp1Vljz08Gv
 G++RgK6t+x7/PRa3s7JCA7A9g5u5Kdr9Lrmv66IJYXLmPGoyfoS51kZSv
 NI1noPYsEuxTSg2lWxHgs/GpvI8GQItN3ceYYr7mJayfoTm3GhdGIQxJq
 6gLCQNZpxKTgD1XYqkF64xOdeDukc8gnyX/ngrRU6O4btfl4KZcGGT5Ok
 l29vYgYUXJMA9a9YxRE8lJfy3jCasw69dtQlG/SDCsJ95mRiRj4x+mq3d Q==;
X-CSE-ConnectionGUID: AFRXy6VbSPKTKV2dxTNbvw==
X-CSE-MsgGUID: x5mKEfsFQziQxtSaRkHDOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="105590665"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="105590665"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:10:29 -0700
X-CSE-ConnectionGUID: Vm0Yl79ZQNqxxeJcORncxg==
X-CSE-MsgGUID: so0g/+PlTrCL4yZAwVnRTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="291052098"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:10:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 02:10:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 02:10:27 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 02:10:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HuJC72laXW0rHOxRZr+ikCGM8cON2uVCHOMd29x2oRi6jECnqfjSk03XRpWkXAXeULXqZ1ORK+Tc9Fnvac13aIKYV4+JujJCvvv9+6NCfDO1y6HkEgAEJmxjmqjEPofmeGAY/9jhOGlB6oixlAGS/vEP8ZAr7yBae7BXTWX8Dwz0WLMS7L51A+p2kR+c19Ve8eSneV0IE+hY9MNNA4AFyI5gpn37V0odLJ7+L4peFMVqsTnEuvFTetEMastiDoF2T6aqBGzSpxCwUoIOmGjseYT3pX71lHz5pXTG4+QlGy79CcADMHAEnpYiNheo0N0u4mTlkV/q5BZDm8lQGj+wyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=St7c+ZAo40sTHAJYrESuvL1hHj4evj1yCO8aaV4bm+U=;
 b=td3MAnyTGg1USJBInOkixK70ed0VNXGcKzJW7Oa98LznGIOWmMr4r/OTisN36oyz9wzh/4IaPo6FGqOnFPuL3HQMeOaJ5nftkHDFGcTczeb4P7RM8J8dSY9MT3mErsbnx1M4kp76scuo5mlJRr7htyh3f1lZHW5QWL+wktpc+UM9brEBtBMvptcV1dWENID5ykkl4gAycj3w7U1cEyPYFn5+gLlBmPJqnkqHh3keFCtAJmj73cDrugQj3UTUahQfeIx+wnPyljy0beVdch8vaTWW8FeajLy7oArg0xDihXUutzMUwXuZ8qdkuFhoeNOR2JKcwx042LXAEoznTZ2gKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA3PR11MB9111.namprd11.prod.outlook.com (2603:10b6:208:57d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 09:10:05 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 09:10:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 26 Aug 2026 11:11:53 +0200
Message-ID: <DKYRCL2JVY3Y.LW8NV6GLHX2O@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, <chris.p.wilson@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Fix unlocked mm.stolen in reset
 selftest
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.22.0
References: <20260821134044.15908-1-sebastian.brzezinka@intel.com>
 <gtwlq6zu74cvjm2k3xbs76s64v7ex3srq2umj6ix3mfote4h2r@7rtohsh6hgs5>
In-Reply-To: <gtwlq6zu74cvjm2k3xbs76s64v7ex3srq2umj6ix3mfote4h2r@7rtohsh6hgs5>
X-ClientProxiedBy: DUZPR01CA0313.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::11) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA3PR11MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: 0452cd5b-c2fe-4d3f-caa8-08df0351d1b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|10067099003|11063799006|22082099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: vEuxRXs+s9c7mFjtiR7ceidCU+onNPCxZ60TgcYFJ9NLsdxp2W0dTs3KQod/kKsAWhhSVGGiEGtc5yGTNc2t+BR4gNsSt7bbUJ5TUQ0Wt8lcQtjbAkh2fuAU6x27rNFfI965oNN4x6Dxdl1Qrd+g39KfanNNlLSNJfgS+ZiA6ImIMj+/FKPmKbOeE+qwb+Iv7eQJekUM15cxvwhjIAlHP4t/20h2OC98SdSu02nFBcMPybn3who3BzcymVWj9hTo2QqdQ/UgYrR1uNWD3J9AJqohKRd+xdbVl/IOgDv+ObL84fFw/skldyi5/FeLUDL1zaFJF/kMSLgY8Gxsxh6NjZX/5rym5jJlBro+6Sy+QoOl5JVknIkRM0qqOViYdfjgep0L/6wYcrBQrCPK00MbjtIaVsFkmESqHGfknFLIpIv2R6FTh8hIEPBPI7CtExikxaGJunuqB69yHTHpWpuyBcGgEjkTI4aDx1bMWN/0qTGRQxhAkomxcPyq0mCom4QQxrEALEEECC75Sz5Kjp+XUDc7TFjzeGwsfD9aSO4Jy5XOkCWOQta8/LVbZyd/U9xSvVDdewLQg41hG4onbGapcHw9P6B7fXMK1WdLU9lHqQ6TrZdLsb0WwUXDI2tqAgdy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(4143699003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkZaN2dlVlBacmtkMmdTQ1FSTHROUmdsdHZPNis4VXQ5emVrWUlQaVVOMGNW?=
 =?utf-8?B?c1RNOE9XNWIzeWNGejlvWWxmQXRTY2QvNDQ3UFg2ZitHbFNlK0Q5NUQrTmFZ?=
 =?utf-8?B?YXN6M09XZU5QQkNCOTNOZi9sQktiZW1YekxsV3VNTitMSkM3aW42Vi92SUw0?=
 =?utf-8?B?QWQydEwwWmNmdndvNzEzRWhGenFPcno3RDNJQzBEOTVCb0d3ckc4Tk5DZHk0?=
 =?utf-8?B?TzEzKzlMZGZIMGc4WVBoVEpJRmJLNzRkakhMV2wvVFl1RFA1MGxNSTBBRVpT?=
 =?utf-8?B?TEUvWVVYQnZZMjcrbW9RdkI5aUczZFZIZ0oyTGhqaWcycm9IUnAxenZrNUZY?=
 =?utf-8?B?WVhPMTRZV0ZmRjNOQ3VKYU5nNVN4aXZEMnFnV2pVVGZSRUJJYjBmTFJQKy9Z?=
 =?utf-8?B?WHBQczV2N0RMVUIxVERsOEh1TENEVmE4ZDA0bjhrVlQ0TThwOUlaWEs2WWEv?=
 =?utf-8?B?NDdWODRBV0F4VUJpdXBaL2hGdlFxNkpONklLQXF2cDJzV2lDYm5mQzJUeUZr?=
 =?utf-8?B?dUNELzREVkNDbUt1T1BFek5JM1YrNENzU2luVEtrZlVVOGl1SVFiYXpiUnZH?=
 =?utf-8?B?VGlEWW1uYk5IdnhDb2pyNjRjWDRYZU9kdW1YY2NvU01FZUpjTXIzU1dpRi9M?=
 =?utf-8?B?MlJSTWh4MG5iK1NaTHF2eml2dVZEUlI0TEZUQ2xrenNoZU02dDM4QmFPaVlk?=
 =?utf-8?B?c2NXTjJ5K2RkZjBPb3JacyttbExObEVSOWhJNHNnNlB6cUQwM0ZzZnhlcWdL?=
 =?utf-8?B?bEltZG1ZMU1xMmZXQm01NThDeXY5aXFFSCt5NkxRVFU1ZUVmYzlKL1ZueEN1?=
 =?utf-8?B?cHJPWlNKWTM4RmYvdFEwd2pNRUhyb0VvNDRzVGVMdGlLRnZXaFU3SGVNZVhw?=
 =?utf-8?B?akMxRy9TNnVJbjQ4ZVY1Z3VqZUpFQTFPYUpEUU9oaUwxZzU3WE9IdzRuZUVW?=
 =?utf-8?B?a1VTSEtXRWFzeVFERTJLRVgrbkZoYUdXRjRiVm4xZnMza1Bkbmw0M1VGaUtH?=
 =?utf-8?B?L3dmUjgrZmFyL1ZybWZ0OG16RjRBRjl4dVpCUWNoQzRwSWZIRExLVlJpTGpk?=
 =?utf-8?B?aXNNSklkRFRndkpwaEdMbFhPQVZiMFQ5RkdBUGNuRkF5eklkaWF5bDVyNGN4?=
 =?utf-8?B?SytTaVdxUU1kV2hZd3ZweGhsSzBVSDRaK0lQL0gwVUVUc2hsWWhDQ05RazFO?=
 =?utf-8?B?THVFVm90R2ZIbHYyc1hSL0dBczhhMm5vT2Izd1BTL1V1VnYxVkw2ZkFGK0RW?=
 =?utf-8?B?cS8xWU1LWlBkczZxSkVHWmlUdVRLdmFCMjJVTlZ3TkxUYXZ4OVg5NXJ3TFpH?=
 =?utf-8?B?Mm8xNVZFS1g2bms1OG1EUUpIc1IvZ1N1Y1Q5M3ZNNTNkNkN2c0J2WHZqaFpa?=
 =?utf-8?B?RXE2cmg3VVQxMEtCNklzTGNjRkpqOVNRbDZ4UjBRcUJ0YTFQdWd3NkZpZ3hL?=
 =?utf-8?B?SGpFVlZJZ3JRdkJXVDVwRlNaNktUVzFreCs2UVFCLzFBeVprWU4wWi9MYXc3?=
 =?utf-8?B?N0k2Wkk2OGxuQzBDREpjZ0owdXllZjU3REdwdlI0Z0MvK3JCU0JCWnJmRUJl?=
 =?utf-8?B?RDFOWXIzaEMvTDVuQmk5ZHAzSFhxNG5EZWVIVGN2SkRKNGpZU3MvQlNYRWVQ?=
 =?utf-8?B?Q0ZVOGI4OG1oVmpCRUJNKzQ2TVZoOGFBTDdFTnM5anN3L1dHQlV2OGUweHhL?=
 =?utf-8?B?dXpKZWJrSjQwNWtUZkhEZGFzU2FnRlZFb0NDN0k0Z1VQQUpFZnBXS01FTk9y?=
 =?utf-8?B?U1FiNmtKUzA0SnZ1dUF6dHdjUDlDWlV2bzlKVDNPK3MwWXI3SkpZVEJBR2Qy?=
 =?utf-8?B?cFljeEdjQ1I3VmxWQUd6Wis1NU0vaE1NcWJaZW9uUzRwdms0QkgySnRyTk1V?=
 =?utf-8?B?ZlBUenFVcDJSWkhzOElHakh1eFM4aWdJQVc3WkIrU1R6OUorMDhsZTYxMlhV?=
 =?utf-8?B?UGU0UHFpUEJUSlFGeE1KL3ZwQ3hqK3Q3NG5FdVFiVWJrdEF1MVdBK2Y0UG9n?=
 =?utf-8?B?U2Q5Mk1SN096eVdwS3BISkIzcXhFUjNqNDlvbmIrRGM3OFlVeWYxalhlTnVS?=
 =?utf-8?B?YmxkMXdKZVRSaU5wR3gxUzcxdUlGMER0cWMxeFBHR2JnWUxMUldnZDJkTmN3?=
 =?utf-8?B?ZVZOTE1ocmJxc0lHZTlBL3ZtTzYwSXR3dzAwNmMxRHlUY3lKam1VYW84dGFX?=
 =?utf-8?B?WXVzOC80WmgyREdXNWZOM1N2TWhISVJlWUl1RkFVUzZlckZGR2t3cnFBVTNB?=
 =?utf-8?B?R3RSSXllNTJoRjBiRFVIMjdDeFdnMkIwd0lhQVYxNkdGd3Z6ek1RYlBNd1FD?=
 =?utf-8?B?YXFzTG1GenMyUzZXM2tUWk1lN01UNUJDNWxFMEQ0QlJWaEIvTk9yeWFZaXlZ?=
 =?utf-8?Q?u2kLi5N1dzMB+6RY=3D?=
X-Exchange-RoutingPolicyChecked: hdUlw1J1XQr/NR2Q7nn/NK4HcNwHMMvitWLQjvrju1z4HX67/1oZ2Ec5V7r37NJfMkLB4LsgC5iIcg2o+aIveEvQkslpULkW806YS1aBmqIJ5oUCikJQyZBANph6Ots4I8P6LDg2MgOl8PH8GYaFVGinZMU3dDC+V+wgw3ny6GbNy9SS4nMs/98smtchJsIKFIho3xT9OJy31iyIu8qfFS2v7mmYX//lf4XKfYlzQKk9TjRqa/54KGUHR+tTUJFVhKreu/PY+HRJ4Ff+N6rq9q5gqcpAPTHI6YCH3XTY5fare+iBVbk6r7yr2sgac8AerhyK2Vt8iKm3n1RZBHYaqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0452cd5b-c2fe-4d3f-caa8-08df0351d1b0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 09:10:05.6861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDzrlaD5hkSkTWE8yHb8nlGnpdBlyzWiaYd0emCTN1liPHbDkUi2oDE3SaTRLuX25Pl9zJM9UyU1ji66uJYdoLueuG4IfkHnPvLvEFBThQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9111
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

Hi,

On Wed Aug 26, 2026 at 10:49 AM CEST, Krzysztof Karas wrote:
> Hi Sebastian,
>
> On 2026-08-21 at 15:40:44 +0200, Sebastian Brzezinka wrote:
>> __igt_reset_stolen() use via __drm_mm_interval_first(), but
>> does so without holding i915->mm.stolen_lock. Every writer of this
>> (i915_gem_stolen.c: drm_mm_insert_node_in_range(), drm_mm_reserve_node()=
,
>> drm_mm_remove_node()) takes stolen_lock, so the selftest's unlocked
>> reader can race.
>>=20
>> This was observed as a NULL pointer dereference in
>> __drm_mm_interval_first() during igt_reset_device_stolen():
>>=20
>> BUG: kernel NULL pointer dereference, address: 0000000000000010
>> ...
>> RIP: 0010:__drm_mm_interval_first+0x2c/0x90
>> ...
>> Call Trace:
>>   __igt_reset_stolen+0x565/0x6a0 [i915]
>>   igt_reset_device_stolen+0x1a/0x30 [i915]
>>   __i915_subtests+0xb8/0x250 [i915]
>> ...
>>=20
>> Fixes: 3da3c5c1c982 ("drm/i915: Exclude low pages (128KiB) of stolen fro=
m use")
>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/1684=
1
>> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/selftest_reset.c | 20 +++++++++++++-------
>>  1 file changed, 13 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/=
i915/gt/selftest_reset.c
>> index 2cfc23c58e90..eb6b2261329d 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
>> @@ -30,6 +30,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>>  	void *tmp;
>>  	u32 *crc;
>>  	int err;
>> +	bool unused;
> You should ensure the mutex is initialized:
>
> if (!drm_mm_initialized(&gt->i915->mm.stolen))
>     return 0;
I don't think it's necessary, and even if it were, it would be outside
the scope of this patch.

>
>> =20
>>  	if (!drm_mm_node_allocated(&ggtt->error_capture))
>>  		return 0;
>> @@ -95,9 +96,12 @@ __igt_reset_stolen(struct intel_gt *gt,
>>  				      ggtt->error_capture.start,
>>  				      PAGE_SIZE);
>> =20
>> -		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
>> -					     page << PAGE_SHIFT,
>> -					     ((page + 1) << PAGE_SHIFT) - 1))
>> +		mutex_lock(&gt->i915->mm.stolen_lock);
>> +		unused =3D !__drm_mm_interval_first(&gt->i915->mm.stolen,
>> +						  page << PAGE_SHIFT,
>> +						  ((page + 1) << PAGE_SHIFT) - 1);
>> +		mutex_unlock(&gt->i915->mm.stolen_lock);
>> +		if (unused)
>>  			memset_io(s, STACK_MAGIC, PAGE_SIZE);
>> =20
>>  		in =3D (void __force *)s;
>> @@ -143,10 +147,12 @@ __igt_reset_stolen(struct intel_gt *gt,
>>  			in =3D tmp;
>>  		x =3D crc32_le(0, in, PAGE_SIZE);
>> =20
>> -		if (x !=3D crc[page] &&
>> -		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
>> -					     page << PAGE_SHIFT,
>> -					     ((page + 1) << PAGE_SHIFT) - 1)) {
>> +		mutex_lock(&gt->i915->mm.stolen_lock);
>> +		unused =3D !__drm_mm_interval_first(&gt->i915->mm.stolen,
>> +						  page << PAGE_SHIFT,
>> +						  ((page + 1) << PAGE_SHIFT) - 1);
>> +		mutex_unlock(&gt->i915->mm.stolen_lock);
>> +		if (x !=3D crc[page] && unused) {
>>  			pr_debug("unused stolen page %pa modified by GPU reset\n",
>>  				 &page);
>>  			if (count++ =3D=3D 0)
>> --=20
>> 2.55.0
>>=20





--=20
Best regards,
Sebastian

