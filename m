Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5B5C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Feb 2022 10:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B28E10E975;
	Thu, 17 Feb 2022 10:32:25 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8285310E975
 for <intel-gfx@lists.freedesktop.org>; Thu, 17 Feb 2022 10:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645093944; x=1676629944;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zOZA7qOPxLod+HsCAVMdYWHzn+PZnNEyfYSt1ZGX9jA=;
 b=nhzJTTE1AymxJkgO3Vcq33zsUP+34shGaz+s5h9Sbhp2SR3vKQyB9zwS
 bi5nxzB9XMxNfR1I+jReNBLK7VoC6Ttr6/d3K4hxBAHK5jMdwYlSPEQkK
 kcaCeiIll204qC095weoUBgKbYZgN702Lj7NiNB4lXCF+kVMfsdemRuaV
 gHDsRNxmWFZKe2EleZZt1F0TzD+jlpbtjDpAaSHUOw/3kuv8N3vOAZlHn
 0YRoXf28+CO/J7kN6UTE+t0/P7LFjZVXxzapIv5LTzFN1uCBl6DwXPvPe
 ezMXa8amuLLn6GWcYP7UhfojwUQxhbYz7TvuUHF2Ymb6Q/kDUcZPD+zO/ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="337288890"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="337288890"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 02:32:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="503444921"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga002.jf.intel.com with SMTP; 17 Feb 2022 02:32:22 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 17 Feb 2022 12:32:21 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 17 Feb 2022 12:32:17 +0200
Message-Id: <20220217103221.10405-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/4] drm/i915: Fix disabled crtc state clearing,
 again
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

The latest bigjoiner pipesrc rect series ran into problems
due to stale junk left over in the state of disabled crtcs.

This was a mild surprise since I clearly remember addressing
that very issue a few years ago. Turns out the introduction
of bigjoiner undid that work, so now I get to restore it 
back to working order.

Also pimped the debugfs state dump a bit to help diagnose
such issues.

Ville Syrjälä (4):
  drm/i915: Dump the crtc hw state always
  drm/i915: Dump hw.enable and pipe_mode
  drm/i915: Remove odd any_ms=true assignment
  drm/i915: Properly clear crtc state when disabling it fully, again

 drivers/gpu/drm/i915/display/intel_display.c  | 10 +++++-----
 .../drm/i915/display/intel_display_debugfs.c  | 19 ++++++++++---------
 2 files changed, 15 insertions(+), 14 deletions(-)

-- 
2.34.1

