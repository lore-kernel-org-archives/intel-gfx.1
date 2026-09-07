Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8ABC79F9E
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 09:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33BF10E6F0;
	Mon,  7 Sep 2026 09:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpRh0mK8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F91810E6F0
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 09:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788771786; x=1820307786;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=98wbZBa0cueKeX7rxI7zVGJ1KZaQ56QTJZuCcR8ZZK0=;
 b=cpRh0mK8nMyWAaKhqzZCPMAhqqkIsmsavaMTb+f02inATkbNCWC3hLXh
 qJeop1veKgXsgxiBj1agt8NDcBFNlff3eU7Kj6t3JAgBe8miKXwqMNuVZ
 dYT5gKFGo+Kp71QPFgX3iNYleIqZcq1YSJkiIHiT5kF6f1DD+zKSNEFRK
 Z62aGMnQ73mYcwStT86JmFLLbt5J62lQkDK7Ay4TucLnvBybrNTwjqLb6
 qxgvdGDK7yJV5UnkQjem6+BRGdP1h9eMwG6+LVEy1ssXizsZp2Iow/50g
 f+f0Xv0kavMD0Ee/rxyHh3GPNsnsJ78UA+IqzxZyZfwmKnw3Mich1Jvb7 Q==;
X-CSE-ConnectionGUID: MiWN2IOoQZG5ZDNsZcyFPw==
X-CSE-MsgGUID: lohsGpyTS8eyUepN3vVEYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="92872963"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="92872963"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:03:05 -0700
X-CSE-ConnectionGUID: TVe2MCW+QtG99Mcl8b8VKA==
X-CSE-MsgGUID: XkAqN48+Q/a/TJ/wvaUqHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="272588583"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.66])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:03:01 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 linux-kernel@vger.kernel.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH v2] PCI: Disable not supported reset methods on DG1 0x4905
Date: Mon,  7 Sep 2026 10:59:18 +0200
Message-ID: <20260907090249.1348552-2-janusz.krzysztofik@linux.intel.com>
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

DRM CI consistently reports failing device reset attempts on Intel DG1
discrete graphics adapters.  Manual reproduction attempts allowed to
narrow down the scope of that problem to a specific revision of that
hardware, SKU 8086:4905.  It has been confirmed that both reset methods
claimed by the device, i.e., flr and bus, suffer from that issue.

Since consecutively failing device resets may lead to system hangs,
disable both useless reset methods.  A respective CI test will then be
skipped instead of aborting whole CI jobs.

Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/11814
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
v2: Fix commit description wording (Andi)
  - add Suggested-by: tag missing from v1,
  - add collected Reviewed-by: tags.

 drivers/pci/quirks.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index de9bbccda21fd..e55475374c6fd 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3811,6 +3811,9 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_TI, 0xb005, quirk_no_bus_reset);
  */
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ASMEDIA, 0x1164, quirk_no_bus_reset);
 
+/* Intel DG1 0x4905 may not recover from bus reset */
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x4905, quirk_no_bus_reset);
+
 static void quirk_no_pm_reset(struct pci_dev *dev)
 {
 	/*
@@ -5597,6 +5600,7 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x443, quirk_intel_qat_vf_cap);
  * AMD Neural Processing Unit 0x1502 0x17f0
  * Intel 82579LM Gigabit Ethernet Controller 0x1502
  * Intel 82579V Gigabit Ethernet Controller 0x1503
+ * Intel DG1 Discrete Graphics Adapter 0x4905
  * Mediatek MT7922 802.11ax PCI Express Wireless Network Adapter
  * Mediatek MT7925 802.11be PCI Express Wireless Network Adapter
  */
@@ -5612,6 +5616,7 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_AMD, 0x1502, quirk_no_flr);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_AMD, 0x17f0, quirk_no_flr);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x1502, quirk_no_flr);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x1503, quirk_no_flr);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x4905, quirk_no_flr);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_MEDIATEK, 0x0616, quirk_no_flr);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_MEDIATEK, 0x7925, quirk_no_flr);
 
-- 
2.54.0

