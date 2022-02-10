Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81751C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Feb 2022 06:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58E589DA7;
	Thu, 10 Feb 2022 06:24:08 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E5889DA7
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Feb 2022 06:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644474247; x=1676010247;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WhWgP64koVdQiilPN9ueWX/rVxtJTyDPwfVJM4Li74k=;
 b=fD2GrKptD9Z1Y4yxRjKLlOPHe79fIWwoq3PxMblw4QamJ3PUpShpwmoF
 0ZZC2G7kkNYA92RFslkIEG8ZNbLY3dKGFx9MBrPZEubjyWyH1RmG4SN/1
 P2dnsjQNT0qq7/ocvW9L7wfZkWUGvdBBDpMyHeBOwQ1q0djPTp9MouSn9
 iscKWfp/BocQu53Boagz8+ptN78h13alc8JlYy64PU69fajugm7mTcI+t
 I3oNGr15tCKKQRJawN/QCll0bDOIL4yh+7am+ENW1/Erw7/U6rfRgtxqr
 g6QsU73dQL7srWpYEJAlo4blQtvxioAVnbwuDOezuQephJbEQ89WGfF5B w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="232984746"
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="232984746"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 22:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="629583373"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga002.fm.intel.com with SMTP; 09 Feb 2022 22:24:03 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Feb 2022 08:24:03 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 10 Feb 2022 08:23:58 +0200
Message-Id: <20220210062403.18690-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 0/5] drm/i915: Futher optimize plane updates
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

Optimize icl+ plane updates by moving most register writes
into the .update_noarm() hook. Also stop taking uncore.lock
for plane register writes as well.

Just a rebase.

Ville Syrjälä (5):
  drm/i915: Optimize icl+ universal plane programming
  drm/i915: Make skl+ universal plane registers unlocked
  drm/i915: Make cursor plane registers unlocked
  drm/i915: Make most pre-skl primary plane registers unlocked
  drm/i915: Make pre-skl sprite plane registers unlocked

 drivers/gpu/drm/i915/display/i9xx_plane.c     |  24 +--
 drivers/gpu/drm/i915/display/intel_cursor.c   |  10 -
 drivers/gpu/drm/i915/display/intel_sprite.c   |  45 ----
 .../drm/i915/display/skl_universal_plane.c    | 196 ++++++++++++------
 4 files changed, 147 insertions(+), 128 deletions(-)

-- 
2.34.1

