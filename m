Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7BCC5DF82
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2026 09:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6117410E1AA;
	Thu, 20 Aug 2026 09:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ElXkFZPQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E59F10E1AA;
 Thu, 20 Aug 2026 09:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787219043; x=1818755043;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=18v2T1vircCkdTUtzIhugkBAWPMlzcwZHn7qbDty/kY=;
 b=ElXkFZPQVV2MAzRw7gDSVvYvkoUXoI1LCMDPUKFMMY3OoEi8/WJRDYY1
 By8XhWxTnsklOl0R0moFX+8EVxRU5cnO7Xb/eylWeWuW8KkMVpPXC9hSU
 j6US3eT1FXJCQUc/pZbUFmu0dejM8R+HrPR0YQMNqgKNt2l+oyc1OwPJC
 JyYvl7Ae4YmILSx0Z7c0ltlgZ8kkML8QATb8HBOQdrehVtUMePDKLG+CO
 95Yq/5a/Y94pui1dWuAwh9ZkxMRBDGkS0El6/CtRlN5cCCXS4FQPeW5vw
 qteRvwJL4aaewQ9qGqCIum6QkZ4GhuGrPdO0A29oRYmclEq7BLUJNQT7X A==;
X-CSE-ConnectionGUID: QEmEUz0wSnyLjob27bE5pw==
X-CSE-MsgGUID: kiej67GWR1mSb2kLjMXg0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87619790"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="87619790"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 02:44:02 -0700
X-CSE-ConnectionGUID: wQAsQdD6ROqGrIOWLoRb8w==
X-CSE-MsgGUID: r574d9AXRdG8tSYdPelzfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="269785264"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 02:44:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 02:44:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 02:44:00 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 02:44:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vc8NBn7N3xeQizsTsZ77bk9znxzOWz/PyZjoPx0fKP5muCqahkic5J+cB7wiftZM2lwhqkDCi6kBKx0Me5nxSmS3qrvSvTLRr/TDFKeg1UnpAkeNIVYkvv0nLq48P/7ioOYv1H8aForLoQt01Hczgs4788X/I4fiTX5uK6rW3cGU6sOVFzhu819dxxG6BUTJ+Lmot/JwCcD9mDN/KinS0gn5XAvF5J5cSoCw7z9jh9ACJLoTCPwCanbLesCPhoXw/V+TFlRR/lu3gBiKL2tjJRGC86HCFfwlLws2gOo29NQomdbW+NItwjVW9Eu/CTNBrYM7j+Y793jiGSKochd02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6qwxz+8d6mbUBnD6BOmCucCCpBxgz8j4BLgSA8AM1A=;
 b=bumvqPlfUnqmP0+rLX1OjtqXCtvqLlRl0+Jcy12lEgRArt8onEahCLFBt351uVxRBgjgV4bXlFtOzN4mTOZrZqlax8rGWIVHGo0XyCgUzO5g5bWDIHv87IDAqtUP6F4oVnUUrKMhao8ZfPzJ3Amy/s9tuzSvWMaGJ61EReG1WZvb4ch7dFBFEmnOS8He1j9ml9zXO1Y5tSCaHWQr90qOtqMKf0/HXMMp/tUYyY3+bwY1Q/sGJdxILR80WzEkIXqY8mWa9wPHp3EoLTD7TRPiS1zP8YGCfBrSKm7WOgOVg0EMoxuUq5CC1Rmt5FNuZrc5NgKuyxumHGi6+lL+/G3N9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SJ0PR11MB5069.namprd11.prod.outlook.com (2603:10b6:a03:2ad::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 09:43:55 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 09:43:55 +0000
Date: Thu, 20 Aug 2026 09:43:45 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/device_reset: Cold reset doesn't depend on
 PCI reset
Message-ID: <s7nrmv4scfmjqscx5vcmyylibm2q34e5hfotp6m37ensgeu2xa@idnpoflkn52a>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260819144224.1808907-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260819144224.1808907-2-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: VI1PR0202CA0014.eurprd02.prod.outlook.com
 (2603:10a6:803:14::27) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SJ0PR11MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: dc34f8e0-2ea2-4634-4b78-08defe9f8d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: V0SE4Nk0EG2nehqZH0+xEVHZdAFlnnUEIfo9VYR7p7DATlePcFJ5lM1OZGssg/uLH88FcwNK/AzWEJcMrZTSekagBSPDqm3sqUE0jl3HrHLwWZ2Kgehz8bbAB0orkFWewhOd8p0s+9POnOgbmFiJTblT7iHe3BeiN0nC/zAWBzKlp9Cyk7fKojUqFN9ISSFFOZjYK6ULymirPAFTU4XcZvzpkfL/B2yQFKkBznpKCsVR5IdSk3TQTETW1bUPxEWd0a0CSCeXY3cJzc6AvLh11OgaxbAtJ4iBm6yhwoE/EGr70znik1nkJTplxnwswz+MDrOygVgWDqqKgE871FDXcCZzy3B3SwK37DcK7lpyvLvgUyWZjcDK8D2HgJ0l0UUv62Ed01akulqsyASCL9FgBYIPwgZNNcRVvcl4DaFuGxcxOYgRaZRV9PTVHpeTiXBuANRdMn3dLYgK+O0xJpq549PTbF1vOjmmc/iXCGa8mZOCpoBrZEhAP5M/PJfFFF203oP3wtpyXsBLzrUpE3jVtcl/fYc28uGQ5dTVZ58jN7SswrWHvEQM+jmmA4S8Y8xL1iHRctRT8MZZc/Z8uW8vrtYpy9yQYCjw1/bvCLaD8ZmOXNA0qlRx78tbOXZnQ1bwXkpxyIgOA9xdYE/yjQVtJrIEOoRnoYdIcIiPD5xIe8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzU5TnI1MFVHZzE0TDg0aElTSHVxMzl6YllKOWwraFNkRVJRcXVOTXZ4T01V?=
 =?utf-8?B?RkY1U0dCU2hoQjFxMEJ5aTU3UDd6bzZ2djZDa2JMNHB5M3M4NC9XVzNTV3pP?=
 =?utf-8?B?aFJWVlFsYUZzL2czUXYxb1p2VDlhb0hMWnlvL2VDVTc1bERHVjE1amlOUC9W?=
 =?utf-8?B?ZmJaOUhoK0F0UWovT25BRklISGlYZkRUc2hYdG84YzhZSkpGamVLa2xxQisw?=
 =?utf-8?B?b0dLS1NIWExIbzhpdTJBRzhYMmUvdDdnYmc5bmtCYkxIY3pIOGFiRzJyUk1a?=
 =?utf-8?B?NWZHT3lMbExsSnlMazRxL3BoQkFPU3EyYnpGU28wYTVUcnR5YkYvVm5kWU9Q?=
 =?utf-8?B?RXVaMjg2RjRKVVgyUG1qcEpzOFEybk5DZEhPRG9oOWlaUGNWMmZKY3ZXd0ps?=
 =?utf-8?B?U29FKzhzc09JTzBKeHMrQnBKK0Q3aTQvcGo3NVQ0eHZqaDhLeW5YWHNCOCtB?=
 =?utf-8?B?MThlbFp6L1E1Mm8xUEc4SjE0MmpmQnlpSGcvZFg0SFIrY1dIdFJRNUNIaTNx?=
 =?utf-8?B?Qm95QkdVUW01dWpaLzFZRncrd3JDUkF6UmNQQzQvTnh1ZENnd3d4dlhlbkNp?=
 =?utf-8?B?ZVovbGNtVWY3RURaZTFlQVcrYnI4QlArcnZHZEo3eFdPMllTK29POGUzMHli?=
 =?utf-8?B?QmJqSXFXc3hPdGx0b1NHWi9uS3lYc0xvbnk0K1VRT3lQOFB6dGFPNi9LMi84?=
 =?utf-8?B?R0hBbEhNd2h4VFB5YUYvZnRxd21TRDlwZzZtYkNCR1lrbXZmZWUvZEMwaVdS?=
 =?utf-8?B?UC9paUovemhSaWkzMVpCUVpUYUVFYldkMnBRWmZyZWYyOTNWK2JiNUl6N0ox?=
 =?utf-8?B?Rmw1am9YaHM2K0RrTXJhWHQ3aWZHM0IrK2lQYjBBKzZ6Znc2OXdKVEtQS0ZL?=
 =?utf-8?B?SGJjUzdadUVVZU05VXowWkZuTlArZi9qSk5ZQTFaMHV5dUR3cTJvWW1QZzVx?=
 =?utf-8?B?WnhJUzVaMXBDeExDYXZmRkEwR2x4NmdpWDVZRWp6SGxIK3J3WTZqcEl5Mno0?=
 =?utf-8?B?YmFlT09mUWd3VGlIR3BnNEpFVGxHUCt3UzVGMUhEQW44QVcwb3FSR254NnJz?=
 =?utf-8?B?QXFIbUlhUUFEcWxQTUorRmlzT1RDYVRQM2YzUVRTaXBKWnJGUTZuMy9nNVFO?=
 =?utf-8?B?UkwxT3JZL29EaXB1Z0pQZkxpWXdOK1RBS2FSSUlVUGFsSVdYZmM1UCtPbUhP?=
 =?utf-8?B?dzZqd1Y4YXZKVUZQL1NnY3JEYm8yRkNaangvSkY3c3pwYWZjdG0xQ2QvZDF3?=
 =?utf-8?B?SGtlWXFYeEFmaFdYZ3NzNnBNUmxoTkFJSS91VkR5RlZHSGhEUnpFOGc3VWN5?=
 =?utf-8?B?emFJT3NWRXJ0eXJWazJ3UmxFWUZRZUFJNEl2YVk0NGRGUzlZa1hQYXZ2VlQw?=
 =?utf-8?B?WkVZWldJTGxrZjJWc08vUW90aVpkS29ma1hST2dQOHhaQU1iV09yUVEvZVhZ?=
 =?utf-8?B?NXh3TThxcmVCaFo5dGpNZHd4ZTQ4bFA3bkhMc0hVOWxtWFpPOXo2WCtOU0Vy?=
 =?utf-8?B?UFVRU3BwM1BkNVQyQzRISjBMNjJrOStHNUQ0UEsveEVlY0VSdmQ4aUtQUDFk?=
 =?utf-8?B?M0RwNmRhWkQyeTk0YmVjNGE5Q1JtK3lKZkVXYlM1SHZoQWkydXJ4cGtXeHRZ?=
 =?utf-8?B?OU91RnBOSGRqMjBWMUcrRVZjTzJ1dWV1aDh0cWxqeE9lUVQzNTl6a3VwRWJs?=
 =?utf-8?B?YnE0OE0vcDI2SU9HRVNYcTVvWUdGQjZ2Z2dWWk5NalV4L2RUMGtMODFOK29r?=
 =?utf-8?B?Nmdjai9TYjQ5L2RUb2RPWGNENXhFUEg2d0Y1NHBGYk5HN2E5WmllV2VZQlFX?=
 =?utf-8?B?aTBPSFJ5ZVJBblF3ZXFhSzJ4YjVIUEt5K3YrZWFGYk05V1Evb09nbjlRa1BZ?=
 =?utf-8?B?dVdLb1NNR0NYYzc0UHd4V0p3amNaY0hIeExBNjkra21vUGpWa05jQzg5ZnpM?=
 =?utf-8?B?eXFxTzFhTnUyMFBWU05QNnJCT0Y5MURFblZYNWxzZHl2QVF6aDVSRDNpcDk3?=
 =?utf-8?B?Tk1qejZQY2huaVJaOGRtamI0VDRiZ3RMZVdKN2wzaDdMaWF1ZlhsY0JCNHBp?=
 =?utf-8?B?M2FTOEE5dXFwZ2RpNHUza1hGMDdvcWVwNnBhY0w0clBFRjZZSUc4bm5Bdm4v?=
 =?utf-8?B?aG9nV0hCVFM4Z0o3THhMYUlmTWZ0THNzNEt1QW5rdGhJYmdzUzc3Q0tFR0xX?=
 =?utf-8?B?NEVMUnVhNDFVYXhqbTBDNU9xVXpmclF2N2Nvd3RidHRmZVlZa1FxNDY5d2p6?=
 =?utf-8?B?Rm1qaGVhNnpuWTAxVExZN0VqTUMyb1NkdUNETnF1ZDc5dEtBbjd1c0NEV2po?=
 =?utf-8?B?Tno2RC9JSUxERWRzNzVXY3JpVzFDT1JvNlM1M2crV2h4TU10WG55WGxTdVY0?=
 =?utf-8?Q?AmWWJU6P0G+4jip0=3D?=
X-Exchange-RoutingPolicyChecked: dQuObaYxaTnIDnZQiPuYzqKwYESzOaP8P1cyF5YgGU7PMqoK3ITzYQpXdMAgnOkSVgLEJ1h0fu+5Me25XQTOse53BAB/WitZJbZr+b7Ye8QPyVbL54fsftjDVWSqKtR/V0SdsqS/Yg0W7+WXmxPVoXXecdnTho+O8Lfjc/0Bv8p1RtqScsWem170yRBTQxgCzROE5juEC1L9zJsGAul8hR0GO5IUbMFeBLfj6rR9KEXkxZi4DDv4DVmQvmQn6YQnYp/MWLngqYxZ8VRfrQoefhx3F6O102UChSgYF3Wz/a3zZeDQ3FsOglDaIOk+6BwFFYZg/BKd6WpDhtcMCy8mYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc34f8e0-2ea2-4634-4b78-08defe9f8d21
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 09:43:55.5285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIWXk4AqLTJTAw4uzK6zPUDJgQO4I96PW45cxpNDVwUX7cu8b/HkZM7Q7DN5rsKYTCMIj6BL3AZY5jk7m1e2lzX5mNviFpWHgRw8mWXY6Zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5069
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

Hi Janusz,

On 2026-08-19 at 16:41:06 +0200, Janusz Krzysztofik wrote:
> Before commit 59e3bf83f6bae ("tests/device_reset: Add cold reset IGT
> test") all subtests required device PCI reset capability, with that
> dependency placed in an initial igt_fixture section.  New subtests
> introduced with that commit didn't depend on that capability but that
> requirement was left untouched.  That was OK as long as all devices
> being tested supported a PCI reset method, however, that's going to
> change with an upcoming kernel patch that addresses DG1 SKU 0x4905
> inability to perform a PCI reset without breaking the device.
> 
> Move the requirement from the initial igt_fixture section to the
> relevant subtest bodies, so cold reset subtest can be run even if PCI
> reset is not supported.  See commit 4a5fd4e7cb279 ("tests/device_reset:
> move later skips into subtests") for justification on why not to use
> an igt_fixture inside an igt_subtest_group for that purpose.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
