Return-Path: <SRS0=FeUR=OL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E05C433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 15:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 642BD61186
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 15:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 642BD61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFDE6EA1B;
	Tue, 21 Sep 2021 15:25:23 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100AF6EA1B
 for <intel-gfx@lists.freedesktop.org>; Tue, 21 Sep 2021 15:25:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="203542043"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="203542043"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 08:25:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="549533197"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 21 Sep 2021 08:25:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Sep 2021 18:25:17 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 21 Sep 2021 18:25:13 +0300
Message-Id: <20210921152517.803-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 0/4] drm/i915/fbc: Rework CFB stride/size
 calculations
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

The way we calculate the CFB stride/size is kind of a mess, and
I'm not sure if we're even allocating enough stolen memory always.
Let's make it all more straightforward, and add some new related
workarounds as well.

Some of the earlier patches already got merged, and for these
leftovers I respun the min cfb stride calcualtion a bit to be
more explicit. Mainly hoping that I can still figure out what
it's doing after a few years have passed.

Ville Syrjälä (4):
  drm/i915/fbc: Rework cfb stride/size calculations
  drm/i915/fbc: Align FBC segments to 512B on glk+
  drm/i915/fbc: Implement Wa_16011863758 for icl+
  drm/i915/fbc: Allow higher compression limits on FBC1

 drivers/gpu/drm/i915/display/intel_fbc.c | 200 +++++++++++++++--------
 drivers/gpu/drm/i915/i915_drv.h          |   4 +-
 drivers/gpu/drm/i915/i915_reg.h          |   4 +
 3 files changed, 139 insertions(+), 69 deletions(-)

-- 
2.32.0

