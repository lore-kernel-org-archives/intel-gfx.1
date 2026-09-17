Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B567C982CC
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Sep 2026 01:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98D510E0C2;
	Thu, 17 Sep 2026 01:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8r70qy7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8BB10E0C2;
 Thu, 17 Sep 2026 01:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789609765; x=1821145765;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ybBM8DJvcIUPBZGpQYBY0tJAsZ2ZAbqbBdMU99SNC4Y=;
 b=G8r70qy7EPOst1BHxmZ68JRbq4Xm6cGADWbM1mfqu8lmW6jwrbUfPoi3
 a8IOjwy+XvzF0nWVBvLq7oSzwqOewcUr9fJT3dc4luYne32pcqGa3j1XX
 z1cNhyw9XMuApBt5AbzMqRS9Ghce/i6ZDdSWNbl0WJ+PBBYdWm3KZ0mjk
 1mO20VMx+uJBZ3ZlNwAHDIVwy2kZCxnVAewwpRrupSx/WoL/VllnmwovQ
 eJ2xU0TXwwaA0EnUC0ONgUaJSZu1J5h7Os0/ef8qhgnCdO62LCyqFxETX
 if+GxrLnz3NHL1No6HCtaGBu48eaDrw5X/+I+YwPNi8j9edTw74EysFFY w==;
X-CSE-ConnectionGUID: J7Bb0KunSEiev4BMOKYfxQ==
X-CSE-MsgGUID: O0sbC8pbRC+pyEiP1uRp2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107497879"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107497879"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 18:49:24 -0700
X-CSE-ConnectionGUID: idVyWkcqRJOes5hjR6yk8g==
X-CSE-MsgGUID: ZpoRCTZETLWPXQGBLF1TKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="272045964"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 18:49:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 18:49:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 18:49:24 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 18:49:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otHdFSyOxcgSr4LN5yG56sQgq1gG2WEoHJiU+esloVGwT9fozYBIXYwYH0U82n4eifuSE4lY1qELYXNi5ZMBh1jYPB4M3LZQD0yVyqMd/OSrYXmVoCouvMqP4hHWuYlIrZG7uGEuPCY6hNgEmpvFE54WyexvL1J83Uzuv+8ao0XWibbcNhG2x8wbutUnP8DpkS91GXBtq101HlyE8fEb99/ACfuOe+X8igcaXfCQsf+CHbmYfLsQIXo4HkTFpumyY2/RqyauKpKxdW2UIVQ9h8IQHQL+CDa4XsPb5mRLo8/kKpdFgsY5cOWgSfQ7VAPsnPNd8ceejLNesNXgoAWepw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybBM8DJvcIUPBZGpQYBY0tJAsZ2ZAbqbBdMU99SNC4Y=;
 b=ID0mO3n5LsaPP7rgGHDXHDHKmbuy906KRAuYPAeVhoN88sQn19zTUtKH6jjd8xsk9Xi/9ADw1xMo+E47rs4nhTbauYqeYZf9ruhF/NJGlaMO2SJ6naksVUbiuwIe1OGNB19OQg7NyEDgl/su4dhxuaFWsph/2MPUv9XlKcAiF3275RNMKvliwksxnPzQ2wwDlWDzTWzhRAIx6Kn/Z+lKGjJYWuZ4xJgD48B8mJHm7hO35D/QK45DfcMgibgeQ/L/PQmY6f12vxDJcB9BfyOCo01MD6kAls543v3myUM147UFu/OZEk4nTA5OmOPSyyULgskMRkNTlvsUOF+D8CvWlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7643.namprd11.prod.outlook.com (2603:10b6:510:27c::22)
 by IA3PR11MB9207.namprd11.prod.outlook.com (2603:10b6:208:578::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 01:49:16 +0000
Received: from PH7PR11MB7643.namprd11.prod.outlook.com
 ([fe80::9c70:e3f8:6e5a:bbdc]) by PH7PR11MB7643.namprd11.prod.outlook.com
 ([fe80::9c70:e3f8:6e5a:bbdc%4]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 01:49:16 +0000
From: "Gao, Fred" <fred.gao@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
CC: "Wang, Chenchen" <chenchen.wang@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgZHJtL2k5MTUvcGFu?=
 =?utf-8?B?ZWw6IE9ubHkgY29uc2lkZXIgc2VhbWxlc3MgRFJSUyBtb2RlcyBhcyB0aGUg?=
 =?utf-8?Q?highest_mode?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBkcm0vaTkxNS9wYW5lbDog?=
 =?utf-8?B?T25seSBjb25zaWRlciBzZWFtbGVzcyBEUlJTIG1vZGVzIGFzIHRoZSBoaWdo?=
 =?utf-8?Q?est_mode?=
Thread-Index: AQHdRFwQhdW+EApHYkiz6oz9U9A8TLbPIOoggAA1yYCAAqnoMA==
Date: Thu, 17 Sep 2026 01:49:16 +0000
Message-ID: <PH7PR11MB76430EF7EB14F68547DF58759DB82@PH7PR11MB7643.namprd11.prod.outlook.com>
References: <20260914085525.2669889-1-fred.gao@intel.com>
 <178939899718.159168.66979253943613325@61270ab9df2a>
 <PH7PR11MB7643C825B918DABFBA9F69979DBA2@PH7PR11MB7643.namprd11.prod.outlook.com>
 <61870fda5e45d89f46f0cfb41fce1ebdc96f7865@intel.com>
In-Reply-To: <61870fda5e45d89f46f0cfb41fce1ebdc96f7865@intel.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7643:EE_|IA3PR11MB9207:EE_
x-ms-office365-filtering-correlation-id: 06b898c4-4b3c-44d1-9897-08df145de209
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|6133799003|56012099006|4143699003|5023799004|11063799006|3023799007|22082099003|18002099003|10067099003|38070700021;
x-microsoft-antispam-message-info: hs3+tFkllaBEv30J88vdnAS8vG79Vk2+ZexvFb1XQsnwnboEkgU55DWnsme09d25N1SOfwz4qLW2wcbI2QwNS4eE/qbCZkr4Kklax7g6IupkXSVwD1eh9eU6Q9x/4od07hfeWjdLeqrJAskQ9DuR2cmuzpZA/Wbdf4pG8Anqb/jfR+TpxZUIMKeUh7aOM5z8PNPIIIRctK49d5S5r/rdvPn3UXnqDxF9xuqpykuiLR2auihwjI4Qxxs35d6eOYHfhxGZubHwXL/j0hkZTbrElUpmsJq3w3WI5b0TcdpSApCeXjPOavMpfaf500CO6sxKlDkzA1gqmdkVXCOlcRI6o1CFMLAKtK2JCVSyTZEc8fUPOvaolEp+8gXfSBHlnJ4gAZEq726nVudMr5s61eRqvl1zmK3Vy2jCf6GeivE46kHgrY5opb2ITBnj4VaR4iSIWxe0aYQKhl/C05l0aAf9yi9F+lHDijXT2Z0iHmlhyP+abrUE8Mm843m0L5u6ThhipiAHM9FIDA/HofQYNN4o0vWlQCirA6XdIlbfFE1Kt2l/7zidbtGma/duIIndmE0LgIGHJTsM5nkAL5YVj4Yyk2ZOwE8ux1MUOtN/kk/jEuvlTkDHdsyEojddZ5sdJDIH4lQnk1dtiegfYaw2jw9rZXpTudRbZq024DFkH6PtLR8ZaxK9yhmiqx67TSeeJ0Iw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:PH7PR11MB7643.namprd11.prod.outlook.com; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(56012099006)(4143699003)(5023799004)(11063799006)(3023799007)(22082099003)(18002099003)(10067099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzAyVGFtUTRWZHovQWthaTZ6TUYwSEhYOVpCNE94Y1ZHbGRmWlJiY0FmTDh6?=
 =?utf-8?B?bEZLRGhKL1J1a0hGNWk5M3V2S1JwRVlwd2NKUkJOVEp5bUxMek5tRDVQNEtt?=
 =?utf-8?B?R1EyQ0J1VnpwdU9tc0puMHVJV2pRc0lHdTVGdTFqamZjaTRFdU9TRE1JSnZY?=
 =?utf-8?B?eVArdTRQYmpRQmRqZmtPellEZXVlZEp1RzA2ZkQ4N25mMHI2Y1BIbjFhcnEr?=
 =?utf-8?B?ZkplL24yM0tvUVhScmxxYW55UWEvRzcvYVBLUnpDeEM2dDlPMFpGWkFDbFA1?=
 =?utf-8?B?NHd5WGd1cThTaXkvMVF0UHE5SGtEZjc3KzcrMk0vRHJHMEZKTExTV0F3ZTVW?=
 =?utf-8?B?ajFsMml2YTZmcXBIenEwYTUxcW4rUDV3d3U0dzVGbXh4WnRtTDhaeGsxMWhJ?=
 =?utf-8?B?dTR3Q05VWFVQUGNnMEt3V0Nic2JGZmtRNmRYSkJDZHNaSnRJektaTExmL2ho?=
 =?utf-8?B?YmtoZkZRSVgvZUFJaW40ZVZUamNpaFdwenRqQTF2blFKS2k3NEdTb2FhSGJy?=
 =?utf-8?B?bjEyRC9OMy9naW9GUWJQNDNWcVV0aVl6aDF3MDFNL3cxMDBoajJwY1NnVUFJ?=
 =?utf-8?B?MUp3aHN4Uk5lci91MERaTUQ1dkJ6RmFRVDUrYlpkNEExV2RkVElPUXFrSnEy?=
 =?utf-8?B?R1NBbVk1YUJxTmFkTFU2dndLVnpEOUM0clBLQUliaXZGSTc0ZzVmNjhKNWY2?=
 =?utf-8?B?M0pUdlFvc25nbTdHMUdkNk1sakF3emppczEzT1pHNERIeHovYWc1cFB3N3Fa?=
 =?utf-8?B?S1BlWmxoaGRUNUVJVldPckd5SVdkd25BYkhkS3ZGdHYxV3lWeVh5ZnRnMGFU?=
 =?utf-8?B?RzVqSzNILzg5ekZ0U3ZBWDU4bmx4dEZDcUdWalB5OEs1dHdoNy9kMWJoVnVn?=
 =?utf-8?B?RDVydE4wNVQrVFhGaUxJZ2RUcnpRTHl0U1lvRVpNbnBSaUpvbjlNb2o0QTJO?=
 =?utf-8?B?R2xRMnIvWmIyMUl5UEgwQUoxbnlVak5tZThpMjZTamhzME5EYTVQQlFvekxa?=
 =?utf-8?B?aE1Tei9GZi8vVHNhL2dQSWhsUUM2Y2RPY1BJSnNpa2FNQ0ZIT0JPcmdwS0JC?=
 =?utf-8?B?RW5jUEJsMUs0SW8wS0xrTHdGajVzd0tDT0VaMi9vVURhelFPNnJSUXBpUVBx?=
 =?utf-8?B?M1QxbDROL3V5clRBWE5QMUFBNnppVmx5ejJGTmZIMXp2TEZRd3JUeHpxMS9N?=
 =?utf-8?B?K2JwbTM0ZU5YVXhqYmphWUN0dEFhdFUwZUNzSytCa2dHZlZUYW5yVVd3TjZn?=
 =?utf-8?B?d1BUdk1mTTY4a1Y3NXFqcjR6UnBBM1puYVpidmxlRTl1dkp2KzdzdTFQOXlY?=
 =?utf-8?B?d2RUY0tTenBYd2J3RkZMNWZyMTFFZWc0VUc0ZTRXelF6ZU1uQkhaeEozRUFV?=
 =?utf-8?B?bjlaRUxJVjFWQzJKNmFRcHZmYzFBS3llbmx6c1BtYXpYR2NmWlpXeG8zVDh5?=
 =?utf-8?B?VVRPcUloeFM4VDlSSVRPenJocytBOHVoYlFrMlpxUTV2TkIrVTVNemJyS1Nm?=
 =?utf-8?B?ZHFwbEJDemxHYnF3eVpaTzFpTDluek5aTXl5N1I4MG5GV3V0QTlEeWZhQWpQ?=
 =?utf-8?B?c1NSZURrcXpVOVFzWVFUWGdUWmNQL2ViazIyRmVqSE8wdTZiRFF4OFJkaVVH?=
 =?utf-8?B?UjlZVk9ZM0IxMjMzTkhxdmM2NDZHMXEzZXF5UjkvSVQya1JROS9sakc4Nk1F?=
 =?utf-8?B?MzVNOG5VcnVrUElDdm5ZUHZ4TzEyNElCdU1hU2tvRzd1Sjl0clZ1WUNJbXQ5?=
 =?utf-8?B?dDVHS2xWYWRHUlNoK1htYUJNWWRjcjVHZVRoVE9DQ3VDMUpjdU4yeWpkRk9Y?=
 =?utf-8?B?azUxWUNycnBydmFqYURKN21YclI1a0dEYXpyV3dKUkM0QXdyODJteDZUcU53?=
 =?utf-8?B?TDFGWVJGNmwvQ3Q5a0F4MW83VjJiZXFZS0xST0dmKzZSMTRLT0VDVzg2TUlP?=
 =?utf-8?B?dGF0UXdxbFdUb1V5SUhOOEtrd3VkOVI3d05rWC8rSzdHNEtvc0lsNVBqMlFL?=
 =?utf-8?B?TUtFbHoxK3ZVenVJcnplYnJvaDZDdEZwL3NQYlAyaTlFRFZjVTF2amY2NHE4?=
 =?utf-8?B?cnk0eFFUU2dRTlFvQXgyMFJybVAvSVYyKytIMGNOakhOOUlNK24xTXkvOFlj?=
 =?utf-8?B?bTB2MmViUWxFVDV2dXlRdmhzT0FzZzU3a1A0TzJ6S25ydmliK3IzbkxTLzdB?=
 =?utf-8?B?QmR6RUpoVlYzNjlWcE9xbmo4aVNMRDBZdzV0MEpFV3I0bGg1VHhzRlV5dnR5?=
 =?utf-8?B?QTRqUzlzcUoySFFyaDRBVHZhMlZDWFVhSW1PdlpZeUVsN0twS1o4V2M3dUZF?=
 =?utf-8?Q?F1RhXoLoMsTFyK++Z3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qwDju551OyClYACBSdgwVSKDXHFKuwQ4UrpkMB6loOH9v7IKq1rRKZBebCcDIUqwG0ObIXqijZgK2GDCvKaZ9pix2mDBN33Z7f/tv1jiwN5h8UPmAsNhSCsvDCnSI/rV/GHNbYDqin6wuM+sPVFMK/9J4GwFwk8lDly5hSpTPA7vlwYc09LxGOcx44mk36k8wvBBeevt12uihq0l6z1FLJz+Yf2Ow7ebYlmKQcBmx2dEc+GH1prEq/g8E4MvoMiXhKZN0BjPS65MSbEiThmtAiHEyN8GQGgBd8IY3l+tzsA6OFurZl9vgeerrkjBybJ8z4wmtCcmnKtKyr+A2Qb+aQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7643.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b898c4-4b3c-44d1-9897-08df145de209
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 01:49:16.6582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fQx4wSd+ypI6QS97iOlx2BfaShwG9kPstiKJZlxs6H8dCHjDSQUdGXEZxPLdNaf9YAclD6BPmIXk0Hvf+Jr3XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9207
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

VGhhbmtzIEphbmkgZm9yIHRoZSByZW1pbmRlci4NCg0KSGkgSTkxNSBDSSBpbmZyYSB0ZWFtLAkN
Cg0KVGhlIHR3byByZXBvcnRlZCByZWdyZXNzaW9ucyBhcmUgdW5yZWxhdGVkIHRvIHRoaXMgZGlz
cGxheSBwYXRjaC4gRGV0YWlsZWQNCmFuYWx5c2lzIGZvciBlYWNoIGZhaWx1cmUgaXMgcHJvdmlk
ZWQgYmVsb3cuDQoNCj4gUG9zc2libGUgcmVncmVzc2lvbnMNCj4NCj4gKiBpZ3RAaTkxNV9zZWxm
dGVzdEBsaXZlQGd1Y19oYW5nOg0KPiAgICogYmF0LWFybGgtMjogUEFTUyAtPiBJTkNPTVBMRVRF
DQo+ICAgICBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL1BhdGNod29y
a18xNzQwMjV2MS9iYXQtYXJsaC0yL2lndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAZ3VjX2hhbmcuaHRt
bA0KDQpMb29raW5nIGF0IHRoZSBleGVjdXRpb24gbG9ncyBiZXR3ZWVuIGJhc2VsaW5lIChDSV9E
Uk1fMTkxNDEpIGFuZCBwYXRjaGVkDQooUGF0Y2h3b3JrXzE3NDAyNXYxKToNCg0KVGVzdCBTdWl0
ZSAvIEV2ZW50ICAgICAgICAgIEJhc2VsaW5lIChDSV9EUk1fMTkxNDEpICBQYXRjaGVkIChQYXRj
aHdvcmtfMTc0MDI1djEpDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAgICAgICAgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0gICAgICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpo
YW5nY2hlY2sgc3VpdGUgICAgICAgICAgIFNVQ0NFU1MgKGlkZW50aWNhbCkgICAgICAgU1VDQ0VT
UyAoaWRlbnRpY2FsKQ0KbGl2ZV9zbHBjX3Bvd2VyICAgICAgICAgICBTdGFydHMgNDcwLjJzLCBQ
QVNTICAgICAgICBTdGFydHMgNDY4LjBzLCBoYXJkIGhhbmcgQDQ2OS40cw0KZ3VjX2hhbmcgICAg
ICAgICAgICAgICAgU3RhcnRzIDQ4Ny4xcywgUEFTUyAgICAgICAgTmV2ZXIgcmVhY2hlZCAocmln
IGh1bmcpDQplRFAgbGluayBzdGF0dXMgICAgICAgICAgICBMaW5rIGZhaWxlZCAocGlwZSBBIG9m
ZikgICAgIExpbmsgZmFpbGVkIChwaXBlIEEgb2ZmKQ0KaXNfYWx0X2RycnMgLyBwYW5lbF9oaWdo
ZXN0ICAwIG9jY3VycmVuY2VzICAgICAgICAgICAgMCBvY2N1cnJlbmNlcw0KDQpObyBkaXNwbGF5
IHBhdGhzIHdlcmUgZXhlcmNpc2VkIGR1cmluZyB0aGlzIGV4ZWN1dGlvbi4gVGhlIGVEUCBsaW5r
IGZhaWxlZA0KdG8gdHJhaW4gb24gdGhpcyB0ZXN0IGJlbmNoIGluIGJvdGggdGhlIGJhc2VsaW5l
IGFuZCBwYXRjaGVkIHJ1bnMsIG1lYW5pbmcNCmludGVsX3BhbmVsX2hpZ2hlc3RfbW9kZSgpIGFu
ZCBpc19hbHRfZHJyc19tb2RlKCkgd2VyZSBuZXZlciBpbnZva2VkLg0KDQpUaGUgZmFpbHVyZSB3
YXMgY2F1c2VkIGJ5IGEgaGFyZCBsb2NrdXAgaW5zaWRlIGludGVsX3NscGNfbGl2ZV9zZWxmdGVz
dHMNCihsaXZlX3NscGNfcG93ZXIpIGF0IHRpbWVzdGFtcCA0NjkuNHMsIHdoaWNoIGlzIGFuIHVu
cmVsYXRlZCBHdUMgU0xQQw0KZnJlcXVlbmN5L2dvdmVybm9yIHNlbGZ0ZXN0LiBUaGUgZ3VjX2hh
bmcgc3VidGVzdCB3YXMgbmV2ZXIgc2NoZWR1bGVkLg0KUGxlYXNlIHRyZWF0IHRoaXMgYXMgYW4g
ZW52aXJvbm1lbnRhbC9HdUMtc2lkZSBmbGFrZS4NCg0KPiAqIGlndEBrbXNfZnJvbnRidWZmZXJf
dHJhY2tpbmdAYmFzaWM6DQo+ICAgKiBmaS1za2wtNjYwMHU6IFBBU1MgLT4gRE1FU0ctV0FSTg0K
PiAgICAgaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9QYXRjaHdvcmtf
MTc0MDI1djEvZmktc2tsLTY2MDB1L2lndEBrbXNfZnJvbnRidWZmZXJfdHJhY2tpbmdAYmFzaWMu
aHRtbA0KDQpEaXJlY3QgY29tcGFyaXNvbiBvZiB0aGUgZG1lc2cgb3V0cHV0IGJldHdlZW4gYmFz
ZWxpbmUgYW5kIHBhdGNoZWQgcnVucw0Kc2hvd3MgaWRlbnRpY2FsIG1vZGUgcHJvZ3JhbW1pbmc6
DQoNClBhcmFtZXRlciAgICAgICAgICAgICAgIEJhc2VsaW5lIChDSV9EUk1fMTkxNDEpICAgUGF0
Y2hlZCAoUGF0Y2h3b3JrXzE3NDAyNXYxKQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gICAg
ICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICAgICAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NClBpeGVsIENsb2NrICAgICAgICAgICAgICAgIDM3MzI1MCBrSHogICAgICAgICAg
ICAgIDM3MzI1MCBrSHoNClBvcnQgQ2xvY2sgLyBMYW5lcyAgICAgICAgICA1NDAwMDAga0h6LCA0
eCAgICAgICAgICAgNTQwMDAwIGtIeiwgNHgNCk1heCBQaXBlIC8gTGluayBCUFAgICAgICAgICAy
NCBicHAgICAgICAgICAgICAgICAgICAyNCBicHANClN1YnRlc3QgUmV0dXJuIENvZGUgICAgICAg
IFNVQ0NFU1MgKHJldD0wKSAgICAgICAgICBTVUNDRVNTIChyZXQ9MCkNCkF0b21pYyB1cGRhdGUg
ZmFpbHVyZXMgICAgICAgMCAgICAgICAgICAgICAgICAgICAgICAxIChkbWVzZy13YXJuKQ0KDQpU
aGUgbGluayBwYXJhbWV0ZXJzIGFuZCB0aW1pbmcgcmVnaXN0ZXJzIHNlbGVjdGVkIGJ5IGludGVs
X3BhbmVsX2hpZ2hlc3RfbW9kZSgpDQphcmUgaWRlbnRpY2FsIGFjcm9zcyBib3RoIHJ1bnMuDQoN
ClRoZSBwYW5lbCBleHBvc2VzIHRoZSBmb2xsb3dpbmcgZml4ZWQgbW9kZXM6DQogICIzMjAweDE4
MDAiOiA2MCAzNzMyNTAgMzIwMCAzMjQ4IDMyODAgMzM2MCAxODAwIDE4MDMgMTgwOCAxODUyIDB4
NDggMHhhDQogICIzMjAweDE4MDAiOiA0OCAyOTg2MDAgMzIwMCAzMjQ4IDMyODAgMzM2MCAxODAw
IDE4MDMgMTgwOCAxODUyIDB4NDAgMHhhDQoNCkJvdGggbW9kZXMgc2hhcmUgaWRlbnRpY2FsIGJs
YW5raW5nIHRpbWluZ3MgKDMyMDAgMzI0OCAzMjgwIDMzNjAgMTgwMCAxODAzDQoxODA4IDE4NTIp
LiBUaGlzIGlzIGEgc3RhbmRhcmQgaGlnaC9sb3cgcmVmcmVzaCBEUlJTIHBhaXIgcmF0aGVyIHRo
YW4gYW4NCmFsdGVybmF0ZSBDVEEgbW9kZSB3aXRoIGRpZmZlcmVudCBibGFua2luZy4gQ29uc2Vx
dWVudGx5LCBpc19hbHRfZHJyc19tb2RlKCkNCmlzIGEgbm8tb3AgaGVyZSwgYW5kIDM3MzI1MCBr
SHogaXMgc2VsZWN0ZWQgaW4gYm90aCB0cmVlcy4NCg0KVGhlIHN1YnRlc3QgY29tcGxldGVkIHdp
dGggcmV0dXJuIGNvZGUgMDsgdGhlIERNRVNHLVdBUk4gd2FzIHRyaWdnZXJlZCBieSBhbg0KaXNv
bGF0ZWQgYXRvbWljIHVwZGF0ZSB0aW1pbmcgZ2xpdGNoIHVucmVsYXRlZCB0byBwYW5lbCBtb2Rl
IHNlbGVjdGlvbi4NCg0KVGhhbmtzLA0KRnJlZA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPg0KPiBT
ZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMTUsIDIwMjYgNDo1NCBQTQ0KPiBUbzogR2FvLCBGcmVk
IDxmcmVkLmdhb0BpbnRlbC5jb20+OyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0K
PiBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogV2FuZywgQ2hlbmNo
ZW4gPGNoZW5jaGVuLndhbmdAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSRTog4pyXIGk5MTUuQ0ku
QkFUOiBmYWlsdXJlIGZvciBkcm0vaTkxNS9wYW5lbDogT25seSBjb25zaWRlciBzZWFtbGVzcw0K
PiBEUlJTIG1vZGVzIGFzIHRoZSBoaWdoZXN0IG1vZGUNCj4gDQo+IE9uIFR1ZSwgMTUgU2VwIDIw
MjYsICJHYW8sIEZyZWQiIDxmcmVkLmdhb0BpbnRlbC5jb20+IHdyb3RlOg0KPiA+IEhpIEk5MTUg
Q0kgaW5mcmEgdGVhbSwNCj4gPiAgICBUaGUgYmVsb3cgMiBpc3N1ZXMgYXJlIG5vdCByZWxhdGVk
IHRvIG15IGRpc3BsYXkgcGF0Y2gsIHBscyBkb3VibGUNCj4gPiBjaGVjaw0KPiANCj4gUGxlYXNl
IHVzZSBwbGFpbiB0ZXh0IGFuZCBwcm9wZXIgcXVvdGluZyB3aGVuIGludGVyYWN0aW5nIG9uIHRo
ZSBwdWJsaWMgbWFpbGluZw0KPiBsaXN0Lg0KPiANCj4gQlIsDQo+IEphbmkuDQo+IA0KPiANCj4g
LS0NCj4gSmFuaSBOaWt1bGEsIEludGVsDQo=
