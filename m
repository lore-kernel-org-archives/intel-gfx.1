Return-Path: <SRS0=m2z4=PI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B205EC433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Oct 2021 22:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73B1D61212
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Oct 2021 22:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73B1D61212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A5D6EA0E;
	Wed, 20 Oct 2021 22:33:53 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716A76EA09
 for <intel-gfx@lists.freedesktop.org>; Wed, 20 Oct 2021 22:33:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="227663897"
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; d="scan'208";a="227663897"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 15:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; d="scan'208";a="444540540"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 20 Oct 2021 15:33:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 21 Oct 2021 01:33:39 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>
Date: Thu, 21 Oct 2021 01:33:35 +0300
Message-Id: <20211020223339.669-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/4] drm/i915: (near)atomic gamma LUT updates
 via vblank workers
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

Finally got around to refreshing my vblank worker gamma LUT series.
Since I started this (ahem, some years ago) Lyude took over the
actual vblank worker implementation, mostly rewrote it I think,
and landed it for use in nouveau. So now I'm just left with the
easy task of using it for i915 gamma LUT updates. And so here
we are.

CC: Lyude Paul <lyude@redhat.com>

Ville Syrjälä (4):
  drm/i915: Move function prototypes to the correct header
  drm/i915: Do vrr push before sampling the freame counter
  drm/i915: Use vblank workers for gamma updates
  drm/i915: Use unlocked register accesses for LUT loads

 drivers/gpu/drm/i915/display/intel_color.c    | 128 +++++++++---------
 drivers/gpu/drm/i915/display/intel_crtc.c     |  82 ++++++++++-
 drivers/gpu/drm/i915/display/intel_crtc.h     |   7 +
 drivers/gpu/drm/i915/display/intel_display.c  |   9 +-
 .../drm/i915/display/intel_display_types.h    |   8 ++
 drivers/gpu/drm/i915/display/intel_dsb.c      |   4 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_sprite.h   |   4 -
 drivers/gpu/drm/i915/i915_trace.h             |  42 ++++++
 9 files changed, 203 insertions(+), 83 deletions(-)

-- 
2.32.0

