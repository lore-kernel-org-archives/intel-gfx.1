Return-Path: <SRS0=rOxW=NY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94141C433F5
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Sep 2021 22:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CBE96108E
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Sep 2021 22:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CBE96108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885776E82F;
	Thu,  2 Sep 2021 22:59:46 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED066E82F
 for <intel-gfx@lists.freedesktop.org>; Thu,  2 Sep 2021 22:59:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="198816277"
X-IronPort-AV: E=Sophos;i="5.85,263,1624345200"; d="scan'208";a="198816277"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 15:59:45 -0700
X-IronPort-AV: E=Sophos;i="5.85,263,1624345200"; d="scan'208";a="691734069"
Received: from spatty-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.147.99])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 15:59:44 -0700
Date: Thu, 2 Sep 2021 15:59:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20210902225944.px4pjdwklqov73rd@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210902185635.290538-1-ayaz.siddiqui@intel.com>
 <20210902185635.290538-3-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210902185635.290538-3-ayaz.siddiqui@intel.com>
Subject: Re: [Intel-gfx] [PATCH V4 2/6] drm/i915/gt: Set CMD_CCTL to UC for
 Gen12 Onward
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

On Fri, Sep 03, 2021 at 12:26:31AM +0530, Ayaz A Siddiqui wrote:
>Cache-control registers for Command Stream(CMD_CCTL) are used
>to set catchability for memory writes and reads outputted by
>Command Streamers on Gen12 onward platforms.
>
>These registers need to point un-cached(UC) MOCS index.
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_workarounds.c | 26 +++++++++++++++++++++
> drivers/gpu/drm/i915/i915_reg.h             | 17 ++++++++++++++
> 2 files changed, 43 insertions(+)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>index 94e1937f8d296..38c66765ff94c 100644
>--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>@@ -1640,6 +1640,30 @@ void intel_engine_apply_whitelist(struct intel_engine_cs *engine)
> 				   i915_mmio_reg_offset(RING_NOPID(base)));
> }
>
>+/*
>+ * engine_fake_wa_init(), a place holder to program the registers
>+ * which are not part of a workaround.
>+ * Adding programming of those register inside workaround will
>+ * allow utilizing wa framework to proper application and verification.
>+ */
>+static void
>+engine_fake_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>+{
>+	u8 mocs;
>+
>+	if (GRAPHICS_VER(engine->i915) >= 12) {

this is including TGL. Shouldn't TGL be the exception here?

Lucas De Marchi
