Return-Path: <SRS0=vghI=FG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34254C64E7C
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Dec 2020 15:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B076820B1F
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Dec 2020 15:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B076820B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CC46EA51;
	Wed,  2 Dec 2020 15:33:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 982646EA4D;
 Wed,  2 Dec 2020 15:33:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8F711AA912;
 Wed,  2 Dec 2020 15:33:37 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Date: Wed, 02 Dec 2020 15:33:37 -0000
Message-ID: <160692321755.4089.2767212016320975973@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201130212200.2811939-1-imre.deak@intel.com>
In-Reply-To: <20201130212200.2811939-1-imre.deak@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Add_the_missing_wakeref_tracking_for_display_po?=
 =?utf-8?q?wer_references_=28rev4=29?=
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

Series: drm/i915: Add the missing wakeref tracking for display power references (rev4)
URL   : https://patchwork.freedesktop.org/series/84418/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
fb819322d6eb drm/i915: Use CRTC index consistently during getting/putting CRTC power domains
19b477095143 drm/i915: Factor out helpers to get/put a set of tracked power domains
-:49: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#49: FILE: drivers/gpu/drm/i915/display/intel_display.c:11307:
+						       POWER_DOMAIN_TRANSCODER(pipe_config->cpu_transcoder)))

-:84: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#84: FILE: drivers/gpu/drm/i915/display/intel_display.c:11332:
+							       POWER_DOMAIN_TRANSCODER(cpu_transcoder)))

total: 0 errors, 2 warnings, 0 checks, 233 lines checked
b4836e197d91 drm/i915: Track power references taken for enabled CRTCs
4b7e131ec9db drm/i915/ddi: Track power reference taken for encoder DDI IO use
f5be4a930c9e drm/i915/ddi: Track power reference taken for encoder main lane AUX use
2e2b87f626ed drm/i915: Track power reference taken for eDP VDD
3ac87db07e57 drm/i915: Rename power_domains.wakeref to init_wakeref
761e6e0ca141 drm/i915: Track power reference taken to disable power well functionality
213ec14dfacb drm/i915: Make intel_display_power_put_unchecked() an internal-only function
-:14: WARNING:BAD_SIGN_OFF: Duplicate signature
#14: 
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

total: 0 errors, 1 warnings, 0 checks, 69 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
