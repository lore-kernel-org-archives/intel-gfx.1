Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3381606A31C
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2026 19:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UfF9ml8D
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6A510E796;
	Mon,  9 Nov 2026 19:29:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA5510E796
 for <intel-gfx@lists.freedesktop.org>; Mon,  9 Nov 2026 19:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794252565; x=1825788565;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LWDDRKxNEMaprapw3poqr3Pz07kUg+I9ceUGu7mNZrQ=;
 b=UfF9ml8Dk+IjnrmP7wI1TZTnXKtWeU6Gqu3IdLIwjptj4Rp1q1BgW8R/
 Hmu7IIRiyQnWoeU0TkOXjxgKZcbYEnoQQKiqlM3OJ0w84RdxshZMk+6cz
 fi7wWRHytyvieRQywt95rQaNKRmEbTjgHla26njxlmyNoZNdzhgvZkX1G
 +1TgAxBmqfogaYL7dpXzjDgisgAu9quN+TqvWFxPBJBSwB3BTcNb12VM4
 LLfwFoK4kl3ovVk25w1GSOP1gsab3f9EepFwYe8Ji85F4oA90L6QJvcm+
 E2R0pXlwe+o8UiQ2jFtgVH4BDimcllpF2w+2TVYwlLzOkE+x2JanZt+3U Q==;
X-CSE-ConnectionGUID: Dqtwbhe4RL2kjfFDcE7+UQ==
X-CSE-MsgGUID: CQFrNUmpTVuRmWUwFdrm/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2874112"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2874112"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 11:29:23 -0800
X-CSE-ConnectionGUID: TH7YP405TRWwCQI64mE82A==
X-CSE-MsgGUID: Ol+/rK8pRcybQ5RvID3W4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7808520"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 11:29:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 11:29:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 11:29:23 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 11:29:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkvWKyqSs8EhIwoBm5U6YI+Q0aMmeMrMJzQKDPwUXquFQd6KcjrQW1izmmgtnusHkJj6LS6oTeHhtr/RR1QYDFLifI6eE1RQop4ggxqEyf4PKEmvuX2NS/Lx1AahjLUiGSP31lMWtT4PyrxlgQl0Gdd15qN529RsiaSxlsDFuakHVE+LpCYmvvA9/kU+luH6TlpXZzFXHxlzGyLyf5bawtmxoT/Tp1KvTAlNtfxrwM9RY0q12Www9gk3y2qsMxzIYsLktt22FgY3hQ8d44cc7/ptlK5XVPYZJ33dGczSWBF0/WZlbBKMkyc6ybqij0szMAEIKu7hbd7CEDAkiKsk+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cRpeCk0j/KozxoB5Rs5m7yMr1FrgbRJPLZxA4DhR6M=;
 b=MuBbtyjHzNST5Bxk+gSiH3TSm/DcqI5X0nT17QA/tgmsP1Rcc+1H5CiAHh+lhh4eGpZ7c2ImmSWssbe6i59YQ3l/WcQgA45Do/qHtvpzRR6QtxCeQfD6q2wZn8eE1S+d4LMLKWS+0u4uvSWTgMkNOYrjLbW9L5T6F8g4LMN+EelpSoOwHVEPp57lgpTIvgQD/bvcCC5zhrcKrl4A1AaIWnVq1xID22M8+ZbxwH9jp4IKdx0xpc/nYdmnUkY35wK0/qtspFGamxezBn3OE7m69I8RXPbsiWmM6Zr0ajL9AqIIVZWam4SbZrQjv+dWuy6d9BoIXOsz2Z4QB1B51J174w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7010.namprd11.prod.outlook.com (2603:10b6:930:56::19)
 by SA2PR11MB5210.namprd11.prod.outlook.com (2603:10b6:806:fa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 19:29:20 +0000
Received: from CY8PR11MB7010.namprd11.prod.outlook.com
 ([fe80::e26:c52f:6245:a646]) by CY8PR11MB7010.namprd11.prod.outlook.com
 ([fe80::e26:c52f:6245:a646%6]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 19:29:20 +0000
Message-ID: <dc5e9407-7856-484f-a792-2460b2195631@intel.com>
Date: Mon, 9 Nov 2026 11:29:17 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/i915/guc: Range check GuC-provided engine class
 and instance
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <alan.previn.teres.alexis@intel.com>, <julia.filipchuk@intel.com>
References: <20260908232323.1220407-4-umesh.nerlige.ramappa@intel.com>
 <20260908232323.1220407-5-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Narvaez, Jesus" <jesus.narvaez@intel.com>
Organization: Intel
In-Reply-To: <20260908232323.1220407-5-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0219.namprd04.prod.outlook.com
 (2603:10b6:303:87::14) To CY8PR11MB7010.namprd11.prod.outlook.com
 (2603:10b6:930:56::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7010:EE_|SA2PR11MB5210:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee307ad-5d7b-45ba-d65a-08df3e97c0b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|10067099003|4143699003|11063799006|5023799004|261102123227099003|261022105027099003|261026140227099003|261022075727099003|56012099006|261021123027099003|261021121427099003|261026121527099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: CIxnbKuRVxK298HHqOpaabC7th1H5cfoZ/kiDejmAQi5pj8gPBbxhTF7a5m6Y0LuDOGhjvmk6mIb6RHI8ycGttrDuzWQYeRsRQSsKeoz19e7BlH/13tdtVFjzs4CO1rpvfkf+qLf+d5/0ArI9Ox5aMMLQcme22tNYQJz64DM0R5P0bpkaMd7p/Iz2c19jjCMxakhinp7rywQ/0neZKGlZ7z8PorLwA2FhTpc4FfuopS+B/I1pYtDP9dcEcrIj5XlnqlEVfmk5uDglWHLTaAlyLlrGbOsWQDL+Ou8UW0YgPW2Wg7NtZu3AfTv2A93gi3j1XFYbOphygX53it2dpiDkr2hNyYaztjvP8i9rpihLDU5m6LgWzbOBTvh914rSJSptaOxdlN4b7QAqdooxJ5DoKW2XpT9kfvIRIaO2BuqG7TSCe02ejcFpHncNgHTeuY0IMyLdoo5JxG3GsA7otrYLdMdWfAWRCtkSkvN7+M8HL3eyoNdW82FQvvK9ZXR4RC3QRz+N/MK8wLQaKR84wZcFkd9XM+EWmkbuiqgY9jY0a4+O831ZbApczqPF1Effq4YLjysH7M9PtWEwi/VC/36q4AuQcpsh3Aqr37lFVaiturymfUzVOlspFk86Vx/d3oro5rMtvYIlE8S+37xVEFDUVxM0O2Kb6l3lCnTn9H2GPM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7010.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(5023799004)(261102123227099003)(261022105027099003)(261026140227099003)(261022075727099003)(56012099006)(261021123027099003)(261021121427099003)(261026121527099003)(261009223027099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXplRjVYOUVLckVoTUpXUFMyRWZrVjZ5YWswdWhrVDd2RHZBOVY0ZmVUQytv?=
 =?utf-8?B?QlppNUJSZ1FpdTFBYzY2eks5ZVN0Rkhia01PWEtyMm1YNk1NWE1hd3NMYzFX?=
 =?utf-8?B?UW83Z1FISkxFSEtCVDNYcjZFNk9xaTNDYjhJbHMxeXN0dUZTZ3JmNExjOE5p?=
 =?utf-8?B?dWs5YllBanFZVkdTaDJGajUrS0ZDVEtMb2pvMjU5Vy92dnRtNXR0UFRzNFlX?=
 =?utf-8?B?R1VYeHErWFgxbjBaUFhiaHZzQllHOHliYlRLSTdQRm1MVDZQcGdvZllUdGlD?=
 =?utf-8?B?blVlTmxITE5OVnI4dHU3MndEZmYxRGxpVUVvWUJudWIvMTNjd0pMRkxNbHow?=
 =?utf-8?B?cW9Jc0RQWWlHZGI5dnhvS1o5NmdXdWpiM21FaTVSK1RyaFp2bktvNklyTmp4?=
 =?utf-8?B?UkYxUjlZSXRzc2QvcHFCd0xxVWc1b1RNUm9uVGdhK2VZaXZnZ2R3VDNBYUo4?=
 =?utf-8?B?SFl0aUprVVdJclNyZWtDZDJuWCswNW5TSGNwRzV5c3BvbGYvY3RaanVaREs3?=
 =?utf-8?B?L2Z0K0FXQzBHcG16WkZCTUFZNytueGtGcHdaemhTdVZCNCsrTUllcTErb284?=
 =?utf-8?B?ZmJIMHVjcG55UG9KMEVDQTNyZlFoTzNiZWw5RlpMSDY5TG5reWtrSlhsWHBX?=
 =?utf-8?B?Z3NIOEwwZlVPZ1VRcGJWemJ6M2JMdHQvWkd3WUE2N0VMV2ozSTdKZG0zQURl?=
 =?utf-8?B?ZjFQcHNTZTdHWHBzdmZwWXVnVEc0SFZiODIxUFhOcUN2MExHMWVkYXduUVdQ?=
 =?utf-8?B?Tm10KzFzclhyVms2d2lYMDltSDRqZ1BJQkg2WHdnV1o2d1pOdVVOUlY2bFZz?=
 =?utf-8?B?bXg2TkI2UEMyWkxabG9JeC9NVjVSeTJOV1BMaDVlVXJZVWZYcTJybHlReFh5?=
 =?utf-8?B?c2VKZzN4V05INlllN0lMN1Q2K0R4UlA0bHNGK04veHJFVkN2QXB5OEk0ZkpE?=
 =?utf-8?B?Y2NucmowcFlwMzZyTDdsanhrazJNZE9vRXJaT3BnbmVrcTR1Q1Q2aU03TmxV?=
 =?utf-8?B?a3JmWGtxNTJ5V0s5WWhTR01mcWRvUUVvd0JGb3Q2ZlRTS01YMFFWUzRVK1Ir?=
 =?utf-8?B?T2dGY21ISlZZMG9iOW9lOXNpZGphaUFSeERTbHJVVFVvTVZtcExSZk10ckE1?=
 =?utf-8?B?d21pbDhWWHBaQnBMYkFtWWJBQXhnSFZJdC9MU2tORkNuckdXN3JkWEhUaTVW?=
 =?utf-8?B?UUQ0bFhaWXpYaURzTDhQcnNRVERGQnV5Ymwvb21QNDFNT0Fxc0d6S1RLM2o5?=
 =?utf-8?B?dlhZWC9xTys4SGI0NDdFQXQxTzd5NzAwK1hBYzloN2xkaUZYdVhEdXdJZVVZ?=
 =?utf-8?B?UmhXaWdKZWFmcmRMUlRSV3FMUWtjRG5pY3lUeXZGcU5DV2VGd200MkZURncv?=
 =?utf-8?B?dTBTYTM1UEJrR1JhUjBEd2x2b0RSVnByWndTNXhUN003Q1ZJT1k3c3ZwQTdR?=
 =?utf-8?B?eTIzYTBaQkV2T242UE10OUhhWXdLS1pVRmdUSWRmVGR4cEJ4eGViQUZwbXVT?=
 =?utf-8?B?a3lWUmFJdEc3QzBWdG5IL1pieXphQ2p0L2htRVVDQUQ0Wmx4aWlzZWtad0JB?=
 =?utf-8?B?dkFSKzh3S3V2S2daa2JCMDFoS2luQkJ0SWJ5MW4vZlN2WnY0Z0lMNnJXbkla?=
 =?utf-8?B?eWJEZkI1dnpNa3ZxVnp0OEs5ZEhwT0F4aHNrd002T0R5QU9VNms0dEJHS2oy?=
 =?utf-8?B?dkxtRUdPbFRjWkZoNzdHdHJwVlUvNXgyQk9Wemx1N2V5SDBLVWNscTFFTWVa?=
 =?utf-8?B?S1V2M0ZvSGg3N2Y4RGoxbnZCcFNCcHZxN1d5aWR4K1F6Vmhyakd0ZC9GMGND?=
 =?utf-8?B?TitVRmdaZ2I1U0l2ZTY2eUpDVndSTlRrUjc0NVZDN0RSVy9BaHpLQ0FQNkNx?=
 =?utf-8?B?YlcrOWtoU0VQZXc1T0lNYmFuRDFTemRUMHUvUy9ZbEpBbk43L0QzdVVOczhn?=
 =?utf-8?B?aW9yZlAxN1Q0Kzh4MGtOQ0RVWkp1WDZiNFNwdjR3cmo2Q09mSDR3QWUvdlh0?=
 =?utf-8?B?RjlSOHBUdXVraW1HYldKTUJkZE5qZDNRdFJHVTIvYnlEZXQ4Ym1MdmFDVVNX?=
 =?utf-8?B?b3lwTEFFaXplUWhidlo0d1RWYkNUcXg3a0tDbVNRenZaaFl4eEJ3MXRoTk8r?=
 =?utf-8?B?MC83YWdwWUJONUl2WDh4eElVeTR0ZEFaZHNsaHR1U3pMclJUN0NOeEdEUWtE?=
 =?utf-8?B?aHozZkdxZk15YWFhaGFTNDM5bUtMejE0dFdqOUw4eXFyR0ViYnVyM3BiZDJx?=
 =?utf-8?B?YUwzTlQ5a3JXWjBpNTEyemVZVlNsdkc4elJuZUM4NDJSa0tBVHZGQ1lTaTA5?=
 =?utf-8?B?ZXN0dE5YUEJWYjNOQlArVzNhREJ1TUN5OFhneWdWS0NQc2hYaEw5V3JmNGV6?=
 =?utf-8?Q?qNRFtnBGm4N9ec3E=3D?=
X-Exchange-RoutingPolicyChecked: DPcv4nwC1qZ+SlZVOCm18XzX0upI9fiWZGiA3528giLeDCd+ffeN7JK0YK7IRsymB/BjhatwyeBUdvOTuAM0qXbXBFl82p9ge2Gu4z14pctiJaYgOyWoDG6rW/TC4u58NWJa2xJzKBcRypXXW8KBzl2rWLcrcC8QVqS+Br4MpG5Qc+v9i6lzdFO0tMW02TC/nv+QudvZ9B5Fbeiom1H7Jtpw9MVV/EGiCV7DEbc+WDg/iSa6coF7NbE6tvIiHFL3xjbVB5Z5V6qiD750z/9SjXky7e1aVEaj6QotHumRCkX9I5T8GltT9S6TTnEhV5iolrd2zSp1Ba480u5m/jaHgA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee307ad-5d7b-45ba-d65a-08df3e97c0b1
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7010.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 19:29:20.4870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jFPpUGtslpRNhmJyqlEZtQkbobzFWG/VC7UJqouYnYBG/AWkumfd/ysYuBnL2YpO477J7eVcpWAcDZP9Jh7Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5210
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


On 9/8/2026 4:23 PM, Umesh Nerlige Ramappa wrote:
> intel_guc_lookup_engine() indexes gt->engine_class[][] with a class and
> instance pair that originates from the GuC, guarded only by GEM_BUG_ON.
> That compiles out on production builds, so nothing validates either index
> at runtime.
>
> Range check both indices and return NULL when either is out of range.
> Callers already handle a NULL return, so no caller changes are
> needed.
I think you need to add "Discovered using AI-assisted static analysis 
confirmed by Intel Product Security." into the commit message for this 
patch.
> Fixes: f7957e603cbc ("drm/i915/guc: Handle engine reset failure notification")
> Reported-by: Martin Hodo <martin.hodo@intel.com>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Assisted-by: Claude:claude-opus-5
nit: The "Assisted-by" tag for AI is no longer required. I think this 
can be removed going forward. And with the commit message updated:

Reviewed-by: Jesus Narvaez <jesus.narvaez@intel.com>

Jesus Narvaez
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 788e59cdfac9..9d3bd16adf40 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -5301,10 +5301,16 @@ struct intel_engine_cs *
>   intel_guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> -	u8 engine_class = guc_class_to_engine_class(guc_class);
> +	u8 engine_class;
>   
> -	/* Class index is checked in class converter */
> -	GEM_BUG_ON(instance > MAX_ENGINE_INSTANCE);
> +	/*
> +	 * Both indices come from the GuC, so range check them here rather than
> +	 * relying on the debug-only assertions in the class converter.
> +	 */
> +	if (guc_class > GUC_LAST_ENGINE_CLASS || instance > MAX_ENGINE_INSTANCE)
> +		return NULL;
> +
> +	engine_class = guc_class_to_engine_class(guc_class);
>   
>   	return gt->engine_class[engine_class][instance];
>   }
