Return-Path: <SRS0=Dys0=IH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCEEC433E6
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Mar 2021 13:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0AF664F51
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Mar 2021 13:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0AF664F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893B86E902;
	Tue,  9 Mar 2021 13:54:57 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8A86E902;
 Tue,  9 Mar 2021 13:54:56 +0000 (UTC)
IronPort-SDR: nVdSHGw7gW5+UiUOmmjNBMKBHLKGVh1vfLQMoWae4iR22lJThr1PvLW/z8vhg87djpjIqXjpPd
 b7rJ2Gp1uAdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="175842805"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="175842805"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:54:55 -0800
IronPort-SDR: d6kOvt9EDTzIZE6lZsnPEM+U4HbKWdHjCHqfXv0leKlKWmuESysUDU66gC1KqgUdSD7DKTuFgO
 Unc24HwDxPEw==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="437656492"
Received: from kjwindec-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.180])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:54:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Date: Tue,  9 Mar 2021 15:54:13 +0200
Message-Id: <8a527f66b856d6c099313046e028a18f9257baa8.1615297748.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1615297748.git.jani.nikula@intel.com>
References: <cover.1615297748.git.jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC v1 5/6] drm/edid: use the new displayid iterator
 for finding CEA extension
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Neatly reduce displayid boilerplate in code. No functional changes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index fbaa7d679cb2..4526e2557dca 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3266,35 +3266,28 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 
 static const u8 *drm_find_cea_extension(const struct edid *edid)
 {
-	int length, idx;
 	const struct displayid_block *block;
+	struct displayid_iter iter;
 	const u8 *cea;
-	const u8 *displayid;
-	int ext_index;
+	int ext_index = 0;
 
 	/* Look for a top level CEA extension block */
 	/* FIXME: make callers iterate through multiple CEA ext blocks? */
-	ext_index = 0;
 	cea = drm_find_edid_extension(edid, CEA_EXT, &ext_index);
 	if (cea)
 		return cea;
 
 	/* CEA blocks can also be found embedded in a DisplayID block */
-	ext_index = 0;
-	for (;;) {
-		displayid = drm_find_displayid_extension(edid, &length, &idx,
-							 &ext_index);
-		if (!displayid)
-			return NULL;
-
-		idx += sizeof(struct displayid_hdr);
-		for_each_displayid_db(displayid, block, idx, length) {
-			if (block->tag == DATA_BLOCK_CTA)
-				return (const u8 *)block;
+	displayid_iter_edid_begin(edid, &iter);
+	displayid_iter_for_each(block, &iter) {
+		if (block->tag == DATA_BLOCK_CTA) {
+			cea = (const u8 *)block;
+			break;
 		}
 	}
+	displayid_iter_end(&iter);
 
-	return NULL;
+	return cea;
 }
 
 static __always_inline const struct drm_display_mode *cea_mode_for_vic(u8 vic)
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
