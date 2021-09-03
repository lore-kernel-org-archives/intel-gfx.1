Return-Path: <SRS0=fLoR=NZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6699CC433F5
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Sep 2021 09:38:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ED2F60FC0
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Sep 2021 09:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2ED2F60FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEC36E865;
	Fri,  3 Sep 2021 09:38:06 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDDE6E098;
 Fri,  3 Sep 2021 09:38:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="219436500"
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="219436500"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 02:37:45 -0700
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="543433538"
Received: from schuethe-mobl1.ger.corp.intel.com (HELO [10.252.60.46])
 ([10.252.60.46])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 02:37:42 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Message-ID: <41ff5e54-0837-2226-a182-97ffd11ef01e@linux.intel.com>
Date: Fri, 3 Sep 2021 11:38:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PULL] drm-misc-next-fixes
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

drm-misc-next-fixes-2021-09-03:
drm-misc-next-fixes for v5.15:
- Fix ttm_bo_move_memcpy() when ttm_resource is subclassed.
- Small fixes to panfrost, mgag200, vc4.
- Small ttm compilation fixes.
The following changes since commit 2819cf0e7dbe45a2bccf2f6c60fe6a27b299cc3e:

  Merge tag 'drm-misc-next-2021-08-12' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2021-08-16 12:57:33 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2021-09-03

for you to fetch changes up to efcefc7127290e7e9fa98dea029163ad8eda8fb3:

  drm/ttm: Fix ttm_bo_move_memcpy() for subclassed struct ttm_resource (2021-08-31 10:48:26 +0200)

----------------------------------------------------------------
drm-misc-next-fixes for v5.15:
- Fix ttm_bo_move_memcpy() when ttm_resource is subclassed.
- Small fixes to panfrost, mgag200, vc4.
- Small ttm compilation fixes.

----------------------------------------------------------------
Alyssa Rosenzweig (3):
      drm/panfrost: Simplify lock_region calculation
      drm/panfrost: Use u64 for size in lock_region
      drm/panfrost: Clamp lock region to Bifrost minimum

Colin Ian King (1):
      drm/mgag200: Fix uninitialized variable delta

Jason Ekstrand (2):
      drm/ttm: ttm_bo_device is now ttm_device
      drm/ttm: Include pagemap.h from ttm_tt.h

Jiapeng Chong (1):
      drm/vc4: hdmi: make vc4_hdmi_codec_pdata static

Thomas Hellström (1):
      drm/ttm: Fix ttm_bo_move_memcpy() for subclassed struct ttm_resource

 Documentation/gpu/drm-mm.rst             |  2 +-
 drivers/gpu/drm/mgag200/mgag200_pll.c    |  1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c  | 31 +++++++++++--------------------
 drivers/gpu/drm/panfrost/panfrost_regs.h |  2 ++
 drivers/gpu/drm/ttm/ttm_bo_util.c        |  7 +++----
 drivers/gpu/drm/ttm/ttm_tt.c             |  1 -
 drivers/gpu/drm/vc4/vc4_hdmi.c           |  2 +-
 include/drm/ttm/ttm_tt.h                 |  3 ++-
 8 files changed, 21 insertions(+), 28 deletions(-)
