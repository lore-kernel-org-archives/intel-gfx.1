Return-Path: <SRS0=bte8=MW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A6FC4338F
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Jul 2021 22:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61FC36103B
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Jul 2021 22:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61FC36103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4AB6F4D1;
	Fri, 30 Jul 2021 22:22:05 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912DC6F4D1
 for <intel-gfx@lists.freedesktop.org>; Fri, 30 Jul 2021 22:22:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10061"; a="235092719"
X-IronPort-AV: E=Sophos;i="5.84,283,1620716400"; d="scan'208";a="235092719"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 15:22:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,283,1620716400"; d="scan'208";a="667459918"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 15:22:02 -0700
Date: Fri, 30 Jul 2021 15:22:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Message-ID: <20210730222201.GY1556418@mdroper-desk1.amr.corp.intel.com>
References: <20210728233411.2365788-1-matthew.d.roper@intel.com>
 <20210729010555.GI1556418@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729010555.GI1556418@mdroper-desk1.amr.corp.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Correct SFC_DONE register offset
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

On Wed, Jul 28, 2021 at 06:05:57PM -0700, Matt Roper wrote:
> On Wed, Jul 28, 2021 at 04:34:11PM -0700, Matt Roper wrote:
> > The register offset for SFC_DONE was missing a '0' at the end, causing
> > us to read from a non-existent register address.  We only use this
> > register in error state dumps so the mistake hasn't caused any real
> > problems, but fixing it will hopefully make the error state dumps a bit
> > more useful for debugging.
> > 
> > Fixes: e50dbdbfd9fb ("drm/i915/tgl: Add SFC instdone to error state")
> > Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> Hmm, actually on a closer look it appears this register may have been
> removed completely from media version 12.  It will return in media
> version 13 at this offset, but for now I guess we should just drop it
> completely.

Nevermind; this register is still there on media version 12 (bspec
48109).  The current register offset in the code is incorrect, so this
patch is indeed valid.


Matt

> 
> 
> Matt
> 
> > ---
> >  drivers/gpu/drm/i915/i915_reg.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> > index 70eed4fe3fe3..49dd5e75429e 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -430,7 +430,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
> >  #define   GEN12_HCP_SFC_LOCK_ACK_BIT		REG_BIT(1)
> >  #define   GEN12_HCP_SFC_USAGE_BIT			REG_BIT(0)
> >  
> > -#define GEN12_SFC_DONE(n)		_MMIO(0x1cc00 + (n) * 0x100)
> > +#define GEN12_SFC_DONE(n)		_MMIO(0x1cc000 + (n) * 0x1000)
> >  #define GEN12_SFC_DONE_MAX		4
> >  
> >  #define RING_PP_DIR_BASE(base)		_MMIO((base) + 0x228)
> > -- 
> > 2.25.4
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> VTT-OSGC Platform Enablement
> Intel Corporation
> (916) 356-2795

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
