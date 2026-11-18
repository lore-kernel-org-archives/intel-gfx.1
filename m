Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A9E606A32C
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2026 15:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YCY7tolI;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=iAE2UjaW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D158110FDC8;
	Wed, 18 Nov 2026 15:24:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FDB10FDC8
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Nov 2026 15:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795015483; x=1826551483;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9Kmbrkth7iNUbjC5xA6VSjerk8jbv8vj7mIgx78VnVc=;
 b=YCY7tolIMqRDETolN00tNxVhR4kA3U9J8CK9tEHVDNB1UPGFenN4xuMa
 5CdQ7FtwqWwTcWWjPV9VweYd8ruOBeLWi3s5Lr10jgcVhI4NUDCxKudoe
 FoXb7J5gByyl32A13qrEJiqxp4XJgu6ZXsHaJlI63seKem+mTHrQQ4k8r
 JyKzsufvP8OIn5PXj6NtxxpLgh6wzmGKE0i0U5/TdkWoUeIyGzDBT9KJv
 Z/YPlEBB1J18njiG66cpZSHTF8+k1lvvmi6N0KI0ftEEMD5jQ8K6Of+7w
 tFGvbF8FwYFM/xXNXmZKaat9XPflE1iJ8p3oryYx2NP2aM8XyVY/bWapt A==;
X-CSE-ConnectionGUID: DU0ivgJUQcWeat4MP/oNzg==
X-CSE-MsgGUID: BHSCFPdTS7+mM9A9DBvoVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3908288"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3908288"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:24:43 -0800
X-CSE-ConnectionGUID: q2+iVe7YRHWd1ixEPnSF0g==
X-CSE-MsgGUID: KTZFl05rSjWWLRb0jXH8dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10313559"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:24:42 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 07:24:42 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 07:24:42 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 07:24:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAX1IrTYU+beAqMufkLEjWX0jpgwvIh2vGGQbhLzdlLsMRfU2ZGvPbTU8joLsePQl2TqQPeAe9ymLfhlGeLVjEojNSnJCAoFI0hsfAAz+S+Zf7LpZ74pmx7fJGpJRYf/z9kpiuRdTl7bpvrtFRKhXzyYGuak50Fn8quZ3D2Q0ASHhOA6qiin/gb/OSLfmZbwJJnGvYHaE4KrUbdQFAZasFJ2gjE/NwTdxCEbDhgl+o5aF0Ig+JqPDeElNqsFbHS2VDpXGQlPJBhejMkF/ABdkuBue87BWvzumIWFXg9xF8Umjsvs3nWE38kwVscyZt0v797FqDXeAblNh+Jv+KnJ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBSxA3zdJ3oyjL/5PaeR5izHVfpPRzizD/+TRisLSrE=;
 b=yU3d74OrYZTskaIhytcfJndOwyalQe138Ho7GxEgvUrCrki2PXl/eVotcdtiHdSc48cWu6xVi6Uqam5M0nTJX7ECAFHekDNAuiRE+azzvD4YrjZBcH+AJegrIQ5+KxwPaezkmTiabUS4jL7BBzI9kc2UnO/mztmwHQ+6Y9RP2ZeGDVL1oWzoBo80H7GmCB0UkMNixFmKvzwaaUk6mtFOnPEc84FHWsC0/pTGxzlYSmGrY4J8SUrXSpWAtqFkLouIdvPno0k/NCV6SJh+Nx1h3WBHO6UnviGTJPfIcqv22FfbRdmMAMNdjZy4ghAGMlTBcdaipoxujPd3sdwzG6sUPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBSxA3zdJ3oyjL/5PaeR5izHVfpPRzizD/+TRisLSrE=;
 b=iAE2UjaWc3+AKrsn+H4VyUXKi5K+7spP4I71/ZVMcKx7YT5WAgyqpn8QAfrPvB53+0x2QzUGNxp8l+xxc+w7ns/Hrm4z5spwN+RcpMVVP1uTX1gx85dB1XVcheeZ/AH+dudJbS5TSrNUQAdRyOBhPVTu+uUWR+JEmHBIgdOokSs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by IA3PR11MB9398.namprd11.prod.outlook.com
 (2603:10b6:208:576::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:24:37 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:24:37 +0000
Date: Wed, 18 Nov 2026 15:24:27 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <chris.p.wilson@intel.com>, <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v6 2/3] drm/i915/selftests: Limit stolen reset test to
 usable stolen
Message-ID: <y4ax2frgjlglxnxrv5srb6ifa3s56tdj6l4k4hlw5ltzq5elyr@dr73j6dld5ue>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1795006734.git.sebastian.brzezinka@intel.com>
 <d8bba118ef131fa452570776a29606d469e151b4.1795006734.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d8bba118ef131fa452570776a29606d469e151b4.1795006734.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0285.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::23) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|IA3PR11MB9398:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c6f1dc-f37e-4cb1-68eb-08df45880e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|261009223027099003|4143699003|11063799006|56012099006|261102123227099003|261021121427099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: TWKJGdMzm5aWqlMdWodjNIWK5BvEpWiEHbBxZAVp/zOnt4Xm0uxk6XuNl8T9eCATeseSXzBZWgRq+fk3pRCn3QTm21Uo/nz51c7CvRo9Eapyqu30YdkEyynbCpy+kiS9TdYrnqo3gHzQBUKdayKot1PMKS/UkGDatnvkEqiq8EVFCzN5Txfz+rfH+zBFdbFGqw7JmhpgWEQ6fw+WjX1CXtj2Khm1lq0dq/30ZxLiaRO0NyZweBglsnE0c/XbGETlDvveHk5Lg/JBLCsKSdaeDk8C0BA46ZR2quYr/fGciEYmRBUwGEJ3LLIIxBbREtFjZr4Qvgttb2XSp09ZHXLhedbshT5GecZV3H/SzkOq+XXaqE0NH+6a6IpUPZ44RiLdTElzS7LPoGjEh9qpSa/nFpDbRcmyriCJCeLTBqADgWHNnQ2atH1IEKLtYXhl1czbmXLarznsHNryzGCBBG03sbni+LurEnvkNwwe4FG0+jYBj3SIEtME8cnRd1AF4ggFpIqVXjpqexEes9uZ1BTJYw/qzK7zjuPo+f7JDwpK3MxY7teTOWEA4ydGaHLYRyFq+F6gsb1/u2V9H8QT1uXqQYXImvajOlZd1PzdhMAsbUZvja3JNwXgRvVsP/2ov8AG5vdHYBIeuOZ/VY+XDzhGb2eYb5hYaeNIEhUqa1k/yUQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(261009223027099003)(4143699003)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261021123027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzdPZ0pmUG1xTHllL0lWYzMwUk1CdnhXMUxodXRhb09veVlPNXpxL05zaXly?=
 =?utf-8?B?WCtmeGZPMlg1MU02MkVIQWFiZlVsTVJoQzVId3RsRFZjM0pKa0puN3RpYjVu?=
 =?utf-8?B?OUg3c0RpWFhWNHY5TEZ3N0JGREZjK0FCbmxIR29tUWNHbW41TytTMGhONXBs?=
 =?utf-8?B?ZVhqU0lZeU40c09ER2c0Vi9lNERtWERidlo4bUlSN0NVWGttMnhDMkIvSFFi?=
 =?utf-8?B?VWxIZmhEaGttWXpDSFNFVXlKN1l3QVhrSUZqV2FOdXpNdmdEVmthN0YzeXJI?=
 =?utf-8?B?NkRDMy9pQWNLQWVmRU1kTTNZSlU0TjdqUTV4NHp5enlKTnFvR3JyeTBEbWI0?=
 =?utf-8?B?SDJDWmFYK1Z3bjc1VmVDazZUWHVtNW1NMjhxdlZqQnRTTkE0NkQ4ZmJZd0lU?=
 =?utf-8?B?RTNNcUxwekxoZi9WQTF2a0N3OEoyWHl4NmZ6bHdocy82TW1IY0R4OGhlRm9h?=
 =?utf-8?B?b2tYYnI1Sno5WHZqZm1jdXB5VmdKUStkMCtENE5wZVJTd3FHT1RDTWx0dHlT?=
 =?utf-8?B?MHJDSmJQa2MxKzZvc2gvRVplWC81dnAxRW9URERmU2NJclUvOHQ4UWRTb0FI?=
 =?utf-8?B?S09nYVR5b2d1elEwSHdyOFhNcmRxYXJ0ZEY2YVpCUXIra3JMK3k1NDlNUmNQ?=
 =?utf-8?B?Vm5hWDgwZ0VudVltQlFwS1huYkZXUURLTFFvVEhBem4zSmFrTk0wd3kvV3F0?=
 =?utf-8?B?enMxbmMwUGF1bHBXU2ttLzc2L3VzSHBIRU5YdWdab0lrdGZBWDVuYkNUbm14?=
 =?utf-8?B?L1BTQmY5eVVBbDVCak84Y1paZWFTWG1mZFJwS3RvUjh2clZMK3pJZFQ3NnFu?=
 =?utf-8?B?MmxLMEF4ZFBMYXRMakNsZVZKekp2U0lkWHZIS3RxL3VIdi94V1ZRRFFpVmtk?=
 =?utf-8?B?V2tIZ0dlRHhSUm1BSURUWkZKQTdwSU1hNE9DRkxNaWZ4NzUwaHhlVmQ5Mkg1?=
 =?utf-8?B?anhwMmhramh6U1N5NGNzN3p2YkoyQnRKRmlWcnIwMStxUlM1VUYvdXlpd3ov?=
 =?utf-8?B?bHhEbEJ4Y1ZWRnFpTXROaEsrZEZhNjNRUE9XLzVqc0IxRGlxMEhWaUh4Wllu?=
 =?utf-8?B?d21KbThkcDVIMWhaWFJacUw4eW5ZejFJK1BZcWU5amkzc01qS29HTDZSVWRD?=
 =?utf-8?B?ek5IUlc3ZFNhMzUxb2Jsbi8xTmpBcThoZHN3MmJhRHcxRUQrdVcrcndWdzFD?=
 =?utf-8?B?VDhpZ2svTkNXSjM3QzhsUzJrV2JEZEw1dTd2bm44TFhnNXVJZ2krcThJNXRB?=
 =?utf-8?B?WHA3WlVpTUlySkJaOEpGRm1OcDNaRGVhbjZwZXNVQVBDY0doclNDdTdaZXc1?=
 =?utf-8?B?RUxTbHlXZ1NIZlQ3U0FEMkgzU3gxdlc2T2l1alBsakI1a2Y4eE5ROWNXSllr?=
 =?utf-8?B?YXBhVW5PVmd5R2NpMjlqNVkzdStsYmNvMlBJMmhHcVo1Q1BCNy9rMHV1L0tV?=
 =?utf-8?B?M2FZWmZKdVBOTlhGejFsS0VjNS9wak9RdmRVQ3FUeCtENjBkL2p0NGF3dXNa?=
 =?utf-8?B?NmM0Y3ZGSHpja3BLL3o4TWNCYjBoT2w3b0lFYzNreHZzSFN0VkRJUElXMGZV?=
 =?utf-8?B?aklIOHBkY1U1d3BobGc5QXZmamZwREZiNmMzeHAzNU9KdGw3ZGhuNDB6YXQ3?=
 =?utf-8?B?c3BLZVRBUS96UDQ5Q0dITWJwTGpORWN3dE1WUzhiMHpZMGl2TXNMdHN5bFhT?=
 =?utf-8?B?b3NFaS9RTzdodEZGNkROS01BenlNY1VrNVR3cFM5V05JZm1CelVQMi8reTZj?=
 =?utf-8?B?b1lYVlJPbjlkRERjbUZYWWxaa29NRi9Vb2VlNXJ0YXVUNXNZUXZObTZnWWx0?=
 =?utf-8?B?YWpxTk5BSkwwTzRDMVFNR05Vb2FhczJGK05WWDd2SEpIYjkxTGloUDVidjBZ?=
 =?utf-8?B?K2pYTGUyWWZobXpEQXFOOFY3QXZMa242Z3RQNnZJVVVIL1orT2dBcWF0NGZa?=
 =?utf-8?B?bGlESFY5UVhmT1Y3Njg3VHlmMDJkOXpzNXJjNS9FTTk0Vzg0SjNqYXJNbnBY?=
 =?utf-8?B?MFRjVk5QMytjZzNUcGJMTEI0emZMSFdhU2ZiTTFUci9YUU9JM1JoellvajBY?=
 =?utf-8?B?elNndWRmelBEOENJTGthM2JPUEI0NGNJWTBtK0xGaTBnZXRUdHI1amxmWm9o?=
 =?utf-8?B?RXF3U0p5bjN2c3RiSVpxa256N2dJbERBczZZbnpMMTlxQUpJdndoK3BzVG5X?=
 =?utf-8?B?eFZDQ1ZHTEFzTWxVdUZPUEZ4eER0WHN2WFlaTS9kdHkyU2tzWHpjbEY0aGRq?=
 =?utf-8?B?YUEydG5FN0ZMUFRDU3o3SWo4aERQaC9DUGk4YnBoT2lPWkRVNU1pdDc3TGEv?=
 =?utf-8?B?dVEyV3JmeFVCaGtnY1J3R2NLNTlvZ2xMbG4ydUthZFcyakZxVGFhQWlsZnZx?=
 =?utf-8?Q?7KEbpZETl/9RKNHg=3D?=
X-Exchange-RoutingPolicyChecked: UiCgrUcZVv+CsPcbmUOUjwYcwGmBR3EPFkeWeo7VtadeKQ9ek49ghGrjAdFBMmtIxFmzJUvIM+x1Og/eK90K7thWsdJA2fZ67E5CV1yRKgm7aExYFjVYdxfCDxmbPonV+d69SGboBfnKNsupxspcs4C3kdCQVWrDF4bXa2ZOgc+I0A8SGZguo+8ZUKWpT1q1c69AESNt76O1OIOkmOaa1flYyL4fpT/gqBk9LNAt+uII3QuL9M7pRhs6joCHMW/ikIXVDBB6rvBNDP48hD0uf3xtvPOBN1X3npTevXZAxPoPKEcpGfBFgBQ7If0MlToWEOp/1we/W3imJTnPgSoapA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c6f1dc-f37e-4cb1-68eb-08df45880e65
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:24:36.9954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTKSBzpIsmcJju9XqkeUzZ8b4TBcU504lMLd5F63I8LN2DTJyIMHJ0+dobYUbSshtXz1LKmydv+N8RWa+b/QRfozC4CsAxmBUTCJQWqs4UQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9398
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

Hi,

On 2026-11-18 at 14:02:19 +0100, Sebastian Brzezinka wrote:
> The test pokes every page of the DSM, but the hardware reserved region
> is not part of mm.stolen and must not be written.
> 
> Only scan the usable part of stolen memory (dsm.usable_size) instead of
> the whole DSM.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_reset.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> index 7d4b0382fe19..09a08a91e610 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> @@ -44,7 +44,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>  	if (!drm_mm_node_allocated(&ggtt->error_capture))
>  		return 0;
>  
> -	num_pages = resource_size(dsm) >> PAGE_SHIFT;
> +	num_pages = min_t(resource_size_t, resource_size(dsm),
> +			  gt->i915->dsm.usable_size) >> PAGE_SHIFT;
>  	if (!num_pages)
>  		return 0;
>  
> -- 
> 2.56.1
> 
Looks clean:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
