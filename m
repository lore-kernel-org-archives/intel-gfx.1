Return-Path: <SRS0=5Iya=LE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3FAC48BDF
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Jun 2021 04:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D6D46109E
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Jun 2021 04:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D6D46109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04F66EB8E;
	Thu, 10 Jun 2021 04:19:08 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4AC6E81E;
 Thu, 10 Jun 2021 04:19:03 +0000 (UTC)
IronPort-SDR: 0i6oABnT1JtHoT3sAMvztThZtUJmMC8a2tJhAHq+g/FhuNhEKfWfAiz08jWn2k7hdxBmg2c1+t
 o3oJ3HMMJaQg==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="203373018"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="203373018"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 21:19:02 -0700
IronPort-SDR: zd23R6TOb3ucVUJ9AMt+a2AbdtYabjDBqPo3D/mnEIfmQ5HcNJ5jWpxfBIJL//Zp5oSBdmHfDS
 MVPtEDl8RX5g==
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="485997297"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 21:19:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Wed,  9 Jun 2021 21:36:49 -0700
Message-Id: <20210610043649.144416-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210610043649.144416-1-matthew.brost@intel.com>
References: <20210610043649.144416-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 13/13] drm/i915/guc: Update firmware to v62.0.0
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

From: John Harrison <John.C.Harrison@Intel.com>

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 26 ++++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index df647c9a8d56..9f23e9de3237 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -48,19 +48,19 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * firmware as TGL.
  */
 #define INTEL_UC_FIRMWARE_DEFS(fw_def, guc_def, huc_def) \
-	fw_def(ALDERLAKE_S, 0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
-	fw_def(ROCKETLAKE,  0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
-	fw_def(TIGERLAKE,   0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
-	fw_def(JASPERLAKE,  0, guc_def(ehl, 49, 0, 1), huc_def(ehl,  9, 0, 0)) \
-	fw_def(ELKHARTLAKE, 0, guc_def(ehl, 49, 0, 1), huc_def(ehl,  9, 0, 0)) \
-	fw_def(ICELAKE,     0, guc_def(icl, 49, 0, 1), huc_def(icl,  9, 0, 0)) \
-	fw_def(COMETLAKE,   5, guc_def(cml, 49, 0, 1), huc_def(cml,  4, 0, 0)) \
-	fw_def(COMETLAKE,   0, guc_def(kbl, 49, 0, 1), huc_def(kbl,  4, 0, 0)) \
-	fw_def(COFFEELAKE,  0, guc_def(kbl, 49, 0, 1), huc_def(kbl,  4, 0, 0)) \
-	fw_def(GEMINILAKE,  0, guc_def(glk, 49, 0, 1), huc_def(glk,  4, 0, 0)) \
-	fw_def(KABYLAKE,    0, guc_def(kbl, 49, 0, 1), huc_def(kbl,  4, 0, 0)) \
-	fw_def(BROXTON,     0, guc_def(bxt, 49, 0, 1), huc_def(bxt,  2, 0, 0)) \
-	fw_def(SKYLAKE,     0, guc_def(skl, 49, 0, 1), huc_def(skl,  2, 0, 0))
+	fw_def(ALDERLAKE_S, 0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 5, 0)) \
+	fw_def(ROCKETLAKE,  0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 5, 0)) \
+	fw_def(TIGERLAKE,   0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 5, 0)) \
+	fw_def(JASPERLAKE,  0, guc_def(ehl, 62, 0, 0), huc_def(ehl,  9, 0, 0)) \
+	fw_def(ELKHARTLAKE, 0, guc_def(ehl, 62, 0, 0), huc_def(ehl,  9, 0, 0)) \
+	fw_def(ICELAKE,     0, guc_def(icl, 62, 0, 0), huc_def(icl,  9, 0, 0)) \
+	fw_def(COMETLAKE,   5, guc_def(cml, 62, 0, 0), huc_def(cml,  4, 0, 0)) \
+	fw_def(COMETLAKE,   0, guc_def(kbl, 62, 0, 0), huc_def(kbl,  4, 0, 0)) \
+	fw_def(COFFEELAKE,  0, guc_def(kbl, 62, 0, 0), huc_def(kbl,  4, 0, 0)) \
+	fw_def(GEMINILAKE,  0, guc_def(glk, 62, 0, 0), huc_def(glk,  4, 0, 0)) \
+	fw_def(KABYLAKE,    0, guc_def(kbl, 62, 0, 0), huc_def(kbl,  4, 0, 0)) \
+	fw_def(BROXTON,     0, guc_def(bxt, 62, 0, 0), huc_def(bxt,  2, 0, 0)) \
+	fw_def(SKYLAKE,     0, guc_def(skl, 62, 0, 0), huc_def(skl,  2, 0, 0))
 
 #define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_) \
 	"i915/" \
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
