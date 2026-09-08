Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0615BC79F99
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 04:36:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895D010E983;
	Tue,  8 Sep 2026 04:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/KhsuFd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34DC10E983
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 04:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788842183; x=1820378183;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CicMh6b6c4ibQ1uXtWgjGA6GabrUR27MGAsmC2xrEc0=;
 b=L/KhsuFdDNZR+17e8zA9bkBOHM+FKYsfam20UhiSm5ryX7gL3+qgXQRt
 Z4W7FovNSX+jN/TqFKPjfYwWemqCXmkD81wC0oooUmqtJHVgh1rCCraG8
 Vixlva4rPh+tUdRVv5w7nJLEq3VhfZ6zuOVvlE2T+vMapqeXbRtc9dpEg
 Wy+I3YLmM8ZO/ObBTGvwmG0cFgVjA3ZLmKx0suiTe1Q1CZ9ZQpjdve0lz
 rgYf5OpVcbxhJg4x1LWXLXBBWrNm7UXvWJNH2J2U3MknyQDCNpnI3DmGa
 +dL+yPolZvt9aCPeJHzE6N/5Cvvy3c8MabMbQ9jY4vwBuTIOWyeo5QVar A==;
X-CSE-ConnectionGUID: fmfOvCoEStKdhnKCRhz05A==
X-CSE-MsgGUID: OaS2bDilS8SBQ8mW+EgGbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106750660"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="106750660"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 21:36:23 -0700
X-CSE-ConnectionGUID: h7Wm/gMvRYm6SrbtQsZb2A==
X-CSE-MsgGUID: ux3sq59sTM6D/KapjN0+Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="309102745"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 21:36:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 21:36:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 21:36:22 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 21:36:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ii96C8XUwb+Js61WHpdGHfGc5YH7XU+2wtytJQh2I+s1KwnZeaEOdY7qqn91bxQcpBx+a12Ep/ItVok4QWVvgPjh5baGCcurE43tb2P1428lEx0O3fJiitqIVI6dVKe/sNK5Wm9bQrfKlxpxyJTIMgaEM7FW90sPEnM5nEdtNeteupM5y3DoMA009LR3Vvf9kW4DuO/TqTmnUgVd0hmGX+l9vTjEPAG4AUHSaoMj+sTo19+gDzgkc1vlEYA38sQ4sqMmnbjaHIdZf27lP2qcPNipQN6y8f3F3KJHr8O2+ACJFz+MR1eKpoehO5PZBFbdqUkkAHYiI0N7BO3mSxsOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gK4+qlX/o/P3kosXfZePSZNkEC1b36+U+Kc6LaoMn1I=;
 b=iVoG/WQFIbK08VpRe5Vk2DO4iuacBdBqIzsd72uvGX5YJzSugqNOxAlP4653Zoihk62mbqi9lkOAVH9quHoNaM8mYiqUsXBljF33rFKwOIBDYqTRoYA9WGdzov09IAkXDOoDEgny6DHn5qnwtlch1DDx1Yyo/Gyu/L6bKjurUvFjcquPnihZr/N1PWl2wceJmJx3IwhL3kQh1/nmmR78w/abYg1tD1ryVQyE0RaBPYgi5/WhcY68+iwu5a8wDJjnxJOqsRCVaoz1z7Tavqx6wkyvhy60RWO2bqyKyJSGSmSltSqO0quF/FLf0c86hxRWpOS/Zdql9YGpWLpmtmy0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CH3PR11MB7761.namprd11.prod.outlook.com (2603:10b6:610:148::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 04:36:00 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 04:36:00 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Topic: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Index: AQHdPqs+f31N0wamikuHUOa3dN7ulLbC6y+AgAEqlKA=
Date: Tue, 8 Sep 2026 04:36:00 +0000
Message-ID: <IA0PR11MB730789A04C30874E71442B16BAB12@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
 <20260907092707.1823088-1-arun.r.murthy@intel.com>
 <b7c948a346a6dd55894473296081bafda3ae6307@intel.com>
In-Reply-To: <b7c948a346a6dd55894473296081bafda3ae6307@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|CH3PR11MB7761:EE_
x-ms-office365-filtering-correlation-id: dee0b171-022c-4720-e250-08df0d62af3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: BdAWRFszNi3przbKPJ7oAr3k1TxxYkEyIwQw28X5l5HlYlDzGj4nT1YWiERMJ2zBvmiDY5cFLfuA8PToQQWxbFvISxordGlsGefHLNxFfwlfDlH2T4p6Q99eBSv/I1QiRj+E88cbAlKOCPXKwE0ThXpS0hc5LDIdkIUyzQgGU6NtkhOBXXuQixg6StCAyCWfPSkPtKrpv2L6RdmqTogfCdbQTHnl4VoiXvVWmnA25+SbvQrxShlV99luhijPg4GJOs4osqkDLOtavgYWJN6+/HzCkwAAKGtmGH1Mv6T/p7WOaqBj2p1n7FRM7KdRS/+gmRMwOXcyvCaHObUIz+iweqWu1Kgr6vsZKeJ2c6FK47z77KApysWi3I45MRvRFEjFfK+sBoYrI3QJugSHex3XA4uWbSN1RDdL9bST+mLHIUNWf6HHuHZTpmk7SisrM0NK7ThTljAwsDkX0Tq6bKuAJksN5AM+OqU1QLYyAtVTCuo0DUkDQ4Vm6gAMKqDc0+YXcIIxqmtWGnGXUQSlVENIpBwxGw5iChB0l/grvy0dYrYUmsx6V+UFhc5NSlHDWlYHeVfxS69nLdU3NTU0GR9i0L+Dn//Z72ZFVKyRzsQbKGwHwOzADJOE9Fy2Z+2DSpWLK+FN2o+4BAllIBcBQ2eIxxv9QZa1k00A3kSjMNXi0as=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2x5XibX0tw8j7h5RAQs8gFpU8R/cFcsbakfyQX2d1vN1B+hx4qdRJZmQP7Is?=
 =?us-ascii?Q?Midj/cAVQ5plvyWtvUenVY5fHDyYaVI5F8aAo9GGcUUwQn2wk37F6XrsE27T?=
 =?us-ascii?Q?r8axxvJMFj8YlYIVQxiXlxkZSDL3NK821Slvsw9eleuafRYD5qIlkRrex3WD?=
 =?us-ascii?Q?ogDmXsz/ODkC6NRaNemEcNXj78DWUGcRoEJTyECcRprX4XzT4R5p68+/GXz8?=
 =?us-ascii?Q?yqUz3zPF4uajJ1ZeFBQgjmAMkqRJw6NY4a6xkuTkuHDI75MIjH5KsLZYwmI+?=
 =?us-ascii?Q?SS+RiCc/Ef+vOcUK64wvJymLbhoqs2qjqCb/xWyKcEYpwASpgYkSwjTiAV+f?=
 =?us-ascii?Q?YM6Gn2AxPI38F540Qu0EpuGCYj1C7uG7ZeDZ+H8g+5yR2avB8ToE/GObGCu6?=
 =?us-ascii?Q?frhWSdsDMOkIs/rDyZz47+SOW+LUgCAeJ5Gwks51HQT2GoxABYw5TJXttsAp?=
 =?us-ascii?Q?tzNBIZoJ83+0cFdfUrrZOXtGRljr/AsV7tR1ferl74oSwLZuW1ilMvYb3pxw?=
 =?us-ascii?Q?Vwnlb4DPsA8cdtxMHSZgCl9tNhqoqb8q9CbOGTJn/ciivF9nz93lNdhTkCIz?=
 =?us-ascii?Q?aC2Dtm1+SEzhIbcz7VWANrzfHwRP5ep8ryWRU+hU++FefWCAWg51zSbUNZA0?=
 =?us-ascii?Q?4rjeM0Vvf42vowv6IwIWfYucmQAxW/SgCF2S0eICqo3U6SWQ2aX0sN/lIBej?=
 =?us-ascii?Q?gpxUPqvf1UX3B0romu+su0MEXix2N7RUnvP4Ztqd1l5aA2R46CAznEs/iJwr?=
 =?us-ascii?Q?Pajq2O7ggZ+gyQ+T9gBRyn10oXOPc1zc+rqfDofzgpAX7cJoF7+IRDyi5iS2?=
 =?us-ascii?Q?OX5rS+aBwrgEynJhMl221RRq08Lvi3ct88y9x6WmGhMy+LM0N5GWGRLUtQ84?=
 =?us-ascii?Q?PWogd+TsR5OEgW+QBNmDLMP4KZqkqQS65A+Dt+wMMY9cKZI6SrCxNa5gqUZx?=
 =?us-ascii?Q?NEDgVWneD8x4cQMI0MEymzrbg49x1zaAxQn4opZzqDokSww3adpAyjZb798z?=
 =?us-ascii?Q?RXBBAbaZ3Oszi5/qFbZRkMMnplebkgGfgZeLptwFM32V6t6sPCaRQaZcR/FT?=
 =?us-ascii?Q?t+4dqFhReJXvyn4Zc1E+no7mU+LkwsRA9ohYm4aKNZybyxnuPxUd5TGty/tq?=
 =?us-ascii?Q?5TBQOgHmL94MWIP5Vs0eXrGKBlmHHosTxau81eB8Tp455HKwZO0xvze6Rez7?=
 =?us-ascii?Q?gZnWq4QobrRP0GM3QFGlRYGJksgtlO3PYyhHHmnRHXxpIWFzdWWOUZGITMvp?=
 =?us-ascii?Q?sswH7fYJdzvdscq4BqRcAK/nJgjxs6QuToaTXhcQUikCNjgZkzNIhqRp5bZV?=
 =?us-ascii?Q?UFmo+wYA6XlS6snlza1WnY9xWQfoJlYOGmLOGZIVjj7QJKZ/rkSUDLpbVTEK?=
 =?us-ascii?Q?Ha3qUdWYqFBSXxqBYEft4AYBQChhHhWiHO5blohhdVhJzBGypzuP1oWxDR7U?=
 =?us-ascii?Q?+RQF36aa0rFBxsVvFSSSQJYb8pmUSjJ+nMYGD5gWCHdBz5REGujG6Is5OQ/A?=
 =?us-ascii?Q?Z/wbti3A7HWJVECEmEZ55CqXS6p1CdDsCKe6mtBr1lWPRv/q8G31SwG43Aop?=
 =?us-ascii?Q?kn92Meea4RbdJ9srjYg+CdBVQC/4ly8qkEVayUCZ8KhJIsmcYpOSLvCEfYBv?=
 =?us-ascii?Q?RnebeBpCmheCra3lnwOjL1AFhOBbBqt2bWvSFG6/E2d3IhQPuDumy5Mold1L?=
 =?us-ascii?Q?5jCHSnDC7vEg4fhSvmIGSWf2nWeVpO101eUSoMq4xOLq65AF6y3eKG5czJGx?=
 =?us-ascii?Q?3cYmkOk0BQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LPelBJ9xo5U6ZwEOxLTjBiVPzDZ3siKVxHMv7f6pqOje3a95C0e8nPKgKE8B0SABg6IJGwVJEUjG7EsIXOkeQhuy2GkkqSrX15NYH75tiUO0jgPYgEeL7qyshjAqNS02Dq7Ph3ODxdff38QkA13Pq/EVOWFxnV6oHcfV2nUjKDDYJicebOSRZUUk7G2CjIaHkdltBS15SHmsKmq1zYLMFXk9c/X9VqlgQiD7FmjSI4ZtlIPbiuSdUel0gULIb72CKUws8mdxfs/f6skj+lN+E8Wla4QlgDABs27iHjzn2mHeK9e3Q1QDbzXWYIl0pMsTb+lDuTHTgmQkcN50FM+rug==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee0b171-022c-4720-e250-08df0d62af3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 04:36:00.7174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ++vULWTl39T1l+PGyYDSkhgHFR0COFDN474P9FATXqAHqAzaCREb1gvBH/iqqoVALvaCPQSOd1hDc4rTIqEuMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7761
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

> On Mon, 07 Sep 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> > Its observed that on AUX_CH failure, even if the retry is increased to
> > 1000, it does not succeed. Either the command might be wrong or sink
> > in an unknown/sleep state can cause this. So try waking the sink device=
.
> > Before reading the DPCD caps wake the sink for eDP.
> >
> > v2: Use poll_timeout_us (Jani N)
> >     Add the reason, why this change is required (Ville)
> > v3: Wake sink only for eDP
> >     Remove the dpcd probe set to true/false in wake_sink (Imre)
> > v4: make edp_wake_sinc() static and dpcd_readb -> dpcd_reab_byte
> > (Suraj)
> >
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
> > Closes:
> > https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16654
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 34
> > +++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 0cd5e6b5034c..d4cc5f7e82a4 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -4779,6 +4779,38 @@ intel_edp_set_sink_rates(struct intel_dp
> *intel_dp)
> >  	intel_edp_set_data_override_rates(intel_dp);
> >  }
> >
> > +/* Spec says to try for 3 times, its doubled to add the software
> > +overhead */
>=20
> Where in the spec? What software overhead?
>=20
> > +#define AUX_CH_WAKE_RETRY	6
>=20
> There is no guarantee that this is tried 3 or 6 times. The timeout is a t=
imeout,
> not retry count.
>=20
Got it! Replacing readb with read_byte uncovered this.
Will handle this in my next patch.

> > +
> > +static void intel_edp_wake_sink(struct intel_dp *intel_dp) {
> > +	u8 value =3D 0;
> > +	int ret =3D 0;
> > +
> > +	/*
> > +	 * Wake the sink device
> > +	 * Spec DP2.1 section 2.3.1.2 if AUX CH is powered down by writing
> 0x02
> > +	 * to DP_SET_POWER dpcd reg, 1ms time would be required to wake it
> up
> > +	 */
>=20
> So this is now talking about 1 ms, but the timeout used is 6 ms.
>=20
Handled as part of comment from sashiko.

> > +	ret =3D poll_timeout_us(ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> > +							  DP_SET_POWER,
> &value),
> > +			      ret =3D=3D 0, 1000, AUX_CH_WAKE_RETRY * 1000,
> true);
> > +
> > +	/*
> > +	 * If sink is in D3 then it may not respond to the AUX tx so
> > +	 * wake it up to D3_AUX_ON state
> > +	 * If the above poll_timeout_us fails, try waking the sink.
> > +	 */
> > +	if (value =3D=3D DP_SET_POWER_D3 || ret < 0) {
>=20
> You need to switch the order here. Value may be garbage if ret < 0.
>=20
Handled as part of comments from Suraj.

Thanks and Regards,
Arun R Murthy
--------------------
> > +		/* After setting to D0 need a min of 1ms to wake (Spec DP2.1
> sec 2.3.1.2) */
> > +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> > +				       DP_SET_POWER_D0);
> > +		fsleep(1000);
> > +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> > +				       DP_SET_POWER_D3_AUX_ON);
> > +	}
> > +}
> > +
> >  static bool
> >  intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector
> > *connector)  { @@ -4792,6 +4824,8 @@ intel_edp_init_dpcd(struct
> > intel_dp *intel_dp, struct intel_connector *connector
> >  	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) !=3D 0)
> >  		return false;
> >
> > +	intel_edp_wake_sink(intel_dp);
> > +
> >  	drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
> >  			 drm_dp_is_branch(intel_dp->dpcd));
> >  	intel_init_dpcd_quirks(intel_dp, &intel_dp->desc.ident);
>=20
> --
> Jani Nikula, Intel
