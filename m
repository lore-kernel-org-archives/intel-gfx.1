Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DBEC624D3
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2026 14:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D2310E5D5;
	Wed,  2 Sep 2026 14:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQ5qdRwd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C08C10E5D5
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Sep 2026 14:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788358202; x=1819894202;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CW9fBmbfvllCsS/rU1JrNDeaCzgXdha3BAjO7i6WyyY=;
 b=RQ5qdRwdYhFTXrD5cWCkW67pfLVrUYA68FdzczD+IWDPfOT84uKN3z03
 DuCorN8EkJDRlmmpcSt2s3ERJ/De94PXVO52JZwP29xb9w5iS5UkwD9er
 hITFyU+xRJPXSc36E8RqJLSsNFVGKYh3V2O6R5Q6Lx8YHhr/cxH+wF8UH
 3iCQ3I15m/wlvWbj3aaG3KkgxhuCZJEjMLtr2EEGunI/PVuYrAPrEC9eY
 YKPzEZksBweu3IrbnsrliYlzeCjTp1SVWyM1m4Lwj7Dh5XK8PkkB92hTq
 snhzCB/PjV/+6tA9fZ2mwC+N0VoNPZy80bwSUFs36ZB6Ms+HCs6i+R18i Q==;
X-CSE-ConnectionGUID: mW0Kpv0MSI+knT9DbahpQw==
X-CSE-MsgGUID: jEOkUBMJSjqsXvHKBMG/LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="87754340"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="87754340"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:10:01 -0700
X-CSE-ConnectionGUID: Uk8XCi6lSPqtMlYnCy6n9w==
X-CSE-MsgGUID: mlIdZCxiSmGf1/HwjCUfxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="299299266"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa002.jf.intel.com with ESMTP; 02 Sep 2026 07:10:00 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v3] drm/i915/display: Reset use_flipq when duplicating crtc
 state
Date: Wed,  2 Sep 2026 14:09:58 +0000
Message-ID: <20260902140958.915979-1-mika.kahola@intel.com>
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

intel_crtc_duplicate_state() resets use_dsb to false but not
use_flipq, letting a stale true value survive into the new state.

Reset use_flipq alongside use_dsb.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 9d0d47c79dd1..b66c2d4ba2b3 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -276,6 +276,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
 	crtc_state->dsb_color = NULL;
 	crtc_state->dsb_commit = NULL;
 	crtc_state->use_dsb = false;
+	crtc_state->use_flipq = false;
 
 	return &crtc_state->uapi;
 }
-- 
2.43.0

