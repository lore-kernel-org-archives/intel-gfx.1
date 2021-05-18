Return-Path: <SRS0=F/h7=KN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F115C43461
	for <intel-gfx@archiver.kernel.org>; Tue, 18 May 2021 19:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1B406124C
	for <intel-gfx@archiver.kernel.org>; Tue, 18 May 2021 19:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1B406124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C366EC79;
	Tue, 18 May 2021 19:53:13 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC12B6EC79
 for <intel-gfx@lists.freedesktop.org>; Tue, 18 May 2021 19:53:11 +0000 (UTC)
IronPort-SDR: XSQEW3h33twofI24KPZXHkP3emNWO/D2Gg698kYVzd7vv9tAJZVXGypfzfSIvY8+YesO+tBpUe
 y1Tx6knbkJkg==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="197715532"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="197715532"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 12:53:10 -0700
IronPort-SDR: EM7qUP+NYUT5NltQST0/Wff+u+Nvs/Ltzn+tWNjqUmQZMPMLY47r5qHc8LTnzraBvPCJWvH71B
 zGkwzbc+yQTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="394989484"
Received: from anushasr-mobl6.jf.intel.com ([10.165.21.155])
 by orsmga006.jf.intel.com with ESMTP; 18 May 2021 12:53:09 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 18 May 2021 12:53:04 -0700
Message-Id: <20210518195309.4917-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 0/5]  Rename all CSR references to DMC
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

Currently in our driver we use both CSR and DMC interchangeably.
Even though the spec mentions both, we do not follow that convention
in the driver.

Renaming all references of CSR to just be DMC. This hopefully makes
the driver of this part a litlle less confusing.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>

Acked-by: Jani Nikula <jani.nikula@linux.intel.com>

Anusha Srivatsa (5):
  drm/i915/dmc: s/intel_csr/intel_dmc
  drm/i915/dmc: s/HAS_CSR/HAS_DMC
  drm/i915/dmc: Rename macro names containing csr
  drm/i915/dmc: Rename functions names having "csr"
  drm/i915/dmc: s/intel_csr.c/intel_dmc.c and s/intel_csr.h/intel_dmc.h

 Documentation/gpu/i915.rst                    |  10 +-
 drivers/gpu/drm/i915/Makefile                 |   2 +-
 drivers/gpu/drm/i915/display/intel_csr.h      |  21 --
 drivers/gpu/drm/i915/display/intel_display.c  |  16 +-
 .../drm/i915/display/intel_display_debugfs.c  |  30 +-
 .../drm/i915/display/intel_display_power.c    |  82 ++---
 .../i915/display/{intel_csr.c => intel_dmc.c} | 333 +++++++++---------
 drivers/gpu/drm/i915/display/intel_dmc.h      |  21 ++
 drivers/gpu/drm/i915/display/intel_psr.c      |   2 +-
 drivers/gpu/drm/i915/i915_drv.c               |   8 +-
 drivers/gpu/drm/i915/i915_drv.h               |   6 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  12 +-
 drivers/gpu/drm/i915/i915_pci.c               |   4 +-
 drivers/gpu/drm/i915/i915_reg.h               |  28 +-
 drivers/gpu/drm/i915/intel_device_info.c      |   2 +-
 drivers/gpu/drm/i915/intel_device_info.h      |   2 +-
 16 files changed, 289 insertions(+), 290 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/display/intel_csr.h
 rename drivers/gpu/drm/i915/display/{intel_csr.c => intel_dmc.c} (66%)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dmc.h

-- 
2.25.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
