Return-Path: <SRS0=zXYq=KV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239FFC47087
	for <intel-gfx@archiver.kernel.org>; Wed, 26 May 2021 00:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDAFC6140B
	for <intel-gfx@archiver.kernel.org>; Wed, 26 May 2021 00:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDAFC6140B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3159E6EB82;
	Wed, 26 May 2021 00:07:08 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2D76EB80
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 May 2021 00:07:06 +0000 (UTC)
IronPort-SDR: ynKc1qWUL3LXWVP5XMasJDkvvHBecQiVIOIh80y9RanwTqF7uZvtjWnAFtMhNSppQdpiPk5zw5
 CnTbo3FNPWAw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="189459141"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="189459141"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 17:07:04 -0700
IronPort-SDR: 0+4OESAjv+Wb+0ehHqszkjk/rXTzgvPFJvzCz0vy5mYbyBgRM7EoMU00sdiob6BGQ0d4v83bSl
 80Izan50cB0A==
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="414231979"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.168])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 17:07:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 25 May 2021 17:06:53 -0700
Message-Id: <20210526000656.3060314-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 0/3] Another small batch of reviewed Xe_LPD patches
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

Another small collection of Xe_LPD patches that have r-b's now and just
need another CI pass to merge.

Gwan-gyeong Mun (1):
  drm/i915/display: Remove a redundant function argument from
    intel_psr_enable_source()

Manasi Navare (1):
  drm/i915/xelpd: Add VRR guardband for VRR CTL

Matt Roper (1):
  drm/i915/xelpd: Enhanced pipe underrun reporting

 drivers/gpu/drm/i915/display/intel_display.c  |  8 ++-
 .../drm/i915/display/intel_display_types.h    |  2 +-
 .../drm/i915/display/intel_fifo_underrun.c    | 57 ++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_psr.c      |  7 +--
 drivers/gpu/drm/i915/display/intel_vrr.c      | 58 +++++++++++++------
 drivers/gpu/drm/i915/i915_drv.h               |  3 +
 drivers/gpu/drm/i915/i915_irq.c               | 19 +++++-
 drivers/gpu/drm/i915/i915_irq.h               |  1 +
 drivers/gpu/drm/i915/i915_reg.h               | 11 ++++
 9 files changed, 133 insertions(+), 33 deletions(-)

-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
