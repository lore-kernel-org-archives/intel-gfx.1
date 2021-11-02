Return-Path: <SRS0=WhEZ=PV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F33FC433EF
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Nov 2021 16:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0712C60E90
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Nov 2021 16:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0712C60E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3D1731E1;
	Tue,  2 Nov 2021 16:39:22 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBD5731DE;
 Tue,  2 Nov 2021 16:39:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="231267877"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="231267877"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:34:34 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="531614861"
Received: from vanderss-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.234])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:34:32 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Tue,  2 Nov 2021 17:34:23 +0100
Message-Id: <20211102163425.505732-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v3 0/2] drm/i915: Failsafe migration blits
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This patch series introduces failsafe migration blits.
The reason for this seemingly strange concept is that if the initial
clearing or readback of LMEM fails for some reason[1], and we then set up
either GPU- or CPU ptes to the allocated LMEM, we can expose old
contents from other clients.

So after each migration blit to LMEM, attach a dma-fence callback that
checks the migration fence error value and if it's an error,
performs a memcpy blit, instead.

Patch 1 splits out the TTM move code into separate files
Patch 2 implements the failsafe blits and related self-tests

[1] There are at least two ways we could trigger exposure of uninitialized
LMEM assuming the migration blits themselves never trigger a gpu hang.

a) A gpu operation preceding a pipelined eviction blit resets and sets the
error fence to -EIO, and the error is propagated across the TTM manager to
the clear / swapin blit of a newly allocated TTM resource. It aborts and
leaves the memory uninitialized.

b) Something wedges the GT while a migration blit is submitted. It ends up
never executed and TTM can fault user-space cpu-ptes into uninitialized
memory.

v3:
- Style fixes in second patch (Matthew Auld)

Thomas Hellström (2):
  drm/i915/ttm: Reorganize the ttm move code
  drm/i915/ttm: Failsafe migration blits

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 328 ++---------
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |  35 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 520 ++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h  |  43 ++
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  24 +-
 6 files changed, 670 insertions(+), 281 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h

-- 
2.31.1

