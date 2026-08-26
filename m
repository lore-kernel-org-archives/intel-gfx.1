Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD72C5DF97
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2026 20:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E45C10E20B;
	Wed, 26 Aug 2026 20:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCGz+XgB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDCC10E20B
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 Aug 2026 20:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787774945; x=1819310945;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=i2okdKPreaQU+gJ85vLgfGBjnwcaK0B477+3nRj5TRc=;
 b=BCGz+XgBXlCCdh/lN6uydBZExLKoSKLNNH/Dl9FK9nqXGiW6zvGYNexe
 tFHZKmwNStvlH2Fqg7GDxhYaDIucnLN+Co2JmnOcSCbLxR18UPFW6mLJo
 kQ6GWvlwotBTD/m09rpI7srQH4ZC05DI2Pqn69O7EL8LaYd+1t1w+q96w
 /rpsDLQlZtRggs2+W24soVoW02CfY7CT+gkC2RZSd8oWbUR8IXQ1PCtq2
 7PQqyoQSXbiqtSglvMYz7NpSkfZsW1C+ce+h3Dj4HMw3QGmoO1H4SAVYq
 mN4A4VjXs741CcTBKp3LEd9Xg4WErSaUwuY6jh5GcjZ4qWu9fe6F7tfMI g==;
X-CSE-ConnectionGUID: ZqKOyrcGR+20hfLY5ILVHg==
X-CSE-MsgGUID: 0Mf1j4jKQXailuG5Kb8fGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="75808322"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="75808322"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:09:05 -0700
X-CSE-ConnectionGUID: q+UMQa5CROObWj+t/ArKTw==
X-CSE-MsgGUID: 5kUPY8JDSPCI5d7A8EAIcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="272912262"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:09:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 13:09:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 13:09:04 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 13:09:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7hg7+4i688GcxZAhUNDFvI0/89OCVLGLuzjKdNHf2jrM7Cz/dkAAmDijDjWuFZ2qF+G/xto4RXyH2z8tSEpjbcCSQ84JdYWmkYyI2Lwq7RNvQI9ACDwBVCdwLnlryoQFWKS5zdDbdQBS/9tcQECl4WFAOLgPIvTLTFMmtYdJbCUKgsS/L083LLKZR7t2icisuUyzWSFCWjIJ3DfP1DYHyeSGF0CrdAKF+6o3F4J9Sg2W2qSrQNU9UCAfqbxKR6NbbwHr7ZN/VbnF1hBuKMnJtXJEqek27qhfRqbt3s0gQHHr05gTH/cvUT2KVps7/bWTRDtYvsLcWEcKJd1MKpjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvhhJ6BfPXyieZBzNBe4MzfNXqjqJll083CZ1J6xuLY=;
 b=tmZdtpN+kY2rwWr7rMUUSmE4LoCdboxKMsQgyat//D9j4SvJpAw2KBnT5CoisgMctw8N1uAw1JjEhDBHgceeZcAE3EAq4dgaB6n7eStAU/wvgxV5kKZvc/WlNN6gmkbcjuRxLEyv2a1OjXKHEDBLlQbZ9x48jGoc1BpazJ13CIfX4aw8OOqS5k0n9ZqOAB6Dh3ZDGkiOMadTWRghRhM9/Fomf5ErkYfHdHjgDy6gr3nvhItLI+O3t9UKHQPWXNq53JkqT+IxHj7EgT8fjt2XbJfHroyHnBwlrD8JM5cyvitcWz24iQFlUrGUj1EAtboAe/gkUiWeN0XOvAfc8yZaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DS4PPF178D5B043.namprd11.prod.outlook.com (2603:10b6:f:fc02::d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 20:09:02 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 20:09:02 +0000
Message-ID: <eeb32ece-43bf-4883-b19a-6d09c6a9ca4f@intel.com>
Date: Wed, 26 Aug 2026 13:09:00 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_drm/i915/?=
 =?UTF-8?Q?guc=3A_Test_GuC_v70=2E74=2E0_for_MTL=2C_DG2?=
To: <intel-gfx@lists.freedesktop.org>
References: <20260820193724.3048409-2-julia.filipchuk@intel.com>
 <178727968466.72177.15796035856403537495@61270ab9df2a>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <178727968466.72177.15796035856403537495@61270ab9df2a>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:303:b9::13) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DS4PPF178D5B043:EE_
X-MS-Office365-Filtering-Correlation-Id: 218546ce-e3e5-4b49-bd92-08df03addf3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|10067099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 1vF8r2YU8A8lIGCK1o/F17iUF+/4cIIPvIVtiZBhhv8aLrdmTSxWuNVQo+sKXE5344H+zwjZ4RrlI5taU7fsz9t8OoCW+VBdzXxuH1xB1vVabV+H+Qv2uvXHjFHmTDyFsJ+NsO5wEcP5TLw3lmMsAeJBjCJSZmF8N35KARJj4y5jjb7ERwicUZhZpKQ4i5w09AINHIGeIgG7QYcsRlz4U8/XREr7NGzJJ9vwKm0p1LvWrE+btHIZ1XZM7G1NGw+AlfgrP7qnOU95lOP7oz5YpXwA46scEQ2qrRcPyFEl7+WGxqg+kJ2byhut6Y0lRSaRwH1ptCh57wfVQ0eKFvOvTYqRQre2RooHRBFIEwvRyUMdgYNzIYdpuMyrS8kbun/Y9/vB7LZJjjLNb2u6XAdEErx4Gt9D/cdaGuw+zOHqmQm6XD1I+/Ml5LjCVj5O7gt7IirrFcFtObqQhNPgkg7EbOX3Jw4TzZVjJjOXIkStUEqlHPNrtgkXmo7CcO4OjGCwOHKijW9kmy/nFgErq2ic+h44j3iVSKfV95eJH03xMF3/j90iStFnA/xZpAlg5tRWBnDDZb3ZjVu3s8TiCMAieqAyApN7YxRlZa8ltT8f9TM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MENQMzROR1BBWjhmK1ByYlZqWnJTTUIweVVOcTJlZE52Q0ZtRDZSRjV3VG5p?=
 =?utf-8?B?V2pJZ0QreFNlb24vbzIvRzRtL1IxZVR4NWFySWllVjgwV25VZHV3YS9SQmdW?=
 =?utf-8?B?Zm9FSXJrQ1FJL0xxSDJFaEU2RG1XcU9RcU5VMmdGUjkrcVNUNGV3MXlDSjdQ?=
 =?utf-8?B?b2l3NFVDZEx1NnlkNFJRVXhnTUdFWk5IdHFGVlVPNzB4b1htUmxwR3BxTUJz?=
 =?utf-8?B?UWtYVHZoMU5McnZiNk9scUlSclZoY2ZxUGJ1Q3M4bUtPWTVFcURybDRjNW5p?=
 =?utf-8?B?R0t2c0FJalh0MEN2THRMLytGeE4zbHdGcGZmMFJSTEdlK3psUlFiNkppeWtE?=
 =?utf-8?B?MUFBRnlhMXRDVGp6S1FDSUMzVFhmclF0ZjJobDdCT1JBNXpwQXgyRkt6SFMx?=
 =?utf-8?B?RzJSWG1GU0dDZVVoS0MvaHVNM3Z6MWtTbm9pRCtNZS9HZVNiYm5nSWZZczFU?=
 =?utf-8?B?M0s1VFRsTDR6K1hOc3hjdUNYVlNZUzZreWc4K1IzQ2kvTTduMEhvdVFjd2Va?=
 =?utf-8?B?RUlTOWhWb2ZuZzBIYXdyV3RBSDFDVkZ6Z2wxRFRwRVU0RlRWUFBZZHdtMyt1?=
 =?utf-8?B?M2xLSmJjQ3E1NUQwM3lNb3lTQUxnM0RrbnRxb2tsYUZUamdPN0NCME5HN0lD?=
 =?utf-8?B?N3MzUms2MG9KNmJFQXA0TUZCbDNKajcrYmgvRzJPdVBnbmgvcHlrcUNaenVj?=
 =?utf-8?B?bkRWTTRGRSt0WkhTSHR2RVUvWWZCTCtlckRZUFJGN2p3RDFzUFpwU2lHeTYy?=
 =?utf-8?B?SFlETk95Uy9zMEhBMmVNcTgzVUlOb3lpLys4dkhTT2xEb2lCWitXWnJTbEJM?=
 =?utf-8?B?ZEliVTJLejhiQjVoRkRKM1BqQ3hpUWRScnQ2RXFCTnQ2Z1VIQkR4aytvcHlr?=
 =?utf-8?B?ZzRCY0NxS2NabXpkTTcyakRUa2dPSE1nbUd2Mzc3cktycnF6MjlDK29POXJz?=
 =?utf-8?B?RHZ5Qyt4T3A3RmhLVXRnNUJOQjY5QXMxc1Job21sZUVyQXJvMWIvR0dGYlJX?=
 =?utf-8?B?YzNPZXRCRitzd2RmalBwWWpNclJBbG1KTWU3SFVFUFlpT1JWTkFxa0JEQTNk?=
 =?utf-8?B?SE5UNnJRU3A5dmVxdER6Q1FwUHBnMHlPVmxtR21Nd015eUI4aU5NNGpaUkNa?=
 =?utf-8?B?MzJjb3FaUFA1OFZGbkV6c01XNkM3bzdsS011NkIyUE9ENXRoNWx3Rk5TR255?=
 =?utf-8?B?UldLZW5iRDFzY2oxZGF3MWdGV3FJMEkvY1ZZNE5aR0FaQi95L1JQOXdOQVEy?=
 =?utf-8?B?azV6eGZxbHEvY2lzMU9NWnpaTHVRNmVXOXdzV05LU0hiM2tyV2NKYzhJVzZH?=
 =?utf-8?B?VS9oWHdLQXVoY29JR3YwOGdZYjNZUXVYQnFOMWJyOERSTXB6QjdJTC9GSFBh?=
 =?utf-8?B?UVRzLzl3UHRTRFAwQjg4MGsxcDI3QURIUmZDdFhaQlB6OXAwRXRTck9uMEJh?=
 =?utf-8?B?RWxDd1VGUWF6SEFocGx6bmFrTXJkUUJTVWExbFJVazgyQk1nZ3ltZmlnKzhk?=
 =?utf-8?B?WGF6VnRJVW5HTGxXTzQ2cVlLTC9URlIxcEIyMzgwSmxiVXJ6VzZwSHBzSkls?=
 =?utf-8?B?UmR2NStxUk9TeDA3dk1RNFRNRlNmN0Jjek5zc2pCanZWbVFqc3NmeENiZkJY?=
 =?utf-8?B?UWFKSWVJMEhqRlhsRE5pWWs4Q0w4YmhTTjVwQk9yaW04d1Q2SCtKb0xzZUVV?=
 =?utf-8?B?OWI1WVB3ZkhtSkVucExaN0dGelVjbEJxM2ZpTzk2SUVsN29pTGpnRXRvZ0RD?=
 =?utf-8?B?Tld5WEVVSFdKZDhKMXd0MXA3aXg4NTQwaGtCSnZlaUpCcXI1a3RCaGZ1L1R4?=
 =?utf-8?B?SHNLc3c3d01EYlZraVFjcjloOE43OFZhU29WWk1IOGNWOUVTQ1pSY3RNaFZp?=
 =?utf-8?B?bURSR2pvUTg0b3ZqRktTUU9pU3UyUUl3YnRNTUFLbEhuNk1QMVBLUjJoc29Z?=
 =?utf-8?B?bTZaV0Vqd2V6VXZ1YXBZc2xUSkRPa2dWZ2g1bjlFSnBBOEtRS1NzamxUeS9X?=
 =?utf-8?B?eklyZmUxaEZtVHp5ekZNVVYwZnFKVU5NU012ZW9lV052MUlaclRVZU9DbUFx?=
 =?utf-8?B?RVFkVmFJdEFvd1hyM3lqTXFKTTlUaUVpWnY3MjkrZjlSekRFM082N1piQ3lJ?=
 =?utf-8?B?YWtFSGhYaWZ2ZUxjYS9UcFczdE53bTdlMmxMTUcxcUNUeUxqVEhKWXY3VmN5?=
 =?utf-8?B?Qnk4bnpGNE5sR3BRcWxvREpSM3ZHa1FTUnB6T0pvV1M5c2lyNXRDZjJQVzA5?=
 =?utf-8?B?SkdYdGlZUFpFeUV0Qk9uMlozbSs3TXh4ZENpN3RVN0VZcWJVaHdKYi8wT1E1?=
 =?utf-8?B?T01ZVnBya3BEdTQ3TGRrZDBuRnRyOWVUcVZqRGQvMTh6RVh2Tlh6cEs1QjRZ?=
 =?utf-8?Q?afs82nJG7KnWFWck=3D?=
X-Exchange-RoutingPolicyChecked: PPeQIaj/mZHlFH0FPq0KORo50zJZDBjPciNToZbhpUJ0ywiSj1tLgR6XDkSPoHkLlk5ntBaUw5jXJ5jOFa6SxzjGM57B4LKl9H/ShiNOcrlN/gkzQcfpQyo2v1drVEkbAzXvBIPonRlHusXYuzIHeJk+zqwx4cPWN3S65hqd+ucuU31/wAThsxH8ukRUufNw05nPIgKHXOODldO/ecz2XEcqAYen5zTsTKOH5v0hEk4eyT58H1W2xIvMY3a1bMTb8JM5tSpB4qDB/m+wVvW7DiUOzjK0ZmoUrt9QvOD/d3EsCBEIIKKflvk9KoRxnUwHDeR7a2aixFTjnwadOpg5tA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 218546ce-e3e5-4b49-bd92-08df03addf3b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 20:09:02.1369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmyJyi1O0euHh5s5vibFV4IiVOjWgcr1bbIitBPQWJXvYzYXLwTUcykSIkJjosuFiS6nHQFpSAIUmYoJkMt3bZ8bEPJM3J+bMMQewgUbulQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF178D5B043
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



On 8/20/2026 7:34 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/guc: Test GuC v70.74.0 for MTL, DG2
> URL   : https://patchwork.freedesktop.org/series/172543/
> State : failure
> 

...

> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172543v1/shard-rkl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-snb:          [PASS][2] -> [INCOMPLETE][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19025/shard-snb7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172543v1/shard-snb5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>     - shard-tglu:         [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19025/shard-tglu-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172543v1/shard-tglu-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
> 
>   * igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a1:
>     - shard-tglu:         [PASS][6] -> [ABORT][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19025/shard-tglu-5/igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a1.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172543v1/shard-tglu-7/igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a1.html
> 
>   * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-tglu:         NOTRUN -> [ABORT][8] +1 other test abort
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172543v1/shard-tglu-8/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@perf_pmu@semaphore-busy@vcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][9] +1 other test fail
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172543v1/shard-rkl-2/igt@perf_pmu@semaphore-busy@vcs0.html

Above failures unrelated to changes. Those platforms don't use MTL or DG2 firmware.

> 
>   * igt@perf_pmu@semaphore-wait-idle@bcs0:
>     - shard-dg2:          [PASS][10] -> [FAIL][11] +2 other tests fail
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19025/shard-dg2-7/igt@perf_pmu@semaphore-wait-idle@bcs0.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172543v1/shard-dg2-6/igt@perf_pmu@semaphore-wait-idle@bcs0.html

Failure related to existing issue, not introduced by this patch.

> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
>     - shard-rkl:          [SKIP][12] ([i915#14098] / [i915#6095]) -> [ABORT][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19025/shard-rkl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172543v1/shard-rkl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
Failures unrelated to changes.
