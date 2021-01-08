Return-Path: <SRS0=Vm3B=GL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85497C433E0
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Jan 2021 23:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F5572333E
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Jan 2021 23:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F5572333E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F3E6E863;
	Fri,  8 Jan 2021 23:19:25 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26396E860
 for <intel-gfx@lists.freedesktop.org>; Fri,  8 Jan 2021 23:19:23 +0000 (UTC)
IronPort-SDR: uRnLlR//SdArkQwUuJE8/Af+u4drOw2qQPLKRTus9ZByM3vBV6BEuxzMzckBQPMaFCXjZvxJAx
 wshvQ3IHGWRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9858"; a="177814758"
X-IronPort-AV: E=Sophos;i="5.79,333,1602572400"; d="scan'208";a="177814758"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 15:19:23 -0800
IronPort-SDR: YmRt6fbn96AVLE5r/rKmjde9pzx2heJl6cBjm6tK45PBr7qfa+jDyvuZZbYAgz3Wi5A/Fy+EEZ
 Avy3k9Z6eMAw==
X-IronPort-AV: E=Sophos;i="5.79,333,1602572400"; d="scan'208";a="380285080"
Received: from ssapkota-mobl.amr.corp.intel.com (HELO
 aswarup-mobl.amr.corp.intel.com) ([10.254.118.251])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 15:19:22 -0800
From: Aditya Swarup <aditya.swarup@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  8 Jan 2021 15:18:51 -0800
Message-Id: <20210108231853.2859646-1-aditya.swarup@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/2] Use TGL stepping info and add ADLS platform
 changes
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

1. Change TGL REVID enums/macros to TGL stepping info to apply TGL WAs.
2. Add ADL-S platform info and PCI IDs and add TGL style stepping macros
   for applying WAs. 

Aditya Swarup (1):
  drm/i915/tgl: Use TGL stepping info for applying WAs

Caz Yokoyama (1):
  drm/i915/adl_s: Add ADL-S platform info and PCI ids

 .../drm/i915/display/intel_display_power.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  4 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |  2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 34 +++++---
 drivers/gpu/drm/i915/i915_drv.h               | 79 ++++++++++++-------
 drivers/gpu/drm/i915/i915_pci.c               | 13 +++
 drivers/gpu/drm/i915/intel_device_info.c      |  1 +
 drivers/gpu/drm/i915/intel_device_info.h      |  1 +
 drivers/gpu/drm/i915/intel_pm.c               |  2 +-
 include/drm/i915_pciids.h                     | 11 +++
 10 files changed, 104 insertions(+), 45 deletions(-)

-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
