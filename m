Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA735606A325
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 14:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SBTz0R3h;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=N0pacXF7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193631124B0;
	Thu, 19 Nov 2026 14:35:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA63A1124B0
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 14:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795098930; x=1826634930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GGPqw+KP8g67mwcXgqtTiEqEGJaaaue3dlyQ+XhSTtY=;
 b=SBTz0R3hIK5EgZUV+w5GOofnxBfcQY37xYYOMIXc+gsJ5sksM+JsSh1B
 OPUkPmGWtHlgEBpY+43ZzyCiY/4KKZcfU3guLOHdbwAyIzrCjVaaQXhdJ
 jvVUUfWus4Q0bfW5PUR9yvUL6b3e9dbUyNmSRfdSl9QpEsRpg5YiuRmy5
 eOeEN4Hqr+etU3teeAcKEQk/u3HvnNGxtWrn+byadOFPYQw8P6cFu0DEc
 cvryAV2pDRZSd4eJhdGQ0p4gtiB+/cGfkOzmGXfVXm+WA75CxHCii57iD
 P0MOaOETr25xKEBpW4bhIjMXvc2t1B7vhjBZUdXEGzsnqJSQVWCmqb95j g==;
X-CSE-ConnectionGUID: ESSK6QzrRICAgnQnIj2lNQ==
X-CSE-MsgGUID: 1pNMhyA5Rj2xuSEWs2eu9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4027172"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4027172"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 06:35:29 -0800
X-CSE-ConnectionGUID: QrrpOldGSSqW0g5s6grwKg==
X-CSE-MsgGUID: w02LJXkkRXireYZdT+amow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="12184988"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 06:35:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 06:35:28 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 06:35:28 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 06:35:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXnZp0pynx2QV9j1OvxcQwuxhfu376vYW2ammU8wr7ERbv7Qk9+DTidNUttTwAPy2QF8K8S3PiupZKQ+iOkQLl+5oUPjVyXB1lUHV+Jo0M67QXd5WzCqMRwNMiMyNSeDszZXpr301iRGQe1o8L/FKo6+P/WRuLjT5XSiJywyOjmKliVkRPkSjz6P4PcJ0uDnhdPTE2ghN1cRQ7FTUTHTOLljKW4S21YBgiTifPGsW6yD1h7cWb6t2V8W9ZyTs+VS94hAdQgSZ/gcciooLvKpsutYT5oLJeJOXOn6msf3JWHzQuWdJsgYNOXac/aH8lUX3fkF0z7tEbbJClVHPkPZZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwI5lBFielco1NR5dJ3DuiiCRjjWLLl1Nbj4q2OZiao=;
 b=jbJZ6HkH8NZWed+KtY/dG2jvpg3maOV/dXTQDTap2/gODbZ0H2Ve0gaVhoWkNvWuz+xwN3dVtS28O9ClUpDrK0D0ZzBQtFCiHk9lF3vzbIFaoe20FKX8DIWa1gYBsa+crx1vmIhxzDp4Eco5ZtHPvV1ImLFsW+4/3uuHCFGFygWs/KliJMpf3T3A41MZL3ekN+YGXVmwPlOKFjXszO7cklZUN8gcq++yfx+Ube6ZvCcj8MLg6ZnhboPTtPkcln4/QsP05I+RZ2jx8/kCxQJsZFOYGWDH9CUc7WABHcGJxgzhod6AwVChB023ACOGxInx9ariGdlRQqcJfLDHLLIkPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwI5lBFielco1NR5dJ3DuiiCRjjWLLl1Nbj4q2OZiao=;
 b=N0pacXF7i4OS/BDwvNZaBGSyf6gggFhfHaHI9SSV+WJHM7fBvc1yp/64KHKWdha/mo+gJRBJOaxXWbftrjor1xUciDgizZvxi8prSfOXAkLE2hR2bgYiatLhTmBqr8aICy34P5tFGiyERz88leXV0IW8Dn/mmALTkLDbO2jF71Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by CC6PR11MB058488.namprd11.prod.outlook.com
 (2603:10b6:170:200::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:35:26 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 14:35:26 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH 2/2] drm/i915/query: Use __counted_by() to annotate flexible
 arrays
Date: Thu, 19 Nov 2026 14:35:10 +0000
Message-Id: <20261119143510.2971237-3-krzysztof.karas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119143510.2971237-1-krzysztof.karas@intel.com>
References: <20261119143510.2971237-1-krzysztof.karas@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0189.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::14) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|CC6PR11MB058488:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a594ce8-0b6a-4375-e3f2-08df464a5a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|11063799006|5023799004|260925021311599003|260925022911599003|260925021911599003|10067099003|56012099006|261022075727099003|261022115727099003|261022105027099003|261026130827099003|261026140227099003|261026121527099003|261022113327099003|261102123227099003|261028144727099003|261026135527099003|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 2Kxyqq7mbqihIZrMHwU50mqVyUITQUVdgka3CuyXiWXQNWgj3/fCAqYkJfCl2IksCZuwnizYDJyoS0q4ugHzCyf7uqtLEfQMzUdd2OoLgEVbDt8Hty7VxcsKcFl3YOiY3oe/34B6Fk+GvdIFjBdtniD3bhk2HLVtI2nwH3oTGfT8DGoYXPnWQSCQ/nJTLq5rqMKQXHJ/bn6+Xv6m3NYKQGstyDIW9FL9EBol90SIHaOdeaRufU+Zl91fMAQian1E1KyiEAm51CH02jQcffVU6uMb2B0+4ziGp9TyK1eFY5EweFKFJh+4x+CNFMISJLhL9q3MnmOxS1QXk0RN/iBLpLAO5jHZk9swOUvYn/R/fYU+XWONRUYl1prPD/lZj6+Vex8XHS+azprn0M0WiLOvZszZc2KbRmhb8riMav9Gy7zfS6eAjy+Q/jIF19tzz8Dh/zG14GrcyJg9+yvek1Em9C/K1Z02QyKx9GAs1oVYGe3/imWjgw7aMYb/Ss1/d4ixviaXG9dbyf26xfefCgu4QUDIXkzcbdWv+aS8NzLowPwlKu7IewekWye2ap/kXGuSXucdijLvsa4MSNUUmVbYVT1VmShV8keyqSS3C4aq5gzV1PFBki3HXRLRdgKyzAEF7F9XAEgmTImLuMI9s9oP0YJKu3jpQ3O3lmCDZODgWxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(5023799004)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(56012099006)(261022075727099003)(261022115727099003)(261022105027099003)(261026130827099003)(261026140227099003)(261026121527099003)(261022113327099003)(261102123227099003)(261028144727099003)(261026135527099003)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YwPsSY9/BUG9jt2zAv5eoqxB/UKvgOtNPImbzcN7nQgbrXMbOar5eYFI+5ry?=
 =?us-ascii?Q?g030YEcC/bUPSdYnILa+NkpATo77BBgMnJ3xFw3ia8aNDHVwY42lqU6ZWgqO?=
 =?us-ascii?Q?vmGq30lnaGfINhHb1rPZBgKCVA9qDgl04w+Lqcr12yb55xSFnyXcuQROUnX4?=
 =?us-ascii?Q?13XbUvasOUeJzOqnNxGh37Yl8BK4Rde8S+zdBrHXouV1m5YTZ1VZOfp46d3x?=
 =?us-ascii?Q?xVWCR20Y/McqzqXDzcRO05tFBpgjvrBs3qrxT+UJZgFxHBAPmpUROlsEzioJ?=
 =?us-ascii?Q?KkQP7RRRG4gxePSmK/nnvffFrzi7bK/k82Vo9fY2h5F8ySm0RvL5bEVnttax?=
 =?us-ascii?Q?aMA+Gls9VcrYatqJeCjynUPQXYVqVKbugR3p4FgUWWxVfdy7BVkYZXcUeoV9?=
 =?us-ascii?Q?3ujge8z54HsmkCylaoDUro4STszHzegixlCJYm8MsdjdFImIah5YJqoGPQOJ?=
 =?us-ascii?Q?kRcjW15jcR29hUI1/XmzqIg1TKZfqtmsqbllc9Xbq9OXBJWzlaOqjalxqSm5?=
 =?us-ascii?Q?B4u5x8n24a4bdDzG0wmcMuH3Q+dBnk7sNxgZi3BaRANr7NB8/QqxWfyC9pB/?=
 =?us-ascii?Q?41F6ogmp98vXphoeyo5UENlmfwvtxbbWVxP2xtQb7Nsb3hD3h0Vfh2H6qYE2?=
 =?us-ascii?Q?rkGHVuPvb9h7b5ufkatLOA/iFYPc7t6zrGd9tNJUwvpddiTEgZvbJDUWt5vH?=
 =?us-ascii?Q?PtwO9B1ZyMe75RzndDJbWseJg+floc4P1nmmbNM7vSN1f8tfcZP7qGMexSja?=
 =?us-ascii?Q?NVkhdOLVs3GCHZaAcgAX83qSj/XtSuDQBI5JP6yeBaV1Orfp5CEjOKo/WvWY?=
 =?us-ascii?Q?vxYXnzjw1ZXq9osZ/QhtOumvXHY6JcfaMgmrW9RB3gVVTlbTZKVF6WCvAZ4U?=
 =?us-ascii?Q?REff60PlKNI/8b5UBJqTQBnVEtxUKOepcvRiJQT7xmo9u+n2JHlQxBFaUw4H?=
 =?us-ascii?Q?+tYvtNvt+PI2Nt8mMHVUyaIIkL0lD8O/633oLhtML0+7ZLS97BYOG+lUjAgs?=
 =?us-ascii?Q?bgMI7tjpOzhKpb14ypkQyJuGU1BN9eknZskHSNYRaFjqfmF93Tqgc2AtivN8?=
 =?us-ascii?Q?oDrXZUgNziTpOi2v7Mk9iUptkYZl49t3hYVL+HU9NjQCRelCBKpaj3Qs7tVh?=
 =?us-ascii?Q?TPltqDQ/rUz0WKTn2xKn59Y4+mBbc5EkhFXlkEZax5rZwqPOid4JtQNjzunw?=
 =?us-ascii?Q?90eDu8OwkC44SKH4jQjBRD/rXSiU3pAxdpQvrO3KYMCTJPWVslZPIpncof9l?=
 =?us-ascii?Q?lklORKIXvHgfx+HoQLCilcodjeQLtz1c8LDy997ECrkP/BUsT7S3mh4of/HO?=
 =?us-ascii?Q?TLM9g34y1/iENS/8vdeySUQElEr3/4jymMM2Ci+g6vurpV6Ela1S9A3lyYRO?=
 =?us-ascii?Q?Z1SMY2VjWNX+6sEgsS3hYymm17S6s8HD9PmFAbUHonGX3lk+S3cRyhcTxdZQ?=
 =?us-ascii?Q?48On1/0GmQtiOH/+7D1xp2523r+DUMhiJhjT3V3lN8regtVWYzgrxXhqI0+6?=
 =?us-ascii?Q?EqffPsLbMM3G4OLrCP/Gfy4T6jPWJM0HLtYmCJE2AbWUMJ5Ek7k2IsNXGDTQ?=
 =?us-ascii?Q?a/gS2S9Q6mTbiovrwc9pCQtbRB5jR53tlLvGTpb33g+rG7Bwg9dbNLku2E6w?=
 =?us-ascii?Q?tHMmyeZ6TW68BW9mehrTiYpP/jt19Rao0eax/ICxNYyTSg7zmT3xw3rhvIgX?=
 =?us-ascii?Q?UN6hJz4n5H9KKB1cWtWHTMzARwsJ7lFKUbPOjnrkt/NvOnJxUGD8QHJc9hfK?=
 =?us-ascii?Q?KtvZaFWbJEVzA6ajsZ1uo+7krCGDFNA=3D?=
X-Exchange-RoutingPolicyChecked: TWN3My5CkdM8+BvIhx2oILAhMUXABQ+iiYuFzWIirg7gKFU2cUL/wGOE+GcSFVaYTXw89FA0q6zXkw7QaR2UVkima17oael9/dkMzh2HPVFytSWVXugOF8cHaly6VUrJ+4Jq1oKojZVflozV90hRKBAAi3Rkj+KMfIpCwHdIL2zK+yMit9RQK97vVjKiNyrT8cacfD9MzGN7WnOoNlpwVWih681Any/eq7B/7UqCzcRs3RnhmK3Uc+tfLwtt4/9UyX8X4yOdAmNUWXN9yXLhHzGxhKf3tAZGVRhCZsGWVptebrpczqS1PDfXyzNVwhHnudqtKD2aB+xuhL8Lm2uxxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a594ce8-0b6a-4375-e3f2-08df464a5a1f
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:35:26.5402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfDr0YQifXPX3ekxvbtp4hbWC5DWtDQCa6kkne12hDWPlLDQHDlyRagy0MgsNIQIy4KnGBAiw2YWKDmynhZREs/FeA6tWrfumvI2Pv/eSwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CC6PR11MB058488
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Annotate flexible array members to facilitate bounds-checking
coverage (memcpy() - CONFIG_FORTIFY_SOURCE) and enable
array-bounds sanitizer (CONFIG_UBSAN_BOUNDS).
Use temporary buffers to allow compiler bound instrumentation.

Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 drivers/gpu/drm/i915/i915_query.c | 101 ++++++++++++++++--------------
 include/uapi/drm/i915_drm.h       |   9 ++-
 2 files changed, 60 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 11157fb14db31..46fee1591e489 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -132,12 +132,11 @@ query_engine_info(struct drm_i915_private *i915,
 {
 	struct drm_i915_query_engine_info __user *query_ptr =
 				u64_to_user_ptr(query_item->data_ptr);
-	struct drm_i915_engine_info __user *info_ptr;
-	struct drm_i915_query_engine_info query;
-	struct drm_i915_engine_info info = { };
+	struct drm_i915_query_engine_info *query;
+	struct drm_i915_query_engine_info hdr;
 	unsigned int num_uabi_engines = 0;
 	struct intel_engine_cs *engine;
-	int len, ret;
+	int len, ret, n = 0;
 
 	if (query_item->flags)
 		return -EINVAL;
@@ -145,35 +144,37 @@ query_engine_info(struct drm_i915_private *i915,
 	for_each_uabi_engine(engine, i915)
 		num_uabi_engines++;
 
-	len = struct_size(query_ptr, engines, num_uabi_engines);
+	len = struct_size(query, engines, num_uabi_engines);
 
-	ret = copy_query_item(&query, sizeof(query), len, query_item);
+	ret = copy_query_item(&hdr, sizeof(hdr), len, query_item);
 	if (ret != 0)
 		return ret;
 
-	if (query.num_engines || query.rsvd[0] || query.rsvd[1] ||
-	    query.rsvd[2])
+	if (hdr.num_engines || hdr.rsvd[0] || hdr.rsvd[1] || hdr.rsvd[2])
 		return -EINVAL;
 
-	info_ptr = &query_ptr->engines[0];
+	query = kzalloc_flex(*query, engines, num_uabi_engines);
+	if (!query)
+		return -ENOMEM;
 
-	for_each_uabi_engine(engine, i915) {
-		info.engine.engine_class = engine->uabi_class;
-		info.engine.engine_instance = engine->uabi_instance;
-		info.flags = I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE;
-		info.capabilities = engine->uabi_capabilities;
-		info.logical_instance = ilog2(engine->logical_mask);
+	query->num_engines = num_uabi_engines;
 
-		if (copy_to_user(info_ptr, &info, sizeof(info)))
-			return -EFAULT;
+	for_each_uabi_engine(engine, i915) {
+		struct drm_i915_engine_info *info = &query->engines[n++];
 
-		query.num_engines++;
-		info_ptr++;
+		info->engine.engine_class = engine->uabi_class;
+		info->engine.engine_instance = engine->uabi_instance;
+		info->flags = I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE;
+		info->capabilities = engine->uabi_capabilities;
+		info->logical_instance = ilog2(engine->logical_mask);
 	}
 
-	if (copy_to_user(query_ptr, &query, sizeof(query)))
+	if (copy_to_user(query_ptr, query, len)) {
+		kfree(query);
 		return -EFAULT;
+	}
 
+	kfree(query);
 	return len;
 }
 
@@ -466,70 +467,74 @@ static int query_memregion_info(struct drm_i915_private *i915,
 {
 	struct drm_i915_query_memory_regions __user *query_ptr =
 		u64_to_user_ptr(query_item->data_ptr);
-	struct drm_i915_memory_region_info __user *info_ptr =
-		&query_ptr->regions[0];
-	struct drm_i915_memory_region_info info = { };
-	struct drm_i915_query_memory_regions query;
+	struct drm_i915_query_memory_regions *query;
+	struct drm_i915_query_memory_regions hdr;
 	struct intel_memory_region *mr;
+	unsigned int num_regions = 0;
+	int ret, id, i, n = 0;
 	u32 total_length;
-	int ret, id, i;
 
 	if (query_item->flags != 0)
 		return -EINVAL;
 
-	total_length = sizeof(query);
 	for_each_memory_region(mr, i915, id) {
 		if (mr->private)
 			continue;
 
-		total_length += sizeof(info);
+		num_regions++;
 	}
+	total_length = struct_size(query, regions, num_regions);
 
-	ret = copy_query_item(&query, sizeof(query), total_length, query_item);
+	ret = copy_query_item(&hdr, sizeof(hdr), total_length, query_item);
 	if (ret != 0)
 		return ret;
 
-	if (query.num_regions)
+	if (hdr.num_regions)
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(query.rsvd); i++) {
-		if (query.rsvd[i])
+	for (i = 0; i < ARRAY_SIZE(hdr.rsvd); i++) {
+		if (hdr.rsvd[i])
 			return -EINVAL;
 	}
 
+	query = kzalloc_flex(*query, regions, num_regions);
+	if (!query)
+		return -ENOMEM;
+
+	query->num_regions = num_regions;
+
 	for_each_memory_region(mr, i915, id) {
+		struct drm_i915_memory_region_info *info = &query->regions[n++];
+
 		if (mr->private)
 			continue;
 
-		info.region.memory_class = mr->type;
-		info.region.memory_instance = mr->instance;
-		info.probed_size = mr->total;
+		info->region.memory_class = mr->type;
+		info->region.memory_instance = mr->instance;
+		info->probed_size = mr->total;
 
 		if (mr->type == INTEL_MEMORY_LOCAL)
-			info.probed_cpu_visible_size = resource_size(&mr->io);
+			info->probed_cpu_visible_size = resource_size(&mr->io);
 		else
-			info.probed_cpu_visible_size = mr->total;
+			info->probed_cpu_visible_size = mr->total;
 
 		if (perfmon_capable()) {
 			intel_memory_region_avail(mr,
-						  &info.unallocated_size,
-						  &info.unallocated_cpu_visible_size);
+						  &info->unallocated_size,
+						  &info->unallocated_cpu_visible_size);
 		} else {
-			info.unallocated_size = info.probed_size;
-			info.unallocated_cpu_visible_size =
-				info.probed_cpu_visible_size;
+			info->unallocated_size = info->probed_size;
+			info->unallocated_cpu_visible_size =
+				info->probed_cpu_visible_size;
 		}
-
-		if (__copy_to_user(info_ptr, &info, sizeof(info)))
-			return -EFAULT;
-
-		query.num_regions++;
-		info_ptr++;
 	}
 
-	if (__copy_to_user(query_ptr, &query, sizeof(query)))
+	if (copy_to_user(query_ptr, query, total_length)) {
+		kfree(query);
 		return -EFAULT;
+	}
 
+	kfree(query);
 	return total_length;
 }
 
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 535cb68fdb5c4..e9b7076640736 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -29,6 +29,11 @@
 
 #include "drm.h"
 
+/* Non-Linux builds of drm.h do not pull in linux/stddef.h. */
+#ifndef __counted_by
+#define __counted_by(m)
+#endif
+
 #if defined(__cplusplus)
 extern "C" {
 #endif
@@ -3381,7 +3386,7 @@ struct drm_i915_query_engine_info {
 	__u32 rsvd[3];
 
 	/** @engines: Marker for drm_i915_engine_info structures. */
-	struct drm_i915_engine_info engines[];
+	struct drm_i915_engine_info engines[] __counted_by(num_engines);
 };
 
 /**
@@ -3617,7 +3622,7 @@ struct drm_i915_query_memory_regions {
 	__u32 rsvd[3];
 
 	/** @regions: Info about each supported region */
-	struct drm_i915_memory_region_info regions[];
+	struct drm_i915_memory_region_info regions[] __counted_by(num_regions);
 };
 
 /**
-- 
2.34.1

