Return-Path: <SRS0=zXYq=KV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC0AC47082
	for <intel-gfx@archiver.kernel.org>; Wed, 26 May 2021 18:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8026D613E5
	for <intel-gfx@archiver.kernel.org>; Wed, 26 May 2021 18:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8026D613E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A756E51D;
	Wed, 26 May 2021 18:36:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8DCB86E51D;
 Wed, 26 May 2021 18:36:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 86A0EA41FB;
 Wed, 26 May 2021 18:36:04 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Date: Wed, 26 May 2021 18:36:04 -0000
Message-ID: <162205416452.13404.5874268668769787837@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210526100006.2205062-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210526100006.2205062-1-tvrtko.ursulin@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/params=3A_Align_visibility_of_device_level_and_glo?=
 =?utf-8?q?bal_modparams_=28rev2=29?=
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

Series: drm/i915/params: Align visibility of device level and global modparams (rev2)
URL   : https://patchwork.freedesktop.org/series/90588/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
2f2ca20ce0cd drm/i915/params: Align visibility of device level and global modparams
-:10: WARNING:TYPO_SPELLING: 'conditionaly' may be misspelled - perhaps 'conditionally'?
#10: 
We have a few modparams which get conditionaly exposed based on a Kconfig
                                  ^^^^^^^^^^^^

-:35: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/i915_params.h:74:
+	param(unsigned long, fake_lmem_start, 0, IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM) ? 0400 : 0) \

-:36: WARNING:LONG_LINE: line length of 126 exceeds 100 columns
#36: FILE: drivers/gpu/drm/i915/i915_params.h:75:
+	param(unsigned int, request_timeout_ms, CONFIG_DRM_I915_REQUEST_TIMEOUT, CONFIG_DRM_I915_REQUEST_TIMEOUT ? 0600 : 0) \

total: 0 errors, 3 warnings, 0 checks, 22 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
