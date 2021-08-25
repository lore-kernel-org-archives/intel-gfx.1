Return-Path: <SRS0=ZGLP=NQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952BFC4338F
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Aug 2021 11:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C220610E5
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Aug 2021 11:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C220610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2C46E1CD;
	Wed, 25 Aug 2021 11:07:04 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984EE6E1CD
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Aug 2021 11:07:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="217534241"
X-IronPort-AV: E=Sophos;i="5.84,350,1620716400"; d="scan'208";a="217534241"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 04:06:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,350,1620716400"; d="scan'208";a="527217644"
Received: from mburkard-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.213.64])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 04:06:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Lyude Paul <lyude@redhat.com>
Date: Wed, 25 Aug 2021 14:06:49 +0300
Message-Id: <cover.1629888677.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/3] drm/i915: better backlight & panel
 abstractions
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

Extract the backlight code out of intel_panel.c, and rename the panel
and backlight functions according to usual conventions.

Lyude, I haven't seen follow-ups on the DPCD backlight stuff you've
worked on. Is it okay to merge this (and inevitably cause you conflicts)
or shall I wait more?

BR,
Jani.


Cc: Lyude Paul <lyude@redhat.com>

Jani Nikula (3):
  drm/i915/backlight: extract backlight code to a separate file
  drm/i915/backlight: mass rename functions to have intel_backlight_
    prefix
  drm/i915/panel: mass rename functions to have intel_panel_ prefix

 drivers/gpu/drm/i915/Makefile                 |    1 +
 drivers/gpu/drm/i915/display/g4x_dp.c         |    4 +-
 drivers/gpu/drm/i915/display/icl_dsi.c        |   13 +-
 .../gpu/drm/i915/display/intel_backlight.c    | 1776 ++++++++++++++++
 .../gpu/drm/i915/display/intel_backlight.h    |   52 +
 .../gpu/drm/i915/display/intel_connector.c    |    4 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |    4 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   16 +-
 .../drm/i915/display/intel_dp_aux_backlight.c |   12 +-
 drivers/gpu/drm/i915/display/intel_dvo.c      |    2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |    2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c     |   18 +-
 drivers/gpu/drm/i915/display/intel_opregion.c |    5 +-
 drivers/gpu/drm/i915/display/intel_panel.c    | 1786 +----------------
 drivers/gpu/drm/i915/display/intel_panel.h    |   42 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |   16 +-
 16 files changed, 1895 insertions(+), 1858 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_backlight.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_backlight.h

-- 
2.20.1

