Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16286C79F9F
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2026 18:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB8A10E64A;
	Thu, 10 Sep 2026 18:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDHEKD2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096BA10E61A
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Sep 2026 18:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789064871; x=1820600871;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3NTFfiyvzN3mj+81clSC291iyWnVwhilz7f+b0Beu+0=;
 b=PDHEKD2hVI9eZ/qnGGVm4tYMXlc9aii/cwqhakB/uKjitqvJJN79kJ1V
 FBMbiSHSFWgfCFlf7sjj+PSnsF7cTns+mrSH9/hqNYBaupqI4RtPdKeH1
 oIbpjs2BJURgdprRrEQglu0Jysz8BpP/rs6ALY8xC0bSV6ZKaybwHh24l
 U7XDFXBKF0U7uTf/JsFLSTM2ScY8wD7VYA7tZh2qC031a5a3ZffZ3wDQX
 Eg/jlqEXXQl+ncvzI7h2lXuTof6jxT9ubueQBjx+DZ/fA7lJX3Tc9O7cL
 VUOdS8ztd1rU2HsR2b8SM368VLRHTbVAMPM/fVh7cTQtRyBEJ7etj1wLE A==;
X-CSE-ConnectionGUID: uifEFjQPSJ+kzg0SslMsug==
X-CSE-MsgGUID: UNCk7UMlQL+BuL9cYIDHcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100118572"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="100118572"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:27:50 -0700
X-CSE-ConnectionGUID: Exl5x2/cTqSXOZ/HaWiZjQ==
X-CSE-MsgGUID: fCCA1/dsSrGWTrYgtREpEw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:27:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 11:27:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 11:27:50 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 11:27:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orEIQ2l50HUFUaYImNMHi58NM9eEPKym+WEjRMLBqlfpiTsrrJwZJx50XN8Z9Cnz5IXzKBg3yPP5vVYZyzlPk/lgesnDNDhzntx5Htcg3xTyz9NZkdSaLOyLHqZZ3UfRPWUPHvVN2zr+YdGh+SdsfmhAEpEGmBgwsF+sbZMD1XUiCXX9ltFTBsAAcnwUc+iTy1UW2SlZg6bw93+LjIQKyTqBgBZ1DoS3tkM842fkjG8cnF1JPm6+hAcAgxkg031xTkS/U6J6pTD/+6+ZZMC9x6d2D2ciU6NHfbCSXQjncsQoLEJ42UpLjcpeFBdazK5j7oBvKsupkFLkWzwftIrnQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+96CrN+OmdeskhqDS+Gjx6ywqeFGQadrWKT5xOej0V4=;
 b=E01+nK3fMt6zWMPJHkcga/u/GaszpzCV1jXJq/jkbTl4ewKkRLROTkx9Oq4HldwXSaFBvL6RXfhG3B4DnVp8Rfwzmmhut/du2NWmOzBB1gyOw0gpb+xQHwwzx9UIl/2FcH74BuLtwZFV0eQndJLousruT7tnmlOkHeBkC3Guxk81VHg0/VljjFbsD3PnbcYN5d9KAUbKZF0xSnZgYOAGj/CcLfXFk549EB6zFAgNaXCk4O3RE8Bx/GHRv9ckIuklnmg1F7Ivf2l21pmzK1egM+Tn726g3zijK7AjLCLMMGLsdXfzIM21AfWeaoQKwcXL7G/fqcCahJcf8tK/nZLnrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by EA3PR11MB864439.namprd11.prod.outlook.com (2603:10b6:303:30a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 18:27:48 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 18:27:47 +0000
Message-ID: <5d4535fc-7d8c-49fd-afe8-e0a64ad13a8d@intel.com>
Date: Thu, 10 Sep 2026 23:57:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/i915/hdmi: Add debugfs support to force EDID
 reads over GPIO
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20260826152444.2822821-1-ramanaidu.naladala@intel.com>
 <20260826152444.2822821-2-ramanaidu.naladala@intel.com>
 <e00778c3952491affb0a5e41f585122df5258acb@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <e00778c3952491affb0a5e41f585122df5258acb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::9) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|EA3PR11MB864439:EE_
X-MS-Office365-Filtering-Correlation-Id: 33dd83fa-e402-4e54-74bd-08df0f69369e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +yzEZ9lAcKUCzRsTVCAlRVgMHUVNqFNrFPssEjnEMAz3KIkkSQq5L8lFiFQNiJ/XtHjf9pQHaz4OYhw2GQFFicJQHqxeFgVIVrZfDyd2nP0ybktVxEOlnOBFaioQQ1+ln9/ldpabWAQoFVC0RbYL6TooMVh10i7MbrTzX3+d23RIi+vkjqqz1/4Pwjavjb6QvWvdxeYJ/T9ZBiPqbNBpEhIb+WXdGAGysf3b0DimqhctCaPpHt+oZB60bs+hXU75suoV5/H8y3KIN5gWJt05qbXqpgczAi9bWWW6Elmu89zlocExamQI6//aG6h9E8YD6/dTJ85VdIjE0mKQQVfpBtIgXrbQickDqSX/8n9pCPPytlZRReLjeOLC10qFL0kYG5JPr6nsTJM1u5O8cCbbafA24d1Y1F+FlhOiM5j81pfcx41ZzRV0AtqLKwXb8RR9X7xh+y7O3ZguVszqvN+MHLYZSu6LprGvBLy0eI89eBRh9oBR+sd0OJahMrkCkBvdidLhWqExw+ptuJmVUe8ODfprHWbAF03yW8ikqTkV1wQdBx3Qx3enJDfnV5DmgcfDWrHyQlmXbs/aZK5FBxpZWkdFT9ALtKk31ibfOwODWE3xMeVy7763ccPu29Uf8xf2/j/sxtOMuaeNlf1UW0zxkAjYUsivafA4DWrvaCqvfVs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHpoR21IUFB3RTVsU21TQ1ZDVGZnbUxORDFvb3cxQXBPcTlzRGFrKzFPSHQw?=
 =?utf-8?B?WWgxZlpJNGhwTk1Tdjk5K1FDb3hCOWg5cnZpRDcybUdmQTJna0FVV2VGVVVi?=
 =?utf-8?B?MlFyZG9ZM3EvY1Bkb29JS05wNENGRFhtQXFOdjZJTEppV1VxVzRzMTg0cm9R?=
 =?utf-8?B?SEFYWmd4RElTWnhmd1NnTlpvN2JOSFlCaU1jS1QwamRFZjQ1OXlLVm1HWEZj?=
 =?utf-8?B?bW01eUZVTTBoOEdvcm1UNlpvNHdKZ0U0RHpHMmVSRUcxb3JxYnhtNWpLbjk0?=
 =?utf-8?B?NlNQUERiOEJhUzdDUTRhUFVIOWpQNUpHWENHRzJ5U3k3bGhaRGd0RGNqZXF4?=
 =?utf-8?B?OUFWTWViQlFPQnZzNHYwZTdMNmVEREpoQ3JwaENRNW95TnNGSVlHb2xWZ2Rx?=
 =?utf-8?B?YW1BT1VGWk9BSzVHcTlSMGpUSmwzbEFrUXJnNTlMcE8zSFdyR2oyeUtRUU5s?=
 =?utf-8?B?akRCVGNPUUk5ZEl0MlozMXdqdEU1cVJPdjRvRTdtUkRKUXB4UFczZWx1N0Fy?=
 =?utf-8?B?eWgvZ2FDaEZySHBQT0trS1laeHByVHRNd0xUa2E4dGxZU2ZieldFdzhZdTlL?=
 =?utf-8?B?c2tKaWd4ME1Gc2lTRVdCZFpxekRTNHR2K01ZUW5ZcWtYaTRXWXQyNmdibHc4?=
 =?utf-8?B?WVJjSkF5U29MeWNUcUZnRGZpdnRHVjFSbml6eVRmTGN2bE5Qd1c4cG8rNUhp?=
 =?utf-8?B?Z2dNRjNsSWZOQUNvaW4xYk1VOEd5bzAyZmc5U0tDeUpqMkY5bXpNeXJZYllD?=
 =?utf-8?B?eWxlbk43N1VkRWdVTG1GN0dSZXVEZXI4eUhtRlNkTEs3OXhPZDRnSlk1UUlM?=
 =?utf-8?B?Mzhmdi8zN0dPUGh5RWw3UGQzWGdDOUJLRUgxSEJFbHdvOXdyd21qRzRLMUkr?=
 =?utf-8?B?RkpwTnV4Y3BPSVZsUWpvMnRFbm1MQ1pnMzJPQUQvQWEzelJJRXc5ODNOSDFx?=
 =?utf-8?B?YjgrSC9XQmdDVVYwdEgxTUpaZHRuNWtPd2t5OXJyZ2EvNWtvMStNQkJvVCto?=
 =?utf-8?B?SSs1NHNFdW16WFpvMVp6UkhDdWl1dVJaSDNJQm9ZNEFJNWd1aUtNTTVFRDB1?=
 =?utf-8?B?cmlVZE5LSkNBTkdxa2YvWmUxK1BqTHo4Z2QrTkx2bEZtbjdzOVdTaHRvZitH?=
 =?utf-8?B?N1dEUHdzVW04a1dYY09PZHRxTHh0NXN0N3I0MU9RRXZmNUdVWHFSenY4MmRC?=
 =?utf-8?B?QUtweTBYbDlpR0pHaUlUYUFPKzd6R1NLYWNTWHI1bFdvck9DVWNqczBmaGNU?=
 =?utf-8?B?ZDh6MnJJbk9sRm1LWUQvMjVLdmlzbmZqOFNIbWZDYTFiOXlnaVJQeGtUbk8r?=
 =?utf-8?B?YldPTDJyeklXZUFnT2JKblh2aENESVk2QkRVaUYwVDA5V0g5aXdKdkNQVGVa?=
 =?utf-8?B?UjV3cWxDeUdkZ2hwV28xejN1SzhsRytIeW9mMVVsUDJkeTY0dXFnb1YyU1hV?=
 =?utf-8?B?QlV3VUFNTCtDcEdMQXVKOERlY3A0SlkvQmlGZFNGclpCbTBGWlFOSzU4MHI2?=
 =?utf-8?B?STZ2L0hRWmpTMVFrbXp4SDY1ZFRDVDN1QS9naUl5MXR1RDIwcnR1SGR2clRU?=
 =?utf-8?B?cFU2OTRnS1BqdFcvb2tFbW8vcnlQNS93d1RpbjM5bUZ4VEhYMW04ZURhMDZy?=
 =?utf-8?B?c0lyVkNaSnFwaDJlcHQ1Z2NsVis0NGN6aXhjQVZkVnNxZEZhT1RoRTAyWDJU?=
 =?utf-8?B?MVByL3k2QzRGZnNBY0FQRFFrRWZMd0hwK21tTHdSSUJrSlBLaFN6VjhHZUhL?=
 =?utf-8?B?d3RGTng5ZzBCWVJqZzlGaTlqSktQaUc0L3F2RzBSZGYvTk9IbC9CRWtjdmNu?=
 =?utf-8?B?aGZSTURKLys2VEFVd2JpYXAzRE56Z0hjaXJ5OGkvSlpoN1J2YXRJZzlBL2sy?=
 =?utf-8?B?ZEJWQU5kTlN5T2tvSXNXVm1mOEVWQTVlVllKMzYvd3pvak1Gb3piMkRRdHd5?=
 =?utf-8?B?dmwzRkFnTU9MOWVpZ1lBTHJCMmRCNjMvdG5aUzA2VGc4SW9YKzNFdDZPSmVk?=
 =?utf-8?B?V1BmVURzWWFhL3MxdnVyNFNRQUZ2M3RtQzVNWFhzbEJ3T0xaOWwxQXIrempQ?=
 =?utf-8?B?eFppRjBqQWtGWkVjY1hOdEl5Q0FiNkh0M3hDQVlRa1VNcWpKQ1RhcXN0MGhH?=
 =?utf-8?B?Yyt4b2FCdGNIWjhUVC9GbUlCNStFVnVobTdNSFVwazVXUUE0cGtLQk5EMHpR?=
 =?utf-8?B?THFYbmpFTzNieTY5S3F6ck9ETmdnMDc1RWRRZDVTTllNVlIzZVBtSXlRWHJG?=
 =?utf-8?B?SExLTnhySmFacmVNZVVTSjYyZnpzUEtwWEVlVUhHcmYvdUk5VW5mVGxLT0w3?=
 =?utf-8?B?UnpSNzY4bVAxaVg0cHMzaHJTald2R0lBelF4RVRsYXdZSW90QkJkZno0MmVh?=
 =?utf-8?Q?/qrzmEDljhkCWutU=3D?=
X-Exchange-RoutingPolicyChecked: DQ8fouQ8dzAN0bbU/Cb62chedBkDSYOTgCBRDSLlvyKWKRhyKYmq795Lhhm/0SK1JyaRy9ddJ8GT3KoVvjk9fMaQDG9131KEc+TyeY58KM0LH/xYBwOMVmlIaQrqlp/INcQoek3XjTQO6Vu+ng900TFMxl5ZhCnMciAf9ttjU/tedjP/KHDooHfqO8VuszVzyUemLEGQ2VAb2G4iv5ws2pcPHz5/jDqMCey7raYjgXhG+JiuNLDjcnEUXKHZbblbfcxAQte6iIgYvSNz6alO/5GTlkGBGgn1bUOYoQQ9IhL/HFZWLkhBjKO6TFbW8I8cjPM18WVIGtaqLmVT7rFktw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 33dd83fa-e402-4e54-74bd-08df0f69369e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 18:27:47.6214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TayW/3GmJz7nBgA1Xt5agrJK8XlUq7appz4Lg0OZznUdDUCb8d4ODBKb0JCJtBg7kPW1NfQaTQegrboNa6gjubTFO5V4Z8bzQ5ZCkkEaeQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR11MB864439
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

On 8/31/2026 7:19 PM, Jani Nikula wrote:
> On Wed, 26 Aug 2026, Naladala Ramanaidu <ramanaidu.naladala@intel.com> wrote:
>> Add an i915_hdmi_force_bit_banging debugfs control for HDMI
>> connectors to allow EDID reads to be forced over GPIO bit-banging.
> The primary question the commit message *must* answer is *why*.
>
> It takes me under a minute to look at the patch and deduce the *what*,
> and even that does not match the commit message. There is no support for
> actually forcing anything here, it's just the non-functional debugfs
> being added.
>
> I still have no clue why.
Sure. I'll fold this 2 patches into single patch and i will address it 
in the next revision.
>
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   .../drm/i915/display/intel_display_debugfs.c  |  1 +
>>   .../drm/i915/display/intel_display_types.h    |  3 ++
>>   drivers/gpu/drm/i915/display/intel_hdmi.c     | 51 +++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_hdmi.h     |  2 +
>>   4 files changed, 57 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> index 3e302f23f247..c991f224b4be 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> @@ -1335,6 +1335,7 @@ void intel_connector_debugfs_add(struct intel_connector *connector)
>>   	intel_dp_link_training_debugfs_add(connector);
>>   	intel_dp_link_caps_debugfs_add(connector);
>>   	intel_link_bw_connector_debugfs_add(connector);
>> +	intel_hdmi_connector_debugfs_add(connector);
>>   
>>   	if (DISPLAY_VER(display) >= 11 &&
>>   	    ((connector_type == DRM_MODE_CONNECTOR_DisplayPort && !connector->mst.dp) ||
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index 20a07ea06b5e..58983e31c5ef 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -1689,6 +1689,9 @@ struct intel_hdmi {
>>   	} dp_dual_mode;
>>   	struct intel_connector *attached_connector;
>>   	struct cec_notifier *cec_notifier;
>> +
>> +	/* Debugfs knob to force EDID reads over GPIO bit-banging. */
> Is that comment helpful?
>
>> +	bool force_bit_banging;
>>   };
>>   
>>   struct intel_dp_mst_encoder;
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> index 9b637e38a1a5..38915f19d3e5 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> @@ -26,6 +26,7 @@
>>    *	Jesse Barnes <jesse.barnes@intel.com>
>>    */
>>   
>> +#include <linux/debugfs.h>
>>   #include <linux/delay.h>
>>   #include <linux/hdmi.h>
>>   #include <linux/i2c.h>
>> @@ -3112,6 +3113,56 @@ void intel_infoframe_init(struct intel_digital_port *dig_port)
>>   	}
>>   }
>>   
>> +static int i915_hdmi_force_bit_banging_show(void *data, u64 *val)
> Please don't use i915_ naming.
I will drop the  i915_  prefix. I will rename it in the next revision.
>
>> +{
>> +	struct intel_connector *connector = to_intel_connector(data);
>> +
>> +	*val = READ_ONCE(intel_attached_hdmi(connector)->force_bit_banging);
>> +
>> +	return 0;
>> +}
>> +
>> +static int i915_hdmi_force_bit_banging_write(void *data, u64 val)
>> +{
>> +	struct intel_connector *connector = to_intel_connector(data);
>> +	struct intel_display *display = to_intel_display(connector);
>> +	struct intel_hdmi *intel_hdmi = intel_attached_hdmi(connector);
>> +
>> +	if (val > 1)
>> +		return -EINVAL;
>> +
>> +	drm_dbg_kms(display->drm,
>> +		    "[CONNECTOR:%d:%s] %sabling forced GPIO bit-banging for EDID reads\n",
>> +		    connector->base.base.id, connector->base.name,
>> +		    val ? "en" : "dis");
> I see this cute "%sabling" and val ? "en" : "dis" but it's just too
> clever for its own good. str_enable_disable() is close enough.
Sure Jani. I will fix this in next revision.
>
>> +
>> +	WRITE_ONCE(intel_hdmi->force_bit_banging, val);
>> +
>> +	return 0;
>> +}
>> +DEFINE_DEBUGFS_ATTRIBUTE(i915_hdmi_force_bit_banging_fops,
>> +			 i915_hdmi_force_bit_banging_show,
>> +			 i915_hdmi_force_bit_banging_write, "%llu\n");
>> +
>> +/**
>> + * intel_hdmi_connector_debugfs_add - add HDMI specific connector debugfs files
>> + * @connector: pointer to a registered intel_connector
>> + *
>> + * Cleanup will be done by drm_connector_unregister() through a call to
>> + * drm_debugfs_connector_remove().
>> + */
>> +void intel_hdmi_connector_debugfs_add(struct intel_connector *connector)
>> +{
>> +	struct dentry *root = connector->base.debugfs_entry;
>> +
>> +	if (connector->base.connector_type != DRM_MODE_CONNECTOR_HDMIA &&
>> +	    connector->base.connector_type != DRM_MODE_CONNECTOR_HDMIB)
>> +		return;
>> +
>> +	debugfs_create_file("i915_hdmi_force_bit_banging", 0644, root,
>> +			    connector, &i915_hdmi_force_bit_banging_fops);
> Please no new i915_ prefixed naming for shared display code. Please just
> use intel_.
>
>> +}
>> +
>>   bool intel_hdmi_init_connector(struct intel_digital_port *dig_port,
>>   			       struct intel_connector *intel_connector)
>>   {
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
>> index c95ed37bcc0c..752cccf5ccee 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.h
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
>> @@ -78,4 +78,6 @@ void intel_hdmi_poll_for_scrambling_enable(const struct intel_crtc_state *crtc_s
>>   int intel_hdmi_sink_max_frl_rate(struct drm_connector *connector);
>>   int intel_hdmi_sink_dsc_max_frl_rate(struct drm_connector *connector);
>>   
>> +void intel_hdmi_connector_debugfs_add(struct intel_connector *connector);
>> +
>>   #endif /* __INTEL_HDMI_H__ */
