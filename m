Return-Path: <SRS0=iWgT=NO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77BEC4338F
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Aug 2021 12:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A43EF6138E
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Aug 2021 12:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A43EF6138E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A846489C94;
	Mon, 23 Aug 2021 12:25:45 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E02E89C94
 for <intel-gfx@lists.freedesktop.org>; Mon, 23 Aug 2021 12:25:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="204227546"
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="204227546"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 05:25:43 -0700
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="525961088"
Received: from todonova-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.249.44.47])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 05:25:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	daniel@ffwll.ch
Date: Mon, 23 Aug 2021 15:25:30 +0300
Message-Id: <cover.1629721467.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/6] drm/i915/display: split out some dpt and fb
 stuff from intel_display.c
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

Make some forward progress on reducing intel_display.c size.

Jani Nikula (6):
  drm/i915/display: split out dpt out of intel_display.c
  drm/i915: add HAS_ASYNC_FLIPS feature macro
  drm/i915/fb: move intel_tile_width_bytes() to intel_fb.c
  drm/i915/fb: move intel_fb_align_height() to intel_fb.c
  drm/i915/fb: move intel_surf_alignment() to intel_fb.c
  drm/i915/fb: move user framebuffer stuff to intel_fb.c

 drivers/gpu/drm/i915/Makefile                |   1 +
 drivers/gpu/drm/i915/display/intel_display.c | 709 +------------------
 drivers/gpu/drm/i915/display/intel_display.h |   6 -
 drivers/gpu/drm/i915/display/intel_dpt.c     | 229 ++++++
 drivers/gpu/drm/i915/display/intel_dpt.h     |  19 +
 drivers/gpu/drm/i915/display/intel_fb.c      | 481 +++++++++++++
 drivers/gpu/drm/i915/display/intel_fb.h      |  20 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c   |   1 +
 drivers/gpu/drm/i915/i915_drv.h              |   2 +
 9 files changed, 752 insertions(+), 716 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpt.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpt.h

-- 
2.20.1

