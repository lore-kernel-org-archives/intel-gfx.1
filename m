Return-Path: <SRS0=QaN2=QC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B98FC433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Nov 2021 14:13:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 188C5613DA
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Nov 2021 14:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 188C5613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C5B89AAD;
	Mon, 15 Nov 2021 14:13:05 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDA389AAD
 for <intel-gfx@lists.freedesktop.org>; Mon, 15 Nov 2021 14:13:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="220333884"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="220333884"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 06:05:55 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="505927337"
Received: from csrini4x-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.218.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 06:05:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 15 Nov 2021 16:05:49 +0200
Message-Id: <20211115140549.27629-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915/fbc: fix the FBC kernel-doc warnings
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
Cc: jani.nikula@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Fix the recently introduced 'make htmldocs' warnings:

$ make htmldocs 2>&1 > /dev/null | grep i915
./drivers/gpu/drm/i915/display/intel_fbc.c:635: warning: Excess function parameter 'i915' description in 'intel_fbc_is_active'
./drivers/gpu/drm/i915/display/intel_fbc.c:1638: warning: Excess function parameter 'i915' description in 'intel_fbc_handle_fifo_underrun_irq'
./drivers/gpu/drm/i915/display/intel_fbc.c:635: warning: Function parameter or member 'fbc' not described in 'intel_fbc_is_active'
./drivers/gpu/drm/i915/display/intel_fbc.c:635: warning: Excess function parameter 'i915' description in 'intel_fbc_is_active'
./drivers/gpu/drm/i915/display/intel_fbc.c:1638: warning: Function parameter or member 'fbc' not described in 'intel_fbc_handle_fifo_underrun_irq'
./drivers/gpu/drm/i915/display/intel_fbc.c:1638: warning: Excess function parameter 'i915' description in 'intel_fbc_handle_fifo_underrun_irq'

Fixes: e49a656b924e ("drm/i915/fbc: Start passing around intel_fbc")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index a7e0f79ceb63..d0c34bc3af6c 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -624,7 +624,7 @@ int intel_fbc_set_false_color(struct intel_fbc *fbc, bool enable)
 
 /**
  * intel_fbc_is_active - Is FBC active?
- * @i915: i915 device instance
+ * @fbc: The FBC instance
  *
  * This function is used to verify the current state of FBC.
  *
@@ -1592,7 +1592,7 @@ static void intel_fbc_underrun_work_fn(struct work_struct *work)
 
 /*
  * intel_fbc_reset_underrun - reset FBC fifo underrun status.
- * @i915: i915 device instance
+ * @fbc: The FBC instance
  *
  * See intel_fbc_handle_fifo_underrun_irq(). For automated testing we
  * want to re-enable FBC after an underrun to increase test coverage.
@@ -1622,7 +1622,7 @@ int intel_fbc_reset_underrun(struct intel_fbc *fbc)
 
 /**
  * intel_fbc_handle_fifo_underrun_irq - disable FBC when we get a FIFO underrun
- * @i915: i915 device instance
+ * @fbc: The FBC instance
  *
  * Without FBC, most underruns are harmless and don't really cause too many
  * problems, except for an annoying message on dmesg. With FBC, underruns can
-- 
2.30.2

