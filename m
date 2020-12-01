Return-Path: <SRS0=1U3p=FF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED14CC63777
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 02:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7589F207FF
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 02:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7589F207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE6289E8C;
	Tue,  1 Dec 2020 02:17:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D427589E86;
 Tue,  1 Dec 2020 02:17:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CB6F1A47EB;
 Tue,  1 Dec 2020 02:17:38 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Date: Tue, 01 Dec 2020 02:17:38 -0000
Message-ID: <160678905882.6987.4407341271395792396@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201130212200.2811939-1-imre.deak@intel.com>
In-Reply-To: <20201130212200.2811939-1-imre.deak@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Add_the_missing_wakeref_tracking_for_display_po?=
 =?utf-8?q?wer_references?=
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

Series: drm/i915: Add the missing wakeref tracking for display power references
URL   : https://patchwork.freedesktop.org/series/84418/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
166a87e7d161 drm/i915: Use CRTC index consistently during getting/putting CRTC power domains
b5663daf72c3 drm/i915: Factor out helpers to get/put a set of tracked power domains
-:47: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#47: FILE: drivers/gpu/drm/i915/display/intel_display.c:11307:
+						       POWER_DOMAIN_TRANSCODER(pipe_config->cpu_transcoder)))

-:82: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#82: FILE: drivers/gpu/drm/i915/display/intel_display.c:11332:
+							       POWER_DOMAIN_TRANSCODER(cpu_transcoder)))

-:232: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#232: FILE: drivers/gpu/drm/i915/display/intel_display_power.h:228:
+	uint64_t mask;

total: 0 errors, 2 warnings, 1 checks, 233 lines checked
4e695be16ef4 drm/i915: Track power references taken for enabled CRTCs
7de246bcd781 drm/i915/ddi: Track power reference taken for encoder DDI IO use
5cbb83de90bc drm/i915/ddi: Track power reference taken for encoder main lane AUX use
d38d69d2d622 drm/i915: Track power reference taken for eDP VDD
09ecbd78a0c2 drm/i915: Rename power_domains.wakeref to init_wakeref
8da47ce1eac2 drm/i915: Track power reference taken to disable power well functionality
e003304a95df drm/i915: Make intel_display_power_put_unchecked() an internal-only function


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
