Return-Path: <SRS0=y0J5=DF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D894EC47420
	for <intel-gfx@archiver.kernel.org>; Mon, 28 Sep 2020 08:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9238920738
	for <intel-gfx@archiver.kernel.org>; Mon, 28 Sep 2020 08:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9238920738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8E889FD4;
	Mon, 28 Sep 2020 08:17:34 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D52489FD4;
 Mon, 28 Sep 2020 08:17:33 +0000 (UTC)
IronPort-SDR: h8zdU7T/gj6tuCTwAzUtdVoZdLpkQ9M3ozpPdPFH2nHRz/jBqDzGI07opOGnShQuzTs/aKlvFh
 SqDdezgI20fA==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="226107871"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="226107871"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 01:17:32 -0700
IronPort-SDR: kYVQuW7GLVYq8nQNU0100Q5LUSITzTOIv2n1EBlMuB0tCSFs9CJsSedOtPseZB7nTnMeSmfqbo
 WBfRdvrTHKrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="414908891"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2020 01:17:28 -0700
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, james.ausmus@intel.com,
 matthew.d.roper@intel.com, jose.souza@intel.com,
 ville.syrjala@linux.intel.com, lucas.demarchi@intel.com,
 hariom.pandey@intel.com
Date: Mon, 28 Sep 2020 13:39:29 +0530
Message-Id: <20200928080931.246347-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/2] drm/i915/jsl: Update JasperLake Voltage
 swing table
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

Patch series covers following things:

1. Split and differentiate between EhlkhartLake and
   JasperLake platfrom
2. Update voltage swing table for eDP on JasperLake platform
BSpec: 21257

Tejas Upadhyay (2):
  drm/i915/jsl: Split EHL/JSL platform info and PCI ids
  drm/i915/edp/jsl: Update vswing table for HBR and HBR2

 drivers/gpu/drm/i915/display/intel_ddi.c | 67 ++++++++++++++++++++++--
 drivers/gpu/drm/i915/i915_drv.h          |  4 +-
 drivers/gpu/drm/i915/i915_pci.c          |  9 ++++
 drivers/gpu/drm/i915/intel_device_info.c |  1 +
 drivers/gpu/drm/i915/intel_device_info.h |  1 +
 include/drm/i915_pciids.h                |  9 ++--
 6 files changed, 84 insertions(+), 7 deletions(-)

-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
