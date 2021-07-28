Return-Path: <SRS0=kgP7=MU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04774C4338F
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Jul 2021 12:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF01160FC0
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Jul 2021 12:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF01160FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04DF6E0CD;
	Wed, 28 Jul 2021 12:52:38 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B726E04A;
 Wed, 28 Jul 2021 12:52:36 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6798B1FFAB;
 Wed, 28 Jul 2021 12:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627476755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=623B0Af700VHpIK7d+bZLmB+bPMFcZHbtesZt/6DjcE=;
 b=oRCWLNAt+hQiWnHF46020tlZgKUVH6KkZgCZcJDyoMUZtKRqRGhHAN9nLN6cixLqiEWfTw
 899i3aH/ul94B0ipFZlrIi0iOh21GXTFLZVbncPiUnwOVv02BpsRWW/w2dfCkoIOaWJGxC
 hnY4NIR2TmAHDABHipImc86xyFWQcnY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627476755;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=623B0Af700VHpIK7d+bZLmB+bPMFcZHbtesZt/6DjcE=;
 b=H9FtI2rPEjQGdSznVr8Jzpnc0Tcx+6CBjz6MBTlGF9y8v0SnakPOP8SlgSMqpcJXkvEUeK
 N3rU8aHAAeB18eCw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 2B26F13318;
 Wed, 28 Jul 2021 12:52:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id Yop4CRNTAWG3XQAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 28 Jul 2021 12:52:35 +0000
Date: Wed, 28 Jul 2021 14:52:33 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <YQFTESngqkeqzlhN@linux-uq9g.fritz.box>
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

here's this week's PR for drm-misc-fixes. Besides the patches, it
contains a backmerge of drm-fixes.

Best regards
Thomas

drm-misc-fixes-2021-07-28:
Short summary of fixes pull:

 * panel: Fix bpc for ytc700tlag_05_201c
 * ttm: debugfs init fixes
The following changes since commit ff1176468d368232b684f75e82563369208bc371:

  Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-07-28

for you to fetch changes up to 8ee18e769dd621104fecad584c84ec3c4c9ef3fa:

  Merge drm/drm-fixes into drm-misc-fixes (2021-07-27 14:08:29 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * panel: Fix bpc for ytc700tlag_05_201c
 * ttm: debugfs init fixes

----------------------------------------------------------------
Jagan Teki (1):
      drm/panel: panel-simple: Fix proper bpc for ytc700tlag_05_201c

Jason Ekstrand (1):
      drm/ttm: Initialize debugfs from ttm_global_init()

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

 drivers/gpu/drm/panel/panel-simple.c |  2 +-
 drivers/gpu/drm/ttm/ttm_device.c     | 12 ++++++++++++
 drivers/gpu/drm/ttm/ttm_module.c     | 16 ----------------
 3 files changed, 13 insertions(+), 17 deletions(-)

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
