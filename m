Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387AB606A324
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 15:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IIRaIS6R;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=eBXU+Zjs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9610110EC63;
	Thu, 19 Nov 2026 15:08:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAFE112517
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 15:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795100927; x=1826636927;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=di7gS/Y2D5pdgSy5nwOOcPVMdF+18Xb+Nvp9eHyb/Gc=;
 b=IIRaIS6Rs3OwB1pw6bvdOoCfnolKnBigWmdLb92vTMq0f2ScbLCm2hGr
 rwCcTMrG1pb23Pu79o9CGZET877Pv2TIobjbSK0lVT/t8UHqO4Pd3RiZv
 sZRYq5dgRbatmNwmP/gVFm3oIaVHEQuUOnc1eIgSw6yP0XBuX8y+D4lih
 LyiYIE7l1v2ZOUgPIMldMw1QS1f/KR7rxvPiAx53Ir9cQv/qDmoCIrbMe
 bxW/0PO9IfX/+QytwmBMbZKEkwIxhveZANXKfRuqLwBqF8I8pUCFokVfV
 t5FvKCGdFiHEw3XOEgppw6iFb7Ydaz57pKXQZ5/9SmPglXCLTCTACnLKr w==;
X-CSE-ConnectionGUID: ou+m1NCLSaabAb7c85p6ug==
X-CSE-MsgGUID: 0iizzi57QSuylUPbbrBwTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3867720"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3867720"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:08:37 -0800
X-CSE-ConnectionGUID: SBrjWdbSTZ6GUVtjCQITFg==
X-CSE-MsgGUID: d0v3y1uzR8ad+N5ZwsQwAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10790459"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:08:36 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 07:08:35 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 07:08:35 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 07:08:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9ArUEssAhYu/TMCTuQ/Y9ap6PQ0lSJPNF/3Z7O0X8IG8XNSUeQlo8ll26qcRagPiVMePWbVg/iJY2Z9/Cinx+3nDkYtSVyEpP9/EPAAOSnZxs6M3yqsqYpaznC9HB7Ymg71CSm43W6FpsUmgL3KUvgF6xThRRuV16ahaiBfqw1WPL+q0fQyId6dkFcPEMIhpLiOK/vaFJBVqxXcYkIRuTq+LEnFYrFds7SBQfkZD/74ALfGGYAmkwHPcsQeswdhsKivA3RBrCuDxj74c5mlfZe+fNOzg84+UJ5jg+yIJOvPOChhrvc17T+MrpWDHCbNSrijqi/1crwSKNPA/CQwlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhljlhlmdFPUYwrDTKVoRnCU8hFTbsI6u/6T2cJzl6A=;
 b=BJ8v6yERRqUNuIG9kFhAUCSbG+YGDDc+qmprV7hphtttx4QUz40thA5wEjUYkA/Yhsf2d9m+GbYd/Dlb0pR19ee3xmNfqbWac5izYfGkYWF7dWwTT6lTeXIraKHVXgtPJ5WDtjNxHCb4Qteyi7Bg6wV/PVUde2mMnlcwl2g5DhdscVq+ZWQHhL/VkWDQ6RXLLVCASBuAm19cnUx1a2VK+FNyxp1Ww1Gr9L9zFiWc1/HiaXR9d24TR7/GiIrk6Ntq+V4UZlwZSf1GbBTC5AqlwvfQUhKHfsvpYOqpaIADwKw8o8BKOFJFJOvAWknDmYlExKmFASrul9LsJGRznrp2rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhljlhlmdFPUYwrDTKVoRnCU8hFTbsI6u/6T2cJzl6A=;
 b=eBXU+ZjsYb45WsiZ1VgzlvboWeFMhqEtOyPNMIiyqCFloOvD1TnvedBwLaxoiDDnnFYocmG+K341cbFNUhGVojGOtSPemzPoNHx9HsuWMUYx60uKNXIihdIj9oqi1Xf5mIzi9I+wO/2X2mZlQ+S1aY4rmoMrgxS7Xqjkc90hwa4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by DS7PR11MB7739.namprd11.prod.outlook.com (2603:10b6:8:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 15:08:02 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 15:07:59 +0000
Date: Thu, 19 Nov 2026 16:07:52 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <chris.p.wilson@intel.com>, <krzysztof.karas@intel.com>
Subject: Re: [PATCH v6 1/3] drm/i915/selftests: Fix unlocked mm.stolen in
 reset selftest
Message-ID: <av8QKqDSka5Wo6iA@kniemiec-mobl1>
References: <cover.1795006734.git.sebastian.brzezinka@intel.com>
 <c47b0ea2093da73a92e9e6d62b062f9cc52851d1.1795006734.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c47b0ea2093da73a92e9e6d62b062f9cc52851d1.1795006734.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DB9PR02CA0011.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::16) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|DS7PR11MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: bb795e3d-75a8-44cd-2818-08df464ee5e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|4143699003|11063799006|56012099006|261022075727099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: a1STClynhebZYWhOnyDofVcpJ752lrlCblvOgn7eVUFyV9F4nDoAZm0MCwr/VscIfV3Jr9gAt7Pau/KfeZVWgjS6juVbLBRWzfaRFbYGFQuFVm/bHIyj5qrmbN+vQcp0W5Mh7Aqvk4/OrAPsf4LbQyZRTQ7AupIhjcd/RhPIXmIN2CyMMLkdX5LT+qcnDAd0aLE+dEkjTkHfDogs0FVi1oVc2jWuJBTXUozkB3LpJHX6uJAyT9SU+GxEaiObI093H7GEP8i/vQNcE07Fwtoxzr5JJeu28oNT2Q421dyL7jpilR6sBnFpRLz8wZmmGo7UIt4pV3Sa8FSsMQZj1GnzZdCCiQPmb9JqvI4C/TksWRXYbmIzF4mj9HXBslqiLvzzSILdoPMmO4xlKli/FPtcWpDzo/iZfzF9Y/zHlCRSyj5d3qXv6UjWzbsuxhU7R34jhF2ErHsjj3SwLmk7RUxhw30wbdgRq+xcCxToerWQ+B0HPaUa4ROXsnZfo4ooq6DGlMSdVoKpGFtGKv7UTPCwV96uuxxsMqMA24HQyHCFN3hZ0+KS0R5e7omu/SVxuPSbcxLXfoksGulFiaJc3gb0Ex+0CB0tzke4SDMA4P1x9MIRbpdBnf/lBsMQA+9QXPu2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzAvb0lTNTVhYXVsZGdHWDZTOEk3Sk1WZ2IvVndHOVRQRU9zM3lxb1VoNFli?=
 =?utf-8?B?MGs4Vk5xa1Vnb1Y1Qkg1NDhCWDUwVEg5b1pKdTdkVzRHNFl4K1ZSYW90aFZV?=
 =?utf-8?B?bnNacmFVd2Vidzg5cG5QQzhVaUJlc2Zxb3QxL05wV0hQTGx2a3FHblJKWmQ1?=
 =?utf-8?B?QitvU09WU00zVjNyakpVZ0xYZmVUbHRqZVUwdjBrZ0d3dEFKSWprQkpsNzVT?=
 =?utf-8?B?TUxtNXBzWXR5U0xCRERQOEU2RWE3SGEyeklxOVFSVG1aL1M2ZTlxdXhBUzFs?=
 =?utf-8?B?MDU4ZVNCOUw4Z3RVbVBzNndSQUc3ZXc3OGxwZDlZb1hOaTRCTUR5NVhpR3RH?=
 =?utf-8?B?OW1sU2hPZkJWa3p4cjB6V2pXTWdnbEhBN0pUeG8yWkFDOW83TjVWQ3lEUVlw?=
 =?utf-8?B?TWFRNlRYTW4vdkY0d0svYWkrMEdqM2srS1pBdU94d0cyM0lpSkdMbXRGQTZ5?=
 =?utf-8?B?S0p4djFsdUhUMFBveFVob0dvdG45b2tFWElWb3lUOE82UllCU1NUNTdoNzRQ?=
 =?utf-8?B?MmJhWlB3dit2amcrY0YvMEhFNHlSSEpUT2VwS0s0R1IrWHl5MHZmVkR2MGtW?=
 =?utf-8?B?NUhaaDhwbVFpSXFvOW5tdjByWWtpL3RuZ0MwQy9Kd25tL3VUNkJ6VURrVmJL?=
 =?utf-8?B?NUFJU2VRQThmaGNhNS9YczhQUnZTNndrWFdQcjhHK0dHZUNGYzZ3aWVmZ0I0?=
 =?utf-8?B?TERPQm10WjNRRG1DV2x1ZEN2dG4rZGFQOUFuWElPaiswdUpsVjJqc04wY2g1?=
 =?utf-8?B?OVV3NVgxb0o1QW9LQ2JaTGhnWlBGVG1ROVp2SWd2YXJ5R0N2YVRmalVLV2NH?=
 =?utf-8?B?TzJyWlJiTUxtNVZESzFnZVRFbmdJc2ZvVVB2TkNQcHpMa28wak1xckx6Z0ti?=
 =?utf-8?B?em1telg5WHN0K1c5UnR0SkpzZmtrN0loYmsxQkMyUzZPMkVlTE9hYWlIdG4x?=
 =?utf-8?B?bkpZaTZLK1F4NEE0MHA0MGR2TDFvZUN2U3BLUjBla3Z4SjBGRFZCQnBnbjJj?=
 =?utf-8?B?OFF6YjlveWtGaUpaZzZ3Ry9xUCtBTldua1JrR2lpTU5OTUdUMHhSRWx5WW9y?=
 =?utf-8?B?QXB3dmhMZjRrSHNXUXdISTFLSldBeUFBbFN4U1BEK1VkbTVrVUNwaCtlb2tI?=
 =?utf-8?B?aEJmVGw4NUdIdGFwSjV4WjFSSmx6c09qZm01R1VMaFVqK2JjWTh5YVZwNXd2?=
 =?utf-8?B?VnZjSGJSeDJUemMyTEw2c0ZxNU5OUE1mK1BTeCtkUmZZb3VDNm90Rnhoa3Vj?=
 =?utf-8?B?YzNtZUtrU2xnNXNUTEhrM2hCdlQ3UnZSSGczS3diZ2o5YUhiOUVDMHJpRHlQ?=
 =?utf-8?B?RjczRW5DRFRkK3ZkU1l4N2JmMFh4VHpVQkJpbEp1OWt3QzhMK0JzVWMzZHpC?=
 =?utf-8?B?NnpVb3E2T0IxM1lhUUVibUNQb282RlBhZFB4cUlsMTZud0dxUEtVbkhIMzdQ?=
 =?utf-8?B?bi9kVjl4eHlDbnN2VDgrLys3UkhHUDhZbFBWeVNESGo0eVlZY0JJUEx5R3F2?=
 =?utf-8?B?TmRWaCtRNEl0d0ptbzVSaFVUY09tUDV5a2ZQcnZXRmY5cFhxbG5BM3hENjJJ?=
 =?utf-8?B?NWV6Um9teHlYczdYd0FqTGRJa1luU1F6ZFc2S2kwd1ZTcUc5QThQNkh5bFJZ?=
 =?utf-8?B?NVRkblIrZ2JnYmt2T1oxNFBKYnNhdzREVXkyNFBySjB4V3BnT0dZVDdIRTMw?=
 =?utf-8?B?STBrd0dPR0dvb3JxWmU0bFJrODJxQ3NweUZTRzV3ZXhGUVl6aHRTTjRHM3Z5?=
 =?utf-8?B?YXdZSWYzOVRDYTBreTZwWndOY0wvSEdYazdLanlYNUNyWGdNOVhUTlo1cVZ3?=
 =?utf-8?B?VWUrQVd2YTlwWTRBeHl1REplWjdDRUZQb3pRQ0l2Nmc0TU51OWFZUHgrQm9v?=
 =?utf-8?B?OG9ROVdwVWxDWlBTQ0Zrc2VuZWU4em8rUEkrbEJJWHRRa1RrWm02QUZ3WUdo?=
 =?utf-8?B?TEtkc2xIV2cxbEc1RzZPTkYwWEZJbHlaQjBWYWJlaVFRd1dqalhGb3EvL2pM?=
 =?utf-8?B?bDVCaWNTL1F4UGhOViswdjRtY1FaVW5EQlhWYzQ0Z3kvNklDWmNGNm9DMExl?=
 =?utf-8?B?d1J6aXBHRWRnVENXeXhHNTJJNFhNdkFWSllkbWI0U3VXSDJDelVJRkhFdnF4?=
 =?utf-8?B?dTZLSjhFdnhXa1JDVFlGVThKaEh4ZHZtN1pjbUFVdnloM3BUckRjZEdnMUpa?=
 =?utf-8?B?Y0s4V3FLUWNyajJjc1BmOTVtVzNLZjV5YmwrbEsyTHdtVEVXcjBtekwrTEMr?=
 =?utf-8?B?YUUvRGJxZnZtblpuTHZZM3c4dE1lY1BJREhXcU5maUtqbVJwTEF1TG1KQ1lo?=
 =?utf-8?B?bkJBYWUrbFR6Ym9yZ2ZRTFhSdEVsNWowZ3BXeS9SdFVucUNQMmgyQ2FsTjZy?=
 =?utf-8?Q?pLDGWJABr/uiqOkQ=3D?=
X-Exchange-RoutingPolicyChecked: jjmyl/c1zz042nQ8tts5Y33ZJzXPe/ZjMFsR28DON1GOscGiIT6vJe14KYCdGltVFKejbk5tN7qqXYS2281OTjGeouHruB/6TEAne3LIdQrZcxts0hFvktF+6RvzyDvi0oDsin5c9LEAJ2L5awTUxyNvtCfqgF8Zvo7dMST2L3jCFnR057ogM+dDhBDTyNfWNcNwdS1i7wbdZRYFF8biSrTexg9C4vhfolsi/4WPKHl8WVwG9VVVRE85X2cyyzSw/BKk/LPRvUu88YnfwVNCvxTl9OIpEWdVmqxiSPomDWrCV0CMJWo4s17s+Tga5ZiODhLgd+ZDozEOo4R/7nltWA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bb795e3d-75a8-44cd-2818-08df464ee5e7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:07:59.0792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6GEutHV2F2srdTZDbzLvUJGUKlepQI0Q+7jIFsRWhKiRxhalcVR0O2RF0urbjNoZnGW6DLPD1CBgbMHkWZElLyE3NM9gISkTBjgRXrjBas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7739
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sebastian,

On 2026-11-18 at 14:02:18 +0100, Sebastian Brzezinka wrote:
> _igt_reset_stolen() use via __drm_mm_interval_first(), but
> does so without holding i915->mm.stolen_lock. Every writer of this
> (i915_gem_stolen.c: drm_mm_insert_node_in_range(), drm_mm_reserve_node(),
> drm_mm_remove_node()) takes stolen_lock, so the selftest's unlocked
> reader can race.
> 
> This was observed as a NULL pointer dereference in
> __drm_mm_interval_first() during igt_reset_device_stolen():
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000010
> ...
> RIP: 0010:__drm_mm_interval_first+0x2c/0x90
> ...
> Call Trace:
>   __igt_reset_stolen+0x565/0x6a0 [i915]
>   igt_reset_device_stolen+0x1a/0x30 [i915]
>   __i915_subtests+0xb8/0x250 [i915]
> ...
> 
> Fixes: 3da3c5c1c982 ("drm/i915: Exclude low pages (128KiB) of stolen from use")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16841
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
> v1 -> v2:
> - Fix always false !__drm_mm_interval_first() check (Andi)
> - Extend stolen_lock over the poison/verify writes, not just
>   the lookup (Andi)
> - Move the lookup into stolen_page_unused() helper
> 
> v2 -> v3:
> - Cap num_pages to i915->dsm.usable_size to avoid poisoning
>   hardware reserved stolen pages (Shashiko)
> 
> v3 -> v4:
> - Only verify pages poisoned before the reset; pages in use (e.g.
>   rings) may be rewritten and freed during reset (CI)

LGTM.

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof
