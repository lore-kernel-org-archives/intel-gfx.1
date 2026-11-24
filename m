Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F66606A31E
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2026 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JQqZrWbJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7137F10F03C;
	Tue, 24 Nov 2026 18:35:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0654B10F031
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 18:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795545351; x=1827081351;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MY8myH3x85ivdljCZhxSWP99ggWUQoufPYd87lrA0rU=;
 b=JQqZrWbJZrq4Ft/EpELI5dWmF2kL78/TRzNj7hteQTrKznC1r3afxEZa
 5hvbG5cFcQqyoHgl/hmGQV0wkTuwimhH2COJ048bATZ8/QsOXZQjxg1vp
 ZmDHLlorZ7WaQw4VeDKCH1ytancXdYm4rgbgOFCGxndtzqiJyEvgrpKwB
 ERdIwhFdjMIavepXIpz7xvUBBMMbDXZEbvNy8N+tXCNFoQsoKcX/eiqr0
 Sa9N2frXcYn84lWNdxo9dezqOP6+QFTYHYYMCAfDO98rnd7MrSzvCJ1Dj
 JwU6Q8XVr4ntXgwndN6UEcfD8FWjf+Hogsua3V0WQAZ8SW54v3O6eYFQJ Q==;
X-CSE-ConnectionGUID: s2SzcHR+R1W3BTuuOS1Wug==
X-CSE-MsgGUID: mEe1txZyTziMsSmGbIutZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4315626"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4315626"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 10:17:13 -0800
X-CSE-ConnectionGUID: /67J8TZJS8mRQj3SaOtIIQ==
X-CSE-MsgGUID: mecPt1aXT2+JuTvbLn+r6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11964038"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.215])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 10:14:08 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/2] drm/i915/uncore: abstract intel_uncore_fw_domains_show()
Date: Tue, 24 Nov 2026 20:14:04 +0200
Message-ID: <20261124181405.1669126-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The debugfs shouldn't really have to know about uncore implementation
details. Add a separate function to log the forcewake domains.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 14 +-------------
 drivers/gpu/drm/i915/intel_uncore.c           | 18 ++++++++++++++++++
 drivers/gpu/drm/i915/intel_uncore.h           |  2 ++
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index adf2512e2ed5..1b39e5f19192 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -70,20 +70,8 @@ static int fw_domains_show(struct seq_file *m, void *data)
 {
 	struct intel_gt *gt = m->private;
 	struct intel_uncore *uncore = gt->uncore;
-	struct intel_uncore_forcewake_domain *fw_domain;
-	unsigned int tmp;
 
-	spin_lock_irq(&uncore->lock);
-
-	seq_printf(m, "user.bypass_count = %u\n",
-		   uncore->user_forcewake_count);
-
-	for_each_fw_domain(fw_domain, uncore, tmp)
-		seq_printf(m, "%s.wake_count = %u\n",
-			   intel_uncore_forcewake_domain_to_str(fw_domain->id),
-			   READ_ONCE(fw_domain->wake_count));
-
-	spin_unlock_irq(&uncore->lock);
+	intel_uncore_fw_domains_show(m, uncore);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 4e10a02f5750..02f6000b203e 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2691,6 +2691,24 @@ intel_uncore_forcewake_for_reg(struct intel_uncore *uncore,
 	return fw_domains;
 }
 
+void intel_uncore_fw_domains_show(struct seq_file *m, struct intel_uncore *uncore)
+{
+	struct intel_uncore_forcewake_domain *fw_domain;
+	unsigned int tmp;
+
+	spin_lock_irq(&uncore->lock);
+
+	seq_printf(m, "user.bypass_count = %u\n",
+		   uncore->user_forcewake_count);
+
+	for_each_fw_domain(fw_domain, uncore, tmp)
+		seq_printf(m, "%s.wake_count = %u\n",
+			   intel_uncore_forcewake_domain_to_str(fw_domain->id),
+			   READ_ONCE(fw_domain->wake_count));
+
+	spin_unlock_irq(&uncore->lock);
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/mock_uncore.c"
 #include "selftests/intel_uncore.c"
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index 9047d7d4d855..d5de6a172ff3 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -470,6 +470,8 @@ static inline void __iomem *intel_uncore_regs(struct intel_uncore *uncore)
 	return uncore->regs;
 }
 
+void intel_uncore_fw_domains_show(struct seq_file *m, struct intel_uncore *uncore);
+
 struct intel_uncore *to_intel_uncore(struct drm_device *drm);
 
 /*
-- 
2.47.3

