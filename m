Return-Path: <SRS0=YfZL=DI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38167C4727E
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2020 21:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE34620796
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2020 21:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE34620796
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068946E22B;
	Thu,  1 Oct 2020 21:32:36 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299C06E226;
 Thu,  1 Oct 2020 21:32:34 +0000 (UTC)
IronPort-SDR: P7V1femI1OUkFbE9+ztBsj0lhOpD7xc0s5jLKHdetrYnIBIodwGNlVgzGg9a/ffeRMUQiv2biH
 Z7t9uUlYonVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="226968560"
X-IronPort-AV: E=Sophos;i="5.77,325,1596524400"; d="scan'208";a="226968560"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 14:32:31 -0700
IronPort-SDR: cpA11V1tub7YOvO2NuPc5SPAytr+rWIB2z410tLoh3dvVTI8BYGrSS8gBUYR+mNdAO+vikiMx3
 oe9Ac+e7+9CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,325,1596524400"; d="scan'208";a="339714746"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by fmsmga004.fm.intel.com with ESMTP; 01 Oct 2020 14:32:28 -0700
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 james.ausmus@intel.com, matthew.d.roper@intel.com, jose.souza@intel.com,
 ville.syrjala@linux.intel.com, lucas.demarchi@intel.com,
 hariom.pandey@intel.com
Date: Fri,  2 Oct 2020 02:54:33 +0530
Message-Id: <20201001212435.269840-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 0/2] drm/i915/jsl: Update JSL Voltage swing
 table
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

Patch series covers following thigns:

1. Split and differentiate between EHL and JSL platfrom
2. Update voltage swing table for eDP on JSL platform

Changes since V2 :
	- Added IS_EHL_JSL to replace IS_ELKHARTLAKE
	- EHL/JSL PCI ids split added
	- Rebased to drm master commit
Changes since V1 :
        - IS_ELKHARTLAKE and IS_JASPERLAKE is replaced with
          HAS_PCH_MCC(EHL) and HAS_PCH_JSP(JSL) respectively
        - Reverted EHL/JSL PCI ids split change

Tejas Upadhyay (2):
  drm/i915/jsl: Split EHL/JSL platform info and PCI ids
  drm/i915/edp/jsl: Update vswing table for HBR and HBR2

 drivers/gpu/drm/i915/display/icl_dsi.c        |  4 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  4 +-
 .../gpu/drm/i915/display/intel_combo_phy.c    |  6 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 95 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_display.c  |  8 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 16 ++--
 drivers/gpu/drm/i915/gt/intel_sseu.c          |  2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |  2 +-
 drivers/gpu/drm/i915/i915_drv.h               |  5 +-
 drivers/gpu/drm/i915/i915_pci.c               |  9 ++
 drivers/gpu/drm/i915/intel_device_info.c      |  1 +
 drivers/gpu/drm/i915/intel_device_info.h      |  1 +
 drivers/gpu/drm/i915/intel_pch.c              |  6 +-
 include/drm/i915_pciids.h                     |  9 +-
 15 files changed, 134 insertions(+), 36 deletions(-)

-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
