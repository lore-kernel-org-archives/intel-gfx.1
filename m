Return-Path: <SRS0=PmWI=DX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F02FC433E7
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Oct 2020 05:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFDD7207F7
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Oct 2020 05:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFDD7207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C158920A;
	Fri, 16 Oct 2020 05:59:21 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C968920A;
 Fri, 16 Oct 2020 05:59:20 +0000 (UTC)
IronPort-SDR: XmVTgqp7btdgBDlSmR5ZmsAMfMXQduiUU4b75pyeKSRbJbv/U9dT6wVIz9tXBujXIK8YGhi4b/
 L+PywPx5yxsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="163915712"
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; d="scan'208";a="163915712"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 22:59:19 -0700
IronPort-SDR: dT3XJbbOWxCpbWKBZnNM/6YiAuYMEN3emZNGpUNTVvqQN3JgL8E8+MxaSMvM6pF/KMWt7cka+g
 Wk1AvJLqzkxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; d="scan'208";a="357262504"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.24])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Oct 2020 22:59:18 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 zhenyuw@linux.intel.com
Date: Fri, 16 Oct 2020 13:59:16 +0800
Message-Id: <20201016055916.294839-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v4 0/2] Enable GVT suspend/resume
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

Colin Xu (2):
  drm/i915/gvt: Save/restore HW status for GVT during suspend/resume
  drm/i915/gvt: Add GVT suspend/resume routine to i915

 drivers/gpu/drm/i915/gvt/gtt.c      | 75 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.h      |  2 +
 drivers/gpu/drm/i915/gvt/gvt.c      | 15 ++++++
 drivers/gpu/drm/i915/gvt/gvt.h      |  8 +++
 drivers/gpu/drm/i915/gvt/handlers.c | 39 +++++++++++++--
 drivers/gpu/drm/i915/gvt/mmio.h     |  3 ++
 drivers/gpu/drm/i915/gvt/vgpu.c     |  1 +
 drivers/gpu/drm/i915/i915_drv.c     |  4 ++
 drivers/gpu/drm/i915/intel_gvt.c    | 29 +++++++++++
 drivers/gpu/drm/i915/intel_gvt.h    | 10 ++++
 10 files changed, 183 insertions(+), 3 deletions(-)

-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
