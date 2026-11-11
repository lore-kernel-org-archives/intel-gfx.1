Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7C2606A31C
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Nov 2026 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gSni+BIv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A6610E1F4;
	Wed, 11 Nov 2026 09:28:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB92B10E1F4;
 Wed, 11 Nov 2026 09:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794389283; x=1825925283;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mKckZXT2ZJ/RESFYNWzFUIDv5q81guv2UYjsRh40ytE=;
 b=gSni+BIvSSBx1xlB8XCKisf2w+Zbpfhtl+YtZHE4KEPi9yWiGDeQvr16
 +5WML6dPiw9pbl7GHzPxsSN/rd35BqRVFKBVh2ZfDzsBved35fVuPbk1f
 GjqGEmpZ5lN0hebN/KS2WlrtX7L548O6NFJibX8InxyItZkuayNNLviZJ
 goOioPCjdnPBJ1zmDtpanO8H/WPBCbKk8NQLROLxLqJQ/7E06VhdLUELG
 IFkb1hMAxg3fsNo2N61wYsSZVsqB6tMsq8E7GbVDDvgFePAqKlu2P7LOf
 36GqcQhcGACASbr0y1pW4zrfUCLVX7iZq+9TSVECvI4py0aAHedV+Oe04 g==;
X-CSE-ConnectionGUID: bkGAPUO/Qc6RUsQQ/UtI7Q==
X-CSE-MsgGUID: qeKSxWnFSsCcbcAQrTY9qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3191251"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3191251"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 01:28:02 -0800
X-CSE-ConnectionGUID: 8bN9RxtxTsqcQmIoS1Elzg==
X-CSE-MsgGUID: 6s2AwOCcQpSu9cUgm/PvFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8450497"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 01:28:02 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 01:28:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 01:28:01 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 01:28:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9ITDRKHK0SKomM1hBpKjhU0QPkkEFFgwQ1VppVFu0dQ6lMGLni3wOrZcvRV8Z7w9wPrc4bdlod61S/wjvVxZJ6nxOmsYkhxNyOwlDV87DdDUAYLCQ8m/bN7/SDSkb1aycf3rdCXPoBn7flXPmUPkKufnJWaKzlQ7/QZaxhbP1ksRExgnva1O9xkV1BYzzVIjw0NAh29VvGKZWMDrxJ4CLkLhQb0jqp9AXUC5Xwix1kGDCwwr161KbX0jXSq8qGwpVK86CqPTVwqS6rBCbTW98PFsofO6dcGf5sN+ZeZp112nCDifMaqAblWIklVCP90XjIg5pYlY+a3i/TcAQRj2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AWXerLwN6iTT1kTJIN1SDExCloI9bLk1n6l980Jm00=;
 b=AWW0Zc/MmzmzakhMaR63+knkHRhzVf+3K/SF9UhjEc56hpxleqEz+1l4nJfBpxv0DWoEMpqQJIDzXsxd6SlgYdc8Xi8RJYLJc7SAvHvLk87NhhcTm5Pkfsxu4IY8y8gxHxBMv/zBcbTUsZXapnb9NgoaO7naZiWQ80wyL84HDJHYPO6uhXLX8l/5Khtrul3w09mXboT5ZBHBhJHSGBk23xCg6WOhzRX1LbEDIYeD82d/pR4Npnt157udHF825F1pAzl+S6ZolcQR/OdqnQdf9bMaAgy+4xH5ghgDVO3P5tgmZKzJHfR9BmrMHuA045rf8NYvORAvpVKT/1MaO+ZMDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS3PR11MB088214.namprd11.prod.outlook.com (2603:10b6:8:43e::10)
 by LV3PR11MB8580.namprd11.prod.outlook.com (2603:10b6:408:1ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 09:27:59 +0000
Received: from DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3]) by DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 09:27:59 +0000
Message-ID: <868a5418-8173-42fd-a6e2-40318b03cd83@intel.com>
Date: Wed, 11 Nov 2026 14:57:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/xe_gt_freq: Disable efficient freq using
 sysfs
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
References: <20261111013216.3651641-3-vinay.belgaumkar@intel.com>
 <20261111013216.3651641-4-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20261111013216.3651641-4-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To DS3PR11MB088214.namprd11.prod.outlook.com
 (2603:10b6:8:43e::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR11MB088214:EE_|LV3PR11MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: ed34d241-fa89-43a6-7c29-08df3fd6138f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|4143699003|11063799006|56012099006|261028144727099003|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261102123227099003|261026121527099003|261022075727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /mwyIYUwEyVlj9a2Ueb19YSh0mG+u2ABPQQ8aLeJX2wwUpbHAKmD30IoWu1nW+Y0eDlTcvC0FmSMnu47rFOvMbRVCacyMhznk7/JtS0fF4xJcAcusuuzOb/F2f8qrO+nC6dVJTJu9VifmqU1bH7vhTpRvxKQx7L3xZVQEuatCP8q2ypYkZJJwwUYUrmRdnchZaNsm8pz9AOWQJn5fs4IJ285LhfYHbrgGMwVg6O06ch5PQk2SCdTTDRl8Z492yo7kamEKJMs46KaXuaCSJj62ZeSInKaXGOPr1baiUBuPif/kqmXgpaCQYZLXC36daPh6KC2qLaW9/h/1OVPp3wbtjZhpmruJAxuyf0RH12hXDx1Py6KDZIF6eF6WP9JaXj3IiQ3x6SZBOSqEYCHlxMekcTJf3WW2uX8KKgdkfweShnObGjwEqmo7YYncigBlapoRCWOAxhymL/kERybi6hZMirScDg2mLHfFNptZM1jD2kxO0ixqLVtlJzWJ1qVUb1Bp4gIk9RAgDN+NFeYCEhvVcs4TX2aj2gIrvzM4W90qyESnL1z+oDjewzZgT+KYHBPtDQrxYG3TfGbt6M+FMer6Am9nMt8yiBG08Umocgrf87K04XaMbHgRRKD1+kdDs0Xl1L1BhfuIrfiA/s84xoLZrU4JuqvVauVlxELNG0WzZI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS3PR11MB088214.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(261028144727099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261102123227099003)(261026121527099003)(261022075727099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTQzby9QdkdjSnRYN2xDUGkxSmxHUUdvV08wM1pseEEwcEF1UHpPYmJaY0oy?=
 =?utf-8?B?SkNQUHFuSFpVeDFZaTZYVGJxeDh3N3dIZjJQeUVPbEtXY0IyTGlYS05WcGRG?=
 =?utf-8?B?S0xFSlJkWHpRYW0wanVaUGRBdmc4SDJjMmk3RTdjWTZlQjVlK2d2ZUhNYklN?=
 =?utf-8?B?UjNjNDE1clNGMkV6R1VKNTVtRG9MRW1May94MUphVzh1L1ppak8zcE9wUHNG?=
 =?utf-8?B?QUlKQmdpc2hSOTBVcHByYjJzSmlNZ1hjclZ0RFp2MVlScEhNcmxoaW05Qm95?=
 =?utf-8?B?c3kxWXJ3eWEraG12RTJJSCtqNGRNSmFLcC95U2dubUF6YkF3bGV6YzBzZnBV?=
 =?utf-8?B?bFB6N1FLYnFPQ1ZpT3JMZExaNDQ3UXR4TC9UVVRpSzUzTExBbDVJNDlGTGQ5?=
 =?utf-8?B?cGVUendXemJjMzlZRGs4c05OY0JFUDhIOG9kRVA2ZmNybFB5SUpKM1podDlD?=
 =?utf-8?B?N0RUbEJuUThvRFdBaG1lUlpaNEZuL1hzMHVZVDdIS3FOQ243ajkvTjNCTzZa?=
 =?utf-8?B?UmZTOFFGSXpJYzF0cDRVU2JyQW1oeWVHUHJkdXRqQ1F1OEdIREdlREpITnVI?=
 =?utf-8?B?VjRGS3JjU2xZMCtET1gzcStWNnFpb0JCRjVnQ0FPNGtSQ3ZKa0hVeEN2WVNi?=
 =?utf-8?B?NldwZkk1cmZ0UkhFbURpWXN4eW02b2dkWVZlSlhwbkVYZjNYRnF2dHJoWGp2?=
 =?utf-8?B?UTY2RGtza0xrQXBlcnhTeDJVaVVSdEsyaUZKTFR2K1lJcHl4NjFzQzlyTVZt?=
 =?utf-8?B?K0wzbUdFOEpDY3hoNXJLMnhUVE95Vm0rMEtrWUZlNkFkYk5QeDU0d0I0TG5o?=
 =?utf-8?B?cVI2R2FoWnAydHlNcHRmN0MvYVpsWEtCSUVYQm1kWVFOUmpoeFNaS1JDS01M?=
 =?utf-8?B?UERNSjNyV3g4ZEtWWEhPQXdlb0ZVZTh4WFdNM0ZtWGJwQW1vS0p6QkNwT3ND?=
 =?utf-8?B?Nk9hYmMzMkdkRFF5bFQ2YW4rT2hQRUhlazNYUW5meFM4UzBtcFQ1d1V0U1Jm?=
 =?utf-8?B?a3pkNW0zYnJ5YmxDS09raGs5OFFaaUtvcGZHb1U2TklDL01tMU5wZENqelhn?=
 =?utf-8?B?NHNYcDlhK0Vnd2gwZjR3ZjNudHpiZmhZZEJLajd1aTNCeXlUTzB1YW94YkQ2?=
 =?utf-8?B?dkZyZWFqRWRsVTJUb2VSdlVOakd3a0M1YkVrNGtlenZYR3dTbldRYzZTYkVp?=
 =?utf-8?B?NW5saEx0MVhNalRNZ0tyT09GNmt4a3o1U0lxV2JYNzFTaVZYcHkrdHdRQ3Ur?=
 =?utf-8?B?N0hBa3Z1UUdDOEYvbTVQR2R5dk1JUUNkK3JVME5pejhnR25RVjJyd2ZIZXZG?=
 =?utf-8?B?b3lKTm1nc0hmQk1RRG9qdEtHNXBmN0EwaXpaL29vdWszd2xXRlZoYmc3RmVK?=
 =?utf-8?B?Ukk5S3FOQXZTVzhNYXkrTEl4TDJ3SHpid25Gd0xGa1ZlbWo3TzFoWjRaNzBN?=
 =?utf-8?B?U3hYQmo1Q3A1SGU2czNkNXJLYXRpRUFTaEw1SzJRMjcwOFl0UEt2bTNtRmdl?=
 =?utf-8?B?dGZ0WllSVVJ1VDQ1NmpaY214LzMzOExyZmg2NURGUGNId3Nnc2xNRlFQMjJi?=
 =?utf-8?B?U3hTMWVvMUVhY0prZFpKUlpQSEEwdTR0TDFkbUZ3bjhjQkpoZXRwSHRrRjNV?=
 =?utf-8?B?cXdpRWcyMGtXVW81R1AyYVZHTUxtd3lPT0kxekVmOWw3bjVlTVRwcjFBT29Y?=
 =?utf-8?B?UjFvUDBUOXcrdlBORi9uaE1rOGtueWhlMzJ0Mkp0WXBDaXk5ZytFZ3N5Z2I3?=
 =?utf-8?B?Wm5VME1SeUVFMnozZ0dZZ3lhMVlwNi9pSWtEVGY4RVhiU01Md1dGdkptWTNM?=
 =?utf-8?B?NEZmekp4ZWpFK3hGVXprU0xZVDZnaDRTNjZUbDNVdWxNZmhqWFU5L2FlYUUv?=
 =?utf-8?B?TENSU2hsaTJWVWJjWjNhbm5VY0R4ZWhHZVBnRm9oTmxITlZ2eUhaZ1B4WUxi?=
 =?utf-8?B?VmYxNXRQZTJSVU5UTGxnTVFURWFkMGNKYlZUbDBsN3RoeGZwdEdzdWMzYnFJ?=
 =?utf-8?B?SFhOVW85dnE1NlZQcTBrRjNvUXIxM3padGZIREV6NnVFU3prUTc0elhqajZW?=
 =?utf-8?B?b3hKemFDUTRqRDlxcFlOaEFyc3VIUmIvMkUvWktjOUVtc2hoNmJ0akhjN0dE?=
 =?utf-8?B?NTlEWmlHSVZIWkVQTW8ranpkcnJ1V3NwcHZuZ1RsSkdNVjZyQXFsUmRlK1hh?=
 =?utf-8?B?MEpLeGxVcXBIM09KQy8vdVE3WDV0dmRlZ2ZPQ0dwTmZCcWs0OXdEUzkybVFr?=
 =?utf-8?B?a1NVeHdsWW9WT3BOVytScFRvU3MwSllaMWRjWW1VRERRb0pOaHFFSUlJS21U?=
 =?utf-8?B?UzZ4WE5HR2hROGRqZWhUSE04anNaaURNaGtKZ1FDMGo5dDZnenl4UT09?=
X-Exchange-RoutingPolicyChecked: phxonMAEVjkN2ByXqas6zFUe/VsoVwLtzWsU9tgUX3TXq57i4zCLi/iRgaqZFVWQLCZJtnZlTXrs0n0illqAjZ93/mEBQ+sFELcZ3tMdVD/83N7PTboH1njpQbB+2oGhz0KXtSqFBqaIgjGdUqRlOfY2iGcqWXa4CLmdYZDuOcclV3pjKelpfCzK+Z9WC7KHSBYyhZD9lN4JY/ckyezvwdtChRRL0h0l1Wa2pznkBnh2wLn+ty7SOLYEdySXMbMi2GNOSXnOTBA2HLiVcoJgTMjutSdvoUNTSMu5uVa8hZQPom3ICs0VKA32207Aax7ds8XKBYI+yLmhuSBOIckptA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed34d241-fa89-43a6-7c29-08df3fd6138f
X-MS-Exchange-CrossTenant-AuthSource: DS3PR11MB088214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:27:59.6518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ma0BMZRYG9Sa2BzOysreCxToigLM2MZMhTJ/2nT8y/fWZVfdIgPQexXU/m8yltTOLN16CK++je4I/UFexXjWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8580
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vinay,

On 11-11-2026 07:02, Vinay Belgaumkar wrote:
> With a sysfs interface available to disable RPe now, we should disable RPe
> and then proceed with the test. Before this sysfs was added, reducing min
> freq below RPe would automatically disable RPe. Now that we have a dedicated
> sysfs interface, use it. Tests that reduce GT freq below RPe should now
> directly disable RPe instead.
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   tests/intel/xe_gt_freq.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index ab1c30ea1..26e05f4d1 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -387,6 +387,7 @@ int igt_main()
>   	struct drm_xe_engine_class_instance *hwe;
>   	uint32_t *stash_min, *stash_max;
>   	int max_gt;
> +	u32 *stash_use_rpe;

Uninitialized pointer may cause issue during teardown if the node is not 
present.

Thanks,
Anirban

>   
>   	igt_fixture() {
>   		fd = drm_open_driver(DRIVER_XE);
> @@ -397,10 +398,17 @@ int igt_main()
>   		/* The defaults are the same. Stashing the gt0 is enough */
>   		stash_min = (uint32_t *) malloc(sizeof(uint32_t) * (max_gt + 1));
>   		stash_max = (uint32_t *) malloc(sizeof(uint32_t) * (max_gt + 1));
> +		if (xe_sysfs_gt_has_node(fd, 0, "freq0/use_rpe"))
> +			stash_use_rpe = (uint32_t *) malloc(sizeof(uint32_t) * (max_gt + 1));
>   
>   		xe_for_each_gt(fd, gt) {
>   			stash_min[gt] = xe_gt_get_freq(fd, gt, "min");
>   			stash_max[gt] = xe_gt_get_freq(fd, gt, "max");
> +			/* Disable use of efficient freq */
> +			if (stash_use_rpe) {
> +				stash_use_rpe[gt] = xe_gt_get_use_rpe(fd, gt);
> +				xe_gt_set_use_rpe(fd, gt, 0);
> +			}
>   		}
>   		errno = 0;
>   	}
> @@ -481,9 +489,13 @@ int igt_main()
>   		xe_for_each_gt(fd, gt) {
>   			xe_gt_set_freq(fd, gt, "max", stash_max[gt]);
>   			xe_gt_set_freq(fd, gt, "min", stash_min[gt]);
> +			if (stash_use_rpe)
> +				xe_gt_set_use_rpe(fd, gt, stash_use_rpe[gt]);
>   		}
>   		free(stash_min);
>   		free(stash_max);
> +		if (stash_use_rpe)
> +			free(stash_use_rpe);
>   		drm_close_driver(fd);
>   	}
>   }
