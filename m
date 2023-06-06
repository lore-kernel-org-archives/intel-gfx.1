Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF30C7EE24
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Jun 2023 19:15:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6AC10E3A4;
	Tue,  6 Jun 2023 19:15:43 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D4F10E3A1
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Jun 2023 19:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686078941; x=1717614941;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LNWY+tRjaDCRf0SdsUghdTId0WjvMbKH1f+OrGcj6ac=;
 b=OFk9hOwnE21KZQaL2WSOnHmMMbbiHdfrOOqy0goTIN8YhnEA7dmfBDhD
 S5yBViaVIv3xKMa2IBCdOkR17yLlEei2JbE5D3VnBLGDzkt6rrUtx0Iny
 FhTzk8K1iYGTeLbSfeQv71B/tNUNQHtZEtf50JoUzESna7dYaPtrvGy4Q
 cAcuTilVcwxk+st0Nw9cXL3DrhEl2fUKHI08Urm4vot5QIRtimxS2PpCT
 KttKy4HINx9U+TNmGgcM5lWYhUrdoEE5YE0Wb97J/Y9G6HAbicnrItCCP
 jJe+d9V0rlO9D0pSs7dtkfqQ+qMcJ+seyU1ZXL1BD7QdO/Ix02ntlkfAE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="443146322"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="443146322"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 12:15:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="709187089"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="709187089"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga002.jf.intel.com with SMTP; 06 Jun 2023 12:15:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 06 Jun 2023 22:15:36 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  6 Jun 2023 22:14:55 +0300
Message-Id: <20230606191504.18099-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230606191504.18099-1-ville.syrjala@linux.intel.com>
References: <20230606191504.18099-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 10/19] drm/i915/dsb: Add support for
 non-posted DSB registers writes
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Writing specific transcoder registers (and as it turns out, the
legacy LUT as well) via DSB needs a magic sequence to emit
non-posted register writes. Add a helper for this.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dsb.h |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 6be353fdc7fc..73d609507f24 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -261,6 +261,26 @@ void intel_dsb_noop(struct intel_dsb *dsb, int count)
 			       DSB_OPCODE_NOOP << DSB_OPCODE_SHIFT);
 }
 
+void intel_dsb_nonpost_start(struct intel_dsb *dsb)
+{
+	struct intel_crtc *crtc = dsb->crtc;
+	enum pipe pipe = crtc->pipe;
+
+	intel_dsb_reg_write_masked(dsb, DSB_CTRL(pipe, dsb->id),
+				   DSB_NON_POSTED, DSB_NON_POSTED);
+	intel_dsb_noop(dsb, 4);
+}
+
+void intel_dsb_nonpost_end(struct intel_dsb *dsb)
+{
+	struct intel_crtc *crtc = dsb->crtc;
+	enum pipe pipe = crtc->pipe;
+
+	intel_dsb_reg_write_masked(dsb, DSB_CTRL(pipe, dsb->id),
+				   DSB_NON_POSTED, 0);
+	intel_dsb_noop(dsb, 4);
+}
+
 static void intel_dsb_align_tail(struct intel_dsb *dsb)
 {
 	u32 aligned_tail, tail;
diff --git a/drivers/gpu/drm/i915/display/intel_dsb.h b/drivers/gpu/drm/i915/display/intel_dsb.h
index 983b0d58ad44..54e9e1dc31ee 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.h
+++ b/drivers/gpu/drm/i915/display/intel_dsb.h
@@ -22,6 +22,9 @@ void intel_dsb_reg_write(struct intel_dsb *dsb,
 void intel_dsb_reg_write_masked(struct intel_dsb *dsb,
 				i915_reg_t reg, u32 mask, u32 val);
 void intel_dsb_noop(struct intel_dsb *dsb, int count);
+void intel_dsb_nonpost_start(struct intel_dsb *dsb);
+void intel_dsb_nonpost_end(struct intel_dsb *dsb);
+
 void intel_dsb_commit(struct intel_dsb *dsb,
 		      bool wait_for_vblank);
 void intel_dsb_wait(struct intel_dsb *dsb);
-- 
2.39.3

