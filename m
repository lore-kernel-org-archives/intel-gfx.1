Return-Path: <SRS0=5W5W=OU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A81C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 30 Sep 2021 10:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3496261989
	for <intel-gfx@archiver.kernel.org>; Thu, 30 Sep 2021 10:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3496261989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE0A6EB66;
	Thu, 30 Sep 2021 10:40:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AE46F6EB68;
 Thu, 30 Sep 2021 10:40:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A4A3FAADDE;
 Thu, 30 Sep 2021 10:40:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 30 Sep 2021 10:40:47 -0000
Message-ID: <163299844767.18253.15352409634353004851@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <cover.1632992608.git.jani.nikula@intel.com>
In-Reply-To: <cover.1632992608.git.jani.nikula@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/display=3A_move_modeset_asserts_out_of_intel=5Fdis?=
 =?utf-8?q?play=2Ec?=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/display: move modeset asserts out of intel_display.c
URL   : https://patchwork.freedesktop.org/series/95258/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
25961813c19b drm/i915/fdi: move fdi modeset asserts to intel_fdi.c
-:133: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#133: FILE: drivers/gpu/drm/i915/display/intel_fdi.c:26:
+		cur_state = intel_de_read(dev_priv, TRANS_DDI_FUNC_CTL(cpu_transcoder)) & TRANS_DDI_FUNC_ENABLE;

-:133: WARNING:LINE_SPACING: Missing a blank line after declarations
#133: FILE: drivers/gpu/drm/i915/display/intel_fdi.c:26:
+		enum transcoder cpu_transcoder = (enum transcoder)pipe;
+		cur_state = intel_de_read(dev_priv, TRANS_DDI_FUNC_CTL(cpu_transcoder)) & TRANS_DDI_FUNC_ENABLE;

total: 0 errors, 2 warnings, 0 checks, 212 lines checked
863eb87e7767 drm/i915/pps: move pps (panel) modeset asserts to intel_pps.c
eb1f620aa3b1 drm/i915/dpll: move dpll modeset asserts to intel_dpll.c
23c986a8b295 drm/i915/dsi: move dsi pll modeset asserts to vlv_dsi_pll.c


