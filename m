Return-Path: <SRS0=RAJW=CE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AE9C433DF
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2020 07:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E389F206FA
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2020 07:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E389F206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636A56EA2D;
	Wed, 26 Aug 2020 07:40:50 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2525A6EA2B;
 Wed, 26 Aug 2020 07:40:49 +0000 (UTC)
IronPort-SDR: ACgeMXZSdxFIFl/BrUYlFmQgUCGS/e7IIzMhpHGiRmzHDfTHou75IoWp6DAYUURdY9saugxWD8
 N/MDcd2DhQRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="217797508"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="217797508"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 00:40:48 -0700
IronPort-SDR: x8bpMnnH8HbZ/Nw6aybca5WUXgPEw/WAUEDsySy0cAoA/w0GX/DmOl+I5k44nBi+FNHXjZv5Bq
 mj3PQvRylf+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="500156412"
Received: from apronina-mobl2.ccr.corp.intel.com (HELO [10.252.33.193])
 ([10.252.33.193])
 by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2020 00:40:45 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <7af1e52a-27de-8edc-d0b2-e23b01e8bc96@linux.intel.com>
Date: Wed, 26 Aug 2020 09:40:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Intel-gfx] [PULL] drm-misc-fixes
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

drm-misc-fixes-2020-08-26:
Fixes for v5.9-rc2:
- Take modeset bkl for legacy drivers.
- Allow null crtc in dp_mst.
- Omap locking state fix.
The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-08-26

for you to fetch changes up to 7fd5b25499bcec157dd4de9a713425efcf4571cd:

  drm/omap: fix incorrect lock state (2020-08-25 12:05:15 +0300)

----------------------------------------------------------------
Fixes for v5.9-rc2:
- Take modeset bkl for legacy drivers.
- Allow null crtc in dp_mst.
- Omap locking state fix.

----------------------------------------------------------------
Bhawanpreet Lakha (1):
      drm/dp_mst: Don't return error code when crtc is null

Daniel Vetter (1):
      drm/modeset-lock: Take the modeset BKL for legacy drivers

Maarten Lankhorst (1):
      Merge tag 'v5.9-rc2' into drm-misc-fixes

Tomi Valkeinen (1):
      drm/omap: fix incorrect lock state

 drivers/gpu/drm/drm_atomic_helper.c   | 7 ++++---
 drivers/gpu/drm/drm_color_mgmt.c      | 2 +-
 drivers/gpu/drm/drm_crtc.c            | 4 +---
 drivers/gpu/drm/drm_dp_mst_topology.c | 4 ++--
 drivers/gpu/drm/drm_mode_object.c     | 4 ++--
 drivers/gpu/drm/drm_plane.c           | 2 +-
 drivers/gpu/drm/omapdrm/omap_crtc.c   | 3 ++-
 include/drm/drm_modeset_lock.h        | 9 +++++++--
 8 files changed, 20 insertions(+), 15 deletions(-)
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
