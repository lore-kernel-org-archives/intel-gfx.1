Return-Path: <SRS0=3135=II=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C9CC433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Mar 2021 22:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5104664FAF
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Mar 2021 22:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5104664FAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62396EA79;
	Wed, 10 Mar 2021 22:17:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9541189E5B
 for <intel-gfx@lists.freedesktop.org>; Wed, 10 Mar 2021 22:17:44 +0000 (UTC)
IronPort-SDR: x6QjPVcceZJC7sQl0i1gE/awbI7v1OE587i1SuzLhiEi4o/ruVwCRjDsGLojM1iyyk8UqTebw/
 aR3K1DBd5yEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="252592059"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="252592059"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 14:17:44 -0800
IronPort-SDR: GAQqx5JAqeoaYXwgOHEnuHAz/uQFMCKFx1Cj8hGjhAjh+b9hj28rMxGMGl7+TsWy3rynFvz3YK
 RkWFNsowEiUg==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="403852191"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 14:17:43 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 11 Mar 2021 00:17:18 +0200
Message-Id: <20210310221736.2963264-6-imre.deak@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310221736.2963264-1-imre.deak@intel.com>
References: <20210310221736.2963264-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 05/23] drm/i915/selftest: Make sure to init
 i915_ggtt_view in igt_vma_rotate_remap()
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

This probably doesn't cause an issue, since the code checks the view
type dependent size of the views before comparing them, but let's follow
the practice to bzero the whole struct when initializing it.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index ffea2602a781..3d557b8a2098 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -515,7 +515,7 @@ static int igt_vma_rotate_remap(void *arg)
 	for (t = types; *t; t++) {
 	for (a = planes; a->width; a++) {
 		for (b = planes + ARRAY_SIZE(planes); b-- != planes; ) {
-			struct i915_ggtt_view view;
+			struct i915_ggtt_view view = { };
 			unsigned int n, max_offset;
 
 			max_offset = max(a->stride * a->height,
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
