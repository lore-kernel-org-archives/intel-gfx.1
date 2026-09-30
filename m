Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9160CCA5FB1
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2026 11:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B68A10F2FC;
	Wed, 30 Sep 2026 11:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJLciL8D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4AC10F2FC
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Sep 2026 11:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790768145; x=1822304145;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=yYt528LvfOCKXcyWaUb/lTX8p/Xo5CQdL4lVkn6mKDg=;
 b=cJLciL8DhFwmucBmorWO/Myug/+c5e3U1cC6yYfv+FUW+1SppPF/cDJD
 5Mmai7qwDstq+qotxBh/9jlxJyp0ZTdo9SbHa8t2NeSinCvsGeIgSvZFo
 RiUJUj7Qf3SqQXwcQGE4AphO0fRJi28cd9i54DMwtxPqCBpjOjt8M70T6
 zmbG56XCtFjaM2BGhgyiJA4beneBXODJbkD3dE0/81k8yLJyTRSYLzay6
 IXq2HePswIeOFTQWPy1kIdx1FlIJdMUgsEBoRd/XaYsvF6H+KRqfyFqjR
 egD0ETMjHawmIGUXI1W6uvzgydZmTRShFYIFgrvZbg3gEPVGtolXrhZnh g==;
X-CSE-ConnectionGUID: +YX1T0QDTjqCBIqrnhC3zg==
X-CSE-MsgGUID: Og5e/YR4R8qEWzUdjJ1qng==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90552985"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="90552985"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 04:35:45 -0700
X-CSE-ConnectionGUID: K35JakDNSKyz2XyLYUAsTw==
X-CSE-MsgGUID: 4pORIf2/ShCsp5Ol1nk04A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="301923040"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 04:35:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 04:35:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 04:35:44 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 04:35:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awx+9YlTEw8ANlnlWzpe4wCgAMX2km8Zmdf8/17pqjIYmQbpfXucvQ2AtRKpJoQ4jXMHRnmVwfrvpzf7Hwo3ZoO2O9PvhoF2QCcmt1fo6FZqw8YKNo2kidXyfVCeRAFqr9uliQe6QZ+/xtv0NgPWQXH7zpFXQ+J3MpFr+6nSTaaUQBzpa60l0DDjF7LQPn+BpWfkghe9KZTbDkQZGEeUJum50VMZLtvC0J6FTys56jy0qvBDPJAjdYp5/iUt/CHJ2apjzYNlpVnn+Crx2v4pWD4FrgSALW4XUNUHLgj+Y6VuMMewhruQI9szChUChzOQc+mfc5nwj7Wq10LsKt0kNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lv8Lyl2gN4jx5AiGrVqJ4BZIASU0qHx7Tg2qzZXI58=;
 b=xLoYIYeAGZLIc9qYU8GDIILpZYvfzl6cw3/YhRSzpMvhPusJSrrZsdMAdEppOyFyfLIi4oLm3LG4HQOWKX+kgIWvFmJqhcAo3SFI+uKumdMaBZzSNyBl6WnykIh09oF0vpwmVY8bNJctcD7dgLLRfsR8t54s72ZK6qSMevAsFpuCLhfV4L6SJnDtdM/5O9cBtx4ZFKmMQXx2aYxLvYoVfqChw1q/YGX6BJNBBz6xobLHTlrCMnKXQE0ws8y0sfl41W55v6mNc+LR914ExHlg18YlgVnEirq3ReyluUG9pW0Yr/SFC6ZIKqL35Vyp2XkZnRN4IaYLy5DnixIPYxTI7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SA2PR11MB4844.namprd11.prod.outlook.com (2603:10b6:806:f9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 11:35:42 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 11:35:42 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <andi.shyti@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, <chris.p.wilson@intel.com>
Subject: [PATCH v3] drm/i915/selftests: Fix unlocked mm.stolen in reset
 selftest
Date: Wed, 30 Sep 2026 13:35:13 +0200
Message-ID: <20260930113513.15169-1-sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIXP296CA0038.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36e::11) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SA2PR11MB4844:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a43fa89-b095-409e-3804-08df1ee6f560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|18002099003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: AJ52obtP+twgW4ld5C0ls+tLpyH/WirNd4tyGblrf+5N5JA9A9in63EWbYwbpAT449WAKHEnZEvKctgIoYAv0zdh+SDHpZQX+/1hNOA1GlLAqCJGi4BpuATEaqAh+FbtKZeMszL1JkUKeGUjC8y/5Q0KPfAthyWnJyWfDgDn7I1ugsF6Fx2FQGbUDwiyc650YWp6SLgYDJMNzOv5C32Drtpto6mELUmwq5Jud/T4KnzPXbKdRUBp6KNFKCRh95c9T4EEdLZf6I2WOWLaK0mOfdIdYXl0QGpdll+84S/i9uhWX8vhzqn/62kadHZ0sE17JH5v2DkuJ9RH5S3yoMxn+bZv8VwdiDb2cY568Wv2IGwlJa3vI2P/FL1J4DZN+Tr2YYImC76N7CpsW2cat+SpkLTKFvu2uxuSRw1B51DZj1o67Cd0Q3U/Fn+F3XJhiCs8IRwUlDKbXG1xAxShHwH8VCqVPtZTcusr64ILLTXEtKQaxPkzd1XTP5gDQQeQ5whyjkKR3idNVqlWcambevJTJdPY4Bt+qb4P/yON9+jQsR1lC8x8//t/WZV5Oi4kL+m2Lf6LFidCQZASyOZ2Vy7b0unye1vZTYUZhMMY+EeqLuH+0XLZAw6k99NiVWc/EcgS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eKbIdxeaknn4zC26YsIRcJqYYSdSVVDr/eAQiNZb+YCJnNaKgORKDVGDHMEe?=
 =?us-ascii?Q?/kSirD22Ui/LXrubsNX2ppqlnDRdpFdAZxZ+kFWplyaPBoPKGZ4LBGJmbzGP?=
 =?us-ascii?Q?wn9CUi/N/HVPHcHpkPbu1YAH5dnetDsGI9C7QMnSZTNXnXzAnFVYg+V5zAZf?=
 =?us-ascii?Q?MdX9dbCFV1K1ophalghsuyco10Ux3zD0tS51FOx0D6qSpKsJtTx3H1ek4Gkh?=
 =?us-ascii?Q?max4LElyuGVhiOnsyJPF7LXiAzqQl9CMiu/zKPQ0Ft/9DxFoGNkbmTnIk9uY?=
 =?us-ascii?Q?wibUye56WHTNqWdC0n3PrkDW2AcgYujPaK6ID3jWHZci+srS2ovGdmv2btev?=
 =?us-ascii?Q?Uvfp2ngDdvuUV139LttkRD5fmFHRX8HT6I6qxjeGDCC2RBQaGPN9fqjZ7Dqq?=
 =?us-ascii?Q?+lkp8y/xEaJlZwYRUc4EpVoCC136/jrYj9xSDhywTxGbFT6CVOpRvyMVuVzb?=
 =?us-ascii?Q?6qOc2t82V9pDo6Uv6BtcARNvGx+hybBkfei+05Is4RVp6DC0s1OS7KJrzdIJ?=
 =?us-ascii?Q?CXOlYinbc7zlPhCg2ahEVMNGM6ALe4Zgp4Uy1qK+3vuWocE0PsOoBYDgCqMQ?=
 =?us-ascii?Q?j7W3NJUzVoQsSWRXHpGeO66rzyM0AufDKHAICX6VBQvGshl24Q6uiLYsA6rx?=
 =?us-ascii?Q?m0stTCubR2yo8d9unc5Oa3Tk1/dfdRnLyJ/GpLCnGqoj4K2PPYxl4WIdvEKW?=
 =?us-ascii?Q?5SRHb2Wz4xN/LcbqoyH2S7z5JS8OZC0VFJ2WVil+BUBoaUUjAok5Kv2QUVJk?=
 =?us-ascii?Q?aCicxQAB/zvbbuHoC0zEQ3KA+1zKadVBNCoQ81NEMtdue+HQCMUTW4JDm8Wm?=
 =?us-ascii?Q?cKMpLeCnM76wsZEhSVkrHYdQH/w8TqihoCLAoSi2i2taODNjTpMIzfIMBW+U?=
 =?us-ascii?Q?UnSRasJRoPg3LbmyHQqauoV4T1VBXjRz/SPvdXm7qm+oBpwCRrcaxMktbXMI?=
 =?us-ascii?Q?wK4zaBN9d89KYOWiXjygxBn/KEkHtnBxPU+3I5dGUBy1/8xENafFyDU1o+yh?=
 =?us-ascii?Q?DyYdr8B4CpUvXaf5lPuju0b9ISk42tZvmBwI6lHEp0aRWY1EI+SIsMQyzDQR?=
 =?us-ascii?Q?i0qjNFWafjl2DSmyhMdg0hSuRmieaHOCAHFr3m8ghup2qpnSHwDiN34HYPwu?=
 =?us-ascii?Q?iWgVBygatgxKa15zo4o5XB2hAk8Om9WJsvDzxChEKHM1qgmn7pl4hT9GCVAg?=
 =?us-ascii?Q?3yLmTRrGAhl8dFsoJGAY4TgfnAxxApdvW3Vcil3IAj+5P4NuaoCAjE5Ljw3V?=
 =?us-ascii?Q?JPY2AJ+hWcINHOmSs7phjWCv44uinp52hBDnsbNMVIVelT3YaWJdqNzNC04C?=
 =?us-ascii?Q?PMYmK0wb8Z8d7y3/7Q+8a4hXELaQHtXzM4T+LrZYGjPiCobh8x+UsWwxIO33?=
 =?us-ascii?Q?55szYmxqsbX980/0nZkioK9RgZTbfvAokQ9nCztbQqDYvsh5pTGLBsieHhSK?=
 =?us-ascii?Q?GuJfDTeiBg0yeO/yk7wpsRmDE+iH4z86Uo/XiBc2ZIXKAiRshpBlR8nv6r+R?=
 =?us-ascii?Q?IfupODiPrP0Cti64q96YC20zrvpWG7c2qXfxBA559At/TwDUj0VthPVU3Sjo?=
 =?us-ascii?Q?7pbMeCG8PH5G4kcw6BWmRHX7HoEOHSJvCRLeyecfCaXoQ3b/VSFxg8+VMVvC?=
 =?us-ascii?Q?YZ3XyumghGDZ21Er2NNxXe8NF8LHyBbpDu3phFhgeCyZuayFdG3iat2Km44s?=
 =?us-ascii?Q?jo97q+YhPbCw9H46Z9uVrv5U9HThLQ3NzCBfYB+vmyCac8QHlvigvNGFVItt?=
 =?us-ascii?Q?4hfr6/Fd98YeFWKa/gxsTUCFoRbFR3s=3D?=
X-Exchange-RoutingPolicyChecked: tkbJOeFhsr9Uj6k2YFtOfPlIoXNjeFuHJh4JxPRruXhUh0siKWpdPVnZHwuW5Auv8Z+3/Lt6LzG4Cu2rDaweEgmMtaNUF2Eei5C67v8dgp+Bux2MASIZWEqiajiwHbEsLl0hqHDUMwY8+SKow2tZponJTC82A2g3HK2eMvjTbuLZ1kOW96mJ7hp2S3mBvhyrUE/ITeABpOzd0r1Pr523XDQKe3DTy2P0fDvQeyI+nhcomrW6bA2UEqX0gNKZdpMhxFyk1CYDEiQsymV4OEwpLghsJ9VMpjzUERBp46e8bobQBEX4yErRqBOs4ZmxZg6Gb8fwkLR6LMIZLqjkF0sgcw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a43fa89-b095-409e-3804-08df1ee6f560
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 11:35:41.9437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPcb0f5nZSA1h+d6TouTunyhuNY0en4ERAb4NDPFtMQs0hLSvlOipT0PzdzW/xu2dELhkbiB8lJlf3tcXY07/8YmimC9r6z3cudkR1bPEGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4844
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

_igt_reset_stolen() use via __drm_mm_interval_first(), but
does so without holding i915->mm.stolen_lock. Every writer of this
(i915_gem_stolen.c: drm_mm_insert_node_in_range(), drm_mm_reserve_node(),
drm_mm_remove_node()) takes stolen_lock, so the selftest's unlocked
reader can race.

This was observed as a NULL pointer dereference in
__drm_mm_interval_first() during igt_reset_device_stolen():

BUG: kernel NULL pointer dereference, address: 0000000000000010
...
RIP: 0010:__drm_mm_interval_first+0x2c/0x90
...
Call Trace:
  __igt_reset_stolen+0x565/0x6a0 [i915]
  igt_reset_device_stolen+0x1a/0x30 [i915]
  __i915_subtests+0xb8/0x250 [i915]
...

Also cap num_pages to i915->dsm.usable_size, which already excludes the
hardware reserved region from drm_mm.stolen's range, so poison/verify
writes never touch reserved stolen pages.

Fixes: 3da3c5c1c982 ("drm/i915: Exclude low pages (128KiB) of stolen from use")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16841
Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
v1 -> v2:
- Fix always false !__drm_mm_interval_first() check (Andi)
- Extend stolen_lock over the poison/verify writes, not just
  the lookup (Andi)
- Move the lookup into stolen_page_unused() helper

v2 -> v3:
- Cap num_pages to i915->dsm.usable_size to avoid poisoning
  hardware reserved stolen pages (Shashiko)
---
 drivers/gpu/drm/i915/gt/selftest_reset.c | 26 ++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 2cfc23c58e90..811ddf991cb2 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -14,6 +14,16 @@
 #include "selftests/igt_atomic.h"
 #include "selftests/igt_spinner.h"
 
+static bool stolen_page_unused(struct intel_gt *gt, resource_size_t page)
+{
+	lockdep_assert_held(&gt->i915->mm.stolen_lock);
+
+	return __drm_mm_interval_first(&gt->i915->mm.stolen,
+					page << PAGE_SHIFT,
+					((page + 1) << PAGE_SHIFT) - 1) ==
+	       &gt->i915->mm.stolen.head_node;
+}
+
 static int
 __igt_reset_stolen(struct intel_gt *gt,
 		   intel_engine_mask_t mask,
@@ -34,7 +44,8 @@ __igt_reset_stolen(struct intel_gt *gt,
 	if (!drm_mm_node_allocated(&ggtt->error_capture))
 		return 0;
 
-	num_pages = resource_size(dsm) >> PAGE_SHIFT;
+	num_pages = min_t(resource_size_t, resource_size(dsm),
+			  gt->i915->dsm.usable_size) >> PAGE_SHIFT;
 	if (!num_pages)
 		return 0;
 
@@ -95,10 +106,10 @@ __igt_reset_stolen(struct intel_gt *gt,
 				      ggtt->error_capture.start,
 				      PAGE_SIZE);
 
-		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
-					     page << PAGE_SHIFT,
-					     ((page + 1) << PAGE_SHIFT) - 1))
+		mutex_lock(&gt->i915->mm.stolen_lock);
+		if (stolen_page_unused(gt, page))
 			memset_io(s, STACK_MAGIC, PAGE_SIZE);
+		mutex_unlock(&gt->i915->mm.stolen_lock);
 
 		in = (void __force *)s;
 		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
@@ -143,16 +154,15 @@ __igt_reset_stolen(struct intel_gt *gt,
 			in = tmp;
 		x = crc32_le(0, in, PAGE_SIZE);
 
-		if (x != crc[page] &&
-		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
-					     page << PAGE_SHIFT,
-					     ((page + 1) << PAGE_SHIFT) - 1)) {
+		mutex_lock(&gt->i915->mm.stolen_lock);
+		if (x != crc[page] && stolen_page_unused(gt, page)) {
 			pr_debug("unused stolen page %pa modified by GPU reset\n",
 				 &page);
 			if (count++ == 0)
 				igt_hexdump(in, PAGE_SIZE);
 			max = page;
 		}
+		mutex_unlock(&gt->i915->mm.stolen_lock);
 
 		io_mapping_unmap(s);
 	}
-- 
2.55.0

