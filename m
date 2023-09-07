Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498A7EC8722
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Sep 2023 12:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED1410E7B6;
	Thu,  7 Sep 2023 12:26:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6AC10E7B6
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 Sep 2023 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694089560; x=1725625560;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jIiWFalP40vhoRVBioitPOmeLLI+myZ3tTNTnqb6h8g=;
 b=DsQldSufwRdQHLcoiJ0sHf7DJVPhOBlb+gsmCKJ8mt476VtCHCSASti7
 j5seQfX70adu8F3z/1dnky2ckOGRRYpRnGIMHcpnLRVND5Kx8dQk7i0Gc
 tRrDZ5STe05TyALKnTMh3Xm5DauL8HfGa+5Xl6BfUtL/wMXFXAlAfbjJH
 wWH1WRhllL7QigaGAIw/F42nSHPFc7d74Q32R8eoi1HIcfXhP+Su+hKnR
 Wh077XBdgBqFo69KLJkwz383BlJmFJu1FtYTshNG/4obj8ZEK4gG+DclR
 LZq3k9VNiJx1bk7zQsbYiQY8mm2lpkX+SKqrez9s4JJJx/RoxGZ8FiiIN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="377252950"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="377252950"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 05:25:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="777051266"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="777051266"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga001.jf.intel.com with SMTP; 07 Sep 2023 05:25:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Sep 2023 15:25:41 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  7 Sep 2023 15:25:38 +0300
Message-ID: <20230907122541.32261-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/3] drm/i915: Slightly more atomic multi-pipe
 commits
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

Attempt at making synced multi-pipe commits a bit more atomic.

Ville Syrjälä (3):
  drm/i915: Drop redundant !modeset check
  drm/i915: Split intel_update_crtc() into two parts
  drm/i915: Do plane/etc. updates more atomically across pipes

 drivers/gpu/drm/i915/display/intel_display.c | 40 ++++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

-- 
2.41.0

