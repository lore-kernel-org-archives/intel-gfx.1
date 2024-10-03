Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABE6CF34A0
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Oct 2024 11:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DEF10E80C;
	Thu,  3 Oct 2024 11:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KSKZk325";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D19B10E80C;
 Thu,  3 Oct 2024 11:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727955188; x=1759491188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lctZBswY1qaa0QV/JzrmhiJG/GDAr7QWhxmnoiLBYvw=;
 b=KSKZk325sUeGc8vSX8S0rFPGR8VhgUEeQtV685aHLzx1FnlGrCKYD+Vl
 NUAaWlkXoyeOfxvSVzZvtV/SfyPrGMEOl5StnLzdHcQkLHUXaDUGR28n6
 +yEnWye1zkyr1tPiljLNTuDCshwUpZ4xEoohsAi5EnHUVS2/zLFAOYguK
 4NXQUTnogtvh6KpTSqew7/CS+/EKKc3AWMKJ6iJOwVvVkvfACMXoVVr+/
 8vuT0yBvQU20HuB1I7sEGt00uxRZ5axjdKIVYIXjBoKPaeshbRPAOqFVw
 21DnZB5EeUgfH0RyX+Q8DQ+DhYvfwbw8kVeNIGgkRHzmKJj5mLjHHi3PS g==;
X-CSE-ConnectionGUID: Sqw7qmo9SLi9FQDP8k1zIQ==
X-CSE-MsgGUID: /UAEfwnRQzSl2D7Iziin8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38502972"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="38502972"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:33:07 -0700
X-CSE-ConnectionGUID: 6sgb4V0QTdCOf9T4dTUT5g==
X-CSE-MsgGUID: PcPA3l4bSzWHtbmYxYKZkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74426449"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:33:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:33:04 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/8] drm/client: Stop using legacy crtc->mode and a bunch of
 cleanups
Date: Thu,  3 Oct 2024 14:32:56 +0300
Message-ID: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The most interesting part is the change to modes[] to solve
the lifetime issue so that we can stop using the legacy
crtc->mode for atomic drivers.

Additionally I included a bunch of cleanups, some of which were
inherited from https://patchwork.freedesktop.org/series/132051/

Ville Syrjälä (8):
  drm/client: Constify modes
  drm/client: Use array notation for function arguments
  drm/client: Streamline mode selection debugs
  drm/client: Make copies of modes
  drm/client: Stop using the legacy crtc->mode
  drm/client: s/new_crtc/crtc/
  drm/client: Move variables to tighter scope
  drm/client: s/unsigned int i/int i/

 drivers/gpu/drm/drm_client_modeset.c | 253 +++++++++++++--------------
 1 file changed, 125 insertions(+), 128 deletions(-)

-- 
2.45.2

