Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC64C4452B
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Jul 2026 08:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F6210E730;
	Tue, 21 Jul 2026 08:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eW1WFBCo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B6410E72C;
 Tue, 21 Jul 2026 08:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784622239; x=1816158239;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CUbrPT/Omgkdd56l1IYW0AnJyjsuvOS9F7eMhSHOE8g=;
 b=eW1WFBCoyu2npFM4CofLdykH59TImxUz9qrGkRCpBcXXvq6dReOtmkIW
 eI8O9WYNttojJDLs/RlKbddUwC4yiHZR675iP+wwY8wq2PwIAScFkw0cx
 JJVtNhpfPDMXPguEBycG451dmRl7eW8kawRirsk6nKQGQkrjoU+cj1OYy
 ZR8+PDRRSYjbQZyRs3yQr739KXIgKOI+U7eFds56EFvRMAaU3/6EoiKzB
 Z+SfTkUNEpWCSvj9IrwEAkYYA0nRNKIwhv3cFMELQKbLnMneD1KsWc1Hk
 pfysfEZUZQSQfpUgICGZxUPtmQOXV13yY9Lr/VQf1WqWj5Hf0yjU8LTtx g==;
X-CSE-ConnectionGUID: qUzsL6X+SseI/OtWagP8Lw==
X-CSE-MsgGUID: lq1XMOIdSpGmXzsQB3Tjag==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="89035719"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="89035719"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 01:23:59 -0700
X-CSE-ConnectionGUID: dRwbg1xtTCi5GQNh35SUtw==
X-CSE-MsgGUID: bt9wQp00STeDzyncdpoYFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="253773460"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 01:23:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 01:23:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 01:23:57 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 01:23:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttZpUM9zqqtHNO9xQYAyUFr6lbsBnwgoydm+CJsXHp72h/itkH3eVUj/baZIdWb6cV0g4U+beL3V8+ZviYV1ggggukSZ/Ls4Ecwt2EkLldkbiCpaC9Pm3Wk1fhpu10tGVHZdTNyxKUuxihbrLCJmToeh9Kx1Re9f3bngh47U/4cnXqw+6e3Mt81yjTX82V3LPDU04Ev04KZNdbJX8SogLf6Vqu5Nd0PzW4lrzRfMJwc/U/pqXY76kvDtIUaKJkVvR1uDBJJi93sSgsQGb6vYTrDKSjz1UKjhLKsBFsb0RIAJznpRwkkc10uK6W2n3GcVI4i3j+OSH+hgSGGwygjJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7je1pC6KWcJLj1seICQYHo0eWSzCOJGkR28LKx7wJc=;
 b=i8NyZInbRcoaPS2xN5+FHEBgQNxVuRFD+ANT3I87omPfaUo5bmhlHjP8593pTY5WEfghreWpqbcejJIUq8PJIaTlyT9qO87mLp0Ou1XAVnZbJCGEh23l0BuvUKaEi3S26pefDtU2PRSW/7kkU4z2KtD5Kk94uyrHxA1vPcPqH6P1Xsrgil1NHXjqpbvYyHQVtAGObAqGCo0rR/ko+OqPO/Le57nOXFHIty9v6MkdPYqKDvvLrn59vjs9Fa00zJ63VRWbKmNqZ4+edKewwnt3fNTFFPJPoCCjnUCJYgUqbd6XDs13EBsJuZMcCSyWhuUwulmGYdcRcexQy3I1Iv8KJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by CO1PR11MB5092.namprd11.prod.outlook.com (2603:10b6:303:6e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 08:23:53 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Tue, 21 Jul 2026
 08:23:53 +0000
Date: Tue, 21 Jul 2026 08:23:42 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/igt_store: Fix unexpected reuse of allocated
 offset
Message-ID: <ii4oumjoy7f2qrsktxnk2dqer4una2odgqp7wunmbqwrjqz2r7@ookvukxperbh>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260720055919.1945692-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720055919.1945692-2-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: TL2P290CA0005.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::15) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|CO1PR11MB5092:EE_
X-MS-Office365-Filtering-Correlation-Id: ff29dd05-8f04-4b31-840e-08dee701669c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|3023799007|56012099006|11063799006|10067099003|22082099003|18002099003|27256017;
X-Microsoft-Antispam-Message-Info: T0/YAOOu6LtfxCxErm3X4fyKqyykOQSARUHQS3cK+xZ4CJZUxlLcqVQ8zlXB279VTW4X2cxup1IC9UI50REn9oKTCaTByecY+Fch19Hhm75bHxd3oAfGrXnMcS6SXMsuPDew7OE7z5XPkPRZB9tFI8YJ0usnDIRXIFVMHKjvE3OrAIwJ2FJigs5O+XLd7OcFZcqzl3aSOvte/iEhNUfQq5usZncvXmR+R7StxqQZ3oIcaYkGAj8BxfXuxdhP9GAVwL4AAMcwsTzSjP40V8j6AGPPQanW+cxIvjPgykxn3UYYy2m4N93HPWMrGzCqCXyN+CIcEzUq4gPimaYKGNMGM4xYLG1mQuli+3WOB0RllZN9Lwm4Rqd8jVU601jvMEX+xJFxz5Cf1JEcFVqPZxlT19lARfyvYfX2QIx7SSMTzc9/aSKy+PEIDhc7wFXbc/6iBNEZ7Nr+KEDBqFHR61SNeQJ0ZdzdKrEO8LRMPUFLup+H21/EQqCXZOZC7OlTGCGhmVBNURWf1qjcSSZkyWf8twEGyZgzaBdFKNaJVFhB9WNl+Hr/mccWATgKEOZAeOm0o3MK0eIPiJ5NGWqolO9X2l4/uQM/k794Ebg39nW6hjskqSBcOMEbqkFXh88QQXRsVZiq4ch30lk/XxdZ2/4nIfpL4dCnKDHssoa/7RnsqMw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(3023799007)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmczRzloZCsvMkE3NnFSV0RlMlpkQ081d0ZMZzVoNml3ZlhEelB4RUhLZmE2?=
 =?utf-8?B?c0gzSWRrakxCSGVQZy9zOS9pU0JaOVJGU1dCbk5ETWJkNkg0c3NEaldYL0p3?=
 =?utf-8?B?U3VWc0s5MS9iTW1yQU5PT0t1SmdEUHBmenVkWllycU1PVlhmV2U2VVdoUWdm?=
 =?utf-8?B?TGJwMEdKeHFGekl4S1VnMG1KV09rRkI2OHhqOVcwYUlDajcvTW43MkxJRkM3?=
 =?utf-8?B?UTV5VXJwNFZJVnZQU2NYNEZUWHdDMUVDNVpjeStPaW9YSTNpWGdmZzEvcmZi?=
 =?utf-8?B?UStHTHYvWEFjRHVackY5ckc1WlNFQm8vYU1aUGhLMXRnbjdSN0N6UWlOeEtq?=
 =?utf-8?B?YmdMb2VsakxTa2xuRFlrOWlHSzgzeWd1M0c4R0QrQUloTEExcWdIV1F6N2c3?=
 =?utf-8?B?Yjh0UWloejRIZ3FlYWJhZmR6Um5wdzVwa09NUkE2NTBpZXAyWFJseVBkejBB?=
 =?utf-8?B?N3NiQ0QwUy9STU5wMkpna1dXVnJnQ0xuWm9uQUpiUmt6blNVSXZHcmZxY21z?=
 =?utf-8?B?S053MUV2aFFPSlp1dXd5R25NVXpjcWlPdDZid1M1VGxYS2ExNzM5aEF6MzQv?=
 =?utf-8?B?a2Z4cERGZ0RxZTZFbjd1UGw1UXZmL0ZPM0hzUkU4dFBjcnJ5SHJSTkR4TmxG?=
 =?utf-8?B?Q1U2M21ianBNUVE5MWxBWFdab0RzZkFZcDhFd1B4enJ1UjgrNlFDTkV6UEhv?=
 =?utf-8?B?NmZPbnQzdllUa2RKalpBeVFZaDZ0YXNkdGprc1k2MVF1UFZTTUxPbzhvVHJ1?=
 =?utf-8?B?WEdNaDE5RkM0dXhpbm1hOC9ycFYwK09jYWNac2VIc2JzanFNa28vVFdtRlI4?=
 =?utf-8?B?OFoyT05XVzhxVTNSSDJ3SjNLSEhZWWNBUi9ydFRyQnE2aTg4UmE4NDNVUnZK?=
 =?utf-8?B?NlVIRHphL3NDbkF4aE40dEpncStBWGdYYzNpNG1hOVRUVWo3THpiYmNEcXpz?=
 =?utf-8?B?dHRCTkdrdDVxcDlzbS9mOTZkaGtpZnFlZ2djUkZOMVlTOVUwa05RaENiSTNF?=
 =?utf-8?B?VDNSMmkzem4xQlRzcTFYL0d1akQxcWd1TWFhSGhZRzJ1TjNvVm9EdEhReW9u?=
 =?utf-8?B?c0NxQkxGNVhrdUZQSGlLdXFRYWNSbFcwMHIrNkV0MWhlSWZUZW9ubTVoZm15?=
 =?utf-8?B?VHRXZVFyUFVDUUR3TFFtTkFtckh0amxnaGNYajNxdnZaa1dTb1pDYUJobk1s?=
 =?utf-8?B?SGErUEFjWUtMWmg5NnFZUjJMSHJBZUdPS0VYejNyZE12cHVVN0JabXYxeGJE?=
 =?utf-8?B?b0MvL203dk1EMGFJdVpSWWFSYmI0N2pUYWpIMWVpVXRiTjVJMnBJcjlEZk1Q?=
 =?utf-8?B?dWJNUmZqaFhBeHc1Q21jdGVOT3N6aDN2WDZGa0cxQStwd1U4aTIyUXFKM1p6?=
 =?utf-8?B?ZjFNbnI3R1N5cGhQQjRDb0JrTFFzZnF6OHZhemlXdk5jR0JaVlU4cnFhNjAv?=
 =?utf-8?B?YkZLYW5TQkJQaEJiVytnNmhTa3k5K1ltRi85OGt5OHdHdUEzUTdOMmlKYkVk?=
 =?utf-8?B?ai9VRU5kUG82Z0oremhhUmZ0bGFqRktRVzRyaHBKRXY2TWJQa1JxWmFNVTBR?=
 =?utf-8?B?aFp1WG41R1ZjS3B5MmltdFRiNkttY2pMODEzQVhuRHFwQkdTQ1hVemQ1R3Ay?=
 =?utf-8?B?NEpLZHBJazZKRm85d3BKRG8yUFBEUWpsb1hRNWhKc3lMNVVoNVlQNy9VT0lq?=
 =?utf-8?B?SHd4N01wOWhIcjAxSkk5ZHRBUElsd0pQQVNUMllvK1dIWlNXNXJkOWlUQXBn?=
 =?utf-8?B?aThMYnlyOGtsWktUZitZclU0MXk5V1hoN1IwYzhORThMR1l3NlZTejVIWWwv?=
 =?utf-8?B?Qk1aaWFSSEE3WWNZVE5CLzdhOWZmYS9YQ0ZyMC82UFo1a0RDS1p0OE9XV0hC?=
 =?utf-8?B?QVoyMGd1WjIycFdxdC81djIwYTBCTUxibXRRbTMvaU8xeTdQcTgrWTltNHVF?=
 =?utf-8?B?dTYzZ3VMNGk0YVR5QngvTWRuc3cwbzJlclVoMkEyd2o2WUNmNmFoZW5hbVd6?=
 =?utf-8?B?NU41TUJselJ0QkFIWTNJbVNvSCtJYUVvOUNrSzhKVkh6MElHRGhXdXNQZ243?=
 =?utf-8?B?WWVpbUhSV0FQcVBXMHFwZE0wallRTUdNcUk0d29TYjF6ZVU1OWxtbFp2bnVO?=
 =?utf-8?B?VnhmbzBEUElyYnU4NHlteFFNRXlLdTJ3ZEdLaWJlc3cxZVBiTjBoZ3F2Q0dZ?=
 =?utf-8?B?dVo3YlVicnR5c044eCtZNlhodG1TQm9vWm9ra2RFMDNjT3VNRnlzWWorL2N1?=
 =?utf-8?B?ZHB5SEdFdDE0bW9XZmQyQXZkaDRQbis2Szd2SGlPL2tIOXdlVWwyVkF6T2cv?=
 =?utf-8?B?ZDZpTVJoWXBiZ3pKZVp3bDhDQjNUVWE4cGFuOGNCUnVLQW5MQmZDSFJlZDhK?=
 =?utf-8?Q?AOx7ZxR2qw/IPRt8=3D?=
X-Exchange-RoutingPolicyChecked: sq/eyCeWEqmLA9bVwxZPn+LoDw7ygDLy4q1vjt+1wIeZb1c8GuKBUpEkcKY7ZNWilU+qDb51oJ9jw20hU3ozjmG/d8lMssg9e8DKHKzUdLXW/8gBtKv1OwHlv/vEf2Mjc/67RI4In3X/O8NysrmTaF5Zle45u5wZo0j9e5X686xM7qJPLWL9GRvvgw+2bEzVlCFo/ON6qbCXg7hED0dN7iRb1emKUmdz5OsVivoqyNyZSFvaLcYKyUu3Jr0Sv6PkpIyGPbbhIp8eYsxk86VF0SIlPuioKYq3OK25JfzHP/3nzYnT6iHvmOPmLjkWyBukl/vNtgBECzHknQ2sNgN1lQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ff29dd05-8f04-4b31-840e-08dee701669c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 08:23:53.7046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBLHOHlT2cXwYV4MZ3rJibUoOISoi4hlboPN04fmqfDVcBDe+h2WbWGUslxgFigHK2Mcpu7S4brTRhocChQOsY/15C9Zj7nX18rSyfLsGW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5092
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

On 2026-07-20 at 07:59:10 +0200, Janusz Krzysztofik wrote:
> CI was extremely sporadically (once a month or two) reporting an issue
> with unexpected premature completion of a spin supposed to be still
> running.  It occurred possible to reproduce the issue in a few hours by
> running the test in a loop on one of affected platforms.
> 
> Having a closer look at the logs, it became clear that the test was
> blocking somewhere before the check for the spin still busy,
"check for the spin still busy" -> I feel like you are missing a
verb in here, like "was still busy".

Apart from that, LGTM:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

> and the spin
> was meanwhile aborted by a request watchdog timer after a default period
> of 20s of its activity.
> 
> Deeper debugging revealed that one of the test subprocesses was trying to
> evict a VMA and was waiting infinitely for its idleness.  Since the scope
> of affected platforms was limited to Gen12, where no kernel side
> relocations are used, Chris suggested that must have been a userspace bug,
> i.e., the test was apparently providing conflicting object offsets.
> Further analysis also shown that the main process of the test was looping
> infinitely around a page fault that occurred by reading another, mmapped
> GEM object shared with subprocesses, apparently locked by the subprocess
> waiting on eviction.
> 
> Based on all those observations, Zbigniew noticed incorrect use of
> intel_allocator library, leading to unexpected reuse of a just closed
> object handle, and its already allocated offset, by another child process
> before the allocator drops a link of the offset to the handle.  That
> theory was then confirmed by:
> a) forcing a single fixed offset to be used by each child process, which
>    resulted in immediate reproduction of the issue on first attempt, and
> b) extending a potential race window by introducing a short delay between
>    GEM closing the object of the VMA and the allocator forgetting the link
>    between its handle and offset, which also resulted in prompt
>    reproduction of the issue.
> 
> Close the race window by reordering those two cleanup operations inside an
> IGT store function: call put_offset() first, then gem_close(), so other
> test processes have no chance to pick up the same offset when reusing the
> just closed GEM object handle.
> 
> Correctness of the proposed solution was confirmed by running the fixed
> test in a loop for 12 hours with no issues.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15263
> Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Suggested-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  lib/igt_store.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_store.c b/lib/igt_store.c
> index 42ffdc5cdb..ce29355c3d 100644
> --- a/lib/igt_store.c
d> +++ b/lib/igt_store.c
> @@ -95,6 +95,6 @@ void igt_store_word(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
>  	batch[++i] = MI_BATCH_BUFFER_END;
>  	gem_write(fd, obj[BATCH].handle, 0, batch, sizeof(batch));
>  	gem_execbuf(fd, &execbuf);
> -	gem_close(fd, obj[BATCH].handle);
>  	put_offset(ahnd, obj[BATCH].handle);
> +	gem_close(fd, obj[BATCH].handle);
>  }
> -- 
> 2.54.0
> 

-- 
Best Regards,
Krzysztof
