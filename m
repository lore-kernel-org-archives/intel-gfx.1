Return-Path: <SRS0=c41V=KQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C75AC433B4
	for <intel-gfx@archiver.kernel.org>; Fri, 21 May 2021 00:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6A46613AC
	for <intel-gfx@archiver.kernel.org>; Fri, 21 May 2021 00:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6A46613AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C2B6E459;
	Fri, 21 May 2021 00:52:20 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8684D6E459
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 May 2021 00:52:19 +0000 (UTC)
IronPort-SDR: 14Zf3VH9TJEsSH7s7oTF/0/awf7nEOZ+bpajYXpEUX8nILnVkfjR+BlM+cOHeXf23TIOAh9bNf
 AEQmpZkrxHMg==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="265284975"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="265284975"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 17:52:18 -0700
IronPort-SDR: wqsLw28kE/PRFEDDDkse9TsYkqmFZMR+BDyV65HoRGYaHJ7hOthKfAQEc1BwJWRlea5w6dxTCh
 s0VNrnWB5RwA==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="475462037"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 17:52:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 20 May 2021 17:52:09 -0700
Message-Id: <20210521005209.4058702-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/display: fix typo when returning table
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

Fix table returned when port_clock > 270000:

	drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:752:47: error: variable 'adlp_dkl_phy_dp_ddi_trans_hbr2_hbr3' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
	static const struct tgl_dkl_phy_ddi_buf_trans adlp_dkl_phy_dp_ddi_trans_hbr2_hbr3[] = {

Initial version of the patch had it in a single table, but on second
version the table got split, but we continued to reference just one of
them.

Fixes: ca962882268a ("drm/i915/adl_p: Define and use ADL-P specific DP translation tables")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index ce5d5d13b7c1..8bfd00f49f2a 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -1383,7 +1383,7 @@ adlp_get_dkl_buf_trans_dp(struct intel_encoder *encoder,
 {
 	if (crtc_state->port_clock > 270000) {
 		*n_entries = ARRAY_SIZE(adlp_dkl_phy_dp_ddi_trans_hbr2_hbr3);
-		return adlp_dkl_phy_dp_ddi_trans_hbr;
+		return adlp_dkl_phy_dp_ddi_trans_hbr2_hbr3;
 	}
 
 	*n_entries = ARRAY_SIZE(adlp_dkl_phy_dp_ddi_trans_hbr);
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
