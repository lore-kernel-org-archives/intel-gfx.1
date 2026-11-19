Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712DF60A2602
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 00:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UDrxqJ8V;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=j7bVzMaR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040B110EC9D;
	Thu, 19 Nov 2026 00:16:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CA110EC9D;
 Thu, 19 Nov 2026 00:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795047351; x=1826583351;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zfKcgzFXBxGwSOt6wHDZPjD+rod2Muv4wrKJsPmp5eU=;
 b=UDrxqJ8V3Mcp53iERHh5KXCXFSD+hXpq+eL22BvUhFkKoF6W4yoH/sBo
 Wa1OZ75n2EFL52/hxTvwJkhTGH9gRIDv16c+fEqbG9uOfdEJaUtkO9iiF
 sVhKgd+aT1Bna8W6ayfchrzzKEPeV4hT2fsFILTKPrqZw+uFCNEElSedC
 KbmjHV7Mesqds1KbIeUddbxDaHcnV00Etv9PniTs03v9+MMBI/4C4AJgW
 5nSYAq/vlRqcb8GekVM7z70q3KArfA6azS/WyQbgWHUs6vR+J6RuZZtfV
 mfPesrYQFoV3Gt65vV1zyJM/TH2WYqCtdFb5ZOOKRcKrJVUhSZD0UGDcX Q==;
X-CSE-ConnectionGUID: 6IwgAwHjTcm1RGQsc/KcWg==
X-CSE-MsgGUID: 4MLYvhlPQ/KCt8oUqTBinQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3726591"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3726591"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:15:51 -0800
X-CSE-ConnectionGUID: nyKDnW6ASRWNqhZKfyGq2A==
X-CSE-MsgGUID: bWyCSrL3SWWEUlQEXo1MWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10326669"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:15:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 16:15:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 16:15:50 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 16:15:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CK4oAlMFUGRgQd1ikwYuAzj4MmUdDVS7fCgqCGTb7SkrQooZzsEPWzI/0eyLzhOtFEANJ0NQETdcS9UvoSpbEx+1D4q7PXiUuA0WhlPPEiNRFBA1PySiirqdKsikBsr+UlUzbcsMzdJej8Kp0sC1L2uCl5postEhKY0MOCnFbvhDeCBEnoMBgiKo3HOyvHUICYlNv+bZus9I2vEAxfnHOAmS6fkzjRubdy4V/dC5RvKfT/Biv6psbFE5JJuEbwsy6tU1RVx0/Cd7OEIm7I8yTq49V0357qUZFTpC+3NK2UxDwVO5Cw3Oyehtzh2QcuNyV++FC5jQxhCoO7OHyh0VDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9wSxD+8eROptSaayKYQq4Kj7kfbDED6IrXfZLKNejY=;
 b=OPiKbplvZk2t3NS/8GdSEYVggEaACWTD3u5qfCs0DK+E6NBzDw8Hy82hcwlYx6EUjHQCF6rLzXJFxTNyu9xgReIIhcE4KjoyfiTtrIHmlqDqczgQjFAJ22FKds5m5JXm/VCPkrqCsCmb8ITxk9DysbIACCpX7lVrFPjj0yY5KlRGPceDWlUKgec1dtrS0ZrkpA7Pi2kDWBjl+YV2DO2jZcUh+BOui3RN+hQKyFYC4HWlEhxSePuPSfsa42+AgqQ1oj8uQHgzLpZ4ZsIjxjNp4fATMOir6LTAAZqSMdticMheu/5CjIdPLXyH4i9lbjihVOCqwQxz3sWg91HaNLAxzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9wSxD+8eROptSaayKYQq4Kj7kfbDED6IrXfZLKNejY=;
 b=j7bVzMaRE6QvORZBzaIZi6H847qmXlJ0m3BaGch6yW8yNGwk3VfnuKA7C3rzjHT1AEdX/vC5677WNe+tl8uBBmpkohkX5l3YAYed4lioyLtCIdbeaie32COVSVEYpLGfrQLsZk1jO/M+ta6e+rnOFuJ6p1AmmnRog4WQ67dDUyc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8) by CY8PR11MB6867.namprd11.prod.outlook.com
 (2603:10b6:930:5d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 00:15:41 +0000
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f]) by LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 00:15:38 +0000
Message-ID: <203434d5-3fdb-4e77-81d6-4784b74413c1@intel.com>
Date: Wed, 18 Nov 2026 16:15:35 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 1/2] lib/xe_gt: Add function to toggle efficient
 freq
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>, "Sk
 Anirban" <sk.anirban@intel.com>
References: <20261113021149.3941522-3-vinay.belgaumkar@intel.com>
 <bcxh4lgvnmcloc3ovgobcf42x2pszklx3w2vlffrpnaqwjdhrd@by5cigap77ec>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <bcxh4lgvnmcloc3ovgobcf42x2pszklx3w2vlffrpnaqwjdhrd@by5cigap77ec>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB183078:EE_|CY8PR11MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d49b1b6-93e7-4200-e1bd-08df45d23d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|4143699003|11063799006|261028144727099003|56012099006|261021121427099003|261102123227099003|261022105027099003|261022075727099003|261009223027099003|261026121527099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info: rExYRubyjZMZFZvUKP69oFZiBMT2QHq6tWNd5rNQbZdJ2/K6YeEOwhTr3e607ZGStXYMjgVIaptokA1mlLckc3hRSx/QxHzesHsju5K2xi82rUawge2WReRbTZZB7lezac2cr1lF3Z1cYy4S+kXIXoJkig1bjGNs6c+gC7weC42rSnc7kPKQuSxShY2GnuwVq0BetohHUeBEDQAN7oLgM9dDzBIo0EA5elyQheQdAkr9O+PWaGzysMR9HcvKBBBCvcmSK3Njvyz0cp4JSJFiZ0armoku4IPz6jtOXMcUts8WnZ3r1G62aT+c2vaftLHy6vslhKtH0xuobmooUy+zL91fwQpXicpjMzS39/FAymlqzD6wDf315jXAaRV5aqDO+0iUG5eewIueQTn9BF8kyfNo74NYEtKhbh4k/aGbSjNTypZilLSVeIsy3TIYZH6zZhfmuj+Cm1P5Ae/ixXPtkM+LckcQU0daaeLn71YWrIVWWgq100i6oEO2zsHsCHInelbttVHH77SHRZSZh/aiQX0+WBhAnRoH2eJZi4VRQupj/sB47Hc51Es8awvCORQ/cfwunWKo2NvvqL1v7BgzGw3X7iAohN1aYp8kb6Op+B+SyO4t/gOf4Rj6fW5yRH0Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB183078.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(261028144727099003)(56012099006)(261021121427099003)(261102123227099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1JGdXFoTnFRNjVzblpwME1tQTFLRUlkTEQ3eTRlY29YOXlTeGYycE94cmZj?=
 =?utf-8?B?ZmF2a042WElTT3F1VDhTYUpTQlpTUTZTa283akZVc1BvVUQyeSs3YkN2RS95?=
 =?utf-8?B?eitRRUhxWHY1WVEyTTIxcGNlR0NtL0lvbE9BeU4vM01mcFVycVYyM1BhQits?=
 =?utf-8?B?NG1DWjZhNC9abVZUTFN1N0R1YnIyNWRna1dRaWZCZ0pmWTZQWVpFZjRIVHlo?=
 =?utf-8?B?d1B6TVA5WkM1RFNFR3VaV1R5RXFLNWVzQXJkOUI4SzcwT1BrUUM0a3dldm52?=
 =?utf-8?B?dEM5Ylg2aDFDMlliSGh3L1BHYVBHKzRZSXF5ZHNJZ0dMa3YxVWdhTkNCeTQr?=
 =?utf-8?B?SDdRWlUxS0RDcy9LaFduWFZ2cm1HNTdya2MyU1lVTXV3TmEvenYveENDU0Z4?=
 =?utf-8?B?UVpHVmw0b0dkSnVTMWYvZk9JS2ZoMTlBRDE2MTlIVnNmMzBIUzMzeDdPYmg2?=
 =?utf-8?B?Zk5jMFNidWFxL3ZqaGRaL09KNzFBNUhWYUtPVy8yOVp6TmpmV1B5cGs5cGIv?=
 =?utf-8?B?Vng3OWxSTWdFOW5pZnpQUlA2ajY3M25LTTR1QzBkQ2NqUHF6bTViNDBYODVQ?=
 =?utf-8?B?eDdYRElpbU9tcC9rMlBpWDdReGwxMzB1azlDUStDY04yUEFnT3NHSkFFQjg3?=
 =?utf-8?B?TnJPUlhHTk1vTndqVEZUZmJBQU13Vmk2ckhNd0hqOTYwUnA2WmQ2a0lRWC8y?=
 =?utf-8?B?eHNDSzlpTzlVNmtoU244Y2VlYzlUN29DOFJTTlBmUGNtV0U2Ri93Q043SUpM?=
 =?utf-8?B?QTZ0NkdwYXNENmxqWks1OW1uRDR3REg3MzVGY1Z3VzE5YWRsRlJqbEpKTFYz?=
 =?utf-8?B?K1JzQk1qTVdFNE4xNTNwbzMwUUhyZnVFU2tWcmt1WDZnUTlBM1RiOXEvN3pC?=
 =?utf-8?B?L3ZPSUdyMWlRTFRlcXhpRE1Ka1JFT2VIRVlreGVUenVJdFFZM1pkbTBnUlFk?=
 =?utf-8?B?dWM1VVNFTjcwamJiL1JkZCthMkl4UFk0d3hkUDhuTkQxdS9oaHRxbEdzWlAy?=
 =?utf-8?B?UTlSTDNBbkZ2UUNiaXE1QnVja0c4Y3ZWdmk2bHo2Zm8vMlR2WkZqeE1kWTRL?=
 =?utf-8?B?cXpjTGNlZlc4R0xEQUZha1FTMUF4b1Q0aGxpMmJraCtzazF3MXVnTnVidGpv?=
 =?utf-8?B?NjhEVWlMOCtFZ0JjbjJaTnFpOHROcm5Nak5lbm16Y1FKNkFxOUE5SUZsU1ds?=
 =?utf-8?B?U0VpVGRtb0RvMG1WTEJSTjdubDdIc0ZiTHk4R2l3MG1FdlhqYitFd3JnVkFj?=
 =?utf-8?B?ajBhd1plcWw5WVB4TDVlKzIxZmJsR3ZIRXBROXR6RUE2UGJvTVNwdlNhYXVm?=
 =?utf-8?B?Q0YzNW5LeERvOGxkaklweGEzNnNXSUVjRDVRK0dHallhRjJjZ0JSSk5IL3Fo?=
 =?utf-8?B?aEJLVGVnakxYZW9sVzh6bmlveEJLb1VqY0o1YVpLVWFFOTFjM0FVaTNDcFJr?=
 =?utf-8?B?YWMvUjZ3aXUwbkxUT3lEK0Nyczg5T0wxejl5OXRaVkt5ZjV4K2s2ZjRqOGRS?=
 =?utf-8?B?NWRRTzZSTDhKM0ZYcHY5QXZSVGFFaTJ0UWdZRStSbUZpbE1PSkw0d2Qvbm5k?=
 =?utf-8?B?aHVNVXlEWFpWS0RBMW9QZ0tvcjhrN2JwOXJIMGdOdWowblorTlN1RHVYQkxZ?=
 =?utf-8?B?eENySUxMdXlzMWxyOVljeFdnQ2Q4dWZRbnNHL3NGYzl0UGtNakRKZXNhanZv?=
 =?utf-8?B?TTV0bHQ2cXNXcEtRcWZCS0FNaDdFMnR3bXZhSkVBald2YTRjeWJvQ3FCeFA2?=
 =?utf-8?B?TVo1VXYzbHEweGxJcFgyS3Q0ZmVGWWxncEtPNlh6alNURVNIbTYrRnNYYWVk?=
 =?utf-8?B?Q2l3R3FuRmdnbkM2OStRczY5dkZ2QVBSZ1Q0NUk2TFpIdS9MQUNjN2k2NVBx?=
 =?utf-8?B?clFraDRGcWhac1ZxZzhDOUR5VDk1WUFNOUZydlJTVTlSSHcxc3NKQjB0MWJG?=
 =?utf-8?B?V2N2NFV2SDNYUmt3eTVyQWF0ZFNPMWt0YnpBOGtiQzkxZHB0QUw2dE5TcGNt?=
 =?utf-8?B?dkdLM3dWV0phOFdDZmRLeDhrbXVyTWtVYit3N05yenZCSmppU3JzVG5MYThK?=
 =?utf-8?B?bUFLU1E1K3psTUNZMnJwb2xNR0w5OWQ4cWJ6c0tWKzRJMzJUSnFYb3pnRTcz?=
 =?utf-8?B?clljVmVaSmhaM3dLSEVZV1UyRDBxazdPdnZrYURITGlzdG1NWjBuSmdDdklp?=
 =?utf-8?B?WHp5ZGRjNkFIMC91THRzOHordjRLWmNtckdFa2Vqb2xRSSt4VnFhcVREaHpM?=
 =?utf-8?B?VitlQ0pVcHhrQkE4dkJWVFhmUHFlSjJvMGMrME42TCszNlZld1I0YldKT1Nn?=
 =?utf-8?B?VFdWZlhKSk5DWmFwSEZPRWFtWnA2b0NveTY0NGxDaEtVMWM1WEZRTkYzUENL?=
 =?utf-8?Q?yr+3hXeScrhTqwS0=3D?=
X-Exchange-RoutingPolicyChecked: Zhk789BzV5o73YtkMv5ddwV5BWt3usuDA/a0HOv0Dfks0RWtZGSs1P1e2uUFGl5Z/29xnXPfG7wsj/nOAZu4rULdtEg9Wnplz7jVi5G2syYegZ7SoHgTJpve2aPc6WcB5glxmNhuoBntHuaL00Dzp8R1BH+2l4DC6J6oX+NJR2PubTV1JfAeo8yUhMAmpxyYQ11AfQJk4kafl7DCLBI/IJwrRsnkmkCoqIf9e78SvbUISrnBngdy0d5R6YyzULE4ad+wjxU8S1QYyAOE6WmWNHsZHmrRwRlB938QIlLlL6z8FznIkE0Hn+bJzwZnBv/A7Wvr6dYaJ6+t9QBoITB9WQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d49b1b6-93e7-4200-e1bd-08df45d23d20
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB183078.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 00:15:38.3236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7IQ/gJ0drh0JbVIV4msayTbcLAB5U8YpGRcK7Yeb87y9HengY/7aTZewzW/nBwLuLnvBINb74V8qiQdXuBL+GuD3bs69whTJl5jEXYkWUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6867
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


On 11/17/2026 6:19 AM, Kamil Konieczny wrote:
> Hi Vinay,
> On 2026-11-12 at 18:11:50 -0800, Vinay Belgaumkar wrote:
>> This writes to the use_rpe sysfs interface to toggle the use
>> of GT efficient frequency. The KMD patch that introduces this
>> sysfs is at: https://patchwork.freedesktop.org/series/178352/
>>
>> v2: Address review comments (Anirban)
>>
>> Cc: Sk Anirban <sk.anirban@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   lib/xe/xe_gt.c | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/xe/xe_gt.h |  2 ++
>>   2 files changed, 61 insertions(+)
>>
>> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
>> index 1f0b77986..6f33df890 100644
>> --- a/lib/xe/xe_gt.c
>> +++ b/lib/xe/xe_gt.c
>> @@ -345,6 +345,65 @@ int xe_gt_set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
>>   	return ret;
>>   }
>>   
>> +/**
>> + * xe_gt_set_use_rpe:
>> + * @fd: pointer to xe drm fd
>> + * @gt_id: GT id
>> + * @val: Value to set use_rpe
>> + *
>> + * Set use_rpe. Function will assert if the sysfs node is
>> + * not found.
>> + *
>> + * Return: success or failure
>> + */
>> +int xe_gt_set_use_rpe(int fd, int gt_id, uint32_t val)
>> +{
>> +	int ret = -EAGAIN;
>> +	int gt_fd;
>> +
>> +	gt_fd = xe_sysfs_gt_open(fd, gt_id);
>> +	igt_assert_lte(0, gt_fd);
>> +
>> +	while (ret == -EAGAIN)
>> +		ret = igt_sysfs_printf(gt_fd, "freq0/use_rpe", "%u", val);
>> +
>> +	close(gt_fd);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xe_gt_get_use_rpe:
>> + * @fd: pointer to xe drm fd
>> + * @gt_id: GT id
>> + *
>> + * Get use_rpe. Function will assert if the sysfs node is
>> + * not found.
>> + *
>> + * Return: use_rpe value
>> + */
>> +uint32_t xe_gt_get_use_rpe(int fd, int gt_id)
>> +{
>> +	int err = -EAGAIN;
>> +	int gt_fd;
>> +	uint32_t use_rpe;
>> +
>> +	igt_debug("Opening attr: %s\n", "freq0/rpe");
>> +	gt_fd = xe_sysfs_gt_open(fd, gt_id);
>> +	igt_assert_lte(0, gt_fd);
>> +
>> +	while (err == -EAGAIN)
>> +		err = igt_sysfs_scanf(gt_fd, "freq0/use_rpe", "%u", &use_rpe);
>> +
>> +	igt_assert_eq(err, 1);
> Can you fallback to old method on older kernels?
> I mean when err == -ENOENTRY.

Older kernels do not support any way to check/change RPe support.

Thanks,

Vinay.

>
> Regards,
> Kamil
>
>
>> +
>> +	igt_debug("gt%d: use_rpe %u\n", gt_id, use_rpe);
>> +
>> +	close(gt_fd);
>> +
>> +	return use_rpe;
>> +}
>> +
>>   /**
>>    * xe_gt_get_freq:
>>    * @fd: pointer to xe drm fd
>> diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
>> index 9ef15d7dd..7f824ca63 100644
>> --- a/lib/xe/xe_gt.h
>> +++ b/lib/xe/xe_gt.h
>> @@ -29,4 +29,6 @@ int xe_gt_count_engines_by_class(int fd, int gt, int class);
>>   
>>   int xe_gt_set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq);
>>   uint32_t xe_gt_get_freq(int fd, int gt_id, const char *freq_name);
>> +uint32_t xe_gt_get_use_rpe(int fd, int gt_id);
>> +int xe_gt_set_use_rpe(int fd, int gt_id, uint32_t val);
>>   #endif
>> -- 
>> 2.53.0
>>
