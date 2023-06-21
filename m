Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0896AEB64D7
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jun 2023 19:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7557210E353;
	Wed, 21 Jun 2023 19:44:08 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F5D10E353;
 Wed, 21 Jun 2023 19:44:07 +0000 (UTC)
Message-ID: <e96b1965-ba67-7cc5-2358-826eb5b9b998@lankhorst.se>
Date: Wed, 21 Jun 2023 21:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Maarten Lankhorst <dev@lankhorst.se>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Midsummer is nearly here! So sending the pull request a bit early.

Cheers!
~Maarten

drm-misc-fixes-2023-06-21:
drm-misc-fixes for v6.4:
- Qaic imported dma-buf fix.
- Fix null pointer deref when printing a dp-mst message.
The following changes since commit 45a3e24f65e90a047bef86f927ebdc4c710edaa1:

   Linux 6.4-rc7 (2023-06-18 14:06:27 -0700)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-06-21

for you to fetch changes up to 54d217406afe250d7a768783baaa79a035f21d38:

   drm: use mgr->dev in drm_dbg_kms in drm_dp_add_payload_part2 
(2023-06-20 16:00:09 -0400)

----------------------------------------------------------------
drm-misc-fixes for v6.4:
- Qaic imported dma-buf fix.
- Fix null pointer deref when printing a dp-mst message.

----------------------------------------------------------------
Jeff Layton (1):
       drm: use mgr->dev in drm_dbg_kms in drm_dp_add_payload_part2

Pranjal Ramajor Asha Kanojiya (1):
       accel/qaic: Call DRM helper function to destroy prime GEM

  drivers/accel/qaic/qaic_data.c                | 4 ++--
  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
  2 files changed, 3 insertions(+), 3 deletions(-)
