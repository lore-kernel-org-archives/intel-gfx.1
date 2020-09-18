Return-Path: <SRS0=qjf9=C3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA7EC43465
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Sep 2020 13:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64A2820872
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Sep 2020 13:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="G7OaI49U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64A2820872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D7B6ECE2;
	Fri, 18 Sep 2020 13:25:13 +0000 (UTC)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2F46ECE2
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2020 13:25:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m6so5645602wrn.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2020 06:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UBx1PEmn0W4aDiCsFb5YFigHJoHIwLLzOZ1tXmUxyJc=;
 b=G7OaI49UWbNUKXHTKQeo5alyNmun03V6bN+GnHogC+Ep7LFe1X2G4zGD/dhLy1SgRu
 gW9EvNLJGZiorbCOUuBCvgz4sw0q9XlemKqMrCrjV0FzRw7LajzE5RerIUud29d4RSvR
 QSyz3t3+hPmRBcFwvSizUKafcAbYNNiIWOCMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UBx1PEmn0W4aDiCsFb5YFigHJoHIwLLzOZ1tXmUxyJc=;
 b=m7YXNxOrbIiS88KbvPIPATaxA0cccPb6lirRqWIjcGtYPFlfTslQZ/VKrBLZLtn4xp
 O7d7RwPdgGZ9oheqB30Tj8RZ8nZAxmeaAeLHssXPeZ8k1creD+6KKpo76bZt7iuCr1Pe
 jMcZ/wqeTkrViB83Rk4o8RJ9fUMEJ15Sidjn+mDvTTjtiaEyuvOPjdvqhXkcj2CIpMbN
 fid0WmOZSgx5xQjO6YNHXwlYlPjpnE+kHgwP3Imh1rYAz/r7/NeLhs1Sewb51hOVm6ev
 pu7BpfwpJVwMn0c2BIf5po/VwMiisVzpMo44iOTPALmOoRiT4ho/1Vl46TyJ4HVeYoQD
 nh9w==
X-Gm-Message-State: AOAM5335kPLdLcmNgzDS+ogokHqWwsIk220CLhc+Y2rXD32GmdZXoisY
 I9QKmlOR2GNfIstLEwWHmWbN+w==
X-Google-Smtp-Source: ABdhPJzi29RcoloJdDY7B+Pk6hmy9TeacocMO63nWs80KfgVLp4l18Ve5k6EzSNBv5IQwFlhykY9/Q==
X-Received: by 2002:adf:e6c2:: with SMTP id y2mr40238845wrm.117.1600435510935; 
 Fri, 18 Sep 2020 06:25:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k6sm4872693wmi.1.2020.09.18.06.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 06:25:10 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Fri, 18 Sep 2020 15:25:01 +0200
Message-Id: <20200918132505.2316382-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/4] managed drm_device,
 absolute final leftover bits
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi all,

These are the leftovers of the leftovers of my initial drmm series to
manage drm_device.

Changes:
- bugfixed i915 selftests
- patch from Luben to finalize the admgpu conversion

Alex & i915 maintainers, pls ack for merging this all through
drm-misc-next since otherwise the final patch (and the resulting confusion
with outdated docs) is held up another round.

Cheers, Daniel

Daniel Vetter (3):
  drm/i915/selftest: Create mock_destroy_device
  drm/i915/selftests: align more to real device lifetimes
  drm/dev: Remove drm_dev_init

Luben Tuikov (1):
  drm/amdgpu: Convert to using devm_drm_dev_alloc() (v2)

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 16 ++----
 drivers/gpu/drm/drm_drv.c                     | 41 ++--------------
 drivers/gpu/drm/drm_internal.h                |  1 +
 drivers/gpu/drm/drm_managed.c                 | 13 -----
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
 .../drm/i915/gem/selftests/i915_gem_context.c |  2 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  2 +-
 .../drm/i915/gem/selftests/i915_gem_object.c  |  2 +-
 .../drm/i915/gem/selftests/i915_gem_phys.c    |  2 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
 .../gpu/drm/i915/selftests/i915_gem_evict.c   |  2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |  2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c     |  2 +-
 .../drm/i915/selftests/intel_memory_region.c  |  2 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  | 49 ++++++++++++-------
 .../gpu/drm/i915/selftests/mock_gem_device.h  |  2 +
 include/drm/drm_drv.h                         |  4 --
 18 files changed, 51 insertions(+), 97 deletions(-)

-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
