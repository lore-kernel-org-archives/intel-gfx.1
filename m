Return-Path: <SRS0=0ugA=J2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF426C433B4
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 10:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 415A561453
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 10:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 415A561453
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999556EDD7;
	Thu, 29 Apr 2021 10:10:41 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA626EDD7
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Apr 2021 10:10:40 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 29 Apr 2021 12:10:32 +0200
Message-Id: <20210429101036.1086461-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/4] drm/i915: Propagate ww parameter to
 get_pages().
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

For TTM eviction we may need to retrieve the ww parameter, to ensure we
can lock extra objects while evicting. Pass along the
struct i915_gem_ww_ctx, so this can be done.

Maarten Lankhorst (4):
  drm/i915: Add ww parameter to get_pages() callback
  drm/i915: Add ww context to prepare_(read/write)
  drm/i915: Pass ww ctx to pin_map, v2.
  drm/i915: Pass ww ctx to i915_gem_object_pin_pages, v2.

 drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 11 ++--
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 50 ++++++++++++-------
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 18 ++++---
 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 21 +++++---
 drivers/gpu/drm/i915/gem/i915_gem_object.h    | 23 ++++++---
 .../gpu/drm/i915/gem/i915_gem_object_blt.c    |  4 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 38 ++++++++++----
 drivers/gpu/drm/i915/gem/i915_gem_region.c    |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.h    |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  5 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  7 +--
 .../drm/i915/gem/selftests/huge_gem_object.c  |  3 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   | 13 +++--
 .../i915/gem/selftests/i915_gem_client_blt.c  |  2 +-
 .../i915/gem/selftests/i915_gem_coherency.c   | 14 +++---
 .../drm/i915/gem/selftests/i915_gem_context.c | 16 +++---
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  2 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  4 +-
 .../drm/i915/gem/selftests/i915_gem_phys.c    |  2 +-
 drivers/gpu/drm/i915/gt/gen7_renderclear.c    |  2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  4 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.c   |  2 +-
 drivers/gpu/drm/i915/gt/intel_ring.c          |  2 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |  2 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c      |  7 +--
 drivers/gpu/drm/i915/gt/intel_timeline.h      |  3 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |  2 +-
 drivers/gpu/drm/i915/gt/mock_engine.c         |  2 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c        | 10 ++--
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  8 +--
 drivers/gpu/drm/i915/gvt/cmd_parser.c         |  6 +--
 drivers/gpu/drm/i915/gvt/dmabuf.c             |  3 +-
 drivers/gpu/drm/i915/i915_gem.c               | 12 ++---
 drivers/gpu/drm/i915/i915_perf.c              |  4 +-
 drivers/gpu/drm/i915/i915_vma.c               |  7 +--
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  3 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c     |  2 +-
 drivers/gpu/drm/i915/selftests/igt_spinner.c  |  2 +-
 .../drm/i915/selftests/intel_memory_region.c  |  2 +-
 48 files changed, 205 insertions(+), 141 deletions(-)

-- 
2.31.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
