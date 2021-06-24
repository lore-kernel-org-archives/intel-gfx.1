Return-Path: <SRS0=foSz=LS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D53C48BDF
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 07:16:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C640613E0
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 07:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C640613E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B816EA3A;
	Thu, 24 Jun 2021 07:16:44 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C4B6EA3A;
 Thu, 24 Jun 2021 07:16:42 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 81F2A1FD54;
 Thu, 24 Jun 2021 07:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624519001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=doEBp5GBpPTErS+YHfy8q3MJp0PbBKpajkTSw1GBNu8=;
 b=ryXjj8EaxTHz200n51XOfyWuVqpJir5ZY7nluf2GfU2VIRPYSuo41f6x7ZWfTBBHooOzuk
 deT1skpq5syxqcwzCYvw58b/eiaHKIQepa3YGdwlXcAetxFviMb7OEVsKHGXkzD6d5q0vK
 TvX9+u+LqaeB754fJpYurbfiNai803s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624519001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=doEBp5GBpPTErS+YHfy8q3MJp0PbBKpajkTSw1GBNu8=;
 b=b9UdZw9rOfzviY01WS1PgA6u2kyS+7vO9GSF2QeAwVFmH5w+eHs8Y8kshquY3247DZtfLv
 Yd/1dhjgxKtRdIBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 47FD511A97;
 Thu, 24 Jun 2021 07:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624519001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=doEBp5GBpPTErS+YHfy8q3MJp0PbBKpajkTSw1GBNu8=;
 b=ryXjj8EaxTHz200n51XOfyWuVqpJir5ZY7nluf2GfU2VIRPYSuo41f6x7ZWfTBBHooOzuk
 deT1skpq5syxqcwzCYvw58b/eiaHKIQepa3YGdwlXcAetxFviMb7OEVsKHGXkzD6d5q0vK
 TvX9+u+LqaeB754fJpYurbfiNai803s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624519001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=doEBp5GBpPTErS+YHfy8q3MJp0PbBKpajkTSw1GBNu8=;
 b=b9UdZw9rOfzviY01WS1PgA6u2kyS+7vO9GSF2QeAwVFmH5w+eHs8Y8kshquY3247DZtfLv
 Yd/1dhjgxKtRdIBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 0NctEFkx1GBmeQAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 07:16:41 +0000
Date: Thu, 24 Jun 2021 09:16:39 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <YNQxVybBGdjLMUQJ@linux-uq9g>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's the drm-misc-next-fixes PR for this week.

Best regards
Thomas

drm-misc-next-fixes-2021-06-24:
Short summary of fixes pull:

 * amdgpu: Fix test for allocation failures
The following changes since commit 24ff3dc18b99c4b912ab1746e803ddb3be5ced4c:

  drm/dp_mst: Add missing drm parameters to recently added call to drm_dbg_=
kms() (2021-06-16 15:53:15 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2021-=
06-24

for you to fetch changes up to eed75ce7c8260e0d5612ced4a88180ab991e207c:

  drm/amdgpu: fix amdgpu_preempt_mgr_new() (2021-06-21 15:24:29 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * amdgpu: Fix test for allocation failures

----------------------------------------------------------------
Dan Carpenter (1):
      drm/amdgpu: fix amdgpu_preempt_mgr_new()

 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
