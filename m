Return-Path: <SRS0=kkqM=KG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4852C433ED
	for <intel-gfx@archiver.kernel.org>; Tue, 11 May 2021 08:31:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 809A761370
	for <intel-gfx@archiver.kernel.org>; Tue, 11 May 2021 08:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 809A761370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A4A6EA02;
	Tue, 11 May 2021 08:31:35 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A6E6E9FF;
 Tue, 11 May 2021 08:31:33 +0000 (UTC)
IronPort-SDR: DyrGVN8SqLtpi3VnPnw1pXNcOfHexmPzshjDGabw83pYJcOJRTR7GUgS3J0GT7AQK9dk1L+XDK
 ptkrKq7jg/5w==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="284875143"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="284875143"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:31:33 -0700
IronPort-SDR: UixSdcZJa4QV/0/jhh2zleKHHHl3rxr9X6GYODaJ6QWPGb7RtpPBpzrgqIpl2rwkFH8VyI/0OR
 K7WjQXmKOUrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536895420"
Received: from debian-skl.sh.intel.com ([10.239.160.37])
 by fmsmga001.fm.intel.com with ESMTP; 11 May 2021 01:31:32 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 11 May 2021 16:33:32 +0800
Message-Id: <20210511083332.1740601-4-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210511083332.1740601-1-zhenyuw@linux.intel.com>
References: <20210511083332.1740601-1-zhenyuw@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 3/3] Revert "vfio/gvt: Make DRM_I915_GVT depend
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
Cc: intel-gvt-dev@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This reverts commit 07e543f4f9d116d6b4240644191dee6388ef4a85.

As I915_GVT dependency issue is resolved, revert this.

Cc: Jason Gunthorpe <jgg@nvidia.com>
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
