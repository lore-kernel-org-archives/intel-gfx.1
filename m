Return-Path: <SRS0=YxzO=MH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B142DC07E96
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Jul 2021 13:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E1A8613C4
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Jul 2021 13:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E1A8613C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817176E850;
	Thu, 15 Jul 2021 13:17:54 +0000 (UTC)
X-Greylist: delayed 389 seconds by postgrey-1.36 at gabe;
 Wed, 14 Jul 2021 20:41:56 UTC
Received: from st43p00im-zteg10063401.me.com (st43p00im-zteg10063401.me.com
 [17.58.63.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65DA6E4FE
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Jul 2021 20:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1626294927;
 bh=7DwUPoV9IztFfSwlvH+mW8SDazur3k/YH6VaR6m3ZKk=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=zOJ1t7Ok2BF0GgxbtBr9hUbdB8ijS9AdjtyTaeP8NP6/xBm2Q56USCMBL2rXWTWTv
 Aq2h0iPfL4TyB3PKE4sGf55CC696mTXWhAZWNjxFrfCOqXNBtJ+TwYj1rn2ij0XrS5
 ZklsGn7aIT6W+G+fXAYyYV4OatpJlh5B1DDu6OLTMIyOc8OTY0hOrWS68cLu8kWnbA
 qpQPk+E8GCW3bcIyjRQ91dUINgzTbYioZkIJ/8loOC5f3a6P9OeC7SUemuHOfqyT6W
 yyF3WFChg6T3iJz5umuPRRbOEdrh9ohJ9bsA3yaeIhAUP8BS9RfURaSCFA6L55lso6
 O3O+tfh84MFrA==
Received: from localhost.localdomain (dyn-72-33-2-114.uwnet.wisc.edu
 [72.33.2.114])
 by st43p00im-zteg10063401.me.com (Postfix) with ESMTPSA id E8F874A047D;
 Wed, 14 Jul 2021 20:35:25 +0000 (UTC)
From: Marco Kurzynski <marcokurzynski@icloud.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 14 Jul 2021 15:33:25 -0500
Message-Id: <20210714203324.146783-1-marcokurzynski@icloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-14_10:2021-07-14,
 2021-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2107140122
X-Mailman-Approved-At: Thu, 15 Jul 2021 13:17:53 +0000
Subject: [Intel-gfx] [PATCH] drivers/gpu/drm/i915/display: remove
 boilerplate code using LOCK_ALL macros
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Marco Kurzynski <marcokurzynski@icloud.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Replaced the boilerplate code for intel_display.c with
DRM_MODESET_LOCK_ALL macros per the TODO in gpu

(I apologize if I did something wrong, this is my first contribution of
hopefully many, so excited!!!)

Signed-off-by: Marco Kurzynski <marcokurzynski@icloud.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 3bad4e00f7be..4a46d63b4d39 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -13307,22 +13307,12 @@ void intel_display_resume(struct drm_device *dev)
 	if (state)
 		state->acquire_ctx = &ctx;
 
-	drm_modeset_acquire_init(&ctx, 0);
-
-	while (1) {
-		ret = drm_modeset_lock_all_ctx(dev, &ctx);
-		if (ret != -EDEADLK)
-			break;
-
-		drm_modeset_backoff(&ctx);
-	}
-
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	if (!ret)
 		ret = __intel_display_resume(dev, state, &ctx);
 
 	intel_enable_ipc(dev_priv);
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	if (ret)
 		drm_err(&dev_priv->drm,
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
