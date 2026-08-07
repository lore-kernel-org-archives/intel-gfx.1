Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667E1C2A09B
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Aug 2026 19:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F9310E468;
	Fri,  7 Aug 2026 19:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0gDZ+GP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CC210E468
 for <intel-gfx@lists.freedesktop.org>; Fri,  7 Aug 2026 19:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786130673; x=1817666673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tQ+KUK9ZjbbC8KOryhgwFl9GtJBchKo2VZQpp1u4PVk=;
 b=g0gDZ+GPQbmlfF3F+TrQDs4I30889Yz9TxEq/Dw9ZKVNw9bHJAZl7dNX
 0Z4v2j9Z523wf5YmrJr/t0AhHUcEZIDE2Qum2yqcK0ATwEyeYqWXdhGRd
 iAzsLPNFW5AiYNq8FhK/veKxdnvUw/nYxQBLFJfh/nZajv8YR14hCK8r4
 FpaigTaB/YdT/61evSx4TB4cqMHBL+w4tVPVjQDM7A9GZ2hRAZazSmo6m
 jH4hFYMCvEcPcvgO5Dzx04dbWJg1VnEoKCw5yVdDh5NwfPiPhVQvZoHt+
 ARp0Nnasp2A0zWz0dWHNxw/tgh2uLAeyPDLLC2r9M+qhF67KYtg1wug0U w==;
X-CSE-ConnectionGUID: kX+QvMjLR6ObTVFI7lhr9g==
X-CSE-MsgGUID: ZMnCeXpjQ2aEhvisNn4L3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="112293857"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="112293857"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 12:24:26 -0700
X-CSE-ConnectionGUID: YWPJXenoRdWLP+JD+1Qs7g==
X-CSE-MsgGUID: u0f7hLsRSki7xdJEt6dAvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258170172"
Received: from jesusnar-desk.jf.intel.com ([10.88.27.172])
 by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2026 12:24:25 -0700
From: Jesus Narvaez <jesus.narvaez@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jesus Narvaez <jesus.narvaez@intel.com>,
 Martin Hodo <martin.hodo@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>, stable@vger.kernel.org
Subject: [PATCH 2/2] drm/i915/gsc: Validate the CPD entry offset before
 manifest read
Date: Fri,  7 Aug 2026 12:23:03 -0700
Message-ID: <20260807192301.3009387-4-jesus.narvaez@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807192301.3009387-3-jesus.narvaez@intel.com>
References: <20260807192301.3009387-3-jesus.narvaez@intel.com>
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

The CPD manifest offset was dereferenced without checking the bounds
first. Therefore, ensure the offset doesn't point into the CPD header
or past the bounds of the FW blob before reading the GSC manifest.

Also, validate CPD header length before using it to size the CPD
entry table, and cast the boot1 partition's offset and size to size_t
to avoid an integer overflow.

Discovered using AI-assisted static analysis confirmed by Intel Product
Security.

Reported-by: Martin Hodo <martin.hodo@intel.com>
Fixes: 56fafa569764 ("drm/i915/mtl/gsc: extract release and security versions from the gsc binary")
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: <stable@vger.kernel.org> # v6.6+
Signed-off-by: Jesus Narvaez <jesus.narvaez@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 27 ++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
index d550eb6edfb8..1b9976869c46 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -139,7 +139,7 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
 	 * --------------------------------------------------
 	 */
 
-	min_size = layout->boot1.offset + layout->boot1.size;
+	min_size = (size_t)layout->boot1.offset + layout->boot1.size;
 	if (size < min_size) {
 		gt_err(gt, "GSC FW too small for boot section! %zu < %zu\n",
 		       size, min_size);
@@ -195,7 +195,14 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
 		return -EINVAL;
 	}
 
-	min_size += sizeof(*cpd_entry) * cpd_header->num_of_entries;
+	if (cpd_header->header_length < sizeof(struct intel_gsc_cpd_header_v2)) {
+		gt_err(gt, "invalid CPD header length in GSC bin: %u < %zu!\n",
+		       cpd_header->header_length, sizeof(*cpd_header));
+		return -EINVAL;
+	}
+
+	min_size = bpdt_entry->sub_partition_offset + cpd_header->header_length +
+		   sizeof(*cpd_entry) * cpd_header->num_of_entries;
 	if (layout->boot1.size < min_size) {
 		gt_err(gt, "GSC FW boot section too small for CPD entries: %u < %zu\n",
 		       layout->boot1.size, min_size);
@@ -205,7 +212,21 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
 	cpd_entry = (void *)cpd_header + cpd_header->header_length;
 	for (i = 0; i < cpd_header->num_of_entries; i++, cpd_entry++) {
 		if (strcmp(cpd_entry->name, "RBEP.man") == 0) {
-			manifest = (void *)cpd_header + cpd_entry_offset(cpd_entry);
+			u32 man_off = cpd_entry_offset(cpd_entry);
+
+			if (man_off < cpd_header->header_length) {
+				gt_err(gt, "GSC FW manifest offset points into CPD header: %u < %u\n",
+				       man_off, cpd_header->header_length);
+				return -EINVAL;
+			}
+
+			if (man_off + sizeof(struct intel_gsc_manifest_header) >
+			    layout->boot1.size - bpdt_entry->sub_partition_offset) {
+				gt_err(gt, "GSC FW boot section too small for manifest: %u < %zu\n",
+				       layout->boot1.size, man_off + sizeof(*manifest));
+				return -ENODATA;
+			}
+			manifest = (void *)cpd_header + man_off;
 			intel_uc_fw_version_from_gsc_manifest(&gsc->release,
 							      manifest);
 			gsc->security_version = manifest->security_version;
-- 
2.43.0

