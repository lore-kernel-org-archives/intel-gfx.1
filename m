Return-Path: <SRS0=XCjr=B5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496ACC433E1
	for <intel-gfx@archiver.kernel.org>; Wed, 19 Aug 2020 11:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21345206FA
	for <intel-gfx@archiver.kernel.org>; Wed, 19 Aug 2020 11:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21345206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C16589C13;
	Wed, 19 Aug 2020 11:30:52 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C09B89BA5
 for <intel-gfx@lists.freedesktop.org>; Wed, 19 Aug 2020 11:30:51 +0000 (UTC)
IronPort-SDR: 3SbfZBZU0TMHAiYLfwssVVasQMSYSXc8hfOz6dSiz1ify9MygUE9Xk71IjjoeWLtZlqk3sKSgQ
 2erU5do6XgKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="135157583"
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="135157583"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 04:30:51 -0700
IronPort-SDR: 5ONVDmahuixEeS2Fcp4kn/zshBBSZSm2eFfeJnoP04Cx/URgI79VrmnFvu8sf7IGiTtvT/FiBL
 B07RifT7nkWg==
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="472206462"
Received: from unknown (HELO john.iind.intel.com) ([10.223.74.105])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 19 Aug 2020 04:30:49 -0700
From: Nischal Varide <nischal.varide@intel.com>
To: intel-gfx@lists.freedesktop.org,
	nischal.varide@intel.com
Date: Wed, 19 Aug 2020 10:04:08 +0530
Message-Id: <20200819043409.26010-4-nischal.varide@intel.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200819043409.26010-1-nischal.varide@intel.com>
References: <20200819043409.26010-1-nischal.varide@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 4/5]
 Critical-KlockWork-Fix-intel_tv.c-Possible-Null
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

This patch fixes the Critical Klock work Error and in this case a
Possible Null Pointer Dereference has been addressed with a Null check
before dereferencing

Signed-off-by: Nischal Varide <nischal.varide@intel.com>
---
 drivers/gpu/drm/i915/display/intel_tv.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index 777032d9697b..5600d146ae81 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -1836,17 +1836,20 @@ static int intel_tv_atomic_check(struct drm_connector *connector,
 	struct drm_connector_state *old_state;
 
 	new_state = drm_atomic_get_new_connector_state(state, connector);
-	if (!new_state->crtc)
-		return 0;
-
 	old_state = drm_atomic_get_old_connector_state(state, connector);
 	new_crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
 
+	if (!(old_state && new_state && new_crtc_state))
+		return 0;
+
+	if (!new_state->crtc)
+		return 0;
+
 	if (old_state->tv.mode != new_state->tv.mode ||
-	    old_state->tv.margins.left != new_state->tv.margins.left ||
-	    old_state->tv.margins.right != new_state->tv.margins.right ||
-	    old_state->tv.margins.top != new_state->tv.margins.top ||
-	    old_state->tv.margins.bottom != new_state->tv.margins.bottom) {
+		old_state->tv.margins.left != new_state->tv.margins.left ||
+		old_state->tv.margins.right != new_state->tv.margins.right ||
+		old_state->tv.margins.top != new_state->tv.margins.top ||
+		old_state->tv.margins.bottom != new_state->tv.margins.bottom) {
 		/* Force a modeset. */
 
 		new_crtc_state->connectors_changed = true;
-- 
2.26.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
