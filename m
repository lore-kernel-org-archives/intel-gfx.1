Return-Path: <SRS0=wBbn=P7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64113C433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Nov 2021 19:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22AFA60EE9
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Nov 2021 19:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22AFA60EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C72D6E957;
	Fri, 12 Nov 2021 19:38:28 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D916E288
 for <intel-gfx@lists.freedesktop.org>; Fri, 12 Nov 2021 19:38:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10166"; a="231916959"
X-IronPort-AV: E=Sophos;i="5.87,230,1631602800"; d="scan'208";a="231916959"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 11:38:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,230,1631602800"; d="scan'208";a="471245615"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 12 Nov 2021 11:38:14 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 21:38:13 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 12 Nov 2021 21:38:04 +0200
Message-Id: <20211112193813.8224-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/9] drm/i915: Register define cleanups
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

A bunch of REG_BIT() stuff a random collection of registers.
Some of these are related to areas where I plan to do a bit of
additional work on the code itself, and a few are just some easy
ones I spotted in the vicinity.

Ville Syrjälä (9):
  drm/i915: Bump DSL linemask to 20 bits
  drm/i915: Clean up PIPEMISC register defines
  drm/i915: Clean up SKL_BOTTOM_COLOR defines
  drm/i915: Clean up PIPECONF bit defines
  drm/i915: Clean up PCH_TRANSCONF/TRANS_DP_CTL bit defines
  drm/i915: Clean up PIPESRC defines
  drm/i915: Clean up CRC register defines
  drm/i915: Clean up DPINVGTT/VLV_DPFLIPSTAT bits
  drm/i915: Clean up FPGA_DBG/CLAIM_ER bits

 drivers/gpu/drm/i915/display/i9xx_plane.c     |   4 +-
 drivers/gpu/drm/i915/display/icl_dsi.c        |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  95 ++---
 .../gpu/drm/i915/display/intel_pch_display.c  |  20 +-
 drivers/gpu/drm/i915/gvt/display.c            |   4 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |   4 +-
 drivers/gpu/drm/i915/i915_irq.c               |   9 +-
 drivers/gpu/drm/i915/i915_reg.h               | 392 +++++++++---------
 8 files changed, 261 insertions(+), 271 deletions(-)

-- 
2.32.0

