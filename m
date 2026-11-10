Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A97606E476
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2026 13:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ux9UGq2v
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F34B10F6A3;
	Tue, 10 Nov 2026 12:59:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC4210F6A3
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2026 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794315591; x=1825851591;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ACYb/gz23u13Kk984iZZ+6p76LqCHWnn3A7golGYmTw=;
 b=Ux9UGq2vKPDkddrI+bQdvu4vmZVBDlCwfcH8txj9pS81ksrbG4HW77jJ
 awkcDHdiICaGUpPfsY3drFfviJgkXIHOf4z77gWD2zzoX7V6HifIGTirQ
 36erZ6MWTzPaYFkNTWrQQVLA6+5CJKWf9qQLr9l1+cOTas1J/FgON706t
 4OjdJ9GOMb0EUM72EU62O8XkqDhkmW3bBEMwp+H39neWG686yXDzbmm5X
 ZSkxU4yJ1kKTiSoBynMgUw7jH5SWujjRIp2tedi29eawaeNxliRKHjpTE
 b3q7ORWszbtyx61LGYsXBNuaUqUMyZxHjxVZnuHN9mfzONV4kd8BlbN4h A==;
X-CSE-ConnectionGUID: oHBgk9K/ROC5ITodiGJCHw==
X-CSE-MsgGUID: xO1i/5BkR9OTt86zri5WVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3085798"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3085798"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 04:59:51 -0800
X-CSE-ConnectionGUID: +Ie6nMvpQQe/vRN5svy1Vg==
X-CSE-MsgGUID: sgfDe9JWQ4eKhGSGf52J7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7976667"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 04:59:50 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915: Clean up GEN11 irq regs
Date: Tue, 10 Nov 2026 14:59:41 +0200
Message-ID: <20261110125942.11010-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110125942.11010-1-ville.syrjala@linux.intel.com>
References: <20261110125942.11010-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use REG_BIT() and fix up the indentation for the GEN11 irq bits.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 9c2f4c74e405..39b02e80f759 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -685,7 +685,7 @@
 #define GEN11_GU_MISC_IMR	_MMIO(0x444f4)
 #define GEN11_GU_MISC_IIR	_MMIO(0x444f8)
 #define GEN11_GU_MISC_IER	_MMIO(0x444fc)
-#define  GEN11_GU_MISC_GSE	(1 << 27)
+#define   GEN11_GU_MISC_GSE	REG_BIT(27)
 
 #define GEN11_GU_MISC_IRQ_REGS		I915_IRQ_REGS(GEN11_GU_MISC_IMR, \
 						      GEN11_GU_MISC_IER, \
@@ -696,13 +696,13 @@
 #define   DG1_MSTR_TILE(t)		REG_BIT(t)
 
 #define GEN11_GFX_MSTR_IRQ		_MMIO(0x190010)
-#define  GEN11_MASTER_IRQ		(1 << 31)
-#define  GEN11_PCU_IRQ			(1 << 30)
-#define  GEN11_GU_MISC_IRQ		(1 << 29)
-#define  GEN11_DISPLAY_IRQ		(1 << 16)
-#define  GEN11_GT_DW_IRQ(x)		(1 << (x))
-#define  GEN11_GT_DW1_IRQ		(1 << 1)
-#define  GEN11_GT_DW0_IRQ		(1 << 0)
+#define   GEN11_MASTER_IRQ		REG_BIT(31)
+#define   GEN11_PCU_IRQ			REG_BIT(30)
+#define   GEN11_GU_MISC_IRQ		REG_BIT(29)
+#define   GEN11_DISPLAY_IRQ		REG_BIT(16)
+#define   GEN11_GT_DW_IRQ(x)		REG_BIT(x)
+#define   GEN11_GT_DW1_IRQ		REG_BIT(1)
+#define   GEN11_GT_DW0_IRQ		REG_BIT(0)
 
 #define IVB_CHICKEN3		_MMIO(0x4200c)
 #define   CHICKEN3_DGMG_REQ_OUT_FIX_DISABLE	REG_BIT(5)
-- 
2.56.0

