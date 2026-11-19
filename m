Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C03606A320
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 11:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E4/GylrQ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DkSF5qwX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBBD112298;
	Thu, 19 Nov 2026 11:07:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90B3112298
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 11:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795086431; x=1826622431;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=wnoLR4BOvJYcwweKRwCksgcyhlWHJ43QO04Fpyj4uPk=;
 b=E4/GylrQ2aIznTIhzCcPNFQzRkOk2o8NLIA1rukEIdW52hmZpwec434c
 fqA7z/uAMPbJ4VvQfwNac7cHQ+dex8su2pJWthi8zg0STtIE1XKt4freI
 kkQryRv8me/b/nLQv+lAej0z1KC8JOABFxODtmx7UBUgg2XQANKSaRco6
 ThqgK8kPpiFTdnP6hCoG1h/U4L16s6mtbNx0wD/1wXtd8b6H1ZPV7sRKx
 5TQGxU4ucbdbXNGKdYyEc/SzBrrArLWuo8Dq8a7qDuHXCxJ+pTIW4JAP0
 lTtNEUVS+IrEh8y9jmAhM/MIda48HOzb141NbYHD141/Ze7qFmxKznjVf A==;
X-CSE-ConnectionGUID: hT9xXZfYTbKQQEMIufsZ8g==
X-CSE-MsgGUID: i0x1yrNpTCWSfaR03ZCBiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3816725"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3816725"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 03:07:10 -0800
X-CSE-ConnectionGUID: qnY3G6O3SYW8tOUYljwHig==
X-CSE-MsgGUID: ppNbW5UvQ3iRECRjy5IbqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10654672"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 03:07:10 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 03:07:09 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 03:07:09 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 03:07:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5+ZlNn7H+xMx/KvIy+OKMI0p2/iHK1PxZ9g55vZzxyumlO03kTBayXKMRzdb4FLggKi1ZRqz0/RUhSrQ2AtXjsCwh8BRIfoMUjnZA8a94+TPd6P8WS7N2De1K/nZfc/4lAtOyGUAahLPxhrGGUNzO34LU8GZF9r0Y4KlK5iqppqYFFn4Wqm5QtPgunTp6mX2dM48LXe0ozLpHAZGH0LCnuCYzGyvLltvSfnjWbfaqQnsEdINbz3RQZNVTp5Kj0yDPv2DI8m8IsS4NCZZJEdCyIKnQSfXcRWwebFwKKHr15iPCqUvvNAiwmi0EHe530pGLBADfUvsqT6rHH48RrGkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pwk4L4vRWqIZSF7xojQSw4rqDx9jdnbVOQVdfvgj0l0=;
 b=iHXsRw03J2MF7uyzb+7lV7bCW9iDa/zrRJsE1cz4eBGhWNhl/kEXsgCoaa+90untd08IRexnIr0Fq6Mn6bx2px+KdMJgEFBSCqg485nD/xAV6AF72UipbBFUCRszxjfvlSfhhjpxbq+FhwBQTXgvygQRT1nE7uJPPxnpDg7yJSNX9HJwa55HXqNgs2yonMUDJtsj6PQDpfHJuYPve/pbZ0PW+E6p0zPnJeaT6s9mnszh2VDVB2kD4P9hxUhT4hkzQCburq27+HjntC81+iPqKpeC3LqWwjxBu27tW08PlxPsZcZQZZVoVHcosQhafLP09LcBpoke/6ufjhkFavQfSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pwk4L4vRWqIZSF7xojQSw4rqDx9jdnbVOQVdfvgj0l0=;
 b=DkSF5qwX+Gl1jNt5YS3WMfhwFG0gtTSr5A5cNy0Lu3nb19gesXA5u/iXbDU6G8jhlgZOKc1NoEPhKoI0CKUbGhPeuTuOhB8er2qGq8NyCr7TTXSEMXavQAHifD5/p4XiyoJ/hx0MA+sulj+ptHyt2kimGhG4K1Q1xJqtIliJu0c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by IA1PR11MB7870.namprd11.prod.outlook.com (2603:10b6:208:3f8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 19 Nov
 2026 11:07:04 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 11:07:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 12:06:59 +0100
Message-Id: <DMZ510W56JPY.Y80JF2RM7J44@intel.com>
CC: Krzysztof Karas <krzysztof.karas@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <chris.p.wilson@intel.com>, <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v6 3/3] drm/i915/selftests: take error_mutex in stolen
 reset test
From: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.22.0
References: <cover.1795006734.git.sebastian.brzezinka@intel.com>
 <72a2b16b5a4cf8deffad74e8ae85a586a5d693a2.1795006734.git.sebastian.brzezinka@intel.com>
 <ocssumcrob46pblkatgoctmk5rb5gzaeeoe7ifinknfd65e3tq@ndmwuirrfepo>
 <DMZ4KGKCCK8A.2E0HP1AV6ZRQD@intel.com> <av7WNeQtujfjHyWn@zenone.zhora.eu>
In-Reply-To: <av7WNeQtujfjHyWn@zenone.zhora.eu>
X-ClientProxiedBy: VIVP296CA0122.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:358::14) To IA1PR11MB787425.namprd11.prod.outlook.com
 (2603:10b6:208:45e::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB134916:EE_|IA1PR11MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: dd756461-85b1-4e4d-a3b3-08df462d3e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|261102123227099003|261022075727099003|261022115727099003|4143699003|56012099006|261026121527099003|11063799006|261026140227099003|10067099003|261022105027099003|261021121427099003|261028144727099003|261009223027099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: E+C+H1slexiHxhlbLL8B8Ts3xHMumLIvLdY45uoesMIP7xJFLXe159yz9ULkU2f6d/8uSNxRKzGhtCZL/V0OfqCZ7k0L5f4GeY156RuxZLTKVzlHwCwtPa1H/ORlr2XkOpbOHLfMof64SSkvSmNf/iGInog9KGXGw4m2GO1kt57GwUqiTG0mv+U4OvrRzumojrbR6xotv0oW23C0O6z0HlwDP0geWYoal0XfyNUt6wn/znkIruOYvtHSUb21C3YikdkuwLyFytP1Lg0vldrAttr+d+YjSEvghpq95q6qU91Y0j/DEdHIixefJntiqru00T1Gq0TMgtqJLbAsNvkNuFkXnUWS+FZ/JptC1nr1v3yILpf+2t7ut2eWpfVNYSGLUmOKYlYmQsOPDcxPxYSASjr+JdXkuRHsYnmVdmjI6Hd1vWY/ZMtt81lFxQyvjCoZtxNFYjIluvrG1L9YHXS8WgJVZD2nm4IBlhB/Q9sa83szMwDAuElpCmhqsRg0Kn49ZyOvPXD5DC9j9vWVe2g5kl63gsDve2uFyTeNPbiXk2bjMoKmdt4phaTlTXQzqgCZ9VS+yEoFkWAisLBcJl8Q21g0Y9XaBfVz95qe6r+xKFKeEeQNe4npy8VINJpr8oKXMDs374GCIER6sMyhPahaa0BBVlI8ASOnunmj2wuXA9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261102123227099003)(261022075727099003)(261022115727099003)(4143699003)(56012099006)(261026121527099003)(11063799006)(261026140227099003)(10067099003)(261022105027099003)(261021121427099003)(261028144727099003)(261009223027099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1BuaUFsV3FXYlE2V1BqWEpQdnNvWllNM2lNdG0vUW5yZEtOdVJZVllvejRW?=
 =?utf-8?B?c3AwOXFHOUNzQUpNV29EbXdpZytTekREUUNLWHQ4dzRjNVR0K015K1RYVjRB?=
 =?utf-8?B?VTQvWksrT1h5Q1hmR21zNFdkSHQzaUNpYWtiaGFWcDA0MzFoRWFGUUwwcGla?=
 =?utf-8?B?UWZONmhPdzVIdU9xYzhZbDlCY1FZOS9wSFZYUER0Nnl2V3d0YnV0Z1c3ZVJm?=
 =?utf-8?B?dUVLQytnaW52YUdxMmMyWlg3YWorZDJrOVJGMnpucGpQS2IwQkkwcXAvcE00?=
 =?utf-8?B?UEQzQzNaSEJzemN2RFdsdlNGeFBFdjhrdWJEbnUrekw2V1QxcEJ1bHllVWx6?=
 =?utf-8?B?aVQ0MmNnd1RJNUVHaE9UZUdWMVVhTk8xWkpVektCV0ZjNEtBd3FYOHN0OHlm?=
 =?utf-8?B?VUFYT3BEbHJ0OVJicDVXcWt4ZWJCK0tJcndjM2R3Q1JXYzk4cnBnVTI2VE9U?=
 =?utf-8?B?N3FTUlE5SG9xMjRwbWRUVFd1eFc3bjNlb0tmd215eTBMQTl5dkt6eHFqYXhw?=
 =?utf-8?B?V3dKZHgyeGk0dUVyWUN2QWMxQVprY0lSOVFHeSsxQS8xTU9LN1gxanMwRlZT?=
 =?utf-8?B?YXpCUWhyS2NXU1RkY0tOVEFTZE1Tc3M1MmdJK2Ric3p2c2M3SXlaODlsb3dF?=
 =?utf-8?B?Y3dwblJVSHN0ampkM3Rkb1REQ2VlQjJucWhsQVd6SisxVy9yNEZXRWJzL3hV?=
 =?utf-8?B?dTZ5a1ZFN2l3bWlqWDhFazl3QUJkY3RYVTUyN3YxbWtNa2EweWF5MlhDdmxF?=
 =?utf-8?B?UHRTc2dRS28zTlIvc3pLd05uQXByRDlKQkx1ZXVjOG9HZWNmMFRWVnF5NUJJ?=
 =?utf-8?B?ZFhqa3Jjd2VGVENNUlZpN01XNVp6UkdMWHFaUlZKaHNjNFRJRllWRmRwSFYv?=
 =?utf-8?B?ZjFiWEd2ajBhUFU0VzBOTWVKL0xkT0VUQzJ2OTFiMmJtTW1vLytlZHB5eENi?=
 =?utf-8?B?U2VoeHNNMXQvZUNXR3VuUzdvMC9vRWR1dlpoOGxldS9jSzdqWkR5cFhjQ2dr?=
 =?utf-8?B?bjd6eEdtUCtZUDdXQjRhdHhJT1M4T3Y4dDBrSXpGU2dmRGpnV2dCbVRUUDJz?=
 =?utf-8?B?eEV3Rnh1RG9KWlZwR0N4L0lPUnpwZi9SVWZwNUVDb3BpUjFrZVY0cFcvbCtZ?=
 =?utf-8?B?RjczdEVsZkp2MS9VSGVqMFY5MDRieHcxTHN0K0pXWXVXdnNTdVRFWVJzb1NH?=
 =?utf-8?B?a0NlY0NqRDdYNERZVUlTZWVQclVyR1BhbGZZdjh4RGtGUGRYU3RKeXRuVnR0?=
 =?utf-8?B?emNOcHRpU3plMWtlcFYxcjM3c0RoTVJRckozcmdBb21ta3BpYmRNVXRVMjRJ?=
 =?utf-8?B?am1jbDFSaTU0Z083dWQ4cjg2bHNOTjBWSGhPVTJhSncwU0Rxc1lmakZ3QS93?=
 =?utf-8?B?cFN2MnFGbVRVSE0rU2FUSUpOYVV1UlJvU1FkelJVdzJOVjkrVktBZVRDRWl2?=
 =?utf-8?B?MHh0U1BGL0I3RE1CUEtYei8yMWFtWjljcHI4bW5oblhvVFZlQS8xZEFOak0x?=
 =?utf-8?B?NFJkZWFlVzVmc0lSRVlVc1FrT1AyY3JWaXlYamM1R1FQeEhGNDFNSHR5aDNp?=
 =?utf-8?B?VkdIQ3c5ekxMOUVIVmtWNmJJSTFVdDJDWVUzWjhiWDJkaFIxd3ZmbjFOemk5?=
 =?utf-8?B?bXR5RVltWGR0akJJT1g4dXNOQ1NVeGIzQTlmWjJtb3ZacjdleGI4a2t3R2VN?=
 =?utf-8?B?S0Joc3kzTXFPc1RhUGdlMnE5NWlnak1MTjVjTFp1NW5KVXMvdW9xZW90REwr?=
 =?utf-8?B?N2VjcE1CQXpoZ0xjbnNmUUpBeC9yM2lDNkhDZGVIc0ZYQmN6VkUvcG1tbFhP?=
 =?utf-8?B?cUZISlZhYVcvNlFPR3NaVXNnMlBrZU0zbUk3UUxMRVhIRWQxcHBDSFRiWEtM?=
 =?utf-8?B?MndBQklwL3VBL0hPU2dVbXJoL3N2QzNIV0pwRVJSbUJBT21kZGE1d2t6RGJG?=
 =?utf-8?B?M3orMXpYcmVhMFNPUmM4cm1mazRKYmVKY0MwNG1kKzBicmY1cW83ejBiKzVQ?=
 =?utf-8?B?YUUzOTY2U1ZKOTRRUDFERjBzYWtKcStjWlBBMGx5Z1ltd3ZXa0g4TGkwekJp?=
 =?utf-8?B?bGFQYy9BcitHNG5Zb1J2Nzg1Q1FhNWpUMVhGN2FXL1ZQVVpDMEIzaWJvNitm?=
 =?utf-8?B?OWNxcGJucmpWRCtXZ3JoQ3NJWjBpWGRGSlByN2FtWlVpcGdtME83YktWaVJB?=
 =?utf-8?B?cDlaWnFvU2hBZlMxazRndUFDbnlab2QxZ2hsKytXeEtIY29uVHptaHBJV2ox?=
 =?utf-8?B?R2ZkeFVrbTJzRmZOWEFqUmZzYzl4MHdVL1FpNmFyWk51RmtQU09xNUFvYU1M?=
 =?utf-8?B?eTVHVktWdjFqN0F3WWZJSngyMGFOakdTYjJRZ29RY0hENlR0OFNVa01qY3FN?=
 =?utf-8?Q?Ltv9s2gVUa8RjCTo=3D?=
X-Exchange-RoutingPolicyChecked: R3rkKKnaDdVKlA8bEj3PLI8RNJ4TmCQa2BD/h+8dOpLyINwRtaTbFOfU1hIsQOkdqxiX31F5EFd+MZ2IYp/ha/9YsegCsmPAKGvexZm6tebIGm1RbUD0sRfyUycbC9fj5PQ/l8XXTRwOcJx9aBahI7aNEK+ESMpCng4t/kuVJVr6RMyFzuBGA+ME8mkd30ujD37O5SjZggb5f+Q5FoavM5YWgjOcipay1CNl8tPTYLyCXdu0awkoDhE/pTPuXLQawdTn09t5iSGAPiwDvxBhIikAVbQ0PpQXST45XMHNJ88Zw3yJwjpnCBuaSJbuN/sc99vdnTDCixxsLm78zWQJMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd756461-85b1-4e4d-a3b3-08df462d3e38
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB787425.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 11:07:04.7048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fTmer+QiXbt1tTALmL59+1rOFgmdXOwj2YImZXuMl5iOlrCYLf81XprG/BnjMDPS3c9ucYwKe/mASTy6OOFAmKjiVwmkowuMYlagstU388=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7870
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu Nov 19, 2026 at 11:58 AM CET, Andi Shyti wrote:
> Hi Sebastian,
>
>> >> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/d=
rm/i915/gt/selftest_reset.c
>> >> index 09a08a91e610..bd5876da6449 100644
>> >> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
>> >> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
>> >> @@ -36,6 +36,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>> >>  	intel_wakeref_t wakeref;
>> >>  	enum intel_engine_id id;
>> >>  	struct igt_spinner spin;
>> >> +	void (*insert_page)(struct i915_address_space *vm, dma_addr_t addr,
>> >> +			    u64 offset, unsigned int pat_index, u32 flags);
>> >>  	long max, count;
>> >>  	void *tmp;
>> >>  	u32 *crc;
>> >> @@ -90,18 +92,19 @@ __igt_reset_stolen(struct intel_gt *gt,
>> >>  		i915_request_add(rq);
>> >>  	}
>> >> =20
>> >> +	insert_page =3D ggtt->vm.raw_insert_page ?: ggtt->vm.insert_page;
>> > The explanation in commit message focuses on the locking itself,
>> > so changes to insert_page calling seem unrelated. Could you
>> > split it into another patch or, if it is required for this part
>> > to remain here, document it above?
>> raw_insert_page is needed because the test now calls insert_page
>> with error_mutex held. On Cherryview and on Broxton when VT-d is on,
>> insert_page uses stop_machine(), which can cause a lockdep warning.
>>=20
>> Should I send v7 with this added to the commit message, or can it be
>> included during the merge?
>
> no need! Please reply to this email with the new commit message.
>
> Thanks,
> Andi
drm/i915/selftests: take error_mutex in stolen reset test

The stolen reset test reads and writes stolen pages through the ggtt
error_capture slot, but it does not take ggtt->error_mutex. The DEBUG_GEM
poisoning of stolen pages, which runs from the object free worker, and
the GPU error capture use the same slot, and both take that mutex.

So the free worker can change the slot while the test is using it, and
part of its poison ends up in the page under test. The page then looks
partly like STACK_MAGIC and partly like POISON_INUSE/POISON_FREE, and the
test wrongly reports that the GPU reset modified stolen memory.

Take ggtt->error_mutex, nested inside stolen_lock, around each sampling
loop. Don't hold it across the reset, as the GuC CT worker can take it
from the error capture path while the reset flushes that worker.

Use raw_insert_page when available, as i915_vma_coredump_create() does.
On Cherryview and on Broxton when VT-d is on, insert_page uses
stop_machine(), which can cause a lockdep warning when called with
error_mutex held.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

