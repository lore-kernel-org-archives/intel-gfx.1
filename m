Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9EAC79F9F
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2026 18:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFBE10E0E6;
	Thu, 10 Sep 2026 18:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsnD1Eb/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFBC10E0E6
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Sep 2026 18:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789065175; x=1820601175;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5tY/RFLxIBREyyjfi5txmJEaXCch4LDLgvHAVrwVlfE=;
 b=fsnD1Eb/MTPWqxR6FUiUTEzIn9kDQ3CFUol8UjnGY9HnGv6LQEc049Ib
 qSSQCOOgS8MKI6PQ9ptOdCYZtIhkltl7M9cnZl1Ssx9+hosEMLoiWKQR7
 fE7ptDmMYsGHbklFbhrKFm4+eWE0/umhJzgRDkc8gp5YAmPuYHR6+nqCj
 klNu61tPHFRxvALCrKHIVZ6CV0gYnGl6xmxrqMoUz0RkN8zB29y1Hl7Hk
 k7hHErarIPBz4l3chv3LxBdx6XzATbdoNLlEQVkE/BsXnBv+JtKSe6Cya
 rLp1HFQSLL+SJESDFEVkijvhLe+KLOpyXNxN7uYDwzBaR1uUZh0p1JIvZ w==;
X-CSE-ConnectionGUID: Tafdph7CTNOGFPTf5TzLJA==
X-CSE-MsgGUID: t4+D997HQ3CSUBOo8olESg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100119376"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="100119376"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:32:55 -0700
X-CSE-ConnectionGUID: Ce/OpHGsSLe8jY5Prn12SA==
X-CSE-MsgGUID: RC5O90LsT1e9fddasNaWVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="265512405"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:32:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 11:32:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 11:32:54 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 11:32:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSTnr6kWmiQoUFPMK51/VUWTJMnRVmqN9QFXHk+C9uN9yEBWFeXi0UzElnUbeGEDbifMKPaBSABD9+1rAKlvBGjFIC3Ed8wXmR0BFvFVVeoOjFFfRhx/BLp7A96ihSEn0wfjdUea/JnPVnjAMVLZk50twgf35LHv3IsThtTLvY8999tmqwyjIFloVGtDIAMKp6eZDF5jvFtqtn+BTsHya0moXPcolBktkqYeSvy5pdY2HvFAQ9fZSdZuvzdqUKCJeP92B54qPneibjTn53CqBNSXTWhFXNPwAOYPVpLdVwfn06lTIq35mLO3od2VWm19rQUdsjfHMaouUNjYT81rlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ym1HVHHzzFbiH3mB7Ny3NDe/lmurybIYyRlDFA6BU3s=;
 b=SqQA9+Ho8j6SrogLJDcd/1sjc+bpAw8nQCt1WnNHuMcPLqCXmpz+YrJQl6BuIUGXn6CmBYFbJIG+QeZ3yFhHY1D6va7pkA5dZMzCPV3F+OD+kyPZ/4ZA2JAmIK5knTP0P2W0wjGUDGJuSBNQNN7ZJNxEUeCA4FIpq2kcDb+4qUfkhDWJ1EDqqCD9pfzt6+o2dL4rt1J+OqyfJPfOy3JSmIZdIc+Yal29ualDuhTvT28EMn/k9CExyeeINX8YplRBGmkXJJWl3Z1N0wfIejeK4RvfBKU0dPP5dN7NxaqgyPVijwctehuXqyk1Uumq7uPmE7sm1MQso2d6AGP4udanLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by DS4PR11MB243254.namprd11.prod.outlook.com (2603:10b6:8:50f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 18:32:52 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 18:32:52 +0000
Message-ID: <7f2ad939-b546-4a9b-adb3-b491c52538b7@intel.com>
Date: Fri, 11 Sep 2026 00:02:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/i915/hdmi: Read EDID over GPIO when the
 debugfs flag is set
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20260826152444.2822821-1-ramanaidu.naladala@intel.com>
 <20260826152444.2822821-3-ramanaidu.naladala@intel.com>
 <9166040c46d8ec390662b19c9b4268311dc05896@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <9166040c46d8ec390662b19c9b4268311dc05896@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::19) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|DS4PR11MB243254:EE_
X-MS-Office365-Filtering-Correlation-Id: 93457e26-6db5-40b1-0b38-08df0f69ec5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|4143699003|10067099003|22082099003|18002099003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info: iqVqNEyrTjFxSzH1nmu4BgONKFYFo6XS3cKZYJ/CI6ESfGjm12XjVbeUdTEobYA8slA4fUgA0BvB+44HRncmzkYBR8pEV5O4lWVFpHXonqRBJ7qn3TBVU0znKI//H3GHsJOqHJw+ewPG0ae3SLgPDu6xunh77ycO13MmCB565yShAiYt8pQ4RpZIyxmm8YnryFHyY8uDLrDXLQAGcNVC3L+mUsK5OE96CRomPvVGiGDMpmCxwNVgsiwG2qXJDSZrXQEsFEBlfHs6VJw/mqokDj3FUfzhags9LacgjO1QtS5dCmMUH2cUYqkJeYAPbQ3GgrOwVZfhql13W3IlY4kOtSzxGWO5wpYmqVy2hPV2E8NzmNSfNcf0qW+AXGlWbCwG22L1wEAG3yj9TiCtTTUUXNsVXXY7XdexKCiYPrS0pxgtyBSo6MyUzEU28lR8mt/Hp0zhT6XHeJbBxpkBtkJIjEd2nN5Ndx3+PtUj3ySIokiQ7UGZAyFIAF1n07iurhobw9/9I1yvxOwQDPEp59zguDm8m3KO/PhDjRyHmuahto7YVV+DqGxXNv09IZxLgL047L9w6yLMotsmBCnxn8UazxtxW+Oozbcda8ixW9xWyGjjTRzF4hIDqfmtxwJ7EL0NPypPPfoi6LdrexO/uR6mMzj62perxtrh7YlFnNBNzMw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ulh4aG5VRWFteEc5VkhqYWNTQVJobE8zQzVFVEhzOFVrcEhjazMvTDRPYzFN?=
 =?utf-8?B?cDhVUVoxQ0RJQXdpNlNsSCs2YWx1S2dlYXFGc1BMWmNnZmdmWE5JZ0R2VHd6?=
 =?utf-8?B?NnpXVW5qc0lLVlRVWm42RTk0Z1J5d3VmZndQWXV4anpmVUNwUm1ueUVtcDZ6?=
 =?utf-8?B?SkZDUmJaN3R5L3JxR1pqTzlMMW45ZzBqV1lxREF4U2l2WTBNbGxEdW00LzBx?=
 =?utf-8?B?T0pJWkFhTkZFZGZCRGlmNHNOUTExaks4SHh1d1RJaUh3Qzl4Zm8wNTBseHlr?=
 =?utf-8?B?T25rMitQT3ZSNlBHV2xhOG1Gc2lVRGRORDdlOC8zdGhMTzdSNy84RzdPRFZt?=
 =?utf-8?B?MmJGRFB1dWpJcWJiVlZhanBVanFaWGt1YWtLMmY3UTdRcEdyaS93WFE2MytL?=
 =?utf-8?B?a3FYU0ZqM3V1N1hCRHZjQ1BKblVweWozY3F4cXZrQmRSeCtDOHE4UW95cmEr?=
 =?utf-8?B?dVVDZWd0THVYZ04vN3dGWUN0UFBlK1VZeWRkN3hVaURDV0dTa3NnRXhrcm1x?=
 =?utf-8?B?MUVpVlRsYUhCcC9KcGJmNlZKcktjbklqVHBpSFB0cHV5SXZxYWs5SVNlQVdn?=
 =?utf-8?B?WWl6WUJiNk4rZ0ZHdEhtQXVKOXdaL0UxMEt6bVlBOUh5cWN4dVpjbkNMdHA2?=
 =?utf-8?B?TFppL2s0WURuWUxBQW1HdEJaaEVxaGd0YzB6TE9UbHNDV2tWM0Z5MXVxbWdt?=
 =?utf-8?B?ZW5pWkt4eWtqdDEvd1M5SGtaUDRYZ1NoK04zaUl6b1hCeEJqTENiUzFvdGp3?=
 =?utf-8?B?eTBmMzA1a29uRlFvc0FXSGd4eUFpYTUvQXdCcy9taFVsRFFvaGZtaHJtRm5G?=
 =?utf-8?B?Z1J2Y21HNzIreEl3ZzJjVEJNaEJsMlBoWGNSclhhM2hQUUg1NGlzamRCc2xH?=
 =?utf-8?B?TEtndjN5QUQzd25IaUxCV3JRRktMMlZPWDBMNFBDem5mNUlXeFNXUEduR2Ni?=
 =?utf-8?B?SGowaExtV2lwMWE2MU5BeHNkSWxWQ3dFTlNHR1VibUlPYzNoWjZibzkyQVFW?=
 =?utf-8?B?MlI3UE9rRUhFQndjdGp4YmJObTlNYlpTVVBXY2M4ams4ckRsa1dvZXkzN1Nk?=
 =?utf-8?B?dW1aWnNTM014MVErdHFsZ0szQkw1eDdQWFFoeW9sYm16WmhHNWozWUgvS2RS?=
 =?utf-8?B?U3ZTcFgyeDNzY1JFQS9sc2FNOTBvMTIxWmVNTERVM1JXYVhrV3BjRy8ySGd3?=
 =?utf-8?B?Z2N0RFFraTFaRXJua2lQWlVRc3JZcmJMSVR3ZUN2TU0zQUxiRk5OZi9PNlEy?=
 =?utf-8?B?Rzh0ZnJHcWVTTktscWV0Q0J1ODdQUW5CamJGbnU1bnJsWitEUW1BL0pQVkl2?=
 =?utf-8?B?TjhKaC9ZUjd6Y2VaTmk4OHVXQ0xwWCtqcXdxL2ZpZHBFd3lDSC9LTFdUSmlB?=
 =?utf-8?B?VkNML25RVjlmZHIza3lZRlJXNlE0OXR2Y2ZiNlo4UXV0QlZMZlBETHVPV1Jv?=
 =?utf-8?B?eklObVNEd3pud3V1SDRvTVFNZlphcDZaTzhWYWs3YU95KzAzWm9vNWY5cmJH?=
 =?utf-8?B?ZUxFWUdlZXJWR1RCOWNCLzlkTDZCL2psempSeVE0eWpVSGh1V05KTjd3dzU3?=
 =?utf-8?B?cnlUd1g4VXRVbnROZlljcjFndkVuZWdyWjNqT21UMGNmcUxjN3ZiTlJ1cUZK?=
 =?utf-8?B?Q2RnazIxUSt1V0lqK2NKWVRTVDlKMHZYeDduMlJteWs3a3BBZTNoMzlDZ1dr?=
 =?utf-8?B?UUR5b0ZmVU5OV2t6TnFLTWkzY2FHQis0LysydElVbjhVclRsalRlczFVeThx?=
 =?utf-8?B?YjRZSG1JalJrUFVqSEZGU2IvSU53Z3VCVU44RDZ6bGNkMjJ5WWx2aDNNdWFI?=
 =?utf-8?B?aVozZGJUdVhQT2ltVklaZ0hhVWNqdnF1bURNanVPVGRmS25RZitLcW9VN0Fy?=
 =?utf-8?B?SDI0dDN3aks2UTVYQ3cwdVNMVGRzTy8rU0l5UXdnb21IV2I4WGp6MXUwcFkw?=
 =?utf-8?B?OVhVMjNtdlFseWJjOWhKYnltci9xRG5YaWpkS1BIVGRZdjM3c0d2QUZwUWRl?=
 =?utf-8?B?YW9Ca0p5VU1UbnRiMUFMQ1hja2RlTnBTQ001SzBiVGdvRXpTdklYbXlTTnRV?=
 =?utf-8?B?c3M2L3J2VXo5SS8zQ0FONWtoTHhVMnRiNmlIc3RRaFgyaDk0aDVzUU1nQld0?=
 =?utf-8?B?UTQ4OCt6d2E1bDZCeHBTR1BVaTlxTE1TWVU2d2d3WTlrQ3RYKy9BTkh5a2Vz?=
 =?utf-8?B?UGE5ZTVGZ2ZIZjByTW1LZEJOazVGaHhvcEhEc3FzQVFGQlBqTlFkU1JpekZL?=
 =?utf-8?B?S0hUU3loOTc0Y1o0WWZTSVc0UzRsdElQTkZJWUNzUStzMzBmQmU3YUJLQnRH?=
 =?utf-8?B?a0Q5YVN2VUdEZEh0QnZWLy8zSGJUSks1QjlMOWJubzYyNFNJb1JKOThlQzBt?=
 =?utf-8?Q?HwBjsoTklOr/I1sU=3D?=
X-Exchange-RoutingPolicyChecked: 32jXszF4PsSJEBIMuTeS/mU7tzd/Bl5OJr/g7TWvedwranH5d+n3dPVxppSs9bx93TKKb2DID9uphmdiiEdHz8JaQq71WYWPvX2eGyZPI0Q6pzB5N3SEel0ZApB+NxaJy5/pV8iGGFUr0HsfutjGerlPjPuxknNoVfwOZAeGiVRbFkld3cjuT45pamsHfOqMRH9LAWmFOYBHJ5nR17L8cvq3TdaUHW0dASE0/uDr6ObLKnBRw4+onhx8xO89UhJQVcQPZAv4fzKNoaz930o37OpVvSZ//3iBqH+z1QyttrGYIVnOoC7Qw8z1tIC0qwDvlVDZ0KSsjq8QZ1Pl3roeIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 93457e26-6db5-40b1-0b38-08df0f69ec5d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 18:32:52.4822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4iNRPW8p0lZIN79kTV5+6uJ25fLnimwWUSmY1j5nWMDqRV0GW9D7sEvn2XtX6W9+UzEYOzx7geeeDoJf00S51F89WYEWam3Wruaz9MgHOw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB243254
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

Hi Jani,

Thanks for the review.

On 8/31/2026 7:32 PM, Jani Nikula wrote:
> On Wed, 26 Aug 2026, Naladala Ramanaidu <ramanaidu.naladala@intel.com> wrote:
>> Normally the EDID is read over GMBUS, and GPIO bit-banging is only used
>> if that read fails. Now the debugfs flag is checked first. If it is set,
>> the DDC adapter is put in bit-banging mode before the read and put back
>> after it.
>>
>> The flag is read once with READ_ONCE(), so the enable and the restore
>> always match even if the flag changes at the same time. The GMBUS retry
>> is not needed in this case, because the read already used GPIO.
> This should just be folded to one patch that actually does something
> with the debugfs.
Sure. I will fold this patches into single patch.
>
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_hdmi.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> index 38915f19d3e5..462ccfc840d4 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> @@ -2555,13 +2555,23 @@ intel_hdmi_set_edid(struct drm_connector *_connector)
>>   	struct i2c_adapter *ddc = connector->base.ddc;
>>   	struct ref_tracker *wakeref;
>>   	const struct drm_edid *drm_edid;
>> +	bool force_bit_banging = READ_ONCE(intel_hdmi->force_bit_banging);
>>   	bool connected = false;
>>   
>>   	wakeref = intel_display_power_get(display, POWER_DOMAIN_GMBUS);
>>   
>> +	if (force_bit_banging) {
>> +		drm_dbg_kms(display->drm,
>> +			    "[CONNECTOR:%d:%s] HDMI EDID read forced to GPIO bit-banging\n",
>> +			    connector->base.base.id, connector->base.name);
>> +		intel_gmbus_force_bit(ddc, true);
>> +	}
>> +
> Okay, now that I see the implementation... why is any of this HDMI
> specific? You could make it independent of the connector type. There are
> other connectors that use intel_gmbus_force_bit().
>
> And you could just call intel_gmbus_force_bit() directly from the
> debugfs handler. It already supports nesting with a count. You don't
> have to modify any of this code, at all. The debug logging is there in
> intel_gmbus_force_bit(). Everything is taken care of.
>
> BR,
> Jani.

The original intent was to debug a specific HDMI EDID read failure on 
newer platforms, where GMBUS reads were intermittently unreliable. To 
enable quick validation of the fix, I added a debugfs knob that forces 
GPIO bit-banging for the affected connector. As a result, the 
implementation was scoped around the immediate HDMIA/HDMIB use case 
rather than developed as a generic DDC/GMBUS debugging aid.

I agree with the suggestion. Since intel_gmbus_force_bit() applies to 
any GMBUS-backed DDC adapter, limiting the interface to HDMI connectors 
is unnecessarily restrictive and reduces its value for VGA/DVI debugging 
without any clear benefit. I'll generalize the implementation in the 
next revision.

>
>
>>   	drm_edid = drm_edid_read_ddc(&connector->base, ddc);
>>   
>> -	if (!drm_edid && !intel_gmbus_is_forced_bit(ddc)) {
>> +	if (force_bit_banging)
>> +		intel_gmbus_force_bit(ddc, false);
>> +	else if (!drm_edid && !intel_gmbus_is_forced_bit(ddc)) {
>>   		drm_dbg_kms(display->drm,
>>   			    "HDMI GMBUS EDID read failed, retry using GPIO bit-banging\n");
>>   		intel_gmbus_force_bit(ddc, true);
