Return-Path: <SRS0=WhEZ=PV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150D5C433EF
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Nov 2021 07:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D30D960F02
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Nov 2021 07:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D30D960F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6056FABA;
	Tue,  2 Nov 2021 07:06:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74FE6FAB8;
 Tue,  2 Nov 2021 07:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Pfpk1vpyS/9vxmYclFpbAHoXF3sQPSIFV4EVEVBOemA=; b=1YopZtYHfI7Tts5qs1hxMQw1At
 NQcHPvsu6MYq76qpUkTvRkAQdH/AeOD8s9wgupr6JPAsbj0ULC2E3iBi0L2osba8OaZ/u11yJkLoj
 zyIR8TJy3aP3lSmjKgZEWfgsp3s0kBiStTQzFZsEqQx65sH6/FWKfwmzh66c6i68/alVLJziiG5Iy
 ECj4voEEG9MhTJcvYzvtJj5DqxBqRbYFIgs2JRkpQFifsglc/StCcL+lZCoztG/4tIJemcjCI38A4
 /niVa0ZYqZx5HBPnqtAYcxbfG6bhTXyWyvFscc5xQdbOuGxVpftDDUVB2Z01skj/uwUNt9+DCRdDa
 625dwqKQ==;
Received: from 213-225-15-89.nat.highway.a1.net ([213.225.15.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhnsR-000i2p-O2; Tue, 02 Nov 2021 07:06:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Date: Tue,  2 Nov 2021 08:05:37 +0100
Message-Id: <20211102070601.155501-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211102070601.155501-1-hch@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Intel-gfx] [PATCH 05/29] drm/i915/gvt: rename intel_vgpu_ops to
 intel_vgpu_mdev_ops
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Free the intel_vgpu_ops symbol name for something that fits better.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 904f9a31bd3a9..80809866cf743 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1748,7 +1748,7 @@ static const struct attribute_group *intel_vgpu_groups[] = {
 	NULL,
 };
 
-static struct mdev_parent_ops intel_vgpu_ops = {
+static struct mdev_parent_ops intel_vgpu_mdev_ops = {
 	.mdev_attr_groups       = intel_vgpu_groups,
 	.create			= intel_vgpu_create,
 	.remove			= intel_vgpu_remove,
@@ -1771,9 +1771,9 @@ static int kvmgt_host_init(struct device *dev, void *gvt, const void *ops)
 		return ret;
 
 	intel_gvt_ops = ops;
-	intel_vgpu_ops.supported_type_groups = gvt_vgpu_type_groups;
+	intel_vgpu_mdev_ops.supported_type_groups = gvt_vgpu_type_groups;
 
-	ret = mdev_register_device(dev, &intel_vgpu_ops);
+	ret = mdev_register_device(dev, &intel_vgpu_mdev_ops);
 	if (ret)
 		intel_gvt_cleanup_vgpu_type_groups((struct intel_gvt *)gvt);
 
-- 
2.30.2

