Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BCCC79F89
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 09:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0676810E739;
	Mon,  7 Sep 2026 09:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIXatVkQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8E110E739
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788773838; x=1820309838;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vfqhhWX/6z+tfYOstmKZU7r8fPXtit0YIGuQTG48QOI=;
 b=CIXatVkQtUOMPgJLd08aHp5eiS+JD9eKiA7qPDh/aDgQ9kVO3dHWluHK
 bTi+Bhoy6bSXTd2P6e7MQAJmMctNNrZwOJlAFPbbL0kD6vRUl20gt5ZSp
 TIHaqv6mQhyUMo3xBbzeehKXN8/EDQj3v33RDD1yLixOd1vnj3vvLZmxT
 UBcn2IXD7WJ3w8pPP925eZvuqBKxwhjWvA4ZT1anCRqH1LfLi2mikoLJz
 cWFwWRSrTDgIAYiu6rDQC0KOfuz1g+q1KQdXvo0wrmP7cA9EkqZTf6e4l
 S8522xkeLsRQeilE2s+Bd0jW7UymoWMVgLxdfu2GWV4k2VB+YDCJLKg4g A==;
X-CSE-ConnectionGUID: dVgikDCOSD6yNMd9Wdpo4w==
X-CSE-MsgGUID: iCPq/TBcRt21afgKyDUWKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88935639"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="88935639"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:37:17 -0700
X-CSE-ConnectionGUID: zzkuEzAcS3iqjruyObFSsw==
X-CSE-MsgGUID: yzhihgfFQ2y7q5SQ2d917A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="268087959"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:37:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 02:37:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 02:37:16 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 02:37:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gtt4pB4Q6fyRk1ldw7xkl77TWhBp2kGORY/cd1JjO7pXyvnkO+GfHus6MTh4a0/9yYfE5WURDtiOOwY6gMOY/1tkONT1c1IOrf+Q7KNfwqlHJKenZcdWlTEOpY3SagRgyyI4o2koln4Kod2V5yDfQ0Ooze4CKy6vl4NstmXfgLhcFRJxgrDBTtJOVcsi7l5lgUMlEm/+3lS/djK2iF6Pnguxv8Gz/i0GDL17gJigOsRCkl2UaqUqj3RtBhGjEhwLQHr0M1Rb9t1S2dlq7/VA1zYUsBFq5qaLMOhmb+OchlUFy3LuUTkYx/DfUoJ3D6serVPagPr0AIbwnyrnvX1Jmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4y+h4rDNBwFxAalC6yree0jJs51KOZ8K+lXDtedvig=;
 b=XskxlCT1XoFgLa7C8jq6OzH1jJvugwUkeEIniclq69DSypw1j+MirlScDJHxWha7Fr8vFtIt7JO7oJ7Hkg65uq1S4ifG5/48kq95WJHOApcFdpda6Fcy4ypH+oTPYxYeZ3ffpiUCoqXLBWJXRjgvISNL2nyKxk0rThnn4z/+jGT0wZfQPKbX0HH+6Ll6nJEGEQ6YVpT2jLdl0bopZ18eQ4CGxVc9GAp7o9iHbMmSgMDS7gYvvKpcanJ+jun/dJzkMd9AC0hHbZD9LncLm3+14M5d55Xm0Xnu9CzZOSacZDso3SUy/Rlj6IZupcyZrPyZb4TfxMvGjdizZ2Oj1AXjQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 09:37:08 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 09:37:07 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Topic: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Index: AQHdPqs+e/R2G4R280OMPSGZx30DYrbC2lGg
Date: Mon, 7 Sep 2026 09:37:07 +0000
Message-ID: <DS4PPFE901A304FD882DA28D5F4EC62D86FE3B22@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
 <20260907092707.1823088-1-arun.r.murthy@intel.com>
In-Reply-To: <20260907092707.1823088-1-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH0PR11MB5095:EE_
x-ms-office365-filtering-correlation-id: 57d9082a-5ff1-4526-bb1b-08df0cc3957a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|11063799006|4143699003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: jWDzuQLC/XL4pgEKBzV5HYHbqwrMR1P+kpFeFf4BE0d3lUm9uxcFjsrHDsrnONZkUgg/ywOqe6jw06WxPf0Tf3e3TYl9TcmOvlyJGOWyaxV+NWye85ofJVHlOOj6NvGFvcYSnUfUhYOg5lAdt3oSS/vulPChLfSzkYscAw5dX9W/xVKZ3ZOJt7qLpcd7JxkX39MjoTbXvNz5CbbDZeZQ4SitHWgb6WB6ogW0EntZyM2p64w1nC0FWW5GxmgfR4HNAcqIkI7tbFLmNp78xh+aqyQRMKLY8E8MQA3YJOKi2F64cDl7v80x7egve+FCW17mYVdaREsmoy8tLDNrIKOD1pxAtjAobm6GENEQm08lQ0ZRiribyWUDSfZxV3YR1ug0sj9cqe2PwZc6QChhK70rPh4+ckN6j4+rxrWZqPipt5k4dzh+aZs81kS79GnDVuFNknr8kCYEs48yLaF81RlakvtRqnLmMFTYIgIKVxkK71+XGvzlc72NtImMB7/2N2bqOguMdeJcf2uDLV2B6P4ZmcfIPlCiJkyyHbZgtoNSMn2JQw3ydwQ8mL2b6ebcodRHeKSfHNU+lpgIh2EyUf3yC5JgOXfYKCWTgHPLAPguzJiUPZ1k4T4jybZesUe8dR5+rq85fJtxJjK50h3fuIrghnXHMiMavkIsLbnr301E6Fs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DF11gvnfBZ25CnNlnolOuO/TjV880PR47qB1iirv/jSu7iyEUpckQlCn+CuD?=
 =?us-ascii?Q?RIl5wnpxa9vLQUSHcd6rNR9KG0yb5G3mlwM3xOVflSIecb5Dk267dzsXVIuq?=
 =?us-ascii?Q?8NW4W0S/7qsHc8a4eoR0wbRi/PEBa/JrMjW+fiQ8Nuopkxm+9MGR4C2sSnK8?=
 =?us-ascii?Q?tisbbJCNmkLR5scJDtcQEFZ90A6zOWlY8h4dNjUC3k37JVVHwQwjxLNbtP7X?=
 =?us-ascii?Q?//H+oeuO/eHYgDC+6p3OCQrI7RljJnZnPxM4AIai9BpwR1cDZ4D4y6kCjIxW?=
 =?us-ascii?Q?g2jNBbUfLitIHb+0zHmgBRF+LetpmsCtQbQb0O6ByaP7TTF7kvH71lmyPL+p?=
 =?us-ascii?Q?WU0MQbYRQsejwqlBTYXqWH0CE9Ooj9rvGZvTHPH9IHRZ4cie06M6wDUU2ryD?=
 =?us-ascii?Q?QCg2JW2Pzsr0t4H9Kl5iP7QTGOJm13SWMchKuqWqL3LFPDpyj2PTQ/H3EA9L?=
 =?us-ascii?Q?Qf8LkCLF9fBkXZ8pKpYzWRG83M3HK/IlmLfcy5S8ub6gUaYzy5CP28c1oQc2?=
 =?us-ascii?Q?VulXdKrRnjX+cFUXgIBbzcvVSJhqV7em8ZWyuYTOeEso0pcbx1NYdF20mZru?=
 =?us-ascii?Q?AcEi9R87S+eTGTsjYt6BC0ve6moJb+SoNar1cGSAt0wuiJtL030xfkEfMlND?=
 =?us-ascii?Q?q8A4f6EFhIKKgw1Me+/nIcRCuQIFnNn419uRZ4MWnba1RZ42R/oFhWk75hkW?=
 =?us-ascii?Q?pdgB7CQ1q4loEcrwfz2i8Rez+KQswD5AEItbnrkX/ioc5C3A8dGoCxf1FRlm?=
 =?us-ascii?Q?3TI7kBrdbH1n6cavDc9HwM82qIxjYX5Sdw4tcNpJTLqrAxpcD+R7HkR0VjUc?=
 =?us-ascii?Q?Xr4jgO4TchRc9s9DPvp/y0TB9ARVah9JBDuMlSKzZzHAI1CWGmVo1mzmgkeQ?=
 =?us-ascii?Q?3XgrttVs/+q2AjXwd/lAiq8V+/qfb5lVfkfGPv24GZauT8Xb2vznBlCvap8t?=
 =?us-ascii?Q?hmu33YKryfbyAUMB1k3AMeJbHJlqiFvWRbFJ9QrzrxMf6TonNWsRjPTA/6Pc?=
 =?us-ascii?Q?HLAPSpyp5zFu0lfMESl90xuvTgzaSoXig6EOCPWSviWMUpn4pj2vLMEopb16?=
 =?us-ascii?Q?WuwDd8qsSD5WnQXFQydKoftY4ui6qwtbJMcYt0ifXxGHXOhDHNyvNR2Mw1mI?=
 =?us-ascii?Q?TCWDp9GNLQmBN/Jbhk/gtNSJDjasr0E3Q+RKbjL8Wz97MoXIZoq1HpndE32R?=
 =?us-ascii?Q?jP4XtATdfEWBR+apnpxor1EM1IRdTEnpkS48ITewHtNOyhvIyqrbAtbMtwRY?=
 =?us-ascii?Q?EvtsQELx82gUIolS//6rlOqDm67mg/WXTbx9a3DnVT9ertX33fvwlw6XqCR7?=
 =?us-ascii?Q?cy9hjvvcQBetkr4PBea8O0dJerRkeMslvxehbjQiZmqfmrzMGllTokC2tg2i?=
 =?us-ascii?Q?JCWDX3VSmXVuCA+s6+ND9tjevybfJYsGIJfdG9fJcC8Co+wVaBH6pwG2BtwB?=
 =?us-ascii?Q?ytQt4/FXQI6eiCuYBiysvrPyb6d7Roi5qNZfqrlTTlDwv8Tea8/AZFQLYgMq?=
 =?us-ascii?Q?R+lA+l3dpP2KdMoczrLv++WPUI9Z6SsqROCOjUSrTiTDXlmDOFG7R86sYom+?=
 =?us-ascii?Q?8dFkU+0MjSWyHFX+0SVTcwvvEdcJEui0XN4u0Wdij9K5qxSOyNx45Zc7HLVF?=
 =?us-ascii?Q?YQkaYzIZhs0SpcFpN3Xqiql8WyPGFXgEStKF1tvwGjyGomYNTZctj44dz+ON?=
 =?us-ascii?Q?4XnFAvdZb59F98dld8IkfCir7dtFgMRMOUF8inuZaabe+/V3qsKBlDJujnMq?=
 =?us-ascii?Q?Yb64XuAWnA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: B2BnCAMcwfuj5XNWQyFXNxsmrPzoPObOXcGmKYwmnX1+7iCbub7RWsIMmbq7v41vspcFc2X7nOx33D9ojjvu5/yli0w/rIkEmcoUkyYIqPFFwk869Un0q926UV5sPlloEp9RFAN8bFat9NIw+9tuPA/qw9qeDno1D/RjqRPMHncyozffqdJTQzqZs09nISq9pjP5Uj+3PF6ChqC+0dAyUw+/pwM1QS/YIFF0Iw0ofmRiMHW1CPzNYW/zbZ+5sdyhIQutethMIBNuGyCJ5ksCwHstSeMA7Dt452NcAQc4sYmOJyYFQ3mSB83pTVqPkVIF/Z5Rlja1l/591za8sEOSkw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d9082a-5ff1-4526-bb1b-08df0cc3957a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 09:37:07.5182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VlPgCiFOgjtua/6U/WDT4WOBWbC25H1y4Pv3tCKR6q6On3vy0rfYSp61xf6XqdmcYag9LA7GQ8btRWf4M4Xoew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5095
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

> Subject: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
>=20
> Its observed that on AUX_CH failure, even if the retry is increased to 10=
00, it
> does not succeed. Either the command might be wrong or sink in an
> unknown/sleep state can cause this. So try waking the sink device.
> Before reading the DPCD caps wake the sink for eDP.
>=20
> v2: Use poll_timeout_us (Jani N)
>     Add the reason, why this change is required (Ville)
> v3: Wake sink only for eDP
>     Remove the dpcd probe set to true/false in wake_sink (Imre)
> v4: make edp_wake_sinc() static and dpcd_readb -> dpcd_reab_byte (Suraj)
>=20
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16654
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 34 +++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 0cd5e6b5034c..d4cc5f7e82a4 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4779,6 +4779,38 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp=
)
>  	intel_edp_set_data_override_rates(intel_dp);
>  }
>=20
> +/* Spec says to try for 3 times, its doubled to add the software overhea=
d */
> +#define AUX_CH_WAKE_RETRY	6
> +
> +static void intel_edp_wake_sink(struct intel_dp *intel_dp) {
> +	u8 value =3D 0;
> +	int ret =3D 0;
> +
> +	/*
> +	 * Wake the sink device
> +	 * Spec DP2.1 section 2.3.1.2 if AUX CH is powered down by writing
> 0x02
> +	 * to DP_SET_POWER dpcd reg, 1ms time would be required to wake it

Nit: DPCD*
> up
> +	 */
> +	ret =3D poll_timeout_us(ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> +							  DP_SET_POWER,
> &value),
> +			      ret =3D=3D 0, 1000, AUX_CH_WAKE_RETRY * 1000, true);
> +
> +	/*
> +	 * If sink is in D3 then it may not respond to the AUX tx so
> +	 * wake it up to D3_AUX_ON state
> +	 * If the above poll_timeout_us fails, try waking the sink.
> +	 */
> +	if (value =3D=3D DP_SET_POWER_D3 || ret < 0) {

Should we maybe check ret < 0 first,
Because if ret < 0 value will be bogus and if value =3D=3D DP_SET_POWER_D3
than ret was not < 0

> +		/* After setting to D0 need a min of 1ms to wake (Spec DP2.1
> sec 2.3.1.2) */
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> +				       DP_SET_POWER_D0);
> +		fsleep(1000);

I have not seen any use of  fsleep maybe we should be using msleep() instea=
d


> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> +				       DP_SET_POWER_D3_AUX_ON);
> +	}
> +}
> +
>  static bool
>  intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector
> *connector)  { @@ -4792,6 +4824,8 @@ intel_edp_init_dpcd(struct intel_dp
> *intel_dp, struct intel_connector *connector
>  	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) !=3D 0)
>  		return false;
>=20
> +	intel_edp_wake_sink(intel_dp);

We are reading dpcd caps just before waking sink should we first be waking =
up sink even before caps are read.

Regards,
Suraj Kandpal

> +
>  	drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
>  			 drm_dp_is_branch(intel_dp->dpcd));
>  	intel_init_dpcd_quirks(intel_dp, &intel_dp->desc.ident);
> --
> 2.25.1

