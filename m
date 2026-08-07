Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DA3C5AC7A
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Aug 2026 08:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188ED10F414;
	Fri,  7 Aug 2026 08:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+g9Wn2W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4846910F414
 for <intel-gfx@lists.freedesktop.org>; Fri,  7 Aug 2026 08:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786092177; x=1817628177;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H4tPaReIGG7rJAjrTvImRj/xw8MGI/T4okMylXtr+H0=;
 b=T+g9Wn2W3JpEa0P0Qs0HV8buUkdP22wZYSR36tUoZYRXFeGEwK6nF8xX
 yrwf9zhJRZN2z8+zy7hW2D3s2orx5ixn/stfsuZCs9EJaWapIRaPi4P7I
 fMV5/qwTqbnxtm5UpRidYGzYqz57VA/TyOhPfz0mL8SskwRBPWJ4SeOYt
 P+hKDwcTBrWQMNJU1wXdemIwGngXg0DsnfIQRBFr7ylahqgxPJAQ4MArQ
 ESI/0LneKLderSAAMtyAtpQyeCcySXhrwifrwZp3GE6nFV44RRYmARchQ
 xr3/lagMh95py/2DROzG0RoDcpKXuzH2469ah+dzSn1K6YTP9YJprYhi1 g==;
X-CSE-ConnectionGUID: wPd9sZh4T2WgqEALolcHJA==
X-CSE-MsgGUID: 8qNMOgyRT0iE0MoAzWFmLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86725171"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86725171"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 01:42:57 -0700
X-CSE-ConnectionGUID: R4FUuHdxT8eqrlfqqrhtpQ==
X-CSE-MsgGUID: aBoL5M2ASo+kRwp/9G+pqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="292231591"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 01:42:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 01:42:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 01:42:56 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 01:42:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYGxOHkCNWat1ucqfbhV1j+wpvhOzBcDL2f7elMDo39CcrOB0cq5gR51oEE8Ma8O3ULW9H/f3l+0pJNDJ0CM/3MYT/jiSo2D6y0Ik0ai3IP3ELDXC/S4zPgX6415e0kGJ6zgDi9oQwWgoJ/bOeOUwjeDEo3xYZk1kdWjTLOaZGVEueKUndhiTSVQLvbWJp1JdCxILsci/1cdjbXhyN56rr3x+LmGIqFXRjLSV2VtIN8ZAOPPXQ8LN72Rr9SbTR+OUkhLJOl+eSaYTNCb38UBC9Hv26MyxzkigWA6jqKSFTl0f40TOqmddUH0DRQpuUsbVWFtGG6GHec0LYwTWizvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WLXtVyvmfU/TSD70xEorpUCcU0XuF0AtNAz2GbjwWo=;
 b=m1CtRFJFhBbnX9vFqoENPjxe1ahnaQNnJWe7n2k//NPeY6jE7LAn+69R6NFmc39p267lA2t+3wInKm1U+OSq6pBHPtg3XxfZ9NseGzbumz5tD++Dmvu1lc9C7UWjR9VDtQj9tHdq7n5Gl8z3LInK0Alo7vAyaJr3Y6K7aipFbm2PcXOLvP/CYhcW44p6IVnXYlSdjrBZapYgPDqyYo9wPPJGQo7BqJrCrDWV4zd7CpI5++5fQaWZpdDkhFvZmcO4Ie6YrKCeFpGErtdrcqsYyI5DolB0JHkWOfpItYrcS+RLELvJp7KCLmnYqbRBMS89hL/Oc3ybu8iAOniaW+UjDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SJ0PR11MB5919.namprd11.prod.outlook.com (2603:10b6:a03:42d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 08:42:52 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 08:42:51 +0000
Message-ID: <dba13bb0-20d3-4aba-ad70-9cc3266ff165@intel.com>
Date: Fri, 7 Aug 2026 14:12:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Dell Latitude 7390 Intel UHD 620 screen becomes
 extremely dim after kernel 7.x upgrade
To: <nomorsukses@gmail.com>, <regressions@lists.linux.dev>
CC: <intel-gfx@lists.freedesktop.org>
References: <CABHf4aS9Lh6Q-7MykVgvEpsWW08GTo+Md_9U9nn5a=V2X6kTEw@mail.gmail.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <CABHf4aS9Lh6Q-7MykVgvEpsWW08GTo+Md_9U9nn5a=V2X6kTEw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0043.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::6) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SJ0PR11MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: db283ed5-5f7b-4fef-a7a9-08def45fddc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|56012099006|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: SylTosXyquIm5rF0riurWRv5YSWrcFRUUoaLoyJeyToJwZkR0hzQSVGjSwybAAEUF4FfoeXnnxjvAswBChYX4220Kn8yD6pyzGBez5qnJGTDhtMv2rZbUaXVVibWJjYycWRSDKZg/6Ra7epzSHWZ+FcWaaQRb8sWmpJA0m4WNp7M5c0OdnECSRIZ9mKjv8rYV2/pzPPwwywf2fBGqBN0ruW+C/vfmf3F6I6ffZzIcM5LcGKIAhwLNkIBAmsBmX3SRJODifU0Zqv0tPlKcMhjpanyDUvaZYlvOcGpxloARGgw/CUuNhpWWiMaZO2Ysvl5wxN3c/gmepCEQyUAhQjKDrHJUQ9SsISCBJsxrPBU2whgH2PTlpkDpY0CUnI+p+343dG9X3E0+wcNkp12RUWz3tUBhuNiG+dwDjN0ZM9Mu9sLcrukIqalILkMRhVdtOEBJQ7aRQXd74mBzLBWzfz69SI+XtZEoqbaU/5BdZxsZJSKRcOgLaqyRK11yRz9s/bvfb6ixlT+BLyksPrPl4xd6/hNKIepJLRf2jX8CKgfPU9pjcvvPBY0VAVJvPm67yiyskftVd4V/k5KXd1qhdJlja9GnS2sZOxht5bEmJH9UjXbjtYfaxooWXKbDruOrPht
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzBzNksrRXh1QWdqTU5kWmE4dldpSEg5cFdGZHhWY3oyT2l5VytxUE9QSEo5?=
 =?utf-8?B?MGRORFozV3VrLy8rRnNjU09mWDhuMTNXOHE5T2VBT1p0MURJNUVjVHk3bE0r?=
 =?utf-8?B?UnpyazNPMVkvZmQ0U1FWTDBUNktyTzB1OVJMUVo4OWZqeTBMYWdZTi94Vm9G?=
 =?utf-8?B?OUZ3OGtDMjBkS2VMYjMzYmdWZ0k2NnpVV2JFdW43UnNTcW9ia1RJSkZ4TUtL?=
 =?utf-8?B?QkNQMk1OU2RQaWJ3ejlhUlJtbmcxNnVIM3hucFRtWHQwMmhldDlrYUlVeG9h?=
 =?utf-8?B?U2ZEMEFJdjFienhsNmFuMmcxdEExMXpmVVFkOC8vRE5aZ0lRbjZZbXAvWTQ2?=
 =?utf-8?B?RG9Sa01meGxVd1Y3engyTkFaRDhsWnF5QkdHZ24wdmc3bE14U29HYWp1Um9X?=
 =?utf-8?B?RmZGaDZZcHBTR2tJSVhwRFBMWGRablM0akpqSlZBTWJzMVlZcDBLd0VJaHYw?=
 =?utf-8?B?NXQ3cHFUdVZTRENRc290UjZNcXVwYmp4MmNLc0xBWU5BdkRCZjBFSFkzMkJy?=
 =?utf-8?B?azdXZ240TXdWMWtxK08vT1JJNFl3V2FaZEdoaXhyMnEvdUIya2R3RFRwR0hR?=
 =?utf-8?B?aTdRY0trTlBEV1ZVWG9UcS9vYnVyOVJHUlJKZzloQzQ2d3hYekk0SExqYktP?=
 =?utf-8?B?d3JtbXpwY2plUzFXbWh2anVvNUJtYmxNa0Z0Y0JkVkhiYkVPTGQwemFvc2Zp?=
 =?utf-8?B?MzJmUlFuSWxwN0VNbmhFNStnODArZnRrM1U5SWdXMzlLVlNxZ3dubi9ZRnVC?=
 =?utf-8?B?bVl4dVNHN2RSOW03UWwwamUxakdralE1amNHTGxiTFowb2RqcjErakxMN2xU?=
 =?utf-8?B?NGhmbkNJRHlUamhCeE5ISHlabVBUekRuQ2p4czV1ODI1SlpFSXBGUTVZYzhn?=
 =?utf-8?B?eDJWTU9reklONVVPM3FpOGt4VS8yMzVETzdBOHg0NVdyQmI3V0FJM2RqY09t?=
 =?utf-8?B?WDFTR1Roc0dTT2NvN0hhajM5NjdBR2JadGtNUWdMb1M0VnZLY1pScmZ4OURW?=
 =?utf-8?B?SmFXSlZrbXFHNFptWlJzSWpaTkpiZUl1MUgzUmpQUFVqandFVjNBaFFkVXBa?=
 =?utf-8?B?bXJqdEJOc0NxWHFuQVh4MUpScjE5N1lTMFN3SU1nWmZPd2RQNEpuYVpjamVi?=
 =?utf-8?B?NHBxMTMyNzhObkQ0Qk5SWEtaL0oraHNqNGNhNkFWbE81SHBMd1o5NmtVYVZr?=
 =?utf-8?B?L0x6anBRSXA0cHJEWGNETlFqMnl3aThwZVFSUm9zSy96YUs5Q3JlcGFiUEhz?=
 =?utf-8?B?cE5EWlM5enRuWEhpWk9JSGNRUEpwcTNNaGdKWGluUVNyeXRIRGlRUDdaYnhu?=
 =?utf-8?B?Y3AydThCeVV3UzJ4Qms3K3kxcmpYVHMzMkEycVE5MnpMYTFIWmEra21ENU9m?=
 =?utf-8?B?amI0Q1JOS1dqWUdXU0JsTHZXZDROdXVvN2IvekltdUlQV0haK2J5UXZySkpN?=
 =?utf-8?B?VmhNTFI3Sm0rUmZXT1RWcGFib2RZNUdYZ0l2OFZpZkNXbnhYMm5XMC9vZlBp?=
 =?utf-8?B?Y3drSnRsSjFNV25tWUQ1R3FIQmVrQUI5aFBaSDArK3ZtbGtQU21XaHh0VG9v?=
 =?utf-8?B?SHg0WENqZ1NFWEtoTFRhV1NzNjZnRThYWlF2UFk4bjlEWmE1ckJoaERORzZY?=
 =?utf-8?B?bm9PdXdnY01XWHd1dmVtdVRubjZQVGN2MXBpWUExdWxWRkRGWFZ6YU83Uy9T?=
 =?utf-8?B?Wlo0ZXdWS2dvLzZIRmVkaGp0NTU5Yk8rQlozYzB6TnUvVkFDWW14b0QxYVFo?=
 =?utf-8?B?SUY2Z3BvNVgrWGdXNnQrKzNjbE5kQy9MYUY5VjdEK1BRYXBnUVYyQkNFK3BL?=
 =?utf-8?B?SmhZZVVlN2NzQlRmTzFiamUwS1ZIQWE5T2diK2hKS1BhZE5GR2hpb3p0d3U4?=
 =?utf-8?B?U0V1VGdWa2x1MmR6RFM1dzd1TnlYQWR2S3VTUEQ1RWlTcnpVc1Yyam1vK1lY?=
 =?utf-8?B?aHRNNGxGNlhSL05EWVZmc1YvNzdyVU9Fa2FWT2hURnJ6T3c0UnlucEdQNTZT?=
 =?utf-8?B?ZTB4alRrNnR3N2Y0dWhBU1ZMdlRkZm5jSDJzeC9tRmNmYi94bnNMT1FJbWtj?=
 =?utf-8?B?S3JkRDdjY0kvUXBFQ080djMwZjFEa0EyQTZGQkVMa2dIbVB1dzVFWEhyTkRH?=
 =?utf-8?B?N3k1YXJGYUxERkpuZjFZSisvOFdDclhMZHovY01DWGNyTkwza0tFbGtuR0NV?=
 =?utf-8?B?K3ZOVVNOcHMwVXRIK2NJZ3llcmV0MHI0Nk5UYlZSM2JvZDJNeCtQMjh4Wk1R?=
 =?utf-8?B?VE5JTUlNa2VFbVZldlRjcXNGekhRRzg0cnB0eUxvZDNsRTVidWFVSVltQnVa?=
 =?utf-8?B?b0F1WGJaMTdpZk5oR1R3M2lnb09MZE9Va3NpVUtpWU1jZWtrSTRjQWxtTmk3?=
 =?utf-8?Q?EqKXYxTEnU/49o3Q=3D?=
X-Exchange-RoutingPolicyChecked: e9VLyRR4SSoIs8w801e84oQE833rWzxT6SxTIYV/LY6XujypmMxBypWPQrLM70IzqVEivLIKv+DHMJC4f5WrjEIvVbe3CgOQ3G7nRnidN6yZVOREMXTPKRLo/xsWGnPrIMb508EFP5EoNlBRr4vjsX7pfJ8wBQQYQXuB62E+mQTriJPJGl2e1Ynuh37E1gTVX8+X2Rsvu9e8cAcNK2Hn+ICdLQW+UlijYktFTj7rVXlsMPfOGnqtMrY2h2dM3g8zenJeHentLl3B4wSWqQsFdbcNQrqLD7sVjBw173U0UNK6piKkL8Lch+G2hZWnsDk9YHuxZ5CFk5MqnR0IKdPfnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: db283ed5-5f7b-4fef-a7a9-08def45fddc8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 08:42:51.6997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQKt2TwFd9I1/gtS+gtXAnehfGuY7OqU5cG9Zl4Q/K6R6t0JAAlBWwb9Nv9u9UjMGuq/5XZ74k1hI5FgYdvQs2aQ3P2o7hzwf9kPVatYlk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5919
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

Hello,

On 8/6/2026 5:13 PM, nomorsukses@gmail.com wrote:
> Hello Linux kernel and Intel graphics developers,
> 
> I would like to report a kernel regression affecting the internal 
> display brightness on my Dell Latitude 7390 laptop.
> 
> After upgrading from Linux kernel 6.14.x to Linux kernel 7.x, the 
> internal laptop display becomes extremely dim immediately after boot.
> 
> The system continues to run normally, but the brightness level becomes 
> almost unusable.
> 
> Booting back into Linux kernel 6.14.x restores normal display brightness.
> 

Thank you for the report.

Can you please file a bug using [1]?

==
Chaitanya

[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

> Hardware information:
> 
> Laptop:
> Dell Latitude 7390
> 
> CPU:
> Intel Core i7-8650U
> 
> GPU:
> Intel UHD Graphics 620
> PCI ID: 8086:5917
> 
> Graphics driver:
> i915
> 
> Display:
> Chi Mei Innolux 1920x1080 eDP panel
> 
> BIOS:
> Dell version 1.44.0
> 
> Operating systems tested:
> 
>   *
> 
>     Ubuntu 24.04.4 LTS
> 
>   *
> 
>     Linux Mint 22.2 (based on Ubuntu 24.04)
> 
> The same issue happens on both distributions.
> 
> Working kernel:
> 6.14.0-29-generic
> 
> Problematic kernel:
> 7.x
> 
> Steps to reproduce:
> 
>  1.
> 
>     Install Ubuntu 24.04 or Linux Mint 22.2.
> 
>  2.
> 
>     Update the system to kernel 7.x.
> 
>  3.
> 
>     Reboot.
> 
>  4.
> 
>     The internal display becomes extremely dim.
> 
>  5.
> 
>     Boot kernel 6.14.x.
> 
>  6.
> 
>     Display brightness works normally again.
> 
> Additional information:
> 
>   *
> 
>     Secure Boot is disabled.
> 
>   *
> 
>     The issue is reproducible.
> 
>   *
> 
>     The system remains usable except for the display brightness problem.
> 
>   *
> 
>     The regression appears between kernel 6.14 and kernel 7.x.
> 
>   *
> 
>     The graphics driver in use is Intel i915.
> 
> This may be related to Intel i915 backlight handling or eDP panel 
> initialization.
> 
> I can provide dmesg logs and additional debugging information if required.
> 
> Thank you for your help.
> 
> Best regards,
> PoL
> 

