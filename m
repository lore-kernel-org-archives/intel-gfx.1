Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50DBC79FB9
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2026 07:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1055B10F328;
	Thu, 10 Sep 2026 07:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3jITr+/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C802210F328
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Sep 2026 07:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789024495; x=1820560495;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z7pap4PoK5WbwhkIC552jrUtcSsACNp3T3doBiCpihY=;
 b=V3jITr+/ijT8xUFfXgVUzq+LAap0Wl2/uZa6vchI9/iXESpVIaKGJsuv
 t/QYHK31jJN/jEbFgxU6r5yxsprgWennVI38h4kWP8yZR3P3cLrc5tEKi
 41jE+5+pSd/oPQl8d2vNMT9FZm5KbOLZyN+1LiEHTzpNIDphFT36tGKVZ
 uTBwWq7jwX3MS661HQ65yWCxqfPiA7ZA2mHvwKW8JQnz0tvGl5tjSwFSi
 sbBWvLKLDso3cPjybyjcYX0+xXDapIVhT2qo+DneVi5A7h8c/tPB9ajXY
 gu0PuSHS4Z5pR5lS4gW+I+zp5FRgzfX+0oNCBRLOdeh/uPMDqk6wD3VnF Q==;
X-CSE-ConnectionGUID: wIsA883gSoesr96mERyvlw==
X-CSE-MsgGUID: E2QulRk5Q9KbLlQJdSZ/0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89678253"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="89678253"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 00:14:55 -0700
X-CSE-ConnectionGUID: ZrZgCSPLTnS1vpx4fcFf3g==
X-CSE-MsgGUID: Y1hOiknVQ/Cvw5f/vEHjiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="272042550"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 00:14:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 00:14:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 00:14:55 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.35)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 00:14:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgDIe1FS9znw0fj+9uQ1xA0hxehs1S6vdXU5o5HqiA1NUTOKBv4hGAF6wITGTXSi8bewLpsfpO3lQG3hn5BUVsn766roibq4AgpdpTKhOzcQZwRRb+OxbGrKzhI7meIRjm5d7np8vzEYsP2OE8bXX2dUJ3yRzWwXKqyRA2wIG9OcuvWIvvl4OXQVNvPdalyk7O34smGlGmbEIOzd57pJQAqBub12bm16PlGZis5hkqfV+KIzhR0DFzvrBFRye6WMwStrFtFMc6MEu/Dnp7AofIkLccEa6Rj1DdHf5DEhxAU9KOLtBtRwSSuO1fLIwCIBoxHZ1fRTFvUWJQRfDzJZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7pap4PoK5WbwhkIC552jrUtcSsACNp3T3doBiCpihY=;
 b=GJAkbkegaXebc4NX9X45dMd9It62pvX5brE8kHho+D28lGjoim7ZdRwv3kuEVcxbhEhWIaS86/C1fnKsjMgUsRGlYHqyKoB28/VoXHuFQeqwtfG3IoSWzdwkEqoxdGoOSmTHKvUoM46jIWfKeCSn/rZM9eb4iavszBWOuJlG9wqi9/kRonwg1uKKyhCmeMaJxucPQeUZIYI0EbTq7TtMktxvyjBpqBOqUGfsGJiRyEdvK+KHJqnBhjilKMpeq6MAGbnZ1k5FdLQqmo9+R2IY0cX2SF6EqX3tgD3urq1z63ED5GXO6DMa5BB0yLKJ+kFHeZXKH+Xg6QAyTfZtuecn8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by LV2PR11MB361656.namprd11.prod.outlook.com (2603:10b6:408:3ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 07:14:51 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 07:14:51 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Metrical revel <metricalrevel@gmail.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Topic: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Index: AQHdPwrzVbHi53i16k69Rr9uSqIjkLbEA1bAgAM8U4CAAAgl4A==
Date: Thu, 10 Sep 2026 07:14:51 +0000
Message-ID: <IA0PR11MB7307AE5A16C8CB061EC14B17BABF2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <CAAxXSL-D=cJ8ne9Lc=W=746TZgyXVVYqWm=kP=CWj8D+M6JjRA@mail.gmail.com>
 <CH3PR11MB7300D5961C982BA2B040675FBAB12@CH3PR11MB7300.namprd11.prod.outlook.com>
 <CAAxXSL9JUB9d1CqVx-nY-DwskyFfu4kUOsyNf4qPpj_hz-iS_Q@mail.gmail.com>
In-Reply-To: <CAAxXSL9JUB9d1CqVx-nY-DwskyFfu4kUOsyNf4qPpj_hz-iS_Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|LV2PR11MB361656:EE_
x-ms-office365-filtering-correlation-id: a72f81f8-77d7-4cb9-976a-08df0f0b34cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|5023799004|11063799006|4143699003|22082099003|18002099003|10067099003|38070700021;
x-microsoft-antispam-message-info: 3kWCSwFuUVHgXMzIRQcGenb23eaqq2/s/b9uACLZaH8oyaTTqNqX+GgBx+ur7nuF28AVE4JNSBihCQQPEg6LLvv18dJrVj6tQDv/iF0XM+oWiiBPbMB0vRYwObylVc+By3VG/g8JAj8g/jSMUg2qo9xFX4EhEQZvExkDkbpwvDP9Xq3UNRqS4XdHvXJd6YlX+yl7vP5mUCUqOFdVLUbKOToeZbMBSka4MubhI2+t5JyYar9Fm3d05zza+Zu4eC+HFlYoctjPpn3pPOXvJb2+jKO2dfEbMctydz7RX9bH/7grfmowFyYihow+CNU1AxidiWFYwMkdy4GNK5oZvuEwfU3v739N9bmCLtXfOUFIcBgCuY+CYyS6eFm1IzuiuR6RtYzT2NuKFQdSFGfjNjbECfwWInl2vKYppOnPi0LxnttGN7Xagw3Oh664I/2NJvG1kmkzDn1ks6D+IP3ndRR+c76EjeuE89JkCyEBNmFqS1sICBxYeFKfX8yYTuzpMInW3CXFBfXk4IPPdqH3YO22GSOhRSWtChdwIaOc1la8mbsw1SIqb3M1fs2b8VmQ9aLKTk7U6cRIMMM0K7cY6XdvHzlRfNjR39quRoGy71d4Bqki3wk13n4IUIPyCiIGAeDfxqPljZOP2ETFngYRaNogRcDELbIP5Cx8HbRzECKRjI8SlWOcX1gbV2vy/HXdbBQqhmmuYSnoqdDRjzrqeOPI1w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003)(10067099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzVTN2tOMFNXVllDV1lBQTZudnV4U0ZnK0tsZUFRcXRadUhPS25ibHJtN1Nq?=
 =?utf-8?B?Z2ZsVHVna0pwSy8yNTNxNmo3cmtQeVVhUEM1Y1BHYlhpMHRzd3NHNnNJdDg2?=
 =?utf-8?B?TUJIZDhvNTJOa09tbXNZNFgzTHNUWVprQTNoSTdBZzZSQzJGaFVUUEMxNnoz?=
 =?utf-8?B?UzhOMHpWcmJIZkZIUWRON3hUaEhwTm1JRnIxYW0zOER4QmNab0xuRThmeFVP?=
 =?utf-8?B?ZTB1QjlxbXhPRE9uTWJMSlRWejcwZmV5Y242SGV4bVBjWlcyZEV5OGl1YVF0?=
 =?utf-8?B?TG1idTIwcVRuNkhxVEtnbVFiejNXTmc3TC9DbzFVSW9UR3MrdEtoRVhndlBL?=
 =?utf-8?B?MXM5cFByV2Z0TnNUNHNOb2FOY2orVUMwa3hmRGpaTzIxazVmc0RTOUliMVVr?=
 =?utf-8?B?eUM1dDk5U2p3TGVBR1JNQTNaOGxzSE5GRk8xNTRNSmJOUzFYbVB4T2JYMUYw?=
 =?utf-8?B?UDBvUjBXeXhuRnRjMFU4NUVGL0NlZ3VKUkhmaEp0L2ZENUdNSkFWQ3ZEM0s0?=
 =?utf-8?B?MW9iL29YK2EzcGM2ZC9QTWo4QlczVUhhaHl3Sk1mY1E3ZXBoQThMWXc5VUF3?=
 =?utf-8?B?bmt0N3NWRXk5aUtiaS9OeFFTT3drZk9zcklWSjA5dytVL3BvaFpYT1Y3VDdB?=
 =?utf-8?B?UitPdVBJYTVmcXdwTU9QejVSZXVMWmIrRElYNTR2SlYxZk1pajBkQmlxSzR3?=
 =?utf-8?B?cWpQM0Rhb0lVaG5Gb1dOUERUMXE3YzJnWDV6dWNHL2I5K3FKV09yZ0p0YTdw?=
 =?utf-8?B?RHhKZG1mZjAySk1nY0xUN0p6V3dMMGl6ZVhRUGR1MHpzWXRhOFlRemh2MmFH?=
 =?utf-8?B?alZldyt6VDZGY1hqTmlSczkvbW1xUWo1Z3Ezd010NU1Kd212TWphak10Smd4?=
 =?utf-8?B?c3llQmp5M3dZUGlDRUZLZ2gzSUtZbGtzc0MzdURCSmdyWFg4MEZXQjIxL0x6?=
 =?utf-8?B?OGYvRnczcm5Fby9FRm0yT1NQVnA1b1ZoYWJ5VmVqS2hGcVJMMXN3TWdUcWFF?=
 =?utf-8?B?Tm1oY2hHalh2VmlHM21CbnZQL0c0NVdESUtoV2JxNjh6eFZDd3J4WHRXc0Ex?=
 =?utf-8?B?Y2M5RWtzN05tNXl4VUx3T3Q5b2ZxOHFZVHZseFUySUhKUkp3S0tuaFlvTkNK?=
 =?utf-8?B?WUhpdmRzcjRGYzFVRk9Mci84WTZCNjBGMDBhQ0RkVC9YM1MxL2hIUkhIcVE1?=
 =?utf-8?B?TU5uSFp6Z2JrSk1odTlTSVdCQWk1bGV3SEc5c0xJUE50Rmcvek80cXZUa1Q3?=
 =?utf-8?B?Z0gxYzNCNjZPR2FsVEg5WVpSYkw2eXVpSThZYTlLZFhZeGNWdnNhcnNkVTZy?=
 =?utf-8?B?dGJZeUwrL1Jza0JjdUE2Sy94bWJhc3FSbTF6NFlVYy9WNENtWWxpajZuL2Rm?=
 =?utf-8?B?TFhNKzBqS2UyMWtvMlRUTFJRZFZvZkJ1QlRJaXNyakEzNU1lZGh2bGtoa2lE?=
 =?utf-8?B?aXNUWGZDZSsvU2xxNzQxaUwwWFdsT2ZQZENuMlQ3QWpyQmxoSVVKOU44eVdW?=
 =?utf-8?B?a3ZCOWFYc0JJTkhMaVlTRkNtK2NaREJkdFVzZEZ2c0h4M2tPNWlsYlJnUm1w?=
 =?utf-8?B?eDArcU9yYnViaUVoMS80MGpQYXpmZ0gvSUNhV3VVa3l2ays1ZUd3cXNJdFI3?=
 =?utf-8?B?Z1hzaXZSY0VxYTZ5SDdVbjc5blJvMDNtQzQ0SU5ic2hvQkxPU0kzZWllVmpW?=
 =?utf-8?B?aitFWHYzcVRNNURhTWxYR2Y1Z0Q2aUNKUUtuUFBSc2tOYUxYS0d4OUJxVVUy?=
 =?utf-8?B?M1dRSDJpNktsRU81Y0l4ejNIYzY3amJXVWY2NlZvaHlSK3lYZ1lHV0p5N3dV?=
 =?utf-8?B?RDh0R3A3MGVnU0w0aEdXUHNoVFN6enZvS3hxSmFkL1JUb2IzRUFVM3Z2b3NO?=
 =?utf-8?B?NG1yM3ZPVVRJMHJiTDBOYmFsTWc3d2dKS1FCYWF4VnBWeTBUVG9GaWJkUGVr?=
 =?utf-8?B?MHJxN0tWWHhSaHpkSUNVWjFOUjhMM2s0WGNTOFJBSGU4ZDA4b25uNFBxdFNT?=
 =?utf-8?B?NTZ1Mkk1TG1kUi9CMVYxaTNEaXBxUExLVmNDODVCSWpPcXR4TEJINlVnclVW?=
 =?utf-8?B?NFZ2NGZSdWZBQ01sdTZMK3ZrbzlZbkVNdmJCSDRVc01PbUhCYWxxc205MnlE?=
 =?utf-8?B?QTN2MWFPbGNEVHFMTGEvNXVsWDhGVk4wRWFOeEpkSzRib2NRMHJZOXJqcEZs?=
 =?utf-8?B?dlhqTnF3Vjg0bE5OVC94R3l2dmRzSktybVcxNWNTRzBFNXlObjRtSGhjc3pu?=
 =?utf-8?B?VUVlS1ZOQzhiRTB4N3lGTElLcDdrdUV6eG92clYrcEZzaG5HSEdKekMwQ2JJ?=
 =?utf-8?B?aUptQmNjaERJSWMvSVZaMjRNL1VaNGVIenVFbitGbzdFZDFXMVZ2QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iLfHreqXW6fhNLrk3JRYV2SwKkyY43KGAl30bVq1W2E6g0DCPud+Mf5xAmC+15raehEh9sYtmZ+ohmPlEjekjSpEuqjO+VBjpNQs4yTRTVe+8wSAHEocCiez6Nt2XpFBvoAO0eXDEiY0WnZk3UKhhE659VCWEOy8+tTeUi//jXPclj7dj9m8zJLWAleyH/mFC+33FAj+Rigbti8NPFH9+Y5Vf9W60wtr1honcpRE4og82dztXmXroqA2bV8k36Q+PgDdm+Yl+Qsf2FEqQGC3rRqaq7vMApkMgpvdCshvLgbz3L/SHRKguhfQ5KNVPldwPZwdS7+fPY1yNFDebrBMBw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a72f81f8-77d7-4cb9-976a-08df0f0b34cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 07:14:51.4579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: otjc2dDz4q73y0uhZNFkTE93Vl3yrN1MILfBlOWts832ulxzbBHcLMX8gluZyXwyEXM9RcYMCbhPcgHJZNJatA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB361656
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNZXRyaWNhbCByZXZlbCA8bWV0
cmljYWxyZXZlbEBnbWFpbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTAsIDIw
MjYgMTA6MTMgQU0NCj4gVG86IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNv
bT4NCj4gQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSHY0XSBkcm0vaTkxNS9kcDogT24gRFBDRCBpbml0IHdha2UgdGhlIERQUnggZm9yIGVE
UA0KPiANCj4gSGkgQXJ1biwNCj4gDQo+IFRlc3RlZCB2NiBvbiBteSBIUCBWaWN0dXMgMTUgKFJh
cHRvciBMYWtlLVApLCBjb21waWxlZCBhZ2FpbnN0IGxpbnV4LXplbiB2Ny4yLjINCj4gd2l0aCB0
aGUgdjYgcGF0Y2ggYXBwbGllZC4NCj4gDQo+IFJhbiBtdWx0aXBsZSBzdXNwZW5kL3Jlc3VtZSBj
eWNsZXMgKGJvdGggYHN5c3RlbWN0bCBzdXNwZW5kYCBhbmQgbGlkDQo+IGNsb3NlKSB3aXRoIGRy
bS5kZWJ1Zz0weDFlOg0KPiANCj4gICAgIGpvdXJuYWxjdGwgLWsgLWIgMCB8IGdyZXAgLWMgIkZh
aWxlZCB0byBlbmFibGUgbGluayB0cmFpbmluZyINCj4gICAgIDANCj4gDQo+IERpc3BsYXkgcmVz
dW1lZCBpbnN0YW50bHkgaW4gZXZlcnkgY3ljbGUsIH4ycyB0byBmdWxseSBleGl0IGRlZXAgc3Vz
cGVuZC4gTm8NCj4gdHJhY2Ugb2YgdGhlIGVEUCBsaW5rLXRyYWluaW5nIGZhaWx1cmUgdGhhdCB3
YXMgY29uc2lzdGVudGx5IHJlcHJvZHVjaWJsZSBiZWZvcmUNCj4gdGhpcyBwYXRjaCAob3Igb24g
dW5wYXRjaGVkIDcuMi4yKS4NCj4gDQpUaGFua3MgZm9yIHRoZSB0ZXN0IHJlc3VsdHMuDQoNCj4g
QWxzbyBjaGVja2VkIGk5MTUuQ0kuRnVsbCBmb3IgdjYgLS0gb25seSAyIGZsYWdnZWQgcmVncmVz
c2lvbnMsIGJvdGggdW5yZWxhdGVkDQo+IEhETUkgY3Vyc29yIHRlc3RzIChrbXNfY3Vyc29yX2Vk
Z2Vfd2FsaywgcGlwZS1kLWhkbWktYS00KSwgbm90aGluZyBvbiBlRFANCj4gdGhpcyB0aW1lLiBM
b29rcyBsaWtlIHRoZSByZWFkX2J5dGUvdGltZW91dCBpc3N1ZSBmcm9tIHY1IGlzIHJlc29sdmVk
Lg0KPiANCj4gT25lIHRoaW5nIHdvcnRoIGZsYWdnaW5nIGFsb25nc2lkZSBTYXNoaWtvJ3MgYml0
bWFzayBjb21tZW50IGJlZm9yZSB0aGlzDQpSZWdhcmRpbmcgdGhlIFNhc2hpa28gY29tbWVudCwg
IFdpbGwgcmVwbGFjZSB3cml0ZSB3aXRoIG1hc2svd3JpdGUuDQoNCj4gbGFuZHM6IHRoZSB3YWtl
IHNlcXVlbmNlIHdyaXRlcyBEUF9TRVRfUE9XRVJfRDAgdHdpY2UgLS0NCj4gDQo+ICAgICBkcm1f
ZHBfZHBjZF93cml0ZV9ieXRlKCZpbnRlbF9kcC0+YXV4LCBEUF9TRVRfUE9XRVIsDQo+IERQX1NF
VF9QT1dFUl9EMCk7DQo+ICAgICBmc2xlZXAoMTAwMCk7DQo+ICAgICBkcm1fZHBfZHBjZF93cml0
ZV9ieXRlKCZpbnRlbF9kcC0+YXV4LCBEUF9TRVRfUE9XRVIsDQo+IERQX1NFVF9QT1dFUl9EMCk7
DQo+IA0KPiBUaGUgY29tbWVudCByaWdodCBhYm92ZSBpdCBzdGlsbCBzYXlzICJ3YWtlIGl0IHVw
IHRvIEQzX0FVWF9PTiIsIGFuZCBlYXJsaWVyDQo+IHJldmlzaW9ucyAodjMvdjQpIHdyb3RlIEQz
X0FVWF9PTiBvbiB0aGUgc2Vjb25kIGNhbGwgcGVyDQo+IERQMi4xIHNlYyAyLjMuMS4yLiBMb29r
cyBsaWtlIGl0IG1heSBoYXZlIGJlZW4gZHJvcHBlZCBkdXJpbmcgdGhlIHY1DQo+IHNpbXBsaWZp
Y2F0aW9uLiBJdCBkaWRuJ3Qgc3RvcCB0aGUgZml4IGZyb20gd29ya2luZyBmb3IgbXkgY2FzZSwg
YnV0IG1pZ2h0IG1hdHRlcg0KRFAyLjEgU3BlYywgU2VjdGlvbiAyLjMuMS4yIHNheXMgaWYgdGhl
IHNpbmsgaXMgaW4gc2xlZXAgDQo+IGZvciBwYW5lbHMgdGhhdCBhY3R1YWxseSBuZWVkIHRoZSBE
M19BVVhfT04gc3RhdGUuDQo+IA0KQXMgcGVyIHRoZSBzcGVjIGlmIHRoZSBzaW5rIGlzIGluIHNs
ZWVwLCBleGl0IGZyb20gc2xlZXAgd2lsbCBoYXBwZW5lZCB3aXRoaW4gMW1zLCBzbyB0cnlpbmcg
dG8gd2FrZSBpdCBhZnRlciAxbXMgYWdhaW4uDQoNCkQzX0FVWF9PTiB3aWxsIGtlZXAgQVVYX09O
LCBhbmQgRDAgd2lsbCB3YWtlIHRha2UgaXQgdG8gbm9ybWFsIG9wZXJhdGlvbiBtb2RlLiBUaGUg
Y29kZSBwYXRoIHN1Y2NlZWRpbmcgdGhpcyB3aWxsIGJlIGxpbmsgdHJhaW5pbmcgc28gaGVuY2Ug
a2VlcGluZyBpdCBvbiBEMC4NCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KQXJ1biBSIE11cnRoeQ0K
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBUZXN0ZWQtYnk6IE1hdGhpYXMgU2ViYXN0acOhbiBWYXJn
YXMgU2lsdmEgPG1ldHJpY2FscmV2ZWxAZ21haWwuY29tPg0KPiANCj4gVGhhbmtzLA0KPiBNYXRo
aWFzDQo+IA0KPiBFbCBsdW4sIDcgc2VwdCAyMDI2IGEgbGEocykgMTA6MjDigK9wLm0uLCBNdXJ0
aHksIEFydW4gUg0KPiAoYXJ1bi5yLm11cnRoeUBpbnRlbC5jb20pIGVzY3JpYmnDszoNCj4gPg0K
PiA+IE1hdGhpYXMsDQo+ID4gVGhlcmUgc2VlbXMgdG8gYSBidWcgaW4gdGhlIHBvbGwgd2l0aCB0
aGUgcmVwbGFjZW1lbnQgb2YgcmVhZGIgd2l0aA0KPiByZWFkX2J5dGUgcmVsYXRlZCB0byB0aW1l
b3V0LiBJIHdpbGwgaGF2ZSB0byBmaXggdGhhdCBhbmQgYWxzbyByZWNlaXZlZCBmZXcNCj4gY29t
bWVudHMgYXMgd2VsbC4gTGV0IG1lIGZpeCB0aG9zZSBhbmQgd2lsbCBwb3N0IGEgbmV3IHZlcnNp
b24gd2hpY2ggeW91IGNhbg0KPiB1c2UgZm9yIHRlc3RpbmcuDQo+ID4NCj4gPiBUaGFua3MgYW5k
IFJlZ2FyZHMsDQo+ID4gQXJ1biBSIE11cnRoeQ0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBNZXRyaWNh
bCByZXZlbCA8bWV0cmljYWxyZXZlbEBnbWFpbC5jb20+DQo+ID4gPiBTZW50OiBUdWVzZGF5LCBT
ZXB0ZW1iZXIgOCwgMjAyNiAyOjIzIEFNDQo+ID4gPiBUbzogTXVydGh5LCBBcnVuIFIgPGFydW4u
ci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+ID4gQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0h2NF0gZHJtL2k5MTUvZHA6IE9uIERQQ0Qg
aW5pdCB3YWtlIHRoZSBEUFJ4IGZvcg0KPiA+ID4gZURQDQo+ID4gPg0KPiA+ID4gSGkgQXJ1biwN
Cj4gPiA+DQo+ID4gPiAoUmVwbHlpbmcgYnkgZW1haWwgc2luY2UgcGF0Y2h3b3JrIGRvZXNuJ3Qg
c3VwcG9ydCBkaXJlY3QgY29tbWVudHMg4oCUDQo+ID4gPiBhcG9sb2dpZXMgaWYgdGhpcyBkdXBs
aWNhdGVzIG15IEdpdExhYiBub3RlLikNCj4gPiA+DQo+ID4gPiBOb3RpY2VkIHY1J3MgaTkxNS5D
SS5CQVQgaXMgcGFzc2luZyBub3cg4oCUIGdvb2Qgc2lnbiB0aGUgYnVpbGQgaXNzdWUgaXMNCj4g
cmVzb2x2ZWQuDQo+ID4gPg0KPiA+ID4gQmVmb3JlIEkgY29tcGlsZSBhbmQgdGVzdCB2NSBvbiBt
eSBoYXJkd2FyZSBmb3IgYSBUZXN0ZWQtYnksIEkNCj4gPiA+IHdhbnRlZCB0byBmbGFnIHNvbWV0
aGluZyBmcm9tIGk5MTUuQ0kuRnVsbCB0aGF0IGxvb2tzIGEgYml0IG1vcmUNCj4gPiA+IHNwZWNp
ZmljIHRoYW4gdGhlIHVzdWFsIG5vaXNlIHdlIHNhdyBvbiB2MS92MzoNCj4gPiA+DQo+ID4gPiBp
Z3RAa21zX2N1cnNvcl9jcmNAY3Vyc29yLXJhcGlkLW1vdmVtZW50LTEyOHgxMjhAcGlwZS1hLWVk
cC0xOg0KPiA+ID4gICAgIHNoYXJkLW10bHA6IFBBU1MgLT4gQUJPUlQgKzEgb3RoZXIgdGVzdCBh
Ym9ydA0KPiA+ID4NCj4gPiA+IGlndEBrbXNfY3Vyc29yX2NyY0BjdXJzb3ItcmFwaWQtbW92ZW1l
bnQtMTI4eDEyOEBwaXBlLWQtZWRwLTE6DQo+ID4gPiAgICAgc2hhcmQtbXRscDogUEFTUyAtPiBE
TUVTRy1XQVJODQo+ID4gPg0KPiA+ID4gVW5saWtlIHRoZSBlYXJsaWVyIENJIGZsYWdzICh3aGlj
aCB3ZXJlIGFsbCBpbiB1bnJlbGF0ZWQgc3Vic3lzdGVtcw0KPiA+ID4gbGlrZSBnZW1fY2NzL2tt
c19wbGFuZV9sb3dyZXMpLCB0aGVzZSB0d28gYXJlIGJvdGggb24gZURQLTENCj4gPiA+IHNwZWNp
ZmljYWxseSwgc2FtZSBzaGFyZCwgc2FtZSB0ZXN0IGZhbWlseSwgYm90aCByZWdyZXNzaW5nIGZy
b20NCj4gPiA+IFBBU1MuIElzIHRoaXMga25vd24vZXhwZWN0ZWQgbm9pc2Ugb24gc2hhcmQtbXRs
cCwgb3Igd29ydGggZGlnZ2luZw0KPiA+ID4gaW50byBnaXZlbiBpdCB0b3VjaGVzIHRoZSBleGFj
dCBjb25uZWN0b3IgdGhpcyBwYXRjaCBtb2RpZmllcz8NCj4gPiA+DQo+ID4gPiBIYXBweSB0byBn
byBhaGVhZCBhbmQgdGVzdCB2NSBvbiBteSBoYXJkd2FyZSBmb3IgYSBUZXN0ZWQtYnkgZWl0aGVy
DQo+ID4gPiB3YXkg4oCUIGp1c3QgZGlkbid0IHdhbnQgdG8gZ2l2ZSBhIFRlc3RlZC1ieSB3aXRo
b3V0IGZsYWdnaW5nIHRoaXMgZmlyc3QuDQo+ID4gPg0KPiA+ID4gVGhhbmtzLA0KPiA+ID4gTWF0
aGlhcw0K
