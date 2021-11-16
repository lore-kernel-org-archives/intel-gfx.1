Return-Path: <SRS0=oPCP=QD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8C1C433FE
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Nov 2021 17:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68A36613A3
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Nov 2021 17:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68A36613A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB37B6E162;
	Tue, 16 Nov 2021 17:58:20 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D416E102;
 Tue, 16 Nov 2021 17:58:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="233606386"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="233606386"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 09:48:27 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="672056345"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 09:48:26 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 16 Nov 2021 09:48:13 -0800
Message-Id: <20211116174818.2128062-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v3 0/5] i915: Additional DG2 workarounds
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

We have a few more DG2 workarounds that weren't included in the initial
batch.

v2:
 - Apply pipe control workaround to rcs indirect context rather than xcs
   indirect context.

v3:
 - s/IS_DG2_DISP_STEP/IS_DG2_DISPLAY_STEPPING/ for consistency with
   other platforms.


Matt Atwood (1):
  drm/i915/dg2: extend Wa_1409120013 to DG2

Matt Roper (3):
  drm/i915/dg2: s/DISP_STEPPING/DISPLAY_STEPPING/
  drm/i915/dg2: Add Wa_14010547955
  drm/i915/dg2: Add Wa_16011777198

Ramalingam C (1):
  drm/i915/dg2: Add Wa_16013000631

 drivers/gpu/drm/i915/display/intel_display.c |  4 ++++
 drivers/gpu/drm/i915/gt/intel_lrc.c          |  5 +++++
 drivers/gpu/drm/i915/gt/intel_rc6.c          | 15 +++++++++++----
 drivers/gpu/drm/i915/i915_drv.h              |  2 +-
 drivers/gpu/drm/i915/i915_reg.h              |  5 +++--
 drivers/gpu/drm/i915/intel_pm.c              |  4 ++--
 6 files changed, 26 insertions(+), 9 deletions(-)

-- 
2.33.0

