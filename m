Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF87AC77B76
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Apr 2023 18:26:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B4110E339;
	Fri, 21 Apr 2023 18:26:12 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6F310E2E4;
 Fri, 21 Apr 2023 18:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682101571; x=1713637571;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HT1vfMwZpD2akETDmfmquuBsKsqWX4PaUX4OcA3kMD8=;
 b=UxcyGPe+2XRMQjO0r0cGp9oilHM0/st7RaKa83w83AHYfcJhmp9dr1KL
 eZk+OZlceKynSPCrON61leG/yrN0XmLfMaemfz3pqj3IXBZQXnVad/MmW
 23O4+lFaeut/LwPBG2ktQxo6fuvayTfpufYaQnNupjylxgK9N2ui0vKtq
 V/6M6vVchRwb74ewsXGcOf1JBfWK8uR+wMDdc4C/vvWhz4MSaPAsJgIDE
 ZHOoHcLZ/23lyXtD1RHno3cNdHReQvDgV3R5d8B2SzSXcyEmNsYG4mt5j
 PqaKXW7GdHECmgmtR131IJNDn7c0e4BFDQnFQWj+Sxoj5m4+gHsocNHYb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="347959441"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="347959441"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 11:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="781683302"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="781683302"
Received: from ameghere-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.194])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 11:25:56 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>, Fei Yang <fei.yang@intel.com>
Date: Fri, 21 Apr 2023 20:25:33 +0200
Message-Id: <20230421182535.292670-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 0/2] Define MOCS and PAT tables for MTL
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Lucas Martins De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Matt Roper <matthew.d.roper@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi,

just extracting this patch from Fei's series.

Andi

Changelog:
==========
v1 -> v2:
Taken from Fei's new series: https://patchwork.freedesktop.org/series/115980/
 - Removed unnecessary defines
 - Place the selftest patches in a different patch

Fei Yang (1):
  drm/i915/mtl: fix mocs selftest

Madhumitha Tolakanahalli Pradeep (1):
  drm/i915/mtl: Define MOCS and PAT tables for MTL

 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  6 ++-
 drivers/gpu/drm/i915/gt/intel_gtt.c     | 47 ++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gtt.h     |  8 +++
 drivers/gpu/drm/i915/gt/intel_mocs.c    | 70 ++++++++++++++++++++++++-
 drivers/gpu/drm/i915/gt/selftest_mocs.c |  3 +-
 5 files changed, 130 insertions(+), 4 deletions(-)

-- 
2.40.0

