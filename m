Return-Path: <SRS0=VOyE=K4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B533FC4708F
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Jun 2021 13:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56E2561263
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Jun 2021 13:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56E2561263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FD26E107;
	Wed,  2 Jun 2021 13:10:02 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84556E107
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Jun 2021 13:10:01 +0000 (UTC)
IronPort-SDR: QYHwjY4Q3H5myYqVewl8ze6TDVQAOiHcAYZjpg7rYxF/XIfpkNEZ3TNu7KI/4TwVpm+TzxV5dH
 KJuCJLGnHOCg==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="201923027"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="201923027"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 06:10:01 -0700
IronPort-SDR: gbHxhUn4lMzFvpqEwCzPPNrbB778ibeehWssthkhFF+5xLIrWz6BOtJUUD52k/BkCMLscgAlo3
 193hSMH6KojQ==
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="399719222"
Received: from unknown (HELO Nischal-desktop.iind.intel.com) ([10.223.74.174])
 by orsmga003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2021 06:09:58 -0700
From: Nischal Varide <nischal.varide@intel.com>
To: intel-gfx@lists.freedesktop.org, nischal.varide@intel.com,
 uma.shankar@intel.com, anshuman.gupta@intel.com, jani.nikula@intel.com
Date: Wed,  2 Jun 2021 11:47:38 +0530
Message-Id: <20210602061739.29134-1-nischal.varide@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210526181728.14817-2-bhanuprakash.modem@intel.com>
References: <20210526181728.14817-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 0/1] Enabling dithering after the CC1
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

If the panel is 12bpc then Dithering is not enabled in the Legacy
dithering block , instead its Enabled after the C1 CC1 pipe post
color space conversion.For a 6bpc pannel Dithering is enabled in
Legacy block.

This is Version 2 of the patch, after addresing few review comments.

Nischal Varide (1):
  drm/i915/xelpd: Enabling dithering after the CC1

 drivers/gpu/drm/i915/display/intel_color.c   | 7 +++++++
 drivers/gpu/drm/i915/display/intel_display.c | 7 ++++++-
 drivers/gpu/drm/i915/i915_reg.h              | 1 +
 3 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
