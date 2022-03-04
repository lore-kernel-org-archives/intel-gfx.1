Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03ED4C433EF
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Mar 2022 00:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5FA10E20B;
	Fri,  4 Mar 2022 00:55:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E0DA410E20B;
 Fri,  4 Mar 2022 00:55:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DA07AA66C9;
 Fri,  4 Mar 2022 00:55:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Date: Fri, 04 Mar 2022 00:55:29 -0000
Message-ID: <164635532985.21355.18436887119396902684@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220303223737.708659-1-John.C.Harrison@Intel.com>
In-Reply-To: <20220303223737.708659-1-John.C.Harrison@Intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Improve_anti-pre-emption_w/a_for_compute_workloads_=28rev4?=
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

Series: Improve anti-pre-emption w/a for compute workloads (rev4)
URL   : https://patchwork.freedesktop.org/series/100428/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
5ef6e2a52bd2 drm/i915/guc: Limit scheduling properties to avoid overflow
-:42: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'field' - possible side-effects?
#42: FILE: drivers/gpu/drm/i915/gt/intel_engine_cs.c:446:
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

total: 0 errors, 0 warnings, 1 checks, 191 lines checked
1f742dfb98cf drm/i915: Fix compute pre-emption w/a to apply to compute engines
de2bbe1afe48 drm/i915: Make the heartbeat play nice with long pre-emption timeouts
53812ed93f89 drm/i915: Improve long running OCL w/a for GuC submission


