Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DF1C433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Feb 2022 10:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB1010E51B;
	Mon, 14 Feb 2022 10:56:03 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C6310E51B
 for <intel-gfx@lists.freedesktop.org>; Mon, 14 Feb 2022 10:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644836162; x=1676372162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jLjHRcpYJOjOojNdPtzUfYIL0v/oWQZt/N1N5SEyrWU=;
 b=ek4/Hy8dxXgO5CiA1mGg8z6N8YXSBFkyZvJ8uz/AmyXsd9EBXPGKcIEr
 JlxDG3A2QFh5esA4HGb8fqD0Wo5UuPzfAoxWJ+xAOcwrDWwn7MnSYROyE
 xI+mNng8fmlQZhqbkE8QSP+g7SQ47+N0NQNxqxLYkpu6Q2Z8ntXLDfJbo
 jZ96DoC52bRUr99f3pEJIb0V9jYFO6zuy3dgo8bvwKeeLoV6pr9ltl21l
 kWgMhxyGwe5qjUWZGlMMUeAC0rI3/MVvIvGZvRkdluBUk597vSm5Ii6X3
 sjiJY3FXam0QpYTtQEg8l+Od45dYqAlLynTCy7B6fJoPwA3J8IFvTBvnZ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="247659883"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="247659883"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:55:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="624130151"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by FMSMGA003.fm.intel.com with SMTP; 14 Feb 2022 02:55:33 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 14 Feb 2022 12:55:32 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 14 Feb 2022 12:55:28 +0200
Message-Id: <20220214105532.13049-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/4] drm/i915: Fix async flip wm0/ddb
 optimization
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

Turns out the async flip wm0/ddb optimization doesn't work
at all currently. Let's fix it. It also had problems with
leaving SAGV on mistakenly but those were handled via a
separate series since it was a more generic issue.

Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

Ville Syrjälä (4):
  drm/i915: Don't skip ddb allocation if data_rate==0
  drm/i915: Check async flip capability early on
  drm/i915: Fix the async flip wm0/ddb optimization
  drm/i915: Pimp async flip debugs

 drivers/gpu/drm/i915/display/intel_atomic.c   |   1 +
 .../gpu/drm/i915/display/intel_atomic_plane.c |   5 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 180 ++++++++++++++----
 .../drm/i915/display/intel_display_types.h    |   6 +-
 drivers/gpu/drm/i915/intel_pm.c               |  30 ++-
 6 files changed, 158 insertions(+), 68 deletions(-)

-- 
2.34.1

