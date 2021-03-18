Return-Path: <SRS0=MMuT=IQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69468C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Mar 2021 20:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2146864EF9
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Mar 2021 20:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2146864EF9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5926E96E;
	Thu, 18 Mar 2021 20:22:29 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688076E96E
 for <intel-gfx@lists.freedesktop.org>; Thu, 18 Mar 2021 20:22:28 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id o19so8279542edc.3
 for <intel-gfx@lists.freedesktop.org>; Thu, 18 Mar 2021 13:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EhVimMALqdLCb9q+6HXj4osKqTlnaXqo/dphUQ9VXRc=;
 b=jUn0hY3XtjuzOOoBgNI7qU4Cc3d1nozDP4KoLBqU4iaj5F6lTaguMjkjZj7yiTYFni
 hGM0hTzFFt4G0teJ+5xj3gPDUoKj/mV04AyIo6ymzbwBCVtZuhgiszRI51CWLfaFrcaX
 iVI24tfdAz2tkB9iUKgXmgT9bsb1uAZu7KWW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EhVimMALqdLCb9q+6HXj4osKqTlnaXqo/dphUQ9VXRc=;
 b=dpehXPzKhI/IMuCsWW5aXNf0SIGARUJpHL0q6tByzA2uZG5V6RH6r4SrkCngGZDkJF
 J6ar2sn9BDgRAll2GzlFswdMLYBaPQeUgIKqh/z6K0ImxZskTR1M28CM0IHSxfRE8EnN
 ZHDcjhA0JItkBRJ8g7HwktzMHew3uoMlh8wDeUgGnyt+lLq613ppwR6X83REHR+TNqWE
 Xyl1LUzLr9yGetdcBycwO1BuQPgeLqDwnDrZXBu+Yxrhlmay9B2RCzJEL0foDDH5d9wJ
 DOw55nM3CZO0fm/+coSlvxSRHyI5Mhog2bUFy41uTrmj6hGyPxX6UPWUDkqH5sxA0UhO
 nZ0g==
X-Gm-Message-State: AOAM532m0Fz0QudnArUqDEU76rydqoKARrMt8XZukTGTUaj5fS+sOtkS
 Ia8da1ceBxBujhEWYPJS6RRvYQ==
X-Google-Smtp-Source: ABdhPJwO0rOSLqvM/mAox+S6mUlIKqV36/IOiOwlR/BvVoFJMym0GKGh1hs60quhs1LlVbxTbjydeg==
X-Received: by 2002:aa7:dc0b:: with SMTP id b11mr5946277edu.124.1616098947106; 
 Thu, 18 Mar 2021 13:22:27 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
 by smtp.gmail.com with ESMTPSA id e16sm2481120ejc.63.2021.03.18.13.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 13:22:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
To: trivial@kernel.org
Date: Thu, 18 Mar 2021 21:22:18 +0100
Message-Id: <20210318202223.164873-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210318202223.164873-1-ribalda@chromium.org>
References: <20210318202223.164873-1-ribalda@chromium.org>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 4/9] drm/i915/error: Fix typo "accesible"
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
Cc: intel-gfx@lists.freedesktop.org, Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Trivial fix.

Cc: intel-gfx@lists.freedesktop.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index f962693404b7..ea7d0398fb05 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1503,7 +1503,7 @@ gt_record_uc(struct intel_gt_coredump *gt,
 	memcpy(&error_uc->huc_fw, &uc->huc.fw, sizeof(uc->huc.fw));
 
 	/* Non-default firmware paths will be specified by the modparam.
-	 * As modparams are generally accesible from the userspace make
+	 * As modparams are generally accessible from the userspace make
 	 * explicit copies of the firmware paths.
 	 */
 	error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ALLOW_FAIL);
-- 
2.31.0.rc2.261.g7f71774620-goog

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
