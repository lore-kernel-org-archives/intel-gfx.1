Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040CFC433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 27 May 2022 16:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BED10E124;
	Fri, 27 May 2022 16:33:53 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C5510E05E;
 Fri, 27 May 2022 16:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653669232; x=1685205232;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ChxNC8KQfxWtB5vfjf0x+IXw9I/pmtm+ynhl7jsz3V4=;
 b=WbzZqnv+4Em9fq+wEITzdv9rZdZphC3KxxOjxKP2LkPlgXkBCqI7jG4o
 sBRIFq3uPTYkoxg6yUziyUVxEOht0zGSA7XrlCi428Sd+oUjWup9MSxmd
 +N6Bm1q0pN++rPDl8MwmPDylhgiXnJj0BFHoyhRYsPYwUcmh/mZaJ6/Jg
 AVzahY++26BsCvcIQDGvUnmMdmH7aHQuHNmxFNrqfzR48xdck+aphFlzC
 uISZvmm/8xh+lXWNBG0cAvkPEEvIg7nB4ah9NQEQQ3hdE7vtnNjZpqF2N
 coWPQq2vdzgwhBazjcP9YVy+uiJWyKfMlkc+IexdpVtIVzgxz2VkdloHw Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10360"; a="262138716"
X-IronPort-AV: E=Sophos;i="5.91,256,1647327600"; d="scan'208";a="262138716"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 09:33:51 -0700
X-IronPort-AV: E=Sophos;i="5.91,256,1647327600"; d="scan'208";a="550291700"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 09:33:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 27 May 2022 09:33:46 -0700
Message-Id: <20220527163348.1936146-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/2] i915: PVC steppings and initial workarounds
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Matt Roper (1):
  drm/i915/pvc: Extract stepping information from PCI revid

Stuart Summers (1):
  drm/i915/pvc: Add initial PVC workarounds

 drivers/gpu/drm/i915/gt/intel_engine_regs.h |  5 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  3 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 61 +++++++++++++++---
 drivers/gpu/drm/i915/i915_drv.h             | 13 ++++
 drivers/gpu/drm/i915/intel_pm.c             | 16 ++++-
 drivers/gpu/drm/i915/intel_step.c           | 70 ++++++++++++++++++++-
 drivers/gpu/drm/i915/intel_step.h           |  4 +-
 7 files changed, 158 insertions(+), 14 deletions(-)

-- 
2.35.3

