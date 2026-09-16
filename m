Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50CEC88E5C
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2026 09:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1749610E203;
	Wed, 16 Sep 2026 09:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NI7kw9L6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977E710E203
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Sep 2026 09:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789550264; x=1821086264;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=nG2Z1kOli7r1YhJY7Lcc9bJgP5ZW/UYCiVXXQIS0hxM=;
 b=NI7kw9L6E19nX42rM3Z0o6wmEHpLMyBjaTDIsbjGVKTw1kD73PGTctOw
 Se7Ssdqhrgw7LAApLPfDHB2XKEw0DYlAdHFDmVj+IzR5RtDjqUtIzyGmP
 iYohy/P9uXzGhM5XfePT9DMzRUmtuNnd+4hZ3Ig+r4TQEbbMeFzYvEvyK
 +NESexg9upo/VyD5tpUIiAbhdJ5inw7FAguuJ07jBB9S8fjnAaxiZXwn/
 gsrN7qks2PpM2ezN2s5Rv6CFV6RN3qcAYVpD3JFyluYju3SrR3PNfUMto
 7k8xOjSBWpi75BLYAQyaz+UXMvyenqHou/vKbGvltNtOWT/nuunzky4ig Q==;
X-CSE-ConnectionGUID: 5gfiUXtWRJy9tOicgeb03Q==
X-CSE-MsgGUID: SsCvrmozTeSVMzGEFFU5SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89940680"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89940680"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:17:43 -0700
X-CSE-ConnectionGUID: DlAjWQoDRRSv9AkW9j+ZdA==
X-CSE-MsgGUID: htrQAHBVTDGrHnP5OkOp3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271827271"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:17:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:17:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 02:17:42 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.35)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:17:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnRQOL5wWkbsY6Zs10nJtQlmilDl31P1rszik0vQZwthxDVs67ar8ccoc/NWDfmNjVyrr+9eXtno/pJUS7OTJv/z62YsPhoDQUUcfrxDM2JovbVxVTE6180cZuIdGOpH2aZnYAOBtncr1N7vJ1qVln6DA59IfxKNJWL2nXHTpo7I/aeldSRCjkP50BACq35KBdYs7M4A9BmFvwT8BH/VJbbg+Rolp4HU3vbjabMznYBYWF1nf4W/FD+AazVK2DLAFSVIKglMFNAxIsko4ULOMVu9B/874m6T38vE/hId5Fi03vd5b2Pc0uuiFkglAEcvRXI4SFGWNV4mU4NNfHCusg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1qvEo7Hq82P+5cfIkI/H5UMlV09iZMJo23iEynA8Ww=;
 b=U76vsbyOju7LHtMiGkEdrAwDjiz02Z4wCy1kP5sxg1xuZAHRJET2eGiJ0fJRs+gtjp5d2UaYRAQZvocuUlgW3X6zlfIBSNgsBGqa6to81EaJRQvbRT779CrCB/Zz4uOxuXnL7zZt5neU9yoaCZPWEuruRqLXMkuPsOYjv+6xvMOh/Celn2jQi7JDsBABq+dwxUAMqCO9tbSb6sySrjYfUmBJN5b5cpQzfp8ZX6apbEEQX9VGPl34VkCelXIuHWuZ5AVhyCFBquOtvafK/ellPcWr28Seziw3jFSOSfGw+QjJIq7F30PoWlleWdBAn+eYbhwR/0QTJQaftEE1ZCuTGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS6PR11MB689623.namprd11.prod.outlook.com (2603:10b6:8:46a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 16 Sep
 2026 09:17:40 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 09:17:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 16 Sep 2026 11:17:34 +0200
Message-ID: <DLGMMDGV9F5B.36Q7EV9ZO50PX@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <krzysztof.karas@intel.com>, <krzysztof.niemiec@intel.com>,
 <chris.p.wilson@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Fix unlocked mm.stolen in reset
 selftest
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.22.0
References: <20260821134044.15908-1-sebastian.brzezinka@intel.com>
 <ao8a-Y4re7PRKjIr@zenone.zhora.eu> <DKZLAJT619PA.2D39BHW4MUAIT@intel.com>
 <apDFQTbBkAzFX5uc@zenone.zhora.eu>
In-Reply-To: <apDFQTbBkAzFX5uc@zenone.zhora.eu>
X-ClientProxiedBy: VI1PR0902CA0044.eurprd09.prod.outlook.com
 (2603:10a6:802:1::33) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS6PR11MB689623:EE_
X-MS-Office365-Filtering-Correlation-Id: e1bfad9d-359d-4500-c0c8-08df13d35b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|3023799007|11063799006|56012099006|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Dtl56+C80a7gpJLwYdG4O2BpFj3oNQWdH/r98hH7esdw2bNM+iFYKpPcDHd55oVyGq9Q/HwM1cnbEX3ixCwOcQLE9j1lIWB9VBn6JnCxTTfgniMWd4ycV8EkbvFbZ/v5lEoxa3sMPWa22X4UDN2OLuglWValzwRPRPF74Uf0ydzXNLCoAyPoU7onHlbTASUyGa+UG9v3SSHMj+nW0WSInyQDOOLhu0xREtYoKAycNXGUN0JpRaYn9m7J8EyxxrhMvw8Qcq6P0y8C+3D3OJXy7FjrVevrJkqzQiFbbNe3uiVkJzMQ5CgzIl+WZw1zcoisIN60kymWrz1kxWtRohl6zBHYWtyVglyKGRkT4lO658gIeZC5yvZsNQr0dCHZum2MrVihzpIyGZLr3R/bQWfY3mTXFqMblPqp1JH5EwsJZ8w4aywAhu/D8+bOIRFRxJDaCJoQGQo47Y101G+wqy3DwFQniCaYVNiheoHtR1LPbMbLk7+fRSt1sGCrWYbHP5OGmP0s4HLOdy01wXNa2Sds0/fYy1qXxwF2S5yJyx/75ANp4GJPHtubKLXn9xECrNAmA5YZar4vojpAIbetcwm/5UmDaJcrF8mhX2Hcq4mrXdr0TgxMB5Vi3Kl/o3lonEDfXE+u5vA6Zw96Vo0KxpYahNpnWRrfRd+eMC61MCMk9HI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(3023799007)(11063799006)(56012099006)(5023799004)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUVTSUt1U3VwREZvNTZwZ3QzUzh3dWpiUk9JN29oMkF1WlhsT1o4Q0NkMEpI?=
 =?utf-8?B?VEZCaC9kYVArL0xib0cyTzBxRFZvcmRtb2k0MmtSYU9rNFRpeFpiQ0VoNXBH?=
 =?utf-8?B?dHZQSnhZZHNSRS9mMVlOL3RnT2MzZVI0elc0ekFJY1VXYmtYSWEraEFGZTJR?=
 =?utf-8?B?L2Q5QmZJSHhmWlBjUTErVkxWSnA0Z2JQQ0c0VGFUYTBoNVdnRHNidDdacm9B?=
 =?utf-8?B?ZWNLNTVyZ0xXb3gzenRhbGhhOWlySTMyOURxbDREY0NtbW9KOUpHVGpvb3dI?=
 =?utf-8?B?MVlSN1hxeFdjQ0x2aEhlRGZhTGZDcVZldU1JTnRnTTFBT29vZElPNVVzcTB0?=
 =?utf-8?B?YTBNb1N1ZVZVMTkyYzZXMWVxdUE1ZEk0QVhpK2NMdHVweXpSeS9UV2hlb0ha?=
 =?utf-8?B?d1JoM0NKcGlLN0FYNWJlNUs3WDlWSWxxNFV5UGtTSFA0aXFwbjJYNVN6ZW10?=
 =?utf-8?B?THRwRXhYbGM4OUl0azVMcEFOWHpWajlwVlBFYmI1d3BFWHZsanBhZ2ZHWWNW?=
 =?utf-8?B?VGwzalVTTE9YSmZzR2JuMlJIQXpKRTIzYWgySVMxT1grdnJjblNob0tvNU1O?=
 =?utf-8?B?VkdrWUdkQXJsTFFWSkIwS3NhWDNjcVh3MEJsYVBTVm5zTlN5V3Z1bDNtYkZF?=
 =?utf-8?B?RTRYNVFBcU50c2I1RyswRkZtanFxWnZSQmp2dVlDVGttaWNCcnhwemdqaFdl?=
 =?utf-8?B?VWNRaFhpM29tSG5LS3IwaUVlYkJNckhIU1ZkS1I1SnRTS1FaNjd6S1B3Rldw?=
 =?utf-8?B?b0E4aXhQRm1ZS3ZOS0ZQNWRMcU5HSFlqNldsMFhRQ3pta1g4WGlGRHIzTWNR?=
 =?utf-8?B?My9veVpGVFBuMTl4QUprU2NWZ0YvcERGL1ppTWkzbHBkQ0V1MWg2bkowYUpt?=
 =?utf-8?B?QjM0ZHE1VGxwYU94YXNnVzM5YU5Fc2hOdzhncEFhcVlqZHVKWUxZWkU3bUxV?=
 =?utf-8?B?UUhpZHRTMGx2RE53OHFUUXFSNDZ1OGdQR0R0MTFUWVg5YURBek5Yck94L0JX?=
 =?utf-8?B?L1dKdEFjR0l2cnJlV3JvUlJmcHE1TDN5N1o1dXMrYzlDSmNId3A4YnBMK0hS?=
 =?utf-8?B?VlZnSnBGL09rZ2RVZGVjMThmSm1meHA0RGRWajR5RUttN0RRQ3R0bG5RcDRz?=
 =?utf-8?B?NU1YWmFUZ3cxSXZHL1c5R0prSkpLZ3NoaUlFZzNZWDdhVjRQNi9ZNEs4cEVy?=
 =?utf-8?B?cGRjYVhraHVtSnIrWSs2WWpCV1hld3M4eXc5TU80TmpXbWhFUkdwWDBva1ZJ?=
 =?utf-8?B?VThUUTNnZFRRWmZIL1NHOVdybmY0cGo2Z1J0d1JrU3VSa3g4aXYvL1JHN3dq?=
 =?utf-8?B?ZjBFMnJnYkRSa2pnK1daQTBRQlFaWEJmRjZVWXI5NDNBaHdWWklWTXh1MW5Q?=
 =?utf-8?B?YzhQcXJzcHl1aW5kdnBKOEVCTlcvbGdIWW1GdUJjYkwzeUpFQTVoS3I1T1dI?=
 =?utf-8?B?SktuWHEwMG1jUjF0VWNYODlmdjhPMktpRGk5d1FQYWF6YnFDT1JMU2VlR3dO?=
 =?utf-8?B?WE12dCtNWXlsNkxlR2wwREMwbmFwSmNtS0gwSjliT0xPVDloTG5DeG5GWFN2?=
 =?utf-8?B?d1hEUmxQSEs3UGgyZ0FIVm1PYjNDODhHT29pNG1OSGpmS1dvUmlZeWZVZGV0?=
 =?utf-8?B?Ym9GKzQydVgyY3J2cDJ0Zks3Y29PREZwczBaZ3hVRnpNSEEreHZLOVFuMjlK?=
 =?utf-8?B?N1VqclNseGNzaEVab1MxSjFzdUljWUZaUDVOQmFROUphQzhCdFlObG5ybWlB?=
 =?utf-8?B?ZzhMb21tYWt3NzQzRXRiWTJDb3F6eXdvYWdrS2NCdGFnRzRsc1pYSzVFUFpV?=
 =?utf-8?B?eUg5SHJiYmFTN3VRT0RYRzFvZWJIK2VmOGxIOUpuSFluZ2g0OFMzT0tRcjNH?=
 =?utf-8?B?aU1DUFowNUFKaklwa0c5cS9tM1VQMzhFdnlDK1BxdjJYaVYrQnlOdkR5Rktq?=
 =?utf-8?B?eWhneEM4Sk1BZGhVVnIyOTBZZDJMdk8xaUhoeUVDK1pUdlV5enB3bTMzZDVm?=
 =?utf-8?B?NmVnSFdGU2RlaVF0U1FCakdzZCtXS2F2MlhhN1FwZ3pTRjRFRXBTMCs0SWlt?=
 =?utf-8?B?bWtKQ3FHd1FyeWpIUDg4eHYwc3ByMEYwZVBiUE04WnhjRXhKV0h3Z0JlWSsz?=
 =?utf-8?B?d1FqSDRGOEZtV215Vm1QcG02VEdZQzY1SGQ3dHBaQVJQS2FlamR2K0FWeEpr?=
 =?utf-8?B?NXllRW5ITnltK1kzMW96NkxSWDdwVkNpQ09UZEhubHRhOTdCQWd6TGE5dVoz?=
 =?utf-8?B?c010MnBOOE03aENPMDV3dzZFajVxVkEwQnovR2N1WXF6aVNqWmNubWczbzZO?=
 =?utf-8?B?cDg0MDYwMGRaeVNZWUpERWIzd1F5N3VNTm16RElzRlNJeGl2TzQwQTdzR3hH?=
 =?utf-8?Q?OXyJAP6XR5LtaRAk=3D?=
X-Exchange-RoutingPolicyChecked: bxJ4xLBliCxLtx1GO1IHwCbTLMvsQ+hmbisBKCYP6Elew7V2xzgBDGc4Z8X2L5u+fHLHTQODFAWu8ZNRZLf4YcJRxmuXJA6iM8NnMt7iPuxto06tFnZvp6Rtnd5uETr6unglWc0c8Gts2PMQFsOiqyjFXBdPR3vwLVJQiOMcKmSTD5nZ/bpQt9tp/apkjF6L3O3IOQsoMfWLHhJFH+C2YlWYLpCww3B+RSi7XpJQ6QRzlg6Hqu3zU7qGfNC2UF/Ms6biP9Hw5sR6StWSmwJStd+R8ZoNa8Cx5am9FeIfNXRgrOfZdp9b0b3fTzzWfKFd6D0wkgD6l1YoymQ9AJlQ4g==
X-MS-Exchange-CrossTenant-Network-Message-Id: e1bfad9d-359d-4500-c0c8-08df13d35b00
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 09:17:39.7669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yC5xNdYqCN9ZMmgnGUsMcN2ABjrzWfJmoKYS7KmPnPZ/PWpVz/jYfvCHfG+R4eqcoCfDI2QcfgyHZ1ZHX0ZuLMyEjUh043PQ6ogjJA4y2N0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB689623
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

Hi Andi,

On Fri Aug 28, 2026 at 1:17 AM CEST, Andi Shyti wrote:
> Hi Sebastian,
>
>> On Wed Aug 26, 2026 at 7:31 PM CEST, Andi Shyti wrote:
>> > Have you checked sashiko's reviews? They look valid to me.
>> >
>> I checked, and there are already existing issues, probably wrth fixing,
>> but they're outside the scope of this patch.
>
> actually you are in the middle of those issues :-)
>
>> > ...
>> >
>> >> @@ -95,9 +96,12 @@ __igt_reset_stolen(struct intel_gt *gt,
>> >>  				      ggtt->error_capture.start,
>> >>  				      PAGE_SIZE);
>> >> =20
>> >> -		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
>> >> -					     page << PAGE_SHIFT,
>> >> -					     ((page + 1) << PAGE_SHIFT) - 1))
>> >> +		mutex_lock(&gt->i915->mm.stolen_lock);
>> >> +		unused =3D !__drm_mm_interval_first(&gt->i915->mm.stolen,
>> >> +						  page << PAGE_SHIFT,
>> >> +						  ((page + 1) << PAGE_SHIFT) - 1);
>> >> +		mutex_unlock(&gt->i915->mm.stolen_lock);
>> >> +		if (unused)
>> >
>> > this is always false.
>> Nothing really changes here, even if the if statement is always false,
>> we still need to guarantee safe access.
>
> I'm not getting your point. Do you mean that if nothing changes I
> can add things like "if (0) do_whatever_you_want;"?
I try not to change any logic, so it's now essentially if(0), just as
it was before, but now with a safe lock. I could dig deeper, but I think
it's good to fix the unrestricted access first.

--=20
Best regards,
Sebastian

