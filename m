Return-Path: <SRS0=SCM9=P4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74E2C433EF
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Nov 2021 00:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7589361107
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Nov 2021 00:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7589361107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BC76E0DA;
	Tue,  9 Nov 2021 00:26:56 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162396E0DA
 for <intel-gfx@lists.freedesktop.org>; Tue,  9 Nov 2021 00:26:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="212380493"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="212380493"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 16:26:50 -0800
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="544947743"
Received: from scao-mobl2.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.252.138.126])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 16:26:50 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  8 Nov 2021 16:26:43 -0800
Message-Id: <20211109002644.856688-1-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v3 0/1] Introduce new i915 macros for checking
 PTEs
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
Cc: michael.cheng@intel.com, wayne.boyer@intel.com, jani.nikula@intel.com,
 lucas.demarchi@intel.com, siva.mullati@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This series is to introduce new macros generic to i915 for checking 0 and 1 bits,
instead on relying on whats defined by the mmu, since it could be different
or non-exisitent between different platforms.

v2: Corrected sender's email.

v3: Corrected spelling error.

Michael Cheng (1):
  drm/i915: Introduce new macros for i915 PTE

 drivers/gpu/drm/i915/gt/gen8_ppgtt.c |  6 +++---
 drivers/gpu/drm/i915/gt/intel_ggtt.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h  |  3 +++
 drivers/gpu/drm/i915/gvt/gtt.c       | 12 ++++++------
 4 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.25.1

