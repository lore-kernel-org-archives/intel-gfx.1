Return-Path: <SRS0=pIl2=NV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE01C432BE
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Aug 2021 10:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B702F610C7
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Aug 2021 10:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B702F610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB22B89D8A;
	Mon, 30 Aug 2021 10:29:16 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C4889DB8;
 Mon, 30 Aug 2021 10:29:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="281964154"
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="281964154"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 03:29:13 -0700
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="540302176"
Received: from anikolae-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.249.47.21])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 03:29:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Date: Mon, 30 Aug 2021 13:28:58 +0300
Message-Id: <cover.1630319138.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/5] drm/displayid: VESA vendor block and
 drm/i915 MSO use of it
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

We need the DisplayID VESA vendor block data for properly configuring
eDP MSO (Multi-SST Operation) pixel overlap.

I haven't actually tested this on a panel that requires the overlap, but
this is all pretty straightforward to prepare for that use case.

BR,
Jani.

Jani Nikula (5):
  drm/displayid: re-align data block macros
  drm/displayid: add DisplayID v2.0 data blocks and primary use cases
  drm/edid: parse the DisplayID v2.0 VESA vendor block for MSO
  drm/i915/edp: postpone MSO init until after EDID read
  drm/i915/edp: use MSO pixel overlap from DisplayID data

 drivers/gpu/drm/drm_edid.c              | 63 ++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 14 ++--
 include/drm/drm_connector.h             | 12 +++
 include/drm/drm_displayid.h             | 99 +++++++++++++++++--------
 4 files changed, 154 insertions(+), 34 deletions(-)

-- 
2.20.1

