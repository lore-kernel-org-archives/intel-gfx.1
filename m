Return-Path: <SRS0=b/6W=GX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CDBC433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Jan 2021 12:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA4CC2333D
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Jan 2021 12:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA4CC2333D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EA06E0AB;
	Wed, 20 Jan 2021 12:09:11 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B910889D4B;
 Wed, 20 Jan 2021 12:09:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3FB21B74C;
 Wed, 20 Jan 2021 12:09:07 +0000 (UTC)
Date: Wed, 20 Jan 2021 13:09:04 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <YAgdYGNoH7pC29rz@linux-uq9g>
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

here's this week's PR for drm-misc-next.

Best regards
Thomas

drm-misc-fixes-2021-01-20:
Short summary of fixes pull (less than what git shortlog provides):

 * drm/atomic: Release state on error
 * drm/syncobj: Fix use-after-free
 * drm/ttm: Don't use GFP_TRANSHUGE_LIGTH
 * drm/vc4: Unify driver naming for PCM
 * drm/vram-helper: Fix memory leak in vmap
The following changes since commit 19c329f6808995b142b3966301f217c831e7cf31:

  Linux 5.11-rc4 (2021-01-17 16:37:05 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-01-20

for you to fetch changes up to a37eef63bc9e16e06361b539e528058146af80ab:

  drm/syncobj: Fix use-after-free (2021-01-20 10:28:39 +0100)

----------------------------------------------------------------
Short summary of fixes pull (less than what git shortlog provides):

 * drm/atomic: Release state on error
 * drm/syncobj: Fix use-after-free
 * drm/ttm: Don't use GFP_TRANSHUGE_LIGTH
 * drm/vc4: Unify driver naming for PCM
 * drm/vram-helper: Fix memory leak in vmap

----------------------------------------------------------------
Christian K=F6nig (1):
      drm/ttm: stop using GFP_TRANSHUGE_LIGHT

Daniel Vetter (1):
      drm/syncobj: Fix use-after-free

Nicolas Saenz Julienne (1):
      drm/vc4: Unify PCM card's driver_name

Pan Bian (1):
      drm/atomic: put state on error path

Thomas Zimmermann (1):
      drm/vram-helper: Reuse existing page mappings in vmap

 drivers/gpu/drm/drm_atomic_helper.c   |  2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c | 14 +++++++++++---
 drivers/gpu/drm/drm_syncobj.c         |  8 +++++---
 drivers/gpu/drm/ttm/ttm_pool.c        | 11 ++++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.c        |  1 +
 5 files changed, 24 insertions(+), 12 deletions(-)

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
