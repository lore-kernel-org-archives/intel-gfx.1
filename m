Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70AECA5FA5
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2026 11:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D92710E9D7;
	Tue, 29 Sep 2026 11:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOTSIH6p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4421810E9D7
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Sep 2026 11:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790680412; x=1822216412;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=d+67OLA2cXRfx5zYrL9zEqL3ddVlGdwGxIf8mjDLbIg=;
 b=mOTSIH6pwUqMBU8qG6fDM8iBdV7mgoKfd6etYUxSKJbg2PTH6A5EAZW3
 8Jqiwu7DjL5mj5HwbFoEPCU3ftUXS5NXCp1GjNfhuX0ZVleFQHSCHfUfK
 EF04T09CqnzVVY3ZB47oIPab4yzwEXxsmNJWB9Go1KBF2t9EbvFq4odTu
 +NXaGkDJ2ayuySZUYggHnFsC9DKTW6sJb8b8xaArVtO1/uReiOUG1jnCR
 gVqQRq777i8JkIJ4TSyz+NVKwSuot6c/ozit8oNHp4nImyrC+JWjm9LPs
 pyeDOVhBzRhaaK8r/iUE/mszaN/E2KVSWJ/XkJWllc3V2dsFfnnW8FWyP A==;
X-CSE-ConnectionGUID: GZZXAsVmQIqNuSx2d3Sq7A==
X-CSE-MsgGUID: ERe7pwZpR4KB5GTEs9rfuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90526134"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90526134"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:13:32 -0700
X-CSE-ConnectionGUID: ZMFp5re/R+6C/Vs2+Dg2yg==
X-CSE-MsgGUID: 6gPjmMz7QQmWwXokpHF1Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275489691"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:13:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 04:13:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 04:13:31 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.37)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 04:13:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+4ITsJHcJxKEscJILeKt84iwYmc626s1/tdF/LbAGx74Th69nkRhrJg7oU7XWKDVOmJBmYZo6C2aZNPzjO7ITXDjXdTazXw4vnknUEJEOD+jso73rP+Z9KDt96Mk8WiuneJ4D/1K5udTg0YSKIJIUsK/sQaPFRqnjlIH60riQt3xpqJki7CNDqY3ixKQE89k6dOoMeCOImZOA+nmyPZeCiappiGY11a0AJuuoPR4KNwXKCj+rVEejBPClKj95IUCkdNDFOJPw92aP/yZR4jzcvgl3eEpeojo+xKTxcl+o1LLz9szlxhHSSnLON2Bu4Bc2R/j3AZv7t2CbZBXB316w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUjW8RcvKoC0fSzMe2fIyroPjG8svJdoDJmk6uyI7po=;
 b=g7wmk6LNHCLONTs3NZrOM9IN8p5hi0RhTcKVw3gu8Uj9IfAHYfF8BtMkoQNxHxXmk2BbM0PTke4Cl3E2tjdDmnKFal+nCV/Y4N8YTLFPQUaLHMpBPJyugOwStieGjcqEQ82tHAProgNYHOcS/bIdGHk9LWZmJ4ok5mH/POCmiUhBHxtrecKCyJ1Vu8jtg7pRpRQbchXo4BxVf7+uQw2hu6p9+OLmM37J/KrQLqJm3U1j8IdIGAq7pTmRWN4ncBNKFg+BxVCaMNo3RoTmJWyhrVzeUQsE7dGVCrUQSViJN0m+c6nHM7FrjcO6d7cD2WUf+pgYjJrt4fOQ0cbPeDjC3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by LV2PR11MB184224.namprd11.prod.outlook.com (2603:10b6:408:411::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 11:13:24 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 11:13:24 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH] drm/i915/gt: Do not destroy uninitialized timer
Date: Tue, 29 Sep 2026 11:12:59 +0000
Message-ID: <20260929111259.2359138-1-krzysztof.karas@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0116.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::15) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|LV2PR11MB184224:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ad8b40-9d40-4c11-b84f-08df1e1aad85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|6133799003|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: VeNRuUFMwlaWSoxRpSB8O49JwjOEypddsETv9h2HWJGavi7C4RUF34YqHuXFWkNLoawKK24kkjmCEzxuQzKxSdTp1YC3U2p1FcaPfbOylOVVhUgTAUYYPuyHy+ymyGlkLK+IuDS+peiSvCOFopn8rs6TBgmE1WrIeo0cMb1pKgKFJMl/6iY3O/Pxav/c7pAMLi/P90J5KFhopOak14HIEoMsegPFLvIBBN4oZXt7k5vezXOs4AJ0GAzqsxdFEdHaFcxaaJcVdVx1UUHZFScR36aI3Mtixjbx4ZFTlG+0nqTjoz5VzJSau/OpoDjcxPqg/9flEOiSE+p40SkLg4nygV86yv8/r7TPS4wl4mrU1TtWGUmA6yRKWhOD6cTyPTCgbwdTlUEUbBt2D8+OelDO8+440G7nIQNEGv4QhzmhWaHBsf4TFwsszHEqsCixH2gwqQjyodkV7vJKz1HT+NBa6xplAprEP1GI/Dbc0QRRcNWTeQL2ZkVf2qsNVos1eW9Q9PoQzvZMuKp8jSIanyGroSfTKg552CcZxfkqelgy/ZZjX30uzOZAW2NJxYOJfhvbTTnuZhcl9lXUh4wFXp2fuXaGoKnPyAC/UFqRoQG2lCEY8EXGNFO/tW0ojFaZ9McHSF8F0psidcR5HE5QrOFU4S6jQhJRW1sNhN5VPvYSouQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(6133799003)(10067099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DakwVy8D5QRhAw6pm4J9teP+B2gqoKTn+BE4lhybH7jAJdlqLTroBgOFZx6V?=
 =?us-ascii?Q?xKNDwEOZ1vo8Ej7JLrJOR6NgDlqYsGMzyBBrMoDqG4ZsrItjszpnktat0Rfj?=
 =?us-ascii?Q?H41AhdWX/4IyF0PKN/wSDojTSNzXMu0RiD7Oyv4/vUvoC0d9Glp4ghJaqVfN?=
 =?us-ascii?Q?Itt3wTn3bXtWeIRj/V15A3WxF7QDX2wX037KmjBBNHYlmkCGMz+1Ccf9f9uc?=
 =?us-ascii?Q?vtN7V4Py6HlTKXHohV0/5LJpYaZQBAPmgPnsx6/aKwGDcYUTWf829NzflK48?=
 =?us-ascii?Q?DgvIBF1U0qRANy4es15pdbXx9Tua50+XzNHKmhZGjAst17cUAwaEyIE5WqLC?=
 =?us-ascii?Q?ggJWVXhCDWmc0TaI9Ua5YAcXlexMw5UMRfaZUGqvojFNNurxT6hNSEuQCJbU?=
 =?us-ascii?Q?H/sKnYGldJ2W+EsP0g62GPAEmSlEjcWkHA4kXoB8MMg/dyo/3RbaWztEPqNl?=
 =?us-ascii?Q?8BytrjDMjMckCDv1Rb9Ma5X8QJ1JF9mmw612TqIGvj0fRGVlamN5u4urM/Hq?=
 =?us-ascii?Q?SMfuaQHLhaDxcLZpOT98DK6oRJhEHHz8ZBt1xN6nzLphFHzTascg0bW37Rbo?=
 =?us-ascii?Q?OWg1n8ws/xCXIu5uK9g3Xy0Ir35HigqY+CBFMl3V1Fc9jyMz7Y79599mbmHM?=
 =?us-ascii?Q?0Aj4st5U7majbM85ATbgTIPPx89vnzq3MzrTk2qvI6ccMiNXVb9vLFCMiBFZ?=
 =?us-ascii?Q?0N3MSea/wNV6lTP96CnHv53X/2jhz3RHdA+LCyBlQ2mkM6EhtlIfmIx9gzZr?=
 =?us-ascii?Q?RHYGYqi8bV40nm9Hw6HTgkGHWGMZcOWy/yp3dneQvUZ4817W73dvSt79oGGF?=
 =?us-ascii?Q?vl8wQi/+KlGZvqz8KCW/vuWEFj7+BD5OoMTHo61EOgLw5WqnuDa3JeOFt0jk?=
 =?us-ascii?Q?ci1ieziNKkUiuYv0Q4jBnDKokEnp5mriB3IShgsS/Iy4+UnbFbZUwocCnN8e?=
 =?us-ascii?Q?8lTsiI/1ZD/dwyL8ukiVGw+0tKcVCjmcgpkMHd3PLL5MVwQ7rSVyjV3r85n3?=
 =?us-ascii?Q?WBgCuFkyzfWgmTslPeZXocIdpicu3KXxbx9Obd0SaA51ZFz1GO2aUf8k+E4y?=
 =?us-ascii?Q?To3cHDTNN5m22P2J48PSRBkqhMOG1EuLbWLK7/FFl4SvirUtxRV7uI9TRDSG?=
 =?us-ascii?Q?dc1S59b1/f4nX+aObL5k5P1RL2pyusrolHNoz8M478UeM6V9z1v/kDpEZf4K?=
 =?us-ascii?Q?CWEsf9l2iJSTPxA84PKeEQYvY+GSZG13H6xVf6OqoaHYgWfEXx3v6xKpGSAm?=
 =?us-ascii?Q?xzoVhEJ1xvb3zhvhMi4RL21uXw5sBWw7XXf3Jpv9tlqJA1VHzxLoEJa3rnFF?=
 =?us-ascii?Q?JLq5POTNWeMw0RZveQcs9Ja5pZIaD7OrbBjmb84HLUzoPHrSjYnMjqFK3//4?=
 =?us-ascii?Q?1zJXgMEryVHNFUKTb9rkk8IX+6qfku9YOJYIYj2znMz/28SE9AhNpQb4QW3s?=
 =?us-ascii?Q?/J5Hzp37QZiH/X2gA9d70nUPff9ESy++VfYM/vRxV79HrjZHQV5IRzlR1eLE?=
 =?us-ascii?Q?FhFqijsCiPV6WGlZTBLq8knNNuZfCj51sCHf3f1TeXPbg/CGsJG5l23fIu9j?=
 =?us-ascii?Q?vX/W7XerOyxbZIpczUB37slRD13C9HDESwD2I0MUs9j0+VR1+z7+5lAcnDU2?=
 =?us-ascii?Q?WBqJBEILWe1QLEcy7xwsXiGfFBTx12fjSDyv5Ylln6yqZpFTdvZfG0BLZNxY?=
 =?us-ascii?Q?F6nkkM+TH2Vft3YuFMoZNN9rYdRW9m84Z32xOgDdiwEdN7k2/qdLUNrkcnUx?=
 =?us-ascii?Q?3Zo7RzTdLWCyigokGdidbaAGOOgUmTw=3D?=
X-Exchange-RoutingPolicyChecked: LAJOUjrfmwe5vTC5cUn/hFzosQ2kX4d7Nn9lsWAmhNFmb6JRuqq7QkZhBu6lhMsZUyfgRf6Mx0pWXkNZkytHtNj6TXcinWJogTXQRq5yNoB0VvOqHATpw5FHLbgb1R/RNw2bI/J/SvmMuJ0DNMRMhra+uUxe7+5BMVP+vRDPFL3M9fcDgsm7c5w8V22Kh0XS8/8C6GOY1C6XRS8NBf+Lr2/9eL+PEo7zWIU2njg72y7pflvIpdLxGblpZfQL+00a2bVfro45JQqU7liM0FMm65XUdjVfe7Snr+T4vSchUM9t13ZZVzBAUYGwg6wwk112CQyMHcnb9WFwH7AD0ZuokA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ad8b40-9d40-4c11-b84f-08df1e1aad85
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 11:13:24.0869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjD3kQYa1HaT4c4eHMjFKvuSsgdj50mivFyh/8Ykfog6TDQ0NqoYtpYJk+acAVpSaoxsn3DPcZBUwvbw4XkMlScXZ/07xhEsNI8i6NOYtYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB184224
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

If intel_ring_begin() fails in live_emit_pte_full_ring(), then
cleanup is performed on an uninitialized timer.

Check if the timer has been set up, before trying to remove it.

Assisted-by: Copilot-Claude-Opus-5
Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_migrate.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index 5b986a7687d9..6793ba028146 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -552,6 +552,7 @@ static int live_emit_pte_full_ring(void *arg)
 	struct intel_context *ce;
 	struct i915_request *rq, *prev;
 	struct spinner_timer st;
+	bool timer_set = false;
 	struct sgt_dma it;
 	int len, sz, err;
 	u32 *cs;
@@ -641,6 +642,7 @@ static int live_emit_pte_full_ring(void *arg)
 
 	timer_setup_on_stack(&st.timer, spinner_kill, 0);
 	mod_timer(&st.timer, jiffies + 2 * HZ);
+	timer_set = true;
 
 	/*
 	 * This should wait for the spinner to be killed, otherwise we should go
@@ -660,8 +662,10 @@ static int live_emit_pte_full_ring(void *arg)
 
 out_rq:
 	i915_request_add(rq); /* GEM_BUG_ON(rq->reserved_space > ring->space)? */
-	timer_delete_sync(&st.timer);
-	timer_destroy_on_stack(&st.timer);
+	if (timer_set) {
+		timer_delete_sync(&st.timer);
+		timer_destroy_on_stack(&st.timer);
+	}
 out_unpin:
 	intel_context_unpin(ce);
 out_put:
-- 
2.34.1

