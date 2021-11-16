Return-Path: <SRS0=oPCP=QD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3D9C433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Nov 2021 17:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B025A61994
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Nov 2021 17:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B025A61994
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264F06E087;
	Tue, 16 Nov 2021 17:21:08 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABA26E087
 for <intel-gfx@lists.freedesktop.org>; Tue, 16 Nov 2021 17:21:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="297165802"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="297165802"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 09:14:48 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="494539582"
Received: from mramya-mobl1.gar.corp.intel.com (HELO localhost)
 ([10.251.219.100])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 09:14:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 16 Nov 2021 19:14:32 +0200
Message-Id: <20211116171434.20516-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211116171434.20516-1-jani.nikula@intel.com>
References: <20211116171434.20516-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 3/5] drm/i915/debugfs: move debug printing to
 intel_display_power.c
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

The debugfs should have no special privileges to look into the
implementation guts. Move the actual debug printing of power domains to
intel_display_power.c.

Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/i915/display/intel_display_debugfs.c  | 23 ++---------------
 .../drm/i915/display/intel_display_power.c    | 25 +++++++++++++++++++
 .../drm/i915/display/intel_display_power.h    |  2 ++
 3 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 3f5a5e1b1c41..acf70ae66a29 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -471,28 +471,9 @@ DEFINE_SIMPLE_ATTRIBUTE(i915_edp_psr_debug_fops,
 
 static int i915_power_domain_info(struct seq_file *m, void *unused)
 {
-	struct drm_i915_private *dev_priv = node_to_i915(m->private);
-	struct i915_power_domains *power_domains = &dev_priv->power_domains;
-	int i;
-
-	mutex_lock(&power_domains->lock);
-
-	seq_printf(m, "%-25s %s\n", "Power well/domain", "Use count");
-	for (i = 0; i < power_domains->power_well_count; i++) {
-		struct i915_power_well *power_well;
-		enum intel_display_power_domain power_domain;
-
-		power_well = &power_domains->power_wells[i];
-		seq_printf(m, "%-25s %d\n", power_well->desc->name,
-			   power_well->count);
-
-		for_each_power_domain(power_domain, power_well->desc->domains)
-			seq_printf(m, "  %-23s %d\n",
-				 intel_display_power_domain_str(power_domain),
-				 power_domains->domain_use_count[power_domain]);
-	}
+	struct drm_i915_private *i915 = node_to_i915(m->private);
 
-	mutex_unlock(&power_domains->lock);
+	intel_display_power_debug(i915, m);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index d30639a59ea5..5ebc758498c8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -6397,3 +6397,28 @@ void intel_display_power_resume(struct drm_i915_private *i915)
 		hsw_disable_pc8(i915);
 	}
 }
+
+void intel_display_power_debug(struct drm_i915_private *i915, struct seq_file *m)
+{
+	struct i915_power_domains *power_domains = &i915->power_domains;
+	int i;
+
+	mutex_lock(&power_domains->lock);
+
+	seq_printf(m, "%-25s %s\n", "Power well/domain", "Use count");
+	for (i = 0; i < power_domains->power_well_count; i++) {
+		struct i915_power_well *power_well;
+		enum intel_display_power_domain power_domain;
+
+		power_well = &power_domains->power_wells[i];
+		seq_printf(m, "%-25s %d\n", power_well->desc->name,
+			   power_well->count);
+
+		for_each_power_domain(power_domain, power_well->desc->domains)
+			seq_printf(m, "  %-23s %d\n",
+				   intel_display_power_domain_str(power_domain),
+				   power_domains->domain_use_count[power_domain]);
+	}
+
+	mutex_unlock(&power_domains->lock);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index d54b7574ed37..b28cc1f94576 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -391,6 +391,8 @@ intel_display_power_put_all_in_set(struct drm_i915_private *i915,
 	intel_display_power_put_mask_in_set(i915, power_domain_set, power_domain_set->mask);
 }
 
+void intel_display_power_debug(struct drm_i915_private *i915, struct seq_file *m);
+
 /*
  * FIXME: We should probably switch this to a 0-based scheme to be consistent
  * with how we now name/number DBUF_CTL instances.
-- 
2.30.2

