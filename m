Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC15D606A324
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Nov 2026 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XjAp2QOx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3C710EA70;
	Wed, 11 Nov 2026 15:30:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9A110EA70
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Nov 2026 15:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794411004; x=1825947004;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=l0I23vsY104TXiigMpE3rj/6gP8fqd7l5TTGFYHc/yE=;
 b=XjAp2QOxtt7nGJCAAK43J7HbIil2/ZgSFgBteC3xVUuxlCskV2phQZNh
 cDuZ+EQjw24xpk7XkvXFQT01hVW74oxnACGuw0e0h8E59+4KE+FGWe2dC
 G7H9ZyWfrJSrzv1k7DBXHIwbAQQkuNvelZNjXLHNte39S3xyHA0OgQl7/
 BOvF9K6dmpsmpDDgmRcUr3D9u7GnN32fUugIDM7C0g/vbaW5H81czF8/L
 dI+a+YSlodU1rhl0XiaslZJRD00hwttd/BuqgDFYHKa6VstFllyJACypz
 A/l9Euj+upcp0KWh6SY5SvgGCiWXu/kY7a0+L2nWMiZQeH3YGLY8E8NXy w==;
X-CSE-ConnectionGUID: /zezXgt3Q3KerIlwy/zlhg==
X-CSE-MsgGUID: ysxPY8PgR16s1J2ima4iNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3092634"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3092634"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 07:30:04 -0800
X-CSE-ConnectionGUID: mVkqhDjXTIKBBVOnCTNsaw==
X-CSE-MsgGUID: kK2HL4NxQHecy9oq8VkhfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8328926"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 07:30:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 07:30:03 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 07:30:03 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 07:30:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqpUKZaUBSTg3AfaikCQWTVmmHXtxBivgW+jT1MFhUlSI4p6OhBPuHucGeSiZrFsPtiXYZ/RoyyHWjsjJfW0L2E1vIHhU8k9kVccUOQjsaOL4Q8MW3SatO756JTlQbCjEIDS97eyjMnjTZyj3Qe+20bX8L7w96PBtyv2QQPwthEyrHUXdZ98ASye2wjlV0acVRtycpDxIhiuSGlb78b6jDwHpYL1VDut9iHyouR9gj9wPtg123J/rb0tqSzRn7PUOWN/M8CB84msSZSTUchqpuunlunH4U+lTerzDySV5czTNPFci+1vtRgmv0f0VboU4gkt6q96xFs2UZQ4mmnc6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0I23vsY104TXiigMpE3rj/6gP8fqd7l5TTGFYHc/yE=;
 b=WkbHomKRYmXUyxyxkrt16GQvVi/XJ22RuB7ovxjK7NIQ4ex+sgT6LVHnmQ4R2uqSZ6g8hCS0ytAvIOWCKS5C1fijyamGU4mDF5bHTwI46DYfMRobVWgLSHpr60Iw/ABsISLCKDsi12bLEuw/TfYAJob1NdqcdhYSGXgTdNreGi82vJXb4tRVgzOxNqQgjEaoNaUBZ2jDNV5w4x4q/Z8VL8PNtv58E2lpISYDdBt/Z0MvBOWvBpf9R09f9KhlrCyCxxyE6VhU5OsTrOVjjCg28aNHBmoX/eQz3MBfOM+KfBoUQ9Wa7lwJXI/2wNwyddQRKk/fo2miLihpCf2IrnIwZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SA3PR11MB719904.namprd11.prod.outlook.com (2603:10b6:806:53b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 15:30:00 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 15:30:00 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "javiermv@gmail.com" <javiermv@gmail.com>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>, "javiermv@duck.com"
 <javiermv@duck.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "Ceraolo Spurio, 
 Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915/guc: Complete all requests of a
 non-schedulable context
Thread-Topic: [PATCH v2 1/2] drm/i915/guc: Complete all requests of a
 non-schedulable context
Thread-Index: AQHdceTQ0N2kzjfkZkyPYSKketG0Gbco/zsA
Date: Wed, 11 Nov 2026 15:29:59 +0000
Message-ID: <7355b8228aea8556c07dda8d69fa889a5cbbd81e.camel@intel.com>
References: <20261111135753.11071-1-javiermv@gmail.com>
 <20261111135753.11071-2-javiermv@gmail.com>
In-Reply-To: <20261111135753.11071-2-javiermv@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.60.2 (3.60.2-2.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7187:EE_|SA3PR11MB719904:EE_
x-ms-office365-filtering-correlation-id: 31e47faf-6774-4314-197f-08df4008a61a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|11063799006|4143699003|5023799004|10067099003|56012099006|261022075727099003|261022105027099003|261021123027099003|261026121527099003|261021121427099003|261026140227099003|261028144727099003|261102123227099003|261009220027099003|261009223327099003|261009221727099003|261009221227099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 7uNFMKh12tw9Mmr8vm3+HGHyx33Qe4k3cPSmF6LLZVba+UXenq7Ug9D279eUnAU8qQ2WTkb8A7BaXmK+P9ack+0WugpZOsZ1QvmDlH4ESOMShcHPoxEwzLOn2zhx4iEvxFfXOsEvBMRF3J4MvX7fwo/0IROBVuh/Lm2s54Vm+TzszpzxIsn1I2v3R1Af9e+WtW9ODI5es4Kdsk1S4i7iHn7r8D0EwhpzxbfpHfsEvhPSFnc0denOELClszKcDJK8zr0Rreu9eeH7skUlmiq4uxMF8l4Lh/Be+IZfR2H6I5TTkEvGT8BUDjyV/saa394iYh7aprHuuhbEmDgWM31tYfUFwx6QZznQSCK8/ReWlKfNszshk3mMPlAX32fWlLGvcGqIDKzQBPkg4rw25rOjru88BnE1Pu1x+WABmkBDa+EeNzC5vrUcekOeNwfVuOaEIo0UZ/Ifjq1YebrqwmMmA7G7zdvUS+yeuuB1ssnYbuccFhlFQhCavMakHnpdDyCaXLLBUlI2qazR7KbFnfSogYSVPaTDC3WxvrUesjZH0Ykwo8Sy5jZ88ODJsx5irttllkvZi2RPOYaXDU+3tfAGusWmCWBe6BR9F0uotd8GU7xtj0XyVvZoxZktN8X1n0SaE42LdMbd/7+UJBnuwevMUtGlzKhAabewpXBvrJc1fWI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(11063799006)(4143699003)(5023799004)(10067099003)(56012099006)(261022075727099003)(261022105027099003)(261021123027099003)(261026121527099003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009220027099003)(261009223327099003)(261009221727099003)(261009221227099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjNxQVA2U3pHQjhCU01WYUlsUVZac0hqam4wd1FqNmhJOUhaMVZGcEUwWHlj?=
 =?utf-8?B?aDJNcXE1T2U1VkdYanhxbyszVDNTcmJ6QzhlQVFmZDU5c1RxQXBlQ2JrbG44?=
 =?utf-8?B?aXZyUkxXQnhMbU9LaC9CUHdZOEgydDdmNmhsQk15NUtuakRLZ0NhdVBvVml2?=
 =?utf-8?B?S2wwM2NxUUJpaW1UcWw0RkVzZEdOZFpJdnl0WnJsd1Z6NjFEUzhFTU5MUWJM?=
 =?utf-8?B?U0oyNVMwbkRRWXg3dWZGU3Q1M3Y2ZXpaakdFcEIza01NQi9GUTdOb1ROamls?=
 =?utf-8?B?MlRiZkNPLzR3djdlb3NoS0FZL0sxa1R0ZE9FTnA5VjdiOU9wbDdhaEI2UHFV?=
 =?utf-8?B?Tmc0SVZkeWkySEo3a1U0TlNGMFYva1hiTGEwbkN5Q04xbmo0OXYxK2tEYWg0?=
 =?utf-8?B?U0U4YlA0RkU1QVN4RjdBM2Q2Zm5GQVZVWmYxVm56UXIxNnhhYTZmbWpSNnRo?=
 =?utf-8?B?MjV0SHo1WUI3akxxTm44dlZ6VURlV01La1ZOUEh0eVFUKzh5VjN1U2p0K01Y?=
 =?utf-8?B?U0wvMWZUQ2svc2lMRnhmS3UwK0RiS3E1cUtpWjAvZzQwN1V3ZE80anV4dnoy?=
 =?utf-8?B?cFJoWVZiVHlYa2FNTXl6a3BKQXFPQy9tQmNUbWlmdU9IS3hiNDlOb2UvWnNn?=
 =?utf-8?B?Nm5rcDZuRTR3ODJoTFBrYXNlTWtIaCtVZW5jaXNzRWI5ekNaMUxsQlhIcU1P?=
 =?utf-8?B?K1NtczVxWFk2My95cnlUVWhPcGFvRmFjZXBiaHErcmp3SzFnRytOK3ZGUWdx?=
 =?utf-8?B?SzkyNmJ5Yk55K1YrZytxMFdiOXhxTEIyK081RWFNUUx6bGhOeVpnYjJEeE4v?=
 =?utf-8?B?L3g1SzZaRmZzdUxxejhzalhqa1ZTY0hKd2RDVHBMdFRRYWt3dVhGbzE3WjhZ?=
 =?utf-8?B?VmdkczdXclpKMWphY0JRL0tzeGtGYk1ZUmlqTEFkK0ZTYUxXRzNncG5kU3VM?=
 =?utf-8?B?WEJkVmg5eEg4Q0tpWkwyRnlwUkhJYkQ0ZUo1Slhvb0ZwU0dYNHRVYWVKcFhU?=
 =?utf-8?B?clJ2NElwNDFrVlhJeEU5ck0wNzdMK0JGcmFWZVVXNlVXQVYyY1BmNng3UmUr?=
 =?utf-8?B?YnRSTGM4OTlRQlFrZHlNTk1YaThmUGV6eGRPVEcxa1FHRGdMVFdZTXd4dGh3?=
 =?utf-8?B?MFFSenlOZE0xZk1pb0drcFZlcTVMckZldUpLby9SbnVBUmlvWVBleUM1ZTBM?=
 =?utf-8?B?dFhPY0JDZjlqZlRLVHRyanA4ZWZTWVphd0Q4MzRKWThKSDZDTGhrR3RMKy9X?=
 =?utf-8?B?VC9PbFBjREF3ZVBxNUxIcW9CbUxRRUIrVXVIV2RhS2RCcnhuVk84VTc1dkFI?=
 =?utf-8?B?YytGL1VqSjdzKyt0cy91UDh3bW9uZzlIK0lUVi9VZW9RWXcrRS9kL0M5ZWJj?=
 =?utf-8?B?QkNndjdrYXJ4dVBNV2QxdzZzZkRQNG4rK3hhS0hybFhVQ1pORy9ialJsbW5R?=
 =?utf-8?B?YmI4VTI0bWk5OVU2Yy9DdjJ1TGZ0amlGdDlhOFdmY1ZVUFZ5NlNUMmV0L2RR?=
 =?utf-8?B?dDJ6MUVmZXBTbUd2QlBCR2ZERVdyNHhDOU5BUU9wSWNPb25ZaUhvTWh4ekNh?=
 =?utf-8?B?SklsR1V2UWxQK3Y5aWtHWFdodjdqUTVHNkpkWlVGUjVwbFZwQzZXM1hoR3NE?=
 =?utf-8?B?SWpuWHJiS0pnN3RsaDR0a09OWjRmOXdpZFViditRWjdtbGUrL3o2RktuUzVt?=
 =?utf-8?B?SVJRUFUwejdyN0FsdWxSVXIySndVcS95TUpGR0Rvam9hV2t4Nm9RYUhoTnd1?=
 =?utf-8?B?WnF6TDAyZTg2WnNhZWR3RlZ0d2NtVnBNcHZIdFgrdXdSNHRZQ3N1eGRXUVJC?=
 =?utf-8?B?SlY5Q3Q2aENEd0tBb3VoNUtPUFI1ZkNvWEVwQWpObHBHRXRuTmVub0g2Y0dW?=
 =?utf-8?B?NStYSjdJbTM3R2VUVXJxTXN0Z0lXcE5lY0o1RDJwVExBMDM3SE16S3RQM2JM?=
 =?utf-8?B?TWU1Zm5Bb0N5SHYrN2N3ZlJxTFRCWXdxQ0xmS3Q2bTB6K0YxcDYxRnJRaDRN?=
 =?utf-8?B?OS9mNldxejJJUTZKVkQ3bFRzeGVHV3hsRThmcURtRXEzM0Q2czJveEtCV2F2?=
 =?utf-8?B?bzJkY05Hb3BzdDRsbEw1eUU5MGx0Q2RWRFgzc3ZCSGhDUmVYYWpxMnJFQkQ5?=
 =?utf-8?B?MnJmNkZFMWNKaHZmUjk0cmNraTdOZWRsRHdCbWExSERJNFdtYlVHRDhEUVEw?=
 =?utf-8?B?MDB0d3JvY0RuQ1QzRldpN2pvWG1CMjgzV3NCZkM3bVJRcVlDajFLd3Z1R2tX?=
 =?utf-8?B?cmJnT0tyUU54WjdHM2pjYm9QVC9DMzBsaEFqK28vTG91aTJmUkFjY2R6dzBu?=
 =?utf-8?B?WTk3SW9lM0hCMmpESlBVVFJhUFZEQzh0SlJuZmQreC9DQ3NyVEtsZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <876B5F3F08AB154BA9BCFB1FCC5445A6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: B4iRaOU56LxWew3puyN+E/gSCMdVb57yeWWMwScj+8MUuwtMG2gUnhIWFVLzaQQKlbx50yB+7M9zKAjLorJ8/eb/7fvxvn8ZD41w4b9uZe5NnwUvVts2ia50+z2DNlZKD4xlgHJOIMqXG+QoR93GZDuOZEMvVQQqzTtHVA6MVlogac4a22iZUOvmE7IW8wvh0IPfWCl9wZBxkcvxfj3jSWwDWz1m1bMF+H2NqI52MDkxWAtvsEtfqjR4aU5jZMgsCFIEhyn9Ugx8F+zPOQKkdUwJeEkNDtN62p9ozaT0H2+mCBL4gn9bIwYqc3ZNDS/Wq1fumviP2HYiJF0NKTdbqQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e47faf-6774-4314-197f-08df4008a61a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 15:29:59.9394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QR1Zz2syy3j8ORumBhGGA2xlfRaJivy+zg2JfcXVAmz0YTO0vfbGSHrEUS4isFlbfPXK8cEffODK7PgpDezyLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB719904
X-OriginatorOrg: intel.com
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCAyMDI2LTExLTExIGF0IDEzOjU3ICswMDAwLCBKYXZpZXIgTVYgd3JvdGU6DQo+IEZy
b206IEphdmllciBNViA8amF2aWVybXZAZHVjay5jb20+DQo+IA0KPiBXaGVuIHRoZSBjb250ZXh0
IG9mIGEgcmVxdWVzdCBiZWluZyBzdWJtaXR0ZWQgaXMgYmFubmVkIG9yIGV4aXRpbmcsDQo+IF9f
Z3VjX2FkZF9yZXF1ZXN0KCkgbWFya3MgdGhlIHJlcXVlc3QgYXMgY29tcGxldGUgd2l0aCAtRUlP
IGluc3RlYWQNCj4gb2YNCj4gc3VibWl0dGluZyBpdC4gQnV0IGd1Y19kZXF1ZXVlX29uZV9jb250
ZXh0KCkgbWVyZ2VzIGFsbCBxdWV1ZWQNCj4gcmVxdWVzdHMNCj4gb2YgYSBjb250ZXh0IGFuZCBv
bmx5IHBhc3NlcyB0aGUgbGFzdCBvbmUgdG8gX19ndWNfYWRkX3JlcXVlc3QoKS4gVGhlDQo+IGVh
cmxpZXIgb25lcyB3ZXJlIG1vdmVkIHRvIGNlLT5ndWNfc3RhdGUucmVxdWVzdHMgYnkNCj4gX19p
OTE1X3JlcXVlc3Rfc3VibWl0KCksIHdoaWNoIG9ubHkgc2tpcHMgdGhlaXIgcGF5bG9hZDogdGhl
eSBzdGlsbA0KPiBuZWVkIHRoZSBHUFUgdG8gcnVuIHRoZSBjb250ZXh0IGFuZCB3cml0ZSB0aGVp
ciBicmVhZGNydW1icy4NCj4gDQo+IEFmdGVyIGEgZnVsbCBHVCByZXNldCB0aGUgYmFubmVkIGNv
bnRleHQgaXMgbm8gbG9uZ2VyIHJlZ2lzdGVyZWQgd2l0aA0KPiBHdUMgYW5kIGlzIG5ldmVyIHJl
Z2lzdGVyZWQgYWdhaW4sIHNvIHRob3NlIHJlcXVlc3RzIG5ldmVyIGNvbXBsZXRlLg0KPiBOb3Ro
aW5nIHJldGlyZXMgdGhlbSwgdGhlIGJ1ZmZlcnMgdGhleSByZWZlcmVuY2Ugc3RheSBwaW5uZWQs
IGFuZCB0aGUNCj4gY2xpZW50IHdhaXRzIG9uIHRoZWlyIGZlbmNlcyBmb3JldmVyLg0KPiANCj4g
U2VlbiBvbiBBREwtUCB3aXRoIGEgVnVsa2FuIGNvbXB1dGUgam9iIChsbGFtYS5jcHApIGFuZCBh
IHNob3J0DQo+IHJlcXVlc3RfdGltZW91dF9tczogYSBHdUMgY29udGV4dCByZXNldCwgdGhlIGJh
biwgdGhlIHJlcGxheSBtb3ZpbmcNCj4gMTAgcmVxdWVzdHMgYmFjayB0byB0aGUgcXVldWUsIHRo
ZW4gYSBmdWxsIEdUIHJlc2V0IGFmdGVyIGEgc3RvcHBlZA0KPiBoZWFydGJlYXQuIEFmdGVyd2Fy
ZHMgdGhlIGNvbnRleHQgd2FzIHVucmVnaXN0ZXJlZCBhbmQgdGhlIEd1QyBzdWJtaXQNCj4gcXVl
dWUgd2FzIGVtcHR5LCBidXQgOSBvZiBpdHMgcmVxdWVzdHMgbmV2ZXIgY29tcGxldGVkOiA3LjUg
R0Igb2YNCj4gb2JqZWN0cyBzdGF5ZWQgcGlubmVkIGFmdGVyIHRoZSBwcm9jZXNzIHdhcyBraWxs
ZWQuDQo+IA0KPiBDb21wbGV0ZSBldmVyeSByZXF1ZXN0IG9uIHRoZSBjb250ZXh0J3MgbGlzdCwg
YXMNCj4gZ3VjX2NhbmNlbF9jb250ZXh0X3JlcXVlc3RzKCkgZG9lcywgYnV0IG9ubHkgd2hlbiB0
aGUgY29udGV4dCBpcyBvZmYNCj4gdGhlIEhXIChub3QgZW5hYmxlZCwgbm8gZW5hYmxlIG9yIGRp
c2FibGUgaW4gZmxpZ2h0KSwgc28gYSByZXF1ZXN0DQo+IHRoYXQNCj4gaXMgc3RpbGwgZXhlY3V0
aW5nIGlzIG5ldmVyIG1hcmtlZCBjb21wbGV0ZS4gVGhlIHN1Ym1pdHRlZCByZXF1ZXN0IGlzDQo+
IG9uIHRoYXQgbGlzdCB0b28sIHNvIGl0IGlzIGNvbXBsZXRlZCBvbiBpdHMgb3duIG9ubHkgd2hl
biB0aGUgY29udGV4dA0KPiBpcyBzdGlsbCBvbiB0aGUgSFcsIGFuZCBub3RoaW5nIHRvdWNoZXMg
aXQgYWZ0ZXIgdGhlIGxvY2sgaXMgZHJvcHBlZDoNCj4gb25jZSBjb21wbGV0ZSBpdCBjYW4gYmUg
cmV0aXJlZCBhbmQgZnJlZWQuDQo+IA0KPiBGb3VuZCBhbmQgZml4ZWQgd2l0aCBDbGF1ZGUgQ29k
ZTsgZGV0YWlscyBpbiB0aGUgY292ZXIgbGV0dGVyLg0KDQpUaGlzIGNvbW1pdCBtZXNzYWdlIHdp
bGwgYmUgcGFydCBvZiBnaXQgaGlzdG9yeSwgd2hpbGUgdGhlIGNvdmVyIGxldHRlcg0Kd29uJ3Qu
IFNvIHRoaXMgbWVzc2FnZSBkb2Vzbid0IGJlbG9uZyBoZXJlIHRvIHN0YXJ0IHdpdGguDQpUaGUg
Y29tbWl0IG5lZWRzIHRvIGJlIHNlbGYgc3VmZmljaWVudCBhbmQgc2VsZiBleHBsYWluZWQuDQpB
bHNvLCBwbGVhc2UgYXNrIHlvdXIgTExNIHRvIGJlIGNvbmNpc2UgaW4gdGhlIG1lc3NhZ2VzIGFu
ZCB0bw0KYXZvaWQgdW5uZWNlc3NhcnkgY29tbWVudHMuIEEgZ29vZCBjb2RlIHRhbGtzIGZvciBp
dHNlbGYuDQoNCldpdGggc2hvcnQgdGV4dHMgeW91ciBjaGFuY2VzIG9mIGdldHRpbmcgYSByZXZp
ZXdlciBpbmNyZWFzZXMuDQoNCj4gDQo+IEZpeGVzOiBhZThhYzEwZGZkMmEgKCJkcm0vaTkxNS9n
dWM6IEltcGxlbWVudCBiYW5uZWQgY29udGV4dHMgZm9yIEd1Qw0KPiBzdWJtaXNzaW9uIikNCj4g
TGluazogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lz
c3Vlcy8xNTMwMQ0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTVYgPGphdmllcm12QGR1Y2suY29t
Pg0KPiAtLS0NCj4gdjI6DQo+IC0gQ29tcGxldGUgcnEgb24gaXRzIG93biBvbmx5IHdoZW4gdGhl
IGxvb3AgZG9lc24ndCBydW4sIHVuZGVyIHRoZQ0KPiDCoCBsb2NrLiB2MSBjb21wbGV0ZWQgaXQg
YWdhaW4gYWZ0ZXIgdGhlIHVubG9jaywgd2hlbiB0aGUgbG9vcCBoYWQNCj4gwqAgYWxyZWFkeSBj
b21wbGV0ZWQgaXQgYW5kIGl0IGNvdWxkIGhhdmUgYmVlbiByZXRpcmVkIGFuZCBmcmVlZA0KPiDC
oCAoU2FzaGlrbykuDQo+IA0KPiDCoC4uLi9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX3N1
Ym1pc3Npb24uYyB8IDIwDQo+ICsrKysrKysrKysrKysrKysrKy0NCj4gwqAxIGZpbGUgY2hhbmdl
ZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19zdWJtaXNzaW9uLmMNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfc3VibWlzc2lvbi5jDQo+IGluZGV4IDc4
OGU1OWMuLmIyZmZjNmIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3Vj
L2ludGVsX2d1Y19zdWJtaXNzaW9uLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
dWMvaW50ZWxfZ3VjX3N1Ym1pc3Npb24uYw0KPiBAQCAtNzA5LDcgKzcwOSwyNSBAQCBzdGF0aWMg
aW50IF9fZ3VjX2FkZF9yZXF1ZXN0KHN0cnVjdCBpbnRlbF9ndWMNCj4gKmd1Yywgc3RydWN0IGk5
MTVfcmVxdWVzdCAqcnEpDQo+IMKgCSAqIHJlcXVlc3QgcmVzdWJtaXR0ZWQgYWZ0ZXIgdGhlIGNv
bnRleHQgd2FzIGJhbm5lZC4NCj4gwqAJICovDQo+IMKgCWlmICh1bmxpa2VseSghaW50ZWxfY29u
dGV4dF9pc19zY2hlZHVsYWJsZShjZSkpKSB7DQo+IC0JCWk5MTVfcmVxdWVzdF9wdXQoaTkxNV9y
ZXF1ZXN0X21hcmtfZWlvKHJxKSk7DQo+ICsJCXN0cnVjdCBpOTE1X3JlcXVlc3QgKnBvczsNCj4g
Kw0KPiArCQkvKg0KPiArCQkgKiBUaGUgZGVxdWV1ZSBvbmx5IHBhc3NlcyB0aGUgbGFzdCBvZiB0
aGUgbWVyZ2VkDQo+IHJlcXVlc3RzLCBhbmQNCj4gKwkJICogdGhlIGNvbnRleHQgd29uJ3QgcnVu
IGFnYWluIHRvIHdyaXRlIHRoZSBvdGhlcnMnDQo+IGJyZWFkY3J1bWJzOg0KPiArCQkgKiBjb21w
bGV0ZSB0aGVtIGFsbCAocnEgaXMgb24gdGhlIGxpc3QgdG9vKSwgb25jZQ0KPiB0aGUgY29udGV4
dA0KPiArCQkgKiBpcyBvZmYgdGhlIEhXLiBEb24ndCB0b3VjaCBycSBhZnRlciB0aGUgdW5sb2Nr
Og0KPiBvbmNlIGNvbXBsZXRlDQo+ICsJCSAqIGl0IGNhbiBiZSByZXRpcmVkIGFuZCBmcmVlZC4N
Cj4gKwkJICovDQo+ICsJCXNwaW5fbG9jaygmY2UtPmd1Y19zdGF0ZS5sb2NrKTsNCj4gKwkJaWYg
KCFjb250ZXh0X2VuYWJsZWQoY2UpICYmDQo+ICFjb250ZXh0X3BlbmRpbmdfZW5hYmxlKGNlKSAm
Jg0KPiArCQnCoMKgwqAgIWNvbnRleHRfcGVuZGluZ19kaXNhYmxlKGNlKSkgew0KPiArCQkJbGlz
dF9mb3JfZWFjaF9lbnRyeShwb3MsICZjZS0NCj4gPmd1Y19zdGF0ZS5yZXF1ZXN0cywgc2NoZWQu
bGluaykNCj4gKwkJCQlpOTE1X3JlcXVlc3RfcHV0KGk5MTVfcmVxdWVzdF9tYXJrX2UNCj4gaW8o
cG9zKSk7DQo+ICsJCX0gZWxzZSB7DQo+ICsJCQlpOTE1X3JlcXVlc3RfcHV0KGk5MTVfcmVxdWVz
dF9tYXJrX2VpbyhycSkpOw0KPiArCQl9DQo+ICsJCXNwaW5fdW5sb2NrKCZjZS0+Z3VjX3N0YXRl
LmxvY2spOw0KPiArDQo+IMKgCQlpbnRlbF9lbmdpbmVfc2lnbmFsX2JyZWFkY3J1bWJzKGNlLT5l
bmdpbmUpOw0KPiDCoAkJcmV0dXJuIDA7DQo+IMKgCX0NCg==
