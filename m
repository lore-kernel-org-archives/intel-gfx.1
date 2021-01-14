Return-Path: <SRS0=EqF4=GR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C841C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 11:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ECB1238A1
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 11:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ECB1238A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AD36E1F5;
	Thu, 14 Jan 2021 11:14:10 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92756E1F5
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Jan 2021 11:14:08 +0000 (UTC)
IronPort-SDR: qea0o/Ixq0catta4u0LNaDlv5zLheF2cG4PQ1EX39DY4uI4E2jJY15ciwVLJAu2k4OhdmTvQ+8
 q91PpOIlxKmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="158123127"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="158123127"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 03:14:08 -0800
IronPort-SDR: iiOokYJj/aBzDRWSQkHiEXd2j+efjyB0RhG2/mF6VSEnYaeR0HRpYCEKpCMvRZ7XpCcB0+3UIq
 U1eAIO8pBntA==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="382231905"
Received: from dforourk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.254.146])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 03:14:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 14 Jan 2021 13:13:44 +0200
Message-Id: <cover.1610622609.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 00/11] [rfc v7.1] rebased refactor of
 intel_display
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
Cc: jani.nikula@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

I inadvertently pushed some patches this morning that ended up conflicting with
Dave's series [1], so here's a rebase.

Two patches in the end are missing Dave's Signed-off-by.

I also fixed some HDRTEST issues. Dave, could I persuade you to enable
CONFIG_DRM_I915_WERROR=y when building i915 please? It'll keep the headers
clean.

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/85846/


Dave Airlie (11):
  drm/i915: refactor some crtc code out of intel display. (v2)
  drm/i915: refactor pll code out into intel_dpll.c
  drm/i915: split fdi code out from intel_display.c
  drm/i915: refactor ddi translations into a separate file
  drm/i915: migrate hsw fdi code to new file.
  drm/i915: migrate skl planes code new file (v3)
  drm/i915: move pipe update code into crtc.
  drm/i915: split fb scalable checks into g4x and skl versions
  drm/i915: move is_ccs_modifier to an inline
  drm/i915: migrate pll enable/disable code to intel_dpll.[ch]
  drm/i915: migrate i9xx plane get config

 drivers/gpu/drm/i915/Makefile                 |    7 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c     |  123 +-
 drivers/gpu/drm/i915/display/i9xx_plane.h     |    4 +
 drivers/gpu/drm/i915/display/icl_dsi.c        |    1 +
 drivers/gpu/drm/i915/display/intel_crt.c      |    1 +
 drivers/gpu/drm/i915/display/intel_crtc.c     |  564 +++
 drivers/gpu/drm/i915/display/intel_crtc.h     |   22 +
 drivers/gpu/drm/i915/display/intel_ddi.c      | 1559 +-----
 drivers/gpu/drm/i915/display/intel_ddi.h      |    8 +-
 .../drm/i915/display/intel_ddi_buf_trans.c    | 1358 ++++++
 .../drm/i915/display/intel_ddi_buf_trans.h    |  100 +
 drivers/gpu/drm/i915/display/intel_display.c  | 4193 +----------------
 drivers/gpu/drm/i915/display/intel_display.h  |   34 +-
 .../drm/i915/display/intel_display_types.h    |   51 +
 drivers/gpu/drm/i915/display/intel_dp.c       |    1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |    1 +
 drivers/gpu/drm/i915/display/intel_dpll.c     | 1872 ++++++++
 drivers/gpu/drm/i915/display/intel_dpll.h     |   41 +
 drivers/gpu/drm/i915/display/intel_fdi.c      |  822 ++++
 drivers/gpu/drm/i915/display/intel_fdi.h      |   25 +
 drivers/gpu/drm/i915/display/intel_pps.c      |    1 +
 drivers/gpu/drm/i915/display/intel_psr.c      |    1 +
 drivers/gpu/drm/i915/display/intel_sprite.c   | 1662 +------
 drivers/gpu/drm/i915/display/intel_sprite.h   |    6 +-
 .../drm/i915/display/skl_universal_plane.c    | 2263 +++++++++
 .../drm/i915/display/skl_universal_plane.h    |   33 +
 drivers/gpu/drm/i915/display/vlv_dsi.c        |    1 +
 drivers/gpu/drm/i915/intel_pm.c               |    1 +
 28 files changed, 7522 insertions(+), 7233 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_crtc.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_crtc.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpll.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpll.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_fdi.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_fdi.h
 create mode 100644 drivers/gpu/drm/i915/display/skl_universal_plane.c
 create mode 100644 drivers/gpu/drm/i915/display/skl_universal_plane.h

-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
