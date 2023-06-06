Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE02C77B73
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Jun 2023 19:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB2C10E3AB;
	Tue,  6 Jun 2023 19:15:50 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2434910E3A8
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Jun 2023 19:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686078948; x=1717614948;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Qv7XynmJC7tnBVJsu7GThCHYZr2eN6TsED3irXJA3aY=;
 b=C+DdrumFzAsmQ5fum+VurjCRsL0O51fMcfdcnMfWxrPYn//fBKqC+bfc
 RinZFJnCDsI3oZKdEqw+a7aSqaHVwNV99ibaJRXMSSjZGoAaFlGMiP4S+
 jT3jKmMNTtndgdIAzZ6eozVKb/4rpENU7BEYOp4ylF7enVSPqQRkfUUBx
 JngSwRf19btTfj/ukVDgPgsgNDXBeahUhDU6oogLLiGTYtrbuBdiCp6B1
 73dn4EjGtJ1zVq6SlIFbeniF6G1Rt9kLn761zoevN/VLkJ6qijuERylhQ
 Ah2dtsnA4aTy6d9krvfhV/AzDW7L1rdfVVGrIEMoOTqxpIF8fkMZZCOzm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="443146349"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="443146349"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 12:15:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="709187127"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="709187127"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga002.jf.intel.com with SMTP; 06 Jun 2023 12:15:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 06 Jun 2023 22:15:45 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  6 Jun 2023 22:14:58 +0300
Message-Id: <20230606191504.18099-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230606191504.18099-1-ville.syrjala@linux.intel.com>
References: <20230606191504.18099-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 13/19] drm/i915/dsb: Use non-posted register
 writes for legacy LUT
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

The DSB has problems writing the legacy LUT. The two workarounds
I've discoverted are:
- write each entry twice back to back
- use non-posted writes

Let's use non-posted writes as that seems a bit more standard.

TODO: measure which is faster

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 077e45372dab..b3dd4013d058 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1265,9 +1265,20 @@ static void ilk_load_lut_8(const struct intel_crtc_state *crtc_state,
 
 	lut = blob->data;
 
+	/*
+	 * DSB fails to correctly load the legacy LUT
+	 * unless we either write each entry twice,
+	 * or use non-posted writes
+	 */
+	if (crtc_state->dsb)
+		intel_dsb_nonpost_start(crtc_state->dsb);
+
 	for (i = 0; i < 256; i++)
 		ilk_lut_write(crtc_state, LGC_PALETTE(pipe, i),
 			      i9xx_lut_8(&lut[i]));
+
+	if (crtc_state->dsb)
+		intel_dsb_nonpost_end(crtc_state->dsb);
 }
 
 static void ilk_load_lut_10(const struct intel_crtc_state *crtc_state,
-- 
2.39.3

