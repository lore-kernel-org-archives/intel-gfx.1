Return-Path: <SRS0=wBbn=P7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6366DC433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Nov 2021 19:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1944260F45
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Nov 2021 19:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1944260F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915596EEB9;
	Fri, 12 Nov 2021 19:38:31 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666096E288
 for <intel-gfx@lists.freedesktop.org>; Fri, 12 Nov 2021 19:38:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10166"; a="294019195"
X-IronPort-AV: E=Sophos;i="5.87,230,1631602800"; d="scan'208";a="294019195"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 11:38:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,230,1631602800"; d="scan'208";a="590667210"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 12 Nov 2021 11:38:22 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 21:38:22 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 12 Nov 2021 21:38:07 +0200
Message-Id: <20211112193813.8224-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211112193813.8224-1-ville.syrjala@linux.intel.com>
References: <20211112193813.8224-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 3/9] drm/i915: Clean up SKL_BOTTOM_COLOR defines
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

Use REG_BIT() for SKL_BOTTOM_COLOR.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index e300a202ce2d..8b227dabb10c 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -6341,8 +6341,8 @@ enum {
 
 /* Skylake+ pipe bottom (background) color */
 #define _SKL_BOTTOM_COLOR_A		0x70034
-#define   SKL_BOTTOM_COLOR_GAMMA_ENABLE	(1 << 31)
-#define   SKL_BOTTOM_COLOR_CSC_ENABLE	(1 << 30)
+#define   SKL_BOTTOM_COLOR_GAMMA_ENABLE		REG_BIT(31)
+#define   SKL_BOTTOM_COLOR_CSC_ENABLE		REG_BIT(30)
 #define SKL_BOTTOM_COLOR(pipe)		_MMIO_PIPE2(pipe, _SKL_BOTTOM_COLOR_A)
 
 #define _ICL_PIPE_A_STATUS			0x70058
-- 
2.32.0

