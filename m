Return-Path: <SRS0=zZOI=I7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C2BC433B4
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Apr 2021 08:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 805C4610E8
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Apr 2021 08:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 805C4610E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292606E17E;
	Fri,  2 Apr 2021 08:23:23 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33836E17E
 for <intel-gfx@lists.freedesktop.org>; Fri,  2 Apr 2021 08:23:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93D5EABED;
 Fri,  2 Apr 2021 08:23:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri,  2 Apr 2021 10:23:17 +0200
Message-Id: <20210402082317.871-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2] drm/i915: Fix invalid access to ACPI _DSM
 objects
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

intel_dsm_platform_mux_info() tries to parse the ACPI package data
from _DSM for the debug information, but it assumes the fixed format
without checking what values are stored in the elements actually.
When an unexpected value is returned from BIOS, it may lead to GPF or
NULL dereference, as reported recently.

Add the checks of the contents in the returned values and skip the
values for invalid cases.

v1->v2: Check the info contents before dereferencing, too

BugLink: http://bugzilla.opensuse.org/show_bug.cgi?id=1184074
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/i915/display/intel_acpi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
index e21fb14d5e07..833d0c1be4f1 100644
--- a/drivers/gpu/drm/i915/display/intel_acpi.c
+++ b/drivers/gpu/drm/i915/display/intel_acpi.c
@@ -84,13 +84,31 @@ static void intel_dsm_platform_mux_info(acpi_handle dhandle)
 		return;
 	}
 
+	if (!pkg->package.count) {
+		DRM_DEBUG_DRIVER("no connection in _DSM\n");
+		return;
+	}
+
 	connector_count = &pkg->package.elements[0];
 	DRM_DEBUG_DRIVER("MUX info connectors: %lld\n",
 		  (unsigned long long)connector_count->integer.value);
 	for (i = 1; i < pkg->package.count; i++) {
 		union acpi_object *obj = &pkg->package.elements[i];
-		union acpi_object *connector_id = &obj->package.elements[0];
-		union acpi_object *info = &obj->package.elements[1];
+		union acpi_object *connector_id;
+		union acpi_object *info;
+
+		if (obj->type != ACPI_TYPE_PACKAGE || obj->package.count < 2) {
+			DRM_DEBUG_DRIVER("Invalid object for MUX #%d\n", i);
+			continue;
+		}
+
+		connector_id = &obj->package.elements[0];
+		info = &obj->package.elements[1];
+		if (info->type != ACPI_TYPE_BUFFER || info->buffer.length < 4) {
+			DRM_DEBUG_DRIVER("Invalid info for MUX obj #%d\n", i);
+			continue;
+		}
+
 		DRM_DEBUG_DRIVER("Connector id: 0x%016llx\n",
 			  (unsigned long long)connector_id->integer.value);
 		DRM_DEBUG_DRIVER("  port id: %s\n",
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
