Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA97606A31C
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bH9eaEJV;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=j/gItNa8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1404910ED7A;
	Mon, 16 Nov 2026 09:11:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207EE10ED7A
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 09:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794820262; x=1826356262;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jU+1zXz3Dvp57F7b5qJ+T71ORAhtUViNBV+0KuPraDs=;
 b=bH9eaEJVAw0adXZK5pshrVOHXf91jiAvE1tm8GLUPIv9FN/hQmGwe6FF
 0ipvah5YJpWb7gQCtak6bnpKzvePbcLictZKFCTUPynH9sbnISO40LaVK
 BI0Yqac+dINDsw9cqrEhBFg9V5n98vm9BZed8HCSmEJhEtAov2X7OWv6b
 RhxXW3v3UOywu0+0ICxMmVnrmM/7OYKT9XAIvLGvWFhalgmGvTKRS0qP+
 Orhi5sN7nl/kgXFPmWMkjgGZO9L7RymvOk18uqN8lgKdzpMXo7QEQ21VL
 LLLV7ghgatFpGfdllXwtX5WRBfqKuapY8fD4jNLJvn3UCZ3MaGUlowcg0 A==;
X-CSE-ConnectionGUID: ZxMsI1iDRMaplGSIfznMkg==
X-CSE-MsgGUID: 20An+N8hRSS0hXiQN76Ukg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3440621"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3440621"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:11:01 -0800
X-CSE-ConnectionGUID: Rt6QSOgtTdu1OlMcE1+eWQ==
X-CSE-MsgGUID: WQ3pyeScS3STxD+qykRhVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9749085"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:11:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:11:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:11:00 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:11:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XcZ+0w7HrfaBAmYt4+jo2uHyPlGZTQ2ZpU6aeaNe4140tKpYDxdjA6gEi8aN4NhXcfEzUHuTSlcAarAN+kpb+aH7sW2dYRPAmtskgSbtBasygqJobLs2PAx7jic6/z+jqvwRuyQniwQaAYWQBYo8uXi5y+NjlDmtjZrgTpEIFr6FJUWRQxvEowqoHAheBeW4Ev2mcJIno9NM/WWTTXYKjt1aukrbd/DCNmSebGo121V4ZzJ9uCJQwJ/IjrpXFmspPDWbAk9ZNHXKz7vdUNVQZGP8aPFb7ccYOU9IOu3f8Ul0WxmQjOP74TyZhWBiFxVdOEUDKchWwO1vwO1TjUX6JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlEuZMaq2dPFKKCr8omTpKvHdDFD7LUTdJZ9b5OZGKs=;
 b=Tt0TbgqNMvuySWfDbaObVQXAHqa8TboUyj0q4dsQ8bAMv9bJFseZF2Ut0IY+iX6npUjWonz+WWKa1EhLdefddZ0pIkzvT5PK7Kn1FsLSHGcqfLKBIlitSKbw1LaYUmnEJo/yljL7si1563pSPM0CcT2xMhmD7b3GraDOfCFRkPyLaF0CnrRS0MlVH0Hlj4xu2vIsR4OLpPzNiKcl+eXtiwsbsVgVK4P5vIYkaHf4hDKo+v7GUadGPtfl7rlticgl9Vei1P6SD+NPpG+rZoWIgz5Q/vGPHDPOiVydrB1NfJmV0sHsEsUL9hxM6f2c7LJG2WW94mV8EUjRY2ArTchNig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlEuZMaq2dPFKKCr8omTpKvHdDFD7LUTdJZ9b5OZGKs=;
 b=j/gItNa8uKRWdBCjCAgJMH6qrREkH9eDppluXV9PsoDh/HX/SlZOJ5wwyQJJFE6H3pvIXYIqtW8kmLnYHIyQa8NOTj3tvWiv38dthol6uYynAqEjAB9TPxUZ/d1mFV3kkfv0F3U8V3VzUStfHSJUumem/2IHDwfOYmMaNJ6IfqI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by BL1PR11MB5320.namprd11.prod.outlook.com
 (2603:10b6:208:316::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:10:57 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:10:57 +0000
Date: Mon, 16 Nov 2026 09:10:47 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <chris.p.wilson@intel.com>, <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v5 2/2] drm/i915/selftests: take error_mutex in stolen
 reset test
Message-ID: <eulsagji3jf4v5hj2fqqqjg4c5fm6ah5l5zyxzcgotaelnvy6i@wszuzssof5j7>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20261112115907.16263-1-sebastian.brzezinka@intel.com>
 <20261112115907.16263-3-sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112115907.16263-3-sebastian.brzezinka@intel.com>
X-ClientProxiedBy: VIVP296CA0096.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35b::19) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|BL1PR11MB5320:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef9c496-c6aa-4441-0fd6-08df43c18699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|261009223027099003|11063799006|4143699003|56012099006|261102123227099003|261026121527099003|261022115727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: 8Wx5wY6N8r+OCjMiGrUbnEpZosmxkCSCYEDpdTYL6aFoXKzkLvbWr9Bj9Gjx8g9Ptsdz9vPwcwIK1jPWFj+zrWvWwtKhuQygIhu0IZG+MROznR/m77mLdQ/H10b4DW6tKkCVXObprUWMu7OpHavxKFtbs41rjLltFIwOg7cv9mixsTp4HwiXmJFvLxJgmeoQJJCgX7MGtSAtJOqUdsNfLAVdttJV5Tr3VCWE5QiKkKrvQlCbFD5/+urLQRwc8Qzir3qKuyz1zfGjmXLdIn+ZbfGOEi+/olUDBhaFv5pgblNUS4dtK3ZZXp5a1HxbtU6WXsSlLc8OEGkpz3hBlKyobp9jY2eC781BvnHnE8b8Q+Idx5P98pUbc2YXzE8GLKC7jHIFk7lT8n16mNZ94TS2wvvYzwNIZFS2U/mw7nswlqlCuCHRa26Z4DC/l0vyKN1SA02a2OMgQRLPZfWD7eOEeVe0jyBWRmNACz/OyTNCy+YKfOly/1KBh/9l9LdPCmSMAl4+6o37fGIMjJ0EnQqk1V0WVaK7OD/4ozQ/QY8CJt5BMnIFWDTqUp1iRvNVa2HA1WawS7rzg32fWQ+sJ9St3WMfHyneMal3IvftemZ7Hwaeq2iXU+4sFEIbGjRfAu03eOBLgq0kMm8BkD5akv9GMAP5sPg01ihVYDKkH+1Kp80=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(261009223027099003)(11063799006)(4143699003)(56012099006)(261102123227099003)(261026121527099003)(261022115727099003)(261021121427099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVdvckkwd3RPNDFIakV6NUVWd3NTbUlrdEhJaXV2dGEyNW1XWDVBOG05TVJV?=
 =?utf-8?B?K1ZjZVI5S1pjdmY2dHExWDZmRHRKU1NPZ3dZdHhYTzkvdFF0SFo1cWJDMkhR?=
 =?utf-8?B?aUIxTkQzWkplWHRiOFVjMEl1UitHbkFwTmp5RzdkSUxiUlRIbjBNQ3VoVldE?=
 =?utf-8?B?b1NPRGdrcUd0L1E2T21SenBOWjV5MlZkc1Q1UVlibE9iWFdCeDNZUDBwYXJu?=
 =?utf-8?B?djZwcnhiZ3lteGtKVVhhTHBBcjNBQVhGLzdIZ3FscThTVXFoUEM2SVFxZnBo?=
 =?utf-8?B?bi85MkNhd2pEUnROTitVeURVSHFTZG9BVlFnMGV5TklLUVk3cTVtcy9mWWZ2?=
 =?utf-8?B?cUp3K3lEL2tHcld6T1RGYkpmWEFzODE5WE1EVll4ZlBCQUdFTStKMndoeklv?=
 =?utf-8?B?SnV3aXdxczVaVHVzT01EUld5bU9waHMzaU1TWE5lYVoxenlOam42aVFCRU5Z?=
 =?utf-8?B?aGwvby9OZXVZQy9TQWNQRk9ydlQyWEdoeTA1dy9acmNhOEdWeHR3S3VLeUQ3?=
 =?utf-8?B?SzZGTkpHZzczKzhzS1p4N3VtSDAvdlRKS29JcTVBM2duRlBZMWU1bU9BUVpn?=
 =?utf-8?B?bFZkeE1vUjBhcGVFeEhzMy9PMXFZejFreTJiKzhsU0lRQUhDdDRGZHZZSGRl?=
 =?utf-8?B?YVE3RkhGVGR5dlhsbTlmaXdsd0twbDlpeC9SUTUvMjBEQ3oyS2xnT1p1MDZw?=
 =?utf-8?B?NmNTSzg2SlN3MnRNMk5TdXR1TnU4Wml3Zk5EOWl2VmxTUnR2dk1BeHVSZSs1?=
 =?utf-8?B?WDJkQW85N1ZnM1RGclNnTWV1VVh3RWtvYWJNYmhxMXpoa0ZFVDhVelFQWXJ6?=
 =?utf-8?B?eXBDMjNvMm96S2UrYjlvNEl1RVR5aUpZSlRCelRWMEQ2OEhtaWZyUG8rTitR?=
 =?utf-8?B?Z2V5NzJEM2NDWW1STWdqbFBPNnB4WTE0NmdDU0IxSmc5YUNCU0lNdHZpbW9w?=
 =?utf-8?B?cVBSMlR2enVXVXAvVzJUZ1FzZk5kS0NFdkxSeWNRNTN2T3pGTzdkMjRKL2tJ?=
 =?utf-8?B?WWlabERzRWR6ZlFWR3A1MFZLVzZCWU5KTnpUUlk5ZG1KRFNYZldGcjFNWHg3?=
 =?utf-8?B?MTdWay8rZVlRN0JIZVRIVksrWGIvZ05LcE5HWkYwUmNZeDJhVDZlSGtvWGxr?=
 =?utf-8?B?UHlVRVgzQzZZY1M4WmxQVUVKWFo2alJUQm91SVZaZ0xMWXB3UDNJN0xhc1lM?=
 =?utf-8?B?NTVNTmw4ajExbGU3NVBSRDYwMkF6Zk80SmFDdzNUQ3hNcElwZEN4Qk0zV2ZL?=
 =?utf-8?B?TzlHOEF5SkxWWnRWL1JDWVNCUjFNdVpRbS93TTErSGNIclBSeXFwbXdUTWRq?=
 =?utf-8?B?UU1qNUpKRndtU2cvK3NpMml1M2N6ZGtGUmNwMU9NeWgzZzVrbjQzQkNub1ZL?=
 =?utf-8?B?MHgyRE1KWmdDNWQ3Q2JLOUVOaTRQWTZ3QllRSGFOanlCS2FOcElmKzV0SDl3?=
 =?utf-8?B?cDRjcTJ4UndkbWp0cE51WSsrY2IrRjNtbVlJRkFEb2YzbENWWmc0WThDZkg2?=
 =?utf-8?B?Sm51WURjWWJtdlQ4ZFpmc3MydXZmQmxSSlg4K1NSUmFvQ2lNQ2FwV0lDMyts?=
 =?utf-8?B?V2QyL0ZZWVozajVBRVQ3eEZhdU5VdVM3eFhQdUUyT3Z1VTZmZjVKTHM5RzhL?=
 =?utf-8?B?RDNRQTE3b3huUjluS24ycUpXVmx3UTIzZ0pWOVlWSHZxYjVNd0kvZUUxUzZR?=
 =?utf-8?B?Vit5L3NnSGQ2NGxMRGl3YlNpMmY0OUZ4OUNHSTZNSVVlL3BVZkpzMjZRRjJK?=
 =?utf-8?B?M0hGNndVNEVKSHNpMUU4a3lvUmVqbTBQM1V6VGFTMkNtQnlRZ1lmWUpqNVB3?=
 =?utf-8?B?Q1NYeURkTDRqUldiWkR1NzRPY2greEVkOTM1Z0M3aEV1Nkk1NEcwcmRLVW0y?=
 =?utf-8?B?UWRFWjAxeEE0NjlGcjFuWnNYby9KcnJ4V2Q5bkFWV2MxV2cvVFh0K3BFSkxI?=
 =?utf-8?B?cUxUZ1lEb1J5Nmh3bkxZOTQ5VHlyeXhKWU5yRlcwYUVxejB1YVVRRTl2a2s4?=
 =?utf-8?B?SWJ1amhsVVdMa2hQNFZjS0Q2R3QzelZYM2poZTFCUjNSM1Vqb1RGVXRKZW52?=
 =?utf-8?B?c1RlNk5aTDJmM0ZYQ0ZaU3ZEM1VKank4WWptQVpyamQ4ZVRnQm1SQTRtSTE3?=
 =?utf-8?B?WVJmVjQ2bUNqdTBBSjRSQ3hUcDJ3T3dWQUZOTlhIVmlObzIyZFhpZFdhb002?=
 =?utf-8?B?dGVPQWZGTUhsUVpiUWlMaEF2bEl3UDlKWGlYdVNCTFRFWFNUeHdaUjZjemJw?=
 =?utf-8?B?SnJNUGVUZnorVjEwcVFVRnJBdngzOXo0dzhsRlQ2Q1pzTkdja1RocGdLeCtQ?=
 =?utf-8?B?ZTlrU0FZb05FRXdBczNobG9SOHpIQjRHYXQ0d0VsWFZvOUNHM0YwVXEvZmJG?=
 =?utf-8?Q?Xa8rl2xWWL9SWvY4=3D?=
X-Exchange-RoutingPolicyChecked: 1lg1idLLqAkYQUSduidAy7Sk0VHU094antn2j1gStHxiBoF8DIFhWIWwcryYpHxUB0PZR9TXsSeU+VIExgx3bLvGQk3fnBCA16tcbVIYDvPG2TmRpE34pot9KK/4Io/k7mLiMb7xCj/dCm75ipxOyffLcy3mJmCnqt+xu69/srgSWxHrJIL4/81IJ7zq7Dwe0JBBgBAURxcSO92aMGyOEEmskvGWII/gyt2OXRfOL2Svy2aNl2uGUniyDIGQtLLh5TKgHIo9feW8yWl+qDkXtNlzvHie85cop5r+BSS0VZBlZcTXJ1Jo9OUubku7l45XB9VTHYYOPSlERSexz0Mo5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef9c496-c6aa-4441-0fd6-08df43c18699
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:10:57.6590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zOC+lIc2GdGqSw5cfC33F0RWeKQ4sHUf7hVIEav2qoGR5/kOCKCvKwamTflOp83pUJ8FGmY7OTsJAXz18T89gC9avBGffeey+x4szCIKy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5320
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

On 2026-11-12 at 12:59:07 +0100, Sebastian Brzezinka wrote:
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
> Take ggtt->error_mutex, nested inside stolen_lock, for the whole
> sampling and reset.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_reset.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> index aae9b55ee023..f295edbb3feb 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> @@ -98,6 +98,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>  	}
>  
>  	mutex_lock(&gt->i915->mm.stolen_lock);
> +	mutex_lock(&ggtt->error_mutex);
>  
>  	for (page = 0; page < num_pages; page++) {
>  		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
> @@ -182,6 +183,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>  	mb();
>  	ggtt->vm.clear_range(&ggtt->vm, ggtt->error_capture.start, PAGE_SIZE);
>  
> +	mutex_unlock(&ggtt->error_mutex);
>  	mutex_unlock(&gt->i915->mm.stolen_lock);
>  
>  	if (count > 0) {
> -- 
> 2.55.0
> 
LGTM:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
