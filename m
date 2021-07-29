Return-Path: <SRS0=MAHO=MV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CA0C4320A
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 09:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35B4B61059
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 09:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35B4B61059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EE16ED04;
	Thu, 29 Jul 2021 09:39:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885596ED02;
 Thu, 29 Jul 2021 09:39:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E4EA61057;
 Thu, 29 Jul 2021 09:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627551559;
 bh=bDAURyhadET89IRU1m1b8zk8bNFLICeWHLbOoJ7WmYI=;
 h=From:To:Cc:Subject:Date:From;
 b=JiGwE20En/csSY5rJ9StWSWNMk4nXmxRvbwXOpwRCibBpFSieTZqVtDbSVMOq3aVz
 HJaCMMSPrtSkJioS4ITSdcoK6LF4SDnrdBUqfnTPNq85XB1Nwo9Z874djamC7d+7WW
 AtyMIPr5+D4q92ipsIJRkwgr02zhklDX4GgkMOsT4iRLG9X/ezE1yW/+jVykbIDbf7
 5r1JuKggLh/CQYUryjfjA8JBU3F6/27LUJ1fkC7YP/3UqohDhoVV6hVXz3WTNTQVgZ
 dEDA+4t/Skp30e8obvwLSchw289W3Tyyn6mMi4e9R3shob/TwLmFHVa1SFrL8JwBhM
 FMF6MQ6wLR+Xg==
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>
Date: Thu, 29 Jul 2021 12:39:10 +0300
Message-Id: <cover.1627551226.git.leonro@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH rdma-next v3 0/3] SG fix together with update to
 RDMA umem
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
Cc: Mustafa Ismail <mustafa.ismail@intel.com>, David Airlie <airlied@linux.ie>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 dri-devel@lists.freedesktop.org, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ariel Elior <aelior@marvell.com>, Michal Kalderon <mkalderon@marvell.com>,
 Roland Scheidegger <sroland@vmware.com>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Shiraz Saleem <shiraz.saleem@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Wenpeng Liang <liangwenpeng@huawei.com>,
 linux-kernel@vger.kernel.org, Weihang Li <liweihang@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maor Gottlieb <maorg@nvidia.com>,
 Zack Rusin <zackr@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Leon Romanovsky <leonro@nvidia.com>

Changelog:
v3:
 * Rewrote to new API suggestion
 * Split for more patches
v2: https://lore.kernel.org/lkml/cover.1626605893.git.leonro@nvidia.com
 * Changed implementation of first patch, based on our discussion with Christoph.
   https://lore.kernel.org/lkml/YNwaVTT0qmQdxaZz@infradead.org/
v1: https://lore.kernel.org/lkml/cover.1624955710.git.leonro@nvidia.com/
 * Fixed sg_page with a _dma_ API in the umem.c
v0: https://lore.kernel.org/lkml/cover.1624361199.git.leonro@nvidia.com


Maor Gottlieb (3):
  lib/scatterlist: Provide a dedicated function to support table append
  lib/scatterlist: Fix wrong update of orig_nents
  RDMA: Use the sg_table directly and remove the opencoded version from
    umem

 drivers/gpu/drm/drm_prime.c                 |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  14 +-
 drivers/infiniband/core/umem.c              |  56 +++---
 drivers/infiniband/core/umem_dmabuf.c       |   5 +-
 drivers/infiniband/hw/hns/hns_roce_db.c     |   4 +-
 drivers/infiniband/hw/irdma/verbs.c         |   2 +-
 drivers/infiniband/hw/mlx4/doorbell.c       |   3 +-
 drivers/infiniband/hw/mlx4/mr.c             |   4 +-
 drivers/infiniband/hw/mlx5/doorbell.c       |   3 +-
 drivers/infiniband/hw/mlx5/mr.c             |   3 +-
 drivers/infiniband/hw/qedr/verbs.c          |   2 +-
 drivers/infiniband/sw/rdmavt/mr.c           |   2 +-
 drivers/infiniband/sw/rxe/rxe_mr.c          |   2 +-
 include/linux/scatterlist.h                 |  54 +++++-
 include/rdma/ib_umem.h                      |  11 +-
 include/rdma/ib_verbs.h                     |  28 +++
 lib/scatterlist.c                           | 189 ++++++++++++--------
 tools/testing/scatterlist/main.c            |  38 ++--
 19 files changed, 275 insertions(+), 169 deletions(-)

-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
