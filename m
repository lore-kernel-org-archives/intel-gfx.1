Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77D6C43327
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Jul 2026 12:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3596410EFE6;
	Wed,  1 Jul 2026 12:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="rsKfqsh4";
	dkim-atps=neutral
Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com
 [209.85.219.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1689810F6DB
 for <intel-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 17:55:15 +0000 (UTC)
Received: by mail-qv1-f73.google.com with SMTP id
 6a1803df08f44-8e05aa49693so33978686d6.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 10:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1782496514; x=1783101314;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=mM3PnInI6kX1xpwl2VR4RCLVCiH8w3J7RjvmONcxlFw=;
 b=rsKfqsh4yFESoahwnymZHu4xmqpRl8aUMd888FjtwSRGsi2DVN+Q+yrTfxm1vkpoib
 avz32Da4EFS3YjnWLmSgsPoAPUjeBFEByMDiHVPUjlmCT6qCzI3O2BRQwWvNokn7bmfE
 PsTEzdWHHxsbolWDBIg8KaUisvpWd2IqKQ9V2DkEURzXNNo0mVYs/VerOP6YWpuJ4M2/
 MMiFP6YVfdJrJ2MmWvQJ6A+pepG3UmNPMQXmuuJnzK4H2zFgCMG61+6EoP/MgsL8542E
 TzD/O1Rs2m8MD2UINUDNbWkxYAfddHiK3QL0yMt8QxxkoSe5UYmXLS5MruR5OxzlCwzS
 M5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782496514; x=1783101314;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mM3PnInI6kX1xpwl2VR4RCLVCiH8w3J7RjvmONcxlFw=;
 b=JnVET0u1vF4SY8rPFylgVrx2ioVVPwAKmlgogceLTx7hOvQs3Wicq08If2y1ckoNMe
 iPCCxHkYf96YRQvRxU2eZfVhcRH581dBrKf8guRUrI4V4dQfiBEl6W5x2zV71M+qEEBc
 zwQdjkBWn63yTxZLu0d+CjLZng/sUY1LpdOdlfKjDhck5ITxFK9NY4a0W15qbKqendr3
 2flzTjxNb69yLllKD5fyPiwthNOw5jwlT0KoJxfjeszpjMYVu8E4iMO8G2f0uJnAXqcE
 VmLkgCg1fqbfLn6XPd9NcmLWSN4YY4+9NbzaBxlSxq03TDDVmhkxYfBI5n3m7mq7Ooxi
 Llxw==
X-Gm-Message-State: AOJu0YyCvvW3ZCQM8t/mt1tnwV0y20DwIJHISwxLSqfVa0Hp5wsjuirG
 XMHcAURwtbRcZpdp9rmMItUmAOh3apwNcSF9gr+Hnevl3CLgyrYNjdKHQZiA764vopgDjWcvOwQ
 YgEAyoVfrOT3QBwuGdrzITrKHj3IP7PwiwzcnAnBlg4pdEPy8hm8N2Z4Q/LsFYHtjC5hWzebKh2
 RnVeYay9Ud+7M/eyNAKjGQ7uiLdjwgzlrs8h3NPKafDKlrLsOns884SFM9v3A=
X-Received: from qthg1.prod.google.com ([2002:ac8:701:0:b0:517:6e82:6e87])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:5851:0:b0:517:82af:3d4f with SMTP id
 d75a77b69052e-51a7275af9dmr109755031cf.6.1782496513323; 
 Fri, 26 Jun 2026 10:55:13 -0700 (PDT)
Date: Fri, 26 Jun 2026 13:54:21 -0400
In-Reply-To: <20260625160020.2873859-1-gildekel@google.com>
Mime-Version: 1.0
References: <20260625160020.2873859-1-gildekel@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626175510.3899476-1-gildekel@google.com>
Subject: [PATCH v2 0/2] drm/i915/display: Enable HDR over DP MST
From: Gil Dekel <gildekel@google.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, jani.nikula@intel.com, imre.deak@intel.com, 
 khaled.almahallawy@intel.com, navaremanasi@google.com, 
 Gil Dekel <gildekel@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 01 Jul 2026 12:57:46 +0000
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Currently, the Intel display driver does not support HDR over DP MST
connections. This series enables this functionality.

To achieve this:
1. We refactor colorimetry capability queries to query and cache the value
   on a per-connector basis (for both SST and MST downstream sinks)
   instead of checking the root port's DPCD register directly (which returns
   false for MST hubs).
2. We update the MST stream configuration to compute the required VSC and
   HDR metadata SDPs.
3. We set the transcoder's Video DIP registers on stream enable and during
   fastsets (update_pipe) to propagate HDR metadata changes without forcing
   a full modeset.
4. We expose the max_bpc, HDR metadata, and DP Colorspace properties on
   MST connectors.

Changes in v2:
- Fixed critical Werror CI build break (-Wunused-but-set-variable) by
  removing unused display variable in intel_dp_compute_vsc_sdp().
- Resolved checkpatch warnings by hoisting variable declarations and
  restoring missing blank lines.
- Gated attaching MST HDR_OUTPUT_METADATA property on
  intel_dp_has_gamut_metadata_dip() for consistency with SST.
- Removed redundant direct max_bpc assignment on connector struct.

Gil Dekel (2):
  drm/i915/display: Cache DP colorimetry support per-connector
  drm/i915/display/mst: Enable HDR over DP MST

 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 25 ++++++++---
 drivers/gpu/drm/i915/display/intel_dp.h       |  8 ++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 44 +++++++++++++++++--
 4 files changed, 68 insertions(+), 10 deletions(-)

-- 
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

