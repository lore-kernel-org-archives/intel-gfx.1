Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160B2C55179
	for <intel-gfx@archiver.kernel.org>; Mon,  3 Aug 2026 13:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B7310E6B7;
	Mon,  3 Aug 2026 13:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.srl header.i=@kernel.srl header.b="jYflg1Y/";
	dkim-atps=neutral
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DC210E1E5
 for <intel-gfx@lists.freedesktop.org>; Sun,  2 Aug 2026 17:06:55 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47f7027ca11so1606367f8f.3
 for <intel-gfx@lists.freedesktop.org>; Sun, 02 Aug 2026 10:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel.srl; s=google; t=1785690414; x=1786295214; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lHAtSD2vdw7vGnmR70Y4vTxd424et6OwpRuM3OOoWnc=;
 b=jYflg1Y/f86FgDMvfTWPGiD5gyKizi08FxVB6GMrOF+19HlY9eqE2A1CPFHjfmpDTe
 UMF3a9l+8KGiz7TCWb9LeV1T94ofJktJu46FpXCza/ZqYpOg/QG1lIxz4iI628lCKSxU
 XOW5lNsWku1XPw4z/5FkT8iHYZEcAx1D/6RCZcSPv++LjQy7KRP4yhf9c2HFx2DSMuqL
 8idP3lzaibyU8I/iRpiBWldkJx8eiAGYm2kGsMM3FsIqevtl/kC+OblPjbe4h+4Uc8GU
 1GvJq+aUWm2W1gmXTAb2DHldOL4RSCdpcvtu4FMeJTvAq5rkVm8JIfv8g+3YUdYIJ+Ft
 u9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785690414; x=1786295214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lHAtSD2vdw7vGnmR70Y4vTxd424et6OwpRuM3OOoWnc=;
 b=sjK91TqrGQP4MtZ5E+0F0Gin/a5Mvg8rjuNzyx4+RgiOEsU67wr1M3B0GzCS3e7hnh
 rgMLKh4YSEvoUfBa/fI51RFqqcUuLzgL2L0Otb67vJl0j/WEvds/EkR6/jxb8sCHIK0h
 xYCvk2u/r+W7DqtANVjxsvlOoyLjr5aa1qwbpNNr/QpikA9cZVn/eC3i4Ik3ufYJpm9n
 vMvs/8/e/XQHduO9iuEJ/KjWKVdd1U0syT/YUt/R97+gPjKuPYxcjKOcFM5QTdd6k1RL
 wZoZS7RI28sdH2XRUGKA1GRg5mgpC/uQKIoruokwYJnmHj28KC25/WK4wILZWKrk6twy
 099Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr6UuyvFjM499xWR2n2P7Rif2og4Va4iIX7INHLkWzZ7jwNUT7Plu87DtqbhyaaNLjK1OLHORu3ORE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1aQ1BL1rkP5yWeZNOojvAG7rmLt4CXMBqoleoZV/RN5PdUOXV
 AYMKNPnEZuRgjTdmLCiiumot/JDe76Chho3O5H16OXxVdeZOkg8ZDBUWahAOiTUcf35jpb9+d26
 hx4WmZeyz4A==
X-Gm-Gg: AR+sD126joRMjxPqSPiD+d6gVe+PtWe4RnchzreQSs3Jk8QCur+8xG1TLlu6ahem8ya
 wKEVE1PpGXHucpD+PAUAmj2GpakrcwjPTliw08i46hnH0kHI1KnTx1a1cmWK1h8pNMU0gUf6Ddu
 e+0/N7rkz0h94hiLJjJ8rcOYgaaVFk7lZCw5sYOVWXr94EI7D08NjG6oh5qrLS8+UZV8LyGp1lj
 vQ2hy1L41wukEZN5UrkJx35L57+YCaenUpsK+egFWmOsFvAz5F7cHIXo02R1PvqbLKNZeT7cKP0
 yeQOzWHP81+h109/QmUNuixhbhddGAB+qVE1TzuKehkkd7o5qg4xqMGUr1B9yAV8XmhOs97eka7
 sd0+4Xet+T9CT1/Os5Iwn1/z0aiAAbsKetS/Gsc381Nuy84f8rQZn+hPenFPo/RIbA55O6wsmfh
 wcw4LLdjJOH4MjYBoGq2Ma5bGty+PFO/6m/YyWHvz4Sluwl7SPlBr7D29mNgli7tMEHwDlyOvKr
 VLUcNxGrLRjrbXm/knq2U6+4ihykLpyNkQ0yjhxVbpgfOHA2GgeJLWsIpxfhqWBthsfdrzZehNd
 CVMzj/SST3QvP+/u99wmGDZcB7s/KLGgTBoSI5s1dfVq7TDUcapxD6wFwKa066D2VpXKtLjQzJU
 Jwv+YBgu6tUvBWueetEQN9aSBAWLpvLForPRPgYkWFOWEoAim4w==
X-Received: by 2002:a05:600d:8492:b0:496:c2fd:1731 with SMTP id
 5b1f17b1804b1-4980c64b96dmr102723465e9.1.1785690413324; 
 Sun, 02 Aug 2026 10:06:53 -0700 (PDT)
Received: from KITT.minareto (host-95-230-187-130.business.telecomitalia.it.
 [95.230.187.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b6745csm161687225e9.7.2026.08.02.10.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 10:06:52 -0700 (PDT)
From: Cristian La Spina <cristian.laspina@kernel.srl>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Cristian La Spina <cristian.laspina@kernel.srl>
Subject: [PATCH 0/2] drm: luminance range from DisplayID 2.0
Date: Sun,  2 Aug 2026 19:06:45 +0200
Message-ID: <20260802170647.206880-1-cristian.laspina@kernel.srl>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 03 Aug 2026 13:11:48 +0000
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

The eDP panel in the Lenovo Yoga 9 2-in-1 14IPH11 declares its luminance
range only in the DisplayID 2.0 Display Parameters block, with no CTA
extension at all. The core ignores those fields, so i915 refuses the
Intel HDR backlight interface and falls back to PWM, which drives
nothing on this OLED panel: brightness cannot be changed at all.

Patch 1 reads the range in the core, patch 2 lets i915 use it whatever
its source. Patch 2 depends on patch 1, so the series should go through
one tree.

Based on drm-misc-next.

Cristian La Spina (2):
  drm/edid: read the luminance range from DisplayID 2.0
  drm/i915/display: accept a luminance range from any source

 drivers/gpu/drm/drm_edid.c                    | 47 +++++++++++++++++++
 .../drm/i915/display/intel_dp_aux_backlight.c | 17 ++++---
 include/drm/drm_connector.h                   |  3 +-
 3 files changed, 57 insertions(+), 10 deletions(-)

-- 
2.52.0

