Return-Path: <SRS0=Ht+W=CZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB306C433E2
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 15:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70ABB22288
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 15:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70ABB22288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9D56EA37;
	Wed, 16 Sep 2020 15:34:51 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7206EA34;
 Wed, 16 Sep 2020 15:34:50 +0000 (UTC)
IronPort-SDR: 1ImXKezHSbJlgW2b1icHr0RzIt4Zzp9C1U2ChqbLMujLetBGr8ZCaXVrL/29fJDyuPU5QZCcxS
 Gg8JxSz2Mhow==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="147180990"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="147180990"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 08:34:49 -0700
IronPort-SDR: o+v+FE6RIQUY3Dlx59QYIHT1lRwU8xO492ZT/DXqBYBa3DYfB15oldr99PJMAEsnAPDmuxYyar
 QBsKBgWGR65A==
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="307081574"
Received: from karthik-2012-client-platform.iind.intel.com ([10.223.74.217])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 16 Sep 2020 08:34:46 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 16 Sep 2020 20:38:16 +0530
Message-Id: <20200916150824.15749-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v9 0/8] Asynchronous flip implementation for i915
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 dri-devel@lists.freedesktop.org, daniel.vetter@intel.com,
 harry.wentland@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Without async flip support in the kernel, fullscreen apps where game
resolution is equal to the screen resolution, must perform an extra blit
per frame prior to flipping.

Asynchronous page flips will also boost the FPS of Mesa benchmarks.

v2: -Few patches have been squashed and patches have been shuffled as
     per the reviews on the previous version.

v3: -Few patches have been squashed and patches have been shuffled as
     per the reviews on the previous version.

v4: -Made changes to fix the sequence and time stamp issue as per the
     comments received on the previous version.
    -Timestamps are calculated using the flip done time stamp and current
     timestamp. Here I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP flag is used
     for timestamp calculations.
    -Event is sent from the interrupt handler immediately using this
     updated timestamps and sequence.
    -Added more state checks as async flip should only allow change in plane
     surface address and nothing else should be allowed to change.
    -Added a separate plane hook for async flip.
    -Need to find a way to reject fbc enabling if it comes as part of this
     flip as bspec states that changes to FBC are not allowed.

v5: -Fixed the Checkpatch and sparse warnings.

v6: -Reverted back to the old timestamping code as per the feedback received.
    -Added documentation.

v7: -Changes in intel_atomic_check_async()
    -Add vfunc for skl_program_async_surface_address()

v8: -Add WA for older platforms with double buffered
     async address update enable bit.

v9: -Changes as per feedback received on previous version.

Test-with: <20200916135044.6903-1-karthik.b.s@intel.com>

Karthik B S (8):
  drm/i915: Add enable/disable flip done and flip done handler
  drm/i915: Add support for async flips in I915
  drm/i915: Add checks specific to async flips
  drm/i915: Do not call drm_crtc_arm_vblank_event in async flips
  drm/i915: Add dedicated plane hook for async flip case
  drm/i915: WA for platforms with double buffered address update enable
    bit
  Documentation/gpu: Add asynchronous flip documentation for i915
  drm/i915: Enable async flips in i915

 Documentation/gpu/i915.rst                    |   6 +
 .../gpu/drm/i915/display/intel_atomic_plane.c |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 197 ++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |   3 +
 drivers/gpu/drm/i915/display/intel_sprite.c   |  30 +++
 drivers/gpu/drm/i915/i915_irq.c               |  52 +++++
 drivers/gpu/drm/i915/i915_irq.h               |   3 +
 drivers/gpu/drm/i915/i915_reg.h               |   1 +
 8 files changed, 297 insertions(+), 1 deletion(-)

-- 
2.22.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
