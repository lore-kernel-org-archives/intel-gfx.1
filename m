Return-Path: <SRS0=r3jS=N6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E847C433F5
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Sep 2021 09:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A17561131
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Sep 2021 09:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A17561131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58AD6E16D;
	Wed,  8 Sep 2021 09:38:20 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84ADB6E170
 for <intel-gfx@lists.freedesktop.org>; Wed,  8 Sep 2021 09:38:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220492785"
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="220492785"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 02:38:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="693170131"
Received: from amanna.iind.intel.com ([10.223.74.76])
 by fmsmga006.fm.intel.com with ESMTP; 08 Sep 2021 02:38:15 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, mika.kahola@intel.com, jani.nikula@intel.com,
 manasi.d.navare@intel.com, Animesh Manna <animesh.manna@intel.com>
Date: Wed,  8 Sep 2021 14:45:39 +0530
Message-Id: <20210908091544.13772-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [RFC 0/5] Panel replay phase1 implementation
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

Panel Replay is a power saving feature for DP 2.0 monitor and similar
to PSR on EDP.

These patches are basic enablement patches and reused psr
framework to add panel replay related new changes which
may need further fine tuning to fill the gap if there is any.

Note: The patches are not tested due to unavailability of monitor

Animesh Manna (5):
  drm/i915/panelreplay: update plane selective fetch register definition
  drm/i915/panelreplay: Feature flag added for panel replay
  drm/i915/panelreplay: Initializaton and compute config for panel
    replay
  drm/i915/panelreplay: enable/disable panel replay
  drm/i915/panelreplay: Added state checker for panel replay state

 drivers/gpu/drm/i915/display/intel_display.c  |  1 +
 .../drm/i915/display/intel_display_types.h    |  4 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 47 +++++++++--
 drivers/gpu/drm/i915/display/intel_psr.c      | 82 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_psr.h      |  3 +
 drivers/gpu/drm/i915/i915_drv.h               |  1 +
 drivers/gpu/drm/i915/i915_pci.c               |  1 +
 drivers/gpu/drm/i915/i915_reg.h               | 33 ++++----
 drivers/gpu/drm/i915/intel_device_info.h      |  1 +
 include/drm/drm_dp_helper.h                   |  6 ++
 10 files changed, 147 insertions(+), 32 deletions(-)

-- 
2.29.0

