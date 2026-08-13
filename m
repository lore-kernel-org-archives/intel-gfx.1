Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8F7C5CFDB
	for <intel-gfx@archiver.kernel.org>; Thu, 13 Aug 2026 11:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E15510F2D9;
	Thu, 13 Aug 2026 11:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ap4pJ0tZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E454B10F2D9
 for <intel-gfx@lists.freedesktop.org>; Thu, 13 Aug 2026 11:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786621157; x=1818157157;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=cVZYXzEelAoiL7/MltoZgKfvXm4dn5eAwwXzDuEwyW0=;
 b=Ap4pJ0tZ8DCgxNCwhLaBTgwim7PB7U5Lpw974zFor3ue2R9cdUNpKeCj
 hX1emek+P6nlyF8rWZhUR8flEFq/28e2OGraQLnYe6YHd7qs9mImh+dHL
 9qR/wXt7QGIzwSzve7/NupkU2zvgk22u2i0871bZhpbiT2GSx3WZdjhl3
 EUl+8T30DAfaEPvlLnwsksRPUoFbDQfv5M52DgcS11tvQhCdCZp2mU2ym
 3q53qXK3FU9dGWC00qC3lhHM8cUWyca/vVvVkZHussns8UjyU7e33VZPC
 x9AOcMWdqaxhOtMFY6FWgh0/rf3bAswzAlESpfO3C7SjnWyZ1H2njuxJ7 Q==;
X-CSE-ConnectionGUID: Zy+WklG+Teq/Wtw4mehqlA==
X-CSE-MsgGUID: lBmQHkqbQ6KoEliqEzJ5tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87115931"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="87115931"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 04:39:17 -0700
X-CSE-ConnectionGUID: reiVJvuRTymh52NDnrn8lA==
X-CSE-MsgGUID: cxVZtWweSdaxQWqg/qFLUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="288704965"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 04:39:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 04:39:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 04:39:15 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 04:39:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pk0oNqk6LaOmVr9SnslOc82WI34KKitnKb6ao6V40aOP6vS0ejxNmILiwg5UDPnJXr2ssz0+yOt9nTEfKot6aiu23TgrMpHkJOc2uU0Q3EivENkOzXcbR1xNgwzw8+hnYeuCu5BIaQb0bPVgIgdwjFoNmF4oTz6BIUTuwlFMZxfhiPvREHGjGx3bWdMbcbzZN2emClwYZ24AZlYUzwCsxqEG7pxyoDpHMh8xl8orfh700xfq6uvWaoO+19kULtjVVVkshCyR2BeXmeULcOhUuB8usNkr5ySRjRJ1Esx5T+v5FoX8ELfbmNFsbSmzOwCDP33gO9jR7UXQebLmLejVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QLVPx+BPMpdZtdGG7rfINppdMMxILNLWWewJ9E59XA=;
 b=eISAotHL78oihYEqMAwlXWgPfSyjM7tMT4Fz+UF/hs1GMwKL/skyUdfulRZjmrWELJY8a+M5D82tunFz7fxf0V0Lyur17ILAH2LanooK3fuf6Idz6IRNYUJWls95R3LcH9f6lwZ41KsvW5GfIQKPBNhhZNeXZgO0Fk1wHJsLQvPQakWVF+ShJPsnJSYP3Tdko2TbTtwBtBabfX2FDeKoz9bOyhQghzSnhE2jrjQcBoBwWxqBGw/03I6WzuxU5XbzW5D9HcPBV2jNhxM5KdyVAPHxdMN504SSQXJkyj/krM75Bj467MqXBlwhsSg3TGLpY+zvYWwWtLYHbzDnYfQqnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by IA3PR11MB9422.namprd11.prod.outlook.com (2603:10b6:208:57e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 11:39:12 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 11:39:12 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@kernel.org>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH v2] drm/i915/selftests: Disable live_pphwsp_runtime on
 graphics version 12
Date: Thu, 13 Aug 2026 11:38:52 +0000
Message-ID: <20260813113852.1699374-1-krzysztof.karas@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIYP296CA0008.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::10) To SA3PR11MB7413.namprd11.prod.outlook.com
 (2603:10b6:806:31a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|IA3PR11MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: b10682c1-00f3-495b-2e1b-08def92f7ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|18002099003|56012099006|11063799006|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info: 6GFKZR5uuf1MqjAYodmomaDUyTTBw5R3UKqbTBxFknWGVTOEEBc/I9lautUn3nbKJimYBfy45jRkod1TpPxl+gnOflhIWlfCvh5+RuC78i7gzvGXChxfP9lNCFKcLwGXHKcr3OQ0jlUKeryAsbxCvYRsj+w+hF1k2iN6+zTYeoTj9F1bQYHkE4wJ78qYoUnlpDxD7x4wV495vlHHiKwkjorT47501clyja7oa5tZCZpLSqio1NAFhm4DePhCD4pf7qFBvsizLIHKBPEHzSFvj6e8sh79oXm1dEsNY7BF5j0gNwAkLxCpGF//KClzgCD3kks9drTYHXe8F9rny6iI8urvHJomOrw518VwVxSbmk4X1DMM2JbUvWb96FVcZglQtt+SML2F5vulM4Ich2xXaFkiaQB+EGv1gT9L7RI2eQ4F6QXReY2sbkx0fRnQjlhVXrd1621s1qJY8G/4OG2XIrTe6NgGueCbb/bRYF8/Q+Y6OsgNUPK+DHojGgAXujw/hl8epbnf8Yoefq0g3UK+ORoFnCn1I2xjCWI6PxyXMgpod+VHEuLwwo+x4IPbS34HswkRHBWApLl6aLb/mtKqwVYkb3ZVrQBJEubFrtUJlRUFcW8tiAtV4Y+9eisocRoz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(56012099006)(11063799006)(13003099007)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F4xDNGMHrc6i64xP3RqCIECo9mPoGYaswrjRbvpN9D3xX3s9+xKtLupklxEX?=
 =?us-ascii?Q?nEcku7UIhS5KxBtDt4P/4SBN7A257pShGBwV7GWONh+cQ+syzRrXDbkR9P0i?=
 =?us-ascii?Q?qYIB3Di/2hQotun5ptE8AgbLF9EYiR5ZPj4D1vZjBk9LpsEFNwRTOp0d9Bbs?=
 =?us-ascii?Q?GF/nUh7ufTmjOGzNlxEdpWpX3fyyNDh0KluE7sDEwZhw0Hm0M1fDV9Hlqo+6?=
 =?us-ascii?Q?C7Dlb8o3lX2O6Gl98CFRZkDLgNqMtbpf6DWDI5CZ3BnEUIxiT/EZ+ZGOp0AC?=
 =?us-ascii?Q?iJ753rG4pGka1SoO30LP4uQg3+2W4WhWxpdTZHCGVwzQCKSd6FIs3mtNM47k?=
 =?us-ascii?Q?V2Qa4PYvmj3PMx0MqkCYJVKWXEqAiO8F0uZ0mP2U8rxNWaAQEaLy31cwUaHF?=
 =?us-ascii?Q?8IJrmK1+JWxSJV3xX9aNHyi/8VQt39Eso2hPGQS6id8pfU1jM7u8wzgilNNl?=
 =?us-ascii?Q?e9kgS61fFMIhWtqr0Paehjanqucn62vwqTZ9pzFw5Dl4bixhN3cZMjHMBe3F?=
 =?us-ascii?Q?9B1bIyfHKACb82ySQpL8WBGRWxv5azZjNMx54JSyZkDGFncXysRerocHtQpP?=
 =?us-ascii?Q?hjtCvG+mUgeJqVufqX4m7shX5DL8q8jCBqPTmzp5qrVhdXBTwaW53Nzlgzvb?=
 =?us-ascii?Q?9GqARxptelJ5tnj1bFk5j7SVQNfrpvbaMsrsJVeTFn3yFGUCHs7DplMW7ptO?=
 =?us-ascii?Q?CZ46SgGcKqPMolS//KchxK7MZ1Tlkwun1a7LIk/DM7Ct/zKyN8q8/VVG3ANf?=
 =?us-ascii?Q?Hp4lgqoHPXjGI2rihcp9dsm/jG5GWQvdt0t7UNZ1noseISD7kBS64kOTuyXd?=
 =?us-ascii?Q?CVGx/qJrtPo7fGoRrhGHlPLPQVXqWT7xr1qHi5H3Wolu0rddrwhOh0pOpQp9?=
 =?us-ascii?Q?SPd/DXak9+HlRVuED0P3Gmtdp85kQA2iJxJpuyZGyWwZRg0N6UCf9k4PbuMP?=
 =?us-ascii?Q?BBC0r2KFFfjSAoIj/fc2UVI9F/CEjpSpczIv8DbhPDWOr0c+KLCE+1pStFMX?=
 =?us-ascii?Q?jjEqt5Txkvy/PvIkdW1LQTJOqbPfpQkaauAmUjKrFPnHJZiLHSDk5ASqsZtm?=
 =?us-ascii?Q?qqY3NG9sBtguxxWJq7Xt26Eoc7ijbQH2GlniBuyQ4RVQlXbeTAyy3ejfQh1P?=
 =?us-ascii?Q?1udM5YtsedIphXAqNwSYTbmHtaMebeAiY+UeY2Vg0dOf+cDLcCoQphg2g626?=
 =?us-ascii?Q?IClMPWOFI7kkLxmNplSpzC0Su0o4dJPhobRQg70+6eF+Cox+sPTPLUOnau2J?=
 =?us-ascii?Q?P1O8C0nNBiAAiQObZrIDiI1HCsP+ZYnhk6tUvdj78lnUSwfwPtiarZEyidDA?=
 =?us-ascii?Q?ykEm4p6YylLz0N9vNo8+JvPUACYqebhLJ6U8LymPRjFFKEe4mJsFrqo8o0G4?=
 =?us-ascii?Q?0OCeIJPHT2hltK9DOsb8wa5b9W2klIFRUcD11XVEJO82spEcsygEjJO2xQsg?=
 =?us-ascii?Q?BOgKTVBBGd2JLt5KhqBaBoGyFXjzakQmPkcYCW+aXeEr5IODl+NpTMci8IJy?=
 =?us-ascii?Q?AWpEJoiPvSjyPeu6MWc5buFiNE+bn5twfUafOHDm8SM8pmdn1OJNbsRfc+/A?=
 =?us-ascii?Q?cY/YsVrNlH7ahR3DyRreDjD1uY4mMBd2cWRwk+Wck3ojSt0nOL9Wn9yCfoo/?=
 =?us-ascii?Q?TgRhZ0bxeFQ1wJE8ncx9JA/ugXQEcvbIsb7/Dtm/Q5kuwCP9ukSXpOhvZ7kE?=
 =?us-ascii?Q?qH2f4o98+KMr9ohBZHJsRqsSGTA+KYtrA5fHcvblXqbsR4SPGbSX1Uqui0Vy?=
 =?us-ascii?Q?YlhgDTbRlV6vSd++fvgO9AWt2yklnxU=3D?=
X-Exchange-RoutingPolicyChecked: be1FUcqrgKGYf3Ja0m8yUhrmQPPoH0SLZpumSFCyhXnLKq3uK/om6aOTGkGi9J9E0qcgcqP6F1Phqj2d+uMyjGT55ISBOEf3O0JVKh5xjF7ZI8NtL1APgG/AzBy9OvWPFKdxtFfBozae+y3W2c7Ih0Jpr644SPQSs0ooh/unB5kXMN5W0eEIQvg8T0FN+fj+j0gsqmy3nQQONE8XMf20rYsEMBTX6VxFtxu5ajbQpoPNLYEHoGhAz9fXhwonpsoeCMwMbpSm1y95zhAGJaWY5Uah4I3SUH9Z92RxMTMyaIvjzWYq76ujhE17ENwV2ecO1fklgmbJulIi3d0k5eKxKQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b10682c1-00f3-495b-2e1b-08def92f7ea2
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 11:39:12.2005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YmdXrNtuhv/Ok5qYUDWQbNBTbZyVAv7hNWD87Ksde3OoB5tnYLRsbSQEAGSt7drd7vDQWIxqFfFlefCnP3qYixqMppni14Y53PnUqJFofFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9422
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

The timer delta in the driver is calculated using hardware
written value to PPHWSP/LRC image and previously stored value.
As seen in [1] this difference may become negative for graphics
version 12 as a cause of quirk in updating mechanism explained
in [2]. This, in turn, causes -EOVERFLOW to be thrown inside
live_pphwsp_runtime test.

Similar problem with gen 12 has been observed [3] and addressed
in [4], so follow suit and disable the test here as well.

[1] https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16521
[2] HSD #16010904313
[3] https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/13697
[4] "73782fc64793 (i915/gt/selftests: Disable lrc_timestamp test)"

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16521
Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 23f04f6f8fba..3be59324fdc1 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -1955,6 +1955,15 @@ static int live_pphwsp_runtime(void *arg)
 	enum intel_engine_id id;
 	int err = 0;
 
+	/*
+	 * On Gen12 (TGL/DG2) a hardware timestamp updating mechanism
+	 * could write a smaller than previously value to the register,
+	 * so CTX_TIMESTAMP would appear to go backwards, causing
+	 * sporadic underflow detections.
+	 */
+	if (GRAPHICS_VER(gt->i915) == 12)
+		return 0;
+
 	/*
 	 * Check that cumulative context runtime as stored in the pphwsp[16]
 	 * is monotonic.
-- 
2.34.1

