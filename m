Return-Path: <SRS0=1k+4=QF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF35C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Nov 2021 22:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B03FF61A79
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Nov 2021 22:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B03FF61A79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0176E5A4;
	Thu, 18 Nov 2021 22:31:33 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32126E5A2;
 Thu, 18 Nov 2021 22:31:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="295122450"
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; d="scan'208";a="295122450"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 14:31:30 -0800
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; d="scan'208";a="495598180"
Received: from marthapr-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.35.105])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 14:31:26 -0800
Date: Thu, 18 Nov 2021 17:31:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <YZbUPIHpR1S3JZ2b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Intel-gfx] [PULL] drm-intel-fixes
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes drm-intel-fixes-2021-11-18:

One quick fix for return error handling, one fix for ADL-P display
and one revert targeting stable 5.4, for TGL's DSI display clocks

Thanks,
Rodrigo.

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-11-18

for you to fetch changes up to 8b2abf777d8ea8d8db15af553454e0e976804225:

  drm/i915/guc: fix NULL vs IS_ERR() checking (2021-11-17 08:46:55 -0500)

----------------------------------------------------------------
One quick fix for return error handling, one fix for ADL-P display
and one revert targeting stable 5.4, for TGL's DSI display clocks

----------------------------------------------------------------
Dan Carpenter (1):
      drm/i915/guc: fix NULL vs IS_ERR() checking

Vandita Kulkarni (2):
      Revert "drm/i915/tgl/dsi: Gate the ddi clocks after pll mapping"
      drm/i915/dsi/xelpd: Fix the bit mask for wakeup GB

 drivers/gpu/drm/i915/display/icl_dsi.c            | 13 ++++---------
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  4 ++--
 drivers/gpu/drm/i915/i915_reg.h                   |  4 +++-
 3 files changed, 9 insertions(+), 12 deletions(-)
