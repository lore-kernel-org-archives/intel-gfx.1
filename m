Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD405C43458
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Jul 2026 08:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243F610E340;
	Wed,  1 Jul 2026 08:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8dcAnij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747C110E340
 for <intel-gfx@lists.freedesktop.org>; Wed,  1 Jul 2026 08:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782894993; x=1814430993;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EmSMP0Qwx74IwR7zWYPZ1g2U8MzIWmxYAemmgFO6Qss=;
 b=T8dcAnij6v0/OfywpdEz73cWfaashcjx1Nao40PSlj3E5kFFmqTPStYh
 Gy3GczR3OjxZX/u7yf4pXaV1ULtpCvmb3WJUrv3v1m+kw+5BwbgvWXcgS
 4THWpMPReLNCBoS7Z6ZcgjMiCvKj768TL3tQ0tG+8m9DtDVhmjMaaV16N
 uUCMuTyYs60rv75s17rMM1S3/3oGbmXN5e41GOUbkBHr5d0BfddU7ShCs
 tjQIzT+Mp3W8zquNw5ZNOds/pSu/tf/HAZHAnU8r1D0sqt+oYvxIHJXMT
 QhaBfaXJr6qvdC+gkvSeSzlhOMjQf7gwhJzZCsQa6zmTO/mQMOto8qh/1 A==;
X-CSE-ConnectionGUID: gqJVhX8CRO++1nbnh6fdig==
X-CSE-MsgGUID: g+JnoPS6S/y6g61FEwq8vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83493143"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="83493143"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 01:36:33 -0700
X-CSE-ConnectionGUID: xOlKL7dwS2+11Ho0UamyJw==
X-CSE-MsgGUID: UbJQ66O0T+yE1vFx3Ro63Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="257408521"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 01:36:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 01:36:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 1 Jul 2026 01:36:32 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 01:36:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2fHcUTfdfFDxvfPK+u9pXGzFnWGM+fIZ13tfYL9icUlEtkWej+VlT9Swvs3FtyM1P1Bfr323lvy7DfEAvVehZzQVCFqV3lLjc23S7rUxk6kNvYpma5LAD2tiN5rs3RkiVlDc5QVYCA/pM2vXcMzOEUpAo+6kP94IwP4kag+vCQvujoTx/UoDuc/3od5SGXLZbh6VPfM3LdcCufELIZ++8dct4gH9BKz8R8lJz0G6/NU1khH97vSA/Qyxs5gZJYx50rcZdBgBNL7kEJVrDk/drX+VxFxQxVJSUjGHhu4c1JLt0JShiGWQ4Iw3be9oCqTHiZfJARl+IVDUiGpiw8DEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHP/WsRw1o6a8LB+bBl5ORD2w2zzKjepZ2YZFPZicYo=;
 b=oguKTJfin1LIoVYUgV/2VEAWKaeUYfYT5l15y2FR7XYY5HHW4H61K1gnEB4Ws9LvVn5Z9dbwqv7xTwM6BGi+z1w+rKL9tKB8qaeEj8UkHJ+5ZVD54AH98NP4ayB6f8cb5Fv7e3+58U6Yz0vTPO2sAnBkati/pYOmzCJESNyk53xwtymVhy5xfg6bh7Ml6t2Nr/xqWMWTwuKeZjvIN4/Kz+ZnHvzQffQmL+yuTnEqkesedqX86hovz39qTTbub+4cKWdZmQpcRv5kxAextt00nwRz7lQZtrTFLBtcsooFosxCrbSXdctzd/uUagdK3MwWLiJ48+i/Cg5ooaPxhjZeDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Wed, 1 Jul
 2026 08:36:30 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 08:36:30 +0000
Date: Wed, 1 Jul 2026 08:36:21 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <alex.zuo@intel.com>,
 <jani.nikula@linux.intel.com>, <andi.shyti@intel.com>
Subject: Re: [PATCH v3] drm/i915/gt: Use poll_timeout_us in place of sliding
 sleep window
Message-ID: <qgju2jsejuf2glmyyuwk4smae3yvarix6bdxbafvhpxbaanfmb@cpnfgvrrb56n>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260630152511.1401029-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260630152511.1401029-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: DB9PR02CA0017.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::22) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|PH7PR11MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e97084-838b-4383-b82d-08ded74bd920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: T3+tvGUl4nHww4WUk0dosCLIFL6g/yK6sYkU1hE1ZQ9UoM3lYbNAGm0lhG72FDkncAQrBUs+BQ1k1VdOXFIPo6S//gGg6eb2s1/uvXIDHbxAnuEwE2AKqUxffERrnuA+26KgB6JA2pq3S0aSiUV+o84ZpFJtK3yP0gn5QnxORAU/nWzGs9iUzMLdL3ykyYvSIfXE1j2wxxiylvENrnLaJ7ETNjBbz4pG/C2kEUu7IfErxB2PsJ63fkHE4tRmcWCpRRSSK16XtI92jbdaoeTzDMN8ljMTf/Osw3CyUYh+YVqX+fB8IbFubW9euf2tAt0CoMQZ1+7VYp2Xbth2mL9cdwvnojC3e5nZ6gv/it5LF5RUOOmBYRAseT/YpTlQn/RqFrIwKEBYvpTwLRMWdnpTkizaFq9pm2BKkpFIcTjAlJD+4XPMuhIGo/JRNjz0vcE1wmomt1EdM2tI8UZuXZhtIa+MikRP797QFzsDcTFPD9oXnUFSrq5zxs1hKz5I9tMVeD79OseFLU7Pw+yjby53ZDU9RM+xNgYoTtjswT+RzsCO20DcQ8QeWGWPvw2qbfr+MNY8fOBEf2Kdh9XBgkYt/Y38m3I+UxR0hhbwZP5jXNElDxZ+ouCINDyA05Z0d8MJgTqArG+BbDWDMTw0u8RETUOhsKzM3/+uzuw6hU0mrtg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2Jka3h3MVZBRjBtYkZadzd2K2JmeHNjRDlScHg4RXVhNnFkSkZxY3JQOWFa?=
 =?utf-8?B?Uk5yaHIvOTdDQlc2ZVRnVXNnRzFESml3S2pjc3EzTFllOXVZRU13RlpCb1Vi?=
 =?utf-8?B?R3hDZWt3aDBaY2JZOThpZmZzQ3VxTFhtOGt5bVdHTzV2U1VOVHhjd3VUZW1n?=
 =?utf-8?B?dGFOZTRlb3Axa2Y2SnNjdkhyMlJoNWF0cjMvQ0h3am9RRzNrNzFUYXBLOWN6?=
 =?utf-8?B?MkVYVENtRGxramJVcENIVGtXZFB0VEkrZlA5V0QxY1JxWVZ5Rk5PREhhbWd3?=
 =?utf-8?B?ODVkREdRRU5NeVdmaEI5ZExBYUhxN1hpanFBVlp0TCtNaVdmS3ZHRUVhOGFC?=
 =?utf-8?B?c1VCc0YyT051SG8xMVRiUHNYdlB6WDZXNmNMTWQ4UFk5bUN6bitDRG9aSURP?=
 =?utf-8?B?aEFyNVFHMUtkL1g3OEZTUHdYWTNNTXJDS0QydURCUjljSG5VMmR6UVZ1WkFP?=
 =?utf-8?B?dEFOMGdxRWFRcTRNZkRsRTZ2OE02YThBUzg4elBvandDMU51WEcrZWZlSjBZ?=
 =?utf-8?B?ZE9vbVFKbHhNQjY3eDI0NWhBTCtvUWgwTWlEL3d1dlBMTk0rZmZ4UTNwRUx3?=
 =?utf-8?B?S3MxYW0xemFZZ3pTTWN1SzMyc24zdVpaUzNFeDQwMWFpV0lFYkpSL1l1NTht?=
 =?utf-8?B?NCtnUWQwMVFkNnpBb2h0QnppeEZjR3M0cCtmemhaTWthcTQzaFdkYVhzSnlQ?=
 =?utf-8?B?cDFreWxYblVQbE0yU2dXWVg3RmtPZWJqazBqT25odFc1Y1ZEN2FLOUxUNGFl?=
 =?utf-8?B?M0dTcUJzZFFheXZYZmZ0UG5JMFB2UWFaR3RJbExROW1ra0ZxUTFjOEg4dDdB?=
 =?utf-8?B?WHRMalNNRVY0RVUzMG42eU5aS2RoNGFFd1ZmVHVDamRJemI0cnBZZ2d4VlVC?=
 =?utf-8?B?Z25TMG95djBtMHl5U2I5NDEyc1gybDdCdmF1Tys5cGlqL2prVkkzcHBJL1Jm?=
 =?utf-8?B?ZllsV3Rycit6K0c1SmlCOXd5aytIb1pDbXRkN20xbVpaQ2R3ZnM5ZGY5ck9x?=
 =?utf-8?B?VWVaSTN1ZlV3b2tVVlBQSFlqdUN4bE1xSlliS2I1RGZ0SU5XeURzTTJzRys2?=
 =?utf-8?B?MmdlMnVSR214SDF4bDQ2R2hxRThObWFQT1FXZDRJaVE1Q1VVVEhBT1ljNUxY?=
 =?utf-8?B?YllYaVZmWWVRd28vNXpuYmk0dGxyY1RTaktMMFdyd3JqRkNRcTBZQW9IYTdo?=
 =?utf-8?B?cXVnMTJIbUFpL0I2d1M2Y3kxRjNlN3B5cEpqWDJIck4vSVBZNG9FRDAzbUMx?=
 =?utf-8?B?Z1A4NTR2VGx1ejRydFRwZ2swZURScmpqTlFTUFUyL2JXSWhZYmJNVEpjYlRw?=
 =?utf-8?B?aE9iT1FNODhWbWNjVGhUdlhkN2lPMmsrdTZhTXdTeW5Nb1hxRVZqeGljaFda?=
 =?utf-8?B?a0ZDeGlwRWcwb2l6TTQ5K1JUTWx0cjRoK1ZQRzlMdEU3VFVFLzBwb0RmWXpL?=
 =?utf-8?B?a2ZSYTZ1V1NBaENZY3JaZy9IU01YSzZpN0R3bGRadGZTR1A5RW92VUFqc2Vo?=
 =?utf-8?B?OW11RkpnTUlqSUlOdWlpdXhydTdmK2xjNnVGNEVoK1ZLbUo5WGdEdHNWSzV1?=
 =?utf-8?B?aTNONjhHb0hxU292VXJmYmpIQ2JMbXVsYjgzekhzT2ljdllJbzNRbWV3MXA2?=
 =?utf-8?B?RWNMd01ENWlac2ljT2FhMG4rU3lJS3B4L2ZLd3N5K05PUTg1NFRGNW83TW9h?=
 =?utf-8?B?WTBZSGJCbC9QdWozeEJaeStESUFCNDJBME8yVmFKSjlvVUJvS245QlVXSGZ4?=
 =?utf-8?B?S3lTcUk1MzMrVkhEazB5ZGtzZnpDK3I3ZGVNS3VIa0RxaDZMT2FxRzZGWUVX?=
 =?utf-8?B?empHRE9hNWM4YWlyWlpKc1pwMHJtL2Yyc3JZYUtGWkUwT1JvdTlIYVdIMjNi?=
 =?utf-8?B?WUxKQTFuTUpGMDNIUnJVaTIrRjZFY3BONVRlM1ZMN3B6YjlwdGpGVHBWSVNX?=
 =?utf-8?B?TTBaL2lBeWRMQzE2VTRuZmREbHdibXQ1SHBHSHlFZUFjTVpCWmtaZkQwMXdu?=
 =?utf-8?B?YThCRm5DTm9lTDFHZmdBZ1lSVnFsZXRHZ2ZIMGFsSm9BRzloamFjN3hGSnJP?=
 =?utf-8?B?Yzk5SnkrZVVhcWt2V3RlaVdGVzRSUEV4UXdaZi9OOTFzc0ExQWFXZlplTjBI?=
 =?utf-8?B?RnMxZ2pOZitzVW5VN051MXdiLzVIS3BQZVdndjBCNjZIb2ZtSCt1YisrQzZp?=
 =?utf-8?B?RzdsR2lLUU4wNGUyTVdmaFpWbjYzM3ZnMDJDaHBiTzlxUVptaGtDeG9kcGFx?=
 =?utf-8?B?MFluQ3lsRUszUTdFQzBRWHBJSTY3ZjJHZ3lYSElwZUNsczl6SnpXSUt6VlRZ?=
 =?utf-8?B?ckdQVm1JNU5uQVZKT203M1E3MEpGeUVscHJMQnVxQnk3T093SWtJOFJ5OUtI?=
 =?utf-8?Q?tpWXqnBOXPNT0/jI=3D?=
X-Exchange-RoutingPolicyChecked: WiLwbUkkaD68xE7JaKalTwamBSzT5lf/AQUrb9QluejtmGeVyD1LBQm5fSgYsPGftoH6BAJBiDxe1QepDDxxK2nj92SzIYJLDL5uxSAj+NiVkhCu0nN/LA3cOfGk2ZGZU5q5P7csaxqwCbk32cpZk/xtOiCu2KkDm5oBC43fz1XF3NJxx0yOR4CwQZUjheLvkLEHXBV9B35UiHatl6axknF0o7JDF52b+J4uuZxvTbhKY1l+vP4OWPKngClARKZ9Uc6W8cnK+CDj92PV38Udh0ZsyNrF/bA/rXl7deLU6Xa9nx3xF7F74zjdr6TzAiP9xRqREt/C2KQx8596Mq/BuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e97084-838b-4383-b82d-08ded74bd920
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 08:36:29.9649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGzKQr/5yOnau3r9A/u/0IgFUHAVbv5mJSiby54N/KkRdgLyV0T1EUOgvBvjn9j+/iU9zdlV6zCLxzxDZBeD/yRd3WYPib/o6FqTERSEHTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
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

Hi Jonathan,

On 2026-06-30 at 23:25:11 +0800, Jonathan Cavitt wrote:
> The functions intel_guc_send_busy_loop and ct_send can theoretically
> loop forever.  In the former case, intel_guc_send_busy_loop can iterate
> forever if intel_guc_send_nb repeatedly returns -EBUSY.  In the latter
> case, ct_send can loop forever if the guc-to-host or host-to-guc buffers
> get stuck in a full state.
> 
> Rework the functions to use the poll_timeout_us family of functions
> instead of calculating sleep_period_ms repeatedly.  In both cases now,
> if the loop condition is not met after 10 minutes, the function will
> report it as a failure.
> 
> This also resolves a static analysis issue involving sleep_period_ms
> overflowing after several shift-left-logical calls.
> 
> v2:
> - Reduce default sleep/udelay duration (jcavitt)
> 
> v3:
> - Use atomic in ct_send (jcavitt)
> 
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Andi Shyti <andi.shyti@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h    | 32 +++++++++++------------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 19 +++++---------
>  2 files changed, 23 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 053780f562c1..13be4f7e7ab7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -7,6 +7,7 @@
>  #define _INTEL_GUC_H_
>  
>  #include <linux/delay.h>
> +#include <linux/iopoll.h>
>  #include <linux/iosys-map.h>
>  #include <linux/xarray.h>
>  
> @@ -360,8 +361,7 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
>  					   u32 g2h_len_dw,
>  					   bool loop)
>  {
> -	int err;
> -	unsigned int sleep_period_ms = 1;
> +	int err, timedout;
>  	bool not_atomic = !in_atomic() && !irqs_disabled();
>  
>  	/*
> @@ -374,20 +374,20 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
>  	/* No sleeping with spin locks, just busy loop */
>  	might_sleep_if(loop && not_atomic);
>  
> -retry:
> -	err = intel_guc_send_nb(guc, action, len, g2h_len_dw);
> -	if (unlikely(err == -EBUSY && loop)) {
> -		if (likely(not_atomic)) {
> -			if (msleep_interruptible(sleep_period_ms))
> -				return -EINTR;
> -			sleep_period_ms = sleep_period_ms << 1;
> -		} else {
> -			cpu_relax();
> -		}
> -		goto retry;
> -	}
> -
> -	return err;
> +	if (!loop)
> +		return intel_guc_send_nb(guc, action, len, g2h_len_dw);
> +
> +	if (not_atomic)
> +		timedout = poll_timeout_us(err = intel_guc_send_nb(guc, action,
> +								   len, g2h_len_dw),
> +					   err != -EBUSY, USEC_PER_MSEC,
> +					   600 * USEC_PER_SEC, false);
Was there a reason for choosing 10 minutes or wat that more of a
"should be long enough" decision?
Also, since you use this magic number in multiple places, it
might be beneficial to put it behind a #define symbol that is
easily trackable in git history.

-- 
Best Regards,
Krzysztof
