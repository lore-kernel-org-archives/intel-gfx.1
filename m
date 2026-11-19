Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D8560A263B
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 14:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cl2vPlg3;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=WcK4e5Vb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE8C1124B3;
	Thu, 19 Nov 2026 14:35:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C3B1124B3
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 14:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795098933; x=1826634933;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=rUOEt9p9Gao451aRSMDZeploKxFRbIIqLFQ3jEeVIxM=;
 b=Cl2vPlg37rwoSRPaPs1GntbS5dZE+hfj1sjSyJV6/edWwvT9Gjm2AiMx
 QYZdhSBFpS3l4orXrNI24+rQSmHdUb4JMCPi/eFhXXbpBxR+GZbmqyR62
 aw1MAUw8e7E0JfkBFkXiYbgKvTGPTtMl6ZOYf7QSZDhMDHCapsV1CSJmX
 QsO/NwCfrKGFy317J3RSJ6cZsPovBVMXcu/6ytaTTmiFFIWbg4dGwCE05
 iy2rmBt/mpzQAwa09jnThlViaOprjoa4At6XYRfGaWdcKpC+eMDsE1bfR
 tTJsAV+oMsziskk7DkgL0GeBxemTKXEKYeNHkhEiJhuZ36MNvN7w6+EEM w==;
X-CSE-ConnectionGUID: g1GSnDC3S/SdDvDr/5C38Q==
X-CSE-MsgGUID: vs36CNyUTHq7MrA2d9xtrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3798807"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3798807"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 06:35:29 -0800
X-CSE-ConnectionGUID: HE+vugBlSEGx6lDyF7b7zQ==
X-CSE-MsgGUID: eEysxrCeROWxwOTQkMaUTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10251581"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 06:35:27 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 06:35:25 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 06:35:25 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.44)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 06:35:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UX5FcHyaCkQ/hu/i2LdOH+M1/98P3o+p34B2GwENIZHPQ3yJgvCeklD7BMCuN5s0FiDXBvGvBnYI6rtz+OKYTwzYMDQhYxrFb6XHbGvFlUN5ONG3HX3oMNLoQwYFWLge3dJpTUpuRM169638IxN85UemGjzHMrlBXDAyh592HuVQ4o/SNtjNAtzGHSUGSlyHdZTvvhhcjvu+9JYLkwSuBUeMBXwHhPulb9wzZMcAqQhOXiHEZtmQxw+IXc2Tcex/+114Ei21xpQa3i1GfHI7W+t1ia8n6Gs9UVoNuATT8Jk1mgphHZOcGEmfkcW7wFKMIGQpf+1fALOHsEhQiYSL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8lkQTyEGNAlBX+OL4q8BfiE0Nyw/VBAXUyYFu857FM=;
 b=KffFNfSaq/Dq9UvmikaZ0ym497Rslm7uhT2Pqai79DxgaXqDj7O1V0bJOyU4vuuabT1xongtrrmsA5O2u7mwjN5opgrAuITlu4SdED/3DsSE78wV1MX53W0KuSudCanSJjmI7fxdw/Mk1uZb8xALk4gfTPZFz6OooTgHLPsiwimq28P7HzUOQ/JeNUyk7y1Ub4zaF18AAhPRu5MiPEj6G88aZGsQhnMVcg/k33vQbcpTw14D9jyuVBNtYvrKzQUF6mXgwReH5PeOsoyDsSTf4jiasKaRagBKitNPj1wC3F+6ulp6RFEmKx6cRVYGYZbhkF9D3NlCplF5QKSbp9esQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8lkQTyEGNAlBX+OL4q8BfiE0Nyw/VBAXUyYFu857FM=;
 b=WcK4e5Vbmhgpeb2nT+aJxldnJCbmy7kTH80+snt+oiG4U3GJUCocryXFACNvx1TW9Fmk9YPJz9fxo/qtee3cYT0C5uhidYXF7JdZFbCUd6Au56432UDTNyzpYCO7VgGcRcnyx+aXjmLMBzaki+xG2fHqkl4pKzypEL4qtpoBtkY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by IA1PR11MB8832.namprd11.prod.outlook.com
 (2603:10b6:208:59a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:35:23 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 14:35:22 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH 0/2] drm/i915: Annotate flexible array members with
 __counted_by() attribute
Date: Thu, 19 Nov 2026 14:35:08 +0000
Message-Id: <20261119143510.2971237-1-krzysztof.karas@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0189.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::14) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|IA1PR11MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: 245ced78-6467-40ee-5a84-08df464a57e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|11063799006|10067099003|56012099006|261022105027099003|261026140227099003|261102123227099003|261028144727099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: vk0qr8OpxXmKJKUcaPvt3Xas9gns2IBZH/y3SdOcClTdnyQpqaIGN3B74DBYRZJUWBiRgNW4ruMulPwmbG3SPHiwFi3p661YtDM+dcByUvYa8J69aWHJdoNhcpVmJB+I5QMxddrlgf6GZL4fyip19rLG//HnB2srA7WVYqlNVYl3k/Y2FsrxfaJC9XJZTHOOPpWfwmI5ecVxpCUyfEVlHAAXImWdf2Z83RrRm9bzyTLeo7GWDAOxNj0IZzNOX5+EfqLK8ByaieqpZX6xeR03O6atZGpSUr7mcxE5OQeH6w2NmQgDLKaFXCaWwbW/K7cZ+iZcCrDQ4rNfyPlv2pOXS0NcDPIz3BLBjxBg7Fsih1zAHk3cfUuvNCXCbOyqGlzyD7mKHJl1kuFEeakJKHwWLXHKqvXAUaCmc/iD0L4jes6wTiJ11QXnOxHW4RBf1D0D5UvG1h3mqAK3IO/Bfc4jYxAH+RXMhnI5zX7HxHzcqYS0aB/+tdGnOhYiOxxt48lG8jYsnsPKsW1WRiOfJ7iMB75j8Hgz/CwIUe1PMq9CK+qtRtl6w4W0W84a4MrIo6YbbA72K1ToSZJKsCu7jMzY8rDpsVBvIbWgN15E5AZw2v9noJgPAaQyk/c+5k1eYZbiNHqCNo9oJF69q4NMeZLeJ5fPd+0UFzJD4dQUdtkt0Pw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(11063799006)(10067099003)(56012099006)(261022105027099003)(261026140227099003)(261102123227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WHvZ6Y4TjWaQiSjEbugBiw3+0BWjZXUMt2Yc1px8k1hqZkEA4PBEDP9cPN18?=
 =?us-ascii?Q?T7zv3/v0VkObI+HbnJ1yn2by+tkMDS/8wolPJaXr3No1sXy/QsjlsLC30hwo?=
 =?us-ascii?Q?d0gLcrg5FcqOLmuF9pC8k2WrLTXQ9LF7Sa/v8OIRS2E/Hg+eGiRe14+TXlN5?=
 =?us-ascii?Q?GYoqpnKxfW+8e+SQUw4X2DjxXMAyByrHBB9B0FE+ADVvgzLpM85FdRhpSA8c?=
 =?us-ascii?Q?G4arjXiGOeQ/e2ozSytGKBNaROK0ZpVv7bA3R2lj+cwisSmtwKCoyzi3FgeP?=
 =?us-ascii?Q?Z3I4IrS9d9ziZZuUHiNcq1No9HryafDlDvdfM8gaBedAg45b42IJSXbAoZNS?=
 =?us-ascii?Q?lk8ZPHoWlpuO+Di51XXHMKT03vNzEHsy9y2cRwYu+Z0KhAZ1qfEq0fFTxYDY?=
 =?us-ascii?Q?fqAEcIHroj0dskMI0UyR4Z12ScjCAyn3Aq0kF1atdW2przsPaQWyNqTvIUgX?=
 =?us-ascii?Q?dej1ahPcD6oRDWE95eOC+NS4LHZYqlfyx+Zw7IFQZLSyK3KHupKDsCPBSSqO?=
 =?us-ascii?Q?YW9V7L3fALPfuz3W0UNXA4xP4r89OPwH/yD9xOBRBKUXMRBJLGGz6MJtDiKv?=
 =?us-ascii?Q?63o7dawS4T2cROm9Vhg5YGx4eDAscbBNzgz3e+3Nr9oO/zn+Gax8fHURnuLK?=
 =?us-ascii?Q?xvZySKiP78ZjxMft0oHbK5er/ac23pEZF93egdcWezg3f9eXtjl7GZDuT+j0?=
 =?us-ascii?Q?WoQi11p6WI418bgKgYvYDl9tAj5TXJeY8jZkNj8901a1C0+96ikQM6uK8hCx?=
 =?us-ascii?Q?7C6C3RSvgGlM0dT2OestOQM6ireyf766e2MSLYX6hibyOfFBfeUwNqnKyP8/?=
 =?us-ascii?Q?q9hndaktKQK59t5gNN1K3P94vdYdxgSWDUEODP7ZL0SO2UXiyiV5rIgOYZCB?=
 =?us-ascii?Q?FGtFjXR3sElkCyyHJI2Xn+TqLeKRlPMPkX8Zya0T0jv3ZxAlBSLMlZC5C9ef?=
 =?us-ascii?Q?zt5j7q1udkNrka/sjNu7fzSvPDWtdKF+wDsLJTcoKz4ammo672kU/fNFudc7?=
 =?us-ascii?Q?RzfdKPVKVaWjfC3Nkzq8V4fRn2vnwvdidpWlKPgw+6fjr81GSlzXV+BQf6O5?=
 =?us-ascii?Q?PfLEu9xMbqNg9m+yiap0vVTaTUKmW78JAKNDCYPDs10EdlK9iVY0C8SJp8F0?=
 =?us-ascii?Q?KsHB7LsyDZ8TbPb7jGFCLRL9kdJZq5B07b0lkBqNxD3gi8ZkFI5CJ1DQNmDq?=
 =?us-ascii?Q?DFAs58hBJ1LSO3BCWf473ZQHzhT9ExIe1qDv4z48mbidg5noVPQx9/G5Vxn0?=
 =?us-ascii?Q?aBKC36viasP/vrUSg7MZRmj/JmQabAp031IMMXFEvfDmC9CxpGIgxv3Wm8ic?=
 =?us-ascii?Q?OQDdQ774WqBJqDZv0ofJrYV8wIJpF3iUlM/uOnpEOTjiu9g78udrYjayX7QY?=
 =?us-ascii?Q?4yiEorKrHJ9UyzQDbfxarKU6dN1c11RFAHkjPWvv/HZDP/p0XmSP8d/NEBTa?=
 =?us-ascii?Q?nFSrPmsaigUSFufl0PTiokCcGRfAxiMukNgSQjccmBECY4txfFIfYKjeZFe5?=
 =?us-ascii?Q?CdUEo+CaGXVpGwZlyHFMPap86DARmZ4vucpqPxi0bAIHrx6zjW559LjVdnrJ?=
 =?us-ascii?Q?iGrrEvGbFhrF0c2xnaMidwLYRmfWJ/EwmpTnueWkxSDO6XTw/bFawh5Z2Ov9?=
 =?us-ascii?Q?KSbk0BC4Wn5axKXB5pJNUsNYxv+R32txkSsLvNTKMzt712VpuUR603qEemGE?=
 =?us-ascii?Q?7kjd8gEaVUXxQoOjrhfIv+HU+I6GJHyzmT9jEjfViFnoiJ9Mks03zwpSEIaR?=
 =?us-ascii?Q?ySh9uzNcdBLowRzojEbq+8txmSPG510=3D?=
X-Exchange-RoutingPolicyChecked: XgC5XSZYoxX+zcbJ7mDc0Cwh0JPo99WG+pYiXuRtIzjYW+xA2G98SKn7ghzfbDm8EOKijqiG4Bl1g+qBWuH2mA+z43XgmekKHZkNhxQZR1WA2CyJUIXfavsJGienUlkdMTflisAda4cLqhKmciZMj1xdCLRciJEC7mvxRkosiujqWZDA1JNrb+H9VEA8nnnSMy+AKK9dewCkEnUHURgEfWeNuUzNLW/9Nv0Xoch0pxd0BvS7cXhqwP3pFQ0HpfrANuoUldUEyiOb9EAVlmCEJ/hWA3830q3IC+KGYPlo+QOxjlBRdXxg5vLc80JUrmFX0hLDwqfYeYIsj+JuRve0pw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 245ced78-6467-40ee-5a84-08df464a57e8
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:35:22.8799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufj30iLhw11Jk94xeWnGDeHS7IZfpyyNDyauiy4k8o2pg+rV56VxAqz3/S3vHeBJen1szrjcrHNoXcgiD2yT6KUoQ0ZD74fWDBz2CDt4Ugw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8832
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Annotate i915 flexible array members with __counted_by() so
supported compilers can use their element counts for
CONFIG_FORTIFY_SOURCE and CONFIG_UBSAN_BOUNDS instrumentation.
Entries that could be modified with straightforward code changes
have been selected.

The first patch covers arrays whose counters can be maintained
with minimal changes. The second covers the UAPI query result
arrays: the query handlers now build the variable-length results
in kernel buffers. This provides bounds information for
kernel-side writes to the annotated arrays.

Krzysztof Karas (2):
  drm/i915: Annotate flexible array members that require minimal changes
  drm/i915/query: Use __counted_by() to annotate flexible arrays

 drivers/gpu/drm/i915/display/intel_bios.c     |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   6 +-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   2 +-
 .../gpu/drm/i915/gem/selftests/mock_dmabuf.h  |   2 +-
 .../drm/i915/gt/intel_execlists_submission.c  |   6 +-
 drivers/gpu/drm/i915/i915_query.c             | 101 +++++++++---------
 include/uapi/drm/i915_drm.h                   |   9 +-
 7 files changed, 76 insertions(+), 58 deletions(-)

-- 
2.34.1

