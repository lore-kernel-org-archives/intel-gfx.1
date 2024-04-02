Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD55CD1292
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Apr 2024 09:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E4810FBDA;
	Tue,  2 Apr 2024 09:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C/gihBPV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC46B10FBDB
 for <intel-gfx@lists.freedesktop.org>; Tue,  2 Apr 2024 09:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712051445; x=1743587445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FcMHx/gbbGXw/eXhfQlDR9Tqm1cThWyRDq5E/GjcMIg=;
 b=C/gihBPVsusLAMCR4lwV4/CW6vPDwiJ7SIWDvBTcSzxcGX+78QZIW/Sn
 /lbhrGj+70K0S/QyVqYL7e+6Deo/SX6Nd1sfrkFJDEYAryFs4UwASKyP0
 4J2oGNc+oVprF9FLo+w9aCig0OLJX1sO0c8GWr7oQRLA5MlFLLHh1ujfM
 +USyOhav3GDpf9MbKpIczcl9DFEwAZFXkdHMfjffc9esYHktOsUEUnEYm
 D6nK/EcikyuNxA7fwF0//SK8O3WbqE23rG2BzzRMwIMDM8w348uy897XP
 D4O4x8fBTdAm3SsP2pVIjI4kXA5g2lU99KNcyr8Z5cw38O1fC9aD5qNA1 g==;
X-CSE-ConnectionGUID: cO5jtz2WScOBOOxxgSPBfg==
X-CSE-MsgGUID: 6SDI8oe7RTiCpt2dxvaW+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7422664"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="7422664"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 02:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="22693368"
Received: from sudhirj1-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.34.252])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 02:50:43 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v4 12/19] drm/panelreplay: dpcd register definition for
 panelreplay SU
Date: Tue,  2 Apr 2024 12:50:04 +0300
Message-Id: <20240402095011.200558-13-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240402095011.200558-1-jouni.hogander@intel.com>
References: <20240402095011.200558-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add definitions for panel replay selective update

v2: Remove unnecessary Cc from commit message

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Animesh Manna <animesh.manna@intel.com>
---
 include/drm/display/drm_dp.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 4891bd916d26..ff04b2af2844 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -548,6 +548,12 @@
 # define DP_PANEL_REPLAY_SUPPORT            (1 << 0)
 # define DP_PANEL_REPLAY_SU_SUPPORT         (1 << 1)
 
+#define DP_PANEL_PANEL_REPLAY_CAPABILITY		0xb1
+# define DP_PANEL_PANEL_REPLAY_SU_GRANULARITY_REQUIRED	(1 << 5)
+
+#define DP_PANEL_PANEL_REPLAY_X_GRANULARITY		0xb2
+#define DP_PANEL_PANEL_REPLAY_Y_GRANULARITY		0xb4
+
 /* Link Configuration */
 #define	DP_LINK_BW_SET		            0x100
 # define DP_LINK_RATE_TABLE		    0x00    /* eDP 1.4 */
-- 
2.34.1

