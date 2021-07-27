Return-Path: <SRS0=MV7T=MT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B6FC432BE
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Jul 2021 11:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0BAA61263
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Jul 2021 11:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0BAA61263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3CB6E4CA;
	Tue, 27 Jul 2021 11:15:04 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60C26E450;
 Tue, 27 Jul 2021 11:15:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F184A619E7;
 Tue, 27 Jul 2021 11:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627384502;
 bh=SHNmjykDf+/IHH82HQeFn3YwhgbHyD3jCgQMSP69lOI=;
 h=From:To:Cc:Subject:Date:From;
 b=FcemJGhQdYRVe3m7zefdJe3mE01yPbdu6/pSiqD+oMEaq5E1aNeu92z8xkuJt2mn4
 BYrGadW6e+eWvW2kBIh0nV00K9vCimI23lU7GPwJoc86AlFhfdqrJrBawLDdXMUBY6
 8bPr9ULDjldPEZgZX+hz4YhIpl2+heI74hSgOQ2aGJ2JNrstig/1TVbN6027Hqc+Lg
 rTCNC2q/mQ9zEjxjNXxe9c+7eUUt9sToLS5lxW8Xc1BNL+U5d0nAyAPmy7WhXkB9yw
 Y7iVEA/EqL3qROZR3dzxFFFhZ6AgNjvub2Mp3ONnpaskP+RXXtzaT05rSWI+wnvu5J
 nHoNaG+LYge9g==
From: Mark Brown <broonie@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Date: Tue, 27 Jul 2021 12:14:47 +0100
Message-Id: <20210727111448.1443-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] linux-next: manual merge of the drm-misc tree with the
 drm-next tree
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Zack Rusin <zackr@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h

between commit:

  ebc9ac7c3dfe ("drm/vmwgfx: Update device headers")

from the drm-next tree and commit:

  be4f77ac6884 ("drm/vmwgfx: Cleanup fifo mmio handling")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 356f82c26f59,5652d982b1ce..000000000000
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
