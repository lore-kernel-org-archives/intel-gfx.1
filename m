Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06528C531FC
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Jul 2026 14:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B22A10E3F4;
	Mon, 27 Jul 2026 14:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iV6iNa/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234A110E3F4
 for <intel-gfx@lists.freedesktop.org>; Mon, 27 Jul 2026 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785162079; x=1816698079;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xXa5zUkiqPblbekNqgvvGJXq9fm88RwpqttyxQHa10c=;
 b=iV6iNa/CJu5gksjzyeloxvHL/nqUCPQA/RV0RZo9leHSgIYK3UrwFThk
 5o7CmKF/JZ6J5JBv9lnS9YM0+sqfNbxGRWNl7VIe9+qy6vi3y2lxgHGuu
 V2FKjKkZF+wTjrmEBnaRrBJtUvEO8/phVKxOrRJSDc055WoKvRkzWRV74
 GAfv6juE5GEQ/bR6SCzNsg/lPUSoAW3ssti7bZttnSO/I31HhApMPjm8E
 wV9E/FhzXGbCozBXya6oaWx9Ps+3jTOHIIx3t34NkBSDXZGVclhFnChWP
 unSRj1+nV+tyLIy41RybpHSrqjAWgeYsFYsHs/j/8vgbkSmPCIJkI3gy5 Q==;
X-CSE-ConnectionGUID: h+6XuNcQTuq6oIPLRMYkbQ==
X-CSE-MsgGUID: +mvEuwm1RiOZvEfWXy8GaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="108525063"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="108525063"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 07:21:14 -0700
X-CSE-ConnectionGUID: AjQaUUWQSV+bCQYTDtLxEg==
X-CSE-MsgGUID: 7Ub5KRVVQ3+dr2kEicEMbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="283945351"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 07:21:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 07:21:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 07:21:13 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 07:21:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMwFIoDE5ZhYuDvmxp3WNR65OsrSDlRlMehVuAf5/i1yGdGTT3Pb/4vyGp/h+N70FtmLDm8SV1J9S/wSrZspwUzdbvGj8X8mMSXzrFFk3pzdPNJzLGbQkWOqZMVA05cUtRT36bBW/ZvDIa8tkZFMgWUK10DKyjdeKZRkGvAyGd8oAxquFV93yFuGKmqkmFemsTQvmC//wh7YvSObaVcbJBCu/1aFZTGCJnMiKTNNWGjHawFs9GjvCzSNF6sydQbfOY0rdj+trnt5ovc0WT6EbHzb7/c4rQvymXs2gg+XwXQYXNveVSVLBN2tnvzFyedym6KdtdC2507GsOmnnJvj+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bq5EhkMjYEXKacGuUDgFpk+mzfTzbDI1fxw3w/vyIEM=;
 b=JnAFEFhuDep0Uw4l0EWDbJfwTxStbiYM5GA7if6LpiImi9zQ3OjlXnlix2zkR5JSo0UNbWg6eU9aVRUDnYIPPvuP/aTjqh6yvouCnjv74nZiiq91azxIFn0TMkoO36/7jxgQJmtiEoF/sqUQSN9IKCR/RFy4bkz8Cioc4SnCDZFC2TEo776k7bB0HHdM2247zI3BGmRmxw6X8XCBqTzgdoNVpVGPXvgyaEC5yxNr45joLFEm65yycUNNzCrAlIVrKbOi+qg7D1DtMem8Sia9tSsrQ9Vzbdi/nb3j5KfKr9rNrIMJD2NpMh91iSX6y8qBtULtuQQ6RcyhSYy6MD/Qaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by SA7PR11MB9542.namprd11.prod.outlook.com (2603:10b6:806:4d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 27 Jul
 2026 14:21:09 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 14:21:09 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Zuo, 
 Alex" <alex.zuo@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Shyti, Andi" <andi.shyti@intel.com>, "Karas,
 Krzysztof" <krzysztof.karas@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4] drm/i915/gt: Use poll_timeout_us in place of sliding
 sleep window
Thread-Topic: [PATCH v4] drm/i915/gt: Use poll_timeout_us in place of sliding
 sleep window
Thread-Index: AQHdDV0V98urTRmWMUmKCBAjZmm0vrZ8uzyAgATP4qA=
Date: Mon, 27 Jul 2026 14:21:09 +0000
Message-ID: <CH0PR11MB5395A1F96F078952FF66427AE5CC2@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20260706153510.1466259-1-jonathan.cavitt@intel.com>
 <amNfS-1am2g3MGP3@zenone.zhora.eu>
In-Reply-To: <amNfS-1am2g3MGP3@zenone.zhora.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|SA7PR11MB9542:EE_
x-ms-office365-filtering-correlation-id: 83d83c8d-7810-412b-380b-08deebea4de0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info: 29MqYNoaylwO7UZCcKe03T+Ik8KcIYYZW32lLTJaZXWOxy1dalSE5ymaIZqNIwgPjHkqJI+3t6KSjjnKVawbYR6kS9/RDkiNu0sANTovLO1+7xmJRpL3aLkFaS2pZxLkPjdCvTrXnU+j+WCvKL6CL/ZehAMYFB2N8peZ9XA9FgexJD3eQc/+l/qYsOB0JcA79tdiomg+zGciM4pbMgz7zUhi7VoN0cII8sjQJDTs+R3xKwiYupyOubzcoxIKN1iiYXv7ejFuzccw5FPw24VRilbjUm8bdlofqy0CSzauS2B3n4Y/8Kvu7bim1AJzyx8AAGhfjuxw3xysZrg7FiXn4MEvrrCrTxl2Wbx5B3mFLZyVAF6/DwqUM/cWv6iugsO7+S6krS4AL7ZGhMP0bqndyK+rQhj1waiia7XrxjkOvnLG20o0VuNvHwv7grD06g8VwGQ/V5VTZLk97gZ7xy1Gg8qwJLvK3BOx+/jVkwiAzYjuPeh59jhEuDPEQJwVh1oKqxPBXLvabUNk4nBItFvTjlZNhmxlh+NoX3988+c52JW9eZlCLtCceSF9KmEn03PfXmbDDOqSVGHsm6BiRC2hc/DwclFKXTdmCm1iaOiy6dxRpGMmVAyqLAIuW4HtodtKhba2tIFCmzqRU9bhlpzqfR41lc9eVi9YqtDh9LjgwxvdbHW05v9IRkGAjWrNdZpaZmfN8fjZ80ghPKCiHil0hzXUDcQ09wTh4ZECmNYKKJk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5395.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NRBPiHEiUc+5u2GL/gnev1Qi4e2s4SRNek7scRIkm+saHzSk2PZjaosysp+S?=
 =?us-ascii?Q?Aw4PmuQGywrnElAXNqLOxD+ni14KjpUm7kw/m/RxPSp2YHmTLnEXIAzkRc5V?=
 =?us-ascii?Q?8JFbnOemcGar1wHWHi63qYrElBY7HkEPk+vs0dqdscIfWAJcZlirn3x6P6Ry?=
 =?us-ascii?Q?mUa8osiU0Bu+dWu7hWkpqb+I1Jjkfm5xMjNyVmLCIgDxIs+xVanZ8wzkclzH?=
 =?us-ascii?Q?Mn7de1BxAsGCpOM1V7kxpxWmyJnd9/Lsdj7tNq93LiqLX43th8M0HwToMhuX?=
 =?us-ascii?Q?HDjm3RRVoI8Lcomy/nvlav5kaBXLjhVlEP9W3tX+agORiC+YEozJ+6wW1AFM?=
 =?us-ascii?Q?GnPX1sY2ZWhwaR+uEI0cxebFhG1tWSYQXG47mGyfkzC9YtyAgYXK8NqJCwaU?=
 =?us-ascii?Q?ZH5430LZEvpDE/OZP0TUm6+qhEJ12v25KZ8qj+yE9pIG/An6srYlopiE0Xwj?=
 =?us-ascii?Q?qDa3tfjaf0BHOl9x/6VLNxg7+pxXPqAHX7MmqmoMCPXMEnj4DvIAyxkF6TVr?=
 =?us-ascii?Q?3E7kXDnDNbshdxZUT/qkY2egjN7J2zfuVQZxWuClxPaVlZBJyT6UAvgXmFPN?=
 =?us-ascii?Q?SjXH1zq+T6rT7RrPsRCEzbvWECF4UcP4uc+aZClRAyNqvBPZkvSIBWeVxpaZ?=
 =?us-ascii?Q?n2ybnkCR4FGlfnnq5kOyRzAtxy833+IvhAz5LgrOHQ7OTI3xTc4FB/jgTx3m?=
 =?us-ascii?Q?vh3G/Z4NyB2z2CIXtTdBFaW5o8+YQX2yml0I+k3DdMmUmvt11UCJ/u2QJnzr?=
 =?us-ascii?Q?DIRn1W2eF2uNX88e7u+qsH1FnEj4w/HUxQ6QKKIt34Zxx0Nd307edacDEwPf?=
 =?us-ascii?Q?obg0jEgwF5QTiu7iRn1YImTlKVt6M0E2V7D9uLtzyV2cGURsJOBGyoaj1E6C?=
 =?us-ascii?Q?1eou2yw4GL7jKqP1cRdgoY10h7gTJg8iDynnurYhx0DOEmHabdzBHzaU64A1?=
 =?us-ascii?Q?NfdfBn+F8WMCQ8mP2eHI+w+UkRImcnka3tRzse+7wotpXDcQjIW/6YAaztEj?=
 =?us-ascii?Q?ZxGFx5GmIGWzfmLfD1V32GFQxWoQviG0rlME9uwmUD8ejAjLo+HWRUnzlag0?=
 =?us-ascii?Q?5vkhPusZv+fmhjitYrPTMkVKuOuckbD+wXj0VtR8dtakIxlLvKz6vt2EYn8l?=
 =?us-ascii?Q?Ui7qioPBJOmHZvQqBgR8+UsLggSk56YzxzHe4pFigSoD0iRA8PkXMZ7aOt4n?=
 =?us-ascii?Q?SFqZ4IsJ9xYqwzWUVWHy75O0DrNxH7IcI3HDJdStpD4eYLzk0Ef7/WwVJgcS?=
 =?us-ascii?Q?L5oat+Tglt3gW5XvtdAj6bFgJ940IzWieXIBQqroCbDVwLQI630gZCm0SI/N?=
 =?us-ascii?Q?D/GXw+zMVm1fL9ztFX2qg9mhaHIYtSvYP2/ikZvLe3Yso4kfyuP753WXzGpw?=
 =?us-ascii?Q?oUIZSkfH/mmvsrszgkVTxJMgdSMTffGNOpGj5urihbk6/7wtAA4AOIsYnTOM?=
 =?us-ascii?Q?mbhD17bLbopRYwLUg5/uUfmQhEsEvUWa9hbg9hj3RC+INBmOO4O8+SlbtiOL?=
 =?us-ascii?Q?i+qjrLUOv24+gmXZ3qf01khhDBZWhYKbMveqcNYjzDshaQ6PfNHLdcKXphgz?=
 =?us-ascii?Q?+xOh++1i8ZRZxoqhqe0LvwDSTtbEZ3h5xP2CKrrzupY/wF0LvwZMCMfajIAA?=
 =?us-ascii?Q?XnZirT70klmrhWQU2cspaK/CSELwRDxV3BC3PHUCFEFduAw2jTjwUUMaK4r+?=
 =?us-ascii?Q?+EGUjJNZSFivZRuYMOsFh95me7H1crbkktyHhv58KO2J6KmPNVA8y7Gf7MIY?=
 =?us-ascii?Q?8y0KhY5YRA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: W4z9b7NSkY0rUwE+cXVP2+B6RUyaCrUr/bYHpcy1UlM5Lmszuwh4Paifwucgd4QpZChA/pHmNj6FravfIVX3w0ceUvPaLc8pFYntbYOuApgEavoY3/qkKIURNkx3T+bNcCqYTUSLjqJnU55gln3yuw0isERnv/yI+v5Dw+kAMZjJzS49p8C8O5PNtylr3g9XV6LhpUIebiubtlzAZy5UbJTazESx4pz1tG6/Zh7saEHzQJaWT8Cq8TtXAptoVs1rM8Yd6Pjy4lVRNTCPHrlnIPHHH/ZvZNWyz0biI7WJA3FLLSgsdj6SPy84j92OZJ40h1iTOXz1V2Txp9CjNwv0pw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d83c8d-7810-412b-380b-08deebea4de0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 14:21:09.4423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gMVY/Pd2wiTWYpoDVkTdO7AKBOn8hXjFZyPtsvAlFtk+nMxmBxw7Hn45azpLWh1NkqcnoTj0puFAL5Wwb0Eud8ULyvobnEiQLgRAX6aejtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9542
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

-----Original Message-----
From: Andi Shyti <andi.shyti@kernel.org>=20
Sent: Friday, July 24, 2026 5:50 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-gfx@lists.freedesktop.org; Zuo, Alex <alex.zuo@intel.com>; jani.n=
ikula@linux.intel.com; Shyti, Andi <andi.shyti@intel.com>; Karas, Krzysztof=
 <krzysztof.karas@intel.com>
Subject: Re: [PATCH v4] drm/i915/gt: Use poll_timeout_us in place of slidin=
g sleep window
>=20
> Hi Jonathan,
>=20
> ...
>=20
> > +	/*
> > +	 * We use a lazy spin wait loop here as we believe that if the CT
> > +	 * buffers are sized correctly the flow control condition should be
> > +	 * rare. Reserving the maximum size in the G2H credits as we don't kn=
ow
> > +	 * how big the response is going to be.
> > +	 */
> > +	timedout =3D poll_timeout_us_atomic(err =3D ct_lazy_spin(ct, &request=
, action,
> > +							     len, response_buf,
> > +							     response_buf_size,
> > +							     status),
> > +					  err !=3D -EBUSY, USEC_PER_MSEC,
> > +					  POLL_TIMEOUT_DUR, false);
>=20
> now poll timeout is not running in atomic context, is there any
> problem in using simply poll_timeout_us() instead of its
> _atomic() brother?

I... don't know?  I guess I can swap it over and we can see if something br=
eaks
during CI validation.
-Jonathan Cavitt

>=20
> Andi
>=20
> > +
> > +	/* This is only the case if ct is deadlocked or we time out */
> > +	if (ct->stall_time !=3D KTIME_MAX)
> > +		return timedout ?: err;
> > +
> > +	/* Otherwise, ct_write failed and we need to clean up */
> >  	if (unlikely(err))
> >  		goto unlink;
> > =20
> > --=20
> > 2.53.0
> >=20
>=20
