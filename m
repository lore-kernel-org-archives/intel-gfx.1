Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A81BC5B572
	for <intel-gfx@archiver.kernel.org>; Tue, 11 Aug 2026 17:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418D210E34C;
	Tue, 11 Aug 2026 17:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJrwKjxT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B134210E34C
 for <intel-gfx@lists.freedesktop.org>; Tue, 11 Aug 2026 17:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786471049; x=1818007049;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P9sr1EEeie9pEQCtBCeJFvRv5sByAWIOh/+HVoKWLWA=;
 b=GJrwKjxTUaDvClZfJGCvGr0p8dFxrMzAyPP4frbb1eFmx7MZk481J9h/
 rlrSCAm4W88sU8AVYFFhIBorgSuLuaElTcOJWVy5kjoc7dfGOp2Hfe6jg
 /6ppuyyf4GJoS7iX6hDn5jGaAuv0Q8V7c9N7kSP9tH3/4V+GHFbIS6LX/
 RXSvkzFRitXTbmVpiIJ8+2imP+EGBi+gfbBAHua1lLLpPzr8OZbHddHb9
 DClFGBvKwRfPHv2YF/MxZqu9M8UFTuZg6D51rt97YJWwAFgNFYroki1jL
 uD9YkuvlcUAe+FU9ql2DaKg/qG3zpLZ8edmnjyBCIGpOr0C6jpqNyFlLK g==;
X-CSE-ConnectionGUID: Y/QOch2jR/C58nMGav2xpw==
X-CSE-MsgGUID: gSitJUF8QKKiQQjgxM0goQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="74549215"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="74549215"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 10:57:28 -0700
X-CSE-ConnectionGUID: HQksOWxNQ3SpFA2ZPs03NA==
X-CSE-MsgGUID: 9WRdPyj0QD6haiTlDt1PAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="267669420"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 10:57:27 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: alex.zuo@intel.com, jonathan.cavitt@intel.com, imre.deak@intel.com,
 michal.grzelak@intel.com
Subject: [PATCH v2] drm/i915/kunit: DP Link: Use if statements instead of for
 loops
Date: Wed, 12 Aug 2026 01:57:19 +0800
Message-ID: <20260811175719.139464-1-jonathan.cavitt@intel.com>
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

The static functions get_target_config and get_fallback_config in
intel_dp_link_test.c use for loops to determine if the requested index of
the config set is in the bounds of the config set entry list.

Reconfigure these functions to use if statements instead, as these for
loops are only run for a single iteration.

Issue caught by static analysis.

v2: (Michal)
- Change i <= 0 check to i == 0, as i cannot be negative by assertion
- Remove unnecessary newlines

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Michal Grzelak <michal.grzelak@intel.com>
---
 .../i915/display/tests/intel_dp_link_test.c   | 34 ++++++++-----------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
index 67c6fe9f1812..6dfd8903a8ec 100644
--- a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
+++ b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
@@ -1215,22 +1215,20 @@ static bool get_fallback_config(const struct test_config_table *expected_table,
 	struct kunit *test = expected_table->test;
 	const struct link_config_set *config_set =
 		get_fallback_configs_for_output_type(test, output_type);
+	const struct intel_dp_link_config *config;
 	int i;
 
 	i = lookup_config(config_set, target_config);
 	KUNIT_ASSERT_GE(test, i, 0);
 
-	for (i--; i >= 0; i--) {
-		const struct intel_dp_link_config *config =
-			&config_set->entries[i];
+	if (!i)
+		return false;
 
-		assert_config_is_supported(expected_table, config);
-		*fallback_config = *config;
+	config = &config_set->entries[i-1];
+	assert_config_is_supported(expected_table, config);
+	*fallback_config = *config;
 
-		return true;
-	}
-
-	return false;
+	return true;
 }
 
 static bool get_target_config(const struct test_config_table *expected_table,
@@ -1240,19 +1238,17 @@ static bool get_target_config(const struct test_config_table *expected_table,
 	struct kunit *test = expected_table->test;
 	const struct link_config_set *config_set =
 		get_target_configs_for_output_type(test, output_type);
-	int i;
+	const struct intel_dp_link_config *config;
+	int i = config_set->size - 1;
 
-	for (i = config_set->size - 1; i >= 0; i--) {
-		const struct intel_dp_link_config *config =
-			&config_set->entries[i];
+	if (i < 0)
+		return false;
 
-		assert_config_is_supported(expected_table, config);
-		*target = *config;
+	config = &config_set->entries[i];
+	assert_config_is_supported(expected_table, config);
+	*target = *config;
 
-		return true;
-	}
-
-	return false;
+	return true;
 }
 
 static void test_fallback_seq(struct kunit *test,
-- 
2.53.0

