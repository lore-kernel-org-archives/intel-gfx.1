Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE172C88E72
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Sep 2026 11:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2831110E6E6;
	Thu, 17 Sep 2026 11:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yqqt+KA2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D57610E6E6
 for <intel-gfx@lists.freedesktop.org>; Thu, 17 Sep 2026 11:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789645077; x=1821181077;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=qqdaaj6W6E8G/rmkt4eQU0aPi8MfputZXIi2ygwGhWc=;
 b=Yqqt+KA2pzYeh7HDLnf5+jER6jrgzEPTk/7uLjddcqOR+SC/RSTSr3hl
 HFt0/wwqY6Z/47TpyxACpxKXJL/wkjZcdrzeep4s1GZer0nsCe5KrzZrs
 lTUPJ9vrkzfraj6vq7l7hayVXxvvrNeNfXs1BLTIWrqbenNK/lGltA40M
 l+hMpgWZJBDYEO72kcu3TIo54cdUiMiinqEFG6bnxY3f9LE8eyj1w1Zb8
 wROJvxXMBsZGH8bpm7YZIDo3D6lgLX1lDOeElZygCeTOgK9+GHrKluxRu
 ODG0hl9pdZEaohJRzUC3zKmObTuWC0ASXf/oSVLyZRoplclwTA+AW5Ubt g==;
X-CSE-ConnectionGUID: 4z8zahOTTPGoeQbaantFnQ==
X-CSE-MsgGUID: pkmDVH+FScKgI+hn+azUzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77622157"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77622157"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 04:37:56 -0700
X-CSE-ConnectionGUID: eZ6L/gxJSGqPk7oEu/QlPQ==
X-CSE-MsgGUID: kha2/W44QP+9qoKgj7WQkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271096624"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 04:37:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 04:37:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 04:37:56 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 04:37:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6dSojKaEmXTmD6rAy/yd4WJnHEiOXV4uEMZXxkg6CUi0hHQo1jN0LbazBwsRQcb/sx8WtuejnFrNpERKE1zE5cWFZ94JMGleCt+OfonanHIz5D0KYK0XouF+bN2Qar1I2kMeh/kBHlsCcSjEFV0gL6k9WFyft2wcEYNE+G/8MMafn1sYJl02m26x6JTq2V7p45NjAHOksDGbVrKyMIUevNI2jZxBGRVaf318AlDeJLPG+ZAPIvt8bAixik/5qooPaXa2sdnRPv1SQXlDSZZ01+3L6af4u3qSLuSBaiJGa+0fHxBu1eTqL458wo85FQEO+uro96wSSeaqXsYERErDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTwIva/3fl/P+KAoJcgAel2fTVTadzpT3BnwPrqBMpk=;
 b=meEyNjFWrWDEMlp/v1FdfZOsXQKlKPDcc6OOBeN2f3UzgZLTtOXinp+bTSjxpZewOwi1B3wilrkqHAA2Z0riIp/gq05sbim4uJnjEBwyRWhO1OWLhsn9eoM5hU07bQj3qSXcZ7wZ94Ly/cb+GKKJilwKED8PoKbfy8nZzvkJum4vRaFNxN0Ts+ig7eIcRWgt0isu9aJnfxgY0v22WFa3V35wl3Ft1/XWGZYxIr4Dk1HzSwnEQUYoWojty/mpEg29V1Qc4Vfhn7MjNOV2zQT1ALdjyKfApa+3oB5KZlHoXKjWCXOZES46b+2SI9BUQ5AIyAzcwwACHeN3PYb8+OORwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH7PR11MB6650.namprd11.prod.outlook.com (2603:10b6:510:1a8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 17 Sep
 2026 11:37:54 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0428.008; Thu, 17 Sep 2026
 11:37:53 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <andi.shyti@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, <chris.p.wilson@intel.com>
Subject: [PATCH v2] drm/i915/selftests: Fix unlocked mm.stolen in reset
 selftest
Date: Thu, 17 Sep 2026 13:37:17 +0200
Message-ID: <20260917113717.2852-1-sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIVP296CA0085.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35b::14) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH7PR11MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 51aa71c6-5f3c-4202-5079-08df14b01c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: f5VC7tm7GF5syQXq2zzO5mAaUCQ9qolbxjrQ9moEPx/IiMudsY9lg278y0Mu9HZSa1cp8WPW9i/8CM5Ss1B8Uf7Xs/8pBacfMIvgb4ThToAkZ6Hxl6rwojFAIOpfRBRQRRte/73zTgOJFlxarG6QDoTLPApE6uA2L6Kq7X7yqPwpHbjcrIV/vzJFvBQmrCHa+EqK8BoO/1HSLKbf6cPYaXmMGS78SZKRBlm75DIzXO0BP8B53OIVDRc124NaZk2rD77a9qzmLhz8LF1CsRWQj3KYvEqzSbrtEad0BFzWAZmdV9uQyrWMDOdjJG73awSGhBrjcY1ndGOmHNKbrg0egesXnA1zcQbbCJrX4uhufKR4VeIPlX7w5tGROM0W5qw63tlriS4XrXpIK3kn5CIiriJkMt4H5yYlblKtYyni0hREd+4/KhNyFJhZ38RIjq5ZRhbnqC0J8Al09+Fb7PtBsvE7UGc2tdYDWchJDto1Vo0nMOPzwtVeA1igg5lsWh0TirmhuA0XPAmB8lN4rDpHNxpeu8vhh31DJ8+RDWpExK4+NWC1zJtji1xshBre+cvpq0Ecd2t1Qr8QlKS4wK9Vzpcy5g2fgW66hhQGceqsF7j2/DbQSuPj3FbGza4hOYTk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UsCNm6bETKj7vulqTLkGN1g7oOI7SobLUdKgXh6TcVs5e3V4pjaO6FYMlkbi?=
 =?us-ascii?Q?ZIbfheBqCVTlK2HajJSJ7p9bYfNvWaVazZob80KXVBXoI/0uU5bXE4/JN4MN?=
 =?us-ascii?Q?jp7Kw4jOF16pTaCDzXCoL/eSWzzCFG8GjPBaHJSjFn6QfbkZwKJLA2jiieRk?=
 =?us-ascii?Q?Uy/apXK3Ng9a6jHY2FOGbgtexQ/pd2Y2LCwY8+TSjqMaTa2vRfLvBq07q9Hm?=
 =?us-ascii?Q?alwSN8+KiCOEtrZnADKL3dJK3HwCj3eo0HLxBXuDnYSE0KY4UKmxkIGPrUWF?=
 =?us-ascii?Q?0UPtJscLp8lagRyxP2mbApPk/CWnl5dDhbQ9Gu0qAd9Jkaxg53OXNbY21SqN?=
 =?us-ascii?Q?I9hdlEvyWz63rm+s7oURIAsX/3D3w0IELPkhsTmBwikeDZoyO6uTAkLpCg1I?=
 =?us-ascii?Q?KXl1FGCEKvEXrOThNf2CPNqQs9XhKY3kgo2Ac3yDF7pD76hK5ktiAG5jFH/S?=
 =?us-ascii?Q?nRLZw9h7XHmhquvNpuAIZ23a3rICMqG0kuI5i+8MUJKcTp1H4jGwtAH555Ho?=
 =?us-ascii?Q?U2EZMH6bkMw4JVRzPSYfQ7OrNEx0J3qbPJxFq1/LzOtSH6CkpOGWn++Qaioo?=
 =?us-ascii?Q?3NcxCNYcqH8O+GVyHiD5VxIXmXAzD2SPMOM80x/4PR+DQwp2ER11yrWuoGbK?=
 =?us-ascii?Q?QL1U/HJ8I5vlibKdMbVBbKH7rsz1NsjLC2WPFYQiv3n7p6oiec3O17o3GuoD?=
 =?us-ascii?Q?iTca7ga3MgrzS8bZ09LPXpof0l//HAcdbpzhCKfy1g08+0oJv7w2NXNFtKo9?=
 =?us-ascii?Q?QP/7cXZJR8zlxCLaBFfrKO9myMxSpe9VdTnduAk7eitDkmPrx3/Sg+uoaDKG?=
 =?us-ascii?Q?Sfy2ntgWIS4pTQb6d+f6mqsf1zKybVln+T3pJuPAlLk86oQXaUOFiqGOBebO?=
 =?us-ascii?Q?rg9oJ6MrhT32TZyeC4sb498KHHY0Ylh+qTx6KTF3YnGMgzz1jBICHn2M0mNM?=
 =?us-ascii?Q?wua88XJZ1sVKwv0AWyXvQYXE+3hvqzVWggA4Pbm99WSFzGb6JYzRf1/YPYHn?=
 =?us-ascii?Q?EmvkQILgOy16ZSeLCWWeJK8bPlEKD+TEmReuuH3xfAvaPGd8AyoIyNIazNFL?=
 =?us-ascii?Q?CYcSLTOV6Jx3H5uGMZWp992shOsOIa3nRfK/0vCuv4CwAPlU4CK08yPvDDSn?=
 =?us-ascii?Q?9JLB9YCXbTBerGtprvJRzgByVnQ+Dh7Sz1dbdD7p/mEub2EtNRE7gNSej7+G?=
 =?us-ascii?Q?GuAv0rkI8tn4DXlCu5/NeezNi2ke//SkuHLzHHUXUrfM+jxBdm1chaiQFlsF?=
 =?us-ascii?Q?6/caz4uziHTuCBbllV5mX9dwcLOVi71KqMSiEBq0QndTdcnZdXsuKFYZMV43?=
 =?us-ascii?Q?PZ+2Nhidksdc6+s3rbhCbtXGJFTuPWWNaaXxZtFAWfTdXlZX/pPPNtWZj0W3?=
 =?us-ascii?Q?VtgyHzZHR6UZQNCD9UjGFcfSO4D4c+1eneDxL1hCfGzKKdf5F8wGPxwQugSf?=
 =?us-ascii?Q?nilEQYBfdbV8KtoI2aFnaS06ymh/vDk3gYnUtXL+wZk2RlYx/cz9vyLpERl5?=
 =?us-ascii?Q?OGDrYDeRqeKXIvNB1kTQS5BcPS+6lMimsR2lq8prmJcahCp2zt92HkgHtKxD?=
 =?us-ascii?Q?7t+TXlHezpww+5uA6rE5G2bIVoC+MhV45yuS57ovLCUVoW97phs5mgVw5sYP?=
 =?us-ascii?Q?JJrk+zHU2jOoungrVDvk6QSgur+Tq6uLxbo2xh8/YSga9enphpXZ9sth3vQ2?=
 =?us-ascii?Q?lNv8EmQA+qwO/kWU5zpJw2bLbX1dq4aBjOTgfg79SNMo+W/N/ePn8PyRXQ83?=
 =?us-ascii?Q?Nw0rxCE76A4r64zg7qk3Jzk0PVatUZw=3D?=
X-Exchange-RoutingPolicyChecked: 1WSzkTXSUv/JzM5IXpjhXCqlWf/I7PryE+TpbRzCCJR21mzfpRsXCKH7jrKhSEvDRa1f3STGl3BLgHOn5jimQOcp9s8Wi4JFgJBoGSsxqKXRdN7jjMgAuZOjgDQo06lPhhUW4EfxjI7aQa+IUypaNfKJfKgUZOU1nb973946/nOvvWBA5mkA6pk7iEnzjJuTVzwtHOQ3kvYcMdyd2No777illixTXujc+pLFjss0JsQ+jD9xk+cMJaTg9E+gIk/xjPIVdzJ99hrQFTK8PKMqOocnmsNzMebxRqhA3rBfpk/ORPG2KX2ipjT5WjIP+T/DCuLSGVBVOBjAKEWrjx+4Eg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 51aa71c6-5f3c-4202-5079-08df14b01c53
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 11:37:53.5011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvVhAOgolGdnxUT5US648StgdCTEosBwYukGmEBktOHzl2RLblDIZ/frQcW/3CG+yusrZAd2ZZfUN5FwTlNCo8NtYdefQaz5KB0FsJRcrz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6650
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

Fixes: 3da3c5c1c982 ("drm/i915: Exclude low pages (128KiB) of stolen from use")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16841
Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
v1 -> v2:
- Fix always false !__drm_mm_interval_first() check (Andi)
- Extend stolen_lock over the poison/verify writes, not just
  the lookup (Andi)
- Move the lookup into stolen_page_unused() helper
---
 drivers/gpu/drm/i915/gt/selftest_reset.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 2cfc23c58e90..77af788314ff 100644
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
@@ -95,10 +105,10 @@ __igt_reset_stolen(struct intel_gt *gt,
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
@@ -143,16 +153,15 @@ __igt_reset_stolen(struct intel_gt *gt,
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

