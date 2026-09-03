Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A4DC624D4
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 06:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D7110E4FC;
	Thu,  3 Sep 2026 06:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CYjhXqqY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C559F10E4FC
 for <intel-gfx@lists.freedesktop.org>; Thu,  3 Sep 2026 06:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788416034; x=1819952034;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=J/mcbwIj8MmB+pUz3mKmoGdwUu39rRMYgzALyuS9yFM=;
 b=CYjhXqqYx6Z8gM/Ss56e5hhP6WSVHO9bObtZhdPXAck98l+LW3bv0uG+
 if8lEU6mQMHFWwi1SOm222xPhJtOzws4kczG0NynAc3AgXX3Yl8C98c1G
 DW3esB4jYBmakMb5vRbFfRHgpxpvXPtkEtNjRLkb7q0T7yvbp+vvxg2lH
 VWesHQEGwPTNrFVZr0SpwVmsM2N2TA7CWuIswzeLD38n/RWo6bVr3rPAp
 zw4Y082JQnVy7cFm+M4bfryaGzN/VA2/fPEk9TCzQ9g80hZsCyhyG+ieb
 6ch53HSw0ZU10BgnFcJsVlbQbn0VkoaXxyUsaflYZTofsXYCgAYKsKLNR w==;
X-CSE-ConnectionGUID: Y6nPWCocTUK13gHg2uR8UQ==
X-CSE-MsgGUID: MHdvoU5HTLSAhgsWJhI+dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92705048"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92705048"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 23:13:54 -0700
X-CSE-ConnectionGUID: WS05J5ApRkGYE6xVQ+vq0g==
X-CSE-MsgGUID: 14mPuNomQ1KNd6L8O+VorQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="268291191"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 23:13:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 23:13:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 23:13:53 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 23:13:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fgc84/PpBDpELK4CJpnKj+zbey8KEAK3MVibvymhvtHlgnyd1y48byoBf6HgRQ+dJafmggY0qfjj4xCDPgKXY+q37/l1dzJ/aXJID7Y3qWTHQ8cE4zEsouN1/gN18fHx9PdxUMu+a4iCw50Gx2a/uNVvtP6MmejccVQJhDNgZttF78jlsh+I1ZAltRM2z4eaYjO99WjPjCAi48gwpfjym0sR9Y5wRHC7tsyXUiWurhdFIFnPCHk3QMUCadqYn+ch74I9Q0nqIZrbhwD8NFOOXa4fybiPUSF6/qGEUTYLLoWUSthKQtMfd28LPmhk51KTPfNqIEwyb6csNCOFF27FVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulmxc2b+ofyriPuRxe9QA+3eFGDaO41IwGDIBXhbiu8=;
 b=dyM7g0FmpDo2WiYHjSwYO8CEvt7PTHxZ/DdhzF372NgTddT+rZ+7epNGQm+hUP/l+pvRcOEmUQiozo9qZaQ855F9fGVwveq9RUJzbU0p93cj+taJjuBODsCiPLWb7ndwyMPWJzl4g7mAwwuUxz1114irsM1gSEnl+bLcUeQzoaGzN3VOS8tQN9I0kD316zrZq/H/DkU8JroDIcJWvca0F6a488Cw1JUMMfYAwQ/lrVTH/n6cX9IeHlsQhMIz5GjAJtYYnUMtAiu6jt+KgkNyOY31j4HbrHjW36wQrEY4s5UARGLiVPNKqxYC5EoQgAjbEQhkXnF1qT5tQjoR6/kAyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 06:13:51 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 06:13:51 +0000
Message-ID: <774acd92-0941-4b44-bf21-181e4063757d@intel.com>
Date: Thu, 3 Sep 2026 11:43:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 1/4] drm/i915/display: Enable periodic AS SDP skip frames
To: <intel-gfx@lists.freedesktop.org>
References: <20260831213421.1804635-1-uma.shankar@intel.com>
 <20260831213421.1804635-2-uma.shankar@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260831213421.1804635-2-uma.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|BL1PR11MB5254:EE_
X-MS-Office365-Filtering-Correlation-Id: 55cb9c09-159b-4b7d-d8b6-08df09828618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|11063799006|22082099003|18002099003|6133799003|4143699003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: tPViKtecHeuC68wcCvQbZU2gfsWbIYA2LjWCWQDR/zcK0TXmKt77Qg7PDd9mo56UDt3zMl9fVivi1R1G6LHi2QtN6At8EZB3lhLLuCqD84NVurQYM1iIErcz1XPKt7SBgSlfmnXoTC0gqBMoSfjC4HiMvqlnj8ZgapkwhLtnNCSbElaAdzsruPDqw7M5qPl0fUmlXLG3etZJgaot158rqSMU7+ddvdKKW4nx2dU1FPhTws8nNIeGl99LAndobKgKCpDokmD6EzhcmmS37AdtzpR4i3IsKzt/HTs6ViJGH3TfCwi3kvIeLPfP2A5TvdQinU+i0ElI/AJL7ZhShPYf9pru7FkXUNZQ87GHRFjyaBcdESFHGXVSLUgALkLlOOzFMgbDDya967oNbpNpGhU7jB9hHBsO1wGA/ZpkINnS1+a9pZWrOoWEABz+DafuqxgnVmyTdOBEL2mv2ABkU8blj8HxBab3lazfap+h6TodGWzFfHb9eYZTt5m8mWDXK6XI8QgdUwfSHECxdYOpgtsAzuQaCEgZRfbN8t6WDO7pRCBn5bJY/gdIdKm4W/2SieMYTIfVPWNvs7Y1RGJeI6D3b1LDhJWupNS3/ZbTYOKgramG7V8UKARwiYoUaaPiuotBXd4QtTAvw2xywxP7SP+mc9auoFe3IorKLYoF2s8XmrA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(11063799006)(22082099003)(18002099003)(6133799003)(4143699003)(56012099006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFhrSTA1Y0Y4cGhkYzhGVkhFVEdZZzRUczE0QVhqdm5yRDdPK1VWOEtXNDdU?=
 =?utf-8?B?bHkrRGtmSVFCeXN6cGpKM1VWdy9qVzZxck9JUFlQTVdZMjRjbWNpaFdjbVp0?=
 =?utf-8?B?ZnBBcjJyTUlUNEoyKzB3OG15NmxjSUczTUtHbGQwcXF3Y0k0aFZTUnJvQUM5?=
 =?utf-8?B?eW5kdWd0S2NRQnJBcjEzNS9JZkhsN1lYMnhBUkhFL3FxekNUdSszTXZrd08y?=
 =?utf-8?B?ZkkzTThJRkhTTE0wRExVNXphODVabFZ4eWNCdWJhRXl6SnhDVmcweG1kSytm?=
 =?utf-8?B?N0hDdEVtNGxaMlM4MDhHU3NjWTNTQ3VyS1VtcjY3Wkk3NXN3bE1EQSt6aEt6?=
 =?utf-8?B?dUNERFhkMlM1NnVJZzRVQ1dMbVN6T2w4THhPVldkbzhxQlFnYzFibEdBMlNO?=
 =?utf-8?B?WkNtNzN2K0lUY0xRUVVPL0k1bGQxZDNpdk1GWGJtazFoeXY5YStLNTVHeVh2?=
 =?utf-8?B?dzBxNDV1YUN6RTJWNldZWUMwdVM3OUZTWWhydFBlQit1QTBNNVNCTkt6MjVl?=
 =?utf-8?B?Z2VteHViUmlsVW1tVE1CZzE3My9iNXRUN3FSNEpmSnNDNTJtY2FSVWdYU2t5?=
 =?utf-8?B?ZDZPQzhmcDcxSTBEMnRoZ0FQNzltL0V6WmtYMlhGenRhNDJxTndNRHhRWlNj?=
 =?utf-8?B?bWM4aThIdFFsZHJhaVBFV2g3ZERhUmFLS0IraUhKdGlobTEvRHNrc2pJMXhT?=
 =?utf-8?B?bmpsNWVkZzdhU1UwY0dsdG5aTWdpMUt4RmR2MU8xdmlpazhQTWdVaWRqdndt?=
 =?utf-8?B?dllsdGNyTURpWTJmTGV6RlVybC9kZWtvUlV0amRER3U1RHVkSmZUbUt4Y3hv?=
 =?utf-8?B?ZXkyL1FTdEtEZzJMcGQ2dGZWOWswbHJYUFpTSzFzYW01K2Nva1BlL3dPY2Vn?=
 =?utf-8?B?UGxpSTUyVDVjOG83WWtVdHlITUIxd2dMUm85Q014czNBZy9YY1hLY1F4Nm5D?=
 =?utf-8?B?b3BSRGMxcXFDQnUrd2xvNVVOZy9qRExDdWdNQmRrYnptWlRWb2ZoQXRHNjV5?=
 =?utf-8?B?QWsrbnh0TUIyTTBRVlJrY1ZwQ3JUYjNpMmlRRHlpTm0yS2NyNC81SXNYYVp4?=
 =?utf-8?B?Wmt0UFV5Z1Z6SGJyUVorNHVOMjZVbE5Eek13dW1JdzdBUW40Q1huUkJ6YTQ0?=
 =?utf-8?B?eHJTbHByZVFrV0o2M0drMzA3aDhyczkrdy82Zm9xTysrK1hxc3RSVVR3ajBl?=
 =?utf-8?B?MFhselZjODhIS2NEUncxYXRNQ1k2OGV3Y3RzWDZ3ZExnUHJ6aTVMT3p2VUlZ?=
 =?utf-8?B?WGh2OWRVUFFDNHRjTUVYS2pRWWQ5eExudXhzTWo4NU5ZVmEzMHlDRnJLZGJH?=
 =?utf-8?B?VGh3bWxJajg2cXFNVk9pRnBQZGF1OUg3R1A2TGhMWGVYdjhGcUI3ZUxYdzlX?=
 =?utf-8?B?Z09wS3dUMkRnNlZZcTdtSlZBQ3F1R0JTWFJOY2h3djhiVVlEVWFTdVJNZDI4?=
 =?utf-8?B?QVc3ZXhweFB1cDdFdHBaQTB4S1RmQ3VSbDR0bXlBbTNpTS9GdC9uL3I5MGtk?=
 =?utf-8?B?VnM2eUFueTNBZWdjYkZUdlJxS3NhbzJ4RHREZkgxb24zbTI1WmZKR3NYa1FX?=
 =?utf-8?B?SVV0cUh1NnFyQ3VzNy94UDFJNnBGQTNOZGo4SVF4L1VlWTB2WGxUSStDVGF4?=
 =?utf-8?B?YXVKcHFpOHFRaWJ0OCtQWUVLM0h1QWhaL3FqUTJlUkNEbTJYemZVbGRkckFa?=
 =?utf-8?B?YTdRam1ITkxCNlRkQmE1RXdQQW1kVDhTR2tKZlBsZDcyTmpoZlBwM3UzOHlT?=
 =?utf-8?B?aWNTMU5qL2htT2NjcW1BQUZIQTU2OVB1SlhpUE92VFdLb05SUzNHelpGUmRJ?=
 =?utf-8?B?ZVIxUWVaQmU0U3d3WTFyYndHWkpZc2wzTkI1TUlPMDVWZFhqTFkzVWF4N0Ju?=
 =?utf-8?B?dW9tM2dBM1ZVUmlxSTFRalJpZ2Ezenc0ZnZpWDF4a210dlpkSUdOZThrS0RK?=
 =?utf-8?B?bDhPb3d6dU5OYjNidnVjRHd6RzU4NERKK0d3dG1QNjZ1OHVpQVl5VVoxYnV4?=
 =?utf-8?B?VEpQL1lUNnVBUnduVk8wcTd5azVkMkNQUWpXQS9rcVFGVmJ5Q1pXdThHMmdJ?=
 =?utf-8?B?MmcvNEtuN3FCcnZuU3U2WVAwd1pQWmViSHNhUGgzTFMrMCs2ZjFGUm8wMDhM?=
 =?utf-8?B?ZUhmMTA3YWtEUURJMFJOTUd0TVM3SFVCRmRHZDdoajkyVTNKMEZ2eGMrUVJ1?=
 =?utf-8?B?UnpDNS9RQTZZQnBGVElOT2NUUGhxV0lpRS90N2craElheUxhNDNRWjVSZ3ZD?=
 =?utf-8?B?S1RETjJoWExRb3oyVENOSFVlcGpyVlFzUnJ2eXBOc3ptY3g2Yjl2Q0wxYVJQ?=
 =?utf-8?B?bnUvS01GYTJZTjdRMlhta2E2RHpmVnovT25KVUxQcEZWZTA1RzBBVkU3UzJa?=
 =?utf-8?Q?KFVw4GGeH2o7ioEo=3D?=
X-Exchange-RoutingPolicyChecked: xdccLmOw6iowYlpj0b56Vs+1De+u2jzGRrQMxg9gEQ2t7P/xhDzs3ibAYPtl55kegPWV8+ZkHRPlxZlKO0GVBM+n2HM+F4F4TGuPxAO5+7t3kMZeTMPnQ5yaIhsdwJA65y7NrmVj9z4lZySuDhO+NdlezyPJSYFA+33cQENEVXbDWfzXVTiy9fMFzuLsQLR+t/ewd6hBlnFdfu2bK4jJ24H//cc7vAe6v553woXDBg+gnwxn4q4r35/jLeqhIAQwOpIQCGwTa1JF/JKF48WbOfaAuF97xcEaitoImJj4Q2iHd8nSRLfvBAFeCXERPX2GKmdZ2gjoosQVn66R3h2Tgg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cb9c09-159b-4b7d-d8b6-08df09828618
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 06:13:51.1467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZwsW/nct9XuNKghySidD5kYv3qA+BJu2eet7wQShuWxB5dnDu3oSgH3fSwMKe5tvENHIDSrzRzS83syld2NU7Z+Bmy9T7TRGF55HCvd+Ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5254
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

Hi Uma,

On 9/1/2026 3:04 AM, Uma Shankar wrote:
> When Panel Replay is active the transcoder timing generator runs at the
> panel's maximum refresh rate. To drive the panel down to its minimum
> refresh rate the Adaptive-Sync SDP (AS SDP) only needs to reach the panel
> once per minimum-rate frame, so transmitting it on every (maximum-rate)
> frame is redundant and shows up as repeated SDPs on the link.
>
> Xe3p_LPD adds a HW skip-frame counter in PR_ALPM_CTL that lets the source
> send a single AS SDP and then suppress it for a programmed number of
> frames. Program this counter so that one AS SDP is followed by
> (max_vrefresh / min_vrefresh - 1) idle frames, i.e. one AS SDP per
> slowest panel frame, allowing the link to be driven down to as low as
> 1Hz when the hardware supports it.
>
> The maximum and minimum refresh rates come from the panel's adaptive-sync
> monitor range, so the skip count is a function of the sink's capabilities
> and independent of the current content/flip rate. If the panel does not
> advertise a usable range the skip counter is left at zero, i.e. the
> feature is a no-op and AS SDP continues to be sent on every frame.
>
> Periodic AS SDP drives the panel down to its minimum refresh rate on its
> own, so it is only programmed when VRR is not actively driving the
> refresh rate.
>
> The skip-frame mechanism relies on the AS SDP still being transmitted
> (just less often) while Panel Replay is active, so when a non-zero
> skip-frame count is programmed both
> PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE and
> PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL are left cleared. The previous
> behaviour (honouring disable_as_sdp_when_pr_active and the DC3CO idle
> protocol) is retained for the non skip-frame case.
>
> v3: Fixed Sashiko review findings
>
> v2: Decoupled CMMRR dependency and using sink refresh rate range for
> skip frame claculations. This addresses Dibin's review feedback as well.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_alpm.c     | 61 +++++++++++++++++--
>   drivers/gpu/drm/i915/display/intel_psr_regs.h |  2 +
>   2 files changed, 58 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index f1383764b702..a6838e0fd3aa 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -375,6 +375,35 @@ static u32 get_pr_alpm_as_sdp_transmission_time(const struct intel_crtc_state *c
>   	}
>   }
>   
> +/*
> + * Periodic Adaptive-Sync SDP skip frames.
> + *
> + * While Panel Replay is active the transcoder timing generator runs at the
> + * panel's maximum refresh rate. To drive the panel down to its minimum
> + * refresh rate the Adaptive-Sync SDP only needs to reach the panel once per
> + * minimum-rate frame, so transmitting it on every (maximum-rate) frame is
> + * unnecessary and shows up as repeated SDPs on the link. Program the HW skip
> + * counter so that a single AS SDP is followed by
> + * (max_vrefresh / min_vrefresh - 1) idle frames, i.e. one AS SDP per slowest
> + * panel frame.
> + *
> + * The maximum and minimum refresh rates come from the panel's adaptive-sync
> + * monitor range, so this is independent of the current content/flip rate.
> + */
> +static u32 intel_pr_as_sdp_skip_frames(struct intel_dp *intel_dp)
> +{
> +	const struct drm_display_info *info =
> +		&intel_dp->attached_connector->base.display_info;
> +	int max_vrefresh = info->monitor_range.max_vfreq;
> +	int min_vrefresh = info->monitor_range.min_vfreq;
> +
> +	if (min_vrefresh <= 0 || max_vrefresh <= min_vrefresh)
> +		return 0;
> +
> +	return min_t(u32, max_vrefresh / min_vrefresh - 1,
> +		     REG_FIELD_MAX(PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK));
> +}
> +
>   static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   			       const struct intel_crtc_state *crtc_state)
>   {
> @@ -399,16 +428,38 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   
>   		if (intel_dp->as_sdp_supported) {
>   			u32 pr_alpm_ctl = get_pr_alpm_as_sdp_transmission_time(crtc_state);
> +			u32 skip_frames = 0;
> +
> +			/*
> +			 * AS SDP skip frames field only exists on Xe3p_LPD+, and
> +			 * periodic AS SDP is a Panel Replay feature that is only
> +			 * used when VRR is not actively driving the refresh rate.
> +			 */
> +			if (DISPLAY_VER(display) >= 35 && crtc_state->has_panel_replay &&
> +			    !crtc_state->vrr.enable)
> +				skip_frames = intel_pr_as_sdp_skip_frames(intel_dp);
>   
>   			if (crtc_state->link_off_after_as_sdp_when_pr_active)
>   				pr_alpm_ctl |= PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU;
> -			if (crtc_state->disable_as_sdp_when_pr_active)
> -				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
>   
> -			if (intel_display_power_dc3co_allowed(display))
> -				pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> -			else
> +			/*
> +			 * Skip frames needs the AS SDP to keep flowing during PR
> +			 * active, so it is mutually exclusive with disabling AS SDP
> +			 * transmission in active and with the DC3CO idle protocol.
> +			 */
> +			if (skip_frames) {
> +				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(skip_frames);
> +				pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
>   				pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> +			} else {
> +				pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK;
> +
> +				if (crtc_state->disable_as_sdp_when_pr_active)
> +					pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> +
> +				if (intel_display_power_dc3co_allowed(display))
> +					pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> +			}
>   
>   			intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder),
>   				       pr_alpm_ctl);
> diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> index 16a9e3af198d..bb577e7e3bbd 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> @@ -276,6 +276,8 @@
>   #define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1_OR_T2	REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 0)
>   #define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1		REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 1)
>   #define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T2		REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 2)
> +#define  PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK			REG_GENMASK(27, 16)
> +#define  PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(frames)			REG_FIELD_PREP(PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK, (frames))
>   
>   #define _ALPM_CTL_A	0x60950
>   #define ALPM_CTL(dev_priv, tran)	_MMIO_TRANS2(dev_priv, tran, _ALPM_CTL_A)
Tested-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
