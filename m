Return-Path: <SRS0=0qc7=C7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CEAC2D0E2
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2020 08:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0681120739
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2020 08:40:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uL/Dk1Q2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0681120739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839F06E83B;
	Tue, 22 Sep 2020 08:40:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6F06E1E2;
 Tue, 22 Sep 2020 08:40:07 +0000 (UTC)
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F07B23A34;
 Tue, 22 Sep 2020 08:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600764006;
 bh=tvhij8pgV6SUhbNJ0YXjdpggUwFiSRg+69/kr1GP5xo=;
 h=From:To:Cc:Subject:Date:From;
 b=uL/Dk1Q2J4t7IB3gxjpObZyP0l/Mume8siqJcyeS/5XNP+X6qcEAh2HRzM63kgEcU
 u4TPaoBWl1+IBziVD0Fbo9sj0AMA/qnQ8Xz/EF6yWmm+1X9PoRK36HxyRu3uF7gR2k
 E9AdqrRipCUcj2cVmWDTn9VZ7SC5UcEplhLkTTQo=
From: Leon Romanovsky <leon@kernel.org>
To: 
Date: Tue, 22 Sep 2020 11:39:56 +0300
Message-Id: <20200922083958.2150803-1-leon@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH rdma-next v3 0/2] Dynamicaly allocate SG table
 from the pages
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
Cc: David Airlie <airlied@linux.ie>, Maor Gottlieb <maorg@nvidia.com>,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org, Leon Romanovsky <leonro@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Leon Romanovsky <leonro@nvidia.com>

Changelog:
v3:
 * Squashed Christopher's suggestion to avoid introduced new API, but extend existing one.
v2: https://lore.kernel.org/linux-rdma/20200916140726.839377-1-leon@kernel.org
 * Fixed indentations and comments
 * Deleted sg_alloc_next()
 * Squashed lib/scatterlist patches into one
v1: https://lore.kernel.org/lkml/20200910134259.1304543-1-leon@kernel.org
 * Changed _sg_chain to be __sg_chain
 * Added dependency on ARCH_NO_SG_CHAIN
 * Removed struct sg_append
v0:
 * https://lore.kernel.org/lkml/20200903121853.1145976-1-leon@kernel.org

--------------------------------------------------------------------------
From Maor:

This series extends __sg_alloc_table_from_pages to allow chaining of
new pages to already initialized SG table.

This allows drivers to utilize the optimization of merging contiguous
pages without a need to pre allocate all the pages and hold them in
a very large temporary buffer prior to the call to SG table initialization.

The second patch changes the Infiniband driver to use the new API. It
removes duplicate functionality from the code and benefits the
optimization of allocating dynamic SG table from pages.

In huge pages system of 2MB page size, without this change, the SG table
would contain x512 SG entries.
E.g. for 100GB memory registration:

             Number of entries      Size
    Before        26214400          600.0MB
    After            51200            1.2MB

Thanks

Maor Gottlieb (2):
  lib/scatterlist: Add support in dynamic allocation of SG table from
    pages
  RDMA/umem: Move to allocate SG table from pages

 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  15 +-
 drivers/infiniband/core/umem.c              |  92 ++----------
 include/linux/scatterlist.h                 |  43 +++---
 lib/scatterlist.c                           | 158 +++++++++++++++-----
 lib/sg_pool.c                               |   3 +-
 tools/testing/scatterlist/main.c            |   9 +-
 7 files changed, 175 insertions(+), 157 deletions(-)

--
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
