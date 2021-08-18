Return-Path: <SRS0=K2GL=NJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D697C4338F
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Aug 2021 10:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E018160EFE
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Aug 2021 10:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E018160EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C5D6E528;
	Wed, 18 Aug 2021 10:11:17 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A066E525
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Aug 2021 10:11:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="216022646"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="216022646"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 03:11:15 -0700
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="520891334"
Received: from mdbadill-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.249.42.92])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 03:11:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Date: Wed, 18 Aug 2021 13:11:04 +0300
Message-Id: <cover.1629281426.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/5] drm/i915: header cleanups
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

Some header cleanups I've had around but never posted.

Jani Nikula (5):
  drm/i915/irq: reduce inlines to reduce header dependencies
  drm/i915: intel_runtime_pm.h does not actually need intel_display.h
  drm/i915/pm: use forward declaration to remove an include
  drm/i915/panel: move intel_panel_use_ssc() out of headers
  drm/i915/fdi: move intel_fdi_link_freq() to intel_fdi.[ch]

 drivers/gpu/drm/i915/display/intel_display.c  |  1 +
 .../drm/i915/display/intel_display_types.h    | 17 -------
 drivers/gpu/drm/i915/display/intel_fdi.c      |  9 ++++
 drivers/gpu/drm/i915/display/intel_fdi.h      |  4 ++
 drivers/gpu/drm/i915/display/intel_panel.c    |  8 +++
 drivers/gpu/drm/i915/display/intel_panel.h    |  1 +
 drivers/gpu/drm/i915/i915_irq.c               | 50 ++++++++++++++----
 drivers/gpu/drm/i915/i915_irq.h               | 51 ++++---------------
 drivers/gpu/drm/i915/intel_pm.h               |  2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.h       |  2 -
 10 files changed, 74 insertions(+), 71 deletions(-)

-- 
2.20.1

