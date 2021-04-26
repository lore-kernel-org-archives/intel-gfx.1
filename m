Return-Path: <SRS0=0znn=JX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DCFC433ED
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Apr 2021 09:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 884466103E
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Apr 2021 09:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 884466103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5316E6E183;
	Mon, 26 Apr 2021 09:40:19 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F5C89F89;
 Mon, 26 Apr 2021 09:40:18 +0000 (UTC)
IronPort-SDR: YiF7dCb5DMW7DMYpv+Mp7egQZaZI7o+ivAgehA6/YBm+0yyA9WBabU4X+pFMQkYEgtjbtf4QEm
 l1E6IlBvNgjA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="196366800"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="196366800"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 02:40:16 -0700
IronPort-SDR: MAmvFko1wU8JModOpSN9GNXI1sqWkOd68r8Ph28jeys7/kmeSgYLaXQYIJ28NexZagbc10Wzap
 hBYnJENZAlxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="465054301"
Received: from debian-skl.sh.intel.com ([10.239.160.37])
 by orsmga001.jf.intel.com with ESMTP; 26 Apr 2021 02:40:14 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 26 Apr 2021 17:41:43 +0800
Message-Id: <20210426094143.4031527-2-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210426094143.4031527-1-zhenyuw@linux.intel.com>
References: <20210426094143.4031527-1-zhenyuw@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/2] Revert "vfio/gvt: Make DRM_I915_GVT depend
 on VFIO_MDEV"
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
Cc: Arnd Bergmann <arnd@kernel.org>, intel-gvt-dev@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This reverts commit 07e543f4f9d116d6b4240644191dee6388ef4a85.

With all mdev handing moved to kvmgt module, only kvmgt should depend
on VFIO_MDEV. So revert this one.

Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 8f15bfb5faac..93f4d059fc89 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -102,7 +102,6 @@ config DRM_I915_GVT
 	bool "Enable Intel GVT-g graphics virtualization host support"
 	depends on DRM_I915
 	depends on 64BIT
-	depends on VFIO_MDEV
 	default n
 	help
 	  Choose this option if you want to enable Intel GVT-g graphics
-- 
2.31.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
