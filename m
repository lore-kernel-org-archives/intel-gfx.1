Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33743C9830E
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Sep 2026 17:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02B910F69F;
	Thu, 24 Sep 2026 17:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvgDJDF4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8025C10F69F
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Sep 2026 17:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790269356; x=1821805356;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DdO3VcibhopwjI8VFpmczGy1x7aGR+VmPRZCR2HiiPI=;
 b=kvgDJDF4jsfkngS41CLklPiRXhKYe5HIaRu++SIDab8w8cPDCDp3U/IL
 AL2q2U7cU/k9hXzuVto90MB+IHI/9VNBNYppNGaGmdjaNnMF8k0KA2/ft
 /SHn7Reg6jVOnwJn09ZmuUNzOLEv2Yz/xXWk16CoP4BivGkvItkd1H89y
 o8qfJqOk+gATr4gqL33Hl47vNLmGxySUKx8UMAYgzmasj7RN54BOqXNYw
 P/f249BxFgFHuAiEOgZA+fwHH0C3+9KLeAuUdWe0AhgiavCO/zktqywgp
 H0xLiecwDFRx1+j17DNOcJKZbLXwibRJid+M7s4Od6isUxnPulMrTqVjj w==;
X-CSE-ConnectionGUID: +++fS93DQpCFAWeVh6DBLg==
X-CSE-MsgGUID: ztynzZlRRG6VH9q4qqTx1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="116575825"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="116575825"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 10:02:36 -0700
X-CSE-ConnectionGUID: ydJmFTYqQKyM9uQhU1FRqQ==
X-CSE-MsgGUID: 7MNKKmyjT7qt9F5k1+zIXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="278820741"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 10:02:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 10:02:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 10:02:35 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 10:02:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ainc4WwOx+ur2iMIcEnma15CL/8A/y1hg6u16n1H3EG9xE6k80oIg+Genj83j+Ky68vhlE+Ct4352PrTyUVVqeRXwCXe6krgWEZkWn6ZuA8gWrUuHzhCttKOysCLBZHz3LBhkiH2jz0kvs5kff5b/HBB1iaMK5chmoCV1i0ZtLQW1A4jUKkOeTWKIQI5hmNE1WLBuTL3ELYcfA91JHVJGNvvIwazickDvaqaPMclKL/c2w8mN9Hc8CiNx0/Fyl2ir3zjcnCxa56X/H1dx+fhWHHjR+hr1wcw6bHKwPTyKOKJ8okg3vFQMvhnBCkDLNT5sVaa8Iruh2KpY/9vox/Z8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGkfS55jn+mgb0AbvLi6UvTx6dUqSnP/G7o6Dc0b9O8=;
 b=C3y+hKQtQSoOhHNwUTN8TxzQgkSRkbPlaUZdNEVl31KzChKgCNSkb45xMbaL9IUvs6ooV53yDh/B9QgdJP84DCT02WeFo7+TEY0IWQ2QtL0fNYsyoLfncGa/Pb/kF1ZKgqgy4HzvqfkVecwPzeD0ZnHazSUKWIs4iaS2JGFrDzjdXEsLJMm+bSiXxl9Noh0vGgf67ZLbG/F6gUOaLNPjW08vS+v3eUf5D/4i457l7RAc6eKE98EzDYFL766XbLr4MQcBwOKQlu0/sRWzKYEvjRfOXWGn47LqnPmGa4fV6LLuEtAlcZkT8Me9n2aiuzbGa/A3bx+wjXvvJeDfidPmYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB4927.namprd11.prod.outlook.com (2603:10b6:a03:2d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 17:02:29 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 17:02:28 +0000
Date: Thu, 24 Sep 2026 10:02:26 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/i915/pmu: Use a delayed wakeref put in get_rc6()
Message-ID: <arVXol2zM8cZiDpw@soc-5CG1426VCC.clients.intel.com>
References: <20260910184253.1231313-4-umesh.nerlige.ramappa@intel.com>
 <20260910184253.1231313-6-umesh.nerlige.ramappa@intel.com>
 <edee83e0-5c59-4997-9ec4-9f2fc58b3733@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <edee83e0-5c59-4997-9ec4-9f2fc58b3733@intel.com>
X-ClientProxiedBy: MW4PR04CA0257.namprd04.prod.outlook.com
 (2603:10b6:303:88::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB4927:EE_
X-MS-Office365-Filtering-Correlation-Id: 4880a61a-ad6f-48b4-599c-08df1a5d9d68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|56012099006|6133799003|11063799006|5023799004|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: LZ3LYGH/34K9Q3QhMFZtICH4g29fRsKTg7WBzXW0ljCBMSdeKsqfA4vR98T3z6pI85NQw6ep9auYkqy6fERP+PuCCsAHMAWtg82bMbMLE1/OO4rGlfYU0yyQLMhy+4JMVP+4jO8eDAptkP0ene4OUtrrHszRa3rbShsoIVrwte0dU6Iff+GPb2+DkuKxM63yZJgO7HOEcZVb49PBXsFTeo6F3I4QFy2CR04V0eP4edeVNL7XuvMrSYpgQpNgcCCz0O/SSCAevH6ldOtWGcFtetbR/UgsaSqZhVKqmXMwWk0XHoGCnWslic08GlSkQbtgF5xBG+jn7KbHbzEq9fYO56D9fhXLhJtN1Abs0SpQZlNznnSEen1wnzjUAmVw6Elta7r9pZ0rcKVYBIbFiPPRbzDXAlek8Ii2XP+nkfkFE+BpN/I4CoBRmcEUSwytfXptNFC5CeBsQmzul/kcvlfmXSSb0pdqC5HM4Q3h07H4KvMDWLZckwXkGIbPeA7ssJFzREjrcvL30RI9rCV4X9uRkxJXubbGrk6PiOPbYEaDUpmQohMVU9Zt3BRZCvjF+KQmGEdAm7D5ytDIA6Eb23VzGSFXb7hwyA0TTEo/rUZw9zQTBIV1Iy5XpVv0mC/TTTpqP221p/KB6xyY+EYyjO1oH5ztpOP2oos4W8V4feK0FFg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(56012099006)(6133799003)(11063799006)(5023799004)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXM1Z1E5eDBPTDcyWHhzWEc5Y2NzQlNIWEExWEVMS0pHSjVtN05LbEFXeUR0?=
 =?utf-8?B?Vm4rYUsvdTh6ejBTRUpDV2dFc1VtbDFjUzMzYXJmWEFabUZOWExaZExmU0k4?=
 =?utf-8?B?a291Q3g4bWtOVFhrSFBKYXc2akhUSGpxZ3BUcjJvdkd2TzJIaVJkNWY1RnNa?=
 =?utf-8?B?ZVY4RFYwcUw5R3g3dHZqVm9oWDkxL1p4VXZDRFRsc3pSYnZFa3JYdTIzSjV2?=
 =?utf-8?B?amxBL09rN25mNTkvVktrclhOSG5tWGpGTStGREpxVkFaNEYzMU9WcUJiekhK?=
 =?utf-8?B?L0dEcWxHQng1Q2V4U1FyZU9OWmhQVG1kV3VvQ2E4NFFVN0p2SFU0VXFPQk5X?=
 =?utf-8?B?V0VURlFrSWdDTE9zZGtOa2gwUTlDWGVtYW1wYTJJS2JyYjdwMXRpdGpILzV6?=
 =?utf-8?B?YTh3U2ZQWmNkakF6TUZzY2Q2TWVzZWJaVXVTMjlPaW9qK0R1TWVXRStsRjN1?=
 =?utf-8?B?MEgzbitZNE5abTJzeENFeDRLZ1VCMlZ2RlZZc2tlcThrQjJtR3N5cG5MSFh2?=
 =?utf-8?B?bGs5enFFVVRtd1NQMnZFZ0E0aEViejJXUFB5ZXVRRXpzSjA0MnkxVU5Hd242?=
 =?utf-8?B?RW0yRUdsODg3WWh2ZzA1TDNFQmsyUng5MjhGUi9RTjkvcjhJV1ErTVk1OFlY?=
 =?utf-8?B?QUYreTlGclhIL1AvVDVHSEYvMzE4bHl5d05Dek44cWNNZ2prVHc0TENlWGZm?=
 =?utf-8?B?aC84WStOd2tWVTVDMHRSalU5N3hMSDI2eEtkVFRSb2dwcTdIU3UyL3ZFQTY3?=
 =?utf-8?B?amY3Y1FjT1hLVitmYXpWaTlHQVcrNXh2ZEJMSk5xVmhrWkw2cDM3Q2l1TGw1?=
 =?utf-8?B?QkV3UlcwcU03djZkSlVON2xiQlkvS240US9jN005eENDaVpvZjZrYWdDcUtM?=
 =?utf-8?B?MUJRei95eUJlMGc4a2NWSGtuQnlDZ3RVMjhEeGdZcVZjUmpEMGI3SHJpUEJF?=
 =?utf-8?B?bi83Z2daUHVIR1hNTzVMM25FZGFXY2JCMlY0SFdVT3dPbTEyUTRCLzloTVNB?=
 =?utf-8?B?dHJtSzZmd1RkK29GN2hPWEl0eUUxQlNINmJ5VTkwNHRnMSt3UC9tQ09sQzlI?=
 =?utf-8?B?dkV0bGMzMkIxRzg2ck0zZGQwUi9LWG9PQW5IMTNlaU54Z3A5SzZrY1FabW5X?=
 =?utf-8?B?UnFycElYZ2FuSmFYa2dCa1dzZXJsOHhud3oyb1hoTlQ4T2daalpLMCtHRHFN?=
 =?utf-8?B?a3lmOW9ZdzI4bllnYmgvVVMvMDBmNWVlM0FJUk9ZLzBpcXhmMVJZSGY1RzV1?=
 =?utf-8?B?dTJQQWk0Q3pDTTdiRCtRV1BqUE1OOFgzRnB3K0dGSjFWMXdaZ1RVVUFzWFdj?=
 =?utf-8?B?dW5iVnVLVDhwbll5eHp2aDJKcWRoY0NJL2w1QlBiajQ3c1Ztckd6TkVsZzk4?=
 =?utf-8?B?UUdPSnJ3aDZ4TFFZKy94djdraFIwZ0IzeE41QzRMaVlDMzFQN2VaUHhJRjZN?=
 =?utf-8?B?UndwalgrVFdSSE9lQ0xHaTQ0SmlYS2VId2cyUmtzWnRaSXdpL29hRkp3MnBi?=
 =?utf-8?B?OFE5MHBybzlvdDA5Q2J2RDJ4UkJlRE5Wa1BOSHk5bVZ1Z0ZmQnRGMmd0YmhG?=
 =?utf-8?B?M29rc3h5SmNVR0lQcDV0S28xdzhoWFZmUitUZG5oR2RwdE1EeE9TbU9qUTVB?=
 =?utf-8?B?M0J5L3VOL3QzelRpNC9paG5xQ1hFWE1xT0h5dE84eDRZTU8ra3Ixekw1T3kx?=
 =?utf-8?B?T2UrSzRQamUvWDVHamZQaHJ6NlBwaCtxd1pMWHFtMmVKK2tMUnhZc0crNHRa?=
 =?utf-8?B?OHFkT2ZDUnpoaHEyemZkVlJyYTFmLzdBcEFrNTdnMVA1ZGZwSU50VnZSVzJq?=
 =?utf-8?B?dzBxa0F1SzNuOHZwTXZ6d0hlUzhxNkljMXJabHpldXM3bENYZkpYTXZMdUFu?=
 =?utf-8?B?NlBzdUQvNE1ab0hQdE5IalZWUUJXdkJ0WThGTXZFSGczNHI4VHpGeVRmaHJW?=
 =?utf-8?B?aldta3o4N3RPZ08xZDMyazFzUHhuZlM4WnBOSTdld1I0bUpBR2d3SDkzM1JT?=
 =?utf-8?B?L1cyRTZxUUtKdEFEQnVyeS8wbFltZHRTTDNWRlBuTHl1SE1obDE2SzQ0bXBC?=
 =?utf-8?B?V3pOK2ZFOXBidHd3aGV4VE83cXRDY3QwRlQvYUFTMmpTWk5DODhIKzVIeHc4?=
 =?utf-8?B?TnUydzY2NEIrVHVvdGtUL1U2VndHaVlzSkpMcDhTYk82Mk9tSU5RQ2pDdkNJ?=
 =?utf-8?B?K1MrWEFEUG1peVY2NldOL2tYY0ZJYXFrM2hFaWhYZGMwOTFJd1ZkQ3lodWZi?=
 =?utf-8?B?eGVJZ3FjWXF1ZmtBM1dERDVkVXNUc3RmaUkvMFpkUW82Y2dneDRSeU4yUUlj?=
 =?utf-8?B?amFvL3RXR1J3TklldGVIT3g5djJnNDVjZUpZUUU1S0pGRW9McjBjS1RPd3Va?=
 =?utf-8?Q?OUyshii+e1LtuVwqJKrDnjW9Y0uJ5sll7cMJH?=
X-Exchange-RoutingPolicyChecked: DqDMdMaqK71rIjWNcvl15F9UL+n7Nk/pmLL0DBu7Dz8FqG2J+2loneEA756t8YYsKb2V82zsGZ+FqWma5ykjLs7k2VLZnfOA/7u24dKHckysEnDX+00umirX5aBNqSaFgL0ViIGc9aph7zoeICuG/W6Uo3pD2LHm4xXRKYY25Yc9dB/PkpsvtrRhN18rBmA7XlXWFuE9fF1h8zoFzEunO4ZrLEQdeDChsSMQeThJrvxcJ1hOxPV/T4LGsdxnmj3VProVkWUnUhHLTh5hlOzt3VaA8HQ925YqtlsiOpNnP19eTpYn0tlMF2AtmRhWuU6qDewrfztrz/AhoUTvscGCdw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4880a61a-ad6f-48b4-599c-08df1a5d9d68
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 17:02:28.7209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSAEIR1O5X3mJZrRmgwZyo79jGm4HO17LxO5kz9678BaMTYTMhXLzSL003rGp2eDgME5MuUVP2esez4Y4XWLGfgI+tbqgFDbzjSmDtV92P4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4927
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

On Tue, Sep 22, 2026 at 03:11:47PM -0700, Belgaumkar, Vinay wrote:
>
>On 9/10/2026 11:42 AM, Umesh Nerlige Ramappa wrote:
>>get_rc6() has the same runqueue lock deadlock as guc_engine_busyness():
>>it is reached from the PMU callbacks, which perf can invoke from the
>>scheduler with the runqueue lock held, and intel_gt_pm_put_async() there
>>can wake a workqueue worker via try_to_wake_up().
>>
>>Use intel_gt_pm_put_delay() so the deferred put arms a timer instead.
>>
>>The remaining async puts in atomic contexts (hrtimer, tasklet, irq_work,
>>G2H handlers) cannot run with the runqueue lock held and are left alone.
>>
>>Fixes: 07779a76ee1f ("drm/i915: Mark up the calling context for intel_wakeref_put()")
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>Assisted-by: Claude:claude-opus-5
>>---
>>  drivers/gpu/drm/i915/i915_pmu.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
>>index 1c3bafda9c70..4598d9b5678a 100644
>>--- a/drivers/gpu/drm/i915/i915_pmu.c
>>+++ b/drivers/gpu/drm/i915/i915_pmu.c
>>@@ -229,7 +229,12 @@ static u64 get_rc6(struct intel_gt *gt)
>>  	wakeref = intel_gt_pm_get_if_awake(gt);
>>  	if (wakeref) {
>>  		val = __get_rc6(gt);
>>-		intel_gt_pm_put_async(gt, wakeref);
>>+		/*
>>+		 * We are reached from the perf callbacks, which perf may invoke
>
>rephrase "We are reached"? There is another put_async in 
>frequency_sample(). Do we need to update that as well?

engine/frequency_sample code is called from the hrtimer and there is no 
rq->lock held in this path, so this fix does not address any issues 
there. The specific issues reported was resulting in a deadlock because 
the rq->lock was held in the PMU call stack.

Thanks,
Umesh

>
>Thanks,
>
>Vinay.
>
>>+		 * from the scheduler with the runqueue lock held. Defer the put
>>+		 * on a timer so that it can never wake a task from here.
>>+		 */
>>+		intel_gt_pm_put_delay(gt, wakeref, 1);
>>  	}
>>  	spin_lock_irqsave(&pmu->lock, flags);
