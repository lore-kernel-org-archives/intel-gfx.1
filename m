Return-Path: <SRS0=foSz=LS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61256C48BDF
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 07:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F905613E3
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 07:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F905613E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A916EA44;
	Thu, 24 Jun 2021 07:51:03 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 531D16E9FB;
 Thu, 24 Jun 2021 07:51:02 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 47F6FA8830;
 Thu, 24 Jun 2021 07:51:02 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Date: Thu, 24 Jun 2021 07:51:02 -0000
Message-ID: <162452106226.1850.14535216608422835765@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210624072916.27703-1-tzimmermann@suse.de>
In-Reply-To: <20210624072916.27703-1-tzimmermann@suse.de>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Deprecate_struct_drm=5Fdevice=2Eirq=5Fenabled?=
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
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: Deprecate struct drm_device.irq_enabled
URL   : https://patchwork.freedesktop.org/series/91845/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
7e81b48893e1 drm/amdgpu: Track IRQ state in local device state
5a2f7ec2c996 drm/hibmc: Call drm_irq_uninstall() unconditionally
d0d52ba63904 drm/radeon: Track IRQ state in local device state
0f1cc7795ded drm: Don't test for IRQ support in VBLANK ioctls
-:76: CHECK:BRACES: Unbalanced braces around else statement
#76: FILE: drivers/gpu/drm/drm_vblank.c:1755:
+	} else /* if DRIVER_MODESET */

total: 0 errors, 0 warnings, 1 checks, 65 lines checked
ae9d335be636 drm/armada: Don't set struct drm_device.irq_enabled
d612b0fe70b3 drm/i915: Track IRQ state in local device state
5c2c66c6eab0 drm/komeda: Don't set struct drm_device.irq_enabled
e95bfbbca4c8 drm/malidp: Don't set struct drm_device.irq_enabled
dc686169f377 drm/exynos: Don't set struct drm_device.irq_enabled
3c52f688ee13 drm/kirin: Don't set struct drm_device.irq_enabled
cbaab88d0e2f drm/imx: Don't set struct drm_device.irq_enabled
4a88efe9db38 drm/imx/dcss: Don't set struct drm_device.irq_enabled
64f52f7b8a3e drm/mediatek: Don't set struct drm_device.irq_enabled
7b4f8ee0acba drm/nouveau: Don't set struct drm_device.irq_enabled
72d4c49bb4dc drm/omapdrm: Track IRQ state in local device state
7af8e5991a16 drm/rcar-du: Don't set struct drm_device.irq_enabled
c0c1d7a37c87 drm/rockchip: Don't set struct drm_device.irq_enabled
3a205c191fa2 drm/sti: Don't set struct drm_device.irq_enabled
8871c398118c drm/stm: Don't set struct drm_device.irq_enabled
9301579c5ef1 drm/sun4i: Don't set struct drm_device.irq_enabled
1c8a70ef5545 drm/tegra: Don't set struct drm_device.irq_enabled
46ddcc26dbc7 drm/tidss: Don't use struct drm_device.irq_enabled
e24755e0074a drm/vc4: Don't set struct drm_device.irq_enabled
e4c301b14b3a drm/vkms: Don't set struct drm_device.irq_enabled
fcfbcb2e09b0 drm/vmwgfx: Don't set struct drm_device.irq_enabled
6373373903c7 drm/xlnx: Don't set struct drm_device.irq_enabled
d42ce5ef965c drm/zte: Don't set struct drm_device.irq_enabled


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
