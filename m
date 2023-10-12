Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34657CDB46E
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Oct 2023 12:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4ED10E03A;
	Thu, 12 Oct 2023 12:24:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C25410E03A
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Oct 2023 12:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697113486; x=1728649486;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E3eRWcA+oeuV0OQ70Vir1Y0VwmXDCUh0fangny0yG88=;
 b=R2iirwlwaDhUDTq5KoQO0RMKbhWe2AA/1JVW8ff+YHkKcGj4zRm9Au7g
 T+ScghWVdPplQjnjGi8ArlK4Ab0S4JNcWDi+WNbwMuuO5sg4ICIxTGe4N
 awtVSIPXSL2M6fXKjdmIouzKRdtKxfuFB2ryvnUfQnuAR6AONXvEe91J9
 EoTY24qpJFOUEyJTLMijzVapKOytEUvfH/66ZRXN2hxjfKwZgp/EvrEE7
 cBpCprn9CRnQ3sGgsUDyT3yXoRSHHno21oOcqqVg5CrtHfifZUGVU4/A1
 eMKQ2Zla5qjFk6BXCU3QmzYcWCIg4ZShJKIvHKXbCVboQr+ehpBw0RjLr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382140836"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="382140836"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 05:24:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="844978957"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="844978957"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by FMSMGA003.fm.intel.com with SMTP; 12 Oct 2023 05:24:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 12 Oct 2023 15:24:42 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 12 Oct 2023 15:24:36 +0300
Message-ID: <20231012122442.15718-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/6] drm/i915: Clean up zero initializers
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

Unify the array/struct zero initialization to use the least
awkward form (= {}).

Ville Syrjälä (6):
  drm/i915/display: Clean up zero initializers
  drm/i915/hdcp: Clean up zero initializers
  drm/i915/guc: Clean up zero initializers
  drm/i915/pci: Clean up zero initializers
  drm/i915/pxp: Clean up zero initializers
  drm/i915/gvt: Clean up zero initializers

 drivers/gpu/drm/i915/display/intel_acpi.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  6 +--
 .../drm/i915/display/intel_dp_aux_backlight.c |  4 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  2 +-
 .../drm/i915/display/intel_hdcp_gsc_message.c | 44 +++++++++----------
 .../drm/i915/display/intel_plane_initial.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c |  2 +-
 drivers/gpu/drm/i915/display/intel_wm.c       |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  4 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c         |  2 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c         |  6 +--
 drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
 drivers/gpu/drm/i915/i915_pci.c               |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    |  8 ++--
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c      |  4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      |  8 ++--
 19 files changed, 52 insertions(+), 54 deletions(-)

-- 
2.41.0

