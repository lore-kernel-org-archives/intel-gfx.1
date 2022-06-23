Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7069CC433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Jun 2022 13:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C2310E5E5;
	Thu, 23 Jun 2022 13:09:21 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452CF10ED03
 for <intel-gfx@lists.freedesktop.org>; Thu, 23 Jun 2022 13:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655989760; x=1687525760;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tcmzupEC8f5l2C9O+SnY18M20Vs5sjlMkpH/GyxKb3Q=;
 b=cxgRg7AlhaMpEP+bSe0UTZWACwcnPZJxwHeombsLcrxvpejuqe6WSbLE
 HroKCsD/4f6kvbDfkKvobLkCo5GjZ7s1mpG3XTJ5CDz7IBSj4lD2UT927
 UIUfpYr7BRjjM9VoZq4G1NWuwA//SuHTz8P2Y4h5CfG+VGFHQ9yTU2CWK
 PeT0i+grWv4zADMD5/zQcbkFnI2Wqbc7UHX1w3JVRXKASzpuQN3YnWJFm
 ot4ELVweSbmdMC5SH085i1GQpE1WgUAxsTvp4HXx8JEM2q8aHnsdni2Z/
 XThMBxYGclnDhje+D7NnLSu9GvjoLPaQ8spxtiTbaYD4bxFRMyQqQxy1C g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="344703283"
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="344703283"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 06:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="588614428"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga002.jf.intel.com with SMTP; 23 Jun 2022 06:09:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 23 Jun 2022 16:09:15 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 23 Jun 2022 16:08:56 +0300
Message-Id: <20220623130900.26078-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623130900.26078-1-ville.syrjala@linux.intel.com>
References: <20220623130900.26078-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 5/9] drm/i915: s/_CURSOR2/_MMIO_CURSOR2//
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

The other similar macros have the _MMIO prefix, so give
it also to _CURSOR2.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index c64cf302ccb7..b3fe01aaeba8 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -168,7 +168,7 @@
 					 INTEL_INFO(dev_priv)->display.trans_offsets[TRANSCODER_A] + \
 					 DISPLAY_MMIO_BASE(dev_priv) + (reg))
 #define _MMIO_TRANS2(tran, reg)		_MMIO(_TRANS2(tran, reg))
-#define _CURSOR2(pipe, reg)		_MMIO(INTEL_INFO(dev_priv)->display.cursor_offsets[(pipe)] - \
+#define _MMIO_CURSOR2(pipe, reg)	_MMIO(INTEL_INFO(dev_priv)->display.cursor_offsets[(pipe)] - \
 					      INTEL_INFO(dev_priv)->display.cursor_offsets[PIPE_A] + \
 					      DISPLAY_MMIO_BASE(dev_priv) + (reg))
 
@@ -4328,12 +4328,12 @@
 #define _CURBBASE_IVB		0x71084
 #define _CURBPOS_IVB		0x71088
 
-#define CURCNTR(pipe) _CURSOR2(pipe, _CURACNTR)
-#define CURBASE(pipe) _CURSOR2(pipe, _CURABASE)
-#define CURPOS(pipe) _CURSOR2(pipe, _CURAPOS)
-#define CURSIZE(pipe) _CURSOR2(pipe, _CURASIZE)
-#define CUR_FBC_CTL(pipe) _CURSOR2(pipe, _CUR_FBC_CTL_A)
-#define CURSURFLIVE(pipe) _CURSOR2(pipe, _CURASURFLIVE)
+#define CURCNTR(pipe) _MMIO_CURSOR2(pipe, _CURACNTR)
+#define CURBASE(pipe) _MMIO_CURSOR2(pipe, _CURABASE)
+#define CURPOS(pipe) _MMIO_CURSOR2(pipe, _CURAPOS)
+#define CURSIZE(pipe) _MMIO_CURSOR2(pipe, _CURASIZE)
+#define CUR_FBC_CTL(pipe) _MMIO_CURSOR2(pipe, _CUR_FBC_CTL_A)
+#define CURSURFLIVE(pipe) _MMIO_CURSOR2(pipe, _CURASURFLIVE)
 
 #define CURSOR_A_OFFSET 0x70080
 #define CURSOR_B_OFFSET 0x700c0
-- 
2.35.1

