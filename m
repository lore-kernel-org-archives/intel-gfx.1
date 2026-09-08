Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C998C79F82
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 03:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A8110E071;
	Tue,  8 Sep 2026 03:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gam0O3DX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C78C10E071
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 03:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788839689; x=1820375689;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jY42SuCM5PgIFN2K0HKFTxfghkhV3CGp7sIc1dkul4k=;
 b=Gam0O3DXSSS6VDQCbwZ6I/BnrsGl8WJx0h4uPnXyHrB+Ik9gYj/TJP34
 1nrplVpjzZBMKFhZ3bSy3fKtS2G8xEXBj0OdCzfWJWH5vW8/v58AmI1/+
 1wHCNZOl6rbI9pks66y9HadXeLNGWuql431NkoSiEacbNAdwQDYMcDey4
 y7A6hVy/Ec9SJ76Vu2pC4z/7GQ6anYdH+27bcfyzEobF58H9cKTVBiXCf
 Z78RSKDIL1+w7elBxQMdGIr2mIsDBT2d8Xi6JmgPc0zlZKwjBtyNPcjzF
 cI/nN52Anxw6tvMZMfvf2aL5JpP+FxXApXaWd9br1LSUzpSHdkXg8xv8T w==;
X-CSE-ConnectionGUID: 5iGHljADQUOcMK/bk7WkrQ==
X-CSE-MsgGUID: zuyDQHYwTvC+48ZnYJLG7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106603483"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="106603483"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 20:54:48 -0700
X-CSE-ConnectionGUID: m6reepY1SriHyyTwcNcCsA==
X-CSE-MsgGUID: TjglibniRtmt0PDi5GbHEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="266524759"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 20:54:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 20:54:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 20:54:47 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 20:54:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMa1EtHqK2Mz1UnzkQndYHkjhyUCmnlhZK6UP/tf3yqhzVacvSARY0ESO8cqFSozV7xY6SK6hj+F49ovIB8junIvDfdgnzlHLIyWje9wyu7SRNqHgqmfzFDgYQONNLNbmo37f2/EBGpjDfkuRoEBn9Z1wRQh25+HXlcAT3bT8yT5WUX7Q1hlIMdnteF/998284ptytPiHz8KxdbukWL1dJOTFHgi4ZJ0l6aUNrg+sHDmv1hAeINht/cF2HVUBKCLrFVSuB7F2Drm1slVSj9+WUx/rxPTgPiqBBAUeKMx6zkU2jKBIgM0soQJ2/SKjwAgT+xhKrGladn2wgtCFytZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1vNBuZsvjNUMGzHkko8pedwCT6D//iuTMTo1mjCCSw=;
 b=EOmpKbQYe/scZcz0QpXxr3iXSwRIvO3ZSlu3NYvZ6Bv6IGewuH3ilaFX1ayNjo0rJ/dehkKap6hDHO4ReM91n1/sAefgUkXP8yubASPBWSR6yEdso0sVz7D6ezvBDJe4CSzIOQBz3mgfKCSh0d4HUB79RH+sJbnnWt3eWOjhiSCjHacbK2QRV97W8qM1mCSjW+e50Af3+d1TiIWt41CVvhn4WBkQL8SEbv9i1tA+pMO7Y7Aj0VK02Dqz4jUtvOI4DYtBvQwTDx67EZvUu6w+b/BOqIWJsFnwMO+PzbfPRMGLoe8+8f4mG8qeDWuAkfxWHSIeVUh+YxVEnNoAZffyGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 by MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.13; Tue, 8 Sep
 2026 03:54:42 +0000
Received: from CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::c319:6d18:282a:cac8]) by CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::c319:6d18:282a:cac8%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 03:54:42 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Topic: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Index: AQHdPqs+f31N0wamikuHUOa3dN7ulLbC246AgAEs0YA=
Date: Tue, 8 Sep 2026 03:54:42 +0000
Message-ID: <CH3PR11MB73002C487F58F59AC41EFA20BAB12@CH3PR11MB7300.namprd11.prod.outlook.com>
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
 <20260907092707.1823088-1-arun.r.murthy@intel.com>
 <DS4PPFE901A304FD882DA28D5F4EC62D86FE3B22@DS4PPFE901A304F.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPFE901A304FD882DA28D5F4EC62D86FE3B22@DS4PPFE901A304F.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7300:EE_|MN2PR11MB4728:EE_
x-ms-office365-filtering-correlation-id: d9a41834-f453-4b65-2ef4-08df0d5ce9d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|38070700021|10067099003|4143699003|56012099006|11063799006|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info: bQj8kn1ocAcwKz02fP8aSluV5abSeVWKrCPfoFqplgVECTXhgd/Pp9A3yfXBkCbijuqWvzv9DZIC/0q6/zh9EGcQLZQikleecXJZmM/t8pLvjd3Au4d444fPd/+XVLiZmXB7iUGwVxIZN/Y0DyeItFt6XUH9lmy/B5TY7S0jAYVZ8aFDMxzariPzT/PMGWlgWgsrSCisPnSVrn1pBxoCpHjWMSqiTbm9Nh8nx5/HSfF71iO4CgY20YrzFlb4UnajNA7t6Bp6Iok/KYf/KE6QabmxSqusN+9qVJqP8upbB9hJQIpTAdT1niUzrK5/8lXrrYUPugGiTnGWZr0lRGXEFiXw5tnR2Ldi0SrDj3HWj+HgziYw2SpxsckS5/8bjuUxyGOKtg/LHreFxyDDIvP08VnE9pjVS35+nyHsH6RGlkKyCIhnHq0q5fw4cYcZTnPpAT9OFZaF+uA0UUG9EmodJUc7cKYR2gH4ghA78aVdIDkRo11QVD7gBfO2pIraYXwiC9RKbhYExqNL/noDPa2Tr2KoLBGq5YCYUnmIlt+bBf2a0DENhfbWoPn+PInYz8hXdVFZC/Dr5ArwUfYjwr7eA/4dlyJXQih8D65FhkJUPuXvyzWxD0KBxzuOP0pUN54EZYDaEmP8/v5asIcxa0IOK+G6gds2BH02D7N/tvDWU8Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7300.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(10067099003)(4143699003)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ka/+N/wClBdxohNGanNRpqqys8nZpAsAveS7SIX8yqEZ9p/Vu8EQDVxevPWB?=
 =?us-ascii?Q?yzk0k3HLUwzlUqmm7iGkSGJ92wWwlcpljfvAIJka7n88i9HJxUewFS3RczJq?=
 =?us-ascii?Q?IRn30PqpO/McWCCTnLhTrsgW+ACxkS+yCmyS+s8+rtUB9T0VH7XxMJNw0ufL?=
 =?us-ascii?Q?fA1u9qZZOx1Jfwda94NcyiW/nCgYfwzdQNPf0q3t/jClcwFI57EC3M+NTLfv?=
 =?us-ascii?Q?A8u7a8+CU7ExJAqYeSOJ7GNuMDcpRUQYDX1wR9EVtmpBHVwR5HWMtRZJpBhA?=
 =?us-ascii?Q?bu/8DwRteJZaokC2kPOBxG553NSeWrnnrS9CMjpe+enBm8PciP96Pwor5vfz?=
 =?us-ascii?Q?Kem8UBYC7pCm1p+UaFWdifFSgQOMQ88QC1BI4L86+60T3qoC+0AAbi3TBWof?=
 =?us-ascii?Q?EJGepJP33WCVgluoasxPT4/743W276IWxyIt0Ey8tFHvEJoA1tn/l6gkHa9e?=
 =?us-ascii?Q?2gGemArLCD+tPm0q/21AIamgUgiY33fSeWyNwojl2+RPVsxj2lrlQXtqN7fg?=
 =?us-ascii?Q?UKtVRKZD+wL90LQuUPPhQZ19eplQtoNjB9Vkrv3JKb073J12ENwCKwkXGZWV?=
 =?us-ascii?Q?ImJUBGbP6HFO/njpPh4Hn97qnizzCOkRxo1Nh3SdG6W65PfEWM1lfKuTQNkK?=
 =?us-ascii?Q?+T+M6HCyS5XvNFV1nxMtQ2O2oen1tE81Fz3HeI/QTYWlYQPgfgyTCF1nCtF7?=
 =?us-ascii?Q?pBUiRNMAZFr2wfJ9rxl+S+PXhSoD+bg77tFhOeUmar6MEWxQFX2xMcbez/05?=
 =?us-ascii?Q?ViMROSq4h8grTOzjyC1cVHd9TW54he8o8/q2Up4TrQ35JHQqTzh7blqDOPrL?=
 =?us-ascii?Q?p3IsxNwCB2fIWZEIyirYbhMqdcNx5jVGzTu22/FYXKWFRArOUFEqUy67VBbi?=
 =?us-ascii?Q?l+NhsEugdpVnLKl9XRK4owB8Rn8kl7fR1Ho6SjmKnyr3JVu0JZSqwYVFQRNA?=
 =?us-ascii?Q?Krw3Q2pWfGdDPWdVPjoc8pXhB8W/S8TlS6dh6lv9/U9pFSEuQJbi97EHMZHa?=
 =?us-ascii?Q?ntfuJSbo2BrdfVZ3HxY5Sv+mxRfvwdqSY5Yx+rtlwHpQrJ+evximC+4J2DTT?=
 =?us-ascii?Q?Y7irqXKl7Ds1lFgSGpVofrwfGWLwAGc6TLGV9dZqRLEx2W4gTRZV4m+iztp/?=
 =?us-ascii?Q?+RvZHxlYklKv9dZGim2le1Lz6y7FC/lbeUtnj7d6v5FipKCALfJA4bcdRwA7?=
 =?us-ascii?Q?Npq6DDrQHS9AAKJawL5au+gxdlizzrpf9vZvxFjR5tnGr84pHDoJ8tIjyio6?=
 =?us-ascii?Q?MXG7ex76Lnl05mJWUR0HS51EhOVugEcLzrO3istNFQesacxhR9AFHGFoaMF9?=
 =?us-ascii?Q?/UTYa+B6/hSuxN6sJfUiQKgvCcXjNo9UUH8U7IfDREAVqK2nQNwltLyF7Khh?=
 =?us-ascii?Q?Z0HrGXfE0qhnF3G6iObOmHM0s6hx01sBvzNVWSVeA72ZcBLLU9s9H0C2UEoQ?=
 =?us-ascii?Q?2+uS2mz+a0gtnLz2bNbQ7rmDZRYxmCLuTXix88egEdzfEJOalpSPfOen/f0k?=
 =?us-ascii?Q?LrAEgXDpXKEIJox1Axva1j0HS/D2A3uMWjLvIDo/dxebRHBQbLuiUE5no51/?=
 =?us-ascii?Q?WpIEici99Yo5/mU3j7B6+iKXXwrVYTfh0+CyFjRbwX99yLZgmDbMnCGL+12Z?=
 =?us-ascii?Q?BgjqNztQkByYVO9yOoJFV+jPI+FOIJg9tDHyR9i06QHGzNM/Gpdr/peXl0ow?=
 =?us-ascii?Q?2dI0nRFTGrDhFxE39VrcS/+0/mSZmXBlWtWxoqvYbNobBmvpfq37ZDVlQfvy?=
 =?us-ascii?Q?fwe3JchHoA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cqOThD71LlutfbZZeUjc1oKFA7qkEusJCaHSPS67ju9bFNNCp4h/iW2flwtmKScDh9ujNP6indwKCpdc64vcy008bD2brwpwxpKNFiSDbixjXl7sxLimXEWWJJdQt73vYtliRX0rSCFscaQKVpmTp/vYo/Psa9qnnDz4zqjTnQr10i9NMyv4A1FkCJ0JIXAVHhBWYquE1/WZlt3RYOFJwyaJCK6EvfBl9CJo0MY8PziEsfJDICmq4bCBvhWr5yBLhz8Mu8tQ+QgcQA9u8GNErJb3QjG+o7z/Ij00n+rtNS618rRB1zf9HUhMeMkZ9mACttQpAnCeDRTmyRIGFAFtfA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7300.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a41834-f453-4b65-2ef4-08df0d5ce9d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 03:54:42.0849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ORgbXvunD1lROoaV78NYoDXxV8vW9CwsqV16rSS9RxbRoDznr4o7xce1o4ki9OmD81yjtmb2ZYoavIGRWSBmfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4728
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
> > +/* Spec says to try for 3 times, its doubled to add the software overh=
ead */
> > +#define AUX_CH_WAKE_RETRY	6
> > +
> > +static void intel_edp_wake_sink(struct intel_dp *intel_dp) {
> > +	u8 value =3D 0;
> > +	int ret =3D 0;
> > +
> > +	/*
> > +	 * Wake the sink device
> > +	 * Spec DP2.1 section 2.3.1.2 if AUX CH is powered down by writing
> > 0x02
> > +	 * to DP_SET_POWER dpcd reg, 1ms time would be required to wake it
>=20
> Nit: DPCD*
> > up
> > +	 */
> > +	ret =3D poll_timeout_us(ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> > +							  DP_SET_POWER,
> > &value),
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
> Should we maybe check ret < 0 first,
> Because if ret < 0 value will be bogus and if value =3D=3D DP_SET_POWER_D=
3 than
> ret was not < 0
>=20
Good catch, will change.

> > +		/* After setting to D0 need a min of 1ms to wake (Spec DP2.1
> > sec 2.3.1.2) */
> > +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> > +				       DP_SET_POWER_D0);
> > +		fsleep(1000);
>=20
> I have not seen any use of  fsleep maybe we should be using msleep() inst=
ead
>=20
fsleep() autoselects the sleep best mechanism depending in the requested sl=
eep duration.

Ref: include/linux/delay.h

>=20
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
>=20
> We are reading dpcd caps just before waking sink should we first be wakin=
g up
> sink even before caps are read.
>=20
Yes, this has to be done on the very first dpcd read.

Ref:  DP 2.1 Spec Section 3.5.2.16 page 966 says
" Prior to link training, a DPTX should perform the following:
1 Verify that the SET_POWER_STATE field in the
SET_POWER_AND_SET_DP_PWR_VOLTAGE register is programmed to D0 normal
operation (DPCD 00600h[2:0] =3D 001b)."

Also Section 2.14.9.7 POWER_UP_PHY says ensure the immediate downstream dev=
ice is awake

Thanks and Regards,
Arun R Murthy
--------------------

> Regards,
> Suraj Kandpal
>=20
> > +
> >  	drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
> >  			 drm_dp_is_branch(intel_dp->dpcd));
> >  	intel_init_dpcd_quirks(intel_dp, &intel_dp->desc.ident);
> > --
> > 2.25.1

