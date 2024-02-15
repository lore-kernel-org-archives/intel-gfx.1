Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43F0C4829E
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Feb 2024 16:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE2210E3AD;
	Thu, 15 Feb 2024 16:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXhdLfxQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B0910E3AD
 for <intel-gfx@lists.freedesktop.org>; Thu, 15 Feb 2024 16:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708015264; x=1739551264;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sg9hGGnHwOS/Z1yvHgMl3RXnFU/5mPxkGr03kGmj/ZE=;
 b=VXhdLfxQTvr1oz2nF57GK+HPWGVtfh9xdWYsc1yh6fCTPTQg9AEOV4hm
 cHWxdA+wKsiJiYa39W7SjOotBZbfX8slJ5bSVWvmYBO/ETEXJI4Gqbto4
 WfOF09QHo0zoUBOnepYqRcy0TvdZQBNLuDaqOJcBG5JdjKkfSWzt2CX8P
 rcp0aalrJi8UHIbVE+NkWzVrWWyVufufuITazQJIQpkMilSR9gbNHZANr
 jsT9JfCUPM6W93aTuQ+NMqFWLZ6ujhMGp9CoUbYS1Mx7KF6l7czuVXYg7
 vBvN7Jlpzw1rWgeyClePrTO556zAkC8cu5L8mMfaV3m2kQ8VXJAWOgBRf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="19629881"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="19629881"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:40:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="826434810"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="826434810"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 15 Feb 2024 08:40:56 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 15 Feb 2024 18:40:55 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/12] drm/i915: Use drm_printer more
Date: Thu, 15 Feb 2024 18:40:43 +0200
Message-ID: <20240215164055.30585-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Convert the entire state dumper and state checker to
use drm_printer.

One can perhaps consider this as the first step towards
hooking into .atomic_print_state(). Unfortunately that
stuff is a full blown midlayer currently, so we'd first
have to demidlayer it to make it work for us. The other
annoying thing there is the format in which it currently
prints stuff. Whoever wrote that had some kind of allergy
towards whitespace, making the output not so great for
human consumption, which is the primary use case for us.

Ville Syrjälä (12):
  drm/i915: Indicate which pipe failed the fastset check overall
  drm/i915: Include CRTC info in infoframe mismatch prints
  drm/i915: Include CRTC info in VSC SDP mismatch prints
  drm/i915: Convert pipe_config_infoframe_mismatch() to drm_printer
  drm/i915: Convert pipe_config_buffer_mismatch() to drm_printer
  drm/i915: Convert intel_dpll_dump_hw_state() to drm_printer
  drm/i915: Use drm_printer more extensively in intel_crtc_state_dump()
  drm/i915: Convert the remaining state dump to drm_printer
  drm/i915: Skip intel_crtc_state_dump() if debugs aren't enabled
  drm/i915: Relocate pipe_config_mismatch()
  drm/i915: Reuse pipe_config_mismatch() more
  drm/i915: Create the printer only once in intel_pipe_config_compare()

 .../drm/i915/display/intel_crtc_state_dump.c  | 330 ++++++++----------
 drivers/gpu/drm/i915/display/intel_display.c  | 189 +++++-----
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 105 +++---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h |   2 +
 4 files changed, 288 insertions(+), 338 deletions(-)

-- 
2.43.0

