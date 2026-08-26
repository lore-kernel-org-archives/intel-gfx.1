Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9ACC61DBD
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2026 15:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89AA89452;
	Wed, 26 Aug 2026 15:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hh/rIqru";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B26889452
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 Aug 2026 15:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787757880; x=1819293880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6hYzF2Ab/Aud0rZT7coWa4ewv1ym/UTdQsmKZo0Zoo8=;
 b=hh/rIqrugdNMptJcarNRFhrIkSW4akr7QoSlplgIuw7Wu4oz/3BSkQIv
 nUemxFT65r17G4OOILNqEtdaMb3ZEQDreEbAtlvjye1895ty23IRjQxsI
 FBz24HiK2rmTzTUd9V695xLkNkajMySYJaYeGvQeZDuqzpFzUpN7ln8lo
 pKal6jh7Paktz8qJBqrScOI6blQjV6smXE5HLkXm8whMpGW+MiRMW7HIu
 2LNSGgJSCIFse9niEnLiHQY9mZuXLZCrPe4pszr228mSTTyHMQr/17XpO
 rh1Dclx+TNXObLXDzsSfN7E8Q9tWI+daTASR+jObgbMu8YYBFDlYCft2U g==;
X-CSE-ConnectionGUID: LWPPnyVrTqGydvWCm2Sniw==
X-CSE-MsgGUID: VklCT8M+Rt+9p0Ui/ikQtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88297505"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88297505"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 08:24:39 -0700
X-CSE-ConnectionGUID: Td/oQaSgQWmLavUGX4+7rA==
X-CSE-MsgGUID: /jsKGaOIS/KkVRbnhrQUXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="291129261"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 08:24:38 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v1 0/2] drm/i915/hdmi: Add debugfs knob to force EDID reads
 over GPIO
Date: Wed, 26 Aug 2026 20:54:42 +0530
Message-ID: <20260826152444.2822821-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Add a per-connector debugfs file that forces EDID reads to use GPIO
bit-banging.

Naladala Ramanaidu (2):
  drm/i915/hdmi: Add debugfs support to force EDID reads over GPIO
  drm/i915/hdmi: Read EDID over GPIO when the debugfs flag is set

 .../drm/i915/display/intel_display_debugfs.c  |  1 +
 .../drm/i915/display/intel_display_types.h    |  3 +
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 63 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_hdmi.h     |  2 +
 4 files changed, 68 insertions(+), 1 deletion(-)

-- 
2.43.0

