Return-Path: <SRS0=3135=II=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D81DC433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Mar 2021 21:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F86264FAB
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Mar 2021 21:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F86264FAB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1F66E3AA;
	Wed, 10 Mar 2021 21:48:53 +0000 (UTC)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F104B6E16D
 for <intel-gfx@lists.freedesktop.org>; Wed, 10 Mar 2021 21:48:51 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id o1so14247029qta.13
 for <intel-gfx@lists.freedesktop.org>; Wed, 10 Mar 2021 13:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4M0snmyFx3hntMnqGoLjjCIdkC5MkJRcZ5aksVvCkcs=;
 b=A058PlQjS8f+i8KgiZvSCdvzp+QM7sPi1eemy7DArrEpjqqW1X/jOjfqIDfdbN8DTk
 YQ5+yx/C2ecIGPeAdNZntmf4uAaJTz9TbMlIBE/3ymyS5AMZMXRPKqqt0O8cDoDIV6NG
 T2xsBwgIYc3t9PIrJiZ5f9McK+bYNl0zs3Hhx8JkdU/xpsUdHqAfvGZdStUh+GOLTehp
 K4wi4VwavZxAJKsGpyeP0xrnGr/jpU5iZxreJDmLoYanGhWoAXG0YoiGUlSa5eeqbTqc
 QYxLajJs7U0c8ahKJ+yTRPoaVoDe7+MMpsMC1jMdHpBJNJeBWD22jfp48KmCBDR/B/rX
 rG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4M0snmyFx3hntMnqGoLjjCIdkC5MkJRcZ5aksVvCkcs=;
 b=iV2vq82hNHbZ8hPHlkToVY0Pli2jsm7pCXd8yYbmyeGbVIwLyxV9X2YDQEW2md5any
 MbiTboT+CBoQDiyNdylRPvbZsUQhPFKf4AEC1QmG6nYWcQAx+pEguUXb/gVSHw53nPXd
 QULnI/LiR5v1S1PaSpcT3yMAsAE8otiyO629n3nTsUvH7vV8kMgdjgMnd0I2iA4HbogQ
 Ogtv9ta1PxxjtUwaSs4pbKholmEsU5gGCmCC75dJix6LLSZM2e+DVBExCuU4icuWDwQm
 qCDVN50Vti/gmEpqqAMKWVf+yq3MyckAXPIxsu9e6OJrezptvfls/k6b3KVrRQ2UW6Y+
 pDXg==
X-Gm-Message-State: AOAM530EprJ1fhmNFPmIsIsEw6NCCW8mZ8UsaLTQVn0CjmOyJz+bek21
 /8JNJG1/4LVDdAI/DWqARWqf0yN0yRzf9A==
X-Google-Smtp-Source: ABdhPJyHY89MsBP5lyi4K4qxKFlHW+zevtUyAzkwMzPyPaWqSKFasX65M7E8uIZXZyDYY7CWqrUKBA==
X-Received: by 2002:ac8:1413:: with SMTP id k19mr4627017qtj.379.1615412930888; 
 Wed, 10 Mar 2021 13:48:50 -0800 (PST)
Received: from localhost ([172.58.155.143])
 by smtp.gmail.com with ESMTPSA id s19sm456801qks.130.2021.03.10.13.48.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Mar 2021 13:48:50 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Wed, 10 Mar 2021 16:47:56 -0500
Message-Id: <20210310214845.29021-1-sean@poorly.run>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/2] drm/i915/dp_link_training: Add newlines to
 debug messages
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
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch adds some newlines which are missing from debug messages.
This will prevent logs from being stacked up in dmesg.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 892d7db7d94f..ad02d493ec16 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -29,7 +29,7 @@ static void
 intel_dp_dump_link_status(const u8 link_status[DP_LINK_STATUS_SIZE])
 {
 
-	DRM_DEBUG_KMS("ln0_1:0x%x ln2_3:0x%x align:0x%x sink:0x%x adj_req0_1:0x%x adj_req2_3:0x%x",
+	DRM_DEBUG_KMS("ln0_1:0x%x ln2_3:0x%x align:0x%x sink:0x%x adj_req0_1:0x%x adj_req2_3:0x%x\n",
 		      link_status[0], link_status[1], link_status[2],
 		      link_status[3], link_status[4], link_status[5]);
 }
@@ -731,7 +731,7 @@ intel_dp_link_train_phy(struct intel_dp *intel_dp,
 
 out:
 	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
-		    "[CONNECTOR:%d:%s] Link Training %s at link rate = %d, lane count = %d, at %s",
+		    "[CONNECTOR:%d:%s] Link Training %s at link rate = %d, lane count = %d, at %s\n",
 		    intel_connector->base.base.id,
 		    intel_connector->base.name,
 		    ret ? "passed" : "failed",
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
