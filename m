Return-Path: <SRS0=QorL=KJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156F8C43461
	for <intel-gfx@archiver.kernel.org>; Fri, 14 May 2021 15:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F61C6141E
	for <intel-gfx@archiver.kernel.org>; Fri, 14 May 2021 15:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F61C6141E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE73B6F387;
	Fri, 14 May 2021 15:37:23 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1786F39A
 for <intel-gfx@lists.freedesktop.org>; Fri, 14 May 2021 15:37:20 +0000 (UTC)
IronPort-SDR: yORsHOplUVhoFu3+02/9YKDclysjHftyNN2WYib2sOkb9PkYwMgQ4J/f4L3jot/3814n1Y52w0
 mDoytV0fbfNA==
X-IronPort-AV: E=McAfee;i="6200,9189,9984"; a="200243921"
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="200243921"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 08:37:18 -0700
IronPort-SDR: d3sSwEDwxOzrhMpNEMJVFH7INKJDklXDzzQL4QIQ7DBFsdDn75PrE/9fywKuDB+Q3kbffKPX1v
 ZsWGQrDNnKyQ==
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="610796561"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.168])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 08:37:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 14 May 2021 08:36:59 -0700
Message-Id: <20210514153711.2359617-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210514153711.2359617-1-matthew.d.roper@intel.com>
References: <20210514153711.2359617-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 07/19] drm/i915/adl_p: Extend PLANE_WM bits for
 blocks & lines
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

ADL-P further extends the bits in PLANE_WM that represent blocks and
lines; we need to extend our masks accordingly.  Since these bits are
reserved and MBZ on earlier platforms, it's safe to use the larger
bitmask on all platforms.

Bspec: 50419
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Clinton Taylor <Clinton.A.Taylor@intel.com>
Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 04072c7e9efa..02910d0299ba 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -6435,8 +6435,8 @@ enum {
 #define _CUR_WM_TRANS_B_0	0x71168
 #define   PLANE_WM_EN		(1 << 31)
 #define   PLANE_WM_IGNORE_LINES	(1 << 30)
-#define   PLANE_WM_LINES_MASK	REG_GENMASK(21, 14)
-#define   PLANE_WM_BLOCKS_MASK	0x7ff /* skl+: 10 bits, icl+ 11 bits */
+#define   PLANE_WM_LINES_MASK	REG_GENMASK(26, 14)
+#define   PLANE_WM_BLOCKS_MASK	REG_GENMASK(11, 0)
 
 #define _CUR_WM_0(pipe) _PIPE(pipe, _CUR_WM_A_0, _CUR_WM_B_0)
 #define CUR_WM(pipe, level) _MMIO(_CUR_WM_0(pipe) + ((4) * (level)))
-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
