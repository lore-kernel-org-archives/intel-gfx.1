Return-Path: <SRS0=iOfG=LD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38880C47095
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Jun 2021 06:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03B3C6120F
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Jun 2021 06:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03B3C6120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1ABD6E039;
	Wed,  9 Jun 2021 06:45:46 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630956E039
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Jun 2021 06:45:45 +0000 (UTC)
IronPort-SDR: bjGtsnc09DjqQozniyXqKRdBrM8waVewb+HNvQP0WkYJZTUQWTZlVzBNe3laaMQldDg5JJhxc2
 Bz+8XgQwZjEQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="203161295"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="203161295"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 23:45:44 -0700
IronPort-SDR: 2WE+W9hZ0bCGqFDldYeNOm9V22TJvJBm1YhzVS13g2/K6ZBEu1ZOI3m4YP6xG+vbDq6Jc5lN7r
 ljVha5es66XQ==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="448183689"
Received: from nischal-desktop.iind.intel.com ([10.223.74.174])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 23:45:43 -0700
From: Nischal Varide <nischal.varide@intel.com>
To: intel-gfx@lists.freedesktop.org,
	nischal.varide@intel.com
Date: Wed,  9 Jun 2021 05:23:29 +0530
Message-Id: <20210608235330.21057-1-nischal.varide@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602061739.29134-2-nischal.varide@intel.com>
References: <20210602061739.29134-2-nischal.varide@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 0/1] Enabling dithering after the CC1
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

v3 : Addressed Review Comments by (Bhanu)

If the panel is 12bpc then Dithering is not enabled in the Legacy
dithering block , instead its Enabled after the C1 CC1 pipe post
color space conversion.For a 6bpc pannel Dithering is enabled in
Legacy block.

If the panel is 12bpc and display_ver < 13 then we can not enable
dithering at all.So this v3 version of the patch has added an extra 
check to fix it.

Nischal Varide (1):
  drm/i915/xelpd: Enabling dithering after the CC1

 drivers/gpu/drm/i915/display/intel_color.c   |  7 +++++++
 drivers/gpu/drm/i915/display/intel_display.c | 11 ++++++++++-
 drivers/gpu/drm/i915/i915_reg.h              |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
