Return-Path: <SRS0=bDtt=DG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DA5C2D0A8
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2020 00:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 445EE21531
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2020 00:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 445EE21531
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BFA89D63;
	Tue, 29 Sep 2020 00:29:35 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691B389D63
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Sep 2020 00:29:34 +0000 (UTC)
IronPort-SDR: iVMzsxq/SGOyzsFYs6iebRZZFbxgpd/uNxY4zEot5vNm0yiFQzwYv6M4kJts52XAQmdKyqjxx5
 uVPWL6uC4Stg==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="180242824"
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="180242824"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 17:29:32 -0700
IronPort-SDR: E+1bvPcvc8Pg81hFTeeH08wrz3wuIwZqXRp6zXw0112cFIO3q9SxacxVCiIu/g4b389h+AJVT2
 9gLI5E0Ybmxg==
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="488817646"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 17:29:31 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 29 Sep 2020 03:29:24 +0300
Message-Id: <20200929002929.783620-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/5] drm/i915/tgl: Fix Combo PHY DPLL fractional
 divider for 38.4MHz ref clock
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

This patchset replaces [1], adding also a workaround for TGL BIOSes that
don't apply Display WA #22010492432. The first patch fixes an incorrect
BIOS PDIV programming I noticed while testing this patchset on an ASUS/SKL
system.

[1] https://patchwork.freedesktop.org/series/79486/

Imre Deak (5):
  drm/i915/skl: Work around incorrect BIOS WRPLL PDIV programming
  drm/i915: Factor out skl_wrpll_calc_freq()
  drm/i915/icl: Cross check the combo PLL WRPLL parameters wrt.
    hard-coded PLL freqs
  drm/i915/tgl: Fix Combo PHY DPLL fractional divider for 38.4MHz ref
    clock
  drm/i915/tgl: Add workaround for incorrect BIOS combo PHY DPLL
    programming

 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 232 ++++++++++++------
 drivers/gpu/drm/i915/i915_reg.h               |   4 +
 2 files changed, 161 insertions(+), 75 deletions(-)

-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
