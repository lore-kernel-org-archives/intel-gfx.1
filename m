Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12432C77B70
	for <intel-gfx@archiver.kernel.org>; Mon, 17 Apr 2023 13:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB1710E4DC;
	Mon, 17 Apr 2023 13:17:34 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEDB10E4DC
 for <intel-gfx@lists.freedesktop.org>; Mon, 17 Apr 2023 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681737452; x=1713273452;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zIRYvwz36Y3COhg/BIIRRrvnCsZMl0qiQLMIKbwC/Ok=;
 b=SP8PN3ER5ppoxPlabiGPSaEoNUS/ysLqKa6v/EDQfYmpsIlGhtwzas1f
 kFJ2u6X4MzrMBi5YF1tM1dvAV4eVFWJljqChRSd0+OY4+qXtzSx6a8vJE
 O6VyC5Y/WE+ajWAZS6nBLw/neZhMjLU9YQbLGtbRB+CGIjjTwCvyPE1Ld
 USj8BCPYgydpC79NMgSE2t3E7IVjHGyaVP7ZltO/71hFc2fiO7b97c/7P
 ocDKdzEqYra8K+aPco2FxKwIehJZGpZP/WuBYnyWh/67ss6YuMw+B0UXH
 qzVZewZn/35nbu3bBU2PoVARoGbNGkNTwEJ+5MmGzu8CzVC5wj1nJc5I7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="329057563"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="329057563"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 06:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="640953193"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="640953193"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga003.jf.intel.com with SMTP; 17 Apr 2023 06:17:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 17 Apr 2023 16:17:28 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 17 Apr 2023 16:17:24 +0300
Message-Id: <20230417131728.7705-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 0/4] drm/i915: Check HPD during eDP probe
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Remainder of the eDP HPD check series, now rebased on top
of MTL HPD stuff.

Ville Syrjälä (4):
  drm/i915: Introduce <platform>_hotplug_mask()
  drm/i915: Introduce intel_hpd_enable_detection()
  drm/i915: Check HPD live state during eDP probe
  drm/i915: Reuse <platform>_hotplug_mask() in .hpd_detection_setup()

 drivers/gpu/drm/i915/display/intel_dp.c |  28 ++
 drivers/gpu/drm/i915/i915_irq.c         | 383 +++++++++++++++++++-----
 drivers/gpu/drm/i915/i915_irq.h         |   2 +
 3 files changed, 341 insertions(+), 72 deletions(-)

-- 
2.39.2

