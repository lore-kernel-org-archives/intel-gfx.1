Return-Path: <SRS0=d1l9=PC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57909C433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Oct 2021 12:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 091B8610D2
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Oct 2021 12:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 091B8610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC846E160;
	Thu, 14 Oct 2021 12:19:11 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4059F6E15D;
 Thu, 14 Oct 2021 12:19:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="208467653"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="208467653"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 05:19:09 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="481240258"
Received: from thanners-mobl.ger.corp.intel.com (HELO [10.252.62.140])
 ([10.252.62.140])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 05:19:07 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Message-ID: <8ac9a968-64d8-44ae-a9ae-863c21524fce@linux.intel.com>
Date: Thu, 14 Oct 2021 14:19:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

drm-misc-fixes-2021-10-14:
drm-misc-fixes for v5.15-rc6:
- Respun clock fixes for vc4/hdmi.
- Cap connector_bad_edid()'s num_of_ext by num_blocks read.
- Clamp fbdev size to max available height.
- Hide hyper-v's hw pointer, to prevent double pointers.
- Use the correct engine bit in nouveau's g84_fifo_chan_engine_fini.
- Build fix for r128 on UML.
- Add missing dependency for CONFIG_CRC32 to olimex-lcd-olinuxino.
The following changes since commit f5a8703a9c418c6fc54eb772712dfe7641e3991c:

  drm/nouveau/debugfs: fix file release memory leak (2021-10-06 11:12:29 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-10-14

for you to fetch changes up to 6de148d82d9e790caf7622a002229df745fd2d94:

  drm/vc4: crtc: Make sure the HDMI controller is powered when disabling (2021-10-13 14:40:43 +0200)

----------------------------------------------------------------
drm-misc-fixes for v5.15-rc6:
- Respun clock fixes for vc4/hdmi.
- Cap connector_bad_edid()'s num_of_ext by num_blocks read.
- Clamp fbdev size to max available height.
- Hide hyper-v's hw pointer, to prevent double pointers.
- Use the correct engine bit in nouveau's g84_fifo_chan_engine_fini.
- Build fix for r128 on UML.
- Add missing dependency for CONFIG_CRC32 to olimex-lcd-olinuxino.

----------------------------------------------------------------
Dexuan Cui (1):
      drm/hyperv: Fix double mouse pointers

Douglas Anderson (1):
      drm/edid: In connector_bad_edid() cap num_of_ext by num_blocks read

Marek Vasut (1):
      drm/nouveau/fifo: Reinstate the correct engine bit programming

Maxime Ripard (11):
      clk: bcm-2835: Pick the closest clock rate
      clk: bcm-2835: Remove rounding up the dividers
      drm/vc4: hdmi: Set a default HSM rate
      drm/vc4: hdmi: Move the HSM clock enable to runtime_pm
      drm/vc4: hdmi: Make sure the controller is powered in detect
      drm/vc4: hdmi: Make sure the controller is powered up during bind
      drm/vc4: hdmi: Rework the pre_crtc_configure error handling
      drm/vc4: hdmi: Split the CEC disable / enable functions in two
      drm/vc4: hdmi: Make sure the device is powered with CEC
      drm/vc4: hdmi: Warn if we access the controller while disabled
      drm/vc4: crtc: Make sure the HDMI controller is powered when disabling

Randy Dunlap (1):
      drm/r128: fix build for UML

Thomas Zimmermann (1):
      drm/fbdev: Clamp fbdev surface size if too large

Vegard Nossum (1):
      drm/panel: olimex-lcd-olinuxino: select CRC32

 drivers/clk/bcm/clk-bcm2835.c                      |  13 +-
 drivers/gpu/drm/drm_edid.c                         |  15 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   6 +
 drivers/gpu/drm/hyperv/hyperv_drm.h                |   1 +
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |   1 +
 drivers/gpu/drm/hyperv/hyperv_drm_proto.c          |  54 +++++-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c |   2 +-
 drivers/gpu/drm/panel/Kconfig                      |   1 +
 drivers/gpu/drm/r128/ati_pcigart.c                 |   2 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  19 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 208 ++++++++++++++-------
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |   6 +
 12 files changed, 248 insertions(+), 80 deletions(-)
