Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5071C982EE
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Sep 2026 18:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FB010E493;
	Mon, 21 Sep 2026 18:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+fmviO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DE310E493
 for <intel-gfx@lists.freedesktop.org>; Mon, 21 Sep 2026 18:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790016382; x=1821552382;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RgdPaaJ7J+byb4o57xJHXDSOPIz7qbQvOQu/C+/+EiI=;
 b=W+fmviO5a+rk77vrMrdmvHb/j2jp30NdVdIS0hi/E7MwbOmaAlThvYH9
 ryJNA/NjONIU9sFLUyvcAWlZIajs57lPDmOiDW9kE6/n8CDCXG4j/7K3O
 6u3WaKn9PBkE4ORBNg8gy78lGtbpjK3vQi8kxXq3qRUR1V0UFs1oglguJ
 7h55qC57lenngIyB6/mwPjvSldlP2LTLb/qFhUk5d+WvXcf7HG9bdwfZH
 EMSm8gSxCnvrtlxBxdh7GUdWMp0BzG9j9hzBHfldoO/d/ytzjcitAJAFD
 lHpeu1rdrmc999n/XvEX4FqsGS6Zzi++qTGFbpmBwz0S3cxsOF8oZtIGp w==;
X-CSE-ConnectionGUID: oqdF9L9KSMeXvhmraZMLwg==
X-CSE-MsgGUID: ypWxPA7NQD2xQaU8iN/rSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101223984"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="101223984"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 11:46:22 -0700
X-CSE-ConnectionGUID: QfKM4C/gSuuQ39vHIaTdfQ==
X-CSE-MsgGUID: hlJi+rmvTXKUuv4L1qx8YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="4106794"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 11:46:20 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: alex.zuo@intel.com,
	jonathan.cavitt@intel.com,
	imre.deak@intel.com
Subject: [PATCH] drm/i915/display: Do not check crtc_state when initializing
 BW limits
Date: Tue, 22 Sep 2026 02:46:17 +0800
Message-ID: <20260921184617.609564-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
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

In intel_link_bw_init_limits, we call intel_atomic_get_new_crtc_state to
grab an intel_crtc_state pointer.  This pointer is later used to set the
max_bpp_x16 value for the given pipe.  There is a check here for if the
return value of the intel_atomic_get_new_crtc_state function returns
NULL, but this is not checked in any other place where this function is
used.  Removing this check makes the code more consistent and prevents
confusion from static analyzers.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_link_bw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_link_bw.c b/drivers/gpu/drm/i915/display/intel_link_bw.c
index e71e76d6fd3e0..2a20a12de9e0a 100644
--- a/drivers/gpu/drm/i915/display/intel_link_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_link_bw.c
@@ -64,8 +64,7 @@ void intel_link_bw_init_limits(struct intel_atomic_state *state,
 			intel_atomic_get_new_crtc_state(state, crtc);
 		int forced_bpp_x16 = get_forced_link_bpp_x16(state, crtc);
 
-		if ((state->base.duplicated && crtc_state) ||
-		    intel_dp_mst_stream_disconnected(state, crtc)) {
+		if (state->base.duplicated || intel_dp_mst_stream_disconnected(state, crtc)) {
 			limits->max_bpp_x16[pipe] = crtc_state->max_link_bpp_x16;
 			if (intel_dsc_enabled_on_link(crtc_state))
 				limits->link_dsc_pipes |= BIT(pipe);
-- 
2.53.0

