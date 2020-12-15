Return-Path: <SRS0=+CuI=FT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACFCC4361B
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Dec 2020 07:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF48222273
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Dec 2020 07:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF48222273
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156756E162;
	Tue, 15 Dec 2020 07:44:25 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37ECD6E162
 for <intel-gfx@lists.freedesktop.org>; Tue, 15 Dec 2020 07:44:23 +0000 (UTC)
IronPort-SDR: WkCyfrDDTP4dJYQS9zAj4ByMW4VcemFHbfEp/P+lLabMC3Udm0nz2g9AQhPd9iqgFXYICBwLCF
 L/dyhY21YPIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="259567356"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="259567356"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 23:44:22 -0800
IronPort-SDR: mo4GUa9hRmQyq4KxwjfI0KUo0Xou9MLv7zuLUCUkt7cgCu2K09kd/UWB4YcEb5c5eXRkJxIzMd
 6qOxnJHCnREQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="336593446"
Received: from amanna.iind.intel.com ([10.223.74.93])
 by orsmga003.jf.intel.com with ESMTP; 14 Dec 2020 23:44:21 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 15 Dec 2020 12:57:09 +0530
Message-Id: <20201215072712.12723-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/3] Multi DSB instance support
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

As an enhancement of dsb multi instance support added which can be
used by color framework for big lut programming in future.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>

Animesh Manna (3):
  drm/i915/dsb: multi dsb instance support in prepare() and cleanup()
  drm/i915/dsb: multi dsb instance support in dsb-write()
  drm/i915/dsb: multi dsb instance support in dsb-commit()

 drivers/gpu/drm/i915/display/intel_atomic.c   |   9 +-
 drivers/gpu/drm/i915/display/intel_color.c    |  40 ++--
 drivers/gpu/drm/i915/display/intel_display.c  |   6 +-
 .../drm/i915/display/intel_display_types.h    |   2 +-
 drivers/gpu/drm/i915/display/intel_dsb.c      | 183 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_dsb.h      |   4 +-
 6 files changed, 134 insertions(+), 110 deletions(-)

-- 
2.26.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
