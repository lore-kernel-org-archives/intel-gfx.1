Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9BFC433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Apr 2022 19:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67F910E06B;
	Mon, 11 Apr 2022 19:25:10 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AAB10E032;
 Mon, 11 Apr 2022 19:25:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id CACE61F43CA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649705108;
 bh=eg43PXCLc8RV31eZZk8rKTmMpejMozLachAvcptorDE=;
 h=From:To:Cc:Subject:Date:From;
 b=nLYF15UENaFGyo/7rfhA95uQTjMl9qHRUVUIrMykMBRprAuur18IMdApNMXCZONOH
 mdJPs+N9d+cj6uPwnTVWcB7KjYQje5WV9BPAOQmEPZUSyeYjvT4QCH005USOshbzBK
 3wju/XoVFKX9W+OLS3lZ9oI9aq1DmLCQ311fE7A4UzTKlAh/pX7SZYJ22oS9DPJ0yA
 NaqX2YluuQwxjX7fAxBRS04BwyhJKWj4c688J5TKLphzs6HUiQV/K2v/2WLK5uIFeQ
 Fj6Jxwa+8xfiV5YdU3GoQCNeNnoJMlgy1XWR3ccXpX+y5sYRFIRDtq6Clb3oVSq7qN
 R4kVkue3VnJrQ==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Date: Mon, 11 Apr 2022 19:24:48 +0000
Message-Id: <20220411192453.1000147-1-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/5] drm/i915: ttm for stolen region
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
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This series refactors i915's stolen memory region to use ttm.

Robert Beckett (5):
  drm/i915: instantiate ttm ranger manager for stolen memory
  drm/i915: sanitize mem_flags for stolen buffers
  drm/i915: ttm move/clear logic fix
  drm/i915: ttm backend dont provide mmap_offset for kernel buffers
  drm/i915: stolen memory use ttm backend

 drivers/gpu/drm/i915/display/intel_fbc.c      |  78 ++--
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    | 405 +++++-------------
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h    |  21 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  32 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |   7 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  33 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c           |   4 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  16 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   7 +-
 drivers/gpu/drm/i915/i915_drv.h               |   5 -
 drivers/gpu/drm/i915/intel_region_ttm.c       |  67 ++-
 drivers/gpu/drm/i915/intel_region_ttm.h       |   8 +-
 drivers/gpu/drm/i915/selftests/mock_region.c  |   3 +-
 14 files changed, 310 insertions(+), 378 deletions(-)

-- 
2.25.1

