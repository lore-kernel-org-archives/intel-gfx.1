Return-Path: <SRS0=KPZb=HM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A50AC433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Feb 2021 14:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 517C464DF5
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Feb 2021 14:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 517C464DF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82BD6E29D;
	Wed, 10 Feb 2021 14:08:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31976E05C;
 Wed, 10 Feb 2021 14:08:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57145B066;
 Wed, 10 Feb 2021 14:08:45 +0000 (UTC)
Date: Wed, 10 Feb 2021 15:08:42 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <YCPo6g3gDxD3P//h@linux-uq9g>
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's this week's PR for drm-misc-fixes. There's a buffer overflow in vc4
and a memory leak in xlnx. The rest appear to be mere bug fixes.

Best regards
Thomas

drm-misc-fixes-2021-02-10:
 * dp_mst: Don't report un-attached ports as connected
 * sun4i: tcon1 sync polarity fix; Always set HDMI clock rate; Fix
          H6 HDMI PHY config; Fix H6 max frequency
 * vc4: Fix buffer overflow
 * xlnx: Fix memory leak
The following changes since commit 2b1b3e544f65f40df5eef99753e460a127910479:

  drm/ttm: Use __GFP_NOWARN for huge pages in ttm_pool_alloc_page (2021-01-=
28 13:01:52 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-02-10

for you to fetch changes up to 1926a0508d8947cf081280d85ff035300dc71da7:

  drm/sun4i: dw-hdmi: Fix max. frequency for H6 (2021-02-10 11:20:38 +0100)

----------------------------------------------------------------
 * dp_mst: Don't report un-attached ports as connected
 * sun4i: tcon1 sync polarity fix; Always set HDMI clock rate; Fix
          H6 HDMI PHY config; Fix H6 max frequency
 * vc4: Fix buffer overflow
 * xlnx: Fix memory leak

----------------------------------------------------------------
Imre Deak (1):
      drm/dp_mst: Don't report ports connected if nothing is attached to th=
em

Jernej Skrabec (4):
      drm/sun4i: tcon: set sync polarity for tcon1 channel
      drm/sun4i: dw-hdmi: always set clock rate
      drm/sun4i: Fix H6 HDMI PHY configuration
      drm/sun4i: dw-hdmi: Fix max. frequency for H6

Maxime Ripard (1):
      drm/vc4: hvs: Fix buffer overflow with the dlist handling

Quanyang Wang (1):
      drm/xlnx: fix kmemleak by sending vblank_event in atomic_disable

 drivers/gpu/drm/drm_dp_mst_topology.c  |  1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c     | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h     |  6 ++++++
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  | 10 +++-------
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  1 -
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 26 +++++++++-----------------
 drivers/gpu/drm/vc4/vc4_plane.c        | 18 ++++++++++++++----
 drivers/gpu/drm/xlnx/zynqmp_disp.c     | 15 +++++++--------
 8 files changed, 65 insertions(+), 37 deletions(-)

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
