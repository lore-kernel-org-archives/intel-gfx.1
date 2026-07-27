Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A58C53209
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Jul 2026 19:02:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A9E10E6F7;
	Mon, 27 Jul 2026 19:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O60lYUYI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA3710E4E5
 for <intel-gfx@lists.freedesktop.org>; Mon, 27 Jul 2026 19:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785178948; x=1816714948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fy4bNkBK1n6PuwH23bH4vEZMd0Lyw7mGXBYAYpxP+ok=;
 b=O60lYUYIF8pYgzgSdpjkP2eDOCQ1RDwBASUZ2Llor+jkgadl/CEMT4Bp
 BspgBaO/rYC/p7JJXMHZk2/E083W6TyEmrkIiI1GUU7AWOh1LGeJ4aVap
 VYz7yEr2kVs7PyMCGUVgwWBGb69bEodTZqE68k7wJNF/7j8KEXyJjxG/V
 0x8pnylmI/Up0j/0x9VRD2X0+S9YaH5CQsUoQ6zeJpY3vsfPl82Jetn2j
 h2CgaOKIEp3J6qxDZFqfSKKCyWfFztFkBE8tH2u8PG/h8LAo536Ozya0g
 blmjSj66qyDNyWT9Y5E4JqOpcX5Ll67KGfkoB4CC0MnZIziif23ulLUei g==;
X-CSE-ConnectionGUID: AfCgM7YmRguQeJ0ySsswlw==
X-CSE-MsgGUID: y/fhFrhaSeSXZhA3y+tuFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="84880551"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="84880551"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 12:02:27 -0700
X-CSE-ConnectionGUID: A3w/bYzKRZKz8gb7AcDrgg==
X-CSE-MsgGUID: DTdm2ZgSQjS348v6f1gvtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="259549413"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 12:02:26 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: alex.zuo@intel.com,
	jonathan.cavitt@intel.com,
	imre.deak@intel.com
Subject: [PATCH] drm/i915/kunit: DP Link: Use if statements instead of for
 loops
Date: Tue, 28 Jul 2026 03:02:23 +0800
Message-ID: <20260727190223.2080436-1-jonathan.cavitt@intel.com>
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

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
---
 .../i915/display/tests/intel_dp_link_test.c   | 32 +++++++++----------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
index 67c6fe9f1812..89966d6a7e0e 100644
--- a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
+++ b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
@@ -1215,22 +1215,21 @@ static bool get_fallback_config(const struct test_config_table *expected_table,
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
+	if (i <= 0)
+		return false;
 
-		assert_config_is_supported(expected_table, config);
-		*fallback_config = *config;
+	config = &config_set->entries[i-1];
 
-		return true;
-	}
+	assert_config_is_supported(expected_table, config);
+	*fallback_config = *config;
 
-	return false;
+	return true;
 }
 
 static bool get_target_config(const struct test_config_table *expected_table,
@@ -1240,19 +1239,18 @@ static bool get_target_config(const struct test_config_table *expected_table,
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
 
-		return true;
-	}
+	assert_config_is_supported(expected_table, config);
+	*target = *config;
 
-	return false;
+	return true;
 }
 
 static void test_fallback_seq(struct kunit *test,
-- 
2.53.0

