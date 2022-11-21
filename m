Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A033C4332F
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Nov 2022 14:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9501310E2E2;
	Mon, 21 Nov 2022 14:57:54 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCC410E2E1;
 Mon, 21 Nov 2022 14:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669042669; x=1700578669;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VtwzRDaQISX+LIkXZ+R00ND7Bw2+muFxCDHll16yVQ8=;
 b=diypJfq8sbwCNFNx5KnMx9IpOy8wDx9yZQ0WqkQpv9llH+0dS1PCjDjG
 Uqmog2XrXII9o0XMWMzGUXA9lHnnqiqp/9ClqhwOt+a8gRzR7RyFrBNya
 cvrzSkbKC8oq+5oJLtI0mVe3wQl3yVGuaUYNQpbc72YjE+E3uIAN79ore
 5USkWNtxXpM7/DQabFqVMUW6iEvRVccoAcAfgIBMMVxRD+UO28Urucpz5
 Gt8iMtXYK8rwFi7YPzv4A5W+SLx7CAF1lB8VKrbuPpFiVk9hNoDuDNS8L
 nAegnwTTDFoghlmcNUQJspmvF4Ff2k1kxcQpwTslF7mCVIjjmkhO3SSkk w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="399861719"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="399861719"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 06:57:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="765985028"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="765985028"
Received: from jkrzyszt-mobl1.ger.corp.intel.com (HELO
 jkrzyszt-mobl1.intranet) ([10.213.16.21])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 06:57:36 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Mon, 21 Nov 2022 15:56:53 +0100
Message-Id: <20221121145655.75141-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v3 0/2] drm/i915: Fix timeout handling when
 retiring requests
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
Cc: Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Fixes for issues discovered via code review while working on
https://gitlab.freedesktop.org/drm/intel/issues/7349.

v3:
PATCH 1: don't fail on any error passed back via remaining_timeout,
PATCH 2: use conditional expression, more compact but also better
	 reflecting intention standing behind the change.

v2:
PATCH 1: fix the issue on the caller side, not the provider,
	 reword commit message and description.
PATCH 2: move the added lines down so flush_submission() is not affected,
	 reword commit message and description.
PATCH 3: drop -- controversial, not needed.

Janusz Krzysztofik (2):
  drm/i915: Fix negative value passed as remaining time
  drm/i915: Never return 0 if not all requests retired

 drivers/gpu/drm/i915/gt/intel_gt.c          | 9 +++++++--
 drivers/gpu/drm/i915/gt/intel_gt_requests.c | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.25.1

