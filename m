Return-Path: <SRS0=1kDK=G6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DC1C433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 19:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6344601FB
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 19:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6344601FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1706E209;
	Wed, 27 Jan 2021 19:03:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5F02A6E0BF;
 Wed, 27 Jan 2021 19:03:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 56349A73C9;
 Wed, 27 Jan 2021 19:03:06 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gwan-gyeong Mun" <gwan-gyeong.mun@intel.com>
Date: Wed, 27 Jan 2021 19:03:06 -0000
Message-ID: <161177418632.11911.16917437442923809951@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210127172338.1519034-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20210127172338.1519034-1-gwan-gyeong.mun@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5Bv13=2C1/2=5D_drm/i915/display=3A_Su?=
 =?utf-8?q?pport_PSR_Multiple_Instances?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v13,1/2] drm/i915/display: Support PSR Multiple Instances
URL   : https://patchwork.freedesktop.org/series/86361/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
a69d1c74e99d drm/i915/display: Support PSR Multiple Instances
-:80: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#80: FILE: drivers/gpu/drm/i915/display/intel_display.h:420:
+#define for_each_intel_encoder_is_psr_enabled(dev, intel_encoder, encoder_mask) \
+	list_for_each_entry(intel_encoder,				\
+			    &(dev)->mode_config.encoder_list,		\
+			    base.head)					\
+		for_each_if(((encoder_mask) &				\
+			     drm_encoder_mask(&intel_encoder->base)) &&	\
+			    intel_encoder_is_psr_enabled(intel_encoder))

-:80: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'intel_encoder' - possible side-effects?
#80: FILE: drivers/gpu/drm/i915/display/intel_display.h:420:
+#define for_each_intel_encoder_is_psr_enabled(dev, intel_encoder, encoder_mask) \
+	list_for_each_entry(intel_encoder,				\
+			    &(dev)->mode_config.encoder_list,		\
+			    base.head)					\
+		for_each_if(((encoder_mask) &				\
+			     drm_encoder_mask(&intel_encoder->base)) &&	\
+			    intel_encoder_is_psr_enabled(intel_encoder))

-:1464: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#1464: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1731:
+		unsigned pipe_frontbuffer_bits = frontbuffer_bits;

-:1567: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#1567: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1813:
+			unsigned pipe_frontbuffer_bits = frontbuffer_bits;

-:1716: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'intel_dp' - possible side-effects?
#1716: FILE: drivers/gpu/drm/i915/display/intel_psr.h:21:
+#define CAN_PSR(intel_dp) (HAS_PSR(dp_to_i915(intel_dp)) && intel_dp->psr.sink_support)

total: 1 errors, 2 warnings, 2 checks, 1713 lines checked
250803287c38 drm/i915/display: Support Multiple Transcoders' PSR status on debugfs


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
