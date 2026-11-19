Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8CB60A260C
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 15:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AftMs2Wd;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=OEyi9dOw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9134510E89B;
	Thu, 19 Nov 2026 15:13:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29EE10E89B
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 15:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795101170; x=1826637170;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5criY8VSN9vEG14//teAQE2ATfr2Y1Ds+EY1WFgtswQ=;
 b=AftMs2WdAbd1r2TwU0fIbKJGhj36iw9LcYn4JAVvRQ/0NLmWK4LGGB2p
 +YkYHQYZe702jEFGnm+VqpEPFuJBd7uehbePFHq/ED8PIl/KBNlLWcOIH
 havTJxke9QyT8eyamnPEuyBHSAGYdEZleeurumafbCdKji7Q0cRALWJ5q
 UB8GoGdBWPFauDCpJZ8b8N/rS1ekQZAKmUixrkObP/e9ODShiwpsLD3nl
 jorLz5ox7pGaPxo2L+sKHiaP5UjmALYRNmNZ7yNIA1rYd2d/FBk+ySgIR
 xwsjcHOj3tvpf9XxZphJyY7/dmSEGqKPj9IQhfo2aGz3psmorsB0hn9rG A==;
X-CSE-ConnectionGUID: kjv4ypAsQnah97LeqpGWSQ==
X-CSE-MsgGUID: P5gieTPPTsaoPFncG+dRUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3868523"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3868523"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:12:50 -0800
X-CSE-ConnectionGUID: JHrmBtuLRCyn8mOJ2bTIjA==
X-CSE-MsgGUID: 6tEly005TIm2QIMt4lLbeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10344045"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:12:51 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 07:12:49 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 07:12:49 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 07:12:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYPe0jvLTDiO7Tqxz92cMLKhcxNbVsgvMacWdBVJMfUlVrZLF+91pLMRW7yy0lytpqefBRSRGAqWka9X3iD89oQ51RfPCJg2nchTXdH97GhjbO3FcE2PQRs+EF8DKhuqWhkbaNa3mrVo2qmVjWjGJXMM4OSICD885u+vIbM8K9J3fGSnO02BJL9r3c83+tYABO/9Hlaia3skoUQmLcZupu2EBltRuqwvzwYRal4GBmU9h7N8V8r9NflsciDRBm27pji07mUrNjW5Gf1ExgvuqikUw2c2pzR0XH6l+r5HddbcwE3Z69KpSMqx7QEamInaJrJ+oiAWR2HOpkuNXkLOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Pj4GgblQRzLGtaJzUosoj/R3yeWXru7ks8+PEARMo8=;
 b=fHFkWxfdIHhROF2f5lhk5cFosjO8j//exxN8PIiFVJVnlmzVuy/HnU4g3nlWIx362Ke72SrvGzXr7vHA5jGD1yQUnBy3WCCMiYVorS3NrodqS3Nt7vzF3issqOFZfYs4V1dfIe7LVdNOpGWXR8i9+TJ4BLg8Hq/Y0Ims+MpDppeuW0SsZMF/ZhiPFz7xVjcRMeLMxGYaYQQfbfXw6iov8h14qJAHimDsHLVqxMGoFVYJ8n0F/UC6LOaQnuu1XhDACZ+YS8TrrFx/eF/LN24VzKLT3EZpIw+yEQYEHGbLWU3vilYFjc1cY6schD4I1g+zin3lSZbtnMoK4Paj2dV1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Pj4GgblQRzLGtaJzUosoj/R3yeWXru7ks8+PEARMo8=;
 b=OEyi9dOwm0xixM4ICFwSvW+TTgvohv3s+Eo0ps5IliI5mVGIsgJCVdwihgIGkdMnyrXioO+rSawJkkkqg3PadwTSEubnpnTCyFMO/x5zQqo3zelJ6P5S7fsYZIXzUYYXM2IxT3W/L2A3PYvnGB0FE+1bfzX6yPpQdb7+Rf1tB0A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by DS7PR11MB7739.namprd11.prod.outlook.com (2603:10b6:8:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 15:12:43 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 15:12:43 +0000
Date: Thu, 19 Nov 2026 16:12:36 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <chris.p.wilson@intel.com>, <krzysztof.karas@intel.com>
Subject: Re: [PATCH v6 2/3] drm/i915/selftests: Limit stolen reset test to
 usable stolen
Message-ID: <av8Rlf49D_e13R7A@kniemiec-mobl1>
References: <cover.1795006734.git.sebastian.brzezinka@intel.com>
 <d8bba118ef131fa452570776a29606d469e151b4.1795006734.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d8bba118ef131fa452570776a29606d469e151b4.1795006734.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZP191CA0035.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::27) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|DS7PR11MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aab7941-e93d-4a5c-1470-08df464f8f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|4143699003|11063799006|56012099006|261021121427099003|261021123027099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6pkYcZWgluiS20w0HaKZ6P1TdL3FFhhVIwhjZvits9FIlgrCMnQKPyEtdVvek3eBHzn2ccp47F9VK4g98DmXRcdGqaDH4T4AIs1oEo8rursZ5Ct1a+axxC6Wbe4wEKTJVt9IevO1IqeFRbDpkzGWduuFB6t3Ca47NtDuBmme4I3XdgfcLChCo34mQA7NPc+/ywdfVlK8Q4ODW7P2uzJDHoxo7DAJU0K9pPVXW/pJTplO92MQaIAedmaka3aRtltuLUDy6t5NQgAWYTf5zqAgDnt5QIzdehNQFN7qE0zfAQIH56v6BWbIR7XUN2lQCYBNMDbnTn6/FrLts86qEgdnWWpg/lR4GoyE0PAI0x8vwpfBmbqvJqBIyGhe6GVWYmzAK6tI1vIQaQfTmyKcM7AR5ZQUvDNghhuDKFpLL1EEhbOVOeKxPFMiOe9iT1xX3lg0dI6gGYExddqzf9kSRBFHxKpv39v8MHozQWYFmT1QFTP/dEFt+VqiXkz8DzFIGfkACMQgPtt4wvJJJQCIr4EEW3dNFoM5EPMe/PCzLDxnx6LVcMlzU4UwOWfZNzQ+shaOSZ8pqm1Ek2g5akKqCZVp3hp6LvbySeTmAHdZoNJOjAokYbieqixvjdouqTDZB60rVmTszYtO8Ht5gkcPSaDQ8XLi4Az19vZeL41vD93Jk3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjVWMkZKK09RakJmQmhaYXYyYVBYYzF3RFE0MjBpWkFaUXB4aXNMbTJ2N1pj?=
 =?utf-8?B?LzRyNVJBTUpJUnRrTVFvR3JqU3dkRG1QamN1UU40bWFNMjlRUXU2S3VVNjlS?=
 =?utf-8?B?M1NMTkpkQndkZDV3REpZa1lMeTdjRHBEWUdXK0E3VTJuWDdoMnByV2llYkJC?=
 =?utf-8?B?Y0syUWVOYjBNMFpuZkk0eXFZVXFwS1ViTnBQWW1wak9tYnRhRFlRQ2FaUC9h?=
 =?utf-8?B?YXI2R05qQ0JYL3o5VGdZRWthamlZb0FpaTFNTDNZeU9uR3c5L1gwMzByTkJK?=
 =?utf-8?B?QWZEajVuaTIweFY2Z2Vqd2FlZ1VRZy9sU2NRNjd2d0NDN0hkTkFWSjRRSFdI?=
 =?utf-8?B?cmYrUGhBRlUrY0wyQ1dUK2k2bVJDVTdyb2NsVjlPOUUyYlltZVd1OGpwWE5C?=
 =?utf-8?B?enlQMmVrZ3Nic2VNbE91VjJPZ0hDL0szTjFWWFdjQldIclc1QXJaZXVmaVV3?=
 =?utf-8?B?d1pWb2dreG84SmlEcnZXaHVZbTd1M3BNSlplakVTSDFldHlJeEpHdURZOVc4?=
 =?utf-8?B?YkQ2dHJnMTRJUlhLbzVWYnlOM0V4ZmpyVzc4Y1U3RzFOc2ExSHVsS2lKakNr?=
 =?utf-8?B?aFVaeGFyaFVWWDVOSGZWaFNvajRSNTErT2pxWUxYNk8wbFI2NTkwTkxqSlVW?=
 =?utf-8?B?T1B6WFdlR1BxWVlVTUJ3bFUzR0dnUUF4UWNCdytUbUFFYkZ5SDFyQ1l1cGdQ?=
 =?utf-8?B?Szg3bnh6RjRTaW43cjZPVUdGbHYvbEg0QnlqZ1hCUHd0NXM3V1hnYWR6OUVK?=
 =?utf-8?B?clhNZmhkbmloeVZqV3BSTGVBdmN0STA1UVY1UUhDY01FbTc1VkJIZ2tYYW9t?=
 =?utf-8?B?a3V2KzYzUWZqVFFoc1l2eVpBdUxPSTlGcGdJcm1UTS9VRWlWbGtIN2lUZmI2?=
 =?utf-8?B?U2pvSXY0bTNDQ0NpS1R6VUkwOEVibVJCb1ZnaXg3b2FzOHBVZ1dwOHBhbU5v?=
 =?utf-8?B?ZWVhckIvTHpOYk94Nkh4VEN1ZFBlS2VkRFJyM0p1VER0NFY5STQxdFV2azRy?=
 =?utf-8?B?Z2haeU40a05pajVabDJLLzBRbnQ4c1I0WkdGMjdveWFkdGdjZHh1VHdsZ05T?=
 =?utf-8?B?dTRiUVJtZEx1c1Avb1J5c1ZOdVkxcXJnWC9waTBNVC9xdnJXOXExKzFOc05N?=
 =?utf-8?B?dTdFM2luN3JTRS90NmxlSmFFUlRwSitRMTB0NVRFVW1QWDFrUDZEK2V0QmJa?=
 =?utf-8?B?a3FhVFVvNExicGJ1YjdObzlub0lKTzlQNE9XM1pYdzlpcG1tS1puMUR5WnhE?=
 =?utf-8?B?eVRqSm1ySFJhcGVxQ2RjY2UyS2FXYWFWcUdRUVZPSWgwWXN1bUVNT21naVU1?=
 =?utf-8?B?TGNGbGMwWGRPTXU4SmgxbUtFdDhrUDJ5R3hyMUh3UENZTWZJdS94Z0VRZURC?=
 =?utf-8?B?UldVd3pBZkkwaEJQbUJCVW9nQXRXU0xOR3RTRWVwcno2T0JGVG0ySUMvdlkw?=
 =?utf-8?B?WHZwcVU2UkNjTDFyOGtoNnY4WTh0emhwOHhjRmx1cHphVzA1TnBBQTkweTRQ?=
 =?utf-8?B?WTVWRGtYR1FtN2t3RlAxWmt3UmZGVzhPVUltcDZtbFJBQ242YVArTzNZTkNt?=
 =?utf-8?B?Vmc0dGQ2SjJvZi93bVdtMnliaHZKVmRmQUtjcVg1SE1waitoTVZBbllWakV0?=
 =?utf-8?B?RnRtVlh2TDVUWmtlakpYT01UQllGWlhZMW0vTkU5eEVDVlRpUjZFeVdaNGVH?=
 =?utf-8?B?STFmd3ZLTnVyOWtZZlJGR1hSRUpLTnlhRi96KzVzTHdKcXcxYncvMzJWQktR?=
 =?utf-8?B?ZWRsRElmNS8ydXJyUHNzUUlZN3V6dytlMkNPektFWGMraU56TWJCT0xaT01l?=
 =?utf-8?B?aEUxZlZ3TlpTK1I0WERhWHV4blhCSDQrcWpYWm04NG1BZlhueDFYZFZrYW4x?=
 =?utf-8?B?RlNsbkU4MmRoRUg4K0JWVXZQQUxSWmZhSzdpdlNOQ1RBVzVMUGNVRlFIYkZY?=
 =?utf-8?B?dmE2T1h3UmNmYS83RVNsdC9tRUpGV2l0VnZzbG8yREZYTzZYdjJUZW1hM1o2?=
 =?utf-8?B?WVBsRUNJZnppQzNMQlgwOVJuMkNzT2U2TzZxNm8xT2tkSHFMbVpMdG9zdXcr?=
 =?utf-8?B?YjJ2RjVINFZHNEFubk9EejJ1MFNvbVRXWWNuY2ZmTk9JNjNBejdLRlVVb3ZT?=
 =?utf-8?B?SEJNR2tnd0RpU1AvdGZKY2dWc3BxUUNPTThWNzNvVHRmdEF2VDIzaG9lK0hM?=
 =?utf-8?B?VmxzWU1xSlVzenMzcmd0NEpuM3B3ZlZTam5sMk01ZmFRdXNmQjVHL1Rhb2lP?=
 =?utf-8?B?OEhOVmpDSkJQM1RKYTVEL3dNZnVaSGpLQnlUdkRNb29GTzhqbnBXVXBqRW4z?=
 =?utf-8?B?QWc5d2JGeWRHTE9SZ29Pbzl3OGRsM3ozZ05RSW1FZ2ltRFpqYlFOZmEzYmU5?=
 =?utf-8?Q?fy95Zvus7elvLrBQ=3D?=
X-Exchange-RoutingPolicyChecked: Id9FueCQtOdcrnjN8H593dMKVO0Gt1LLMjzJ3SUMcDUlnRTw3GVXyCSikm/jH4IhEGhqEpDYoxl0UMj18eSdw9hIJw8Pje6uCVXP5LKrQQ1JPmsf/QArOOFxdfasLPH9OlMCnp2SRrbKexY3OPlZzkpugVwUJmcMD9hoqhrFNti6kqkl2AgvbJhLguf+d6DbTvzaJcL5neQ/AV9/Sgp+/V8WxPYldbYfge+oMjSKpXaRY19IlY1FAq0N1Re57rWbOBYCzB042koaaUrIOQrOnMI7nxXHXPuvTI8aS1iDPO1Mlm8kL/9c4Mwgd+fJ1iXmMcGP28R1m6qE/AA2v3IRMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aab7941-e93d-4a5c-1470-08df464f8f33
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:12:43.0554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWYPmUonLDTGG1ao0Ge8k7Ww3pdUt5RThdgw182Dw8+FtTKI5+6TefjG0jm0q0MVlJwVjOajAwSr+KbUiPejyVjym3ATI0FzeQVsof6qEc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7739
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

LGTM

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof
