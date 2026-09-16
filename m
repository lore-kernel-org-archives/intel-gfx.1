Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35F9C982CC
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2026 17:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3C810E251;
	Wed, 16 Sep 2026 17:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sm5fM1ti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18FA10E251
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Sep 2026 17:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789579622; x=1821115622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tYXK1eNoSwAdFPyV5XYwjd8ydlRKBTGDqRsDjO1OLCc=;
 b=Sm5fM1tiFO91WxqlqCV/G6R6s3wDZKDGvnA5xKCzoMJCnpvxgfJI57ul
 OpWKfBXvZHDDf8Ptz7nXc1cpF3JM/kS+NfSeuubqrha7EWk1wj9O1sdFp
 PQErwRfsnAXhyyMyr56RAX1B87l0WPDirieiWYyiSTGpMQQPB10IctZud
 HOnkPOrHAVPlaBpS3BdEsk6LKcmrmO0gSkQYLEi1aRja+6SM35NVYBaMX
 pnLH4+ubB5L/kfnD+Nbuj2tKw5qKyjZNvCjtIEltqkj+YMnPhILxILlnp
 eFk0bf6zZpsgpO/DAPi8nkVNm/1YUaTLgvR9eF40FCgD/0+4/IdwbgcBF g==;
X-CSE-ConnectionGUID: FyNI5peNQBWJXdTlhSNlKA==
X-CSE-MsgGUID: r/6phfPlQs+eRzSrS3E01Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115499483"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="115499483"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 10:27:02 -0700
X-CSE-ConnectionGUID: +tl5PTnuSzaCMeECH97nHQ==
X-CSE-MsgGUID: y11mBr+uTImsnW15vX15Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1630839"
Received: from jesusnar-desk.jf.intel.com ([10.88.27.172])
 by fmviesa012.fm.intel.com with ESMTP; 16 Sep 2026 10:27:01 -0700
From: Jesus Narvaez <jesus.narvaez@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jesus Narvaez <jesus.narvaez@intel.com>,
 Martin Hodo <martin.hodo@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>, stable@vger.kernel.org
Subject: [PATCH v2 2/2] drm/i915/gsc: Validate the CPD entry offset before
 manifest read
Date: Wed, 16 Sep 2026 10:26:17 -0700
Message-ID: <20260916172615.681135-4-jesus.narvaez@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916172615.681135-3-jesus.narvaez@intel.com>
References: <20260916172615.681135-3-jesus.narvaez@intel.com>
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
first. Therefore, ensure the offset and manifest header fit within
the CPD region before reading the GSC manifest.

Also, validate CPD header length before using it to size the CPD
entry table, and cast the boot1 partition's offset and size to size_t
to avoid an integer overflow.

Discovered using AI-assisted static analysis confirmed by Intel Product
Security.

v2:
  - Removed unneeded manifest offset check against CPD header (Daniele)
  - Saved sub_partition_offset to cpd_offset variable (Daniele)
  - Added parenthesis to manifest bounds check (Daniele)

Reported-by: Martin Hodo <martin.hodo@intel.com>
Fixes: 56fafa569764 ("drm/i915/mtl/gsc: extract release and security versions from the gsc binary")
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: <stable@vger.kernel.org> # v6.6+
Signed-off-by: Jesus Narvaez <jesus.narvaez@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 27 ++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
index d550eb6edfb8..ab6c19d4125f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -82,6 +82,7 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
 	const struct intel_gsc_manifest_header *manifest;
 	struct intel_uc_fw_ver min_ver = { 0 };
 	size_t min_size = sizeof(*layout);
+	u32 cpd_offset = 0;
 	int i;
 
 	if (size < min_size) {
@@ -139,7 +140,7 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
 	 * --------------------------------------------------
 	 */
 
-	min_size = layout->boot1.offset + layout->boot1.size;
+	min_size = (size_t)layout->boot1.offset + layout->boot1.size;
 	if (size < min_size) {
 		gt_err(gt, "GSC FW too small for boot section! %zu < %zu\n",
 		       size, min_size);
@@ -173,8 +174,9 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
 		    INTEL_GSC_BPDT_ENTRY_TYPE_GSC_RBE)
 			continue;
 
-		cpd_header = (void *)bpdt_header + bpdt_entry->sub_partition_offset;
-		min_size = bpdt_entry->sub_partition_offset + sizeof(*cpd_header);
+		cpd_offset = bpdt_entry->sub_partition_offset;
+		cpd_header = (void *)bpdt_header + cpd_offset;
+		min_size = cpd_offset + sizeof(*cpd_header);
 		break;
 	}
 
@@ -195,7 +197,14 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
 		return -EINVAL;
 	}
 
-	min_size += sizeof(*cpd_entry) * cpd_header->num_of_entries;
+	if (cpd_header->header_length < sizeof(struct intel_gsc_cpd_header_v2)) {
+		gt_err(gt, "invalid CPD header length in GSC bin: %u < %zu!\n",
+		       cpd_header->header_length, sizeof(*cpd_header));
+		return -EINVAL;
+	}
+
+	min_size = cpd_offset + cpd_header->header_length +
+		   sizeof(*cpd_entry) * cpd_header->num_of_entries;
 	if (layout->boot1.size < min_size) {
 		gt_err(gt, "GSC FW boot section too small for CPD entries: %u < %zu\n",
 		       layout->boot1.size, min_size);
@@ -205,7 +214,15 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
 	cpd_entry = (void *)cpd_header + cpd_header->header_length;
 	for (i = 0; i < cpd_header->num_of_entries; i++, cpd_entry++) {
 		if (strcmp(cpd_entry->name, "RBEP.man") == 0) {
-			manifest = (void *)cpd_header + cpd_entry_offset(cpd_entry);
+			u32 man_off = cpd_entry_offset(cpd_entry);
+
+			if ((man_off + sizeof(struct intel_gsc_manifest_header)) >
+			    (layout->boot1.size - cpd_offset)) {
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

