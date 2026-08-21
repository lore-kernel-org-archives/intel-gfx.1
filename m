Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594E4C5DF89
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2026 13:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2CA10E08A;
	Fri, 21 Aug 2026 13:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIwLq9el";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBB710E08A
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2026 13:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787319556; x=1818855556;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=GYrlqsiTt/VyvhctKgBTYaBkCMqUtbTBmmZdwzW+nDc=;
 b=NIwLq9elgUJgi5Ml/gfFbScB5w7I6KzQhAnwtW55RG/0qzUFfJxA8Ozh
 jNC5AE3LE0WQszcck6Xa3uVq6f5E+wfwpwA7fMb5d0z2RPt/m+dlzIHrI
 4Jm3OEy3GQnQfr58Gh1ciSC2I1SSaCvFxrzQR5NRk5wqrfOsm8uLDx73g
 W/GWbfn90p480E+/rfwLtcJoD8GdTVGPBFkdvwUvOvj421iOxs3v7vxSv
 wdJKfO8eJT42RvSVz1HvTFO3y4QXjloiGfo2jQTMuXc32GMwbnpB+uICk
 ZH80taAvKuIHJAPUlgqf2Wfve1URanZ5nqmwdDotoKQP937OZwuEicx/K w==;
X-CSE-ConnectionGUID: Mz97MpioQ8mGp/RMkrhQ7g==
X-CSE-MsgGUID: VmHHdLgDTyyLdXZVmejYwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="75404287"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="75404287"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 06:39:16 -0700
X-CSE-ConnectionGUID: 1E0S0pqGR5ei+sWETMNOXg==
X-CSE-MsgGUID: hUBheFQtQhycSn/oHLZZkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="269827791"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 06:39:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 06:39:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 06:39:14 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 06:39:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQoY9YSIl0FY3LLnxpMQFgB7XE6o4yd1WzJHikX3rJwcHrBYH7PN/oxnJwhV1TuPLH1zrn+yXaIK/Skv8YK9Z4EiJLGeqnVVKbazMhTFPDe+zup1+Jcw3V+ReC4HwFk5fIKk17cDLMYAz2TUz8iYFNsYVglPy6pyVk2afqno7tPeXdodImye/LtyA1ulTEbh1opNwyTYtUL/cyKtJuNs0HmKZ7flw/zyGHuxj6emOaD+2ur17wEDAyBf9AXJtKHfZ+7oWxACSwYpS6IbIPfWsCnnpZoxMM/1Wp71FOuoAqu6rUMvDZ/7NaOxp0HVr2Zv7+l8bJIRNwBK0vYSixxIlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7p5Uob/G5Q1ihuYq0a86DDN6r61uyuc2ig6UwlLdReI=;
 b=AieFuvPhT/QWuiUnepe2PmDTOmkL9rSieGCCSMfQxYM3A7AiZWXSRfK0D8dOrekvkRpf+Gm+pHOcIKbsI5jkvvYvAYBzP6xxEdnYkeaa9G8Y6ug6voYVWw7ma6JU1vknDvTL0eaExHJNz+98YiH3vZ+l9YMOAhNr1Dks/Z40SYytyod4I/3M6aYhjhQmko3nckwtmIHA2NHiJrXYgmqrP7CcaocPck59RLbI9Ut7GQDtOKOx3GDzTJYrAepERvebwFXd8b06YP2XzxBy8AMXytqdmgKmDHZhmFtGG3FhMXSVtmC3AeQiHNd+IaAxCRgoDk6wano7poTAxhpH11+96A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by LV0PR11MB9862.namprd11.prod.outlook.com (2603:10b6:408:382::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 13:39:12 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 13:39:12 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <andi.shyti@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, <chris.p.wilson@intel.com>
Subject: [PATCH] drm/i915/selftests: Fix unlocked mm.stolen in reset selftest
Date: Fri, 21 Aug 2026 15:40:44 +0200
Message-ID: <20260821134044.15908-1-sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::6) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|LV0PR11MB9862:EE_
X-MS-Office365-Filtering-Correlation-Id: 77324daf-e821-4242-dc77-08deff899575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: PXYooEH/WOW3ly+AYl5oQpeOB3fuZWjt5sryNcUwmqXBuQaVtGogtRWLdi+TDKD96evJUOJw8V4ZzqOWKtCkX+iqrNdvwg5DESU/RBjrlBxq3wGHl+s4A41Rq7MeE3d0uBhfeQRKsmZkkkOjvY3nk2ZED9bI7vBVTR7rNL9jvJ4oXdjLtrA/tptp8vOd8EhY/yh0gWNfcb0OxQTeLhOvuqC/EoUvXgLidYV0C/HJV6VpqAhJu2b2agFYvrSVtABECPoVfEi//lPOKsH7gIHkPhT94ylmYxPiZbpNl0rSvtFJhkmBD/QZ/JFWXK7LAjjXWzPtcWNRm5+ROVCX0RzvaSL7lkajLi2rwtY0euEpgpt1NseDjr8D3tx7OjPFx+L2mWRTH8MYfeNIEYZtTnfrr64vQGfTIglg6d6oXZvYh78sZZ6/LH0+zm6vG61JAStlCSkPmTJD5A0/5Gmd95aCbxwWeyMdBM1ReA2AFC3UlVqln/LbAPIDirWq5BIuwAeWEaomFBqsBSdpDlaWaSNZkFgiKalnwvXqOeLsXf4oB2GxtQdJKRJr0Kz8+Vj5hSx4NVE+kS1V+3mRcIc9hwvveYbjEPh8QkG37CIsZTO0sblOR0VdpYZZLb0TeklDrLM4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cNV8MYI/PaNBV0QCIONFHgUiZ53YLODeGYzoNr0VCm8f93didrWpjfJQiSkY?=
 =?us-ascii?Q?GIm0CCugPTzLsmsgxknG/mUW3gti3/5sFzQZoL7JB4iVIY599p6MFw171k5p?=
 =?us-ascii?Q?kzXLLJ+Ncdr9zkfAoF2Qtb1VhIOpKy+z+WdWQsXmQ7VNKVBi+Vj/oEQtScPN?=
 =?us-ascii?Q?boJq2QqXPHmwwchUD6Fe/dlggXfCvk/p3vlBBoCh8ZGSh1UveLEVsOV9UHB6?=
 =?us-ascii?Q?kaDx1zEwC2RoAKqV4oW3xBoO5eVMx3ucGGV9C0+Qbb6NtzZeiWUr3aMiPZHF?=
 =?us-ascii?Q?D64gpl/VCfNbwAX8vBRltM4spr9XIcjnFerOwuJWuflTG/xtln1fZC+4GYIf?=
 =?us-ascii?Q?Rgsv+a5RDZDjLF74Ty+pIUHEnbvUI5x6YWdgNVRB/8MmuoT9RItdZVNPbhbb?=
 =?us-ascii?Q?w3Ugz5DD8hpd0Pk9CfwWXkmtmVbe/UhgOxBeaQm0l1dXY7Wxj7AorN5wheOz?=
 =?us-ascii?Q?1t64y5WPHLoTOCw6Oq7GkQ0fHddKPhe9/Zf9uG+1+qAFfAKfqi5H4twHOA0P?=
 =?us-ascii?Q?CdR3eNSGLuJTyBTaVIE0OhRS7k/41tTCB+ECBVpsCwPZHeiKhcz4So6puUt1?=
 =?us-ascii?Q?8fv/wc6m49Id+iDZURExW2zmS/ItAkI1i2dOapfLCO3f/QwkX81ZevWJ47Pb?=
 =?us-ascii?Q?1jwqIJ8i5ji+Ml+YEmy73XenN13td6m47GNRFTgKTXpwzwi4BdyhkDQb9XLk?=
 =?us-ascii?Q?sOHv3hDjYMURltVorPapFFK8JXkY9f3IpRwAIIkSiNSqu20beZnUgM7/YmVe?=
 =?us-ascii?Q?rdAg+SIVFDpI+Frj6kJf+MaHwn5jQF9LATLtaJKZGoiR54TKQccN9PQBjYa5?=
 =?us-ascii?Q?6wfyjcnrzlLh5buillOXgsSPqmveHnrbEb+eE4lPpZs1Rz17xDNP7XH13mET?=
 =?us-ascii?Q?cW3c4XFdrYkbHhj797d+SIoL3ikS9IFZ3jIiSbBXGACJrvANuX3Xl8CM7fJE?=
 =?us-ascii?Q?PAYmHxl5H4CJUgFIGA6bJo8hzl3bcuhZ7aow5gg2GWOFTBaGfCGOSxHhxXKM?=
 =?us-ascii?Q?PWaLrMc9FBSdT/kNO35CrMPwkAob1cXpNdaEEnXVCXy16kV6lKS5Cm7TUmag?=
 =?us-ascii?Q?1o96/FmTdm/L9ej3HMjCeTVjbtK6GWf9zeeyq6R2FJnXdYQwzGQ8J644mnMO?=
 =?us-ascii?Q?ODlEZdd0NcRZkCv+58028APaDPzWf/R0Jq7X/4Ly5F31S2kxJIrg9z7cZpXJ?=
 =?us-ascii?Q?kJHjM8n7YcRFiVU3e1dG0J2umy1NU/Lgtg5DdoTcdNKOysf9+EJn6dSJ4UKM?=
 =?us-ascii?Q?AmeHQNZF6OUdjPJqp4Xy+GTE+X93FIjwVa4kqxanZ0kkMfS67nkTi674oHCN?=
 =?us-ascii?Q?VVKE5k92Z2GMwSX3Rn4WcKX2Z+sPPOBRnoDhpDD79/b9PNm0pDn1/o4eJ0Tb?=
 =?us-ascii?Q?kUTm0ozDynhnmoT+BrcOirF+15P+9LV/N+lWwoNQQewTafbHGnvxnIDE/VeW?=
 =?us-ascii?Q?SjYT0KONcC3GaaEedNtzMeBwnhvBZ+dTJOiNdgNenDO/MaqcdoNjTMNDRPOh?=
 =?us-ascii?Q?bu4+ypTsSAVZ7aHYSjNgby9lEzbKIW20sSLasLLQKo0EBVRKKgUfjeMJCEIL?=
 =?us-ascii?Q?AOxrXSrst1hBKw3DjaSQ3CuAYLMLdW0KEg0VNSIMMomISKq80ffdyReCE2hn?=
 =?us-ascii?Q?diJcQnotYU/TVxOMcubJLcOpukW0jBKfMx4ThCBw1A237/1ELRk6lkyMlfeN?=
 =?us-ascii?Q?JtVXrZJDM6pYpH+DbNquhXgJYW9Lh6XMuRe1XfL9ZvtNsFwMYUeWxBxaFftL?=
 =?us-ascii?Q?/FAE3Jw7UKohqM74lBjfnzY3os0emQE=3D?=
X-Exchange-RoutingPolicyChecked: nr8gzVqoFCarlSZUnS9tYWpNiAmwTnJeGemksZcHLIcHuLnW+z71aaFIunqRRirXvWVRMcAuKbvyYrbOXnH9vnp7H49feRlpizr8rpq/qth/h1np7x9UZ8JGdHUF5GXUZfcDphn0QikkrvwskykfLl9FrkmbjqburpdyQsB4DP9LhMGVMKad0/3ScbHs7Bjvo0kdi2ucoJ7H8cheF+6Bvrc13B4myi+LQN/mxrKa7nIyUisfdtWZ9Z3I4Rlou9q8WIsHK3+Shv0AvgdKmsvH3LMj9KbWmbbvUq9xIKCeAe1uWz5iogsgQq9gXvXOujGn84nYFSHfZNN2KDVfPCBMGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 77324daf-e821-4242-dc77-08deff899575
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 13:39:11.8608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ACn8BU7rm304xqDv+j2miuMK7mygH8Q97AS+cg5k+fAqFS0hlTflyaamisFXQXP4+sx06vS/tJK0hUJWZHmbNKmhrLQDEkoKcfr/vl5dHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9862
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

__igt_reset_stolen() use via __drm_mm_interval_first(), but
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

Fixes: 3da3c5c1c982 ("drm/i915: Exclude low pages (128KiB) of stolen from use")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16841
Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_reset.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 2cfc23c58e90..eb6b2261329d 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -30,6 +30,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 	void *tmp;
 	u32 *crc;
 	int err;
+	bool unused;
 
 	if (!drm_mm_node_allocated(&ggtt->error_capture))
 		return 0;
@@ -95,9 +96,12 @@ __igt_reset_stolen(struct intel_gt *gt,
 				      ggtt->error_capture.start,
 				      PAGE_SIZE);
 
-		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
-					     page << PAGE_SHIFT,
-					     ((page + 1) << PAGE_SHIFT) - 1))
+		mutex_lock(&gt->i915->mm.stolen_lock);
+		unused = !__drm_mm_interval_first(&gt->i915->mm.stolen,
+						  page << PAGE_SHIFT,
+						  ((page + 1) << PAGE_SHIFT) - 1);
+		mutex_unlock(&gt->i915->mm.stolen_lock);
+		if (unused)
 			memset_io(s, STACK_MAGIC, PAGE_SIZE);
 
 		in = (void __force *)s;
@@ -143,10 +147,12 @@ __igt_reset_stolen(struct intel_gt *gt,
 			in = tmp;
 		x = crc32_le(0, in, PAGE_SIZE);
 
-		if (x != crc[page] &&
-		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
-					     page << PAGE_SHIFT,
-					     ((page + 1) << PAGE_SHIFT) - 1)) {
+		mutex_lock(&gt->i915->mm.stolen_lock);
+		unused = !__drm_mm_interval_first(&gt->i915->mm.stolen,
+						  page << PAGE_SHIFT,
+						  ((page + 1) << PAGE_SHIFT) - 1);
+		mutex_unlock(&gt->i915->mm.stolen_lock);
+		if (x != crc[page] && unused) {
 			pr_debug("unused stolen page %pa modified by GPU reset\n",
 				 &page);
 			if (count++ == 0)
-- 
2.55.0

