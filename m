Return-Path: <SRS0=8ese=K3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21D4C47080
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Jun 2021 10:16:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A55876139A
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Jun 2021 10:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A55876139A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE27F6EA0D;
	Tue,  1 Jun 2021 10:16:41 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831766EA08;
 Tue,  1 Jun 2021 10:16:39 +0000 (UTC)
IronPort-SDR: 25YwmkxKAlTc9MdPc9NSQe31EBJ80ecDcu9z/hPyIFNJ/Q7MaHWeO/rS+q336O72fV3F9fM8ZA
 QMIn2aMAfrmg==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203550060"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="203550060"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:39 -0700
IronPort-SDR: 8PQDJpI9wHE5Ho1IKuZeoZDNf0VIwLVwW7c7e5XTn72WvshH8JvEcpvZgEYqsFMO5unuRDKEcx
 Mzkcn5F/nnBw==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="482431408"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:37 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Tue,  1 Jun 2021 16:22:16 +0530
Message-Id: <20210601105218.29185-20-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601105218.29185-1-uma.shankar@intel.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 19/21] drm/i915/xelpd: Add register definitions
 for Plane Gamma
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

Add macros to define Plane Gamma registers

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 73 +++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index a8e35357aea0..2ebc92104f64 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -11398,6 +11398,79 @@ enum skl_power_gate {
 		_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \
 		_PLANE_PRE_CSC_GAMC_DATA_2(pipe))
 
+/* Display13 Plane Gamma Reg */
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A	0x70160
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B	0x71160
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A	0x70260
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B	0x71260
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A, \
+							_PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A, \
+							_PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe), \
+		_PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A	0x70164
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B	0x71164
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A	0x70264
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B	0x71264
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A, \
+							_PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A, \
+							_PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_SEG0_DATA_ENH(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe), \
+		_PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1_A	0x701d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1_B	0x711d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2_A	0x702d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2_B	0x712d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_ENH_1_A, \
+						_PLANE_POST_CSC_GAMC_INDEX_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_ENH_2_A, \
+						_PLANE_POST_CSC_GAMC_INDEX_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe), \
+		_PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_1_A	0x701dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_1_B	0x711dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_2_A	0x702dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_2_B	0x712dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_ENH_1_A, \
+						_PLANE_POST_CSC_GAMC_DATA_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_ENH_2_A, \
+						_PLANE_POST_CSC_GAMC_DATA_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe), \
+		_PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_INDEX_1_A	0x704d8
+#define _PLANE_POST_CSC_GAMC_INDEX_1_B	0x714d8
+#define _PLANE_POST_CSC_GAMC_INDEX_2_A	0x705d8
+#define _PLANE_POST_CSC_GAMC_INDEX_2_B	0x715d8
+#define _PLANE_POST_CSC_GAMC_INDEX_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_1_A, \
+						_PLANE_POST_CSC_GAMC_INDEX_1_B)
+#define _PLANE_POST_CSC_GAMC_INDEX_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_2_A, \
+						_PLANE_POST_CSC_GAMC_INDEX_2_B)
+#define PLANE_POST_CSC_GAMC_INDEX(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_1(pipe), \
+		_PLANE_POST_CSC_GAMC_INDEX_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_DATA_1_A	0x704dc
+#define _PLANE_POST_CSC_GAMC_DATA_1_B	0x714dc
+#define _PLANE_POST_CSC_GAMC_DATA_2_A	0x705dc
+#define _PLANE_POST_CSC_GAMC_DATA_2_B	0x715dc
+#define _PLANE_POST_CSC_GAMC_DATA_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_1_A, \
+						_PLANE_POST_CSC_GAMC_DATA_1_B)
+#define _PLANE_POST_CSC_GAMC_DATA_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_2_A, \
+						_PLANE_POST_CSC_GAMC_DATA_2_B)
+#define PLANE_POST_CSC_GAMC_DATA(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_1(pipe), \
+		_PLANE_POST_CSC_GAMC_DATA_2(pipe))
+
 /* pipe CSC & degamma/gamma LUTs on CHV */
 #define _CGM_PIPE_A_CSC_COEFF01	(VLV_DISPLAY_BASE + 0x67900)
 #define _CGM_PIPE_A_CSC_COEFF23	(VLV_DISPLAY_BASE + 0x67904)
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
