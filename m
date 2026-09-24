Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFB7C98318
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Sep 2026 15:25:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE7910F65F;
	Thu, 24 Sep 2026 15:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knVp+2Oz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C169C10F65F;
 Thu, 24 Sep 2026 15:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790263505; x=1821799505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cThOwPkWRtVCpd9Kanw1fKj8lF7C2N6VhX3mcSHSYao=;
 b=knVp+2OzKgFSG6cgsoxgkQTrndyzCS1LaG0j7IfHIeTfZ0p3oVmVrRAB
 pxCF7DUmcck0ZhjmNvMiyZnpwOBgNd78pf92AkVGAS3/7Y6igLlAdmvqh
 BNfHyxkskC0wmJHnC3pU6s4N/S3RCmOJaD3uwEe1dXEs0jIS5msiqTCw1
 dhtS+g+dM0ILrCqeOAXQPOCbpGItLW8/QvQoM7rbxyIZDYTXyNtR5pFAX
 TVQDZhpj7cmKXx5qSydPsYzy6XYMCyPAaO0JQpIEjobOe64xKOuF+oX4j
 hb6NByD0T8IcUfIFHsJf25WQ6PcXezid/k3m282MTY7J4A9BLt3uJwdHD A==;
X-CSE-ConnectionGUID: evFtlil3S4+FgGseuV2e9w==
X-CSE-MsgGUID: Nvie6H24SC+lJF1ZYZQnfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91058149"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="91058149"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 08:25:05 -0700
X-CSE-ConnectionGUID: 2m5vTAG5TJ6v1Bqsqp0XIg==
X-CSE-MsgGUID: 8F8lJMWhSwWq2CGxU4TwkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="301981490"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.29])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 08:25:02 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/gem_softpin: Skip safe-alignment
 without full-ppgtt
Date: Thu, 24 Sep 2026 17:24:17 +0200
Message-ID: <20260924152443.829382-5-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924152443.829382-4-janusz.krzysztofik@linux.intel.com>
References: <20260924152443.829382-4-janusz.krzysztofik@linux.intel.com>
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

gem_detect_min_start_offset_for_region(), gem_detect_safe_start_offset()
and gem_detect_safe_alignment() exist solely to bootstrap
intel_allocator's start offset and default alignment. Without
full-ppgtt the kernel can't see the ranges intel_allocator considers
reserved and may hand them out to other users, so calling these
helpers is pointless there, as already acknowledged by
__intel_bb_create() which enforces relocations and skips the
allocator entirely in that case.

gem_softpin@safe-alignment called these helpers unconditionally,
outside the file's full-ppgtt gated subtest group. Require
gem_uses_full_ppgtt() directly on this subtest so it is skipped
instead of exercising meaningless values.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/15527
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Assisted-by: GitHub Copilot (Claude Sonnet 5)
---
 tests/intel/gem_softpin.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
index e67259b001..3fafde94ba 100644
--- a/tests/intel/gem_softpin.c
+++ b/tests/intel/gem_softpin.c
@@ -1573,8 +1573,19 @@ int igt_main()
 	}
 
 	igt_describe("Check start offset and alignment detection.");
-	igt_subtest("safe-alignment")
+	igt_subtest("safe-alignment") {
+		/*
+		 * The min-start-offset/alignment probing helpers exist
+		 * solely to bootstrap intel_allocator, which the driver
+		 * itself only relies on under full-ppgtt (see the comment
+		 * in __intel_bb_create()). Without full-ppgtt the kernel
+		 * can't see the ranges intel_allocator considers reserved
+		 * and may hand them out to other users, making the detected
+		 * values meaningless.
+		 */
+		igt_require(gem_uses_full_ppgtt(fd));
 		safe_alignment(fd);
+	}
 
 	igt_describe("Check softpinning of a gem buffer object.");
 	igt_subtest("softpin")
-- 
2.55.0

