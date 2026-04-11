Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458BFF3ED59
	for <intel-gfx@archiver.kernel.org>; Sat, 11 Apr 2026 17:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD36A10E20F;
	Sat, 11 Apr 2026 17:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZVaTNhc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F8310E20F
 for <intel-gfx@lists.freedesktop.org>; Sat, 11 Apr 2026 17:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775929574; x=1807465574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iK3+rTI7hSBSAlZnWatuTDWCxfEYzlubU9CSBzI4KxU=;
 b=lZVaTNhcdlJhrWyjS77hpl9Q8nQYC8B4Z6LLzdpNYzT1uCSFJwHLe+TV
 4NprZcR5Ghl8oTX4Y0r9C9SkYvImh1XL2adzf+WioFPRCFi03JYsErkRw
 jXDCRb/HNlz57RW1x5674SNDksljyXzKBdRAj2So0WpZCrGK/pi9Y76nH
 6wrhUWaaWB8w330sp2+lkitrmHR0ovjN5w7OW46jMa0MpwQETr63OPwJI
 Z3vNLQoaVoFtGaP9JUjNrCTTnNAGQHCf7j6SDm5pQJik6uLFQIsfDu+hU
 X/z6GWJrExf3QHrJQIzRaZuYn9G0e2U8BABcwScxvbUa77OEs+By4lhLf Q==;
X-CSE-ConnectionGUID: 4z90O/88QuuvIHpMuDaDHQ==
X-CSE-MsgGUID: HKXYG0SDQwyaRE3Tm8d65g==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="99564210"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="99564210"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2026 10:46:13 -0700
X-CSE-ConnectionGUID: 91yWkKyUTJKaqpKU6OhmFg==
X-CSE-MsgGUID: XmkR/voyQl+2UtE5Ia0wtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="222899820"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa009.fm.intel.com with ESMTP; 11 Apr 2026 10:46:11 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 00/10] drm/i915: casf & scaler refactoring
Date: Sat, 11 Apr 2026 19:45:16 +0200
Message-ID: <20260411174526.2850179-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
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

Next version of [1]. This series doesn't unify casf with nearest
neighbor filter code.

Changelog:
v1->v2
- rename intel_casf_scaler_compute_coef()
- check if any scaler was found (Ville)
- apply the rename to nearest neighbor filter (Ville)

BR,
Michał

[1] https://lore.kernel.org/intel-gfx/20260328143212.601656-1-michal.grzelak@intel.com/


Michał Grzelak (10):
  drm/i915/casf: fix comment typos
  drm/i915/casf: rename *_coeff*() into *_coef*()
  drm/i915: rename t into tap
  drm/i915/casf: rename sumcoeff into sum_coeff
  drm/i915/scaler: s/i/scaler_id where appropriate
  drm/i915/scaler: remove id in favor of scaler_id
  drm/i915/scaler: unloop scaler readout that is run once
  drm/i915/scaler: invert loop's breaking logic
  drm/i915/scaler: abstract scaler searching loop
  drm/i915/scaler: eliminate dead code

 drivers/gpu/drm/i915/display/intel_casf.c | 32 +++++-----
 drivers/gpu/drm/i915/display/skl_scaler.c | 74 ++++++++++++-----------
 2 files changed, 55 insertions(+), 51 deletions(-)

-- 
2.45.2

