Return-Path: <SRS0=a6yN=KP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E86EC433B4
	for <intel-gfx@archiver.kernel.org>; Thu, 20 May 2021 12:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A734E6105A
	for <intel-gfx@archiver.kernel.org>; Thu, 20 May 2021 12:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A734E6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B23B6F446;
	Thu, 20 May 2021 12:09:56 +0000 (UTC)
X-Greylist: delayed 915 seconds by postgrey-1.36 at gabe;
 Thu, 20 May 2021 08:22:54 UTC
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E272F6E1D6;
 Thu, 20 May 2021 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=WduaGUDQfJqAn/2CdZ
 sXiEbdQawNCPzecMhloNG8VdQ=; b=IANSKRb4bj0JWgUq2zAC+lh8bKmR2MagiJ
 m3gswqekqiF8x/lk5INrlon8iD2mXC1xFKfu9Amy98EtV8v8ebCt/Kd5W000KHRe
 lTpnXD/ePWN1BVQxmDeyE6t1B+nD+Mz0Y8+cEp+RMeRBlgZ8B9S5cfiGDmdhjM+T
 avXERQzlc=
Received: from wengjianfeng.ccdomain.com (unknown [218.17.89.92])
 by smtp12 (Coremail) with SMTP id EMCowADnJVKQGKZgPukHsQ--.30342S2;
 Thu, 20 May 2021 16:06:43 +0800 (CST)
From: samirweng1979 <samirweng1979@163.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, mika.kuoppala@linux.intel.com,
 sudeep.holla@arm.com, maarten.lankhorst@linux.intel.com
Date: Thu, 20 May 2021 16:06:46 +0800
Message-Id: <20210520080646.24132-1-samirweng1979@163.com>
X-Mailer: git-send-email 2.15.0.windows.1
X-CM-TRANSID: EMCowADnJVKQGKZgPukHsQ--.30342S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrW7Cw47CFWkAF1kKF4DArb_yoWkuFX_Ca
 yUAry3Ja42qFn0kFy7ArnxZFy2y3ZxCr48G3W2qry7try7Aw4qgwsYvry5WF13WF43t3yD
 Zas5ZasY9w13GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU50jg3UUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: pvdpx25zhqwiqzxzqiywtou0bp/1tbiHROYsVSIqyRUwQAAsh
X-Mailman-Approved-At: Thu, 20 May 2021 12:09:54 +0000
Subject: [Intel-gfx] [PATCH] drm/i915/gt: fix typo issue
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wengjianfeng <wengjianfeng@yulong.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: wengjianfeng <wengjianfeng@yulong.com>

change 'freqency' to 'frequency'.

Signed-off-by: wengjianfeng <wengjianfeng@yulong.com>
---
 drivers/gpu/drm/i915/gt/selftest_rps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_rps.c b/drivers/gpu/drm/i915/gt/selftest_rps.c
index 967641f..71e6658 100644
--- a/drivers/gpu/drm/i915/gt/selftest_rps.c
+++ b/drivers/gpu/drm/i915/gt/selftest_rps.c
@@ -606,7 +606,7 @@ int live_rps_frequency_cs(void *arg)
 	int err = 0;
 
 	/*
-	 * The premise is that the GPU does change freqency at our behest.
+	 * The premise is that the GPU does change frequency at our behest.
 	 * Let's check there is a correspondence between the requested
 	 * frequency, the actual frequency, and the observed clock rate.
 	 */
@@ -747,7 +747,7 @@ int live_rps_frequency_srm(void *arg)
 	int err = 0;
 
 	/*
-	 * The premise is that the GPU does change freqency at our behest.
+	 * The premise is that the GPU does change frequency at our behest.
 	 * Let's check there is a correspondence between the requested
 	 * frequency, the actual frequency, and the observed clock rate.
 	 */
-- 
1.9.1


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
