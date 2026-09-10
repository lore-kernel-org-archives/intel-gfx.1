Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B25C88E40
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2026 18:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3780110E1BC;
	Thu, 10 Sep 2026 18:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etklyHFL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2421610E2A0
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Sep 2026 18:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789065499; x=1820601499;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oaFbXqyx8k8CUVjvJ7s9t9b9+0jSypWW5sPZaCvscU4=;
 b=etklyHFLaww27L/5O+CbH9UZ6OHcSJzXKJIA9JTP/aUVQn7AwbOw0uVm
 6v2f23SDa4pyDuvRQNtnx/lYSBe72bJ6kjbNUfxe/rNaqs0ExCCD/Z/OW
 JAppdTLYWxM/mnk9qYzqlL2jkgV2f9mDxDw4llvI5Nvuj648ySCwACXER
 mC6bgc6Ldovv6UR+a+fQYm5hcemybtnltCbN7Ft92/NHyuZxl91mErBtt
 Bhk3EVuiyYzki9h+z7qXFjHKPgYzQYL8/XkhAQlirUylSMfm9Ap0/mQno
 tKnEN6BloPeAada2e7dg+3VKOHrsiLbUDd7XV7DTcR1uE7cqrwHdBJtKK A==;
X-CSE-ConnectionGUID: opbTluYuSzyrm1sUtkz3HA==
X-CSE-MsgGUID: lcFSR8g7ReqirzZO7l4yPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89540354"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89540354"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:38:19 -0700
X-CSE-ConnectionGUID: 6hfdXxoESz6B934nahYCeg==
X-CSE-MsgGUID: rU3G+7aKTYy8oRQFnEC/mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="309965438"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:38:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 11:38:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 11:38:18 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 11:38:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNMWvoiYcs71ac3rFy8SozlZPMY15l3vy0Ea4MztV6R+FKmI6craNico5pzm1PAqPk0Q9rQx8q6ozf5Q6ajZokc6s8Uq8LZiumHJtq4jMDtoDqcWnPoSaXZwlJHNGX1FLRnMYgt55wKbzmW+RYBMqH9UPtCTQSW8L9vrWWhToSd3DsV0hMCXVVNexOIYrB2LRYkeC9SjKhFKlGTXY50wzoHr256ZELN0RsmxV+k0P9WytthHIIG4He0D4Qj8nyiwkmzZ/UDD4WPWj83cEAzaYATK7Dpyfj5APOEsuwveFeXpCEEGOvnsqa4+mz4tbo1cwadrRycl1NbU9qAAL1qgAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DA0eAkPziX1IwrZv4LhB/tNebYq2Abe4glu8OLkeQKI=;
 b=XspaOzYcgYsSxIkpoh5h5JDC4aL80vsf8QN8T/QU4u6hbf3SOx5tGaG0hKndPKiTQTmPYsugwHNmVzKJDRp6TY1I9r/cgFPzV2MtyJ4qwd3KGqWnu6gGPMKgDlee4L/u0gSyLdLAA7johnPfUaE86a4Pi0/uVvyos1pGjQHR/LiPGDdhS1fDZb12gmf3W7EVOhK8k3kEB9MDjyzLqTvC5eDlZ4Z8NseCMesTddtHCno/Vl2PdkpgoEOWcK+6btTETVjDcgQa379omH4NEEH/FXNw0RboBXmrinNRLwFK8n4IBMkiEvq71KrOvTDF6WpYgSar02+Y9qztXnyKWUXbOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Thu, 10 Sep
 2026 18:38:11 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 18:38:11 +0000
Message-ID: <626a5bdc-847d-4844-a609-f863298c91f9@intel.com>
Date: Fri, 11 Sep 2026 00:08:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/i915/hdmi: Read EDID over GPIO when the
 debugfs flag is set
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20260826152444.2822821-1-ramanaidu.naladala@intel.com>
 <20260826152444.2822821-3-ramanaidu.naladala@intel.com>
 <ce6b59a5-e029-4c24-802e-7c1665f00687@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <ce6b59a5-e029-4c24-802e-7c1665f00687@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::9) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|CO1PR11MB5108:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a0e19b-b205-4e5f-08e3-08df0f6aaa80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: S3l2xVfi+H2D1WMwhc1478tt0pqFTzaYBQgS5Pwrv2GKMDwJ2uuikIpytekVXKSE9NA1dfwvFCVYdsEEP+oP94rKKK2k3OiMDSx01Zrkk9MWwK4jDbDHikCZxzfoCEYfW2GJ1yrxxV79R1i5VSR+qV5mVBNzlpb0hSxM4pnTCZlMgUFam4oM8kDJu7PPG3uHPiRYL6LgeUPN4ulgytFkHsG8jhBvaVXb2OxQfKIj6QXhVD+m4iAVF84tKRlPxAxYzgV7SpWesKFzL3MiMP9NA1HNOou1ikEidSm/CuDHPh76eEyUQbXUv3Sfo96LK9aPTpBYicNNyiVkmh+7bVM6cdUhdg1+Z45M4igdmelEE70E/j3UswF+YiCRl4dKMKj3sXtU7x/VTBcf2eMPQsAggUMZy6huAzBHucfnHdU8UODB4oxYWhuPPGcVdIeBo6aiLrCBemKYgK+Cyb+ZTgRYrLV0k9XdHtlUYAX8F+EysstCInKlHwIMesmgRnf0Is61KiN48igpTgfMX/WssJ+I1QXSiHgX0wcEidRXdxeCYBz3f1WVXe/Rr5SidS8mbVX9Xrl9LK5GJ6DguvrLOAkvkfn700UyIQ71regq+nzVgDJ/L3gUonOO4fQY6Eq9wFXDFowyvVrGxsLhB4ZZakI6KdCsOL/vffV9OFRYOPmBiQ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHVOK0pLZ1hrT0lhdWllc0lGN2ZsWnNWeTdvRjJPcVgyWXc0MVh5KzA1UDJG?=
 =?utf-8?B?T0o2MTA3ZVVvNVVaMncwV2MyUGsybTh4N2svamMwQUZwV1hxNmJkRTRURFZx?=
 =?utf-8?B?a0FPem9aODFmQWFId3VnQ2VrbE9VSU9ydmpFNFIzc1NhaGxGTk9pMi9OL0ow?=
 =?utf-8?B?bDhFS3RxQ1d5eDZyWHo0bDcrSW5MemRwd1c2SlRWTWltQ0EyUHJqMlBMQ3l6?=
 =?utf-8?B?bWVXaWdhVWZGL2JFdTN1cFpMN0hrcmhRYVhwR0FySXBZN3ZITHF1UVFJVnFw?=
 =?utf-8?B?NzNiZjNNNmRVcjdwNkp1Y2lFMkJDdENMYjNKdTczMlJjNStiR0x3VU8rcTVv?=
 =?utf-8?B?TERia1VtUEVGekhJQ081MnQyekNWcnpZQkpvU21UclQ4cERKQ05DN3NzY3hk?=
 =?utf-8?B?ME9DSC9qMVlwa3QyM3BTNTZmUGlaS2E1Z0JLOWhaRXFoUm5zZEE3WFlxWE5V?=
 =?utf-8?B?cVBtaDFNR001aGdKYy9GNHFWTXpqckhDeThpOE9KczRwekp1TkRhZG1qNm1i?=
 =?utf-8?B?QkdEazdHNWxnRDhhd3A2anJVa09hV1ZPWGRUYTcxWk1ka2lMbnNkcVkwZ2hJ?=
 =?utf-8?B?cTUwNWFqV1VBQ1FITUR4QmpNRmdSeHhaeWVadmhoSCs1a3F0U3J3dVB5d3J5?=
 =?utf-8?B?bzdGTFVuL3JZc0tIRC9BWVNvWCtydi90VytmV1Qwdy9Rb2c4UGg3YjZJWGI5?=
 =?utf-8?B?WGRCZ3BZd2wyTm9EdEFTQUo4eXpOeHFWNlZtNnFVWk04ZGdZbjJlOCtpaDNj?=
 =?utf-8?B?alRXdUxNb283YTF1VmFpYUZaSDZrS2wvcVVNN1hEdUp3NlRuMFNtR3ZIRHIy?=
 =?utf-8?B?U1pjUy9TcWNiZUE3Z0RVQjJ1dk9kcUU2dXBubHZXWXBxaTMrNkhwOFo0SGNM?=
 =?utf-8?B?eXAxaTF2TXZ2VGFIdlBrY21HSmZPSWRtdUlocUNiNi9xWmtRemU1YmdXSk1H?=
 =?utf-8?B?RzU1SEJYWTQyNlIxQmRLVm9YS1RkeWwzOEJmYmNCdnV6MmEwb0cveTJnRmxL?=
 =?utf-8?B?THF6bUV4OVlNZGpOM0xCMXI2akgrTEcxYnEyUnpNdVpLRXM1bWpaVWZXeWJq?=
 =?utf-8?B?QjR5b1B0SkZvYmxONml3RGdtY2tZYW83elFaNDVRQkRtSmdTVmROOEZNUkZY?=
 =?utf-8?B?ZkpFV2F1M1JvRm1RUEVmU1BPamhBNFBaVE9TWW0zb2dtWWFxL0RTcHcwKzc2?=
 =?utf-8?B?bDF6a1NLN1hBdzdWRU1jYis3MGIyRU9RWm16YW5QdS9vbk96UlE5akF0Z0F6?=
 =?utf-8?B?dkllYUk3ODlVVEQzVGFUSmxxMjBNRHNiMmd5MGVxWCtteXJNRSsvVnY2ZzNI?=
 =?utf-8?B?SmgrbDg5cFNLOXVDYmN3aXJpNHZDaGwvSzN3dUZ0YS9lQ3ZhRVRLbWZpdk1N?=
 =?utf-8?B?bzFKRUVUMEVyVzh1dGdtQ3JDSk1zZkdzUjNPR3YvTWFzMmV2RHo4M1BBamtR?=
 =?utf-8?B?VzNiQ0k5elpJaWFQbUUzcG55K0MzZFRBT0pwbkxkZGx5NjdQRmF6UUpBaFA0?=
 =?utf-8?B?NmFtZTYyTEtJVk9yTFBIZDZrZjluMHVjd2h5K2I1V2VZS2VLMU9nUFY2Wm9a?=
 =?utf-8?B?dVpNWktxUWZwanhYYUNXWVBOempIRzg0QmRVVU1TcUpwdlhFQXBIaVBBWVBF?=
 =?utf-8?B?YTYxZ29EU3RWalVyYjBqamhaQU54cDZUQ1ErZkxwai9OQ0pCWFc3dGZ4U1dO?=
 =?utf-8?B?ZWxTeGtzOEdBQUtRSDhsNDFNTTlOWlBMaE9Uam5zc05UaWlFTHIxZm12ME8x?=
 =?utf-8?B?WU52REdxd254bGtmaU4wbE00OERicHVQS21qL1hOUWlZT1ZTYW9UMFpVV1pS?=
 =?utf-8?B?NVVHVXdIQ0x4bUpicXN0d3NYTjd4ajViQ3p1MURZSWdkTzhqdmh1UW1KRGJI?=
 =?utf-8?B?Ym9aeFBDNkFZQXFQUC9sOU43Y0dlQ0dSd0s3dEk2T1UxQURJQTNOQUVFR0Ur?=
 =?utf-8?B?RitsVEZEdGVXbFU1N01xV3A1UDAxSHlHTnFSMVQ3SkdnTEdwZXJ0YlUyUzBa?=
 =?utf-8?B?TVNsN0VWS2lhTUg3ZGxKQ2tYaWtjbHoxaUozNVRRbHNxRzJJNWJXL05MUDgy?=
 =?utf-8?B?MGY2bDVzb2RudjI3OC9mZzNLQnBPTGVaMFV6L25nQzluRUlTc2tJa0RldkU5?=
 =?utf-8?B?VlM1SVpCTlcwMERFcFUzTlY4d3d4VXhydG10VlNiTjZ3MkRka2g3OUhQRGV5?=
 =?utf-8?B?WDgzUDV5KzdxOHhGOEdtQmgvdkVINWJ0cEpQUVdWR1JIZ3RlNU5Xcy96ZTNj?=
 =?utf-8?B?R2plQU90emkveWlEalo1ZkdrNERUNmdzRjNkZ1RQa0J3RFQ3L1ZEWDdMRHJM?=
 =?utf-8?B?cTJYVGlrZU1nejVnZ2xXOERJMzRUUkFQTFpuTUpMOFZ6eEdscUYzT3lOb3Bl?=
 =?utf-8?Q?Q1Nw1K1uuiMG+nBA=3D?=
X-Exchange-RoutingPolicyChecked: Ibz4ykKasviKEU1uSmed6h9ZlMcK6wkSwNgFmhf+Zt2IY9bqpO4sJQEgYTsXb0O0qOq1pznXFUGOw3clHiCQMzJZMwWNcRrqkO4+UlT4ajdnoAdeqmL6Nyetr6odTK53tC/tFmbc2tZ4STnOBZnxKMGiz7BYYfJSjjFZSv9+xtW3A4kRLHvBpXbzTI2I5hlDpjpZ+iV+yeaSFsv6OxencGYAuxnKiDncF551lk0Z4mkz7Q+8bjRUon7t+9Ro9l9TUTpyaMfpVDgQe3HPN5jzSJF7OZiOltnEQM0mnYCpXjFHrMgyMF5+AM7AcmvVEQb0RaAVwySGXPnBw1kYSw33cQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a0e19b-b205-4e5f-08e3-08df0f6aaa80
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 18:38:11.2561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SM3jI1mZ6WqFu6ypMH4NdOa64OCBm/QOyoyldRrRsbi+4bWMfCKfB4oLbta/dEZyT2stbVuv/3QcJgbHt0OTQU2SWCG7/nqRexQN0Ca2PU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5108
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

Hi Ankit,

On 8/31/2026 4:45 PM, Nautiyal, Ankit K wrote:
>
> On 8/26/2026 8:54 PM, Naladala Ramanaidu wrote:
>> Normally the EDID is read over GMBUS, and GPIO bit-banging is only used
>> if that read fails. Now the debugfs flag is checked first. If it is set,
>> the DDC adapter is put in bit-banging mode before the read and put back
>> after it.
>>
>> The flag is read once with READ_ONCE(), so the enable and the restore
>> always match even if the flag changes at the same time. The GMBUS retry
>> is not needed in this case, because the read already used GPIO.
>>
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_hdmi.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c 
>> b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> index 38915f19d3e5..462ccfc840d4 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> @@ -2555,13 +2555,23 @@ intel_hdmi_set_edid(struct drm_connector 
>> *_connector)
>>       struct i2c_adapter *ddc = connector->base.ddc;
>>       struct ref_tracker *wakeref;
>>       const struct drm_edid *drm_edid;
>> +    bool force_bit_banging = READ_ONCE(intel_hdmi->force_bit_banging);
>
> Please drop the READ_ONCE(). No other display debugfs knob uses it.
>
> force_dsc_en and family all are plain reads. Also, we can re-structure 
> the below calls to avoid using the local variable altogther.
Sure. I will address it in  the next revision.
>
>>       bool connected = false;
>>         wakeref = intel_display_power_get(display, POWER_DOMAIN_GMBUS);
>>   +    if (force_bit_banging) {
>> +        drm_dbg_kms(display->drm,
>> +                "[CONNECTOR:%d:%s] HDMI EDID read forced to GPIO 
>> bit-banging\n",
>> +                connector->base.base.id, connector->base.name);
>> +        intel_gmbus_force_bit(ddc, true);
>
> We can perhaps pull the force_bit/read/force_bit sequence into a helper:
>
> static const struct drm_edid *
> read_edid_with_gpio_bit_banging(struct intel_connector *connector)
> {
>         struct i2c_adapter *ddc = connector->base.ddc;
>         const struct drm_edid *drm_edid;
>
>         intel_gmbus_force_bit(ddc, true);
>         drm_edid = drm_edid_read_ddc(&connector->base, ddc);
>         intel_gmbus_force_bit(ddc, false);
>
>         return drm_edid;
> }
>
>
> This part will then become:
>
> if (intel_hdmi->force_bit_banging) {
>         drm_dbg_kms(...);
>         drm_edid = read_edid_with_gpio_bit_banging(connector);
> } else {
>         drm_edid = drm_edid_read_ddc(&connector->base, ddc);
>         if (!drm_edid && !intel_gmbus_is_forced_bit(ddc)) {
>                 drm_dbg_kms(...);
>                 drm_edid = read_edid_with_gpio_bit_banging(connector);
>         }
> }
>
> This keeps force_bit(true) -> read edid -> force_bit(false) together 
> in one place, which is easier to follow.
>
> It also covers the existing fallback below, which open-codes the same 
> three lines.
>
> This also takes care of the concern in the commit message. The enable 
> and the restore sit in the same helper and no longer depend on the 
> flag, so they always
>
> match on their own. We don't need READ_ONCE() to keep them in sync.
Sure. I will check and update in the next revision.
>
>
>
>
>> +    }
>> +
>>       drm_edid = drm_edid_read_ddc(&connector->base, ddc);
>>   -    if (!drm_edid && !intel_gmbus_is_forced_bit(ddc)) {
>> +    if (force_bit_banging)
>> +        intel_gmbus_force_bit(ddc, false);
>
> In case of force bit-banging failure, I was earlier thinking of 
> falling back to the original path.
>
> However, on second thought it makes sense to let the case fail.
>
> I think this should be documented in the commit message, and we can 
> drop the READ_ONCE() paragraph from it.
>
> Since we are not falling back here, please also add a drm_dbg_kms() 
> when the forced read returns NULL. Otherwise the failure is silent.
Sure. I will check and address it in next revision.
>
> Regards,
>
> Ankit
>
>
>
>> +    else if (!drm_edid && !intel_gmbus_is_forced_bit(ddc)) {
>>           drm_dbg_kms(display->drm,
>>                   "HDMI GMBUS EDID read failed, retry using GPIO 
>> bit-banging\n");
>>           intel_gmbus_force_bit(ddc, true);
