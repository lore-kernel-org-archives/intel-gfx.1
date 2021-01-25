Return-Path: <SRS0=x+Hj=G4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6052C433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Jan 2021 22:02:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62BE622573
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Jan 2021 22:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62BE622573
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C770B6E284;
	Mon, 25 Jan 2021 22:02:07 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF106E284
 for <intel-gfx@lists.freedesktop.org>; Mon, 25 Jan 2021 22:02:05 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23697794-1500050 
 for multiple; Mon, 25 Jan 2021 22:01:51 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 25 Jan 2021 22:01:52 +0000
Message-Id: <20210125220152.24070-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210125215247.6905-1-chris@chris-wilson.co.uk>
References: <20210125215247.6905-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Disable atomics in L3 for gen9
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
Cc: Jason Ekstrand <jason@jlesktrand.net>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Enabling atomic operations in L3 leads to unrecoverable GPU hangs, as
the machine stops responding milliseconds after receipt of the reset
request [GDRT]. By disabling the cached atomics, the hang do not occur
and we presume the GPU would reset normally for similar hangs.

Reported-by: Jason Ekstrand <jason@jlekstrand.net>
Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=110998
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Reviewed-by: Jason Ekstrand <jason@jlesktrand.net>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 8 ++++++++
 drivers/gpu/drm/i915/i915_reg.h             | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 82e15c8c7a97..71d1c19c868b 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1840,6 +1840,14 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		wa_write_or(wal,
 			    GEN8_L3SQCREG4,
 			    GEN8_LQSC_FLUSH_COHERENT_LINES);
+
+		/* Disable atomics in L3 to prevent unrecoverable hangs */
+		wa_write_clr_set(wal, GEN9_SCRATCH_LNCF1,
+				 GEN9_LNCF_NONIA_COHERENT_ATOMICS_ENABLE, 0);
+		wa_write_clr_set(wal, GEN8_L3SQCREG4,
+				 GEN8_LQSQ_NONIA_COHERENT_ATOMICS_ENABLE, 0);
+		wa_write_clr_set(wal, GEN9_SCRATCH1,
+				 EVICTION_PERF_FIX_ENABLE, 0);
 	}
 
 	if (IS_HASWELL(i915)) {
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 8b9bbc6bacb1..fa3866f9ccfc 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -8222,6 +8222,7 @@ enum {
 #define  GEN11_LQSC_CLEAN_EVICT_DISABLE		(1 << 6)
 #define  GEN8_LQSC_RO_PERF_DIS			(1 << 27)
 #define  GEN8_LQSC_FLUSH_COHERENT_LINES		(1 << 21)
+#define  GEN8_LQSQ_NONIA_COHERENT_ATOMICS_ENABLE REG_BIT(22)
 
 /* GEN8 chicken */
 #define HDC_CHICKEN0				_MMIO(0x7300)
@@ -12104,6 +12105,12 @@ enum skl_power_gate {
 #define __GEN11_VCS2_MOCS0	0x10000
 #define GEN11_MFX2_MOCS(i)	_MMIO(__GEN11_VCS2_MOCS0 + (i) * 4)
 
+#define GEN9_SCRATCH_LNCF1		_MMIO(0xb008)
+#define   GEN9_LNCF_NONIA_COHERENT_ATOMICS_ENABLE REG_BIT(0)
+
+#define GEN9_SCRATCH1			_MMIO(0xb11c)
+#define   EVICTION_PERF_FIX_ENABLE	REG_BIT(8)
+
 #define GEN10_SCRATCH_LNCF2		_MMIO(0xb0a0)
 #define   PMFLUSHDONE_LNICRSDROP	(1 << 20)
 #define   PMFLUSH_GAPL3UNBLOCK		(1 << 21)
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
