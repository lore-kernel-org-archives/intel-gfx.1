Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50041C79F9E
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 01:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E8F10E039;
	Tue,  8 Sep 2026 01:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jw2JkLxV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E9210E039
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 01:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788831316; x=1820367316;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=9Fh16EIHvbyewkqBtQnlEieYa/+g9thB8Zat/Y0//kw=;
 b=jw2JkLxV15WSlGAw4emFRwb0z0fc54j0Fw6ydla5LS5xB+yq0kuGIo3u
 U+gyJ9C7VIlgrtXkk+fViqZGJotqOqftRyOUVqgjXvWR8hGSdJvSW2ziv
 +zOZI8yQyBChugqRiroSl6rxuHJGR5SG6ChXHRXUJGq3LssPiya+YBTvY
 r52+6a3uNXCh/VRt1evLxMm7c/86kUgIIc/dNNL0IXUD9Y4epRh9yOSQm
 xNhABgJkfTKaNRSvOW3Z5iRXr/0jsyKUcA1QMVQPSJEV5eIAu9SF46C0T
 EK1LG2atpIU/UAe4MyprTGQAdxzEVWxHZTZI0SHo5Eo3bNc70hAbaymGA A==;
X-CSE-ConnectionGUID: QVj04gqBSpCvSMAZXP22kA==
X-CSE-MsgGUID: fjVNKK0iRE6DirQMTEkphw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100581674"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
 d="scan'208,217";a="100581674"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 18:35:16 -0700
X-CSE-ConnectionGUID: 1crpICqgSsSHWVj/qvkFXQ==
X-CSE-MsgGUID: YFzxQOBETTCiOXLGolY9ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
 d="scan'208,217";a="267161206"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 18:35:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 18:35:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 18:35:15 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 18:35:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSvbqwplxv/IZHMoZnTGVdlqe6yOdCGSw+5MZBSfNw4yidR6qhpIjGcfNwJZsn53fx32oxqzIdc5t3ebM4HqWKgE+/FSAbOmuGLuz0Witu16FDR64kkXhnPtQXFu3NuqUcJSvpmqUiFmJyunokO3A6Dq7/FXhSDlKMUj8eEZi9wq+wRf/kdSUqOAi1ifFDUjDPNl/HHK6TtY5zpK/4HoHJDLtESwRDBO4DhHi8ACNgvhB76aE3wgdHRdZcYEpO7rzbAlae2V3TANvf9hr3xCAkqOWjY33ETaqZZaNfjD6W9RDnZnfskeRXTjxJf0p3uQznxAzmzt1czsiGqlhHVz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Fh16EIHvbyewkqBtQnlEieYa/+g9thB8Zat/Y0//kw=;
 b=sVeJGOdZDDKTzFXwYv4hhsb0dLvthnYcEeHt45oEBw9ip7u82sdruh1BupQQzAFlmg2HXTI7e8y1lyjxuMYwph3For9YZMkFfvP4Vfvum8jsxfxX8ZvEW1bHe6i4ENDPnnAtNEahAj+qmOTpf0JzLo05vAM5wGZfQBp73tuuY8TeXhuxAPXzzh70udxEB6PAOEh0GEsO7RWsVjC8IwN5JyryMDroN3MRyBq4oLY9mh+l59X0UCkOl939B+OzZ0hNNdWmNqDuCAIAANtoenyubzrS3WmmKlIoXtPA2GhZncZk8O2pkefBmGmqtEEb3hhUnRgommLf41N9o0PoUH550Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5416.namprd11.prod.outlook.com (2603:10b6:208:319::22)
 by MW4PR11MB6572.namprd11.prod.outlook.com (2603:10b6:303:1ee::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Tue, 8 Sep
 2026 01:35:10 +0000
Received: from BL1PR11MB5416.namprd11.prod.outlook.com
 ([fe80::3914:6d1b:c522:a887]) by BL1PR11MB5416.namprd11.prod.outlook.com
 ([fe80::3914:6d1b:c522:a887%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 01:35:10 +0000
From: "Xie, Xiaolu" <xiaolu.xie@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 1/2] drm/dp/mst: recognize DP-to-HDMI PCON as virtual
 DPCD in DP-to-DP topology
Thread-Topic: [PATCH v5 1/2] drm/dp/mst: recognize DP-to-HDMI PCON as virtual
 DPCD in DP-to-DP topology
Thread-Index: AQHdPoM6h3J3Wp8/cESlQjUTzSLUK7bDWOLEgACLSb0=
Date: Tue, 8 Sep 2026 01:35:09 +0000
Message-ID: <BL1PR11MB54169AC889788091A760579F93B12@BL1PR11MB5416.namprd11.prod.outlook.com>
References: <20260907043922.1367673-1-xiaolu.xie@intel.com>
 <314b0dc2c8ddebfd995c83d0a04c715e.xiaolu.xie@intel.com>
 <3e77ec748184f3656146694db1cd6c07cfd4f07b@intel.com>
In-Reply-To: <3e77ec748184f3656146694db1cd6c07cfd4f07b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5416:EE_|MW4PR11MB6572:EE_
x-ms-office365-filtering-correlation-id: 8f97fe8f-3ef3-4026-dd26-08df0d496ba9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|8096899003|18002099003|22082099003|4143699003|11063799006|13003099007|38070700021;
x-microsoft-antispam-message-info: M0rvg7N4mI6+MIbxoJgmC6StO9U/U8FzwYVUkCaS0jZPIDPvjFkuwnwIFVcs8QIkKt70EvZVPHkv/eHROeJZV8B/xSkCVQpdiHmds9dsa24R7zE1UosptxHmgiHg0kpQVGBG7E0h55Uj27aRVvcVlT0eH4k63Yq4PxslQkYVDY+te6NjXnJqHLK7yR5h63OwLpu1hTeT9QHaJvrzNq/04RGKHxyvHGJHoHlwehV7u0r1qVZpwZVFbyS2BNG4RkO/3qwNQYqG5OILYsLv9jKwVRan8Do0AcnQZHnK07R4xWxyIt8Rn3GPq1rEr8A9cNosBjTphE71okntFlKOJQDlJgU8nMoOWXppRVKbGyUE5mVXLeMv67BZHNMIbbiMqyt7F6PCcaILVdj40cJx2tWFOzazqW6+O2J8q7NkYalWPE5uxPViHsVTyQWaVtwvm8agy/iUXU/JxQTz3f3xwvLOfL+ZECjka66yvVDHJ4XL8Rwr9NmHPMiBDhJRaT64eXVYpKHh1o3cUaz1lqBJsDqsaocpd3L/WC3I0x7r+Rfn94h76STaLPY//GowWIOCDm825XDo1rV2za1D+tI90GabGtrct2qNY7SjN7CJWE09mDU/OYKpbJn2Kpqp3EUoGZFtDGGfiwakCbgDm/Nqe59miDIXZ0J453JQaKHtlBDORqY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:ja; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5416.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(8096899003)(18002099003)(22082099003)(4143699003)(11063799006)(13003099007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?OUJ5ZHNHdHFJUnY3WDRiS09PUXdhTEhVak5CbTRoWklzY1lWM0NlbzE5?=
 =?iso-2022-jp?B?NTRvcFFCaitWbUQwVi9yOXpLNjN5SHpaRDBCM3F0bzQ2RDRaMVlraFF2?=
 =?iso-2022-jp?B?MDFXdTNrL0FVclhIOXphdFIvOGlMQ05VM2FRWG9iekxSemFNSEtRNjh5?=
 =?iso-2022-jp?B?RmlLUEVReTZDdHBwdkNvQjVkZ0VXUFN1L2hyY0VRV1ZrbmFTWnRiTllN?=
 =?iso-2022-jp?B?dXBRemZLbnZDQ01tWXBnc24wTXFxZTJkbFVPWERuY0RmL2FXa3EvRGxl?=
 =?iso-2022-jp?B?OHJTcVg2Q1NCbFVzMVFESlRQUWh0UGpPUlVZaGt2aEpTVzlBUXFJNm5x?=
 =?iso-2022-jp?B?dGtwdlBzYnBvY1dudUlqd05LSGRrRGZTVTlPYzhxd0hudFVPNG9aVmlQ?=
 =?iso-2022-jp?B?K25vZ3ZvZ0JrSUFHU0pWblBobGRrMkFlYnlMSEQ3TndJemtFODFXdTdP?=
 =?iso-2022-jp?B?b1Z5b0FKTEgyODRQZUNzWDBmSC9mMUZwc1lRT2g1a0FoNmIxQURrZG1i?=
 =?iso-2022-jp?B?akhpWjNOY3h5Tll0eVZaQ3B6NEcraTZyZUlWMDhYcU4velNEN0ZHUjhE?=
 =?iso-2022-jp?B?MzRQZVNIUDBTN1BlbnBVTWNXRzFLdjdRNXExM2l2MHhRQkhpNERvTXVB?=
 =?iso-2022-jp?B?N21ZL0pKSC9ZbC9jMVBubEl1enJJbmxmTk1NY3FFekFXRVBtTEo5TE8y?=
 =?iso-2022-jp?B?TUwySm5hNk5IQWY3R2RjS1NGYnJndXV1eFFRS0N0RE5odC85Ny82aWhH?=
 =?iso-2022-jp?B?RXdRNXMvMndXWjJOUzU3NlFTR3J6MzBsUGhXQlMzMFkxcStNWkhvYzdl?=
 =?iso-2022-jp?B?S3o4aUg0TXJiVUxTVGRDeVlldHdtVnZkQTF6S0xJQWF1UmdoQTFJdVdY?=
 =?iso-2022-jp?B?T0I5SHlSaWpYbTVZL3Y3cDhISjhBRmM5TWtvcjlYb0VNdTNQcFV1U0s3?=
 =?iso-2022-jp?B?eXg5NHBoVW05YmxmRHlHdy9DRGxoRXB6WVVROHlNeHlYZ2hZQVA1S09C?=
 =?iso-2022-jp?B?WklrZmVYR1pUdHYxUmhwRnJwMXlzeTE0K1N0Wm1WYXcyQkc5ZjBUVkNq?=
 =?iso-2022-jp?B?NVh5WlFMNzN1VlgxM1YrUUp0UjlxaStvbjcvVi9ZYVRZd2wwaEVWN1d0?=
 =?iso-2022-jp?B?WUFwRlpmTXZYWENyemU4ZDNWVVdreS9nazFJSUZBczZWR3NMTG9BS0dw?=
 =?iso-2022-jp?B?TEJneURkUHVzY2VhZUlDaEo4bStCTWY1SjhQS0dPa3FCZEpzbGhENkpq?=
 =?iso-2022-jp?B?dDd5cFIxOE12OXFIQWQvSzlVckVUMlhJd2JKSnpWaEZ6eTVLM1hocXpp?=
 =?iso-2022-jp?B?WDhWc0laODFpZzFCa2EzdFR4VzlBZmNWTVNtVmg2bDJFRFE5eTc3T0Zl?=
 =?iso-2022-jp?B?emlKSDF2aDVPMXFBK2c1c1htZFFsOFMxZ3pzYTVFVEdQRjQwb3NiVXU3?=
 =?iso-2022-jp?B?Q2t1WUUyR2VEMCtqc0hkYlVMVkdyMDQ5QTJFQkRSUTh3K1NJRndwSTZN?=
 =?iso-2022-jp?B?K3hZU3JWV3dDUmxRYm11em9kOStPV2NtQ1dmZDNTUUtHRHlhQTIzOCtQ?=
 =?iso-2022-jp?B?MGdINEQzYkNMOHBwclp0QXJTL3plZEU1aXBjLzd5bWlreXVTV0hYQlhw?=
 =?iso-2022-jp?B?VjJJdmFYeFZjbmRCa05TdEJlRmZ2dHBRSUNRK0VQTmFUNis2TkpWSytt?=
 =?iso-2022-jp?B?aEtJb05MVW1qWnh5UG9WTDN0RjRSN3FsZm1sUCtUZXpmVElTN0hqY1Q0?=
 =?iso-2022-jp?B?MUNPR3BVT09HL2ErbmE1R3U0OFJXTUdwNWo3QmNzV2V0M0x2SHlFeVZt?=
 =?iso-2022-jp?B?emY1dERmdHhBekpvTFZ3OWF3QytnQmRWWmw0WWVpSmF1MVl6NU5YdXQx?=
 =?iso-2022-jp?B?dytMZmFMWmx0djRrZnhEMWtxelgwUGpZMCtvTlNrZ3c4YlVhYm5kWjJh?=
 =?iso-2022-jp?B?eldtTU5kTGxXZUN6bXdyeFdLb2JiQWQ3aHdtdHlyUkE4aThqcVpobGRQ?=
 =?iso-2022-jp?B?YlltK0VyWU9MSUdqR01Kano1OG9JTnlqYlJIalh6QW82Y0sxSDZ3cEZN?=
 =?iso-2022-jp?B?QjI1dzd5NVovTUVSaW5Ic3hQMTlnVEtoSTErZExnM0NvZUxBZjVQQnR5?=
 =?iso-2022-jp?B?aC9MdGVCZDBtRTdhMUxXVFNzZTQwWkJXbndWRGk4cU40Q1ZWTHNlR1lG?=
 =?iso-2022-jp?B?QzdkR1k5aGpSS2ZJL0sxdm9JeTZLTUp1ZE0zMTBZRFJCWjhVUXA2L28v?=
 =?iso-2022-jp?B?UTZ0elpVRkgvSnZYNXFjdDNzWHJvSHlaZjIrVjZPYUxKSG5qNXkrSTNW?=
 =?iso-2022-jp?B?dGZFSGhHd21rdXlEUDJPME1YRzZXVm9EaWxZMmZXa3pxYzZJOEMwVlZR?=
 =?iso-2022-jp?B?TjVwY1lxQlc2RWhHODZQenZDRmpuSW40MWJlbWdHN1Awak5SQnJUOVRT?=
 =?iso-2022-jp?B?eFd6N1hNdStTNjF3K0c2SjY0aG5wL3A3TDVpNVJRZUFSVENiMVloV1BK?=
 =?iso-2022-jp?B?V3BuZ0FP?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR11MB54169AC889788091A760579F93B12BL1PR11MB5416namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bec5i544mpGbeJi617aPJy1b7qgNOOfT8kKWi+xZjlkNv8NFlZ9dUiYEFFq3y+i3ok13Sqwybtw2dNG4yJHGVAKm0R2iztlKR8pq8zVaEdP19EUqjE6Ii5winmHQz4Ukbe+fNAmrVQWhHBYtWaQ+uD1ySI6cJGcVALYuPn7uO/nMo2orKf86+gdLItk6pb906Sr/blLwKZGSFfvWBawuo9/0QP/O0VncyUxVPjhSW7SYLFRYe2JsoBq8aNkucf0c0aN0uIJHK7fI5bfnwpz/HMrIuzwCPqN9D1GPANV70Zar4dVU3lfHYf+7iktwFvyq+zCSpvQsqlM2CR6SI8fPiA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5416.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f97fe8f-3ef3-4026-dd26-08df0d496ba9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 01:35:09.8946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cz3iR36aZ73/4h+zhDFPeH54gWRFrQYoGmDFspbLQEWSP5/VI3Jbli1zWf4QqwlkBsJiS57gbe0UEceGF6GaZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6572
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

--_000_BL1PR11MB54169AC889788091A760579F93B12BL1PR11MB5416namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Jani,

Sorry for the confusion.
Due to a git send-email mistake on my side, an incomplete v5 was sent witho=
ut the proper In-Reply-To threading (series 173470). Please ignore that one=
.

The correct thread is series 173452 =1B$B!"=1B(B
https://patchwork.freedesktop.org/series/173452/

I'll slow down.

Best regards
________________________________
From: Jani Nikula <jani.nikula@linux.intel.com>
Sent: Tuesday, September 8, 2026 1:04 AM
To: Xie, Xiaolu <xiaolu.xie@intel.com>; intel-gfx@lists.freedesktop.org <in=
tel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 1/2] drm/dp/mst: recognize DP-to-HDMI PCON as virtua=
l DPCD in DP-to-DP topology

On Mon, 07 Sep 2026, Xiao Lu <xiaolu.xie@intel.com> wrote:
> Superseded by v5 series:
> <20260907044410.1368008-1-xiaolu.xie@intel.com>

Wait what.

That thread has versions 4 and 5, and this thread has version 5, and all
of them have been sent today.

Please slow down. These are involved patches, and nobody's had the time
to look into them properly.


BR,
Jani.


--
Jani Nikula, Intel

--_000_BL1PR11MB54169AC889788091A760579F93B12BL1PR11MB5416namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
Hi Jani,</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Times New Roman&q=
uot;, Times, serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Times New Roman&q=
uot;, Times, serif; font-size: 12pt; color: rgb(0, 0, 0);">
Sorry for the confusion.</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Times New Roman&q=
uot;, Times, serif; font-size: 12pt; color: rgb(0, 0, 0);">
<code style=3D"font-family: &quot;Times New Roman&quot;, Times, serif;">Due=
 to a git send-email mistake on my side, an incomplete v5 was sent without =
the proper In-Reply-To threading (series 173470). Please ignore that one.</=
code></div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Times New Roman&q=
uot;, Times, serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Times New Roman&q=
uot;, Times, serif; font-size: 12pt; color: rgb(0, 0, 0);">
The correct thread is series 173452 =1B$B!"=1B(B&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Times New Roman&q=
uot;, Times, serif; font-size: 12pt; color: rgb(0, 0, 0);">
<a href=3D"https://patchwork.freedesktop.org/series/173452/">https://patchw=
ork.freedesktop.org/series/173452/</a></div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Times New Roman&q=
uot;, Times, serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Times New Roman&q=
uot;, Times, serif; font-size: 12pt; color: rgb(0, 0, 0);">
I'll slow down.</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Times New Roman&q=
uot;, Times, serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Times New Roman&q=
uot;, Times, serif; font-size: 12pt; color: rgb(0, 0, 0);">
Best regards</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> Jani Nikula &lt;jani.nikula@linux.intel.com&gt;<br>
<b>Sent:</b> Tuesday, September 8, 2026 1:04 AM<br>
<b>To:</b> Xie, Xiaolu &lt;xiaolu.xie@intel.com&gt;; intel-gfx@lists.freede=
sktop.org &lt;intel-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH v5 1/2] drm/dp/mst: recognize DP-to-HDMI PCON as=
 virtual DPCD in DP-to-DP topology</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Mon, 07 Sep 2026, Xiao Lu &lt;xiaolu.xie=
@intel.com&gt; wrote:<br>
&gt; Superseded by v5 series:<br>
&gt; &lt;20260907044410.1368008-1-xiaolu.xie@intel.com&gt;<br>
<br>
Wait what.<br>
<br>
That thread has versions 4 and 5, and this thread has version 5, and all<br=
>
of them have been sent today.<br>
<br>
Please slow down. These are involved patches, and nobody's had the time<br>
to look into them properly.<br>
<br>
<br>
BR,<br>
Jani.<br>
<br>
<br>
--<br>
Jani Nikula, Intel</div>
</body>
</html>

--_000_BL1PR11MB54169AC889788091A760579F93B12BL1PR11MB5416namp_--
