Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2458AC2A09B
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Aug 2026 19:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F69110E45E;
	Fri,  7 Aug 2026 19:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OzJYWQvw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B8510E45E
 for <intel-gfx@lists.freedesktop.org>; Fri,  7 Aug 2026 19:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786130660; x=1817666660;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jrCHeYZIdyZ3MVZUKmyFjr7FFMpHV+BS5nXHVsp+8qo=;
 b=OzJYWQvwFQOvS8FswfcigM9gmTCrkJFZjL7PCg1oUYE2v4ObEqs3RZor
 vetNdAm9uv/BN9cKmRvsHFWpTwEud/fS9pXPzTB7ObSAXc35508jPTBed
 RSklC1bUkDdzs99shqvj49Z92BlELdXyXSqd537qZlQImGuGulNu08aGm
 xTlCKX0z9prLK65rTKm7NWiRq3gQLvq/rwWyHGR39n0BqHe+w8NRzImyM
 Sd4xp17+wQUWGnb+so+WuKJTKNovXkSjuixRZMnagnjiHAYWGHH0qYmv4
 kZBdRoZgnJ7StBugqgmWN0WClW6gSjcUpLnAHdnwf1Rq8ZlISyN0gVdkw w==;
X-CSE-ConnectionGUID: 9/wtfrXuRcKJlm9Pa5WLTg==
X-CSE-MsgGUID: 8szKbPxST2G3NqbwrfDNpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="112293851"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="112293851"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 12:24:19 -0700
X-CSE-ConnectionGUID: MhCL2lxSRo2qfteaU+P5Yw==
X-CSE-MsgGUID: SpM4WRCsQV6JcKCFsev0Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258170139"
Received: from jesusnar-desk.jf.intel.com ([10.88.27.172])
 by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2026 12:24:15 -0700
From: Jesus Narvaez <jesus.narvaez@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jesus Narvaez <jesus.narvaez@intel.com>,
 Martin Hodo <martin.hodo@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>, stable@vger.kernel.org
Subject: [PATCH 1/2] drm/i915/huc: Validate the CPD entry offset before
 manifest read
Date: Fri,  7 Aug 2026 12:23:02 -0700
Message-ID: <20260807192301.3009387-3-jesus.narvaez@intel.com>
X-Mailer: git-send-email 2.43.0
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

The CPD manifest offset was dereferenced without checking whether the
offset was out of bounds or not. Validate the offset is within the FW
blob before continuing with the read.

Discovered using AI-assisted static analysis confirmed by Intel Product
Security.

Reported-by: Martin Hodo <martin.hodo@intel.com>
Fixes: 93a575ab1533 ("drm/i915/huc: Parse the GSC-enabled HuC binary")
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: <stable@vger.kernel.org> # v6.5+
Signed-off-by: Jesus Narvaez <jesus.narvaez@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
index b648238cc675..b9cbcf973236 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
@@ -216,9 +216,19 @@ int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const void *data, s
 	entry = data + header->header_length;
 
 	for (i = 0; i < header->num_of_entries; i++, entry++) {
-		if (strcmp(entry->name, "HUCP.man") == 0)
+		if (strcmp(entry->name, "HUCP.man") == 0) {
+			u32 offset = entry_offset(entry);
+
+			if (offset >= size ||
+			    size - offset < sizeof(struct intel_gsc_manifest_header)) {
+				huc_err(huc, "CPD manifest offset 0x%x out of bounds (size %zu)\n",
+					offset, size);
+				return -ENODATA;
+			}
+
 			intel_uc_fw_version_from_gsc_manifest(&huc_fw->file_selected.ver,
-							      data + entry_offset(entry));
+							      data + offset);
+		}
 
 		if (strcmp(entry->name, "huc_fw") == 0) {
 			u32 offset = entry_offset(entry);
-- 
2.43.0

