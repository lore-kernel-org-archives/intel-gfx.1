Return-Path: <SRS0=t69m=HT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C5AC433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Feb 2021 17:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 566EC64E2F
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Feb 2021 17:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 566EC64E2F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B335F6E59F;
	Wed, 17 Feb 2021 17:20:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF0986E59F;
 Wed, 17 Feb 2021 17:20:36 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9DB2CA3ECB;
 Wed, 17 Feb 2021 17:20:36 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Wed, 17 Feb 2021 17:20:36 -0000
Message-ID: <161358243661.24999.6398389263130299143@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <cover.1613580193.git.jani.nikula@intel.com>
In-Reply-To: <cover.1613580193.git.jani.nikula@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/bios=3A_vbt_child_device_rework?=
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

Series: drm/i915/bios: vbt child device rework
URL   : https://patchwork.freedesktop.org/series/87165/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
eb3ee8e4100d drm/i915/bios: mass convert dev_priv to i915
-:1537: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1537: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2051:
+	i915->vbt.lvds_ssc_freq = intel_bios_ssc_frequency(i915,
+			!HAS_PCH_SPLIT(i915));

total: 0 errors, 0 warnings, 1 checks, 1901 lines checked
bec5ef024e83 drm/i915/bios: store bdb version in i915
183a2a92a87d drm/i915/bios: limit default outputs by platform on missing VBT
a26b42827005 drm/i915/bios: limit default outputs to ports A through F
13cc862469fa drm/i915/bios: create fake child devices on missing VBT
28f555702275 drm/i915/bios: rename display_device_data to intel_bios_encoder_data
6f9812af842c drm/i915/bios: add i915 backpointer to intel_bios_encoder_data
8bf02e86eec6 drm/i915/vbt: add helper functions to check output support
a295862116c5 drm/i915/bios: save a higher level pointer in ddi_vbt_port_info[]
5b40fe7ec523 drm/i915/bios: start using the intel_bios_encoder_data directly
e302e102b326 drm/i915/bios: start using intel_bios_encoder_data for Type-C USB and TBT
4f0a5fd1dd23 drm/i915/bios: add intel_bios_encoder_data to encoder, use for iboost


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
