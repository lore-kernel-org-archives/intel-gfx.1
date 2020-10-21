Return-Path: <SRS0=oW1W=D4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4FCC56201
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2020 08:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6F2722249
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2020 08:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6F2722249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C13E6F479;
	Wed, 21 Oct 2020 08:21:59 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C7C6EA7B
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Oct 2020 08:21:49 +0000 (UTC)
IronPort-SDR: 5SQLOttMee5gbzxLOxJZVLKjd0BvyG7VQCfOoQajJOnO3nrmBNz28pKb7eb2CSbwwtZw2caFbS
 dALEwkDjxotg==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="167452508"
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; d="scan'208";a="167452508"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 01:21:49 -0700
IronPort-SDR: u6+LHnN8caVefK56qKwX1nxZSxLiElkG14qmW5I7cVELPqTacF1hMGVs2Wh+Rz8TH7WGCTI7J0
 uPHkGmAzbPKw==
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; d="scan'208";a="316303289"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 01:21:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 21 Oct 2020 01:20:28 -0700
Message-Id: <20201021082034.3170478-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/6] dg1: remaining basic enabling patches
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

These are the remaining patches from
https://patchwork.freedesktop.org/series/82594/

Main change here is how we enable hpd interrupt handling since that
changed on recent refactors for other platforms. This commit is
currently not tested as for DG1 we are still missing the lmem part and
other bits to get a usable drivers. I will test it soon with the rebased
patches and update here.

I'm also a couple of WAs that were added/changed to the spec.

Aditya Swarup (1):
  drm/i915/dg1: Enable ports

Clinton A Taylor (1):
  drm/i915/dg1: invert HPD pins

Lucas De Marchi (3):
  drm/i915/dg1: add hpd interrupt handling
  drm/i915/dg1: map/unmap pll clocks
  drm/i915/dg1: make Wa_22010271021 permanent

Swathi Dhanavanthri (1):
  drm/i915/dg1: Implement WA_16011163337

 drivers/gpu/drm/i915/display/intel_ddi.c     | 105 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_display.c |  33 +++++-
 drivers/gpu/drm/i915/gt/intel_workarounds.c  |  21 ++--
 drivers/gpu/drm/i915/i915_irq.c              |  46 ++++++--
 drivers/gpu/drm/i915/i915_reg.h              |  27 +++++
 5 files changed, 209 insertions(+), 23 deletions(-)

-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
