Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14427C79F99
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 04:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A16010E037;
	Tue,  8 Sep 2026 04:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxtdGzCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8DC10E037
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 04:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788840841; x=1820376841;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=j8LVpsW5pWFHAAvZQyhRc9DwNjlIXu63fWQ4HAAnL1Q=;
 b=cxtdGzCwOKnyNb5LCgKULJ3q/Hm4oxwfw5j485prqzYLZqPceKniaqyK
 /R5UkJJDcZsID0+a4p5+9vxDa0ML9bnMaZhy2M74g+ZUl4i7BUpZ5B+Db
 iV6BdHlFXf78gQSIJjnHwJz19KE8lvCR1AzArIPkoBEnzsPb6MRKxHICV
 FDIWljXsMfozrnCZQ8oPQlGATKABj6rT4vbCsi8zHsznPReRFgp4wp2NU
 DxRJZ+FdjrNoFvcO2lEdTKQyBT/HaoKZLK6uOGSD38NN6NP+3Fk3I9aiR
 HvZ3PaQfNQjHv5fEpKztCChfnOLC+iU07L/XVurMFGM1z+icLY0oLFwii Q==;
X-CSE-ConnectionGUID: 0mHTdcuoTr+5sKtniKCDFg==
X-CSE-MsgGUID: ozHZlOQJT123z1eOcD3pGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106749011"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="106749011"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 21:14:00 -0700
X-CSE-ConnectionGUID: hWjS94BnSFC0PYHEeEAjsA==
X-CSE-MsgGUID: u/cZ9FxuQH+bR7f17FUYEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="271385502"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 21:14:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 21:13:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 21:13:59 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 21:13:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkxuoEEmIcUie4yTBQx5w33T86Y1EzBp8mrrTZx33Zdp7dnXzYPNdvioJQA7DDJRbNKLOHjtT9QK7yNXzd8Of+YmMko/9RuY/oEqr2HPY3WGgLaqeiM8kllaTq7Mi9qvPelR8VbAH98InGOsM3Yb5Z11YyF+NpdJXPI1Vxy+OLj324cpEY27ltDH1m/tb+tCbO893NfLg3mbz1C5d0BLJeOnVy0V8uzw2jgEsRAFmbh53h/pKITNTmSJqXpRw5aA2uAprgDSxEiV3SuSPl1b5MzRE1YIV+CA7pIsqQCLp/0KneSoMZXgsrxFzml50h2yCi6K/F7TgJSqoDhzU8qV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCyPOThZ/0HNi43Z+aSfpy/CicrWgzxMetqAGupdj6s=;
 b=yGHmHQhMZMYas8sovTL46IK/y1PUrJAT7KTLjYSrOrLz+ZW/9XheaoGJuQOzfb5xUFxl5k5ahs2gqaI5NCRQ4pXVTw+RkPL3MRXyLrcTD2isjusvlbCtEzMAoH4/5OqxQ4I8ifyLWn15RgOfqxvtDUM1agrZmFumQgrmRm9wLg+Aiaxrw41abkQUQvW18sX/5pncJnfdEI+yzDa9ZFgLfcMgwq3RB57BaX1y0oITOtEOIdJbXjz1yIv55wcRrv5oAfeGYqwgDcHxUXDow8qpYLLizjMITUStrzJtIebM5Kb1qqoWLo9aQsSXPMT46iy8Km3g2/8eyjyXVLvMRI4EKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH8PR11MB6705.namprd11.prod.outlook.com
 (2603:10b6:510:1c4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 04:13:56 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 04:13:56 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Topic: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Index: AQHdPqs+e/R2G4R280OMPSGZx30DYrbC2lGggAEz5wCAAAS8UA==
Date: Tue, 8 Sep 2026 04:13:56 +0000
Message-ID: <DS4PPFE901A304F428CA8DE15EB83B8848FE3B12@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
 <20260907092707.1823088-1-arun.r.murthy@intel.com>
 <DS4PPFE901A304FD882DA28D5F4EC62D86FE3B22@DS4PPFE901A304F.namprd11.prod.outlook.com>
 <CH3PR11MB73002C487F58F59AC41EFA20BAB12@CH3PR11MB7300.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB73002C487F58F59AC41EFA20BAB12@CH3PR11MB7300.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH8PR11MB6705:EE_
x-ms-office365-filtering-correlation-id: 2272f796-2322-4ebb-c0fd-08df0d5f99e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|3023799007|18002099003|22082099003|56012099006|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: sefuQxdHHrn1BkD82kp/z7WWEsNB7HeXTXMWDHsNdmDCemzf/6OsZhtuCMmlJsY/57pqm/nDE/bsji3xAePkATBh3R3GYTcETRweGOOpbz6QdugYi/XvHMxqUxLU1gY5Wz6bquJOd6EzXWioCL3uU+rYd8rVLAuRvBM1nfsjJLfudCMi2T7Hf/7l3l3i9Gn3gPTgbSZ9lfKMVtuJDfBEBPJuR6RAk/dzoWQVndMvgDKlmZaAByhfSN9Nqf5A7kNvX+HancR3873mEYWGXcw2lsbtkf/fUTkqNfWtHLNM1WuOxzFsr3p/PwxRFaUAh6bXDsk5qW68fCpsTGa8ywt5ZCAE8r9Gf6ifIzmytVkcER7jEoS432kkHSGc+kaG+8kzRiH0t2JPidQQR18uYlKoDIFzRi+AZ9pGTe2ePv2hYGqz5khDzUNN/8wAZLfDpB2qAe0cKBuX3s+Zapj7eqdSu6ChvXnOXx7bkRNXdolPoiidoIkMusEPhzStjLDrETEbSgYTDfVRizuKevdTcZQFySE8opfQqfoTEAyDD8QDSOr+6ZRZwepr4KYvAnMGNlosDCzxvJCzvrSRMfc2UAl3bC55jg1qRtUu+WTV77fi/0KwWcVBuOwlpBWksnEBUEYBoI/nfkrVBQ44BPWx8sUrXXO96FVC6wPhu9fot8IuyAw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IqVZSOPlAOHx9RIVv0ZE9pr37Mjul0dwHTnChQNcAJx9a1JN/vj/sn+xwJep?=
 =?us-ascii?Q?E6200OdXxZOUrqb35JAxjE7BdTpV74aAI2bRRyXbMsoCMhxD9fMNda5rRhgT?=
 =?us-ascii?Q?JEk92cOL+tNAPK0x50Zg+2SYL6Mz5byLjnVO2CL1NBL/km/QacjyZnGWx5UR?=
 =?us-ascii?Q?kOmGPqQpo9KliGqA86JPf7yEly4r+6iUa1YjwlP2jRfwwhA5jH/TnaVgchj4?=
 =?us-ascii?Q?fviFlEyEklDMXl+4SIn/EtsNClgUecysO+ATXFK35YwxttPkWNbXWQknrhGV?=
 =?us-ascii?Q?wVmRhBYGbzrs49rlvOGONE8UBTFGNQ714w5sxROsOfOayLOOJV/y8Y8ySoyd?=
 =?us-ascii?Q?0zOfzxJaPEvZ948cdZvH6zAFM4dOuxvv/fnptNl/kOLBRrA7KkuttddqMRv4?=
 =?us-ascii?Q?d6/cg6yp9GTo1LtPK16l0fJgvJDDv4z69MuVjoCBi9e0bada3RyIDRHMwXW9?=
 =?us-ascii?Q?4IjBNgvV8XNvmRLOz68d+kEPOhEw9U2rBsWypxx3Dhzzv1HXs/ZayoYgmgYu?=
 =?us-ascii?Q?PZyDr6zOu9W4fPPImVCJvcdKi5ba6v0xfLWFDMDFeOFMOcKotswI+8kpUO+s?=
 =?us-ascii?Q?gqERsoAazivna0pYMDw8WJ1da8z9IUDJUnitQbAWMwhFBHGICo/EF2deKEXT?=
 =?us-ascii?Q?b1WB3s0jARXH3KMXdg4TMKmmoeZfK/MXDK5PfCeMaP40tvKMg1vr4gRD5PdD?=
 =?us-ascii?Q?bYtD2M7BqB7OxdGR9BCuL75uXMADbAKsB2LbV077XBUWeKEG9rRWa/ejcB1i?=
 =?us-ascii?Q?xHfJgxPbmZ5h6r8nRqJ0kROKzdJs8E2SwMvtExHi/KuGHllxIC4c1fLLnX7o?=
 =?us-ascii?Q?9Tar5MJike1ckEssRp+vHBqBKIB9i3ntr5js8HuNSgw6WvC6OeKc41n7xX/l?=
 =?us-ascii?Q?/68YRO3Si6pyuAmJlXodFenIRPG6RkUQBGf/h1DugsO0ckXRR75WwziaP00h?=
 =?us-ascii?Q?nAwVVp/UjzsH9TwiVyLNIfdYNHCiU5Uravq7pUTa2071IzTyQars2cow1jDI?=
 =?us-ascii?Q?7YeBgZ4zx1IEf+R8Xwp3UTmSUewj2LOH43Fhgl1eNPtZ30Oj6YFbLY+KVZ1Y?=
 =?us-ascii?Q?2Qf0tejC6LTlor3GGKWezVzljpEjEwD3XfO1o2YtVsUPuEnOdejkDvP7tuEH?=
 =?us-ascii?Q?tpDsY8g7tY5jtSkDkKhtQXBBi3dPuO+8SALqlGYl9k1DQ2X/jS/J1lJBkE4l?=
 =?us-ascii?Q?ipNr3PRIJ5OLr7HTg9QPrIjNjaiqJpz8qj0L7yfozEvMktHsvbWNUV/vasaw?=
 =?us-ascii?Q?4RFXbg962KFyIAKz0CrPtah/k24W9Ra1BbTXNZFSP0hS6jqpzu9j86qZl+TD?=
 =?us-ascii?Q?PhQrOhbU4jRCjMKmF+J74eWSEeNnKrQYkg5iPtyLc1k3KW05/Ft+9esQ2BWT?=
 =?us-ascii?Q?XnGKGcii6276V7Z6f+w3tAM7v5sgvM/KWHWeMRHgp2HvmixvgiRnSQA7wE90?=
 =?us-ascii?Q?isd3g/kNokBR6hO7w3R44uULTG8s6vPDkAm39oKJmqaJp6+hwliM3+AZAmUX?=
 =?us-ascii?Q?RE7OA/39V3bLWutviZ7Tm8PzTdx1xJbVibm/KuacOB0A9Fp7kQV1HV5tz/e4?=
 =?us-ascii?Q?Try5sbJwwTLeZy0UGHobgKN/par4VMLOCX2L64TzgTzL2DBQf68PpFowcTCo?=
 =?us-ascii?Q?+4NcSb7OQ288FthR7BZI2F12Iv8YXH51dYu9tu7ouGs8oZJX+qafBQ8RaCVK?=
 =?us-ascii?Q?tK+WnPW2E8ywrbjNYHfpFOoEtxrHgYT7LRJCH61mPBt7VNP9I7ovpMRmHkjH?=
 =?us-ascii?Q?NeW1qe0c1A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: usC+1vVzIQnsqXlC+HCdDhRtPa9ExvmmMq1ODWZl2H1TfwOMavkYuDXzy0okKUwuApaRos9yK3Ti42RPjgBBBrhGhPsR9CxZNE4Af79y+bxGDnO3pK71+tacEKk0kNdTkxjtaxgMOrVyj0jt0Km5U9eIogzG7W9SRiUgOtcnfMiiNI/kqKcEICpBfeNxWo0mRtSxL0kKQqvCj979X2ojkd9Lhc0nGth8cq06MnbxjfOpSydMdUnBYa4V4+Q6B7Ra4UF8q4A+He5TVDiESXPMOdV8+965/2sHVwk5ruZueL+2z89bNfGLwOrCI2+WCBHfanDY1OJWCGtO5XKBoeeKjw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2272f796-2322-4ebb-c0fd-08df0d5f99e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 04:13:56.4090 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EeqNIh7qJpqVQgEpmbblvXHxuL3x+vNDi68gKtOXey4TpMM8jUNjwhQob5n6sm7ZSm/+l9bbh1jpB4h0R+/BZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6705
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

> Subject: RE: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
>=20
> > > Its observed that on AUX_CH failure, even if the retry is increased
> > > to 1000, it does not succeed. Either the command might be wrong or
> > > sink in an unknown/sleep state can cause this. So try waking the sink
> device.
> > > Before reading the DPCD caps wake the sink for eDP.
> > >
> > > v2: Use poll_timeout_us (Jani N)
> > >     Add the reason, why this change is required (Ville)
> > > v3: Wake sink only for eDP
> > >     Remove the dpcd probe set to true/false in wake_sink (Imre)
> > > v4: make edp_wake_sinc() static and dpcd_readb -> dpcd_reab_byte
> > > (Suraj)
> > >
> > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
> > > Closes:
> > > https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16654
> > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_dp.c | 34
> > > +++++++++++++++++++++++++
> > >  1 file changed, 34 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > > b/drivers/gpu/drm/i915/display/intel_dp.c
> > > index 0cd5e6b5034c..d4cc5f7e82a4 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > @@ -4779,6 +4779,38 @@ intel_edp_set_sink_rates(struct intel_dp
> > *intel_dp)
> > >  	intel_edp_set_data_override_rates(intel_dp);
> > >  }
> > >
> > > +/* Spec says to try for 3 times, its doubled to add the software ove=
rhead */
> > > +#define AUX_CH_WAKE_RETRY	6
> > > +
> > > +static void intel_edp_wake_sink(struct intel_dp *intel_dp) {
> > > +	u8 value =3D 0;
> > > +	int ret =3D 0;
> > > +
> > > +	/*
> > > +	 * Wake the sink device
> > > +	 * Spec DP2.1 section 2.3.1.2 if AUX CH is powered down by writing
> > > 0x02
> > > +	 * to DP_SET_POWER dpcd reg, 1ms time would be required to wake it
> >
> > Nit: DPCD*
> > > up
> > > +	 */
> > > +	ret =3D poll_timeout_us(ret =3D drm_dp_dpcd_read_byte(&intel_dp->au=
x,
> > > +							  DP_SET_POWER,
> > > &value),
> > > +			      ret =3D=3D 0, 1000, AUX_CH_WAKE_RETRY * 1000,
> > true);
> > > +
> > > +	/*
> > > +	 * If sink is in D3 then it may not respond to the AUX tx so
> > > +	 * wake it up to D3_AUX_ON state
> > > +	 * If the above poll_timeout_us fails, try waking the sink.
> > > +	 */
> > > +	if (value =3D=3D DP_SET_POWER_D3 || ret < 0) {
> >
> > Should we maybe check ret < 0 first,
> > Because if ret < 0 value will be bogus and if value =3D=3D DP_SET_POWER=
_D3
> > than ret was not < 0
> >
> Good catch, will change.
>=20
> > > +		/* After setting to D0 need a min of 1ms to wake (Spec DP2.1
> > > sec 2.3.1.2) */
> > > +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> > > +				       DP_SET_POWER_D0);
> > > +		fsleep(1000);
> >
> > I have not seen any use of  fsleep maybe we should be using msleep()
> > instead
> >
> fsleep() autoselects the sleep best mechanism depending in the requested
> sleep duration.
>=20
> Ref: include/linux/delay.h
>=20
> >
> > > +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> > > +				       DP_SET_POWER_D3_AUX_ON);
> > > +	}
> > > +}
> > > +
> > >  static bool
> > >  intel_edp_init_dpcd(struct intel_dp *intel_dp, struct
> > > intel_connector
> > > *connector)  { @@ -4792,6 +4824,8 @@ intel_edp_init_dpcd(struct
> > > intel_dp *intel_dp, struct intel_connector *connector

 Here [1]

> > >  	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) !=3D 0)
> > >  		return false;
> > >
> > > +	intel_edp_wake_sink(intel_dp);
> >
> > We are reading dpcd caps just before waking sink should we first be
> > waking up sink even before caps are read.
> >
> Yes, this has to be done on the very first dpcd read.

Yes so what I meant was should this be moved here [1]

Regards,
Suraj Kandpal


>=20
> Ref:  DP 2.1 Spec Section 3.5.2.16 page 966 says " Prior to link training=
, a DPTX
> should perform the following:
> 1 Verify that the SET_POWER_STATE field in the
> SET_POWER_AND_SET_DP_PWR_VOLTAGE register is programmed to D0
> normal operation (DPCD 00600h[2:0] =3D 001b)."
>=20
> Also Section 2.14.9.7 POWER_UP_PHY says ensure the immediate downstream
> device is awake
>=20
> Thanks and Regards,
> Arun R Murthy
> --------------------
>=20
> > Regards,
> > Suraj Kandpal
> >
> > > +
> > >  	drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
> > >  			 drm_dp_is_branch(intel_dp->dpcd));
> > >  	intel_init_dpcd_quirks(intel_dp, &intel_dp->desc.ident);
> > > --
> > > 2.25.1

