Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7308EC32793
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Aug 2022 09:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C7AB1D38;
	Tue, 23 Aug 2022 09:09:50 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57EEB1D3C
 for <intel-gfx@lists.freedesktop.org>; Tue, 23 Aug 2022 09:09:39 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 23 Aug 2022 11:01:27 +0200
Message-Id: <20220823090128.488008-4-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823090128.488008-1-maarten.lankhorst@linux.intel.com>
References: <20220823090128.488008-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 3/4] drm/i915: Remove uncore from intel_bios.c
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

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 25 ++++++++++++-----------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 198a2f4920cc..c209d0b35041 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -29,9 +29,10 @@
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dsc_helper.h>
 
-#include "display/intel_display.h"
-#include "display/intel_display_types.h"
-#include "display/intel_gmbus.h"
+#include "intel_de.h"
+#include "intel_display.h"
+#include "intel_display_types.h"
+#include "intel_gmbus.h"
 
 #include "i915_drv.h"
 #include "i915_reg.h"
@@ -2960,16 +2961,16 @@ static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *i915)
 	u16 vbt_size;
 	u32 *vbt;
 
-	static_region = intel_uncore_read(&i915->uncore, SPI_STATIC_REGIONS);
+	static_region = intel_de_read(i915, SPI_STATIC_REGIONS);
 	static_region &= OPTIONROM_SPI_REGIONID_MASK;
-	intel_uncore_write(&i915->uncore, PRIMARY_SPI_REGIONID, static_region);
+	intel_de_write(i915, PRIMARY_SPI_REGIONID, static_region);
 
-	oprom_offset = intel_uncore_read(&i915->uncore, OROM_OFFSET);
+	oprom_offset = intel_de_read(i915, OROM_OFFSET);
 	oprom_offset &= OROM_OFFSET_MASK;
 
 	for (count = 0; count < oprom_size; count += 4) {
-		intel_uncore_write(&i915->uncore, PRIMARY_SPI_ADDRESS, oprom_offset + count);
-		data = intel_uncore_read(&i915->uncore, PRIMARY_SPI_TRIGGER);
+		intel_de_write(i915, PRIMARY_SPI_ADDRESS, oprom_offset + count);
+		data = intel_de_read(i915, PRIMARY_SPI_TRIGGER);
 
 		if (data == *((const u32 *)"$VBT")) {
 			found = oprom_offset + count;
@@ -2981,9 +2982,9 @@ static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *i915)
 		goto err_not_found;
 
 	/* Get VBT size and allocate space for the VBT */
-	intel_uncore_write(&i915->uncore, PRIMARY_SPI_ADDRESS, found +
+	intel_de_write(i915, PRIMARY_SPI_ADDRESS, found +
 		   offsetof(struct vbt_header, vbt_size));
-	vbt_size = intel_uncore_read(&i915->uncore, PRIMARY_SPI_TRIGGER);
+	vbt_size = intel_de_read(i915, PRIMARY_SPI_TRIGGER);
 	vbt_size &= 0xffff;
 
 	vbt = kzalloc(round_up(vbt_size, 4), GFP_KERNEL);
@@ -2991,8 +2992,8 @@ static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *i915)
 		goto err_not_found;
 
 	for (count = 0; count < vbt_size; count += 4) {
-		intel_uncore_write(&i915->uncore, PRIMARY_SPI_ADDRESS, found + count);
-		data = intel_uncore_read(&i915->uncore, PRIMARY_SPI_TRIGGER);
+		intel_de_write(i915, PRIMARY_SPI_ADDRESS, found + count);
+		data = intel_de_read(i915, PRIMARY_SPI_TRIGGER);
 		*(vbt + store++) = data;
 	}
 
-- 
2.34.1

