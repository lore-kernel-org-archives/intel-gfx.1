Return-Path: <SRS0=djoz=LY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C88DC11F65
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Jun 2021 09:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1AFC61D0F
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Jun 2021 09:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1AFC61D0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F65B6E106;
	Wed, 30 Jun 2021 09:52:32 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416BB6E0D2;
 Wed, 30 Jun 2021 09:52:31 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EF2041FE51;
 Wed, 30 Jun 2021 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625046749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BJKsWbs5XonXaeLo5fUgbpydSLp4Tf0/ewcaeteRXgg=;
 b=PXoKV0OmyQ5iUOFwRbn/UkD2GXxP6PVJmmyt+UnsA9M6ryfqUHhhWJVU5ANAAA/eok2Xin
 R3oMUVTYt9uLl3uoqH9AvHQWfftitB+mnecS0GJJysRMpqC5ZHGgsdi4u1zvZ2L8EUdDfh
 sIjaCS1BOQ6iA8i4dFfAAjMLRnRkp9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625046749;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BJKsWbs5XonXaeLo5fUgbpydSLp4Tf0/ewcaeteRXgg=;
 b=mjsZcla47CdOgRLu+O+ddarqiAXAvc4kVFpbtZwzLEZ4cwGdAvnoFXI3nFQsWLuxDWM6wj
 PujOcPky99iCluBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id A763811906;
 Wed, 30 Jun 2021 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625046749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BJKsWbs5XonXaeLo5fUgbpydSLp4Tf0/ewcaeteRXgg=;
 b=PXoKV0OmyQ5iUOFwRbn/UkD2GXxP6PVJmmyt+UnsA9M6ryfqUHhhWJVU5ANAAA/eok2Xin
 R3oMUVTYt9uLl3uoqH9AvHQWfftitB+mnecS0GJJysRMpqC5ZHGgsdi4u1zvZ2L8EUdDfh
 sIjaCS1BOQ6iA8i4dFfAAjMLRnRkp9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625046749;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BJKsWbs5XonXaeLo5fUgbpydSLp4Tf0/ewcaeteRXgg=;
 b=mjsZcla47CdOgRLu+O+ddarqiAXAvc4kVFpbtZwzLEZ4cwGdAvnoFXI3nFQsWLuxDWM6wj
 PujOcPky99iCluBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id vcfMJ90+3GBKcwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 30 Jun 2021 09:52:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, mika.kuoppala@linux.intel.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 lucas.demarchi@intel.com, ville.syrjala@linux.intel.com
Date: Wed, 30 Jun 2021 11:52:26 +0200
Message-Id: <20210630095228.6665-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 0/2] drm/i915: IRQ fixes
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Fix a bug in the usage of IRQs and cleanup references to the DRM
IRQ midlayer.

Preferably this patchset would be merged through drm-misc-next.

v3:
	* also use intel_synchronize_hardirq() from other callsite
v2:
	* split patch
	* also fix comment
	* add intel_synchronize_hardirq() (Ville)
	* update Fixes tag (Daniel)

Thomas Zimmermann (2):
  drm/i915: Use the correct IRQ during resume
  drm/i915: Drop all references to DRM IRQ midlayer

 drivers/gpu/drm/i915/gt/intel_engine_cs.c       |  2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c |  2 +-
 drivers/gpu/drm/i915/i915_drv.c                 |  1 -
 drivers/gpu/drm/i915/i915_irq.c                 | 10 +++++-----
 drivers/gpu/drm/i915/i915_irq.h                 |  1 +
 5 files changed, 8 insertions(+), 8 deletions(-)


base-commit: 67f5a18128770817e4218a9e496d2bf5047c51e8
--
2.32.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
