Return-Path: <SRS0=d6yn=HZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274E9C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Feb 2021 13:03:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE51764E2E
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Feb 2021 13:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE51764E2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1AA6E997;
	Tue, 23 Feb 2021 13:03:41 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE536E997
 for <intel-gfx@lists.freedesktop.org>; Tue, 23 Feb 2021 13:03:24 +0000 (UTC)
IronPort-SDR: qEGJ5EvlLpGSf+hu6Ne6FqTeDoMo/uFz+hMox44+a1Dxu7M5z2QQTEXAegVHvzlrv+ZFe5JOBs
 tVjZTgJeWD8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="171929242"
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="171929242"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 05:02:58 -0800
IronPort-SDR: Gvh9Ixm3Tyl3QYhPehjoUxhgpD2VKxCDAHpjYjsP3ZnRpO2DNZxD7pHtOOGeltf8uFKHuYN1uY
 E3LTNy24hR2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="499103531"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2021 05:02:52 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 23 Feb 2021 14:59:11 +0200
Message-Id: <20210223125913.3267045-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/1] DG2 audio support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hey,
small patch to add missing bits to enable audio with DG2.

---
baseline: 24107b584f752a997f091ab88491a81bb5c0dea1
pile-commit: 75aa81cc8bc853e937f4dc7243793333bd11c437
range-diff:
   -:  ------------ > 1424:  efde3c96d1a9 ALSA: hda: Add Intel DG2 PCI ID and HDMI codec vid

 series                                             |  1 +
 ...a-Add-Intel-DG2-PCI-ID-and-HDMI-codec-vid.patch | 47 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/series b/series
index 9f67f1f94509..1e18865888bb 100644
--- a/series
+++ b/series
@@ -1423,6 +1423,7 @@
 0001-INTEL_DII-drm-i915-dg2-MOCS-index-programming-for-va.patch
 0001-INTEL_DII-i915-perf-Get-OA-timestamp-frequency-param.patch
 0001-INTEL_DII-drm-i915-align-the-plane_vma-to-min_page_s.patch
+0001-ALSA-hda-Add-Intel-DG2-PCI-ID-and-HDMI-codec-vid.patch
 0001-INTEL_DII-END-dg2-DG2-Platform-Enabling.patch
 0001-INTEL_DII-AUTO-CHOP-BRANCH-dg2.patch
 0001-INTEL_DII-START-pvc-Ponte-Vecchio-Platform-Enabling.patch
diff --git a/0001-ALSA-hda-Add-Intel-DG2-PCI-ID-and-HDMI-codec-vid.patch b/0001-ALSA-hda-Add-Intel-DG2-PCI-ID-and-HDMI-codec-vid.patch
new file mode 100644
index 000000000000..c7ce2fb5802f
--- /dev/null
+++ b/0001-ALSA-hda-Add-Intel-DG2-PCI-ID-and-HDMI-codec-vid.patch
@@ -0,0 +1,47 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
+Date: Thu, 18 Feb 2021 12:33:48 +0200
+Subject: [PATCH] ALSA: hda: Add Intel DG2 PCI ID and HDMI codec vid
+
+Add HD Audio PCI ID and HDMI codec vendor ID for Intel DG2.
+
+Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
+---
+ sound/pci/hda/hda_intel.c  | 6 +++++-
+ sound/pci/hda/patch_hdmi.c | 1 +
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
+--- a/sound/pci/hda/hda_intel.c
++++ b/sound/pci/hda/hda_intel.c
+@@ -368,7 +368,8 @@ enum {
+ 					((pci)->device == 0x0c0c) || \
+ 					((pci)->device == 0x0d0c) || \
+ 					((pci)->device == 0x160c) || \
+-					((pci)->device == 0x490d))
++					((pci)->device == 0x490d) || \
++					((pci)->device == 0x4f90))
+ 
+ #define IS_BXT(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x5a98)
+ 
+@@ -2506,6 +2507,9 @@ static const struct pci_device_id azx_ids[] = {
+ 	/* DG1 */
+ 	{ PCI_DEVICE(0x8086, 0x490d),
+ 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
++	/* DG2 */
++	{ PCI_DEVICE(0x8086, 0x4f90),
++	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
+ 	/* Alderlake-S */
+ 	{ PCI_DEVICE(0x8086, 0x7ad0),
+ 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
+diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
+--- a/sound/pci/hda/patch_hdmi.c
++++ b/sound/pci/hda/patch_hdmi.c
+@@ -4347,6 +4347,7 @@ HDA_CODEC_ENTRY(0x80862812, "Tigerlake HDMI",	patch_i915_tgl_hdmi),
+ HDA_CODEC_ENTRY(0x80862814, "DG1 HDMI",	patch_i915_tgl_hdmi),
+ HDA_CODEC_ENTRY(0x80862815, "Alderlake HDMI",	patch_i915_tgl_hdmi),
+ HDA_CODEC_ENTRY(0x80862816, "Rocketlake HDMI",	patch_i915_tgl_hdmi),
++HDA_CODEC_ENTRY(0x80862819, "DG2 HDMI",	patch_i915_tgl_hdmi),
+ HDA_CODEC_ENTRY(0x8086281a, "Jasperlake HDMI",	patch_i915_icl_hdmi),
+ HDA_CODEC_ENTRY(0x8086281b, "Elkhartlake HDMI",	patch_i915_icl_hdmi),
+ HDA_CODEC_ENTRY(0x8086281c, "Alderlake-P HDMI", patch_i915_tgl_hdmi),
--
git-pile 0.96

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
