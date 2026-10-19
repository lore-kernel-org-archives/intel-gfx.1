Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074B2CCF2DE
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2026 13:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F7910ED22;
	Mon, 19 Oct 2026 13:15:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845C710ED00
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 13:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792415747; x=1823951747;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lvJV5HLD+1PwM9GXgRbFsJC49Vkzm57iTplEC8bDT7s=;
 b=b5740mQkomKPcxjXQPlE/0HzYa+zvzkk0497bSvjs+qBLRITahOJnRz7
 KX6xtDIHvf1MdG1LfsRjZlIkntvyYK9wRUysNEuwDDGF/cch8pR3wWV2M
 GGVsTZuBgbE5Z2ppf+7XJC9VqZqsVodaqeRg89Lv58iugTAsR/weaqstx
 vMj5nrkPjiqZxsFmKlX/rrZamqkDfeUx4DVpK02MjN7wNyg6PioB5YwBG
 TvvrLvj4PsWavuHYgDtd6ZLgHwkUnYL47QWZPP+40iWTZZxgYOHFOD1XN
 wd4JFj9huVo5tSMmgJ0WfqAaKOrkWSDh1HzO+OdJcKx+7yGolsWqzoKIj Q==;
X-CSE-ConnectionGUID: BymaGcoMSLKv6l2lzJDjBQ==
X-CSE-MsgGUID: tnl+GdMLRsWiFP7kqxXYUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1106049"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1106049"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:15:46 -0700
X-CSE-ConnectionGUID: 0iK5dqZrSmyjg8KwgmBumQ==
X-CSE-MsgGUID: L5CyLQgMRXaxZUP7O3Eq6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2870274"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:15:45 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915/rps: Boost code cleanup
Date: Mon, 19 Oct 2026 16:15:35 +0300
Message-ID: <20261019131542.28822-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The boost code is a bit of a mess. Clean it up.

Ville Syrjälä (7):
  drm/i915/rps: Flatten intel_rps_boost()
  drm/i915/rps: Increment rps->boosts with SLPC
  drm/i915/rps: Reorder the queue_work() vs. GT_TRACE()
  drm/i915/rps: Extract intel_guc_slpc_boost()
  drm/i915/rps: Move SLPC power profile checks into SLPC code
  drm/i915/rps: Extract rps_dec_waiters()/rps_boost()
  drm/i915/rps: Move 'slpc' variables into tighter scope

 drivers/gpu/drm/i915/gt/intel_rps.c         | 143 ++++++++++----------
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c |  27 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |   2 +-
 3 files changed, 97 insertions(+), 75 deletions(-)

-- 
2.55.0

