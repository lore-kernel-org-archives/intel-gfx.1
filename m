Return-Path: <SRS0=aXtb=EJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9B2C2D0A3
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Nov 2020 14:54:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B3502076E
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Nov 2020 14:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B3502076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6866ECBB;
	Tue,  3 Nov 2020 14:54:14 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDD86ECB9
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 Nov 2020 14:54:13 +0000 (UTC)
IronPort-SDR: 21JED2b313FMVKoCE605BwA/Qw/La6ysLOmxUxI9Kqkv8MCuU/1lUmD9Bjk7uLiBPZUMWxbf2A
 bYcAeLHMmXwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="230690790"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="230690790"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 06:54:13 -0800
IronPort-SDR: Cg4ssZyTARM3ZbnXmar9g4vCJBatDEuZrwsl30udO0eSknLtNaiJsS1bGnSB3A8NP0Sxd8voAb
 72GpPG12WZdQ==
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="470824253"
Received: from linux-desktop.iind.intel.com ([10.223.34.173])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 06:54:11 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 Nov 2020 20:58:22 +0530
Message-Id: <20201103152834.12727-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Intel-gfx] [v9 00/12] Enable HDR on MCA LSPCON based Gen9 devices
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Gen9 hardware supports HDMI2.0 through LSPCON chips. Extending HDR
support for MCA and Parade LSPCON based GEN9 devices.

SOC will drive LSPCON as DP and send HDR metadata as standard
DP SDP packets. LSPCON will be set to operate in PCON mode,
will receive the metadata and create Dynamic Range and
Mastering Infoframe (DRM packets) and send it to HDR capable
HDMI sink devices.

v2: Fixed Ville's review comments. Suppressed some warnings.
Patch 8 of the series is marked "Not for Merge" and is just for
reference to userspace people to incorporate in order to support
10bit content with 4K@60 resolutions.

v3: Added Infoframe readout support for DRM infoframes.
Addressed Jani Nikula's review comments.

v4: Addressed Ville's review comments and added proper bitmask for
enabled infoframes. Series also incorporates Ville's patch for stopping
infoframes to be sent to DVI sinks. Extended the same for DRM as well.

v5: Created separate helper function for lspcon_infoframes_enabled as per
Ville's suggestion.

v6: Rebase

v7: Addressed Ville's review comments.

v8: Addressed Ville's review comments. Fixed the colorspace handling for
Pcon and property attachment logic based on new lspcon detetction changes.

v9: Rebase

Thanks Ville for all the suggestions and inputs.
Note: Patch 12 of the series is for reference to userspace, not to be
merged to driver.

Uma Shankar (12):
  drm/i915/display: Add HDR Capability detection for LSPCON
  drm/i915/display: Enable HDR on gen9 devices with MCA Lspcon
  drm/i915/display: Attach HDR property for capable Gen9 devices
  drm/i915/display: Attach content type property for LSPCON
  drm/i915/display: Nuke bogus lspcon check
  drm/i915/display: Enable BT2020 for HDR on LSPCON devices
  drm/i915/display: Enable HDR for Parade based lspcon
  drm/i915/display: Implement infoframes readback for LSPCON
  drm/i915/display: Implement DRM infoframe read for LSPCON
  drm/i915/lspcon: Create separate infoframe_enabled helper
  drm/i915/lspcon: Do not send DRM infoframes to non-HDMI sinks
  drm/i915/display: [NOT FOR MERGE] Reduce blanking to support
    4k60@10bpp for LSPCON

 drivers/gpu/drm/i915/display/intel_ddi.c      |  20 +-
 .../drm/i915/display/intel_display_types.h    |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  29 +++
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  25 +--
 drivers/gpu/drm/i915/display/intel_lspcon.c   | 181 +++++++++++++++---
 drivers/gpu/drm/i915/display/intel_lspcon.h   |  12 ++
 drivers/gpu/drm/i915/i915_reg.h               |   2 +
 7 files changed, 226 insertions(+), 44 deletions(-)

-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
