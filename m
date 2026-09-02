Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96469C61DFD
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2026 08:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0576510F0C0;
	Wed,  2 Sep 2026 08:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cECk/O6H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DF010F0C0
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Sep 2026 08:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788339170; x=1819875170;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rV5J8x2YNstTOaChROgFalSSpZ+qkqLIn8sojy7pDC4=;
 b=cECk/O6HMoC4FGDRPsKrWxO9MpPBvV18VVJ1RQJFhji/Y2pSw7kCe+ar
 a37p88zK5+9hXJnFCmIVgnrx2pdhAMLWLPDvikwWKQXOcEoCwd+XFUT5P
 L1ZZBBqkm2bgIi75AX8GiOsfxpYs5LldluC4/2A7pNi4KVgo4Dl50/uUZ
 HRWoo8zKH+bTI/pH3IOLNMuGU3WI2LQ0ldemJW2yYzvTtjbnTe+AoRI5R
 K3YMVVxs3L81aAr4vPoIOtZ3+u9EKhRMMaFipeDKe/BgzRBKof4X0cE9u
 A/wErIGuBbidrZDFyxrNM33cqiCx3mzJNg6e+Zy2AOvujwdrLkSwyfyzF g==;
X-CSE-ConnectionGUID: dIPbUN7TSj+Wsj4H3Y6IGQ==
X-CSE-MsgGUID: udgKpQn2RzyKYvF7IJCDvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87927985"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="87927985"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:52:50 -0700
X-CSE-ConnectionGUID: o5p3qysLS5+STKYdYnZZIw==
X-CSE-MsgGUID: xOMhBLY+QZKoRdU7r8uPOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="292857705"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:52:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 01:52:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 01:52:49 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 01:52:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivZhjDppR978AOo7/86FQ/8C7ULBwnv8ygFC01oPUeABbpCyPuf8jBuyEn7Tkn+KKkIaZwhKP88tBqANYNcaRhrAl+c84V7eCC3lPY6jInkqQrzt7g3tibM38iQr0BDhStrBk0h/ZbGZEJabZp/dSccpLEYzGDPWVe6UXHYhQElQTDT/OFMVfu3u2iYIfKcZ/7DUpR3y/cOBGUPVH4zuICuX/3ESvKmCFPBdoSA9A4g3VaFxhYv3hyyGjFtU8gHvyxXv0gAscc/r5ZGmstRGl/kSU1iBa6EReJGn9sMxyWsdGTzKRmmDC6W78l6jQNgY9WNFjEsP2Js1SWFMHygvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgQkhaZGmkz2HFnP9iMUZRmrsZvtSAAyPMQrIFHB/nw=;
 b=oiR6VvNQY5W4DmyP5MXTs3QmmR+HU6uPEsFlnV3dLkSODLkBVwLhdi4FHlE5ykhNJrfJNNtP1ByFEj4/x2Vo+tRChWe0a3r88cFzuShPOqjOugnxIVkzA4t2vcQ/vRd68r8ey5aaBgnGVd+Q8ex90DLHhVh8tWUB/0zMrQS8r0YLEk5vn6vyTCLR4ZbFR2sVTPS8JZmoVaB3YO7yxIMw15wojdzsJBVEwMzOnEwYpFGjpnueBfKSStTJvsQXqpEUVFTcn3Vz+WRMeavDYSX74XwTNtrBXYdBY4CoLUeZ/FPcI0K60QYSDel9M348hhr2oDarl5rHFIEq60xAMZ5/zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by IA1PR11MB7320.namprd11.prod.outlook.com (2603:10b6:208:424::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 08:52:42 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%2]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 08:52:42 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: Adharsh K <adharshkandath@gmail.com>
Subject: RE: [PATCH] drm/i915/pps: don't orphan the VDD wakeref when the HW
 force bit is reset
Thread-Topic: [PATCH] drm/i915/pps: don't orphan the VDD wakeref when the HW
 force bit is reset
Thread-Index: AQHdOQMLQWWEFleYSkqmuL5xebxQera3svWAgANLQ0A=
Date: Wed, 2 Sep 2026 08:52:42 +0000
Message-ID: <IA0PR11MB73076E5B63630824AAD98E6DBAB72@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260831044036.1236136-1-arun.r.murthy@intel.com>
 <bcf68c2a0dbb39359d66c805b35db7f809da9371@intel.com>
In-Reply-To: <bcf68c2a0dbb39359d66c805b35db7f809da9371@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|IA1PR11MB7320:EE_
x-ms-office365-filtering-correlation-id: 73602bce-a1d4-4aee-9e08-08df08cf8cf4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|38070700021|22082099003|18002099003|5023799004|56012099006|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info: 4IQJZ0dKBxWzrH/VQDInRu4fyD2WkBE4TCaom0AkPAe7QCYP8ZvUgxAbvIyWZnXKbvEURgFGiqzrsrlkxleKmQLNKJtngxTMAa8p1PGknNzz0Aw04j8TMWzdND0ZQGSao48Pcux48GipIxuoUio8Y/bPzQ4zu/Ie4Y+wx8d0yGAv8lfFmucRadExoG0Bz0w0qE0scC4jSPKmQGFalVEDlxZ+76tWqzSm6DHOGXEmjDOhvqRgisQtFyQ2owxYV0Sro6PNRoV8cRwvjy0HXQJPP0znM4RPOhVCC175odSrqd5BUikEoNQWIWPzbvxfieXclR/6seXzF+5/69sKADFt4NBay/h1+Y5lLO77xlUOukMhtP6yVnAbX7D7p0mg63/iXgYw4yF36q9cDw3M0PS6YEWswXaY28HtrMNJz5zZeoqtTWmJWyMyX9LI361Vo3KZ1/PK2AcqjUfZO3hVLDcZg7Cnd4vJEeWfe5c801OtbZXe4bBm6/qJ0aIWSEaSGk1Q/dajD4oVSqpzatUlbcPA4Xvf/J3HFF44Tvnw+8tdCxloyRgDLK7kuPdtJCIEJLbvZwabbiCKqRbWivCzp3XRK20tnDrr6szxZlS8CFjC7iob03c9aYrwzgTMKrFN3aptALvFx2GzidKiI1WNXOjNCksJjjKqHh8qX7nuqHzqPsY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eXW7fkEH5wfbNOhuuY0rUcbND6ZJG2dwMJki+rp+4RdhZwPJ4eq/FOrTU6Ji?=
 =?us-ascii?Q?9OLSCCQxOgRySfZH//sFt8uf2z6R46GL4kGghq5SpOvJuRAvv+kgE6Wm1S++?=
 =?us-ascii?Q?kIEr+GH1qlJsjR0YeDY9slXOQSKIJyGQJDiWUfkWcgrGTBMqHzL691/Fi7Ji?=
 =?us-ascii?Q?SwZaL6/YaWF34c6HhKCmV1AmGXtp0QysP1fGSRQELmnZjH3ovYLnivhlyPvP?=
 =?us-ascii?Q?vy/T2/uafGo5CEoWYo339PG2zHU61PLRkCBLbhCNfSWqrsLUB9ii+HkyytNo?=
 =?us-ascii?Q?ySstegiobPZPa8sP1WL01fyDkXcBWyKpdNK4jUasRm6tbjX1LU2OQJJGvRA3?=
 =?us-ascii?Q?Lh8SKj6TQichwGlwQ5syJN1INBKLnAL0jer+YX/BBT2KhDn5Z59QtKZC+TIk?=
 =?us-ascii?Q?jAfArj7Fo4e1EKcugkaEhR7vPWrB7ocfS/mcrHftYPY3Ic611iTknVXHlE5L?=
 =?us-ascii?Q?JskuP7rASp0BTXbRqj5dMtKzI1bhd+98nw9MHWz/t8V6d3iwL3hWEKVOQ89Z?=
 =?us-ascii?Q?ktHWHtGK/o7t6suhSR2jY2JXva8RTCys3adpXHZWLlBmaEn5+NfkJVMXPKAk?=
 =?us-ascii?Q?kWh6O7d3f5IAoXlUoTG5rjpXfOwQcgkIuoKXQa7+A51yZkciMRGZlo4lY+Wu?=
 =?us-ascii?Q?agmLkonY2XgGSQjUi0rqRaSG6HqHCGgRJp4j//YCJd9bXonZVZuG6aiGbmms?=
 =?us-ascii?Q?tdeB4Qa1trzHdFIVOZpTBibrutYjeXKOvyBG5jwbVmPT59GgdRsf9G+5OCUb?=
 =?us-ascii?Q?SaVPtbIjORKhDesNoVNC68aKzJNEb483/jkcIGe0XJ02xNkkqm2OVkiVfzRa?=
 =?us-ascii?Q?yS/lACnAisBcbJjYjHy0EE8RJyR+Pc+XP6+IYgrKhSRuYlj7ozHsXuBWkdeq?=
 =?us-ascii?Q?36eSTycZ5Uiwkfg8ndTDkP+ulAKaT4OYdJ1s0q587rCAaNUeyhiR3bdzXno/?=
 =?us-ascii?Q?HrAWi82fplLFJXX5XysBFGgsSHSqiIVHFh09nVqY+FoproxOPyW3XIry7Vmx?=
 =?us-ascii?Q?mXD5A8sz2c3Ta5M4Puk9J+eFASDe0rtqtN4F+kVw8KMVL7aDRdoxjQWr5dO5?=
 =?us-ascii?Q?z88fZG+OewRS473geYce5VX/8M1T1N/WK3HxF5R/cbgGXgcvoUIlrjAXBbMp?=
 =?us-ascii?Q?URE7TUSDh1lXYhewWbi8rDwhKIX12aTO7t/oc5VQLOXfRAROCeo7HoiIpK0t?=
 =?us-ascii?Q?EydTrHRqoKiyvwp1JuXhRNkjKAu4e/UP5c8UJklxaih5Um7EfTLyZtcX1wFG?=
 =?us-ascii?Q?0o8CXcQvohOb/hQwDrjpGuhYhyvEhuB2eZKc1Eryp+/Fbsygqha2SuVaxYa8?=
 =?us-ascii?Q?yZ0/Kljc+t+ocbW37rPuH4cOA7yKYr8/TdO5owAVM2EOJrctjRQ2A9cipe00?=
 =?us-ascii?Q?2CxEhvI2xF0VBsPoh2nnF+3eSUQh8bcYBg0/inSz1puJuXEuUjM/+Wf3h6qt?=
 =?us-ascii?Q?4Zcnpz+U3lRdukrPDgUB6odrndu2vqvlaOdFRm3vCIELC1iNunQWxHiWHRuI?=
 =?us-ascii?Q?/8fH5HZDSUWuVdRXlkod3/PkOWOE7TB+Hd8VT5HpVdbcXLCmiGFfko5rYTs8?=
 =?us-ascii?Q?PWoFj+ef/do7RZjV3h098xa84smtxgjGRdN3dbTEkxQ1sHScChszJ8Bt68KR?=
 =?us-ascii?Q?fk31eaL0nRX0DoI+cvUVhdLf9O1O9DZGXReC7E5abDL7dPSCBR75a/L2rzhQ?=
 =?us-ascii?Q?YfHMvMUFowIH7KolUjp8+uFM3S+CQ1WwxscW28lhC74Zy+k8SirkLB5I2IqD?=
 =?us-ascii?Q?WF2AFGuouw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jZFlsbcmrAknMu058TiIz44xmDu6aM/uKs8lwaDJsA8eeroUsQUswwyEML9+mICi1cDiMeb45BkSn5PgyC+goqrfTXU8XNdBnZd6jFZ5obWtMxnJG7W0qXZXEDoD1AzV42rhlL9faWipUZS3KL03pXhebmQW3nREMInBKUVxQtj1DxU2F5hMbZcn1fsmfIhlRy6DYYNDE0mRRe9AklHiL4yxyQ6TLZ7ozZgBO+4uxSu5801+gy35kEqw0gEm2UdDcJmZ91d8nsTK3xeK6tEaRr0V0YsHxAqAGS+aYXsbr+0+4ub2HpaqO90cVKvH06HL3nysSoVIXQETkPl6U+qsLg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73602bce-a1d4-4aee-9e08-08df08cf8cf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 08:52:42.5869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UXxeEtzjH4rL2EkuMUo7/CRAqtaxc2/1AJ/CYMeBWzz4yNNtIIcFNWT88lroGT7n6UKH2vFagc6fL3CU+3qiHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7320
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


> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Monday, August 31, 2026 12:02 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>; intel-gfx@lists.freedesktop=
.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; Adharsh K
> <adharshkandath@gmail.com>
> Subject: Re: [PATCH] drm/i915/pps: don't orphan the VDD wakeref when the
> HW force bit is reset
>=20
> On Mon, 31 Aug 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> > pps_vdd_init() takes an AUX power-domain reference into
> > intel_dp->pps.vdd_wakeref when it finds EDP_FORCE_VDD already enabled
> > by the BIOS, and defers dropping it to a later scheduled VDD off.
> >
> > intel_pps_vdd_on_unlocked() decides whether it already owns that
> > reference by reading the live EDP_FORCE_VDD bit via
> > edp_have_panel_vdd(). That bit can be reset under the driver (DC
> > states, DMC, BIOS) while we still hold vdd_wakeref. When that happens
> > the function believes it holds nothing, overwrites vdd_wakeref with a
> > freshly acquired reference and orphans the original one. The leak surfa=
ces at
> suspend-late as:
> >
> >   i915 raw-wakerefs=3D1 wakelocks=3D1 on cleanup
> >
> > with the leaked wakeref's backtrace pointing at pps_vdd_init() ->
> > intel_pps_init() from driver probe.
> >
> > Make vdd_wakeref the authoritative record of the reference: only
> > acquire a new one when we don't already hold it, and re-assert the HW
> > bit either way. This keeps the reference balanced regardless of the
> > volatile HW state and drops the now-incorrect WARN_ON().
> >
> > Closes:
> > https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/8477
> > Assisted-by: Claude:claude-3-opus
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > Tested-by: Adharsh K <adharshkandath@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_pps.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_pps.c
> > b/drivers/gpu/drm/i915/display/intel_pps.c
> > index d4c98b150fa2..43e89aaf419f 100644
> > --- a/drivers/gpu/drm/i915/display/intel_pps.c
> > +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> > @@ -758,9 +758,10 @@ bool intel_pps_vdd_on_unlocked(struct intel_dp
> *intel_dp)
> >  	if (edp_have_panel_vdd(intel_dp))
> >  		return need_to_disable;
> >
> > -	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> > -	intel_dp->pps.vdd_wakeref =3D intel_display_power_get(display,
> > -
> intel_aux_power_domain(dig_port));
> > +	if (!intel_dp->pps.vdd_wakeref)
> > +		intel_dp->pps.vdd_wakeref =3D
> > +			intel_display_power_get(display,
> > +
> 	intel_aux_power_domain(dig_port));
>=20
> This now silently accepts a whole class of mismatched VDD enable/disable,
> losing one of the main points of the whole vdd_wakeref.
>=20
Agree, added a flag to take an exemption at only boot time to accommodate/a=
lign the BIOS made changes on pps to pps wakeref.
Pushed v2 incorporating the same.

Thanks and Regards.
Arun R Murthy
--------------------
> BR,
> Jani.
>=20
> >
> >  	pp_stat_reg =3D _pp_stat_reg(intel_dp);
> >  	pp_ctrl_reg =3D _pp_ctrl_reg(intel_dp);
>=20
> --
> Jani Nikula, Intel
