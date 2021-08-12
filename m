Return-Path: <SRS0=LDoR=ND=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0E0C4338F
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Aug 2021 06:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3E2560240
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Aug 2021 06:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3E2560240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D236E1DE;
	Thu, 12 Aug 2021 06:10:17 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012096E1C0
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Aug 2021 06:10:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="215017879"
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; d="scan'208";a="215017879"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 23:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; d="scan'208";a="676648395"
Received: from amanna.iind.intel.com ([10.223.74.76])
 by fmsmga005.fm.intel.com with ESMTP; 11 Aug 2021 23:10:11 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>
Date: Thu, 12 Aug 2021 11:18:01 +0530
Message-Id: <20210812054806.22745-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/5] Fix in max source calculation for dp/edp
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

HBR3 support for display gen11+ platform is depends upon some
conditions which are mentioned below.

ICL:
- eDP (only on DDI-A): Up to HBR3 for higher Vccio.
- DP:
	- (DDI-B, combo phy): upto HBR2.
	- (DDI-C to DDI-F): upto HBR3
 
RKLC:
- eDP/DP: Up to HBR3? Vccio dependent? (missing bspec pages)
 
JSL/EHL:
- eDP (DDI-A): Up to HBR2.
- DP (DDI-B to DDI-D): Up to HBR3 for higher Vccio _and_ retimers.
 
TGL:
- eDP (DDI-A to DDI-C): Up to HBR3 for higher Vccio.
- DP:
	- (DDI-A to DDI-C, combo phy): Up to HBR2.
	- (DDI-TC1 to DDI-TC6): Up to HBR3
 
DG1/ADL_S:
- eDP (all DDI is part of combo phy): Up to HBR3 for higher Vccio.
- DP (all DDI is part of combo phy): Up to HBR3 for higher Vccio _and_ retimers.
 
ADL_P/D13:
- eDP (DDI-A to DDI-B): Up to HBR3 for higher Vccio.
- DP:
	- (DDI-A to DDI-E): Up to HBR3 for higher Vccio.
	- (DDI-TC1 to DDI-TC4): Up to HBR3 for higher Vccio.

Some condition added during max rate calculation in this patch series
based on above conditions.

Animesh Manna (2):
  drm/i915/dp: fix EHL/JSL max source rates calculation
  drm/i915/dp: fix for ADL_P/S and DG2 dp/edp max source rates

Jani Nikula (2):
  drm/i915/dp: fix TGL and ICL max source rates
  drm/i915/dp: fix DG1 and RKL max source rates

Matt Atwood (1):
  drm/i915/dp: Fix eDP max rate for display 11+

 drivers/gpu/drm/i915/display/intel_dp.c | 62 +++++++++++++++++--------
 1 file changed, 42 insertions(+), 20 deletions(-)

-- 
2.29.0

