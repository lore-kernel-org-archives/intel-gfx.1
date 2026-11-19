Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B41606A32A
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 14:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bAEfsE53;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=PV8+Ufth
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8D710ED34;
	Thu, 19 Nov 2026 14:47:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FCE10ED34
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 14:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795099641; x=1826635641;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PXhKwLy4WM2y1JBOqj68zgo6ghntanTeGGfhWHemazw=;
 b=bAEfsE53ZeW+susnynpWDm9umY8wrQqUasTl5EecAt6Aob5tAJYg2Q/J
 ZomoJitk5i+CTLsT1pqmNR57BG4FNZzXhp14/6XxFlB4M8mASU4C0shYH
 daQlMhZtYxc6RIumGDO6JhL+y9ajd6Ui31ODYYWaJO/HnBhFmFJ00ylKg
 wW1pRpp8gI4hhX4XgRzIh4Vpf/O2S59VeRHQQ6eyrPtdQLCxlDGjqfJQ+
 5vUwe9x+Sdkf7/pf1+mb5xPR8wL9ukvvfYC3cMocziFrOAi+waCDI3Snb
 qIdrvYM29gUXfnCwjgsjjwV0HfmtoHEY3Qw5649tn/mDdWLv/a7S+Pwhu Q==;
X-CSE-ConnectionGUID: QGLY5BerTtmhxyyRp8nRug==
X-CSE-MsgGUID: 5kvqSPnNSp6bIjLfOyG71w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3943118"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3943118"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 06:47:18 -0800
X-CSE-ConnectionGUID: PkHhaw3bTGSNzX0quljNsg==
X-CSE-MsgGUID: a0CfQ+PMRKyAppcIZWryVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10818707"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 06:47:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 06:47:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 06:47:17 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 06:47:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBBRrw45qACL+dpDSnAl/paduOs+f3+dQFxyHscfu53lURVApiJcgTqKzpZfDeNsqLmg2gHFr9fypcGXfGoQbkGRU8uIgkyQVqV7S9ked81AA8lQRBvhgJQ1qDqKMOVti/a8fn3g1E1zaoDofimUPW/BHf8h4o4ZDmrqTbp+0I1HB9Lpeg7lvkjjpxcSjjAbU0nx7L8Ulwx8W3PfD8ALsSJUbpX1uRk+dPr1MenR6d1vX/v/wkjeOm+EhN8cfyGkyLw4rUH+VChghz90X6rJhDFlvBsGS8x0kNTyzPYExSsxr2hNvbxlPpLhXN2O4r0bfmStug9qHCQr6ZdXbA02oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uw37G2J1WLvtJB2yEWprzbD9b+eLGUZGyHv/RoURe6k=;
 b=sWMYjcWvyxlsk6vyr0RKUCttWoxTi++2q51eQVmw6i8Cw/y2bMJ0Ni/ORq6nslV+RIwKzFqFshYM+bbzqi/2yTR7veqQtijqJ8+JbWdGWdJ9+TT9ZmffAww6ho7/s76xKVvpH7dHCTa+NTU5HFioVao0MJI0WwmyfHjQz9kbrFJj17lh1ZiBk/2Yk7H6OvBcb/Aygl2dj5p5Ba18iod2wnKi2U77NTA/rBuVtw2c1zm27jq4TNQlWc6eybbD4wJICrhHxmOSyF73QzXbYCR0RBIXnTAM/dFPrazxGTvYHwvRysHjbt207wbWXdPD8wrsRp3/hN9MDQbySwJEEnQeng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uw37G2J1WLvtJB2yEWprzbD9b+eLGUZGyHv/RoURe6k=;
 b=PV8+Ufth6vaK0Iaqt7vajq3qR6XlI7gkxnyU5N4QjoZbfVxgS0eIElQj31K251Y4okqwblFFcOgqyYs2H0iWiydt8aWwowEihA2HSHnO6kI9StXlRITqY/8Aesur31WA+33yu9Ab09WD0rjjHD8qMNn8rj8rkHH1fSA6A0i4pxA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by DS7PR11MB7952.namprd11.prod.outlook.com
 (2603:10b6:8:eb::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 14:47:02 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 14:47:02 +0000
Date: Thu, 19 Nov 2026 14:46:52 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: Andi Shyti <andi.shyti@kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <andi.shyti@linux.intel.com>, <chris.p.wilson@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v6 3/3] drm/i915/selftests: take error_mutex in stolen
 reset test
Message-ID: <pfxasm7vg2vtazj6ctbup2rhkswpqfaeg5qlkvecpdzdyisfuz@4appfadv45f2>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1795006734.git.sebastian.brzezinka@intel.com>
 <72a2b16b5a4cf8deffad74e8ae85a586a5d693a2.1795006734.git.sebastian.brzezinka@intel.com>
 <ocssumcrob46pblkatgoctmk5rb5gzaeeoe7ifinknfd65e3tq@ndmwuirrfepo>
 <DMZ4KGKCCK8A.2E0HP1AV6ZRQD@intel.com>
 <av7WNeQtujfjHyWn@zenone.zhora.eu>
 <DMZ510W56JPY.Y80JF2RM7J44@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DMZ510W56JPY.Y80JF2RM7J44@intel.com>
X-ClientProxiedBy: DU2PR04CA0329.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::34) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|DS7PR11MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b441e3c-3033-41b6-d70c-08df464bf926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|11063799006|261022075727099003|4143699003|261022115727099003|56012099006|261021121427099003|261026140227099003|261022105027099003|261028144727099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: b+c6qKi5wKs5t6BGborWeIYzavW77R49/+rXBfcFc84pNU37JlRoVNH1HZv2FI7r7h0N3nSqvlMUfj/EpID+OkB25ryW4mu/93uNzaw/fzBRQ30SBGGq52AGFVQZm8m7u/b5Sgfz0XxSazrEBLEmKNbiOr5pUQ4jWlVhRMdlZu48ov68PV600nalDCfJsFjzlPCd1MaFYl1mbB8Jq0VXbVZUl1+GE0nJYbVKNpatl8Les/J3u9EkCpWhkSwX8FfqNiRPaie31S1EdNJOCBYWb3PXS+R9psObzolC5N/XHJEJXUwUhaJQYaTrrTZi/xXDsALyyGDdFfZ3wjwUPm9xAWHRVjEG8c5Umj4sURMddEOqGEB6VZXGrObIeUeCENUr/oByKoGW03+P7CACyfFjkRTVldZIn1qg6SrwsOe7z5SFm9T2mwkUDgKftEXrasXNX5WacLNrgisG2M+Edr6IrZrDS2BwF4/m2tLDcYeQnhrEsXnnAkXWC3bOgdV80cozMXB/4faAl71+kUw5hKn0+zqEY5S9OczYkqoIA3RusWjvXDEMoL/uFrUHk8xo0irCGaWL8SeSGXuaa5PuhA+hLrP2U0/soJBrbM/0WWc5LU7/OHDXt5i1WLDWhAYOQqZPbRGqNW0tv/CwkinoTC0M/d8CS9CgcBELqJS+xuU9FYA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(261022075727099003)(4143699003)(261022115727099003)(56012099006)(261021121427099003)(261026140227099003)(261022105027099003)(261028144727099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjEwTHlQVG13ZU1Rc3R5OG1oWjRWZ2FBSisrMXBWamZVSC9CME5hL01EL05w?=
 =?utf-8?B?MmhxUmNUZ1M5enA0WEVxSm1qNWhxZzZJN0xFUFM4aG9vNWg5d2FCVG9jSGVu?=
 =?utf-8?B?NitySXNuN25Dbi93ellJNlVBWTlNbkVCVnRvektkdnV5QlEzMGxEYzZ3TGxM?=
 =?utf-8?B?NmtGVDBXWUl1Q2FiaTV6RWJUMWMxaHF4RWlHNHdhL0EreGt4a2pJRitMUUJu?=
 =?utf-8?B?bmsyeXVENGNBcEsyNUY0S3BZc0kwWlhnUUI1cE02YUtMRVlVVUxnWlBRb2J5?=
 =?utf-8?B?VlJOT2lXalM0bCs0VFFRblFBYWlHTmFqNlNJRHNRU2lDUEZEd3NJSHRyOVlS?=
 =?utf-8?B?OVBhZ1UwOFhVRmFDUnVWaHpUS0JEVDZmbFgxRGVmRUlLWHlWTUxkNkErRHFG?=
 =?utf-8?B?aG9tSk5RelcrV2ZOVTgrOFdUaCtmL25obi9HQ0V2Rk4yOU1QZEhpZ3dGYSt3?=
 =?utf-8?B?aC9ST2tjS2lYNnBzTHYvM3IybkVSRnRIR2l6TGN5OWtSbHhBYXBRbjBBTGgx?=
 =?utf-8?B?VHdkQ3ROYlJ4eXM1YXZhOG9GRms4Qy9JNERFdXo3Q1hhTVZ4T0pNN3k2M1Ny?=
 =?utf-8?B?V1JWellZK1dJVEkxb1VZcDYwK2c3S0JoTGQwQ3UvU0krNG1rWnBYSWVISlkv?=
 =?utf-8?B?dy9KUG55ODErOFVQZENyZGNBU3JtTFNsVWtQd2Z3YWZ4eUVuaU5tWDViRzN0?=
 =?utf-8?B?L1V4MW53Z1Myanh0TnFWM3R3K3pzdlJLRHhvUUp1Y1VYSzUvWHRUUkphZkp4?=
 =?utf-8?B?ZVdHTmVKb2poNUNEM1IzK3kvdkRrT1NGd01hdXdLYkVuczhINFl5dThvUFpU?=
 =?utf-8?B?bW0zT0xFNExDcENqandxVmRwUUVDQlM5ZFFPWjlVTEJQQ0k4NXJGZkd6NUlt?=
 =?utf-8?B?UzM1c2UzVXA1a1ZVdktrOGMzY2pTNDBMeTgzb0RJOW1iZTNpV0YreW9CbURO?=
 =?utf-8?B?WTZPNElPUzlXRkhYS1JHdkpEVHVMeUl6TkJrWkhUV21NUFM5UVdrME45S3pK?=
 =?utf-8?B?a2tPUnJ4UUlULzlsYW9USERvSUNYZVBSeXQ0b0FPUENxWHhaUGdWamdqOFlQ?=
 =?utf-8?B?VU01OS9sc1hOUSt5SWxCNnl6QWtwbDdyRGE1Ni9aT1FJU0ZKOFFlUDBaUHBN?=
 =?utf-8?B?dXBaSm80S1E0ZFBNVHE5Q3A2bitOVytGWkFrNjFKZGIvNGJQb2JuWmtidWlt?=
 =?utf-8?B?TmlzdVQ5QlVjSUNKa1hoNEwreFdqZ3hVMW9nSG5MTkpDbkRuc0xqMHc1UGhQ?=
 =?utf-8?B?aGhESFJLeWp0ZkxkWWNxTjNOMUV4dzB0akZ4a3JtbmdlalRlNlFVS0dzRHhi?=
 =?utf-8?B?NFBsK0ltOEJpcXZSL04yM1d5Qi9SODhHL3hYZFBiRWZpSnRXV09ZejUwai9L?=
 =?utf-8?B?WWdqYXZ0VFBldW1jb3JtbE9PR3FQcGxkeWtpa0dodkR6Z0k4VjZ5elVZTEdk?=
 =?utf-8?B?Y2trekFqelpTL2g1dFNUVkMrUGpjc1ZLaEJiS0dpMTE3NlROY0NwSnl1S2Y0?=
 =?utf-8?B?T3J6cE1DMmVWMzNpY1B1dmV4U1crSHc1UCtOcGZhSzhTTzkwYTV4U2x2Zlg0?=
 =?utf-8?B?RGFpQmNjSlBlVGJVN2JJZlNENGhWWFUyRnNxc0RVbW4zWlE1V0N4T0toMFJv?=
 =?utf-8?B?NnRWOVJCWThGV0dLY1lIbEZzMzlSMm1GZFh4RDBTVDVtbmhVa0ZqNkFVRUxX?=
 =?utf-8?B?QjE1MjJDa0JKSUtWa1hRNEpicU0vQUlud2xBSmNxUUtwbmppZFZ1Kzk2SWpM?=
 =?utf-8?B?a3pVTHVXTm5paFdLWWJ6dm56cmsySDZVUUFmVmh5ZFVBYzNLaVZPNTQ2cEhH?=
 =?utf-8?B?NjF1ZEp0TS94VlZzbXRQZEFSNmRtMTVHWDBWSGwxMjJTaFlWdzY0WFBZTE01?=
 =?utf-8?B?NVdlM3J1UEQwcGphcld2Um9YYmhMblkxUjNTVzA0c1FYcmNYVkdDU0M0NSth?=
 =?utf-8?B?YTRQbDdVNmU0VmRlK2gveHMyOTRRUk1HSVhxMDdVcDlhQnMxVko2VDNRY1FL?=
 =?utf-8?B?eDliVkh4ZzB1QkNrdHZCWC8vZHBUZTVSR0NvK1QxL2ZSbjBhT216TTlaQk51?=
 =?utf-8?B?VDY5WGRGdGVZdzZZK1hZOVRmeHVlRXpBM0swcUx0Wm4wY1RrZDM2dzM0SUN6?=
 =?utf-8?B?WDUyQU1JWmc3MWpIT2ZBWk1TUkFraC9IVTRmS0MxOHhZOUVVdks2U0xDaDhH?=
 =?utf-8?B?cmdoSmg5bmhnenF0UlhuSERHM2ZTbUFia1VGQ281QWFqeFMzalhpeWdLZGlK?=
 =?utf-8?B?eFpNZUF1L2JQNUg5aFNOOVFDaTh6RkNXRlROSldiRFVVWEN3cWd4UmY1b096?=
 =?utf-8?B?NVoxZDVtOFhYbm9JMS85QTloNDJtYTA0OHFESE1zWDVGNHBpMWJaaEdmaHBD?=
 =?utf-8?Q?wfULO8R72wVUsk3E=3D?=
X-Exchange-RoutingPolicyChecked: CKu7Zgsouyl+cGqSEzJDdXdyAKu3VFIhscrkGJgQm1rFQx5iqFDJ+ut8JSdwXZPhlze/+NTSm/U3HIPmI689VhxVjaQTgU+RiAjPRcKHsHLCF49nhnGcue3qbzm6JZnk5NcE+MAqjiJHZhIvmEVsvKCjbI+dTzZvTNJTO2K9VstjzsMzkX4o+ENdkXonqE2Z5bpvmKtBkSnfHAjS2dNBaXy9MJQIRnqfQpBaBm/VVhDl90RMrP+nLejFyWLdyaq2xooWub9MCxYaSjsB8ptmeobBB4E7I/UFM+Nvzc5sFYe76MaJqH3h1stLOTxuzE7U7AwbKpmaQG99lTpowUUjSg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b441e3c-3033-41b6-d70c-08df464bf926
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:47:02.7129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhDVGWX2zrbKmD8EdKc0Gsekpt920dgu3XuCfb+V+72vZUfMpjzoZjKSQZxbRcPKgoy20IP6ZO+JR6Vdqu9H/k2Obdcbo7UNnmMkQAGMZgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7952
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

Hi Sebastian,

On 2026-11-19 at 12:06:59 +0100, Sebastian Brzezinka wrote:
> On Thu Nov 19, 2026 at 11:58 AM CET, Andi Shyti wrote:
> > Hi Sebastian,
> >
> >> >> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> >> >> index 09a08a91e610..bd5876da6449 100644
> >> >> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> >> >> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> >> >> @@ -36,6 +36,8 @@ __igt_reset_stolen(struct intel_gt *gt,
> >> >>  	intel_wakeref_t wakeref;
> >> >>  	enum intel_engine_id id;
> >> >>  	struct igt_spinner spin;
> >> >> +	void (*insert_page)(struct i915_address_space *vm, dma_addr_t addr,
> >> >> +			    u64 offset, unsigned int pat_index, u32 flags);
> >> >>  	long max, count;
> >> >>  	void *tmp;
> >> >>  	u32 *crc;
> >> >> @@ -90,18 +92,19 @@ __igt_reset_stolen(struct intel_gt *gt,
> >> >>  		i915_request_add(rq);
> >> >>  	}
> >> >>  
> >> >> +	insert_page = ggtt->vm.raw_insert_page ?: ggtt->vm.insert_page;
> >> > The explanation in commit message focuses on the locking itself,
> >> > so changes to insert_page calling seem unrelated. Could you
> >> > split it into another patch or, if it is required for this part
> >> > to remain here, document it above?
> >> raw_insert_page is needed because the test now calls insert_page
> >> with error_mutex held. On Cherryview and on Broxton when VT-d is on,
> >> insert_page uses stop_machine(), which can cause a lockdep warning.
> >> 
> >> Should I send v7 with this added to the commit message, or can it be
> >> included during the merge?
> >
> > no need! Please reply to this email with the new commit message.
> >
> > Thanks,
> > Andi
> drm/i915/selftests: take error_mutex in stolen reset test
> 
> The stolen reset test reads and writes stolen pages through the ggtt
> error_capture slot, but it does not take ggtt->error_mutex. The DEBUG_GEM
> poisoning of stolen pages, which runs from the object free worker, and
> the GPU error capture use the same slot, and both take that mutex.
> 
> So the free worker can change the slot while the test is using it, and
> part of its poison ends up in the page under test. The page then looks
> partly like STACK_MAGIC and partly like POISON_INUSE/POISON_FREE, and the
> test wrongly reports that the GPU reset modified stolen memory.
> 
> Take ggtt->error_mutex, nested inside stolen_lock, around each sampling
> loop. Don't hold it across the reset, as the GuC CT worker can take it
> from the error capture path while the reset flushes that worker.
> 
> Use raw_insert_page when available, as i915_vma_coredump_create() does.
> On Cherryview and on Broxton when VT-d is on, insert_page uses
> stop_machine(), which can cause a lockdep warning when called with
> error_mutex held.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> 
> -- 
> Best regards,
> Sebastian
> 

Me likey:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Thanks for including my suggestion!

-- 
Best Regards,
Krzysztof
