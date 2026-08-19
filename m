Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8049C5DF81
	for <intel-gfx@archiver.kernel.org>; Wed, 19 Aug 2026 14:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CD310E564;
	Wed, 19 Aug 2026 14:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="irNtNEIR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F7B10E564
 for <intel-gfx@lists.freedesktop.org>; Wed, 19 Aug 2026 14:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787148579; x=1818684579;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1VHFgDDvqmSqWRxzKSkeUL5w6FKlBxbf1jH4uWIGWIY=;
 b=irNtNEIRy88gCIlHVRP8GBavShJ9gc85sLTQjuXITVvltmYLZ9tzu59s
 +laMaQX6CeSU6+figu3MMXSUGTQt+0Cwg5QWFiy68BtxV2BxQsxbSdv3k
 +kV63ZE68pnYvgXbjVE/cP9gcKazmztbeKqr4C7zwC2LUiIyQXxV2MffC
 KlWPwoE5rPHlDBcQcj9wH3R3b8U6KIFvHmHMMNvJvNls+ADfph/3tr88A
 Y/5Dk/Ef3Z4mIDy0jd9kLX5yK2Lw1uDN7GxhzFy1AHF+G4nlyR16/h7R+
 vjiWPl9Xub0ljBn7UDsJFxocFGalSQwLBl3uUhQ7knkoRPI4PkLS4k302 Q==;
X-CSE-ConnectionGUID: I1FqiGE/TAWGfmPqp2EvDg==
X-CSE-MsgGUID: aOcN0sRCRx6ydgM1BoAYSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87687032"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87687032"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:09:38 -0700
X-CSE-ConnectionGUID: qh1Or/hBRDeHDGhIAxt0wQ==
X-CSE-MsgGUID: lzLq6GH9Qym+yS+Lo3JPPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="262309177"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:09:35 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.greedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t] tests/device_reset: Cold reset doesn't depend on PCI
 reset
Date: Wed, 19 Aug 2026 16:08:28 +0200
Message-ID: <20260819140908.1803246-2-janusz.krzysztofik@linux.intel.com>
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

Before commit 59e3bf83f6bae ("tests/device_reset: Add cold reset IGT
test") all subtests required device PCI reset capability, with that
dependency placed in an initial igt_fixture section.  New subtests
introduced with that commit didn't depend on that capability but that
requirement was left untouched.  That was OK as long as all devices
being tested supported a PCI reset method, however, that's going to
change with an upcoming kernel patch that addresses DG1 SKU 0x4905
inability to perform a PCI reset without breaking the device.

Move the requirement from the initial igt_fixture section to the
relevant subtest bodies, so cold reset subtest can be run even if PCI
reset is not supported.  See commit 4a5fd4e7cb279 ("tests/device_reset:
move later skips into subtests") for justification on why not to use
an igt_fixture inside an igt_subtest_group for that purpose.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/device_reset.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index b281f4eceb..c9ee297e8d 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -453,24 +453,25 @@ int igt_main()
 		/* Make sure subtests always reopen the same device */
 		igt_assert(device_sysfs_path(dev.fds.dev, dev_path));
 		set_device_filter(dev_path);
-
-		igt_skip_on(!is_sysfs_reset_supported(dev.fds.dev));
 	}
 
 	igt_describe("Unbinds driver from device, initiates reset"
 		     " then rebinds driver to device");
 	igt_subtest("unbind-reset-rebind") {
+		igt_skip_on(!is_sysfs_reset_supported(dev.fds.dev));
+
 		unbind_reset_rebind(&dev, FLR_RESET);
 		healthcheck(&dev);
 	}
 
 	igt_describe("Resets device with bound driver");
 	igt_subtest("reset-bound") {
+		igt_skip_on(!is_sysfs_reset_supported(dev.fds.dev));
+
 		initiate_device_reset(&dev, FLR_RESET);
 		healthcheck(&dev);
 	}
 
-
 	igt_subtest_group() {
 		igt_describe("Unbinds driver from device, initiates cold reset"
 			     " then rebinds driver to device");
-- 
2.54.0

