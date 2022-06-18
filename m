Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B505C43334
	for <intel-gfx@archiver.kernel.org>; Sat, 18 Jun 2022 05:43:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA3C11ABAE;
	Sat, 18 Jun 2022 05:43:12 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2D311ABAE
 for <intel-gfx@lists.freedesktop.org>; Sat, 18 Jun 2022 05:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655530991; x=1687066991;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A19uQRnYw9RnckLbaQfHB6YTvGyQUzJEluULPoXpSuY=;
 b=I0w8++WgmiIIoi/e0IYZV+tu7P6HNBdBb8V4skkn+rb0svqQxiPnctDA
 6HThgl5sHBvfj+gfKr76ofebCmKgJoetPxuvlH8JbwEqWLoOH8BuH5mfG
 w+rfdJzAc8JyIOeeRP2EPiVowdpSFceMtVqYgN298OZo2DxeHEa0DYlUk
 ssFY8Rk2L0KjttDbvPk5932DFrRFFQpsHS260V4lLltET6OdfoWRt3cND
 z/4teBmZael+ZaecoMHHQN8+crqaSP62DaUokI/W9WE2i8AKMBbAyu7Gf
 rYCtm2AKCFTXYbtJVyvCNU4Fx4qEhnDTbvkXyWKDmFy/H9NMh1enI2Pjy A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341316535"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341316535"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 22:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="580024781"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga002.jf.intel.com with ESMTP; 17 Jun 2022 22:43:10 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 17 Jun 2022 22:43:44 -0700
Message-Id: <20220618054345.2086300-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [Intel-gfx v2 0/1] drm/i915/guc: Don't update engine
 busyness stats too frequently
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

This change ensures we don't collect new stat counters too soon
after the last sample.

Changes from prior revs:
  v1:  - Move the location of the new logic to higher up
         the callstack in intel_guc_busyness_park (Umesh).
       - Fix typo threshold of jiffies-since-last from double
         to half of ping_delay (Umesh)

Alan Previn (1):
  drm/i915/guc: Don't update engine busyness stats too frequently

 drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  8 ++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 12 ++++++++++++
 2 files changed, 20 insertions(+)


base-commit: ac17a5249380aaabe5d1eaebd9b3a2eedc08ccdc
-- 
2.25.1

