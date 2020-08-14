Return-Path: <SRS0=1luh=BY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63EBC433E1
	for <intel-gfx@archiver.kernel.org>; Fri, 14 Aug 2020 09:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96CBA206B2
	for <intel-gfx@archiver.kernel.org>; Fri, 14 Aug 2020 09:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96CBA206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E635A6EB17;
	Fri, 14 Aug 2020 09:46:12 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDCF6EB17
 for <intel-gfx@lists.freedesktop.org>; Fri, 14 Aug 2020 09:46:10 +0000 (UTC)
IronPort-SDR: LhVjLGRJTNIZszIsRHE8FPfGGI4si11iDBkGHF5RDZc5wd6HhzTzar2NI0aRfcEcrZgS43AZSH
 clGsTIqwhRAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="152026589"
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="152026589"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 02:46:10 -0700
IronPort-SDR: E6RHUQ9EN6RWr2Zf91U4gIU2Qs7eh6th6YmDpehmiHrIQwdPQ0TRkQG8q2skyzl0aDDHEbLGga
 R8Qs1z9wQ/Jg==
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="440068608"
Received: from unknown (HELO john.iind.intel.com) ([10.223.74.105])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 14 Aug 2020 02:46:09 -0700
From: Nischal Varide <nischal.varide@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 14 Aug 2020 08:19:45 +0530
Message-Id: <20200814024950.26830-3-nischal.varide@intel.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200814024950.26830-1-nischal.varide@intel.com>
References: <20200814024950.26830-1-nischal.varide@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 3/8] Critical KlockWork Error - Fixes -
 intel_fbdev.c - Possible NullPointerDereference1
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
Cc: Nischal Varide <nischal.varide@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index bd39eb6a21b8..ec4f82559fc1 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -595,9 +595,11 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 	 * been restored from swap. If the object is stolen however, it will be
 	 * full of whatever garbage was left in there.
 	 */
-	if (state == FBINFO_STATE_RUNNING &&
-	    intel_fb_obj(&ifbdev->fb->base)->stolen)
+	if (ifbdev->fb && intel_fb_obj(&ifbdev->fb->base)) {
+	    if (state == FBINFO_STATE_RUNNING &&
+		    intel_fb_obj(&ifbdev->fb->base)->stolen)
 		memset_io(info->screen_base, 0, info->screen_size);
+	}
 
 	drm_fb_helper_set_suspend(&ifbdev->helper, state);
 	console_unlock();
-- 
2.26.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
