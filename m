Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CF5C79F99
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 03:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEF410E945;
	Tue,  8 Sep 2026 03:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dF/H5jVK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611ED10E945
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 03:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788837622; x=1820373622;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HRfFZMOxz0Yge90SegcTRTQs5GECV5d47/7khCUT2Y0=;
 b=dF/H5jVKY/SIc1IcKF9fKfvUEjO4LC35hmT5Qnj5jm3JggqMEcQKVQqF
 M2TDc+b9PbaWgaZU6xvQhaN4UAM+JwVaFCe5kRzXWAs+RE6/+KnNqwJrt
 OlAVAEyKD5Pcufw62PETAN0emzEyBx+g3N5iAmdY0RMu5FuxZYCiW8vnF
 xR1DLRf0JlxVmcL1luhe/ItqfSjCbrTVL77hjrCUktRzBai0uU6BnErgo
 LDX0gGiGYe+ObTV0la8j9uPP9u4PLSa/5E51W9/stIn+8eibNUwE9UuYu
 Env6Qv6YuQjAWXJ1fqi3lwGIwtGDxaKi9MD+5lfECIRmO2gfM8zIbboiQ Q==;
X-CSE-ConnectionGUID: ytp7Y4YYQy2hs4fb5ohafA==
X-CSE-MsgGUID: q+2cCDRBTu+qtK4JT50giA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99890565"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="99890565"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 20:20:22 -0700
X-CSE-ConnectionGUID: 2oYrjugpQyOLBSO6W4xdSQ==
X-CSE-MsgGUID: 8d8i2VWCTJOr+VmIfeojDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="266519004"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 20:20:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 20:20:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 20:20:21 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 20:20:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6pnzNArDwuIE+hfl/Cc8u4Za8krvIcxjhfBeHHrHKMjLqbe/lr7XE7F9mGtIvEzFVCHJQpv4XapAQvVDb7ckruFIzKf1crdDQDQ8VaexWWxXGFpVIAfIk2OTEBRknWNldWihPEhcm0gCK994tek2o8suG9rfY1jm9v3k/MLkO/eaStIPbGtIJ4Mwx4rTPB7583kUIERWkcEJgDyxsqCxLf/NOMGcubtGSR1bWBmTwQiiXcOeJDCAe6KUh9P2eGKGtnjCLtmUhm2KqTLj/J/r1R3A0eIDfrq4FfTbeNqfXruJ4cc0m1lwDbQYOAmormZxaoSdTyto+lf9WlQMVCBuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRfFZMOxz0Yge90SegcTRTQs5GECV5d47/7khCUT2Y0=;
 b=mx5XUSqBhw7iF1/SEgXjrAslm41VGAQSt0wS8iTSOQn8pWiSV1NJYCscYPAPsUMzSv+OzK9QAZ+oAQ46M1LNUKbae1S6kLYZRmSNhAMJs+Hiv3SVy0O0Cgp3G45VSAwSkBXY2zh5K1Fc2KT5uI6jUrpz6tZ/oYaVuNoWJXToutUnHDTc8SzhwpWWf8BxUa7NCsHCcH/XjWOeLT76HH0EzixgelPngog4YcCBUy1q8BoKph7RNQtJRYyV65GzNszNG+GJ8qXc6bDtS+cGA5bzdGybUktR1VVeu5ZQJUCkv/SsAqDL7wtQIY4t149qHepWVxGpTg04W5/mgLUEm3Iv9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 by DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 03:20:13 +0000
Received: from CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::c319:6d18:282a:cac8]) by CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::c319:6d18:282a:cac8%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 03:20:13 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Metrical revel <metricalrevel@gmail.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Topic: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Index: AQHdPwrzVbHi53i16k69Rr9uSqIjkLbEA1bA
Date: Tue, 8 Sep 2026 03:20:12 +0000
Message-ID: <CH3PR11MB7300D5961C982BA2B040675FBAB12@CH3PR11MB7300.namprd11.prod.outlook.com>
References: <CAAxXSL-D=cJ8ne9Lc=W=746TZgyXVVYqWm=kP=CWj8D+M6JjRA@mail.gmail.com>
In-Reply-To: <CAAxXSL-D=cJ8ne9Lc=W=746TZgyXVVYqWm=kP=CWj8D+M6JjRA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7300:EE_|DM4PR11MB6335:EE_
x-ms-office365-filtering-correlation-id: 80d55051-e059-4277-1235-08df0d58188a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: d0Ib5P0dvKuXpcPDfwseqppj2RC4An0uM5PqJ9PAkXdfOSscKQ1FAVrZVhFT4nRRIjQVuCCBwUMat2sY3w7N1AXza6YjJkiwDyY4ibKX3AUX5ipTc5PwdqimjqLnj0ECMVz2YqhD1UBqCwa2EP4ZW/CvBn9kFAZhwXJxuEcuJMOotw82ah5N+6z+99tgHE11Tw6zyDBZEgyz/zJztTmaIlEw92fCCdICCZ8Vy7EV6o2AWuIDiMGZ6fmmcwKhRrax9zG+FdDaPz9GAtKsoWxtivESMUEKSuMI/oI8Xb7lxGiTADwDgyGo5O7Q/3QvraEF7HaeU9FSKkrO9jttKL0Hm6Do3ZPHgj/d3C3df7Fl3OHZykGKqGXm4yRnQ103Lzj9UBARxRH4eOArXO0eJGZ4SDTKvxEeDt64I1CIhCFyiRrs+NWK2q55dF6ewb2u+trsAMGJTJlaq8BLmmyzGjTlYARhpZp8TALeS2iQ7NtxJV8eF8umDzE8mTCGK+KNBWzNCVSebxc4D3+cfQUSCMiR4x4fMCbh52DzKAmpkCq01Isk3d1tYqzjup+148J9m5LLD0W3mek9jOuqx4qOMom/ZVN+wXn7x3+xB06d6buZUsNrd//NohIAqMNZUS3RiB2A+OVZ+9LvwPUCB4rtJcZb3D68iMTXMsKKeFERW3kR9NZQNH5ybOEV3XPusi32kLS3md5FfJYNbhRx1okveZWAwRxygP0eH1tANb5w5jEo+Ws=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7300.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVZwb2dpa3VDTms4cVROY1I5STZYTXF0eUFzbWltTC9UNksxSUdVSzY1T3h2?=
 =?utf-8?B?cjlhblBWa0ZmeUs5clAxN0hqeVpwcURwanZDQWJFTUhkMzhGTHVrdmRZb3l1?=
 =?utf-8?B?bGk3eXNVMHNGK1ZkRXdFSmZZRnJSVngvSWZaVWYra25IcEFjRVIrTkpuakhQ?=
 =?utf-8?B?WDdPbGhXOGw1STU0bnVqYTUzZDBvMmhlNjRUcEM4UWlyNkFSczZFb1pLS2V5?=
 =?utf-8?B?U0FWc0FJcGtMdjV1aitBZ0ovRklKT09Iamxxb1JBam96SzFVY3U0NHBlQk4x?=
 =?utf-8?B?MzczbWhNTG8rVjhYTGI5aDBWNXAvRmltVDcrbm1nN28yQS9abXVIMitlN3Zq?=
 =?utf-8?B?OUhDOEdpM0J1a0lVckxEVnJPdVdBVXlnRmVpZ1oybVl3RkVTQ0xqRHJkRkdB?=
 =?utf-8?B?ei9XSTJ6bkRPaEJrWW1tSXhtemx0MUt2ZHZ6emJDVEFwWTBwVkRNaStDZzNG?=
 =?utf-8?B?RlFQMmwvZ2JDNGFpV0N0QUZVWkkzRlhjMXZWWDIrV2tpaDNQWHg1TUN3V2ND?=
 =?utf-8?B?eWxic0JDTGxpbHRWRVUwWnpSdm1nQ2o4M3RrMDNOYTRCdEFoQW5RT3djM0kv?=
 =?utf-8?B?ekRDNDJoQis2c2ZWMTNybGRUaWhjN0N2T3A3bWJ3VXltejJaNW1RVytqckww?=
 =?utf-8?B?c2w1Rk1rZmNkb0JKd1M4dXlzZUJwbjRzUVM2VFFaVWlPbjlpSmF3WkVMSENy?=
 =?utf-8?B?c2c4bzNVeEhuQW9wc3hTRk1jNEc5Rm1uR1hNcEZ6OVZNR3JHWHU4OTNPSUgv?=
 =?utf-8?B?dFp5RnFmcE1pSUo5dXBEMGxtdW41Q1VNakRQVWtHNk1lakRrNDVLTy82THh6?=
 =?utf-8?B?dVdEL2V1b1FaaVdaSGRKSk9aa0VzcEsrTGVwTERhSmtCc1ZoemdkelBCZ0pT?=
 =?utf-8?B?R1ZyMlVFKzNETUVmclo5OGpGdzQwanBzT2Iva2FQdlpYRnBpU0t2dkJHNzJW?=
 =?utf-8?B?TG9KZUd4SUVLMHZ5TXJMa0dNRUVKNWJNTlRjaXphZU02dlFSdjR1ZkxTMU9i?=
 =?utf-8?B?eWxTR3FEZVNrVlZab0JEMFg2K3E5WkNIMG5TWUFtMkRabWxtVU56VzZqVDlt?=
 =?utf-8?B?T1RoaHViazdNU01BZkluODlPUGRQemZmVjQ1ZGpLMUNjMDE2SHQ5OUx1cm1Z?=
 =?utf-8?B?S0FMUkRjcDQ1alBBb2tNVU5YY0ZuNEkrVVdJOUUvaFJoaCs2eGpUU000TStL?=
 =?utf-8?B?ekpTeWNoRndLUTFNQ1dxRHlKRXlaZWdPODVpVmVpTlQyWXBNbG01cEM2alpE?=
 =?utf-8?B?WnJ2VDQ0Wi9VMk1GU0lORmE3MHQwMGFhekZwQ2FFZ3F0OHdnK2kwT3Z3U3JG?=
 =?utf-8?B?dXIyRWxMY0lhRDcyZVJkWk5kMW1TWHlxS0NEVlNGM0dKamU0WFBMc2ozWjVl?=
 =?utf-8?B?VWgxbDBpS0o0RU5IL290WElobkM1RWl4b3R2OVhVY3llWG1RYXZaTTZmYXkw?=
 =?utf-8?B?bWV3dG14OVBSSHJuVzd3bkRZRUsxWDl1cmtvRm5NOUswVU8rMHkydm9QSFV0?=
 =?utf-8?B?ditvRjlRajlLRW5QVFBma09MVHh2Y3NvN1Bqd21hR0JQRk12TW83MXp2N1JF?=
 =?utf-8?B?eTNpeWRXTlRHSElMc1Vqa3p6ajR6MjIxODMwRTEvRG5NTEJPNkdmdEIybFVi?=
 =?utf-8?B?WGJCM25oVmFZSkNUSm5ZamhlNlZrVjB0eXltVXFCRktYbFd1WXNwT09QdlVP?=
 =?utf-8?B?T0Uzc3hQWWN5Z0xicTBBWUtJUDhFcVkwbXNHdkhIYldPNUdtMi9Xa1IvajFz?=
 =?utf-8?B?MzlicHI1MmRPUXFuRFk3Y2E1TncwUE9iWENMMDJBcVVQQ2ZWOWhBK3NJK3Ez?=
 =?utf-8?B?VlZkQzRKbEJsSkFMakFSc0M3KzhRejR2OGpZWkFnOG1haVhkaEV6N2VaTXVI?=
 =?utf-8?B?SmNnZWsrWEVJK2ZDZTg1UFBQTUQ3YzZtL2hTNC9XRXV4VHJUY1M2akFUb0dI?=
 =?utf-8?B?bDdGUFpWK2t6SXRWempxYnFYN0dReFpudG1qZGtzMld4SjJGZkxCRVBuRHBu?=
 =?utf-8?B?QjhVempVdlRtSWxNbk9BeEFld0lBTko4ajhZamJ1d0ltNUoyUlcwT2dLZVBS?=
 =?utf-8?B?NmtUU0dDZlBDejErK1F0ZEJGSEFOVUtPYlA2SmJvRFRLbmZBSmxIM09xQ2tn?=
 =?utf-8?B?cFhUZXB4ZVdxbC9wTVdoN3h3YSt1Mk9LMllSSjdpNUVtekxCVnB6S2FmTzRO?=
 =?utf-8?B?TWlnWHQ1NmVrOGJybmRsWC9xc3FRb0luazBUbUJGKy9sUkZZdVozSnpHODdp?=
 =?utf-8?B?ZW5PM0hKRUx4bUpObHdBTjFBL0FlWkRmR1krZmc0Y3FreTZGQkhwSW5JRGJx?=
 =?utf-8?B?OGJWK1ROem9HTlBUMG9FQTI1OG5VNHk2dWdmYXo1Yjg1RnE2czljUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QeaVzbj+N6bUXPKYMZQw2SizuR+/GiXM6On5UOWJBlRIpPcBGDudbmQbPv5hnVVV+DyeQOQkelBzLdriqc66DR31eRLFyepYP8tQr4Lmjr3lTlQBesGje40olEmayyVAQ4HEXfsMm5QHv7Hc/q7TbW0AxNmtYkT2XB3Pj0NZSkCM6gtQ5PdE0Tq7BLLvMOx02R83WhiQ2taiuBpv06jYFWoS4neI5pLX6YiKxxuA5PF9hVRvCtQ51O4Gz2kKywBfU+oc8y5msI3LtXZz8fndEq4xuqGX0yHahLh6cEFHG6LxbvKhDiw2eREUMFtB8ZIG6UhTQJdmdps2u2Fsdf9iNw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7300.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d55051-e059-4277-1235-08df0d58188a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 03:20:12.9658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZaUCQV9/t1DpNLlwGL57zf+tkkXwOYOCoK1Pp8R67uhds76SN6R8oqhkE9U2pfqVCRSpRmMCN0Szu53xfeAdlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6335
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

TWF0aGlhcywNClRoZXJlIHNlZW1zIHRvIGEgYnVnIGluIHRoZSBwb2xsIHdpdGggdGhlIHJlcGxh
Y2VtZW50IG9mIHJlYWRiIHdpdGggcmVhZF9ieXRlIHJlbGF0ZWQgdG8gdGltZW91dC4gSSB3aWxs
IGhhdmUgdG8gZml4IHRoYXQgYW5kIGFsc28gcmVjZWl2ZWQgZmV3IGNvbW1lbnRzIGFzIHdlbGwu
IExldCBtZSBmaXggdGhvc2UgYW5kIHdpbGwgcG9zdCBhIG5ldyB2ZXJzaW9uIHdoaWNoIHlvdSBj
YW4gdXNlIGZvciB0ZXN0aW5nLg0KDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpBcnVuIFIgTXVydGh5
DQotLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IE1ldHJpY2FsIHJldmVsIDxtZXRyaWNhbHJldmVsQGdtYWlsLmNvbT4NCj4gU2VudDog
VHVlc2RheSwgU2VwdGVtYmVyIDgsIDIwMjYgMjoyMyBBTQ0KPiBUbzogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIdjRdIGRybS9pOTE1L2RwOiBPbiBEUENEIGlu
aXQgd2FrZSB0aGUgRFBSeCBmb3IgZURQDQo+IA0KPiBIaSBBcnVuLA0KPiANCj4gKFJlcGx5aW5n
IGJ5IGVtYWlsIHNpbmNlIHBhdGNod29yayBkb2Vzbid0IHN1cHBvcnQgZGlyZWN0IGNvbW1lbnRz
IOKAlA0KPiBhcG9sb2dpZXMgaWYgdGhpcyBkdXBsaWNhdGVzIG15IEdpdExhYiBub3RlLikNCj4g
DQo+IE5vdGljZWQgdjUncyBpOTE1LkNJLkJBVCBpcyBwYXNzaW5nIG5vdyDigJQgZ29vZCBzaWdu
IHRoZSBidWlsZCBpc3N1ZSBpcyByZXNvbHZlZC4NCj4gDQo+IEJlZm9yZSBJIGNvbXBpbGUgYW5k
IHRlc3QgdjUgb24gbXkgaGFyZHdhcmUgZm9yIGEgVGVzdGVkLWJ5LCBJIHdhbnRlZCB0byBmbGFn
DQo+IHNvbWV0aGluZyBmcm9tIGk5MTUuQ0kuRnVsbCB0aGF0IGxvb2tzIGEgYml0IG1vcmUgc3Bl
Y2lmaWMgdGhhbiB0aGUgdXN1YWwgbm9pc2UNCj4gd2Ugc2F3IG9uIHYxL3YzOg0KPiANCj4gaWd0
QGttc19jdXJzb3JfY3JjQGN1cnNvci1yYXBpZC1tb3ZlbWVudC0xMjh4MTI4QHBpcGUtYS1lZHAt
MToNCj4gICAgIHNoYXJkLW10bHA6IFBBU1MgLT4gQUJPUlQgKzEgb3RoZXIgdGVzdCBhYm9ydA0K
PiANCj4gaWd0QGttc19jdXJzb3JfY3JjQGN1cnNvci1yYXBpZC1tb3ZlbWVudC0xMjh4MTI4QHBp
cGUtZC1lZHAtMToNCj4gICAgIHNoYXJkLW10bHA6IFBBU1MgLT4gRE1FU0ctV0FSTg0KPiANCj4g
VW5saWtlIHRoZSBlYXJsaWVyIENJIGZsYWdzICh3aGljaCB3ZXJlIGFsbCBpbiB1bnJlbGF0ZWQg
c3Vic3lzdGVtcyBsaWtlDQo+IGdlbV9jY3Mva21zX3BsYW5lX2xvd3JlcyksIHRoZXNlIHR3byBh
cmUgYm90aCBvbiBlRFAtMSBzcGVjaWZpY2FsbHksIHNhbWUNCj4gc2hhcmQsIHNhbWUgdGVzdCBm
YW1pbHksIGJvdGggcmVncmVzc2luZyBmcm9tIFBBU1MuIElzIHRoaXMga25vd24vZXhwZWN0ZWQN
Cj4gbm9pc2Ugb24gc2hhcmQtbXRscCwgb3Igd29ydGggZGlnZ2luZyBpbnRvIGdpdmVuIGl0IHRv
dWNoZXMgdGhlIGV4YWN0IGNvbm5lY3Rvcg0KPiB0aGlzIHBhdGNoIG1vZGlmaWVzPw0KPiANCj4g
SGFwcHkgdG8gZ28gYWhlYWQgYW5kIHRlc3QgdjUgb24gbXkgaGFyZHdhcmUgZm9yIGEgVGVzdGVk
LWJ5IGVpdGhlciB3YXkg4oCUDQo+IGp1c3QgZGlkbid0IHdhbnQgdG8gZ2l2ZSBhIFRlc3RlZC1i
eSB3aXRob3V0IGZsYWdnaW5nIHRoaXMgZmlyc3QuDQo+IA0KPiBUaGFua3MsDQo+IE1hdGhpYXMN
Cg==
