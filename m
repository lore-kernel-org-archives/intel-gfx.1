Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4353EC27C4F
	for <intel-gfx@archiver.kernel.org>; Fri, 31 May 2024 09:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553E510E719;
	Fri, 31 May 2024 09:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bh5h/DxS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429FA10E412
 for <intel-gfx@lists.freedesktop.org>; Fri, 31 May 2024 09:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717149031; x=1748685031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QvhXk65sKbeUOrHsQAPB4iMOE7HccVgrtnYmyE+LUxE=;
 b=bh5h/DxSrOSQSAiZBydVlexrw4+sFR5sy45z5ECkvK7zq+wAqn3GTGO5
 kOAa8OaUZweOPtdnyHMpw3dtPnzGT4l3QlrKuNDUenvmM42/tGms24B9q
 +kAKT2+4h861rSShuZ/e7ENeXzRhHDW4Zfqd0CzNfXOeYE4SWCnoINmQa
 gmfqX5ygKDWI6fOYN9NcJanwPyRHVoEHWFzaTShdugTq76Zq5citTja95
 TB2iaMiQZlp62CjOwyv0HqZfLmdzIkGjzBfAfqbMUYgRGW7vYNWzDuNGV
 pNttCyewnf5Vr8wb8Wz6skm/SG1QViCg9zgzgOktbEfhttjZaRXQDATsf g==;
X-CSE-ConnectionGUID: 5od+tTOgQeuBvbdgwTvpgg==
X-CSE-MsgGUID: HPXouhUcQBuEzARMe8f5Lg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13446566"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="13446566"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 02:50:31 -0700
X-CSE-ConnectionGUID: sSWeoWOKRI2rDLyWZmsn1Q==
X-CSE-MsgGUID: zeLy8doOSse5wfy60FthMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="41189234"
Received: from romanove-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.36.204])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 02:50:29 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: animesh.manna@intel.com, mika.kahola@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v4 09/19] drm/i915/psr: Inform Panel Replay source support on
 eDP as well
Date: Fri, 31 May 2024 12:49:43 +0300
Message-Id: <20240531094953.1797508-10-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240531094953.1797508-1-jouni.hogander@intel.com>
References: <20240531094953.1797508-1-jouni.hogander@intel.com>
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

Display version >= 20 support eDP 1.5. Inform Panel Replay source support
on eDP for display version >= 20.

Bspec: 68920

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 51fa8e43265a..4f1ae5393a60 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3037,9 +3037,11 @@ void intel_psr_init(struct intel_dp *intel_dp)
 		return;
 	}
 
-	if (HAS_DP20(dev_priv) && !intel_dp_is_edp(intel_dp))
+	if ((HAS_DP20(dev_priv) && !intel_dp_is_edp(intel_dp)) ||
+	    DISPLAY_VER(dev_priv) >= 20)
 		intel_dp->psr.source_panel_replay_support = true;
-	else
+
+	if (HAS_PSR(dev_priv) && intel_dp_is_edp(intel_dp))
 		intel_dp->psr.source_support = true;
 
 	/* Disable early transport for now */
-- 
2.34.1

