Return-Path: <SRS0=0ugA=J2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A095C433B4
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 09:13:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09F2C6140C
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 09:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09F2C6140C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8BD6EDC2;
	Thu, 29 Apr 2021 09:13:03 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D41D6E1BC;
 Thu, 29 Apr 2021 09:13:02 +0000 (UTC)
IronPort-SDR: ZNYAF9ez9a7i6zS6HGYllTGicTDCpGv1DpevVG9xLbn/W7flIVQhH/E3743LWsVBQJXj5o/6dy
 2OL+PZF2X4kQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="197011291"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="197011291"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:13:01 -0700
IronPort-SDR: 2kjDPsjb5v70aD7/twL6J079dNnN8ajzzmdYt5+0pDPB6YqbzVpgXPWZiIShLggxM5K+cXmeTO
 A//aaoXYlOPQ==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="537298784"
Received: from gwaise-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.64])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:13:00 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Thu, 29 Apr 2021 10:12:48 +0100
Message-Id: <20210429091254.855248-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/6] Workaround building improvements
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Some cleanups and improvements to checks being done when building workaround
lists. First five patches are small cleanups while the last one contains the
actual story of what gets improved.

Test-with: 20210429084130.850426-1-tvrtko.ursulin@linux.intel.com

Tvrtko Ursulin (6):
  drm/i915: Drop duplicate WaDisable4x2SubspanOptimization:hsw
  drm/i915/debugfs: Expose read mask in i915_wa_registers
  drm/i915: Add a separate low-level helper for masked workarounds
  drm/i915/icl: Use appropriate helper for a masked workaround
  drm/i915/icl: Stop conflating mask and readback verify
  drm/i915: Add more checks when building workaround lists

 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 163 +++++++++++++-----
 .../gpu/drm/i915/gt/intel_workarounds_types.h |   4 +
 .../gpu/drm/i915/gt/selftest_workarounds.c    |   4 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   4 +-
 4 files changed, 124 insertions(+), 51 deletions(-)

-- 
2.30.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
