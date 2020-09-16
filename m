Return-Path: <SRS0=Ht+W=CZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044C1C433E2
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 17:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EE63223E8
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 17:19:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fa7FbXoP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EE63223E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132436EA96;
	Wed, 16 Sep 2020 17:19:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881B96EA97
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Sep 2020 17:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600276768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZHIAKv41v2ts7c31e27PFjI9bq/bQuazeIBjpDLbtCY=;
 b=fa7FbXoPyJLTU9TwrUzqOzLRhTLsmIsGbnbUu40NZfof36Pui8YeJw2Lu6O7iphMS1+BCn
 Di910tf+0kAzXQguC05DBXqmRX/YrOdeK//l96gDvvYCnX+85x2S01xdIu/ec2jjnWRwN/
 RStVmiR/aImnk14MqKm+XOqCc+sijzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-DVgxM7fNMNqiZ8xSRHzmoA-1; Wed, 16 Sep 2020 13:19:26 -0400
X-MC-Unique: DVgxM7fNMNqiZ8xSRHzmoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EA46100746D;
 Wed, 16 Sep 2020 17:19:25 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-66.rdu2.redhat.com
 [10.10.120.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C7CF7E46E;
 Wed, 16 Sep 2020 17:19:25 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 16 Sep 2020 13:18:47 -0400
Message-Id: <20200916171855.129511-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Intel-gfx] [RFC v2 0/8] drm/i915: Add support for Intel's eDP
 backlight controls
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

A while ago we ran into issues while trying to enable the eDP backlight
control interface as defined by VESA, in order to make the DPCD
backlight controls on newer laptop panels work. The issue ended up being
much more complicated however, as we also apparently needed to add
support for an Intel-specific DPCD backlight control interface as the
VESA interface is broken on many laptop panels. For lack of a better
name, we just call this the Intel HDR backlight interface.

While this only adds support for the SDR backlight mode (I think), this
will fix a lot of user's laptop panels that we weren't able to properly
automatically detect DPCD backlight controls on previously.

Lyude Paul (8):
  drm/i915/dp: Program source OUI on eDP panels
  drm/i915: Rename pwm_* backlight callbacks to ext_pwm_*
  drm/i915: Keep track of pwm-related backlight hooks separately
  drm/i915/dp: Rename eDP VESA backlight interface functions
  drm/i915/dp: Add register definitions for Intel HDR backlight
    interface
  drm/i915/dp: Enable Intel's HDR backlight interface (only SDR for now)
  drm/i915/dp: Allow forcing specific interfaces through
    enable_dpcd_backlight
  drm/dp: Revert "drm/dp: Introduce EDID-based quirks"

 drivers/gpu/drm/drm_dp_helper.c               |  82 +--
 drivers/gpu/drm/drm_dp_mst_topology.c         |   3 +-
 .../drm/i915/display/intel_display_types.h    |  24 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  42 +-
 .../drm/i915/display/intel_dp_aux_backlight.c | 384 ++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +-
 drivers/gpu/drm/i915/display/intel_panel.c    | 476 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_panel.h    |   4 +
 drivers/gpu/drm/i915/display/intel_psr.c      |   2 +-
 drivers/gpu/drm/i915/i915_params.c            |   2 +-
 include/drm/drm_dp_helper.h                   |  21 +-
 11 files changed, 672 insertions(+), 371 deletions(-)

-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
