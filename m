Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5F5C54F51
	for <intel-gfx@archiver.kernel.org>; Wed, 29 Jul 2026 11:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6429810E4B4;
	Wed, 29 Jul 2026 11:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjnlBYg0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB90C10E4B4
 for <intel-gfx@lists.freedesktop.org>; Wed, 29 Jul 2026 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785324820; x=1816860820;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MGKMJIhf00BkfMRYK6aDyDjlBfYXhWSHS97+heUcZCE=;
 b=GjnlBYg0tjXHTOL2YI1wjkg3JexhrtNbDy0UNx7OCXraKRYS/G6xiVmq
 ZB/DDuaBvG+ihRHcF097WN2+keH2eoZNcK0aLi3EdYeyTVN5TkLXzam2W
 rIc0XkUs/x2QIWolHrkrQRBfYYNQsnqlXeCNw1Q7ah6ZX5a2A/OAb+4RK
 2J6iOkNVQBgT4LrikdWeaAJhqpgt0gLrsfq1XTrj8rMekWprxlQLAcuX0
 G3TnAaGwXd6g7u6pHktbhe3pt8Tv/6TRwx5FkrHnAx5h9knQLcSxVR5zQ
 q6l7fVZ0ng0FGogRCIL5OMu1qLyAd4hh6OgcN2cSIkGGOT15IcvySxP5C g==;
X-CSE-ConnectionGUID: AdDQJzJQRi+SWkLqXjJ3ag==
X-CSE-MsgGUID: OrMifzsOR3mBAiK4eeKSNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89815198"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89815198"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:33:40 -0700
X-CSE-ConnectionGUID: 6bKftfInSaO5uSEQ+8+HiQ==
X-CSE-MsgGUID: a/6TDpjYTbeVRZRjcKiKVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="265020966"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:33:36 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] drm/i915/selftests: Report missing RC0 power as an error
Date: Wed, 29 Jul 2026 16:54:47 +0530
Message-ID: <20260729112446.2919206-2-sk.anirban@intel.com>
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

The RC0 no-power case is a hard failure (-EINVAL); log it via pr_err
instead of pr_debug so it is captured in default kernel logs.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_rc6.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_rc6.c b/drivers/gpu/drm/i915/gt/selftest_rc6.c
index 90f30b988d68..68fb1830d411 100644
--- a/drivers/gpu/drm/i915/gt/selftest_rc6.c
+++ b/drivers/gpu/drm/i915/gt/selftest_rc6.c
@@ -92,8 +92,8 @@ int live_rc6_manual(void *arg)
 
 		if (!rc0_power) {
 			if (rc0_freq)
-				pr_debug("No power measured while in RC0! GPU Freq: %uMHz in RC0\n",
-					 rc0_freq);
+				pr_err("No power measured while in RC0! GPU Freq: %uMHz in RC0\n",
+				       rc0_freq);
 			else
 				pr_err("No power and freq measured while in RC0\n");
 			err = -EINVAL;
-- 
2.43.0

