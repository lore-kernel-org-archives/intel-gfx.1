Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB83C77B61
	for <intel-gfx@archiver.kernel.org>; Mon, 24 Apr 2023 16:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13B910E55C;
	Mon, 24 Apr 2023 16:11:45 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DEE10E1A6;
 Mon, 24 Apr 2023 16:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682352703; x=1713888703;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jABK15YiphsYfiscTtHzZO8ulLqkFThb+aET7bDonzk=;
 b=eeX573qxHeI39Zy2gRcntBywohfIZoY0jfZJs7hnYrgln8ui04CXkop6
 /MmU+/a6pBBqhdopyHjlypWaculqKzT2ns6G081ZdFObqU0dASzMQZMcH
 VDC5x4fZQE6SR0RPkWe3pDXS1pRou2zMtQl+WWQ9yP6JhR5mVhiJhJe+f
 7drCzK2qFd+GBlC83n1jMN36d+iSBp2ji7VX/H2mvi3i/ccn05nCgs5Ug
 6Kyi6xtSfv6L2hW7wuUYoWK2T+GLaptD7BfTNnM9na5GsIZ4kdqvcsVmw
 lR1p/9bx+GDnTfwUTSKvkcwD0myBgbyIQxF9ZzW5suo12PPQPsDYYcqoo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="349293201"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="349293201"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="867533873"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="867533873"
Received: from apalfi-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.34.175])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:09:23 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>, Fei Yang <fei.yang@intel.com>
Date: Mon, 24 Apr 2023 18:09:11 +0200
Message-Id: <20230424160913.19886-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/2] Restore MTL boot
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

The two patches reverted in this series are, together, preventing
MTL from booting.

Revert them until the fix is deployed.

Andi

Andi Shyti (2):
  Revert "drm/i915/mtl: fix mocs selftest"
  Revert "drm/i915/mtl: Define MOCS and PAT tables for MTL"

 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  6 +--
 drivers/gpu/drm/i915/gt/intel_gtt.c     | 47 +----------------
 drivers/gpu/drm/i915/gt/intel_gtt.h     |  8 ---
 drivers/gpu/drm/i915/gt/intel_mocs.c    | 70 +------------------------
 drivers/gpu/drm/i915/gt/selftest_mocs.c |  3 +-
 5 files changed, 4 insertions(+), 130 deletions(-)

-- 
2.40.0

