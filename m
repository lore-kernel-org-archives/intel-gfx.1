Return-Path: <SRS0=aPMN=E5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AC0C2D0E4
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2020 17:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B1EC206B2
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2020 17:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B1EC206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB89D8928D;
	Mon, 23 Nov 2020 17:59:41 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D96D8928D
 for <intel-gfx@lists.freedesktop.org>; Mon, 23 Nov 2020 17:59:40 +0000 (UTC)
IronPort-SDR: oIHIC3gRp2xVXV63KT9FAwuBVn/bcyu2t1tXYKzfG0xtlp3MxIJCu+Tqm4aOi/MMQULla3kDTB
 FjPYAk5rVC+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="256521817"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="256521817"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 09:59:40 -0800
IronPort-SDR: Q2doGdMBBD/o9VKKKs0arlrEN93GyRQTmyoSg6Jwlob60iTvAgTDZCKOrkG4SEAru6Wn69QAWg
 kGXqHNBGNr7g==
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="546504782"
Received: from suygunge-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.40.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 09:59:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2020 19:59:20 +0200
Message-Id: <cover.1606153547.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/9] relay: cleanup and const callbacks, take 2
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 linux-wireless@vger.kernel.org,
 QCA ath9k Development <ath9k-devel@qca.qualcomm.com>,
 ath10k@lists.infradead.org, Christoph Hellwig <hch@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, ath11k@lists.infradead.org,
 Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This is v2 of [1], with a number of cleanups added first based on
Christoph's feedback, making the actual constness patch much smaller and
cleaner.

I don't know who actually maintains relay, it's not in MAINTAINERS -
Cc'd Andrew just in case.

I'd think it would be simplest to queue patches 5-9 via whichever tree
the relay patches get merged. They're all one-liners so neglible
conflict potential.

BR,
Jani.


[1] http://lore.kernel.org/r/20201118165320.26829-1-jani.nikula@intel.com


Cc: linux-block@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>
Cc: ath11k@lists.infradead.org
Cc: ath10k@lists.infradead.org
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org
Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>


Jani Nikula (9):
  relay: remove unused buf_mapped and buf_unmapped callbacks
  relay: require non-NULL callbacks in relay_open()
  relay: make create_buf_file and remove_buf_file callbacks mandatory
  relay: allow the use of const callback structs
  drm/i915: make relay callbacks const
  ath10k: make relay callbacks const
  ath11k: make relay callbacks const
  ath9k: make relay callbacks const
  blktrace: make relay callbacks const

 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |   2 +-
 drivers/net/wireless/ath/ath10k/spectral.c    |   2 +-
 drivers/net/wireless/ath/ath11k/spectral.c    |   2 +-
 .../net/wireless/ath/ath9k/common-spectral.c  |   2 +-
 include/linux/relay.h                         |  29 ++---
 kernel/relay.c                                | 107 +++---------------
 kernel/trace/blktrace.c                       |   2 +-
 7 files changed, 26 insertions(+), 120 deletions(-)

-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
