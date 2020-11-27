Return-Path: <SRS0=emkq=FB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC797C2D0E4
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 12:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC486208D5
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 12:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC486208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080856ECD0;
	Fri, 27 Nov 2020 12:11:41 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820836ED09;
 Fri, 27 Nov 2020 12:11:37 +0000 (UTC)
IronPort-SDR: zQT4gRansPI6GZXN7bGa7+BVbGAIfrqNRWZY0574k4/sYKhsHRPsa551UstJQrhEAM+XhzkOuS
 irjJYyb4kvbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092918"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092918"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:37 -0800
IronPort-SDR: uv0MS3LDr5mVE1lX+2caPNbhLYhLupQMdzB4w9qXHOO1fF/iWB0Lsy9WzhHO75VTkMcjJtzntA
 WRQoj2h4lQcg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029836"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:35 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 12:06:43 +0000
Message-Id: <20201127120718.454037-128-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC PATCH 127/162] drm/i915: Allow non-uniform
 subslices in gen12+
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Stuart Summers <stuart.summers@intel.com>

The current implementation of intel_set_subslices only takes
the number of bits per subslice stride and copies those in
based on the slice given. For all known use cases, this works
fine. But in the event of some faulty hardware or other future
use case, do a straight memcpy of these subslice bits into
the internal mask to ensure all subslices are correctly
calculated.

Cc: Harish Chegondi <harish.chegondi@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Suggested-by: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index 8a72e0fe34ca..b8a945166d32 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -104,6 +104,7 @@ static u16 compute_eu_total(const struct sseu_dev_info *sseu)
 static void gen11_compute_sseu_info(struct sseu_dev_info *sseu,
 				    u8 s_en, u32 ss_en, u16 eu_en)
 {
+	u32 ss_mask;
 	int s, ss;
 
 	/* ss_en represents entire subslice mask across all slices */
@@ -116,7 +117,10 @@ static void gen11_compute_sseu_info(struct sseu_dev_info *sseu,
 
 		sseu->slice_mask |= BIT(s);
 
-		intel_sseu_set_subslices(sseu, s, ss_en);
+		ss_mask = ss_en >> (s * sseu->max_subslices);
+		ss_mask &= GENMASK(sseu->max_subslices - 1, 0);
+
+		intel_sseu_set_subslices(sseu, s, ss_mask);
 
 		for (ss = 0; ss < sseu->max_subslices; ss++)
 			if (intel_sseu_has_subslice(sseu, s, ss))
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
