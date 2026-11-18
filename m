Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334B7606A325
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2026 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VTl5WYMS;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=W+NRTN9T
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EF110FC10;
	Wed, 18 Nov 2026 13:03:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5553910EC1C
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Nov 2026 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795006966; x=1826542966;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=cKsQ/kki0L1/8rP+stzmLxqAj3AT3hu8o/BUTeM74lY=;
 b=VTl5WYMSMPGjOB62TsWIgKMADvdSgxJ8SxwyrjboQTyqM+3B5tWgdPGP
 6bcwQmgeZ8WAlQ25Eib4U7oywo1nyTfaywGqG8W4I1JIk+YEgQc10EnGa
 lfKGQT5AUmFf0nOBIqxKgl//wtp4blJ9P/87eOKSNU1rzilZ5SCUrJ2X5
 3RH2Bh6af8BTKX/UsKVsCE4GRiqEpopFugZz1fgbW0aTZIClxeGQ1BW1T
 oPPbKrwtmZc+eO4aNXXtaYWHaj8600aDv7nbEKRwj0Y7rdaHYkCDXCTTD
 wxXWvRkNiuQExWBHcsvpqlcJI+UB0S1NUripz8gRYEGxwGes1yEj4Rye9 Q==;
X-CSE-ConnectionGUID: Q1d8kbMSSsC47iCv8m248g==
X-CSE-MsgGUID: +a2V2DMUQ7u6id267mcEBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3805731"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3805731"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 05:02:46 -0800
X-CSE-ConnectionGUID: eo6abCRpTsKddHvsQbSXDA==
X-CSE-MsgGUID: VfuoTSTOSba+/SLek/3OMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10027089"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 05:02:45 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 05:02:44 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 05:02:44 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 05:02:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H67S4un4/20Gt/PDobVJazIBO8XkkeztirQMIcuOnue2MFLuNzRc0wQAgZEbTZJOTiNJ+nbS8n26xNsW00nsSwGmUae+oS9Ep0FUkrIQgrV1UjrR2fxyiC02hsa+oR4jk6BPqx0Zf/KGYFUMQSu95v8Dq0CNLAp8ppAW6Wk6Vq2akKpHlYRI2YOjQ+/DgCnE3t5arWkMSREijjGRg/BFVVoPzl/JylZlAkFP9OZf9pxE7wUwiwIu7ohPYnzS1W4Q/UvmY1k4kkt5817lMiTXC926BIwjLeSNu7M41ikXz7TfI9jqV3NqBFNU2B/G08Whz5sOepDh09V/Gn/xXuTsOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l82+IHtmFszwP+XY5neLqP//Ud6UWHaZD6YV3XCpFno=;
 b=VsJqlDcCvy1Sivwm6BmeWDUNDYXzNGyBfHy2fdtyzXSTcMhHKhT0AWFA4yIVlh2gjwc23Q0JeoSV+9UoinxzL8b4wag+6PHlQqQTl9fRrUeJK3AoNe8YdH+tjoP4ifdoEMF28I10q+E7DKaLSo6qJFb9BKbZfg18VngEyT8bxKVnLlWwa9vG41A7elp03bLDVc+Wny0+QvjLgTuLM0wS6DPpOZC/qiDfKuC+8b576v37CIvEIkgqOFXnGrieoHZkJQD7LzoumVbGn/a/Iu2nifi0GimtlNjpmpszPcMTSlo5xj9Xj1YAkO+AdXVL/dLn/XYdlPmnFv11vFJv25tF7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l82+IHtmFszwP+XY5neLqP//Ud6UWHaZD6YV3XCpFno=;
 b=W+NRTN9TMex2y6z44mDPAioQtqoPVlnkFmtLvTClID/Sj9ly1QGOA4itz3emsN82xX4CW/Pb5zctRgA6FzSC4lPfbgDmLsrtSUzD5ObgGeyyD5GeaF5wVC/BJZ8xpn+mCxy9//rgw4g2GWYFcX/HYO5Bjk3DZYJqPEUldFhKDR8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by IA0PR11MB7260.namprd11.prod.outlook.com (2603:10b6:208:43b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 13:02:42 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 13:02:42 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: <andi.shyti@linux.intel.com>, <chris.p.wilson@intel.com>,
 <krzysztof.karas@intel.com>, <krzysztof.niemiec@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v6 0/3] drm/i915/selftests: fix stolen reset test races
Date: Wed, 18 Nov 2026 14:02:17 +0100
Message-ID: <cover.1795006734.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.56.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR10CA0018.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206::29)
 To DS4PR11MB134916.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB134916:EE_|IA0PR11MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: 47da1e6f-361e-4e40-c124-08df45743b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|261026140227099003|11063799006|261022075727099003|261009223027099003|261021123027099003|261021121427099003|261022105027099003|56012099006|10067099003|261028144727099003|261102123227099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: /HaJfse7NttpfJlhhsgjNXRHvFfnJ0/6Coe/cwdr2aajUSc0A/jLyeeYeWL/72Vb3gHsEieCWtKaqpq2jftgqKhXeR0VXgwMzBEAe3e4tKuAIhjQhtrdAYztm44+3iL4181AB5m+xhu/ZXHjw5adCdjuncy1CZoBCpWiJVGa+fvLRboJu59wWgGRygfHhntZFdLYOkaMrqeWPIRSnJWbzTo5/1x9pX7jz5SdHJlN7fvIAy09mUhZBxOvjOxWB/ot/a9/CgPXnqCcEvr7mah9mF+uEE1ep2AMHYzRfAkU/y9nWEfqTro88j1fmaENSwM6Ef3/HWXoYRGAzUrN2BmoBjFJpbJHKFWV4CtIw/rKqpXMHHuwQymqxSmDpEVMsTyqC2KpvfL18t9fT3uacDBtHpJvilwDa+JrR8MGISK78m+yvJCY2wL7ier6yFuIMrRvWVZ6ahPzGe63REuFbyrwvCV5p2UOOfuWUlhPIki6FlNZeebm/spSMukX/xj3EPNZO5jKtX35JTb5l3hb8BskyktUkFC7qtO4nXEdD/eVEJrUgozG4WOAhf3h+hf9h0rVj65EqG4fhFxNsSrSn/bh3kP7AAD2cTA+iYTXVld6M9Q6O57HH3aIjmU34WF0+oHXfoayAtzQ0VhNVO3oCsOjRHCeNwar2z0Fa48aU+XVV5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261026140227099003)(11063799006)(261022075727099003)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(56012099006)(10067099003)(261028144727099003)(261102123227099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Yx79sI/bKKzw0gRL4wlcox7lvhGcK2YexklmszBR9DSCrN+N0481j+MISbY?=
 =?us-ascii?Q?2Tg48Ki0r/lmMND1DAoCqAW3qajQ6XyxcEAtAPrtD7+oT8kFLL3AE18TmoOX?=
 =?us-ascii?Q?6uiyIbJZu2KQcSXRG6CtqmWJ/kWxx9ejNPMfGkgDySlKPsCgqRvybK1TOSFR?=
 =?us-ascii?Q?XpmQM4boQEZuImqbVd7SY8nfF/ccql98A1bEcsACt8EZ/RVEuP2K67+R2cBt?=
 =?us-ascii?Q?qPlbUnMlJaPCr2irvR2W1M7vso2bzU5GnKVRBzX2RFHBvUnwVnAc3sKnBW47?=
 =?us-ascii?Q?QKk6ZdPv3jlvj2BjUDfwyL/RQn+dUxZIWXRkro+qhMmxkz29tMHsobdAG5PS?=
 =?us-ascii?Q?J4HNx8eDeMnnEVVvaE0cY77ruFur59kkemZFGUAUeVj+AP93TWMIcGvG5ity?=
 =?us-ascii?Q?RswaaxLYcvY8urpIQtx9LNSSPCl2zkTeS616uMNfm7jRWBtxsUslit/TAJWI?=
 =?us-ascii?Q?oNFXS4NUA/xoWaiWn6P31NoBIqtoj/+lfYHjOqsW5XsU8gDxTAJ+Gyb4JuF+?=
 =?us-ascii?Q?FFX/c2GdlioBR/i1Ou3OuIyj08DgAVl8afkAVumwACzVoyblkQl8W9gnAifQ?=
 =?us-ascii?Q?zZTbop3GA3NTK2Fy4144J+e7x6gk3a9mxneoP4Kke93aAHP/Xd2U0TnxHOiy?=
 =?us-ascii?Q?OCrQCApmpa3k5aesKScH0g5l3qXX0lWLHP0oqPuZA+4B261n5AJDd8wFubLz?=
 =?us-ascii?Q?buZpBVIFrzPt3j9v5MKRPhG3ayGqfWo6J7P42NxEL1qfBSqY3wllWSX2kX1q?=
 =?us-ascii?Q?my0njRs+UVkHxUDkQSGc8Qf4eQsOFkOxeVsaOYyXD2bHWra+3kUCPQRRUeBn?=
 =?us-ascii?Q?c1kEDtPVAqNcf+d1bSDf9buFY0Kt3oC4NwagLIZKpSQz8i29zdL19vZ3b94G?=
 =?us-ascii?Q?6pZVx9L+nREE8JsZA7LF2C4Xsoy0O9FppDScoKjToqA3ngJ8qSeN6IR0eWtN?=
 =?us-ascii?Q?sFw1C19N8hGirrnfSoDN1mjBWBHoN1tPkk+5iGLcuEIC8lt7eULxE6Vy2FqB?=
 =?us-ascii?Q?xu5djxEo6h1LuZdKlplZ1HsGqPvqPyglpDy/kbFTv21MxtKvvDaYI6pD9/mV?=
 =?us-ascii?Q?BfQHFtkLb6GwPuH98aN0/fLwGiXP+kQK6xxFaBA7IwOWUJu2huDp/1xKujFt?=
 =?us-ascii?Q?NY1F97ttiu7TeVlcY2FhveErjLlALRWM7pDYtc0YoGqe/P4C1Tx02ln8Yj7b?=
 =?us-ascii?Q?Z5loR2GBTyXj4cN05/vauzVVWU/a9lRHxE1Y5/OlqDc73ppAj2WSorOdXYT4?=
 =?us-ascii?Q?m9f3sluPh6X295Dh3ckSMbxKQPpnw1N3wO8I5Frtw0JrD6JYpw+I1yzNmUpX?=
 =?us-ascii?Q?b1icgDPanyTEutfzvlg9SMgooiDgnmaPa1B+LJ9YeviTMrGW3fWurZdCgMnt?=
 =?us-ascii?Q?MxtNxH9qMhjheioC+7T1VKKTjVQ6QghK5lqZ1i8XDK9+/9a8CQKFJZb3X97A?=
 =?us-ascii?Q?MdTqEdzsVCYQcyhAP4wY8z+Vs81hRfl1dzzhrVB+V/DMGRbY5sltRZwC90sr?=
 =?us-ascii?Q?oJgE+I5mvC9n6autCqboeN5/zc+Q9iDdD8CLJ/97C3r3NyWXyAoO8uYNUubS?=
 =?us-ascii?Q?wOb92kc7tcnWDUp0JB1H9XGEvDi/AgUqyeUqzNTKVqwp75dbygByKWOdjufA?=
 =?us-ascii?Q?oxpjkz7Es8WZwa3bOiDsCp1uStK+JdieNFxB7IW4rRApzBBdMHX7SA06lxXz?=
 =?us-ascii?Q?AndfeQWVUQd71BzQJMYeP3Tr5UOm38q9R2eU+evl1s8mLwEHTgwMeqK5r1Y/?=
 =?us-ascii?Q?cv1P46ppgd3YHR9tFSmnHLagnPTNA+A=3D?=
X-Exchange-RoutingPolicyChecked: ZFrEvkDcRKed1fqGcMyG3ySQ9DR2vrvJxOxdX1vIOETTLoUQ5PDPGL2L9GPv0eFBfHgzfevQtPzL9OuVHlc1Ivi7VuwNT8zcmBjBa/c9OJebTAepBy990Q9/GcbqjbXRj9K0FFfncjbXaj3kV1zh0VfpF6KIZpF28U5udElAYTaJAbSxr+H6W0kwu5u1QmlkoGFx/3KF0wafpCHIrNt7biFhm2LgAwh/MmSHT/mzOsfFwIKG7xX1KuAFKsT4JNjUiTgXco/e2eXkF4UtZFzYeeWlyletHkelp2iHsOClfabIdCBtbDR0lv2GJN7/ODo+peKeDElyh7dzqC+2dWQW9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 47da1e6f-361e-4e40-c124-08df45743b1a
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB134916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 13:02:42.3282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3KtzYMwQJ0rZtOJRw2beEX0aiUJnJ7PldwLEOUnws8zpkvJCxa8LpkX+Zr93SKa/t23OmhjfOQINBLbCsft+eU/t/JXHGpIdepfHZqwOsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7260
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

The stolen reset selftests (igt_reset_device_stolen and
igt_reset_engines_stolen) poison the unused stolen pages, reset the GPU
and check that those pages did not change. This series fixes two races
in the test itself. Neither one is a GPU reset problem.

v5 -> v6:
- Split the series into 3 patches (Krzysztof)
- Drop the poisoned bitmap, it was redundant (Sashiko)
- Use raw_insert_page when available, like
  i915_vma_coredump_create() (Sashiko)
- Take error_mutex only around the sampling loops, not across the
  reset, to avoid a deadlock with the GuC CT worker (Sashiko)

v4 -> v5:
- Hold stolen_lock across the reset too
- Add a patch that takes ggtt->error_mutex in the test

Sebastian Brzezinka (3):
  drm/i915/selftests: Fix unlocked mm.stolen in reset selftest
  drm/i915/selftests: Limit stolen reset test to usable stolen
  drm/i915/selftests: take error_mutex in stolen reset test

 drivers/gpu/drm/i915/gt/selftest_reset.c | 52 ++++++++++++++++--------
 1 file changed, 34 insertions(+), 18 deletions(-)

-- 
2.56.1

