Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4075FC6FD1C
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Mar 2023 13:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C304210E7CE;
	Tue, 14 Mar 2023 13:03:01 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C96610E7CE
 for <intel-gfx@lists.freedesktop.org>; Tue, 14 Mar 2023 13:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678798980; x=1710334980;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u+Js1RmrHqsn7zdiLN428Cszo+TcN1gZKJA+UZODhz8=;
 b=DOiGC5zHLuDy7X2XtigN1QsIZsfYoO9Zk4HnzZkUpgiJYgAqGd2gQyAN
 svTzr652rhPJIvZip9QWLlYak1SIncz34zCp+wm8MjqP7SIP74M+Q2LZq
 fvRpDUN06nLTPKcCFL76EAjJ01vqDv610LPukGQwaScx0OciZCaeQ5oa4
 teqNNDNTFHo3H4RPd5bZ/ATc42j9z4TnCcGBKbR14tDPUDQcrY26db6cy
 fXZ8BuZzu3qF27eD9lMNbN+yIMaDWR1lXreUwcJ98jaQRA638bl1c6DNx
 xDnugYvstcdvTQzDl2+HIoc5FKPPfuzZD9Owj/GrxQLKPmN3OyhC8i+wd w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="365079891"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="365079891"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 06:02:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="672323692"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="672323692"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga007.jf.intel.com with SMTP; 14 Mar 2023 06:02:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 14 Mar 2023 15:02:55 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 14 Mar 2023 15:02:46 +0200
Message-Id: <20230314130255.23273-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/9] drm/i915: Plane cleanups and extra registers
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Do a bit of cleanup/reorganization around mostly plane
relatd stuff, and also add some more plane/pipe registers
that are useful for development/debugging.

Ville Syrjälä (9):
  drm/i915: Stop using pipe_offsets[] for PIPE_MISC*
  drm/i915: s/PIPEMISC/PIPE_MISC/
  drm/i915: Define more pipe timestamp registers
  drm/i915: Program VLV/CHV PIPE_MSA_MISC register
  drm/i915: Define skl+ universal plane SURFLIVE registers
  drm/i915: Define vlv/chv sprite plane SURFLIVE registers
  drm/i915: Clean up skl+ plane alpha bits
  drm/i915: Relocate intel_plane_check_src_coordinates()
  drm/i915: Extract intel_sprite_uapi.c

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/icl_dsi.c        |   2 +-
 .../gpu/drm/i915/display/intel_atomic_plane.c |  60 +++++-
 .../gpu/drm/i915/display/intel_atomic_plane.h |   1 +
 drivers/gpu/drm/i915/display/intel_cursor.c   |   1 -
 drivers/gpu/drm/i915/display/intel_ddi.c      |   1 -
 drivers/gpu/drm/i915/display/intel_display.c  |  59 +++---
 drivers/gpu/drm/i915/display/intel_display.h  |   2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   | 183 ------------------
 .../gpu/drm/i915/display/intel_sprite_uapi.c  | 127 ++++++++++++
 .../gpu/drm/i915/display/intel_sprite_uapi.h  |  15 ++
 .../drm/i915/display/skl_universal_plane.c    |   1 -
 drivers/gpu/drm/i915/display/vlv_dsi.c        |   2 +-
 drivers/gpu/drm/i915/i915_reg.h               |  77 ++++++--
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c   |   6 +-
 15 files changed, 295 insertions(+), 243 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_sprite_uapi.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_sprite_uapi.h

-- 
2.39.2

