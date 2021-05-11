Return-Path: <SRS0=kkqM=KG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C71C433B4
	for <intel-gfx@archiver.kernel.org>; Tue, 11 May 2021 08:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E8F961184
	for <intel-gfx@archiver.kernel.org>; Tue, 11 May 2021 08:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E8F961184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFC66E9FC;
	Tue, 11 May 2021 08:31:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CE16E9FA;
 Tue, 11 May 2021 08:31:29 +0000 (UTC)
IronPort-SDR: QgmvR6x21xr7UILbtD3S4yNV96kuUmRxwq9ZxUwRNVrpcUQfr5vcY/27zSqBQtUC44nrIcaxZX
 kQCL0KswIYjQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="284875108"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="284875108"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:31:29 -0700
IronPort-SDR: uPMWVYadRgC/Id/Q2bb7qS9BlLk0Y0D1SPeZaxsKOrAnSsL7cx6fnc12qkQHpSGzn+c8FwKFI5
 MYAw5IP8+O6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536895395"
Received: from debian-skl.sh.intel.com ([10.239.160.37])
 by fmsmga001.fm.intel.com with ESMTP; 11 May 2021 01:31:28 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 11 May 2021 16:33:29 +0800
Message-Id: <20210511083332.1740601-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/3] Fix I915_GVT dependency
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This is to fix I915_GVT dependency mess to move all vfio/dev handling
into kvmgt module, so gvt device model core won't need to depend on vfio/mdev.

Currently apply against linus master with merge from vfio tree. This targets
for 5.13 fix.

thanks

Zhenyu Wang (3):
  drm/i915/gvt: Move mdev attribute groups into kvmgt module
  Revert "vfio/gvt: fix DRM_I915_GVT dependency on VFIO_MDEV"
  Revert "vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV"

 drivers/gpu/drm/i915/Kconfig         |   1 -
 drivers/gpu/drm/i915/gvt/gvt.c       | 124 +------------------------
 drivers/gpu/drm/i915/gvt/gvt.h       |   3 -
 drivers/gpu/drm/i915/gvt/hypercall.h |   2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 129 +++++++++++++++++++++++++--
 drivers/gpu/drm/i915/gvt/mpt.h       |   4 +-
 6 files changed, 126 insertions(+), 137 deletions(-)

-- 
2.31.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
