Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B443AC3F6B0
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Aug 2022 09:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D61112334;
	Thu,  4 Aug 2022 09:58:57 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D656193A8D
 for <intel-gfx@lists.freedesktop.org>; Thu,  4 Aug 2022 09:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659607120; x=1691143120;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NJpgl1we6Sl7/jwOei9J1uGX3JIr3I8i2E6Jicw4F0w=;
 b=hNcO2Jfj5ExD3MdVNlDTME1QI22GS4YXDJJHM7cdgXGk9lIfsKE36eOw
 PWn6xxXLzj47OdgI51l6aiCcmzvxwYjM9udaGYToCUS6YJfWr6IBfTLL1
 KS8aVDKaPoa8bCfNEqgX1/Eziw7ZZsCkjAID4uVjFrDAnxQrjQIX0LBSo
 jHeKs1fslFN9FDGnvw5U9q3gcbYmwlDuL/ug7NSxdVvxcmanE8vaLG9x8
 AbslNoTXiwQCsj340ibItBrdu0vuVZyI1L4mCjDWB59SniYMO9nbYG082
 2i+a+8maoEypua7wIy8J/Et/nc8NUcWLsVqbiAA84lK7JBKZTvt9rNycu A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="287457429"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="287457429"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 02:58:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="662471775"
Received: from wujunyox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.120])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 02:58:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  4 Aug 2022 12:58:33 +0300
Message-Id: <cover.1659607033.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/2] drm/i915/hdcp: register cleanup
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
Cc: jani.nikula@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Posting some cleanups I had written earlier.

Jani Nikula (2):
  drm/i915/hdcp: split out hdcp registers to a separate file
  drm/i915/hdcp: replace BIT() with REG_BIT() in register definitions

 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |   1 +
 drivers/gpu/drm/i915/display/intel_hdcp.c     |   1 +
 .../gpu/drm/i915/display/intel_hdcp_regs.h    | 270 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdmi.c     |   1 +
 drivers/gpu/drm/i915/i915_reg.h               | 259 -----------------
 5 files changed, 273 insertions(+), 259 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_regs.h

-- 
2.30.2

