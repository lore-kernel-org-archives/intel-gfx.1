Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A58C3ABCB
	for <intel-gfx@archiver.kernel.org>; Mon, 12 May 2025 15:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914A510E42E;
	Mon, 12 May 2025 15:33:48 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E2710E36D;
 Mon, 12 May 2025 15:33:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_on_linux-next_=28next-202?=
 =?utf-8?q?50507=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 12 May 2025 15:33:47 -0000
Message-ID: <174706402741.69672.9421634437532412492@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <SJ1PR11MB61292CE72D7BE06B8810021CB997A@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB61292CE72D7BE06B8810021CB997A@SJ1PR11MB6129.namprd11.prod.outlook.com>
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: on linux-next (next-20250507)
URL   : https://patchwork.freedesktop.org/series/148880/
State : failure

== Summary ==

Error: make failed
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC      drivers/iommu/dma-iommu.o
drivers/iommu/dma-iommu.c: In function ‘fq_ring_free_locked’:
drivers/iommu/dma-iommu.c:158:25: error: implicit declaration of function ‘IOMMU_PAGES_LIST_INIT’ [-Werror=implicit-function-declaration]
  158 |                         IOMMU_PAGES_LIST_INIT(fq->entries[idx].freelist);
      |                         ^~~~~~~~~~~~~~~~~~~~~
drivers/iommu/dma-iommu.c:158:25: error: incompatible types when assigning to type ‘struct list_head’ from type ‘int’
cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:203: drivers/iommu/dma-iommu.o] Error 1
make[3]: *** [scripts/Makefile.build:461: drivers/iommu] Error 2
make[2]: *** [scripts/Makefile.build:461: drivers] Error 2
make[1]: *** [/home/kbuild/kernel/Makefile:2004: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Build failed, no error log produced


