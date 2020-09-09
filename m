Return-Path: <SRS0=DO2q=CS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFCEC43461
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Sep 2020 09:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF1C2145D
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Sep 2020 09:18:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ll5oQR2u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FF1C2145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3654B6ED90;
	Wed,  9 Sep 2020 09:18:41 +0000 (UTC)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD3F6ED8F
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Sep 2020 09:18:40 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c18so2099126wrm.9
 for <intel-gfx@lists.freedesktop.org>; Wed, 09 Sep 2020 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RK9xZ0VugvitNWCHNnZgtPdpIu97bwsvFKF4AIlshdA=;
 b=ll5oQR2uoBDhsWjWSIEt3xMl+fnpIyK8ItpEKG2X9+lHKG8/1fKoVTF7ICHRZhcZ24
 Dtd8JK4Sft1uhWDLaBhY+yMN1qVhh2I10Mscxhch1oVVonoIcpJIrJl+2zRNzu08dp0n
 b0CRWU4dgF+Ko4QLiHkOjkNqITeClLMCyBM3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RK9xZ0VugvitNWCHNnZgtPdpIu97bwsvFKF4AIlshdA=;
 b=G4nTNHtG1bgXMP4Q2BE77QbBh3dS97JNNAzsNz1EHup723azI3IILNIERiARjBeymD
 LuJD5mPPThe4ZM/zm4lTheZtVJSHBXJF4eI6SLfaDvqQfwvZZJNKsUnFCyIAV5ZGPXSc
 aDBiPd3XJLDw169lhnZiVh2Bf1NLqqylghnd+sEmOVti7+ZvoF/mdxF9dbqu3Ilg/M4f
 k8MbY3jPMmv5yL+XY3wKSmJxw1PO072btJpR27N9KF/uejonenL5PYgl45Dc2g8RerLi
 7lKYsg4twk172zh4lGhBRkYV2bwrH6BE0RCK2v3oFkgKGpPGFougN9PnA3tHTR3JTDMX
 qqog==
X-Gm-Message-State: AOAM533j9hgAIrnRN4FiUOVNqAwPgevT1eyUL4H3C+VTvnlm9m6PHqmx
 d1JQA5KLL1330dn2wc1rc+OT4Q==
X-Google-Smtp-Source: ABdhPJxbCKRzh5HOdctF0iQ3ml3KGL/rMLOpe4DmVBLnWzl3s4Q19u9XnxkQZU1ORW/zR+Z8w10nOw==
X-Received: by 2002:adf:f890:: with SMTP id u16mr2732149wrp.183.1599643118833; 
 Wed, 09 Sep 2020 02:18:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c205sm2992024wmd.33.2020.09.09.02.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 02:18:37 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Wed,  9 Sep 2020 11:18:33 +0200
Message-Id: <20200909091833.440548-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-6-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-6-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/vkms: Use devm_drm_dev_alloc
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This means we also need to slightly restructure the exit code, so that
final cleanup of the drm_device is triggered by unregistering the
platform device. Note that devres is both clean up when the driver is
unbound (not the case for vkms, we don't bind), and also when unregistering
the device (very much the case for vkms). Therefore we can rely on devres
even though vkms isn't a proper platform device driver.

This also somewhat untangles the load code, since the drm and platform device
setup are no longer interleaved, but two distinct steps.

v2: use devres_open/release_group so we can use devm without real
hacks in the driver core or having to create an entire fake bus for
testing drivers. Might want to extract this into helpers eventually,
maybe as a mock_drm_dev_alloc or test_drm_dev_alloc.

v3: Only deref vkms_device after checking it (Melissa)

Cc: Melissa Wen <melissa.srw@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 56 ++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 83dd5567de8b..cb0b6230c22c 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -61,9 +61,6 @@ static void vkms_release(struct drm_device *dev)
 {
 	struct vkms_device *vkms = container_of(dev, struct vkms_device, drm);
 
-	platform_device_unregister(vkms->platform);
-	drm_atomic_helper_shutdown(&vkms->drm);
-	drm_mode_config_cleanup(&vkms->drm);
 	destroy_workqueue(vkms->output.composer_workq);
 }
 
@@ -144,30 +141,31 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 static int __init vkms_init(void)
 {
 	int ret;
+	struct platform_device *pdev;
 
-	vkms_device = kzalloc(sizeof(*vkms_device), GFP_KERNEL);
-	if (!vkms_device)
-		return -ENOMEM;
+	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
 
-	vkms_device->platform =
-		platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
-	if (IS_ERR(vkms_device->platform)) {
-		ret = PTR_ERR(vkms_device->platform);
-		goto out_free;
+	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
+		ret = -ENOMEM;
+		goto out_unregister;
 	}
 
-	ret = drm_dev_init(&vkms_device->drm, &vkms_driver,
-			   &vkms_device->platform->dev);
-	if (ret)
-		goto out_unregister;
-	drmm_add_final_kfree(&vkms_device->drm, vkms_device);
+	vkms_device = devm_drm_dev_alloc(&pdev->dev, &vkms_driver,
+					 struct vkms_device, drm);
+	if (IS_ERR(vkms_device)) {
+		ret = PTR_ERR(vkms_device);
+		goto out_devres;
+	}
+	vkms_device->platform = pdev;
 
 	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
 					   DMA_BIT_MASK(64));
 
 	if (ret) {
 		DRM_ERROR("Could not initialize DMA support\n");
-		goto out_put;
+		goto out_devres;
 	}
 
 	vkms_device->drm.irq_enabled = true;
@@ -175,39 +173,41 @@ static int __init vkms_init(void)
 	ret = drm_vblank_init(&vkms_device->drm, 1);
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
-		goto out_put;
+		goto out_devres;
 	}
 
 	ret = vkms_modeset_init(vkms_device);
 	if (ret)
-		goto out_put;
+		goto out_devres;
 
 	ret = drm_dev_register(&vkms_device->drm, 0);
 	if (ret)
-		goto out_put;
+		goto out_devres;
 
 	return 0;
 
-out_put:
-	drm_dev_put(&vkms_device->drm);
-	platform_device_unregister(vkms_device->platform);
-	return ret;
+out_devres:
+	devres_release_group(&pdev->dev, NULL);
 out_unregister:
-	platform_device_unregister(vkms_device->platform);
-out_free:
-	kfree(vkms_device);
+	platform_device_unregister(pdev);
 	return ret;
 }
 
 static void __exit vkms_exit(void)
 {
+	struct platform_device *pdev;
+
 	if (!vkms_device) {
 		DRM_INFO("vkms_device is NULL.\n");
 		return;
 	}
 
+	pdev = vkms_device->platform;
+
 	drm_dev_unregister(&vkms_device->drm);
-	drm_dev_put(&vkms_device->drm);
+	drm_atomic_helper_shutdown(&vkms_device->drm);
+	devres_release_group(&pdev->dev, NULL);
+	platform_device_unregister(pdev);
 }
 
 module_init(vkms_init);
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
