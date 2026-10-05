Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6F5CA5FCE
	for <intel-gfx@archiver.kernel.org>; Mon,  5 Oct 2026 07:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C1D10EBDD;
	Mon,  5 Oct 2026 07:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MlYUadUP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2012810EBDC;
 Mon,  5 Oct 2026 07:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791185717; x=1822721717;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PH5OthHubCXeGUfAwFzSv8858qXgbPwBauyRUJ2G3hg=;
 b=MlYUadUPgm6f1rXmhkiBDCc9dZGG7calXsdkVepeHf9Do4kVI41+Z0um
 xw10tMVFKM6Q2W2yoNFP9dVoWyZWCTKJfkcmjVHvri35JSTXNfE826oDC
 cBxcORwOfHp3jmUlw6sr1tH+MKv6SILdyM5OE6jWGrjVL57BOR5JvRWYx
 tTF0zkHPmwzD6pK1niP4JtV+GypF6zC84jZIjvTLamvLt+rdbS3YGeOun
 RcaMBpM3OWl8/EuKFwd0lAtarJobnxEPpfodBHcq/YjkeqAYOk6IRCBMB
 YArItf+zi5s/C9GbHQjR2SGBeXSbJSzanSnIVC/v1YH1bbf79JgFoHKJ7 w==;
X-CSE-ConnectionGUID: RQlMoPlqTVCehDTQazsJYw==
X-CSE-MsgGUID: xXSzGmlfTuWJvYlG/c/iMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="79408255"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="79408255"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 00:35:17 -0700
X-CSE-ConnectionGUID: ddsPz5y3QfW79A7NEg+ZoA==
X-CSE-MsgGUID: D7KVdaJvTCGE4YdWANtDBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="306258264"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 00:35:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 00:35:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 00:35:16 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 00:35:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcvA41e3r7s2RZDbs8P/9CQOZ8wbadhBi2l3W/0pHl4LXpA0JZio0AQuhvEdgGvrhJVj4aKPCwBWz5KlO9nwGKeXzHSPPntzYyNllIBEg+hSCIAcV0EJ9HYdCrTPU8Pn0igH9fc7Sq+hU0qwfS7zHT9eZWtr0s60D6rYw88uFjgJCB3XqpryBlUXQCl0vQpQhFnd7Cd01d/mUWxqRtmMtAaYU/s+4/99kaW3zKs+4ju1wX/HfQrT1/FKJJtOf32uP+dfOtlwmwwNEBiJTqKn3T+kupx51cOD4GsSImvkApWFLQVMQO24L3aITFp845GvBZ6A2s5OOmleu+kqmhBVvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtTMWjley0pAvSPhqi62S1qCuy+U44InoiHumXtLgzg=;
 b=nPQ6zD3JlUJzPuTXT4joJEHZeWsIWFzAcXRr7/u1yyg8XFVcfqPSLtiqgbTMdxwpOQP/tVjs78jJUwx/va78VKgJjVVEDTfQxr4RRGkw84ILKvRZylZYNjeJvUzVAEFBGWdWBzyQJf9ndtz1ehaN34TQWbRQG/jsOeluJS0N5SNOECC4RqXKyKK3SFgaCscImF/BUGChVbJaSXAZFPvPyHvU3oIMZK6FdWjbL6NtjqMXkZvtILjtGX/miNFG3MRp4Ef+/+2ZOqmciIBt8qgVhf4bvVsTaO5EQWwwfSOXypm/rwiLxzcktmDm0/NKLORmaqaGs2fYvdhu3jGRF/5mDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Mon, 5 Oct
 2026 07:35:12 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0472.015; Mon, 5 Oct 2026
 07:35:12 +0000
Date: Mon, 5 Oct 2026 07:35:02 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 iommu/dma: Catch scatterlist length overflows
Message-ID: <j4bqc4ege7tdtictkomgcg5fjxtknlwq3qhjkuyqxn4eemjevs@mjkdrkgpczv2>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20261002053320.3145901-1-krzysztof.karas@intel.com>
 <179092448995.231753.2668783847303564171@61270ab9df2a>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <179092448995.231753.2668783847303564171@61270ab9df2a>
X-ClientProxiedBy: VI1PR0102CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::35) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SN7PR11MB6750:EE_
X-MS-Office365-Filtering-Correlation-Id: 443b3750-5a7f-4ab4-0c33-08df22b330a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|13003099007|22082099003|18002099003|5023799004|6133799003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 8ROdFjbH64mXov38dSYaS2/N7I7EWFu2uDxT9cgQoW3nInXZt7q807X9JP9BuHaxMXGREQGywlkoAAlG0YRrqe8MFALuTnles98gueT1RxINayVDDn0BXz168f77lko9jQHafEkDD4dhEqA31t+HqWT0ND5nc05eLbXxrOt59MBw3DY2NOgapVh2Z1cyoEXL27Mt0fv1mxnJv1eeU2fsL+W5lSY5GKK90zvVO3CwDoetcpW8EZHSBEpGLFK4cAQ1bEE+sQgZ53dzomOh+om44EUqCXS7V4DFwu1yzBQzIexMsP++/+RpFuJJach/h+4Yu+tqO5UqtPD6hPxFz8OVSagPYINeZwz5eFewaiX527OW3b97oNv4er5FA6X2oXtpFAmDqGdTk8qWIr91oaX3ijrIdcXeHTNar9og5JS2+SaV3B9KFlXyXGhzVT9sz+Te184jq2CuLodzqhuaeNAT2SucQ2SCYeNqxg9m1LuHXjgQLo83NTLScyYqjDqQcDO0izukzAoJPZ8921BpEDQT/VNwB82S53yxUgDaJeQWysz0z2gyivNpy7muqGfc+mFYEmnSD6LxwHZpKHl0Y1udXVlSkMJCesBlFAFfQmdPbME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(22082099003)(18002099003)(5023799004)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3oyK3lJbzdRZ016VHlvVGJ4a2o3S2dzRnhIQlJHMk9DU3g5WWdOMlFGWC85?=
 =?utf-8?B?aVAzSEoxMHRVNDJKWkVYeGc5ZTVzSzRyb3p3QWJYa3oxTndrZEhHeHd0YjNi?=
 =?utf-8?B?cytJTFBxNzN0NURSY2RHQkJQaEtXUnBHZVpvQitRMVpaeGd4OWhIUjl4M0VQ?=
 =?utf-8?B?YUVuVjRDV0lvOTJXci9ZZlkrVUFzZ2FlTzlVbDRTaTFCNnMwWGZoaERpV0Yx?=
 =?utf-8?B?clppd0w3VlNUcTd2a0NTdXA4TWtpWHpPVk9YdHlsTXM1WnExMGtoWU1Pem5v?=
 =?utf-8?B?YXlybXZ4aGQ0MWp3MEMvSTFCSUlVcFhVUUZuaHJ1VnVES2dySGc5NTg3V3hs?=
 =?utf-8?B?Y2hSUklONkZHOEF0aXBiN05zbC81QW10a3BOUDVGMWpkcG15TEN3WG1YU3RH?=
 =?utf-8?B?cVNOekk2eEdWZ0ZPMzhra1o2QmNmQjFWT2dQSmdWVnZLUzJ6TUhOVXFNbTYw?=
 =?utf-8?B?WVBxcnNWUXZzbGlqQklMbHl4V3p5TTBaNmFpVGI3eWVHSEorRUNpclQ0VThP?=
 =?utf-8?B?TjQvdE1QdXZmYU9DelFiL2VLZHNrUWVwcXNsSnNQZDBaUEhZeXZSQzZZajZz?=
 =?utf-8?B?SktLSnUrcS9LWmNMUzNSZjJrOVhKUHozVUhoQ3plV2VEVmtZWEQ3cmNWcjRo?=
 =?utf-8?B?c0NyK3ZhNHBLM3dKVTBMNTlHVE83Y3F1ZWxHVWF3bnZ3WFlLMk42NnJaay94?=
 =?utf-8?B?THI4ejV3RGY5UXdsRFlrVXFXT2FqME5nRlRuR2F0dGx6bmNVRFNlNWpRMzBX?=
 =?utf-8?B?RGhhcmtQMHlsQU5QRlRYQmp3SnZqbERlUjF0VlBIVU5JWlJ5QWRFdm9FSTYx?=
 =?utf-8?B?R1Ztc05pYXN4UDZFQjR2WkhwSzhNbGxEZWJmRXE1Und0T0IzUnRvZEpHQ0Y2?=
 =?utf-8?B?TFQxOTRGRERyaHhnczVnSjZZZzJEUjNoMXJMVXgybmVGV21Rdk5nL0xFajhx?=
 =?utf-8?B?Q04vdEdXck4rcTE1RGFpNmR5M3pxSG4zNWF5NjlNcitXRkk1SFFTaWVrSmsx?=
 =?utf-8?B?VEkyV3RaSUwxdmlmSW1QVWkrTEFkNE9aYnU0YjFjQWswUFlrUDdKM0VLMmJv?=
 =?utf-8?B?UDhLTXV6Yi9UZkFPRENnT3hUQVVNUzVuR081aUZFYmo5ZFVZOWRYamtabHdN?=
 =?utf-8?B?TjBGcTBNUFE4Q0h6NHI5RjN2clcyNHB4L3pnbnRCeE53VjZ2czFpcUF4S1Rt?=
 =?utf-8?B?eWEwRHY2R3NId0c4QXVTWHAwd0tvOGIwcWo4UU9neXVYWnQxZ1A1K0Z0SW4x?=
 =?utf-8?B?MVdJVDA4WkNSUHh4T3AyU0JRQnh4cU1jT3kzbi8vb2RMaENmMWFEdHY4NHFt?=
 =?utf-8?B?ZmhWSXNPTm9yNTkva01HVnUxdm1SZW4veTh3WkN5OXN1cXRVUHdNelNGalZy?=
 =?utf-8?B?ZHVKeHFTT3NyY0FmcXpSKzZJdjlPRFRlbkxMWVFoVW5RT2JLK0NSTWZRSHRQ?=
 =?utf-8?B?RkhnTXRXVzFwY013eWxYcm9tclRIRm5HdzRmYXdWOFhEVVFMUHF5SUtjMmQr?=
 =?utf-8?B?SW9LRnZ5TEpucUVuMjQrNmtwSkxzNkdqS1lMT2ZmRDlCdzcwRTdYMy9CMTND?=
 =?utf-8?B?NU5UeXdhR1phOU9oWldjZEdoSTZRL09GZXRzN2FKMngzL0U5UStDc3RiQTdm?=
 =?utf-8?B?MmdBY1Rxa1pmZCtoOHVkcHd4QUtxVnpnOUxmaUNqVDB0cUcxZXdvVkJiVzFP?=
 =?utf-8?B?QWNuRlJ1eTBjdnVIM0owMno3ek82NHpyQ0VOeEVIckRvK3U3Mng5U0t1alph?=
 =?utf-8?B?alRWRzdEVHUxYnN0WTNOWmRDMWJjb2duMGFXWkFaRVJYeTlmU0l6MjBoTXoy?=
 =?utf-8?B?dkphejhlNzJjYmo1M2V4NFdlQ2hMaTh5K1ZvZExTVFhSVG5LclpGell0RVVq?=
 =?utf-8?B?dWNObFN2cUp5NmJlQnlremF5aFJraS92UHlyQVNES3FoNlpENDMrWC9nbWVv?=
 =?utf-8?B?dldHSzBMYkdBUkdmTGtRVjk4UkJNcG92M0RxSHpDdDhFRGtsSlNkaDlWTFFI?=
 =?utf-8?B?N2Z4L2hkWlBjMXRxV0tmMnVCZS9vUC9oYytGTkJDdHduRkNLNnE1cnZ2RXJC?=
 =?utf-8?B?dGdKeW9xbnlvRE1UM2YxeGwzdGNsS011QnNzZXFqRWNkTDQxSWJ4U2NTSnRi?=
 =?utf-8?B?TlA5S0poU0dOYW1HZGl2Y1hKVHAyOUs0cTBCNkk4ZDUxYlk5RGVTQTNrNVJB?=
 =?utf-8?B?ZGFWMFkrL0E0VlY0bFZRWkswZElFNDVmMXl1WlI5NzNqZTFRWlpkcDEzc2kx?=
 =?utf-8?B?SktQdFdHRXZveGxGQXQvMXJLMnpVY2wzQ01qVExobjU5bXJkblNHZm1ZaHpO?=
 =?utf-8?B?UkNFRk51akRvbzM1Y3N4Z3RLWVRtcDJFdUF1UGFTTkd2Rk9mcHFJRkg2cVJV?=
 =?utf-8?Q?yOUQrY/rO0o6C8tQ=3D?=
X-Exchange-RoutingPolicyChecked: OxnQPrGnoSQK5vcb2ZYY1Y80b7wy9Sa+npiMe97xsMq532bN+F5kQHoNEKkMjJRYyszyLbqR+Ipk/p/lw5dHeKbqlsvG+0bE31yLmTfECMPR3tZYA/cTkP2x///gR3VzLSikQCGvb65XkRRwneMl1Kofl2jLV61vw521UuzY0HgmfGSzBH6g6jS2r1Ip2JjM6Dc3yYH+bjOg4vHtTQiSC1mauhnIXjdhyImMenI1Z6gpIMR9v08RgsgST/kHM7HG4XVH18PpydD0dPpaHGv66zK2t3SKcqbEpIwh9caMkRwqaAmEsWzx+ijeC7AUqwJVMeG+IHwy5fDSKh5UTxvd+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 443b3750-5a7f-4ab4-0c33-08df22b330a7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 07:35:12.1765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /C4OIpD6IiCWdK42sJklJsFFXV/uwwsrQM6040FW3mokAXdXGfAEvFZec687gz4GwMPcwd2daGisvlBhqa3skmCDGQImG7R9Hw1q5BaXjn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6750
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

Hi Ci Infra Team,

The below failure is unrelated to this patch.

On 2026-10-02 at 07:01:29 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: iommu/dma: Catch scatterlist length overflows
> URL   : https://patchwork.freedesktop.org/series/175398/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_19266 -> Patchwork_175398v1
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with Patchwork_175398v1 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_175398v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175398v1/index.html
> 
> Participating hosts (39 -> 37)
> ------------------------------
> 
>   Missing    (2): bat-dg2-13 fi-glk-j4005 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_175398v1:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-arlh-2:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19266/bat-arlh-2/igt@core_hotunplug@unbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175398v1/bat-arlh-2/igt@core_hotunplug@unbind-rebind.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_175398v1 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@sanitycheck:
>     - fi-kbl-7567u:       [DMESG-WARN][3] ([i915#13735]) -> [PASS][4] +79 other tests pass
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19266/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175398v1/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
> 
>   * igt@kms_busy@basic@flip:
>     - fi-kbl-7567u:       [DMESG-WARN][5] ([i915#13735] / [i915#180]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19266/fi-kbl-7567u/igt@kms_busy@basic@flip.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175398v1/fi-kbl-7567u/igt@kms_busy@basic@flip.html
> 
>   * igt@kms_pm_rpm@basic-pci-d3-state:
>     - fi-kbl-7567u:       [DMESG-WARN][7] ([i915#13735] / [i915#15673] / [i915#180]) -> [PASS][8] +52 other tests pass
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19266/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175398v1/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
> 
>   
>   [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
>   [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
>   [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_19266 -> Patchwork_175398v1
> 
>   CI-20190529: 20190529
>   CI_DRM_19266: fc5f5579dbfab13003fd4d6c1c9214a558f58c9d @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_9123: afd8cfb7aa15906974dd979b6dc739ed17ab9e33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   Patchwork_175398v1: fc5f5579dbfab13003fd4d6c1c9214a558f58c9d @ git://anongit.freedesktop.org/gfx-ci/linux
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175398v1/index.html

-- 
Best Regards,
Krzysztof
