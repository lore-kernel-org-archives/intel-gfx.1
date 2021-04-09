Return-Path: <SRS0=Zf8m=JG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758F4C433ED
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Apr 2021 08:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DC5261185
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Apr 2021 08:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DC5261185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D8C6E4C1;
	Fri,  9 Apr 2021 08:23:53 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4856E483;
 Fri,  9 Apr 2021 08:23:52 +0000 (UTC)
IronPort-SDR: Y3crcMX+FENNSbiPx8COmNCmfMpT5cArvAJadX1iTlyKEFE8w6luBjUmN3qKEDJJX3aTSJuASY
 aeJnhHFWm/HQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="173195692"
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="173195692"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 01:23:51 -0700
IronPort-SDR: Az0YOJqej/DAulP3j2gyCo1fka60lnPLAb5kO6fIPKvYLT3S4DZ90I53gTno7rEoO5AubDgs2r
 mtzse//NKHxA==
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="422637298"
Received: from jploetz-mobl.ger.corp.intel.com (HELO [10.252.59.146])
 ([10.252.59.146])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 01:23:49 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <e7647dd9-60c3-9dfd-a377-89d717212e13@linux.intel.com>
Date: Fri, 9 Apr 2021 10:23:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
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

drm-misc-fixes-2021-04-09:
drm-misc-fixes for v5.12-rc7:
- Fix use-after-free in xen.
- Reduce fifo threshold on hvs4 to fix a fifo full error.
- Disable TE support for Droid4 and N950.
- Small compiler fixes.
The following changes since commit 50891bead80bc79871528c2962d65c781c02330b:

  drm/etnaviv: User FOLL_LONGTERM in userptr (2021-03-19 20:15:48 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-04-09

for you to fetch changes up to eb9dfdd1ed40357b99a4201c8534c58c562e48c9:

  drm/vc4: crtc: Reduce PV fifo threshold on hvs4 (2021-04-08 14:55:02 +0200)

----------------------------------------------------------------
drm-misc-fixes for v5.12-rc7:
- Fix use-after-free in xen.
- Reduce fifo threshold on hvs4 to fix a fifo full error.
- Disable TE support for Droid4 and N950.
- Small compiler fixes.

----------------------------------------------------------------
Dom Cobley (1):
      drm/vc4: crtc: Reduce PV fifo threshold on hvs4

Lv Yunlong (1):
      gpu/xen: Fix a use after free in xen_drm_drv_init

Maxime Ripard (1):
      drm/vc4: plane: Remove redundant assignment

Sebastian Reichel (1):
      drm/panel: panel-dsi-cm: disable TE for now

Wan Jiabing (1):
      drivers: gpu: drm: xen_drm_front_drm_info is declared twice

 drivers/gpu/drm/panel/panel-dsi-cm.c     | 12 +++++++++---
 drivers/gpu/drm/vc4/vc4_crtc.c           | 17 +++++++++++++++++
 drivers/gpu/drm/vc4/vc4_plane.c          |  1 -
 drivers/gpu/drm/xen/xen_drm_front.c      |  6 ++++--
 drivers/gpu/drm/xen/xen_drm_front_conn.h |  1 -
 5 files changed, 30 insertions(+), 7 deletions(-)
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
