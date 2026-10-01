Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D24CA5FB3
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2026 07:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79C210F5A9;
	Thu,  1 Oct 2026 07:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbDragRt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40EE10F5A9
 for <intel-gfx@lists.freedesktop.org>; Thu,  1 Oct 2026 07:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790839098; x=1822375098;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=t+DOWkuaWWaEnIMiCNbrNaURx+bDV83wPQqiTcpbn/Q=;
 b=lbDragRtNpc0zUQeRDvly8Q/8AU8IHs5J2GmRbPJQkk/BuFJReqUI3zk
 n5M7lqJ3umPH1TuMfaDZl2BwwyRD7BEpRIy404LROQofE8lZGUKUbiZj+
 x8OVSAd7BXrmHY3z7R9ShvhEg3zu1wzW3vWj2zv9/yEWlPh3kzYK/w04a
 drgSGvMyFlHH2Ibhdz2y1aIKwtIRp4oE6xclhJ/LovBScxHfg8a4FY6uP
 M/KYhDpWHNJ+O7wQg+tIoxeL3VW0btIpL7GZJ9jYa9fFPjvwAJjqwex+L
 wiNhecZwlC2PsbH83qd6Gm7eG7mjcZENFjRBj740OvVj8kEH8yj8aX5sT A==;
X-CSE-ConnectionGUID: N18ARfYxSIaFBo/lDFFcng==
X-CSE-MsgGUID: ga9//zyJQhywdHCBMldNUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91451018"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91451018"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:18:17 -0700
X-CSE-ConnectionGUID: T5oZtZWNTfOGVvHOut3/pQ==
X-CSE-MsgGUID: r4t1tNBAQZSWd7byhYtfkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="276050943"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:18:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 00:18:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 00:18:17 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 00:18:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0tPkUoESqDRizziRoX8T0e2TZ6XFMgjHdAlAkMh5yEIOputrHIaOhbymfS5105oAnO8TYgeNDof3wEIJeKAkre6oWq16vaBNR3MwN/wreIjIr0M8QroctEcAgJlx8LZ0HTzI3+ZFLVPc5tvvR99rSBCrACib52H3ZCH9IEqQCB1BXlSVjF+g+WZR6Fziwgl9c5LNd5M3yOx+rP0cWN2RYOVMM6IGlgCkcgj+n8Rwpm3+vlTdGym8wxPx4zY60124StX/brLwQ44DDcrwKbWgMP51/ZXtCA3Xgb3YeKdD8hOUE7qBUCl5T0dTNv4DRkH+CpAB0rc4G3cKaCnX6CkSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9V2Tsv4Ipu4mX6t6fCuyYAusvm+j4bCO9bs9IqhG+ao=;
 b=eGbaEqwT55wfWi36/bv6LmhZYvqjWFaUf1I5gr9rr2GINKB8S7hIZjUElCkz0cT2W0VjM1SIAGM/Ap3R+J6uuqtODBre6ds7LdmNPYum6nlxfwT/GW8dg0Vo64suzNNhTIIylyxP+80zil2AOMLugE7Ldb9gJRK5T5q/ox4mJe9qK6aYzkoP+SU90TlVeNSMDplH5pO/XEi1PYu85/KixJn/lgI9BPoKugWiUxwEWPO5P1b8ruQQY9nVmvq4MVhPknHa0SBhvDtxv1cEBnzmjvwZIPxrmZMDsibABMP1sq0ZkIxy3WkGiyvCEHtxUH3sXA04/rS20+wYRpX1gXWHCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by LV2PR11MB155101.namprd11.prod.outlook.com (2603:10b6:408:417::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 07:18:09 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 07:18:09 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH v2] drm/i915/gt: Do not destroy uninitialized timer
Date: Thu, 1 Oct 2026 07:17:57 +0000
Message-ID: <20261001071757.2688815-1-krzysztof.karas@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TLZP290CA0015.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::11) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|LV2PR11MB155101:EE_
X-MS-Office365-Filtering-Correlation-Id: ef13a421-bad2-408e-da54-08df1f8c2557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: cMZFsURtghtjMA4SlllM5l1xnvR4TVdbHrsbqmzdsKlqV6KostFxrEIzPznv8vU92a0a5xEN0iogRA7aKCcs2lY6HeuApDgTTyccjCuX6R/WonbqJhti+YohNlnn9STLP+Mk/nqQD2b/0UcPjsk8oEdXHMy05hLf8XMW8yNdI0wdZSF9CwdmOXzrpN1YHlABXj6f+eKfZAi/n54vXyg1ZaRu+bVLJvqJgH1DOWYiF1Tk2vL3swa3Do/Zy2XsaibWPhQPLUPOnXSXqemt2DdSgbg0TBZQw8ufhMAgScStyTmaeYkf8k9fewqGv/SwLg1Nrvy1J5SI/19BjU65Me4xKIbSP1SgKu/I+6b9rc2xByiXHe/6PFA3eVjikA03ujwZUQKa32VkGilk/hPKTpuz3NZPWgrH1Vke/lZJl/MecVfnGck4AR5+rnlY+3jU+1Nos8Ok7gOOWXW6rfMZ71JCjzMxmzCNiArRzq75dKf59y1+Yj4ueQIAKDHR11kPtg0f7YmxaNlwU+kuPipstcj+zS7SJwSg4ZlDT4BxqQHAW17cLOENLyP/uACLQ2gqfpZuLmyLktTxQFgMgO1S9O4o+psTiT4oXoVqew9wclsJTA2z2eKY+u1T32pTxrvwRyAyroKvJl7SOkSb24CnoX8qUZwNxrtyZYjd/QhgYTBnyDY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9YmtL2LBc7FRpHxVkd70Xb++cXBghBXz2BDCtjbz2apoqezSoguzCWaJj/4E?=
 =?us-ascii?Q?sBNy8oc0ybSPpazDknJ9MJ/+9L/OJxiIKbiwb0+ArOud7Q+OlEbBHFmPBGN+?=
 =?us-ascii?Q?F2egoakwvQl/kWCkWgDYIUJ4w3GOB5j8LYgMngbJUn1hWqEr5maw+a/jgcw8?=
 =?us-ascii?Q?YZQXPOKq51sIYik50AlWnwMTdBpbs+ir7lN5eqXRUKGRxwpYOlvqQfmqTfpg?=
 =?us-ascii?Q?pmeQwO9tCSC1IuXQLKf2bkawx/TzDY+uclij0QACpz8KiZcwoTJlpwjxorhF?=
 =?us-ascii?Q?GA1kxJ0FX/n+0xxMFzdKBQcgfbtUFJ6sMugnbCi5Wzjdd8QHAIHvGbkQ2WdZ?=
 =?us-ascii?Q?h5e2WZzsBXaIL5TgiQR3Jg1ZLcWtdk2Y2Se44+CnB3k84OhDwvIRihLEVK8u?=
 =?us-ascii?Q?Pgk8WZxEuHqb+UDGsln2UTx9+hOHjxDM+WBdYUckcxApPkMBgDbgcMHtb7C4?=
 =?us-ascii?Q?ouYJBGqg4I7gaSzcpxkCM/EDAohrS6OyOchxo8HMoBYixbiCuMdHCjNWVQBG?=
 =?us-ascii?Q?oRBw/NxmWQEmwPFTsia4zCw0GXzjwW0sf29jU2oU3xkUreMYj4V4SxWRY9pR?=
 =?us-ascii?Q?C1pbWX+Di8AxQT2hVna6Fkj4fOxsz0DUfVuTBhCZBTr48+RTdq7w/jY0xjaU?=
 =?us-ascii?Q?LkC++HP2ZttDPWdjWJ8CkGlS72GoVsnsI/dk8qhspdQpYsx7z4AhcvPNsv1k?=
 =?us-ascii?Q?O/N2k69RpfHC088rLbLGjX20mlWRv6rjbCJThEcQHtlOTTh1yql9DshiBSik?=
 =?us-ascii?Q?NXEGcFG/AtnVBS7JEHtgT4jBAVMDn+2La0qAcOLpUy6Y0MD7ceD5qmyKwj49?=
 =?us-ascii?Q?mMxyqVASYC1iA59wLjaG5aQtmd+vo6Sqcgz3rSF3BZaTrykAuEe1BOiMc70t?=
 =?us-ascii?Q?1k728RmJjJ/ILMDXPd6EWunneUeGUXQ7Lay+NwFcFeP8GOpUyiniO3QGj8OH?=
 =?us-ascii?Q?fbzuVTWmM34wFWizwupV24cT2Hf+iWlRy6pDmVPOUPE9hJnnrRT6YeIytOSD?=
 =?us-ascii?Q?jSO771P40v/TPe102fcyrP2gY8ymMrVpiqfK1JI1h54Ellm+VdTIXMvKWi4S?=
 =?us-ascii?Q?dbW8oY5uDU0/OTKE8Dp3VMj/eyt73BRsyihUP1xcbYFCI9Mx6KDAIBEMdqyo?=
 =?us-ascii?Q?4pSUCi+Ymbbtx1syuF1WEZ0gm2d4hqaHBd0Ey8JUlChbtEtlU0Sckahe++6Y?=
 =?us-ascii?Q?WfOegi5rTdtYqOj9EvrylNbxio7F97vk7BQjm29CLEjkQdMFc0mXAtphz0JN?=
 =?us-ascii?Q?HswPiDDP6ISUBPlEDL8WPXuGya2YIQY6GhLER5z2RPdCNu/gBI9W/s0d/2b8?=
 =?us-ascii?Q?bOX7PuaSVxi0FF8wRodDq8IxXP+Z6dcK2sHgd5LP3SJUSGsO9kAVMqhz/JDc?=
 =?us-ascii?Q?xOXxLdD1I5M+vke9YSFn7JopQ6xJa4gSrChMrH06hKwbTvcOV7DuK0xPeWKa?=
 =?us-ascii?Q?OjoWcXkV6yfvmklCwUb2DQZD9N904CInuYU8AMkKoRf3Bb7LWy8GlPXahx8Q?=
 =?us-ascii?Q?5v+Q+bwE5eMauackc4/i9WJyu32jOu5dd3EHM68ppjxcn22VLTl3a6vgdnuv?=
 =?us-ascii?Q?1yqwAcai+s1nr0SKSjSqxRwHwRYP579W9vWGkUAXVHcc2JMDRuLyvYS6ySdI?=
 =?us-ascii?Q?yYvQmvxb/6J0h2aK/TQnvdr7F8hB8S7Gh1z6hD5NoGljYqEzQsU4hcw/6GtX?=
 =?us-ascii?Q?Mnkpiy1PlkO9esFFeUsTA4M9w5j+wPrBMufJRU2pJX4zQWueqHR/xH7YrIdE?=
 =?us-ascii?Q?JHVdAunCR826YkBSqFVLKZihD0IqfOQ=3D?=
X-Exchange-RoutingPolicyChecked: GfoW6E+P+vGnzEHHwSQX1eqhJTZExfgWAdNVi+Pe7cUXMJxWJpRq/k/E+O35/Kz0lXob+rLjcFzhAUE+fzRSuKeM+2Ml5ki7rcvrdpbrg9jRYScpk9eGIVF3z2O+9LfyoImZFYIADRlHOC7gHr283+XCovGPFQ3b+qorIFd9gZsuhSiggG87xNGsGd8Pkk7JxySBkzA99DLehpT7XCp4Q+bJqNjln8nl8xnMvjsTPlLNWgtFmPYblL/0OfHwZfsR9ylJJ2Mnzgb4hYmGhPE9cZDDYJxd0J6wsfZC73xQYciGH7mqrxaLGxrcAVJq/TK3MfT0PqYmpCwMzEViI/YlOA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef13a421-bad2-408e-da54-08df1f8c2557
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 07:18:09.5415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYhg3RwrZQU/DTn9JbxIbRcEk6nT0OgEVVxSZoi475CFp3ANU8C3dGYPtt8/ewdEEFAmBecPUCgo0qPIkKlPNOwMODcG1DH8fQ+bd3MI2Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB155101
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

Prevent that by jumping to a dedicated label for driver removal
cleanup.

Assisted-by: Copilot-Claude-Opus-5
Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_migrate.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index 5b986a7687d9..5e3a9b5a83eb 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -651,17 +651,18 @@ static int live_emit_pte_full_ring(void *arg)
 	len = emit_pte(rq, &it, obj->pat_index, false, 0, CHUNK_SZ);
 	if (!len) {
 		err = -EINVAL;
-		goto out_rq;
+		goto out_timer;
 	}
 	if (len < 0) {
 		err = len;
-		goto out_rq;
+		goto out_timer;
 	}
 
-out_rq:
-	i915_request_add(rq); /* GEM_BUG_ON(rq->reserved_space > ring->space)? */
+out_timer:
 	timer_delete_sync(&st.timer);
 	timer_destroy_on_stack(&st.timer);
+out_rq:
+	i915_request_add(rq); /* GEM_BUG_ON(rq->reserved_space > ring->space)? */
 out_unpin:
 	intel_context_unpin(ce);
 out_put:
-- 
2.34.1

