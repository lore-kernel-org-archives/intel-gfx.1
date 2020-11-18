Return-Path: <SRS0=edJA=EY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20754C5519F
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2020 07:53:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E1F02225B
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2020 07:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E1F02225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AFE6E3AA;
	Wed, 18 Nov 2020 07:53:44 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1366E3AA
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Nov 2020 07:53:43 +0000 (UTC)
IronPort-SDR: zD+9jAFIeGBiU0ZufvK9C0h//UAcnRX55zXjfosHmRDk+FXwIbhCQ4GjI9KdWn7CZEYl/n1zwr
 /PvjykYkpoFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="168507629"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="168507629"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 23:53:42 -0800
IronPort-SDR: x6M6RN6wbhb7reNes4rLeQ9sCmYFbokY3yvKEQBtGVq6RUCUjHkxFbKxCsxrhhsi+9S5VXnbsB
 zFh+/4uXZX8g==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="341180317"
Received: from jalame-mobl1.amr.corp.intel.com (HELO ldmartin-desk1)
 ([10.213.166.181])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 23:53:41 -0800
Date: Tue, 17 Nov 2020 23:53:40 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Aditya Swarup <aditya.swarup@intel.com>
Message-ID: <20201118075340.did5zvrwa5qhbp6u@ldmartin-desk1>
References: <20201117185029.22078-1-aditya.swarup@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117185029.22078-1-aditya.swarup@intel.com>
Subject: Re: [Intel-gfx] [PATCH 00/21] Introduce Alderlake-S
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
Cc: intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

+Rodrigo, +Joonas

On Tue, Nov 17, 2020 at 10:50:08AM -0800, Aditya Swarup wrote:
>v2 of the patch series to introduce ADL-S.
>
>v1 for the series is posted at:
>https://patchwork.freedesktop.org/series/82917/
>
>This series is rebased after hotplug refactors and review
>comments addressed from v1.
>
>Please ignore the DG1 patch as it is cherry-picked to fix
>conflicts.
>
>Aditya Swarup (8):
>  drm/i915/dg1: Enable ports
>  drm/i915/tgl: Fix macros for TGL SOC based WA
>  drm/i915/adl_s: Configure DPLL for ADL-S
>  drm/i915/adl_s: Configure Port clock registers for ADL-S
>  drm/i915/adl_s: Add HTI support and initialize display for ADL-S
>  drm/i915/adl_s: Add adl-s ddc pin mapping
>  drm/i915/adl_s: Add vbt port and aux channel settings for adls
>  drm/i915/adl_s: Add display, gt, ctx and ADL-S
>
>Anusha Srivatsa (4):
>  drm/i915/adl_s: Add PCH support
>  drm/i915/adl_s: Add Interrupt Support
>  drm/i915/adl_s: Add PHYs for Alderlake S
>  drm/i915/adl_s: Load DMC
>
>Caz Yokoyama (3):
>  drm/i915/adl_s: Add ADL-S platform info and PCI ids
>  x86/gpu: add ADL_S stolen memory support
>  drm/i915/adl_s: MCHBAR memory info registers are moved
>
>Jos=E9 Roberto de Souza (1):
>  drm/i915/display: Add HAS_D12_PLANE_MINIMIZATION
>
>Lucas De Marchi (1):
>  drm/i915/adl_s: Add power wells
>
>Matt Roper (3):
>  drm/i915/adl_s: Update combo PHY master/slave relationships
>  drm/i915/adl_s: Update PHY_MISC programming
>  drm/i915/adl_s: Re-use TGL GuC/HuC firmware
>
>Tejas Upadhyay (1):
>  drm/i915/adl_s: Update memory bandwidth parameters
>
> arch/x86/kernel/early-quirks.c                |   1 +
> drivers/gpu/drm/i915/display/intel_bios.c     |  70 +++++++++--
> drivers/gpu/drm/i915/display/intel_bw.c       |   8 ++
> .../gpu/drm/i915/display/intel_combo_phy.c    |  23 +++-
> drivers/gpu/drm/i915/display/intel_csr.c      |  10 +-
> drivers/gpu/drm/i915/display/intel_ddi.c      |  64 ++++++----
> drivers/gpu/drm/i915/display/intel_display.c  |  37 +++++-
> .../drm/i915/display/intel_display_power.c    |  11 +-
> drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  38 +++++-
> drivers/gpu/drm/i915/display/intel_hdmi.c     |  20 ++-
> drivers/gpu/drm/i915/display/intel_psr.c      |   4 +-
> drivers/gpu/drm/i915/display/intel_sprite.c   |   8 +-
> drivers/gpu/drm/i915/display/intel_vbt_defs.h |   4 +
> drivers/gpu/drm/i915/gt/intel_workarounds.c   | 119 ++++++++++++------
> drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |   4 +-
> drivers/gpu/drm/i915/i915_drv.h               |  47 ++++---
> drivers/gpu/drm/i915/i915_irq.c               |   5 +-
> drivers/gpu/drm/i915/i915_pci.c               |  13 ++
> drivers/gpu/drm/i915/i915_reg.h               |  54 +++++++-
> drivers/gpu/drm/i915/intel_device_info.c      |   9 +-
> drivers/gpu/drm/i915/intel_device_info.h      |   1 +
> drivers/gpu/drm/i915/intel_dram.c             |  18 ++-
> drivers/gpu/drm/i915/intel_pch.c              |   8 +-
> drivers/gpu/drm/i915/intel_pch.h              |   3 +
> drivers/gpu/drm/i915/intel_pm.c               |   2 +-
> include/drm/i915_pciids.h                     |  13 ++

besides the changes to uC and workarounds, all the rest would go
through dinq. Should we bother creating a topic branch for adl-s?

Lucas De Marchi

> 26 files changed, 464 insertions(+), 130 deletions(-)
>
>-- =

>2.27.0
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
