Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0B0C79F89
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 11:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691A210E499;
	Mon,  7 Sep 2026 11:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7T+RUkT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A001510E499
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 11:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788779911; x=1820315911;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=zWnVL1MnGQYPEAh6VF00nk42h9kaG4GNFlAxBhrt3Co=;
 b=e7T+RUkT9hI6THG2tfASDuYafEF+D3jJH2bj156zJuam74RuQqLYRzrV
 IkCiCMiXh7hUiSs3K8L+mHtq8gTPEuN/du4nJ09FU76TnP03CvQWZzkSX
 lrj7Zg1BptYlHUaFYDNzjuz4aLF37x9flTyQq0XsjUKauyFIbQ5tfwL4H
 uiNxJ4SktjWn709e2YhB1GDEo6ak6yfoTr0Eg/vsNYxXxHLR4TYpRnTbg
 iFtHAQjor7TiLcNtCoTFP8S9ZKjJHwi7SIKx+zHXuQK0RkpaPEBFCgPA3
 DoexCRzWBE1AS3Hn6bLbyFTY361uNe1n+XtPzfkat4yXfj1EuPO7PCn/u g==;
X-CSE-ConnectionGUID: qoc6RSFSS5GBQwiGvSRRcw==
X-CSE-MsgGUID: 4+NDv6XNRRWAJMuPxcmV7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="106699067"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
 d="scan'208,217";a="106699067"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 04:18:30 -0700
X-CSE-ConnectionGUID: MdtchI67Rx6RZEVq49fy5A==
X-CSE-MsgGUID: kFALUh8GRmCf2FfU3NIU5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
 d="scan'208,217";a="274199727"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 04:18:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 04:18:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 04:18:29 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 04:18:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Took/LGSh2Q0jJCSsA9jksnSiuFGZMcGza5NmgBZmTggVGJFwEWfClLLm2CBq1Pid+7Cx470kK3XD0QnvJagLoYnJG5J7utIASx0wjVh1KFmcQLyVclZOZgo1CjRmqP+3EaMcs3JOZ0GHt4GbglEOuaqibJnPsugMOfBkV7g4ab8xVtnsPE7WAEIJIpYo1APQdVJ8fz19hzXzRhRyDOhQBbo4OktrjLDAhZUOt3X3UYSa/ynjaWapmTNa7AoZbp/7zxplh80YS1ZG9YfxF+0gnBvMx2J/RajbvPPGFFK48lqOqaqVq05v5MONq0scLwuHT3/cIvyahXu7H7eFpqglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWnVL1MnGQYPEAh6VF00nk42h9kaG4GNFlAxBhrt3Co=;
 b=WELrEYuZx03g6ZV0+iieR1YVPiUS1kfVdF74rO2AMc7pRVfDgp0bvkhzC7ZVIOxl0aOZ1xofTpX5xVEC6XPzubu83pIPddRqL3cXw3gAG+Ewl3OR4dMnps+V2v7KGZ0HYng9wJVqI0wwwFp5pqE054jwKx9Qum0kon2zNgkG35YTEqK4xiYZwk/Hs+xM3TUdOhTjBc7c3C/kMscdHiRjT+ezUZW4U6/JmR+BKZrUsjXJpByrQWTqE5vU/TUPq/gdfnEYrPYiQL1F8lq/lHFVr/JIH1tVk9XUJrj1XYtavVVyW/R8uQe6paf0eQdEZo0EC5UD94TlN2I2ka/fMaa7Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5416.namprd11.prod.outlook.com (2603:10b6:208:319::22)
 by MN2PR11MB4759.namprd11.prod.outlook.com (2603:10b6:208:26a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 11:18:26 +0000
Received: from BL1PR11MB5416.namprd11.prod.outlook.com
 ([fe80::3914:6d1b:c522:a887]) by BL1PR11MB5416.namprd11.prod.outlook.com
 ([fe80::3914:6d1b:c522:a887%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 11:18:26 +0000
From: "Xie, Xiaolu" <xiaolu.xie@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBGaS5DSS5CVUlMRDogZmFpbHVyZSBmb3IgZHJtL2k5MTUvZHA6?=
 =?utf-8?B?IGVuYWJsZSBEU0MgcGFzc3Rocm91Z2ggZm9yIEhETUkgMi4xIFBDT04gZGV2?=
 =?utf-8?Q?ices_(rev3)?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBkcm0vaTkxNS9kcDogZW5h?=
 =?utf-8?B?YmxlIERTQyBwYXNzdGhyb3VnaCBmb3IgSERNSSAyLjEgUENPTiBkZXZpY2Vz?=
 =?utf-8?Q?_(rev3)?=
Thread-Index: AQHdPdkhwMSN/0CfdkmxcOhhsuQmD7bC6HsAgAAQJA4=
Date: Mon, 7 Sep 2026 11:18:26 +0000
Message-ID: <BL1PR11MB5416F59C2EDC16EED941DD7193B22@BL1PR11MB5416.namprd11.prod.outlook.com>
References: <20260906080845.1047081-1-xiaolu.xie@intel.com>
 <178868305842.126685.7778187743510505708@61270ab9df2a>
 <9647a22adc43ca1b1636b4dc082dcf1723adf0b3@intel.com>
In-Reply-To: <9647a22adc43ca1b1636b4dc082dcf1723adf0b3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5416:EE_|MN2PR11MB4759:EE_
x-ms-office365-filtering-correlation-id: dfa2b8b5-ff5e-4f4f-26d0-08df0cd1bcc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|22082099003|18002099003|56012099006|11063799006|8096899003|4143699003|13003099007|38070700021;
x-microsoft-antispam-message-info: AclbfQ/iWTMMOm2ZT6Ni455JALXeM6oi0+d5bF+0Ze0A4z8By/gGPdEG7abvHEa/7jywNmkXRoy4mPIpDYLK7WZ6zH3TC3tUVzuZ5Zob6VBy54GTrAFdG2jjDzU+ctTMLLxRnDIhYFRvqZax9j0ckuSrpdIJPUqxIgJiB+xv6n1bOmNfPWuAhBWpweKE7HWxclDnA5oEbmnOREul87HymQoVK4KPI1tiemJK4bfEBPx9w6zAhFqY681mbKs4jkUg5HMUuy1Hmak6acM2gqy5wI3WGG0IB/TTDjjuHOM+TJPaHa8ZfnghWc0sHGf3ZQ9aRrMpFt3pat61qMx1Cm7ClPZbU0k/LpZvWU+9Z5ZyT4Au76SlBb8SR4xDvIUc/etHUTnkM31a7bUeB92RT9WvXLbUNUvFCtMv1adOgnDtZpSnmNflZQmGhOU8ovagU7xF8so05ShuAqT5bJNQQScyX1YXSUROsS+XQrRoDlwQw62BAZ9etN2QxucL0DfnphkepVfsz6KhEMvi82Cu0+mTrhtiFM6rgj0lLko36zMDlCAoOXDNQsj3SlrcAa9ut4Mvzws64PMzF2/K8Y6FdYVAmq0d3cLdf7JGALRc3FasArLbJbjykGXxWTnLXzyEibTXyTTZ0aDOkB1iGUAgt0NnWOXNyuTKXZlWGKMXcA82/8Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5416.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(8096899003)(4143699003)(13003099007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SERFU0FTNjRBdUNjeWlaOG9SOG5ObUVwcGJCNmYzV1hFOVNKbUVKaVllR091?=
 =?utf-8?B?aUlQZ0I2STJKSzZsRFRUUUJJNytHenlSQlVlY2dDeFo1Rk4xNDVwWDhuSFNH?=
 =?utf-8?B?Ym5LUGlURVp1QzBwSWdyT3hIQVZqVzRNRjk2Y2NWUjFvZHhlRjhIODRqektn?=
 =?utf-8?B?MUZDT3JtRHpHUDRtRUZKakQzTHZXYzk0SzlwZkdpUmpHWVZFK3ZaZ1MyWHhr?=
 =?utf-8?B?bDV5bjUxU1o3WDhRZStsaTIrbVZZVTdwelFDcU1TemhreVdVTGw0MWVOY0NQ?=
 =?utf-8?B?dldmVEt0VW4wb2JIcVROSDlSRUFSSHlqMEJRSExHTWZoOUVnZE0wNVRQMXlR?=
 =?utf-8?B?N0ZZcm1vRktYenBuQjg1R1YyeWtXV1FNSGlkOHhuckJhVXhvUHBhR2FLK2NU?=
 =?utf-8?B?bHNFRlZCV2t1RnNnOFhCS0Z3cUJTK0dFWXRWRXJMWlM2alZ0bGc2anAwVE81?=
 =?utf-8?B?VGk5VjhpNVBQcTFlV3VsNTh4ZmE0VStTVjJwaGxjVndwVCtMV2tUN0FTNFJE?=
 =?utf-8?B?dzdqVUFsUzk4VUs5b2xPdmo1cmJQTG1DcE40NzhVVVdJOVZDSXJQcnVhb0t5?=
 =?utf-8?B?SHlsajduRmUxT21Fb0dna2RIb1FjZDRqTUM0L21YVHNFWU5MZUhKTENRdDRQ?=
 =?utf-8?B?K0hkYjlCR01xMFFZL2liUEVNaURWb0Q5bk9wNmFYV0Z3bXU2RVo2Y1FSWXlp?=
 =?utf-8?B?MmxxZEJ5OFBqemtkYnVUTGJKK05uUnRDcTFmbmMrUW9HR2VVZkRwU1RDQitK?=
 =?utf-8?B?cnlWV1Y4WUQvalVTTzJVUnhpVVpxVkVKUXFJcWc5cnNraXk1ZitqWmhUS3hq?=
 =?utf-8?B?N3lQaFBXamZQK1dUN05Mc2Jod0E1Qjh4cmhaTkt4MFlGVXFMWmpCYy82eG15?=
 =?utf-8?B?dXlhamNvYjRac2xTMEFsNGxTUkpLZVUxbXZHVlBsK1NyRThEN3R6QWgvMzd1?=
 =?utf-8?B?ajlkTFZ6bUhFd0VkdVFkVXd1SzZaYUpCd0ttejJkWlFIcjFBSHZweWFSbiti?=
 =?utf-8?B?NVJyaGIvYmd4eU03Wjk4WHRTMG9wNFp3WTNtdkNtM3BjYWpENkFXcnNUS3g5?=
 =?utf-8?B?VTBQdDFzeEEvTERHd3diVFZzZUJzUzFhOFhqME5BbXdNVGo4U3JsUE1PM3Nn?=
 =?utf-8?B?MUd4S05jN0xUeDQwbmlWK0M0YlJzZ0syVDRXdTdnVWFaMEoyODE4Znd5ZlFw?=
 =?utf-8?B?Nnl4cU1DZGJyT3RqQS96cHRVVThnK2NOWHdnUU4wb0VHcTZHTE1EcktycTdG?=
 =?utf-8?B?MnkyU0p5Q2VrL0N3WnU1QzVwWHRvcGhYekhXb05sNStWekhzS082LzhISHVj?=
 =?utf-8?B?cVh3aDJLYXdVQldySmNSZDlhdHZ3SWtnWUMva0U2RUxKcXBHSW80eHIwMGtI?=
 =?utf-8?B?RnFWWUxrek5nQm9DQWVJdVBIRlRoSWp2MjFJZFV5NXdPRnJVWGtOUkttZGNt?=
 =?utf-8?B?N3VLVTUrbkVSRUIwVFlCMFF6bkV2a2Nkb251WUh2S2N6Q2JPQUZwaEhVYU5p?=
 =?utf-8?B?STFLZlRnU1FYOUZaeFR2UStHTjM5RUljcWJvR3FsWVpsUURqT3R6Vi9QK3Bt?=
 =?utf-8?B?Z01tT1BhSHhnNzY5K1FYMlp5SFo1QUgwMWtsZTk0dEZxMzZja3NrdjVYSHc2?=
 =?utf-8?B?Y0EvdmFGNGZ4aEJOT1ZtUWlNODJqVjNpQ1FDbWROUzl6UnVLQ2hLaDVQMVJX?=
 =?utf-8?B?Y1F6OXpqZHFWSGRrZXpIYytGQkNJS29ZRFlzaU11bmIvMUtyT2NTRHRJaTBM?=
 =?utf-8?B?ekZWa2o5UEplTE9HZHRlZHRFaVUzMk5YUXNBaFljcUtFTmRsNmVmaEwvMVNH?=
 =?utf-8?B?NFo4c25rT3B6WnptS2xua3duaExrRTJzSVJBQXh4cU5BY0FJb01ia3doMC9E?=
 =?utf-8?B?NVRIclgyOFZIUXA1dHR2Z25XSHpHZS9IaXYzT09iM1lwSGwvb1BGeWZuMFNS?=
 =?utf-8?B?ZFNteERpazhzOEdxSWxFdFU4NnJNSDgwcktmQmkwdlRJY2N1L3IrNkp0d1B5?=
 =?utf-8?B?WlFJVmg3STZydDVZUVZ6c3JtaVJON2dzd2NpbTY0YWpUVmFWdEo3UCtRdkt5?=
 =?utf-8?B?QW00ZXhQemJNT3hyT1M1TC9xM2JBa0p1RWo3Z0cxT0ZVdE1PWW9ZVzB3Ym43?=
 =?utf-8?B?WWRnTEZSemphbHdsWHQ1VktRTUc3K21tdldGRnJPYWxJbUhMMnQ0ZEJ6aitM?=
 =?utf-8?B?ZVByMDhZUzU4cjhHYjZkaGpWYit2eFp6eUVuMUJxWVZPQ2NtbU11eHVpb1h4?=
 =?utf-8?B?d01WYUhMQWhMeEV2TGlqem5aT1JuOEY2cnA3Z3pCWTJBZG90WFVwbzNKb3ZB?=
 =?utf-8?Q?dLTd1zZdya3v8zZMqA?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR11MB5416F59C2EDC16EED941DD7193B22BL1PR11MB5416namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ds5pHcu5ghwzPDDXUI5ApZGR1T59zbPJkjabgym8l6Ig55WUDIGXsLy7CNsUGO2Kt1rpG0v7MKLCnfVUtQzWSIDTEG9CinRwESsjbqc/wfqHhRviPkG4z1FIrj08ppQRFzGT00n6p3w26ElupEgt9NHBfJELQpu0IAk2a5q/l8Fky+5fNxMcBmFCFZnYY1I1YrHQtFrvYqQ5pF+hQKh7hVoet4mOSn2wm5O0qmfS/Wz526grS4PqVXolu44mBQLAxlURlcK6O70EQuAupGRdTeuIFSfmt7Rh2yJquHUYYuXPVanXGIwfkjlZewMOokbxbtZ0lY9zyN3l5gAVKsiaLA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5416.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa2b8b5-ff5e-4f4f-26d0-08df0cd1bcc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 11:18:26.4330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJgL5wcfTgEe9oTH0vY+o/QNqK1nXB/BsE9jUXSJ/SfNUrzx5hEuZ2YMLII8CJWtJMJ2XPskk7sy+waC00SlCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4759
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

--_000_BL1PR11MB5416F59C2EDC16EED941DD7193B22BL1PR11MB5416namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSmFuaSwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3IGFuZCBmZWVkYmFjay4gVGhpcyBoYXMg
YmVlbiBmaXhlZCBpbiB2NSAodHdvLXBhdGNoIHNlcmllcyk6DQpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9pbnRlbC1nZngvMjAyNjA5MDcwNDQ0MTAuMTM2ODAwOC0xLXhpYW9sdS54aWVAaW50ZWwu
Y29tLw0KDQpCZXN0IHJlZ2FyZHMNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpG
cm9tOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPg0KU2VudDogTW9u
ZGF5LCBTZXB0ZW1iZXIgNywgMjAyNiA2OjE3IFBNDQpUbzogWGllLCBYaWFvbHUgPHhpYW9sdS54
aWVAaW50ZWwuY29tPg0KQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+DQpTdWJqZWN0OiBSZTog4pyXIEZpLkNJLkJVSUxE
OiBmYWlsdXJlIGZvciBkcm0vaTkxNS9kcDogZW5hYmxlIERTQyBwYXNzdGhyb3VnaCBmb3IgSERN
SSAyLjEgUENPTiBkZXZpY2VzIChyZXYzKQ0KDQpPbiBTdW4sIDA2IFNlcCAyMDI2LCBQYXRjaHdv
cmsgPHBhdGNod29ya0BlbWVyaWwuZnJlZWRlc2t0b3Aub3JnPiB3cm90ZToNCj4gPT0gU2VyaWVz
IERldGFpbHMgPT0NCj4NCj4gU2VyaWVzOiBkcm0vaTkxNS9kcDogZW5hYmxlIERTQyBwYXNzdGhy
b3VnaCBmb3IgSERNSSAyLjEgUENPTiBkZXZpY2VzIChyZXYzKQ0KPiBVUkwgICA6IGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTczNDUyLw0KPiBTdGF0ZSA6IGZhaWx1
cmUNCj4NCj4gPT0gU3VtbWFyeSA9PQ0KPg0KPiBFcnJvcjogbWFrZSBmYWlsZWQNCj4gICBERVND
RU5EIG9ianRvb2wNCj4gICBDQyBbTV0gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAubw0KPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmM6IEluIGZ1
bmN0aW9uIOKAmGludGVsX2RwX3Bjb25fcGFzc3Rocm91Z2hfZHNjX3NsaWNlX2NvbmZpZ+KAmToN
Cj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jOjQ0Mjc6MjU6IGVycm9y
OiB0b28gZmV3IGFyZ3VtZW50cyB0byBmdW5jdGlvbiDigJhpbnRlbF9oZG1pX2RzY19nZXRfbnVt
X3NsaWNlc+KAmQ0KPiAgNDQyNyB8ICAgICAgICAgdGFyZ2V0X3NsaWNlcyA9IGludGVsX2hkbWlf
ZHNjX2dldF9udW1fc2xpY2VzKCZjcnRjX3N0YXRlLT5ody5hZGp1c3RlZF9tb2RlLA0KPiAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
DQo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwLmM6ODQ6DQo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5o
OjYwOjU6IG5vdGU6IGRlY2xhcmVkIGhlcmUNCj4gICAgNjAgfCBpbnQgaW50ZWxfaGRtaV9kc2Nf
Z2V0X251bV9zbGljZXMoY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsDQo+ICAg
ICAgIHwgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IG1ha2VbNl06ICoqKiBb
c2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyOTA6IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHAub10gRXJyb3IgMQ0KPiBtYWtlWzVdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVp
bGQ6NTUxOiBkcml2ZXJzL2dwdS9kcm0vaTkxNV0gRXJyb3IgMg0KPiBtYWtlWzRdOiAqKiogW3Nj
cmlwdHMvTWFrZWZpbGUuYnVpbGQ6NTUxOiBkcml2ZXJzL2dwdS9kcm1dIEVycm9yIDINCj4gbWFr
ZVszXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjU1MTogZHJpdmVycy9ncHVdIEVycm9y
IDINCj4gbWFrZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjU1MTogZHJpdmVyc10g
RXJyb3IgMg0KPiBtYWtlWzFdOiAqKiogWy9ob21lL2tidWlsZC9rZXJuZWwvTWFrZWZpbGU6MjIy
OTogLl0gRXJyb3IgMg0KPiBtYWtlOiAqKiogW01ha2VmaWxlOjI0ODogX19zdWItbWFrZV0gRXJy
b3IgMg0KPiBCdWlsZCBmYWlsZWQsIG5vIGVycm9yIGxvZyBwcm9kdWNlZA0KDQpQbGVhc2UgYmFz
ZSB5b3VyIHBhdGNoZXMgb24gdG9wIG9mIHRoZSBkcm0tdGlwIGJyYW5jaC4NCg0KQlIsDQpKYW5p
Lg0KDQoNCi0tDQpKYW5pIE5pa3VsYSwgSW50ZWwNCg==

--_000_BL1PR11MB5416F59C2EDC16EED941DD7193B22BL1PR11MB5416namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01T
Rm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpIaSBKYW5pLDwvZGl2Pg0KPGRpdiBjbGFzcz0i
ZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVk
Rm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlm
OyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0K
PGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFw
dG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNh
LCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NClRo
YW5rcyBmb3IgdGhlIHJldmlldyBhbmQgZmVlZGJhY2suIFRoaXMgaGFzIGJlZW4gZml4ZWQgaW4g
djUgKHR3by1wYXRjaCBzZXJpZXMpOjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2Yi
IHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNG
b250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEy
cHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2ludGVs
LWdmeC8yMDI2MDkwNzA0NDQxMC4xMzY4MDA4LTEteGlhb2x1LnhpZUBpbnRlbC5jb20vPC9kaXY+
DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywg
QXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRp
Y2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0K
PGJyPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFt
aWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxp
YnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigw
LCAwLCAwKTsiPg0KQmVzdCByZWdhcmRzPC9kaXY+DQo8aHIgc3R5bGU9ImRpc3BsYXk6IGlubGlu
ZS1ibG9jazsgd2lkdGg6IDk4JTsiPg0KPGRpdiBpZD0iZGl2UnBseUZ3ZE1zZyI+DQo8ZGl2IHN0
eWxlPSJkaXJlY3Rpb246IGx0cjsgZm9udC1mYW1pbHk6IENhbGlicmksIHNhbnMtc2VyaWY7IGZv
bnQtc2l6ZTogMTFwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGI+RnJvbTo8L2I+IEphbmkg
TmlrdWxhICZsdDtqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20mZ3Q7PGJyPg0KPGI+U2VudDo8
L2I+IE1vbmRheSwgU2VwdGVtYmVyIDcsIDIwMjYgNjoxNyBQTTxicj4NCjxiPlRvOjwvYj4gWGll
LCBYaWFvbHUgJmx0O3hpYW9sdS54aWVAaW50ZWwuY29tJmd0Ozxicj4NCjxiPkNjOjwvYj4gaW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyAmbHQ7aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZyZndDs8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IOKclyBGaS5DSS5CVUlMRDogZmFp
bHVyZSBmb3IgZHJtL2k5MTUvZHA6IGVuYWJsZSBEU0MgcGFzc3Rocm91Z2ggZm9yIEhETUkgMi4x
IFBDT04gZGV2aWNlcyAocmV2Myk8L2Rpdj4NCjxkaXYgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyI+
Jm5ic3A7PC9kaXY+DQo8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtc2l6ZTogMTFwdDsiPk9uIFN1
biwgMDYgU2VwIDIwMjYsIFBhdGNod29yayAmbHQ7cGF0Y2h3b3JrQGVtZXJpbC5mcmVlZGVza3Rv
cC5vcmcmZ3Q7IHdyb3RlOjxicj4NCiZndDsgPT0gU2VyaWVzIERldGFpbHMgPT08YnI+DQomZ3Q7
PGJyPg0KJmd0OyBTZXJpZXM6IGRybS9pOTE1L2RwOiBlbmFibGUgRFNDIHBhc3N0aHJvdWdoIGZv
ciBIRE1JIDIuMSBQQ09OIGRldmljZXMgKHJldjMpPGJyPg0KJmd0OyBVUkwmbmJzcDsmbmJzcDsg
OiA8YSBocmVmPSJodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE3MzQ1
Mi8iIGlkPSJPV0EyZGNiYzA2Yy05YzE1LTExNDItNjJhNS04ODNmM2U4NGFiMzgiIGNsYXNzPSJP
V0FBdXRvTGluayIgZGF0YS1hdXRoPSJOb3RBcHBsaWNhYmxlIj4NCmh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTczNDUyLzwvYT48YnI+DQomZ3Q7IFN0YXRlIDogZmFp
bHVyZTxicj4NCiZndDs8YnI+DQomZ3Q7ID09IFN1bW1hcnkgPT08YnI+DQomZ3Q7PGJyPg0KJmd0
OyBFcnJvcjogbWFrZSBmYWlsZWQ8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7IERFU0NFTkQgb2JqdG9v
bDxicj4NCiZndDsmbmJzcDsmbmJzcDsgQ0MgW01dJm5ic3A7IGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHAubzxicj4NCiZndDsgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcC5jOiBJbiBmdW5jdGlvbiDigJhpbnRlbF9kcF9wY29uX3Bhc3N0aHJvdWdoX2Rz
Y19zbGljZV9jb25maWfigJk6PGJyPg0KJmd0OyBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwLmM6NDQyNzoyNTogZXJyb3I6IHRvbyBmZXcgYXJndW1lbnRzIHRvIGZ1bmN0aW9u
IOKAmGludGVsX2hkbWlfZHNjX2dldF9udW1fc2xpY2Vz4oCZPGJyPg0KJmd0OyZuYnNwOyA0NDI3
IHwmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdGFyZ2V0
X3NsaWNlcyA9IGludGVsX2hkbWlfZHNjX2dldF9udW1fc2xpY2VzKCZhbXA7Y3J0Y19zdGF0ZS0m
Z3Q7aHcuYWRqdXN0ZWRfbW9kZSw8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IHwmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgXn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn48YnI+DQomZ3Q7IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmM6ODQ6PGJyPg0KJmd0OyBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuaDo2MDo1OiBub3RlOiBkZWNsYXJlZCBoZXJlPGJy
Pg0KJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyA2MCB8IGludCBpbnRlbF9oZG1pX2RzY19nZXRfbnVt
X3NsaWNlcyhjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSw8YnI+DQomZ3Q7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHwmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn48YnI+DQomZ3Q7IG1ha2VbNl06ICoqKiBb
c2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyOTA6IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHAub10gRXJyb3IgMTxicj4NCiZndDsgbWFrZVs1XTogKioqIFtzY3JpcHRzL01ha2Vm
aWxlLmJ1aWxkOjU1MTogZHJpdmVycy9ncHUvZHJtL2k5MTVdIEVycm9yIDI8YnI+DQomZ3Q7IG1h
a2VbNF06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo1NTE6IGRyaXZlcnMvZ3B1L2RybV0g
RXJyb3IgMjxicj4NCiZndDsgbWFrZVszXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjU1
MTogZHJpdmVycy9ncHVdIEVycm9yIDI8YnI+DQomZ3Q7IG1ha2VbMl06ICoqKiBbc2NyaXB0cy9N
YWtlZmlsZS5idWlsZDo1NTE6IGRyaXZlcnNdIEVycm9yIDI8YnI+DQomZ3Q7IG1ha2VbMV06ICoq
KiBbL2hvbWUva2J1aWxkL2tlcm5lbC9NYWtlZmlsZToyMjI5OiAuXSBFcnJvciAyPGJyPg0KJmd0
OyBtYWtlOiAqKiogW01ha2VmaWxlOjI0ODogX19zdWItbWFrZV0gRXJyb3IgMjxicj4NCiZndDsg
QnVpbGQgZmFpbGVkLCBubyBlcnJvciBsb2cgcHJvZHVjZWQ8YnI+DQo8YnI+DQpQbGVhc2UgYmFz
ZSB5b3VyIHBhdGNoZXMgb24gdG9wIG9mIHRoZSBkcm0tdGlwIGJyYW5jaC48YnI+DQo8YnI+DQpC
Uiw8YnI+DQpKYW5pLjxicj4NCjxicj4NCjxicj4NCi0tPGJyPg0KSmFuaSBOaWt1bGEsIEludGVs
PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_BL1PR11MB5416F59C2EDC16EED941DD7193B22BL1PR11MB5416namp_--
