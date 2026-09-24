Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF6CC98321
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Sep 2026 15:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523D510F660;
	Thu, 24 Sep 2026 15:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LOsUzwj8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C04A10F660;
 Thu, 24 Sep 2026 15:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790263507; x=1821799507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jur/jamhTM+iUAuVNyj/F7g2shSZRyg0t6DQvxkIB3w=;
 b=LOsUzwj8iMYUHpZodxQyopAoNBHHH3rikh1aAK665igyG31C5oDkRib1
 Rh3HZ5onX6pfJINrJF/b4ZJcPv58H4Mbf/tuadmNpEimGX0ovCalHHjfb
 ohxl4wf91+85hykKqq6L2ySlCi034G3bhExOrXUzm/F1GD0TcanZldNL4
 qOwLuHBW3PxCmax3fas7MzqpTwgYKH321GvcuN9fK9cxT2Z8INuKw4vgp
 JVzcujY/ENRcgXCZcVzc91lKKrTwEea9auPIsDdz4jIv2bvDVYMxJIW5e
 M9TaYq1jl68WS5tfigQVZcJjyf44qYdGNMli3maHv3vlL0fDieVVzswCi w==;
X-CSE-ConnectionGUID: dzjNY6hrR/2IDw+UillDSQ==
X-CSE-MsgGUID: eCo3YMkxRg64gVTGFN+S6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91058153"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="91058153"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 08:25:07 -0700
X-CSE-ConnectionGUID: TrHyMG9GRkeaaWBFcNsteA==
X-CSE-MsgGUID: zR2FUnIGQP2VPTiGLu+KSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="301981527"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.29])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 08:25:05 -0700
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
Subject: [PATCH i-g-t 2/2] tests/intel/gem_close_race: Skip offset probing
 without full-ppgtt
Date: Thu, 24 Sep 2026 17:24:18 +0200
Message-ID: <20260924152443.829382-6-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924152443.829382-4-janusz.krzysztofik@linux.intel.com>
References: <20260924152443.829382-4-janusz.krzysztofik@linux.intel.com>
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

gem_close_race computed exec_addr/data_addr via
gem_detect_safe_start_offset() and gem_detect_safe_alignment()
whenever the kernel disallowed relocations, without checking ppgtt
mode. Those helpers exist solely to bootstrap intel_allocator and are
meaningless without full-ppgtt, since the kernel can't see the ranges
intel_allocator considers reserved and may hand them out to other
users, as already acknowledged by __intel_bb_create() which enforces
relocations and skips the allocator entirely in that case.

Require gem_uses_full_ppgtt() as well before enabling the softpin
path, mirroring __intel_bb_create()'s logic, and skip the probing
calls otherwise so the existing relocation fallback is used.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Assisted-by: GitHub Copilot (Claude Sonnet 5)
---
 tests/intel/gem_close_race.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
index b2688774d7..ff2877f67e 100644
--- a/tests/intel/gem_close_race.c
+++ b/tests/intel/gem_close_race.c
@@ -348,11 +348,20 @@ int igt_main()
 
 		devid = intel_get_drm_devid(fd);
 		has_64bit_relocations = intel_gen(devid) >= 8;
-		has_softpin = !gem_has_relocations(fd);
-		exec_addr = gem_detect_safe_start_offset(fd);
-		data_addr = gem_detect_safe_alignment(fd);
-		exec_addr = max_t(exec_addr, exec_addr, data_addr);
-		data_addr += exec_addr;
+		/*
+		 * Without full-ppgtt the kernel can't see the ranges the
+		 * detected offsets are meant to reserve and may hand them
+		 * out to other users, so pinning at a detected offset isn't
+		 * meaningful; fall back to relocations in that case, same
+		 * as __intel_bb_create() does.
+		 */
+		has_softpin = !gem_has_relocations(fd) && gem_uses_full_ppgtt(fd);
+		if (has_softpin) {
+			exec_addr = gem_detect_safe_start_offset(fd);
+			data_addr = gem_detect_safe_alignment(fd);
+			exec_addr = max_t(exec_addr, exec_addr, data_addr);
+			data_addr += exec_addr;
+		}
 
 		gpu_count = igt_device_filter_count();
 
-- 
2.55.0

