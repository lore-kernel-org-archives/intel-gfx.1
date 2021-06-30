Return-Path: <SRS0=djoz=LY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2039C11F67
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Jun 2021 01:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C8CA61D81
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Jun 2021 01:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C8CA61D81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593FE6E0D5;
	Wed, 30 Jun 2021 01:02:06 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879D56E075;
 Wed, 30 Jun 2021 01:02:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="205260123"
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; d="scan'208";a="205260123"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 18:02:03 -0700
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; d="scan'208";a="455098067"
Received: from jmckerne-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.37.128])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 18:02:03 -0700
Date: Tue, 29 Jun 2021 18:02:02 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Message-ID: <20210630010202.ewlpgzxtvezbivpb@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210621125622.877864-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621125622.877864-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [Intel-gfx] [PATCH V2] drm/i915/ehl: Update MOCS table for EHL
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 06:26:22PM +0530, Tejas Upadhyay wrote:
>From: Matt Roper <matthew.d.roper@intel.com>
>
>These extra EHL entries were not behaving as expected without proper
>flushing implemented in kernel.
>Commit a679f58d0510 ("drm/i915: Flush pages on acquisition")
>introduces proper flushing to make it work as expected.
>
>Hence adding those EHL entries back.
>
>Changes since V1:
>	- commit message modified with Commit - Joonas
>
>Cc: Francisco Jerez <francisco.jerez.plata@intel.com>
>Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: <stable@vger.kernel.org>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Fixes: 046091758b50 ("Revert "drm/i915/ehl: Update MOCS table for EHL"")

This story here is weird as we reverted something going to
v5.4 due to something missing, but that something was already in the
tree since v5.1. So it seems the revert shouldn't had been done in the
first place? What am I reading wrong here?

For any gt/gem patches, we need to Cc dri-devel, done now.

Also, it seems your client is suppressing the Cc you added in the body,
so you are actually not sending anything to stable, or to the people
added there.


>Link: https://patchwork.freedesktop.org/patch/msgid/20191112224757.25116-1-matthew.d.roper@intel.com
>---
> drivers/gpu/drm/i915/gt/intel_mocs.c | 8 ++++++++
> 1 file changed, 8 insertions(+)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
>index 17848807f111..7d9ef0210805 100644
>--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
>+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
>@@ -194,6 +194,14 @@ static const struct drm_i915_mocs_entry broxton_mocs_table[] = {
> 	MOCS_ENTRY(15, \
> 		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2) | LE_AOM(1), \
> 		   L3_3_WB), \
>+	/* Bypass LLC - Uncached (EHL+) */ \
>+	MOCS_ENTRY(16, \
>+		   LE_1_UC | LE_TC_1_LLC | LE_SCF(1), \
>+		   L3_1_UC), \
>+	/* Bypass LLC - L3 (Read-Only) (EHL+) */ \
>+	MOCS_ENTRY(17, \
>+		   LE_1_UC | LE_TC_1_LLC | LE_SCF(1), \
>+		   L3_3_WB), \

For the change itself: it matches bspec 34007.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> 	/* Self-Snoop - L3 + LLC */ \
> 	MOCS_ENTRY(18, \
> 		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SSE(3), \
>-- 
>2.31.1
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
