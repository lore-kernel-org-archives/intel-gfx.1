Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9A3606A8B5
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 11:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XsAd/mYm;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=IGsXGhef
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C8E10E194;
	Mon, 16 Nov 2026 11:15:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180B210E194
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 11:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794827701; x=1826363701;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KDnmImcVP9PQYOw4r+oQbMNPGwRV8f9tb0w/WNp72Lo=;
 b=XsAd/mYmdeShAKyl1MYocs7yvk8yM8OhuclTs1tECu2N6PjmyYkIrBNu
 cbtntCsKLW2JuUxwz5OcvRUccZsINw9t6yWi3KfhWN9g/qqO4636vuL2U
 7yBzlVFg4I7+DMbHjbOeYm+R3KXunYckNoI8eCdldiYzR14SxkhjrpnFJ
 6jlxbm+aoDg7aeC/SQIso5uF3JTx7VXXpnckZVpJAX9NQYXGZpNkUhDkG
 AHRlSJfcg9Dh1pczeJ3rnLfydX2BqUsOlXH3VP3K64PGPy8iG59bVIbGH
 m6n0IYWa54gNqPmhG/W7n95+0e+raicyLBM6PW/5geUw1vmtRKu05B2EK Q==;
X-CSE-ConnectionGUID: 5JVUgKmUShWjr70VQMfwzQ==
X-CSE-MsgGUID: U3JvGpEHSGyNg4kkO7DpMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3454489"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3454489"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 03:15:01 -0800
X-CSE-ConnectionGUID: jEnZYRtSSl6AeZhxfpjkVw==
X-CSE-MsgGUID: ifDPyfUcQa6bu0gaZxhvnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9595509"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 03:15:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 03:15:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 03:15:00 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 03:14:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bG7bJMSimfIh4BBgvT83nzb/sjny6BZ6GpyInG9pJ2c9FUeMs7ki9s3nloXJk8nmSnNnx2zte5iqi9UF5T13XVelRkEZ8LMDPmie0KeE0rmnhvh0+bdQlgSn1dvtq/cb5KXuBi0fMfTkgxKrolIVufhEAmm4elTKiobvEEwALPufZukW3P8kNg+a0S8gljXCT5XMLRCRIcqxp0O84iJXFV/oPXx19ENJTW/NIz98Sp3W2efcxPDmjz3pdPzZOdrSoM4wtEF+/rdbw7U8ghvk3dayZstd0wFT4kmP0hjDesoOi4/t97Khkl/DKkugya//U62KE7nIvKmcFU0VknAy7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ofwpoyFXoS9TiIr5ryNNhB0y3Gv9d5C7KHf9srkVYc=;
 b=i00WHEYzVaybKb/G6FblglBh/3u7+UaziIGoc0PQ0VpAehDli+aTmuOGTeyvxn8B9V1zfRv1ro3l4THrixPKO99TqxjiqQVxslZm8W3zj80VO+cjq/7rs25C3OfX1HgYyM9ySR6xSqL7TPs63LUuemYYmRqmIhMW9jYkiGm4JkfOCF9LxlUdQ3kdngi4iAODhQY49w6w8Qe7JLIjHPBj04gmnfdc0zqgvUyVSc1hbzPsKkt8dB/PXz9bdxaSI3WDs+5L9L7oNg+d/Y44HrpSe7kE9tpIQ/a9EhFMhsKBWINFBtpCuCDvlmGKu+SNmPDIQBS2yJo2ECJZfRKTo0S+Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ofwpoyFXoS9TiIr5ryNNhB0y3Gv9d5C7KHf9srkVYc=;
 b=IGsXGhef2i+y5/fVd+sOieXzZ0YKYi09fbyUa8PXSt+kAzvvqZJSGmA7C01ri9SnryPrAW634q8ylCMzhLLuVwsF5lcDQdhlh1IFJChafMsQ+IMjU4T69VuJp0qbihZ+HZW45rVdZw6hJTv73/GLLv9z9o6f02u8W4UclqZ4iIY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by MN2PR11MB4518.namprd11.prod.outlook.com
 (2603:10b6:208:24f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 11:13:57 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 11:13:56 +0000
Date: Mon, 16 Nov 2026 11:13:46 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <chris.p.wilson@intel.com>, <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v5 1/2] drm/i915/selftests: Fix unlocked mm.stolen in
 reset selftest
Message-ID: <5bazmquczxcsml5c2264inmvtml5nrsholhovn7j5xgxizlw25@k252fqqyhtbd>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20261112115907.16263-1-sebastian.brzezinka@intel.com>
 <20261112115907.16263-2-sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112115907.16263-2-sebastian.brzezinka@intel.com>
X-ClientProxiedBy: VI1PR0102CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::33) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|MN2PR11MB4518:EE_
X-MS-Office365-Filtering-Correlation-Id: d59f9f08-19e5-4f1f-c73d-08df43d2b4ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|6133799003|261009223027099003|5023799004|11063799006|4143699003|56012099006|261028144727099003|261102123227099003|261026135527099003|261026121527099003|261026140227099003|261026130827099003|261022105027099003|261022115727099003|261021135927099003|261022113327099003|261021121427099003|261021133027099003|261021130227099003|261021123027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: CuRPcxggi3of7YVi+g5MLattedbrk2GrNG2mrUjg76eYIvYnYvDaKixHky6pBmxpx1Sn2mgSPE1Hd6fpnGKow0gaRBNfqLgZzs6E+SvWPFuPi6zYLt4O4/go3+oa1clEuNcrJjyzL7FzcgGGO5dD0qRGd5TRSo7tDjvBWZvzNRoJ+3TtVU4tT4vHYBV8TzE2zyEH4YVXTSsGUrlcCxUcEuDoB90xsViyfwhXCByCDE7EcHAaejc6Gtn7ZEap4vK63ODFEpL32EqFdf0UQ8KvUXnf0AO4Wukfvlncj8QU/FGUYZ6hcOIl6x4WxS6PDKBM+E15a7Dh6Dss5/grw+JTd2W8MqnTVjxxmt+o+A5FjVn/SqQITsEHAYLKdUGJwmcfi+Vvtd86HhT5EHHx9vS252v/j06DMHKunOwClrViVxBRc8GpgHKchra57RJ9eeMSfqnEZgFQ/DPY1lwArA7ZRpYd8Mdla6FP7qJxiK+MGq3UYlfPXqVw7bwcOOiHOKZZSzcDNmZs3gD0k9RlBEgc1bTPFN+rVmgxktKIXp+R9iL/31BvnDWg3EnJdtvs1y2ez6w0F8WBfVxOv3dAxxLdQKTJdgmB4ya9P3CH2rKqcBoo2Bo/TZc3YUVROTZRnwQn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(261009223027099003)(5023799004)(11063799006)(4143699003)(56012099006)(261028144727099003)(261102123227099003)(261026135527099003)(261026121527099003)(261026140227099003)(261026130827099003)(261022105027099003)(261022115727099003)(261021135927099003)(261022113327099003)(261021121427099003)(261021133027099003)(261021130227099003)(261021123027099003)(261022075727099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmIzdkpObVVvRnBZZzhJUS9BT2hheFNsZ1daVlpYTHdYL3NGcUNUZk14dGY1?=
 =?utf-8?B?WlBoU0RKNWlibFhQbmZLeVdOME42WE5YNEYxT3RJM0FxcGZ6aEtCL0gvL1VY?=
 =?utf-8?B?MEZ6MlBRZThXQVhCaWZwZFV2VmRKNXI1ZFlKY2llMXZ0bjBYbDBuMmF0UExs?=
 =?utf-8?B?bHI1cEJtQXJMQ0xha05NUUl1c3BZd0VIUzVXUmtLVTltN3NPYWM1T2VpLzRS?=
 =?utf-8?B?VWRpSFo5T0UzdjdGb1dTUCtSZ3BwK2N1UlpjTTRMaHZaWHVnRVlHKytHTUVv?=
 =?utf-8?B?VitUUkh5bGRWS01QMEI0S2pBRVVITExGU3Q3bTJkNGlwWEJQS0JJSzRIM2Qz?=
 =?utf-8?B?eWtoampGNG8vTWZ6bTMvRTFlRE11bVU2dWRmN1did2ZKZ1g5TWd1MlY5MTk2?=
 =?utf-8?B?L25aMm54RHZSZXRUU2puNnhJakVUNEVJVkQzZE8yUUdtUlRyaENlNnFEUXo1?=
 =?utf-8?B?RTR1L3VGWVB6RTB0cExDYzhWbFBzb1NYRkdpKzJ3VlhHdWRraEl6VkpWSTdQ?=
 =?utf-8?B?eVo3amx4UXppOHBlYlFHTlR6ejAzV1A5YzJsbmszZm0rMHpieEtOUkpBRERr?=
 =?utf-8?B?U3pSWEJ0WGEzUFd6OWFvMVZqU3BBeHlQZm5vMXpyRXpmL2dnMGdMWnlwMUtT?=
 =?utf-8?B?cFJFRWV4a3JiNHA5QUVaQW5tZ2NxUnpuaE5pZ0lISHZROGRHQURqdytPSVNM?=
 =?utf-8?B?UG96bkgzNGJxOUlIU3VUZ1FRTk4yMGRUUkJRaWVSTFJQMjc1a0YrL2ZhQ2pk?=
 =?utf-8?B?MHE5TzAxenNvZlJMTzU3WVJ1NEtaSkFKVmY5RDkySjQ0emhYa295VVI0c0JV?=
 =?utf-8?B?VXZrTjBTeVV6cE92RU5ncVRLTWt4RDlmdzlNSExlL1dPdmdQbkMxT21EbmZN?=
 =?utf-8?B?Y0RPN2lSQStXaGMvd2RHSFI3VSt1Q0wvNGtZM3RUUmZtWGZWYjRNSUduTUZr?=
 =?utf-8?B?M3RZZkk5d21ZWStrbmszckNMcFJPbmRkOFRCTCtXeXJSeUQ3QzRMWnF0ZURX?=
 =?utf-8?B?T3BMY0NtbGd5KzM3ZTFEdFZWbFk1VjJ4c2xCbCttQ3lGWldDWDEyajFUSkV3?=
 =?utf-8?B?K2NlblNuUFZrZWQ0dmh5NkkyVENOdHI5VExXR2trRVppMVBLVzc1VlB1N00w?=
 =?utf-8?B?OE5ZeitLQXJzdGhZVjY1MVdnTTFoeXA5eXlKRWkyRExoWEk4NVF4OENuYnN0?=
 =?utf-8?B?YVRkODErMHhuaDc1UGpSUEswUUZpVnpaaTJFaytvZTZuZjc0cmFrd1pHT3VQ?=
 =?utf-8?B?bGxrd3ZSK1d5TmJZMm9lTGN2REE4U3JuRHFHRXNreXRkaGFGZ09qTkFEUzhL?=
 =?utf-8?B?R29yOFBneGNrTDdXVWJ1bGVCWDA0M2R0SXhodWx5aVpzMUt6TFNRdnpTR1la?=
 =?utf-8?B?emtXV0RZOXNTZnl0RHJiWnRlclByNGYwN0dPWlJYc25PdHphUkl6TU0yNHBn?=
 =?utf-8?B?Q0lWTzdQVHluUFkrUmVQUU9EMXhIWTlSVFh5Q0NQZU9mOGFCT1VoWWlPOC91?=
 =?utf-8?B?MjVLZ1c0Smh4ak4vVmxoUmJPQ2t4MURmR09YRTlxakh0aWpHNGNLWHFtdHZG?=
 =?utf-8?B?M01GZlZIZkdyWEZRYTdRdDZEMUtaa2prWWhxSncxazgyMVpOUUFrMk1xelYy?=
 =?utf-8?B?dGRGd25qcXNNQUNxc0pTRzhxbHQyTkJTQ2QxdkV1R0pyT2xLT1dhb21GOFJ2?=
 =?utf-8?B?MzJLUVh6K1ZYeU9oRng4eEZsNnMzK0FCZUY4ZExtY0t2TjhwZHBia1k5Wnov?=
 =?utf-8?B?OC9ZbjNXVGhpa24xVm1jb0ozSEJqSUdncVFsVGhnaFp6VmFPTGQ3cUZLSFJs?=
 =?utf-8?B?enJGRWNCeGpkcldyQm1vUkdTRGhUOWpVNmVDMHlGSEpRVkFscUd6S2lOM0Jv?=
 =?utf-8?B?ZktlSVNWQUNsTXQ5K1k3eEpabzlZUUloTDBDOTM1L3E5eklKV2x2K09MaTVm?=
 =?utf-8?B?bjhRMTk1aDZUbUZPTU5DSjNiZnZSUk40RVpYUTVhZkUyUS9mbkJ2ZkFpd25B?=
 =?utf-8?B?ZGU2Zk1Vb0k3YWxzdCtUTTVVZzQ1b1cxbVBEZ1VIWXdGTEUvdGE1aElibGtZ?=
 =?utf-8?B?UXRjcnRGbjE1eThMS1RvQ25pNWp6RDE4OFd3VTZ1QkQwd2ZHYzR2Nk9uUGV3?=
 =?utf-8?B?VGU1TmhodE5KZ1ZJQUtUNDV5azdET0I2M25RQzRCaVFmb1o3MGQ5bUM2Yzhj?=
 =?utf-8?B?aGR5K01GVXpqQ0VzVzVRdktjVFlCV2s5SGtMUjU1UmhNbmFwaU1wYUVuMHhw?=
 =?utf-8?B?VXc1b01FSDJCemJLMGRKRXN5RDNzYjF0N210UlFjNHNuZFRsTlZFWGJVcDRH?=
 =?utf-8?B?UjVJQXdGcWhWYWFxamVBUUJyelV0VDhvOHZnQ3BLcXR1SHQ1VGNyT0ZjNmlJ?=
 =?utf-8?Q?Hst7mnjxBmMPWUwg=3D?=
X-Exchange-RoutingPolicyChecked: FtT7zh0pDkMTjEKPznKkAwO38XiScOL17sdTgvFaKrBDl/Np78rmRP+yRIj+tI5HWLs4mpUSejmzJLyE6rynqFRQVMuCuzp9yRcaxuZHvDrZ24XuaW6ZJU4cOTpBMPAPOdh/u/+cwlwM2tc8NFJx3dKkwDLPIlzD70spTborDNdA/MFcCvUFPUIzBt1ra5q9HguNx70JLCqg9bDMfAiDDJ7/Nit97ZIGzPFyTJin095Y7m/UmWzeC/ftia/eFwkDO2yoiJZHgaB5lwuudJehswvstqSFbJvo4tsVrsFmS00Xxjosi33rlKMIexIuZwpUKzXDsLJIIX7ZhlSZZ95gAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d59f9f08-19e5-4f1f-c73d-08df43d2b4ee
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:13:56.8289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jELy01XgldLsqyFWf9h2p2HWGLSO4MjQdbuZv1Tnx8iQraHtYLW3cmL+X/xl2OU36R31RiNlXYXjcCuwNxSIRNgNZKEcqJfg68iC/Sm79MQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4518
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

On 2026-11-12 at 12:59:06 +0100, Sebastian Brzezinka wrote:
> _igt_reset_stolen() use via __drm_mm_interval_first(), but
> does so without holding i915->mm.stolen_lock. Every writer of this
> (i915_gem_stolen.c: drm_mm_insert_node_in_range(), drm_mm_reserve_node(),
> drm_mm_remove_node()) takes stolen_lock, so the selftest's unlocked
> reader can race.
> 
> This was observed as a NULL pointer dereference in
> __drm_mm_interval_first() during igt_reset_device_stolen():
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000010
> ...
> RIP: 0010:__drm_mm_interval_first+0x2c/0x90
> ...
> Call Trace:
>   __igt_reset_stolen+0x565/0x6a0 [i915]
>   igt_reset_device_stolen+0x1a/0x30 [i915]
>   __i915_subtests+0xb8/0x250 [i915]
> ...
> 
> Also cap num_pages to i915->dsm.usable_size, which already excludes the
> hardware reserved region from drm_mm.stolen's range, so poison/verify
> writes never touch reserved stolen pages.
> 
> Hold stolen_lock across the reset too, so nothing can use stolen memory
> between the poison pass and the verify pass.
> 
> Fixing the always false "page unused" check exposed false positives on
> non-LLC platforms, where ring buffers are allocated from stolen.
To me this lacks a bit of context. "Fixing" could mean a commit
in the past or development of this patch. How about:

'''
During development of this change, fixing the always false
"page unused" ...
'''

> The
> spinner rings are in use during the poison pass, but are filled with
> POISON_FREE and released while the reset retires the requests. In the
> verify pass they look unused but have a changed CRC. Track which pages
> were actually poisoned and only verify those.
> 
> Fixes: 3da3c5c1c982 ("drm/i915: Exclude low pages (128KiB) of stolen from use")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16841
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
> v1 -> v2:
> - Fix always false !__drm_mm_interval_first() check (Andi)
> - Extend stolen_lock over the poison/verify writes, not just
>   the lookup (Andi)
> - Move the lookup into stolen_page_unused() helper
> 
> v2 -> v3:
> - Cap num_pages to i915->dsm.usable_size to avoid poisoning
>   hardware reserved stolen pages (Shashiko)
> 
> v3 -> v4:
> - Only verify pages poisoned before the reset; pages in use (e.g.
>   rings) may be rewritten and freed during reset (CI)
This change grew significantly and now covers 3 aspects:
 1) a new mutex lock;
 2) adding a new helper;
 3) tracking actually poisoned pages.

I think these could be split into separate, smaller patches, as
apart from fixing the issue, they improve the code in the
vicinity, so it would be more readable to have them split for
future git history browsing.

The code looks good to me.

> ---
>  drivers/gpu/drm/i915/gt/selftest_reset.c | 45 +++++++++++++++++++-----
>  1 file changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> index 2cfc23c58e90..aae9b55ee023 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> @@ -14,6 +14,16 @@
>  #include "selftests/igt_atomic.h"
>  #include "selftests/igt_spinner.h"
>  
> +static bool stolen_page_unused(struct intel_gt *gt, resource_size_t page)
> +{
> +	lockdep_assert_held(&gt->i915->mm.stolen_lock);
> +
> +	return __drm_mm_interval_first(&gt->i915->mm.stolen,
> +					page << PAGE_SHIFT,
> +					((page + 1) << PAGE_SHIFT) - 1) ==
> +	       &gt->i915->mm.stolen.head_node;
> +}
> +
>  static int
>  __igt_reset_stolen(struct intel_gt *gt,
>  		   intel_engine_mask_t mask,
> @@ -26,6 +36,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>  	intel_wakeref_t wakeref;
>  	enum intel_engine_id id;
>  	struct igt_spinner spin;
> +	unsigned long *poisoned;
>  	long max, count;
>  	void *tmp;
>  	u32 *crc;
> @@ -34,7 +45,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>  	if (!drm_mm_node_allocated(&ggtt->error_capture))
>  		return 0;
>  
> -	num_pages = resource_size(dsm) >> PAGE_SHIFT;
> +	num_pages = min_t(resource_size_t, resource_size(dsm),
> +			  gt->i915->dsm.usable_size) >> PAGE_SHIFT;
>  	if (!num_pages)
>  		return 0;
>  
> @@ -42,10 +54,16 @@ __igt_reset_stolen(struct intel_gt *gt,
>  	if (!crc)
>  		return -ENOMEM;
>  
> +	poisoned = bitmap_zalloc(num_pages, GFP_KERNEL);
> +	if (!poisoned) {
> +		err = -ENOMEM;
> +		goto err_crc;
> +	}
> +
>  	tmp = kmalloc(PAGE_SIZE, GFP_KERNEL);
>  	if (!tmp) {
>  		err = -ENOMEM;
> -		goto err_crc;
> +		goto err_poisoned;
>  	}
>  
>  	igt_global_reset_lock(gt);
> @@ -79,6 +97,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>  		i915_request_add(rq);
>  	}
>  
> +	mutex_lock(&gt->i915->mm.stolen_lock);
> +
>  	for (page = 0; page < num_pages; page++) {
>  		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
>  		void __iomem *s;
> @@ -95,10 +115,10 @@ __igt_reset_stolen(struct intel_gt *gt,
>  				      ggtt->error_capture.start,
>  				      PAGE_SIZE);
>  
> -		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1))
> +		if (stolen_page_unused(gt, page)) {
>  			memset_io(s, STACK_MAGIC, PAGE_SIZE);
> +			__set_bit(page, poisoned);
> +		}
>  
>  		in = (void __force *)s;
>  		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
> @@ -143,10 +163,13 @@ __igt_reset_stolen(struct intel_gt *gt,
>  			in = tmp;
>  		x = crc32_le(0, in, PAGE_SIZE);
>  
> -		if (x != crc[page] &&
> -		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
> -					     page << PAGE_SHIFT,
> -					     ((page + 1) << PAGE_SHIFT) - 1)) {
> +		/*
> +		 * Only check pages we poisoned: pages in use before the
> +		 * reset (e.g. ring buffers) may legitimately be rewritten
> +		 * and released during the reset.
> +		 */
> +		if (x != crc[page] && test_bit(page, poisoned) &&
> +		    stolen_page_unused(gt, page)) {
>  			pr_debug("unused stolen page %pa modified by GPU reset\n",
>  				 &page);
>  			if (count++ == 0)
> @@ -159,6 +182,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>  	mb();
>  	ggtt->vm.clear_range(&ggtt->vm, ggtt->error_capture.start, PAGE_SIZE);
>  
> +	mutex_unlock(&gt->i915->mm.stolen_lock);
> +
>  	if (count > 0) {
>  		pr_info("%s reset clobbered %ld pages of stolen, last clobber at page %ld\n",
>  			msg, count, max);
> @@ -177,6 +202,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>  	igt_global_reset_unlock(gt);
>  
>  	kfree(tmp);
> +err_poisoned:
> +	bitmap_free(poisoned);
>  err_crc:
>  	kfree(crc);
>  	return err;
> -- 
> 2.55.0
> 

-- 
Best Regards,
Krzysztof
