Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7879C4332F
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Nov 2022 15:27:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECD810E304;
	Mon, 21 Nov 2022 15:26:33 +0000 (UTC)
X-Greylist: delayed 331 seconds by postgrey-1.36 at gabe;
 Mon, 21 Nov 2022 09:13:12 UTC
Received: from mail.nfschina.com (unknown [124.16.136.209])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8274E10E180;
 Mon, 21 Nov 2022 09:13:12 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id 9C11D1E80DA8;
 Mon, 21 Nov 2022 17:04:02 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41bB4o8SJ2qE; Mon, 21 Nov 2022 17:03:59 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
 (Authenticated sender: kunyu@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id B7B7F1E80DA4;
 Mon, 21 Nov 2022 17:03:58 +0800 (CST)
From: Li kunyu <kunyu@nfschina.com>
To: zhenyuw@linux.intel.com, zhi.a.wang@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Date: Mon, 21 Nov 2022 17:07:16 +0800
Message-Id: <20221121090716.35899-1-kunyu@nfschina.com>
X-Mailer: git-send-email 2.18.2
X-Mailman-Approved-At: Mon, 21 Nov 2022 15:26:23 +0000
Subject: [Intel-gfx] [PATCH] gpu: vgpu: delete a semicolon
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
Cc: intel-gfx@lists.freedesktop.org, Li kunyu <kunyu@nfschina.com>,
 intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Remove extra semicolons at the end of statements to make them look
cleaner.

Signed-off-by: Li kunyu <kunyu@nfschina.com>
---
 drivers/gpu/drm/i915/gvt/vgpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 56c71474008a..5ccb04e26e6d 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -325,7 +325,7 @@ int intel_gvt_create_vgpu(struct intel_vgpu *vgpu,
 	ret = idr_alloc(&gvt->vgpu_idr, vgpu, IDLE_VGPU_IDR + 1, GVT_MAX_VGPU,
 		GFP_KERNEL);
 	if (ret < 0)
-		goto out_unlock;;
+		goto out_unlock;
 
 	vgpu->id = ret;
 	vgpu->sched_ctl.weight = conf->weight;
-- 
2.18.2

