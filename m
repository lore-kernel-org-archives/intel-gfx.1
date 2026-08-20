Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3685C5DF82
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2026 18:43:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DA510E21C;
	Thu, 20 Aug 2026 18:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+pv+52j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D9B10E21C;
 Thu, 20 Aug 2026 18:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787251423; x=1818787423;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hid7UKB54Yn5PPb9argK6p0/4em1ZHy6es7G0RgY6fU=;
 b=U+pv+52j4MNfYf6rNVjHc6NflT2im/FGuvam2Q2Ct5O5AjRNwbvMztey
 p1N844eo51aJHDh95Xtfb60vLvpn8PPw9Quk1+z/R+fS+z6X2WckhiIF6
 fo6vi+krKcH1qu3yppG3RSV1Q91F1ATRndIndFT0NMx3i2B8RRan0Bghr
 8cjxDz5D9x5lW9mP09/DXMc3tR5DDLinVkvyw5JTajLr3tISBn47DV49W
 STBL7vS8bTrL7vqO4rPTuyg5yxY6DrY2M6q7W9FcNT+9KGLNNjb5wqrgj
 sQRugdsKiqBc7wgsTDH4nS5OIXjTvxnA9Ia6S4fBGapqgC5K72cwsDMtt Q==;
X-CSE-ConnectionGUID: 7ULboo9gRB2wvdV094STKQ==
X-CSE-MsgGUID: 9qJPbU99TZmw48Ee2R0Kog==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="91670431"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="91670431"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 11:43:43 -0700
X-CSE-ConnectionGUID: MW0P51skRPKrap4UCsgs9A==
X-CSE-MsgGUID: G6ZxDdEBSFK5zpCHr8qZ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="269595968"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.134])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 11:43:41 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/i915_module_load: Ignore missing PCI reset
Date: Thu, 20 Aug 2026 20:41:43 +0200
Message-ID: <20260820184304.1968012-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

Subtest fault-injection now performs PCI device reset before every driver
bind attempt and fails if that reset doesn't succeed.  That was OK if all
devices being tested supported a PCI reset method.  However, machines
with DG1 SKU 0x4905 used in CI suffer from device breakage and system
freezes after any PCI reset attempts, triggering CI job aborts.  That's
going to change soon with an upcoming kernel patch that disables PCI
reset capabilities on that card.

Attempt PCI reset and fail if not successful only if supported, otherwise
submit a debug message and continue the exercise.  With that in place,
the subtest should no longer abort CI jobs on DG1 as soon as the above
mentioned kernel fix is in place.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/intel/i915_module_load.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index 26e30a1000..68e2386465 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -463,7 +463,8 @@ inject_fault_probe(int fd, const char pci_slot[], const char function_name[],
 	injection_list_add(function_name);
 	set_retval(function_name, inject_error);
 
-	igt_assert(igt_sysfs_set(devicefd, "reset", "1"));
+	if (!igt_debug_on(!igt_sysfs_has_attr(devicefd, "reset")))
+		igt_assert(igt_sysfs_set(devicefd, "reset", "1"));
 	igt_kmod_bind("i915", pci_slot);
 
 	err = -errno;
-- 
2.54.0

