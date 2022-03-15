Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284EAC4332F
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Mar 2022 18:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5423210E46B;
	Tue, 15 Mar 2022 18:05:09 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D6F10E43C
 for <intel-gfx@lists.freedesktop.org>; Tue, 15 Mar 2022 18:05:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id D6ABA1F4304E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647367506;
 bh=kXTYG5aGkcs6nVdtfAQDZD56ESW8PjzQnalGZ9NBj60=;
 h=From:To:Cc:Subject:Date:From;
 b=Al7+fCIf/hHURzxNQly8/duw+0KVaIlYYSI+D+yYabdaQWSeAI1NJREsLI5ozb6d3
 7vCLQ3vPOah4HQf6qV+Gsd2jIMFlx96VTZ4dZBIqXItooLRqVI5EkNfCsCpw4W4pFn
 uaeh3Kc3DBnJPWvhEqs3R1MuLXyXA5vUz7clhwudiuSyLy6mRUPxWnpyMFprzJHRga
 Rm+ZmKm7ISsAtnkruAW3zm/sqn7F/L2c+yGKaUu0VoWqIFs8X8O+H3mJiBCHuaJvaS
 x0+trWDRV7ZYdconoPTYaeaW/NOhybHeryxJT/uJsu62fgPQs7W9TVTBdxTSY8bGfS
 fYKcWq/w+zkpw==
From: Robert Beckett <bob.beckett@collabora.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 15 Mar 2022 18:04:37 +0000
Message-Id: <20220315180444.3327283-1-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [RFC PATCH 0/7] drm/i915: ttm for stolen
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Refactor stolen gem backend to use ttm.

While this series is finished off to handle CI issues, I would
appreciate a design review.
In particulare any opinions on the following would be appreciated:

1. display fbc code using gem objects instead of drm_mm_node. The intent
is rely on memory region as interface, instead of relying on knowledge
of internals. This way ttm can be used in place of original stolen
region without issue.

2. checking if a region has anything alloceted within a range. Instead
of relying on internal access to the stolen region's drm_mm, add an
interface to check if the range is busy that can work with any backend
if implemetned.

3. Instead of region busy checking which is currently only used in
testing, would we prefer a more general interface that could potentially
be used for other infrastructure? e.g. for_each with callback over
each resource/buffer within the range.

Robert Beckett (7):
  drm/i915: instantiate ttm ranger manager for stolen memory
  drm/i915: add ability to create memory region object in place
  drm/i915: use gem objects to track stolen nodes
  drm/i915: stolen memory use ttm backend
  drm/ttm: add range busy check for range manager
  drm/i915: add range busy check for ttm region
  drm/i915: cleanup old stolen state

 drivers/gpu/drm/i915/display/intel_fbc.c   |  76 +++--
 drivers/gpu/drm/i915/gem/i915_gem_region.c |  55 ++++
 drivers/gpu/drm/i915/gem/i915_gem_region.h |   6 +
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 351 +++------------------
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h |  16 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  84 ++++-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h    |   7 +
 drivers/gpu/drm/i915/gt/selftest_reset.c   |  16 +-
 drivers/gpu/drm/i915/i915_drv.h            |   5 -
 drivers/gpu/drm/i915/intel_memory_region.h |   6 +
 drivers/gpu/drm/i915/intel_region_ttm.c    |  48 ++-
 drivers/gpu/drm/i915/intel_region_ttm.h    |   3 +
 drivers/gpu/drm/ttm/ttm_range_manager.c    |  21 ++
 include/drm/ttm/ttm_range_manager.h        |   3 +
 14 files changed, 306 insertions(+), 391 deletions(-)

-- 
2.25.1

