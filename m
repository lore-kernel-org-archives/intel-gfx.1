Return-Path: <SRS0=wfJw=LQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C74C2B9F4
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Jun 2021 21:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1A5A61027
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Jun 2021 21:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1A5A61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A826E233;
	Tue, 22 Jun 2021 21:22:23 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7852B6E233
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Jun 2021 21:22:19 +0000 (UTC)
IronPort-SDR: ty1PtKpdNf0vSJb+Mt97HuTByijjzuPOUdWe0ud9lJqx59DlARZPUqceB5/OSS1Bh8e2RQZqCl
 rh0akjun/w2g==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="186834045"
X-IronPort-AV: E=Sophos;i="5.83,292,1616482800"; d="scan'208";a="186834045"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 14:22:18 -0700
IronPort-SDR: b0fcGY0dPSbAXKt5lWu7kr46LdqTuO0Y3HF2mQLsMQ2K6xh8Ox82uAWw+zRvsKPo0tENWd6otZ
 10Il7O7TE2jw==
X-IronPort-AV: E=Sophos;i="5.83,292,1616482800"; d="scan'208";a="444742284"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 14:22:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 22 Jun 2021 14:22:10 -0700
Message-Id: <20210622212210.3746133-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622212210.3746133-1-lucas.demarchi@intel.com>
References: <20210622212210.3746133-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/2] drm/i915/display: use max_level to control
 loop
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

Since we are already loop through the levels to sanitize them, mark what
is the real max_level so it can be used in subsequent loop. This makes
it simpler to later add the adjsutement latency to "valid levels". No
change in behavior, just makes the code easier to follow.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/intel_pm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index be2931d54b95..6b6474d4f204 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -2906,6 +2906,9 @@ static void intel_read_wm_latency(struct drm_i915_private *dev_priv,
 			if (wm[level] == 0) {
 				for (i = level + 1; i <= max_level; i++)
 					wm[i] = 0;
+
+				max_level = level - 1;
+
 				break;
 			}
 		}
@@ -2920,12 +2923,8 @@ static void intel_read_wm_latency(struct drm_i915_private *dev_priv,
 		if (wm[0] == 0) {
 			u8 adjust = DISPLAY_VER(dev_priv) >= 12 ? 3 : 2;
 
-			wm[0] += adjust;
-			for (level = 1; level <= max_level; level++) {
-				if (wm[level] == 0)
-					break;
+			for (level = 0; level <= max_level; level++)
 				wm[level] += adjust;
-			}
 		}
 
 		/*
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
