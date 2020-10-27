Return-Path: <SRS0=9UyP=EC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84172C4363A
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2020 04:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D1FC216FD
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2020 04:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D1FC216FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667156E2DC;
	Tue, 27 Oct 2020 04:52:58 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72766E2DC;
 Tue, 27 Oct 2020 04:52:57 +0000 (UTC)
IronPort-SDR: vIhtATg6+m27WXsnpKwJ/qqZDb/uK8Oq9cmDJaWWIRyYx74Udah0uIAtP4K27hlFyD9HJwvTu7
 cXHkMQ1anuLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="147310796"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="147310796"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 21:52:56 -0700
IronPort-SDR: ZCgTeJdM5KITVfeFoGt3QGQvjY9WvqykVAbMkSbYMhZiWdhw3gczGUkiFA3Mz1WdzQRytHT13c
 5fSlaS5pQqlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="394342929"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by orsmga001.jf.intel.com with ESMTP; 26 Oct 2020 21:52:54 -0700
From: Colin Xu <colin.xu@intel.com>
To: zhenyuw@linux.intel.com
Date: Tue, 27 Oct 2020 12:52:49 +0800
Message-Id: <20201027045249.158412-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v7 0/2] Enable GVT suspend/resume
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This patchset enables GVT suspend/resume so that GVT enabled VM can
continue running after host resuming from suspend state.

V2:
- Change kzalloc/kfree to vzalloc/vfree since the space allocated
from kmalloc may not enough for all saved GGTT entries.
- Keep gvt suspend/resume wrapper in intel_gvt.h/intel_gvt.c and
move the actual implementation to gvt.h/gvt.c. (zhenyu)
- Check gvt config on and active with intel_gvt_active(). (zhenyu)

V3: (zhenyu)
- Incorrect copy length. Should be num entries * entry size.
- Use memcpy_toio()/memcpy_fromio() instead of memcpy for iomem.
- Add F_PM_SAVE flags to indicate which MMIOs to save/restore for PM.

V4:
Rebase.

V5:
Fail intel_gvt_pm_suspend if fail to save ggtt.

V6:
Save host entry to per-vGPU gtt.ggtt_mm on each host_entry update so
that no need to read from HW and save during suspend.

V7:
Restore GGTT entry based on present bit.
Split fence restore and mmio restore in different functions.

Colin Xu (2):
  drm/i915/gvt: Save/restore HW status to support GVT suspend/resume
  drm/i915/gvt: Add GVT resume routine to i915

 drivers/gpu/drm/i915/gvt/gtt.c      | 64 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.h      |  4 ++
 drivers/gpu/drm/i915/gvt/gvt.c      |  9 ++++
 drivers/gpu/drm/i915/gvt/gvt.h      |  3 ++
 drivers/gpu/drm/i915/gvt/handlers.c | 44 ++++++++++++++++++--
 drivers/gpu/drm/i915/gvt/mmio.h     |  4 ++
 drivers/gpu/drm/i915/i915_drv.c     |  2 +
 drivers/gpu/drm/i915/intel_gvt.c    | 15 +++++++
 drivers/gpu/drm/i915/intel_gvt.h    |  5 +++
 9 files changed, 147 insertions(+), 3 deletions(-)

-- 
2.29.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
