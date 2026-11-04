Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00123607B54D
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2026 19:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DI8e+xyc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5EF10FE53;
	Wed,  4 Nov 2026 19:34:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F1010FE53
 for <intel-gfx@lists.freedesktop.org>; Wed,  4 Nov 2026 19:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793820891; x=1825356891;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VoDpC4XMVP8ZZN7Edq7JLYMn1vUyrhy6qrSJ72N8K6A=;
 b=DI8e+xycm4KtZuPWqqdmC7Vs06LTbTYqHg+nn87CDLmBToWXhDPhnoJ/
 UZ2X+zZCtnRy4aleN5NSmCJMSm32fkAPsxaADhOvdD77v2u/2qYteyuph
 zZsjLCSw1Sp3lW5fXI2VyuYq7cKLokhynLrgEazR3mYQjFuBWK3SqpcWG
 6ZtydO4VTnv01DoFa0JMyQVJ7GazucTUcTTHQXnTERIuJqdoLWpDo9UZl
 Y1mNZFePH3yCYEWVlS9xtWOSNinPweb4KW7AZNY1JYtXl6HCQVb+0diAK
 EvVbPR2vSvFl+VAgBiXX8Emujs3cYKuDEdB9Yin5fRyjXvhsijjQXy547 A==;
X-CSE-ConnectionGUID: M0Tj7t6LRgW5AYwD9BBXdw==
X-CSE-MsgGUID: YPh7iBj/T5W4dZ2Y/9oe5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2608491"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2608491"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 11:34:50 -0800
X-CSE-ConnectionGUID: s8HRWC7fRwC9VauTXb3OYg==
X-CSE-MsgGUID: iqBRZubJSqSa4bk+fapJ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7122601"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 11:34:50 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 11:34:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 11:34:49 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 11:34:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ir0TvdiRh78O7wQQhWjPrx1WI6F2ZiN6rcTPipeCdbe5O0T+b7lMiJqEu8396KAZBKtvOK4YEVvYlpJDvHmX+nGhEgVXEFfwzUs6aeL2VwfRNkpSeq43T6hh424WMGz7tzLWfzCMw0GwxbjFkyYxboypnU39TTRtopLSshyy2YMfOEdgW/ADc81XqjVUmQ6afq/RLLMPAcmUn/YMkdiZayL407392wNoVOXq30J1OCRVEjnZ2CHQgSqvqg+FmsvihPK1r5yfeImDTP83pS4P2fJKTzSh59dyRypR2nKkiMES+BFlVapqGD7xzgAlhz9mWu1ok9GEswzAUixEvUagnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxmDkl+XoLF/fGoels5ShitDsooWp8lAz4RfpZ2wZFw=;
 b=ervSwsZPymKrAGK1G4tWUJwZxmyRx3S2Gl8CU8SJad1Yfwk5qoD/qehJSXWTasbpkB8hC/Wd53LomDe/mBqtAoe2QPmV0vCRbyKpBknKtyDElZ6LHq5k8rUqg5sf4rYlt+LMm6BucSTmV4JkrkzuiLjFp0FXZaqRGid3KG+bcQxJvwDj2x3DdfeIjpQ/3cn8ZxwHkJZKvrgIOMb+06nhX5iNcosnXMyS8fGLy8Hv6s7TsPAPm1DqOtnq9Q/Qgt2FdtycTkoG2njC0uXU4WX96SETC+i/tKJWYAlBbGdkjhEb5l31q+v2lThJKwhAwsatG3pTWtMClY1fwO8+8vSPXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by MW4PR11MB6668.namprd11.prod.outlook.com (2603:10b6:303:1e9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 19:34:46 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 19:34:45 +0000
Message-ID: <50b7f271-9952-4e50-9aa5-fe359d5de99b@intel.com>
Date: Wed, 4 Nov 2026 11:34:43 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_drm/i915/?=
 =?UTF-8?Q?guc=3A_Test_GuC_v70=2E83=2E0_for_DG2=2C_MTL_=28rev2=29?=
To: <intel-gfx@lists.freedesktop.org>
References: <20261102221518.546010-2-julia.filipchuk@intel.com>
 <179374939378.113500.98831872040500197@221881a7231d>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <179374939378.113500.98831872040500197@221881a7231d>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:303:8e::12) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|MW4PR11MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b647361-99b9-4a27-bfab-08df3aaaae54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|11063799006|56012099006|261009223027099003|261009221227099003|261022105027099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: aGXh3nl28aRU2eqpQV2SMs+mx2Kr7KNdV1y084Ss4pin7RvqK91HWfsPQYwqV3/dM/CEYId19FXeJ5Gkpgwd42jXXkHGH2fc9g8jK/nOg8om0LK6iRt6V7aqqmi1Qaq9PhsUlXYL/e72qwUP+yILOIU239OKqaAxlYDJ0q/+NW2d+ftFggsYtFpVElSehCf8VVelb3s/hsUK7eoVvXU2f8JC8bHvFYZp+qjY//WJcRjZoeU0vpXBlAR6XYMGd2L9D/SF7wfBnytZ2abQ8xxcs/gryuliw7UGOrpdZoAUIvY9BHDHPLkICF9YBI0qk5ODpq8UJ0pf4D2PaNq1vNsPhG/yeQ6Ju1nlkgNoP6xw6BFcwPf2v5MMkFK2klPBoO4RAWDToR2IGeMGO5kJ5aRzNSaL8E98F1Nk42fuPkr5j4CG+Qyjr0WkWQGnTQA678RXVMsStYIAwKf8My7C+5LlDHmWq4wYn6nHL6wDtLyauPX4rBww2YQ6d3BKnW3E5nKNrwdgqe8CEy9BzkXEvN/cfO9yf3Auvvpjx0aeOjqLOavUtC3tPHZUQZYAe57t83x6XMYGyGb5azNZtNeCPX8Rsd5lo+tFE/bp6uDi+1OtQUyoZrBZoCdEmqViotAvNM9B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(11063799006)(56012099006)(261009223027099003)(261009221227099003)(261022105027099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K09jcDZLd3Y2Qjg3c3hIUzlIcmZwNkprRk5tZ1BRUHQwb0JqbXNxU2xTMDJw?=
 =?utf-8?B?eU4vWjBuWkZoaUhqV0ROWlpIWkNUMTd4QzBOZ3ZJQ3c0QjBleVdxeFJhTENI?=
 =?utf-8?B?N29SNVl1WWNMc015RlJmYWtsdzNMdEc3SmljLzFaTzcxWjdQL1J6VGZkSmhP?=
 =?utf-8?B?OURXS01OT3Myd29XVGdqUXVqbjh2ZTBjdFpQRlIvb1hVb0t5elI3Qk9vQk9Q?=
 =?utf-8?B?VnUwQzY2L2tpV1lDYUFwUnJ6cWVBNW9wRURlczJESW9SZmZWUmMxU2JralJo?=
 =?utf-8?B?MGZVOUN1OTVhejFGQnlwMEtKa2p4d3k0eDdOUzgvT3JEUFI5dFM2Q3lqbHl2?=
 =?utf-8?B?WGEzUjJoMHVpZEtYQk5xWENRTmppc3ZUSVlVWTZxRkcwRG4yYW5BUzYvVUNq?=
 =?utf-8?B?ZFc1Qkk1dUNwUnJYS0NuYmFiZDBlVHJvdzBXZVZMc3dGVTZrRVlKekorL21v?=
 =?utf-8?B?ODFvOVZ4dW5qZFlJaUcwNWhrbk45RHBEb2hVaGhLOWFockRyVEhucGsxRTJD?=
 =?utf-8?B?MXJqQUhpWnc1a2s0bVltMy91KzdhcStsUzJpd2dRTEtLZE00Y2VmUC8xWmJM?=
 =?utf-8?B?MUkrbkNpdCtaM1NjVk1jS09MQmRqQ3cyMnFUNUk2ZWd6enBCRVIydmFNeG9D?=
 =?utf-8?B?b3puN05EVXdubVRkMU1PVGU5TkFUd3VhMnUwR0NSNm9KZnZrYWJDZkk0Y2ZW?=
 =?utf-8?B?bkthN09hRnY1ekhoaDRsSDNXVGliQjVEcUgwZmV3bElydkxia0cxS3gzemZY?=
 =?utf-8?B?Wm9mWHNmdkl2MWIwL3hXVGdSNWpwTzQrQ2pkZy9GWnlITnh3WTFRMVRWUEd0?=
 =?utf-8?B?UDZwcjlmS2Vic1NhclFNZHRHRzdSdnlzR2xKT1BBNU1HV0VOelgyWk1XVlU5?=
 =?utf-8?B?YzdZNDhvUzllNnYrZEl5ZXR1ZlBLK3BvdnZWZDJ3V0xTS2kvcUZPQXNGL09S?=
 =?utf-8?B?cWNtOXFQdEp1N2szeXBlejZob3k0eUJ4Sk5HWjZXcEQ5WERZeTh6QUVnY3BO?=
 =?utf-8?B?Vi9xaU5Ib1ZFV3hSRXdVRStjWEMzZ3l3OXp0M1Z2amNERTJ0V0EwQUpoSC9i?=
 =?utf-8?B?NndQSkJmL1ZsRzc5UTl4bnVPR3lwSmduQkVybzFLSWk4NUJHQVB3cG92a0dy?=
 =?utf-8?B?WXNFemN4S2l5SVZpanNBZ0QvSmtXa29Od1h1R1Jva0g3TzBQUTdzc3hRVlFU?=
 =?utf-8?B?VjJ4QnYvL1djL0xSSVB4VllaN09uZENoZzEzQWN4a0JTT0l3dU5oT2U1Qk9C?=
 =?utf-8?B?c0ltZG9tdmRvVUsxR0pjVjgvOFdVTXRIUjduOWdtbVNEWWpjQ0o3a1dLdlpE?=
 =?utf-8?B?UE1mZFJ3cnR5UDRLN0l2alc4ZEpyTDdnRHQrc1lkVi9laGpjWG5yVm15dmtK?=
 =?utf-8?B?TEx5ZjhXVTJxOHdWSjRSSUl1RDJtNDNOZWlnZVhVaURMRzdIOTJWVG9VcjNy?=
 =?utf-8?B?bFRKZytFSmtsU1k1eDlzeWVNUzhQM2lVK3BUYklhMkNaUXYrMThITzJLTVNs?=
 =?utf-8?B?UjJHSlhEd0sxbGhkUHJEc2YvYTNZaXhlcXFsT1RHS1JQZG9Kd2dwY01yL1ZR?=
 =?utf-8?B?UnJqNzk3eFF0SVRtV2JndElGTVpYelZuOVFXSzl5VU9qSFVNK2FCZ0FzSno1?=
 =?utf-8?B?RHYvbjhGU0ZhNmdlcHhUV0dya2RFRzhsZmdER0ZjSFdzZTJDc0xWNm9UOXZv?=
 =?utf-8?B?bjh1VjZPL2poNjN2VklRYzl2akd6WnZvbHUxbWJIUktSam42aHE0RVNlNkpE?=
 =?utf-8?B?aDJ0QU1tbnFDTzh0am5CVkd0OG4vL2xXeGpvZHdBTFMvRk5pOE1pOUFYd2FZ?=
 =?utf-8?B?R1djWGFKNCtpL25nbHN6OU4yK3kwUGxYOXhnQnVZS05CTW1tMmVPYm95bHVR?=
 =?utf-8?B?RlBTWHo3d2xlcUhWSXBvNUtVVHJqajd2cnZ6M25wb1pFeDhCZElUYXY1Y2FF?=
 =?utf-8?B?VGJKajNuVmsySlBtdk5PZ0RCaVdEZE9FSUFsSStWN1VXdWlYd0pLUzhqSWJF?=
 =?utf-8?B?QllKVUtVU0VqQ0tZQmE5aGZ5ZGpERWJJV2FCdU1UUEM2dnE5cXR5Qi82dlAr?=
 =?utf-8?B?NnJ6eVdkS2VOZlh1MDZoOHp2WHZXQndkb25XNW9kaVVpVUtTR1JoeFlsM0xT?=
 =?utf-8?B?dU9hbGRxTHF4a0UxMENULzJLbU5wdEM2aUV1TmtWWHh6T0tleUxxK2t2aVU4?=
 =?utf-8?B?ZUdBZTh5U2k3ZmNxaXZkTlF5Zi9VUU00RjYvK29oaGw0S2MzUjlQL0pJZlVU?=
 =?utf-8?B?MVlDQVRCeWxPVFByMmd6M2o4c3lUSXlhWTF2R2htbVRQS1U0ejlRN1A0OTZP?=
 =?utf-8?B?U3k4UFA3dWhoWE9DR0tyY3NELzh4ZG5WR3dIcXQwek1YTU1pRjliU0E4Z1Zx?=
 =?utf-8?Q?LhFyNAou40aPT3Vc=3D?=
X-Exchange-RoutingPolicyChecked: PXlbgtjRR0at0GqsBgUcQZ7HIiowUIIL8jn9hLgtypsFeOvV8rmeW44ogRwR4hSKih1z3BfYmyK5TlU8xsue7PWrj0vKUunx9PYXKE8souujbSjvldKhYUnTW63I7mqiC4hHj8ZqM5mulSK5U6vjaQtt4DUyuhR+1oqX3vze/o3GSncs6EacGat7NPXxVOZcojD7iwKspSISqYXptuuDgTJmBs2xR/PAESqsNSZOsQT8XYRF96GWIKcJPKeSuysyT2yRavqRXBC2GmUt+qNBWT08FotMIBadw+4WAomDlgLEdijEfJUUHurLoypgvuC4jawxVQ873a2NkZmJAGuAOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b647361-99b9-4a27-bfab-08df3aaaae54
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 19:34:45.4844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9qq82lg/rOqMw6HVFRmLOMGhEzAHFnsmayr6yo5bLy0B9u4++N2Zv4/Y+kLjP9ebSxE7E6iNIVgZSPIWbixhjujMPY/5g/Mpp8x8vuyiyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6668
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Failures unrelated to patch set. Changes would only affect GuC loading for DG2, MTL.

On 11/3/2026 3:43 PM, Patchwork wrote:
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
>     - shard-snb:          NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177514v2/shard-snb5/
> igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128:
>     - shard-rkl:          NOTRUN -> [FAIL][2] +2 other tests fail
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177514v2/shard-rkl-2/
> igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-snb:          [DMESG-WARN][3] ([i915#17763]) -> [DMESG-WARN][4] +1 other test dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19438/shard-snb4/
> igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177514v2/shard-snb4/
> igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@kms_plane_cursor@overlay:
>     - shard-rkl:          [FAIL][5] ([i915#17766]) -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19438/shard-rkl-3/
> igt@kms_plane_cursor@overlay.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177514v2/shard-rkl-2/
> igt@kms_plane_cursor@overlay.html
> 
>   * igt@kms_pm_rpm@drm-resources-equal:
>     - shard-tglu:         [SKIP][7] ([i915#17764]) -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19438/shard-tglu-10/
> igt@kms_pm_rpm@drm-resources-equal.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177514v2/shard-tglu-2/
> igt@kms_pm_rpm@drm-resources-equal.html




