Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6312C433F5
	for <intel-gfx@archiver.kernel.org>; Thu,  6 Oct 2022 21:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAFE10E69A;
	Thu,  6 Oct 2022 21:57:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id CAA9A10E689;
 Thu,  6 Oct 2022 21:57:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C1C48A7DFF;
 Thu,  6 Oct 2022 21:57:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Date: Thu, 06 Oct 2022 21:57:20 -0000
Message-ID: <166509344075.5835.16182037294496917223@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20221006213813.1563435-1-John.C.Harrison@Intel.com>
In-Reply-To: <20221006213813.1563435-1-John.C.Harrison@Intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Improve_anti-pre-emption_w/a_for_compute_workloads_=28rev8?=
 =?utf-8?q?=29?=
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
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: Improve anti-pre-emption w/a for compute workloads (rev8)
URL   : https://patchwork.freedesktop.org/series/100428/
State : warning

== Summary ==

Error: dim checkpatch failed
e700b8ded220 drm/i915/guc: Limit scheduling properties to avoid overflow
-:45: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'field' - possible side-effects?
#45: FILE: drivers/gpu/drm/i915/gt/intel_engine_cs.c:516:
+#define CLAMP_PROP(field) \
+	do { \
+		u64 clamp = intel_clamp_##field(engine, engine->props.field); \
+		if (clamp != engine->props.field) { \
+			drm_notice(&engine->i915->drm, \
+				   "Warning, clamping %s to %lld to prevent overflow\n", \
+				   #field, clamp); \
+			engine->props.field = clamp; \
+		} \
+	} while (0)

total: 0 errors, 0 warnings, 1 checks, 223 lines checked
6e67b1a4543c drm/i915: Fix compute pre-emption w/a to apply to compute engines
8d9003ea70cc drm/i915: Make the heartbeat play nice with long pre-emption timeouts
f2479b21c994 drm/i915: Improve long running compute w/a for GuC submission


