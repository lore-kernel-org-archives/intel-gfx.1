Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F5E606A31A
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2026 12:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aVWJ8hd0;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=e7ewy0QV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D12710ED7E;
	Mon, 23 Nov 2026 12:02:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356F810ED77
 for <intel-gfx@lists.freedesktop.org>; Mon, 23 Nov 2026 12:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795435368; x=1826971368;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=7vAPAzYgKyOkaPFbsP0TIpbZPvgannTaXzHvYQLsqdQ=;
 b=aVWJ8hd0WujMqQz282MHD9YzqjUmEAw00uEn9DQQgz3/AZmDvgx0gECF
 q0VcvKz12xCl+O4zcFv5WaGvgD25v6P7Gn6/z4Dfqqx7aqmoA0wesSSGf
 8djUteIV7/Loen53t719tB6uA4jstRPPxRgeayhZZU3TyPE8DPx/JPoyI
 xX8OQueI2uAdpJYA/FoWT4q7wx7HlF89V8chu/+FaX1XSyk8+VIWiduvJ
 ZHwEmdw4gbJts9xYoRV/CicRWpI7j5yQJM3pXnH9rTjPMtcTqfrpieNTE
 FRkrWxwujutDUb9OoOMRqVYHHdRuatY5RhQNkdDLTbpqgLxTDGc1V4Eik g==;
X-CSE-ConnectionGUID: L8tdR7ObSheM4ODmLSMLrw==
X-CSE-MsgGUID: X937h1BMTG69J33+Qnd8Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4221392"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4221392"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 04:02:24 -0800
X-CSE-ConnectionGUID: aV4/xgK2Rve8ry6viHtRuw==
X-CSE-MsgGUID: 5PswP7i4T0+c2QzLX9IgYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11701175"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 04:02:20 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 04:02:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 04:02:19 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 04:02:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epN/yqf3YvnrK3N7J3bIEqiC6xI7GlAY4rW67I8u5EyKePxig7SRjMkhnPYqggJeLDFiLuagriY1RndDw3wTsQfUWY2DrZ1KY+SfhGfi1aHbYu0+fS7ivzlNEpbVPcondehqDmitK2uTG88ZG8Y5igy6rAfCbD1AhjCth2wpeKHML7m+kFwuMUR6ui7IQ4/sjodRY6Nua4N3oPkNLn0o7Pja9Op6h+jVt6/MjsSOb03N5maOHoufGAzH6GOrSAfqTsB1pSGDuqwdctESiqk3+YxszSt9ONGwCg4dv2rfNynbSGJ7SK4cKnVW3SJTS1nTcLsCL9Pgc2HuNGAb0kf6cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YK14JBGWDmAjRSStmqJF6IZnu6pkwGmpcWIQSai1rGU=;
 b=O+mTl7GbueH/plKfICE8XJE1DanuHKihxfxfnCuoJ6xVBNd/11y7+ORq0U/+q9lCVK3HhdD0KqNUmmnMX2lPp8GW57OQ0j20kTGoVrHSFSeg06EtFCgv2vLtTUCSJKo+p9cKK/BKBSHUyIULE05z1mVfiGuVlaY1/0rKrG1yM7qq9xHXfcqOpzQl3YJlWxelTklL5cU9NNdZ74AlZk+tzBUB1UBq8EgQsQFHImPJ+lN3TQ8WbgI/mA04OkhMiNJ8lUWNXg2hE8t2px7byxuVkjCtPBt+fqKs9saSl8qAfPB7B0hhYL5VR46Eg8WBvoTsI7JzdWGxc2hIB6d2JBug2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YK14JBGWDmAjRSStmqJF6IZnu6pkwGmpcWIQSai1rGU=;
 b=e7ewy0QV4P+Iu3pCb+pXXepdJzuTdbsKGaHE7HUqhIlJNoyZAeBC15Ub3x79M0DzFfRg90AotcM8cR0ahvWRaFouwR139nF9CLfhVUQkULXxYllADoj/P5IntspiUM0E/EKRFv6/+kFGgp8FxVP3FgVJftTTtiAIzy/Yy1mI/kw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 12:02:03 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0639.010; Mon, 23 Nov 2026
 12:02:03 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH v2 0/2] drm/i915: Annotate flexible array members with
 __counted_by() attribute
Date: Mon, 23 Nov 2026 12:01:35 +0000
Message-Id: <20261123120137.3460155-1-krzysztof.karas@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL0P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::18) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|SA1PR11MB5900:EE_
X-MS-Office365-Filtering-Correlation-Id: e750dad1-855c-43b2-5127-08df495995fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|261028144727099003|11063799006|56012099006|261021121427099003|261021123027099003|261026140227099003|261022105027099003|261022075727099003|261009223027099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info: DE4eMb1/A6ht+exRG3sy3rn3hVfgvlEaK/r2b9/htEXMb6XFOBLuCUKOIhOmHlW2/k0KspvTw/FZ3I0qMmrm4RZCPGS71RTV7Xy0DpV5uzlmZm4NFR3pMsG91dHMs9Z7VI9nBK+8hOh0LmcngjuIzg8ZVvQJ9M7S+r33f3an3GPtbAKM+DmlbL8z0bQ5nixwiCeh7RE3+3bo+hzUdJ5P/Rme8a3T5ntlPZYwvQPg+WP+A0XDF8nchxuAJtMcawv6c747/NQ1X/MA+Zc5OInwAdHqx5nguQzkFa/jDT1/YPD17F+IPO0eUuQH4UVBYUd37cjxcu0Xtxjxs4wjpuV715MJ5IPhiVakVUB0hKLZdIEqpxulPmd36i7IkJF8CCiSP5g1ZHzHD+ZHP5l0WcdTorS2MP93jnLHg2l+qjqFz9ZhYdswUrlKyfx2nYPc2E5dO1+d/OkzTPs7WBBYPRieRX1odwtkLxn0h8GcbQUBB6YKhbcSD2chHKal7PJ0Sg0CleP1a3ClgHAeXlVhVscruKerjk6TS0hPBqHTYXdI9p3KhRaYtiv8udQGqIvCWuBO+NeQ/hnSF5b6d9MbZLTd2SSShD38VswiH8y6jYJk3pNY4jZClDj7Cy61/Dg2LYUBW0PD15Yy4zlhurVpUV5APFRtPyhAiw+9NvTY41eph8k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(261028144727099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261026140227099003)(261022105027099003)(261022075727099003)(261009223027099003)(261102123227099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Np14e4HaSg2P/a6dB80EQfebpR7Sizh66xw10MVTkEoJ0iOpsGZDDSP0u/eK?=
 =?us-ascii?Q?pBTyX3tJ7a9jtDiJ9OmCJGTQ2R8Dwkgup1Vp7weIuSsFc+xC/TyqSGL6AbHc?=
 =?us-ascii?Q?7jwENHTlCGwAOAQq84xqtkUzbxXGeYQLO8VltjVlMgr+KR85m/JfjfbjXYTQ?=
 =?us-ascii?Q?TrYvDbYCVBTZACIPoFUK1tQpT0AbuVYLtVz2IDdqOniIstyJJnS2Vo8M5Snu?=
 =?us-ascii?Q?4TtULcLaXu61Yq0tL8/a2IK0i6iPEhQ7Kym3RvdHOHtUxF3RxO+/YMR+Ma7K?=
 =?us-ascii?Q?7WKpB9T+UAHZTRm+kNhPFcrvEMX7/7jESCMPICm5EhkMlBzf5iYlgRNQfCkT?=
 =?us-ascii?Q?vCrbtl8cQClHOPo7Qdhj48NRoHRH9H7soixIYOmlYn/nR4V3oryKwa9RVGm/?=
 =?us-ascii?Q?tMioglZ7J/knRC3VToaZLySRR/1MOoPXGtxtHMHAme9QFtOWx3UBnK5vK/mj?=
 =?us-ascii?Q?Qu/ygYYxr87uw93iFUWOW8DcFPyqR+0b8kwjCAayFUvnszQr3NMop1BBETiI?=
 =?us-ascii?Q?gmexVnNql0BPOxsFIFryPuq3iaF4O8Y+9IpwVdO6T4JlYNcMuVvuYyTnWc24?=
 =?us-ascii?Q?mJ4RkxlgctuEl4MKIzzAVo+F+vwqv0dhdld9kbQ6bIyi1ehyS5mtIiMBmA2O?=
 =?us-ascii?Q?RXiizAI2McGzPh2jvmGVvx5gohhHYWbO0b6fxEDlQtIjTCmHLPD4f0EnrDu5?=
 =?us-ascii?Q?s1nb8EzXXf3uRxt4zO/97P5+WhQ6gYH//6CY8PDWWEvWONEkTeDCM2DmjYnJ?=
 =?us-ascii?Q?g9JLBeEdeLs2AuTTyD8Yx6LBC5//tf2WjuApxNz2PVF/TrAyIJfA8OIr6dIi?=
 =?us-ascii?Q?9mr5o2GzMmkfROebkyhjdHqWabf1Y4WeDoCuLPcIvFevAUX2RegSIP6Uuwze?=
 =?us-ascii?Q?l9v5zt7Hr9ltUmDsF4+KpCwiBpw2W9tLb3jDsXZWpFf9cC1xQB/8ErJDsbK7?=
 =?us-ascii?Q?PBiPy93l5fDL9l9kxRztx2kiJConZ2mZRSvQMW5Ar8gEYaTTWkl/fE8Pa3R2?=
 =?us-ascii?Q?Zsput8o9yanSNKzxRlJ2gqY3bzmBGS4PvXZ8faM8OskqEgaZNwt2i2grS6ST?=
 =?us-ascii?Q?ZbC9lidjgoWp9fyo+rnjIYIqJQWdqY3DcKhT3FLccqzjBc+tmYntxG3xV7Us?=
 =?us-ascii?Q?Gz345qThHOG3n61B9Siok00+mSITsFMp2Xo+WA643PduJ5/AhNxa1sREjsnI?=
 =?us-ascii?Q?S6PzMgKvEg2dpKM7taBqp42VF/w2ZY4pOcRdjYMomHhwcv+tkdFpFD4bag4e?=
 =?us-ascii?Q?yEkTG6Q3uFIyF/MdNB1IxXRN1RXHyKpBLWQgd7BCQsEUDElg6rjeIVRSfhI9?=
 =?us-ascii?Q?txP2QlACQ3Ua5G6boO1hm6E2Ax+Y20VUEfyxyN3i+ELYtJ7ZG23cy0HxvDwx?=
 =?us-ascii?Q?cPITWc5P06KDNbDBhF0GERrROMtUSnoDK5b+vqXBHG0c5AeH7iljDAY5sNfJ?=
 =?us-ascii?Q?7H3a0LfBKWznLlPCN5RDPqk7zOFHLAbpomAkZVG7mDbNycwgYjWavE4yaeBz?=
 =?us-ascii?Q?trEdPKvF7X5/Dnyz+gxB/jSNuaIIZt7C40wkgDgYQd5TmVKmwcikyo5RnPKV?=
 =?us-ascii?Q?35+hU9sceebygmLv/j2yovqNuh4QKtDAhnHY/G92jDqqnB+IehfrPrTFzeYr?=
 =?us-ascii?Q?wup4wGK8K82D3IfgWoZ2gDC9y9pZd3S/jTnEnVXb2QAFbyG7WKAaFqGCt3TK?=
 =?us-ascii?Q?So8dWl6ZctxVffj6Y3eBlEoux4QPk3xHDj+ZrV60296S8V1SOrqUMUqhBOcP?=
 =?us-ascii?Q?muRV5EvY0u/TVKIhAqSZwcqZ3EUZHXk=3D?=
X-Exchange-RoutingPolicyChecked: PlfXJ6wf6r56kkNKYHRItYL8ekAlljCQt34Xs6V4MKPJDZgO4VqnGEzQ9CEcSX+mB2Enl8xX7S7mXN5kTRAfKQzzlmM0ECnklgvChGPSpyJlTcoPOPzhYFdKyCp1ujAZeGH7z6YPddWcUyyGbAPZTrXsHhJ3u2EZsfHZJ3DbtAe+kuP1K5bCJimKPTXrnh1y7n6Tc2jOgLqnBN8H3hBD3f942bHf5uvfH4z2WidawYW2DLMgw0a0O34QIlGQgIpTc/DTK4AohqB8k1Gk9Bxi0GEjgLQC9igz8INXzXGVjubNfIkVVhHOoFfpZnNiKi7qTu1ejU/E3M4/I66JL3bw9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: e750dad1-855c-43b2-5127-08df495995fc
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 12:02:02.9897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyf7lW3jFrrom47fNUeyiEdOx3D0UOfPBKvwzb4K8+CFTBaTpsEQEHlflgXw4HA93Or/zFe/Vt1H1ttC2CIKc6GDDXB4mf3jwxbgMWeg9I8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5900
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

v2:
 * Remove display changes due to no real benefit (Ville).
 * Index memory regions only after checking if their 'private'
   property is set (sashiko).

Krzysztof Karas (2):
  drm/i915: Annotate flexible array members that require minimal changes
  drm/i915/query: Use __counted_by() to annotate flexible arrays

 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   6 +-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   2 +-
 .../gpu/drm/i915/gem/selftests/mock_dmabuf.h  |   2 +-
 .../drm/i915/gt/intel_execlists_submission.c  |   6 +-
 drivers/gpu/drm/i915/i915_query.c             | 102 +++++++++---------
 include/uapi/drm/i915_drm.h                   |   9 +-
 6 files changed, 71 insertions(+), 56 deletions(-)

-- 
2.34.1

