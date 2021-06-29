Return-Path: <SRS0=NZj8=LX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66811C11F67
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Jun 2021 15:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3482161DA6
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Jun 2021 15:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3482161DA6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BF46E8B5;
	Tue, 29 Jun 2021 15:20:38 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75566E8B5
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Jun 2021 15:20:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="195320699"
X-IronPort-AV: E=Sophos;i="5.83,309,1616482800"; d="scan'208";a="195320699"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 08:20:36 -0700
X-IronPort-AV: E=Sophos;i="5.83,309,1616482800"; d="scan'208";a="408473807"
Received: from liubin1-mobl.amr.corp.intel.com (HELO intel.com) ([10.212.5.44])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 08:20:36 -0700
Date: Tue, 29 Jun 2021 11:20:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Message-ID: <YNs6Qgg6vqc9zzDf@intel.com>
References: <20210629104954.927151-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <YNs5r68QEd9tcQJy@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNs5r68QEd9tcQJy@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Jun 29, 2021 at 11:18:09AM -0400, Rodrigo Vivi wrote:
> On Tue, Jun 29, 2021 at 04:19:54PM +0530, Tejas Upadhyay wrote:
> > Removing force probe protection from EHL platform. Did
> > not observe warnings, errors, flickering or any visual
> > defects while doing ordinary tasks like browsing and
> > editing documents in a two monitor setup.
> > 
> > For more info drm-tip idle run results :
> > https://intel-gfx-ci.01.org/tree/drm-tip/drmtip.html?
> > 
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
and pushed...

thanks for the patch

> 
> > ---
> >  drivers/gpu/drm/i915/i915_pci.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> > index f1f43192f9fb..7d472611a190 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -845,7 +845,6 @@ static const struct intel_device_info icl_info = {
> >  static const struct intel_device_info ehl_info = {
> >  	GEN11_FEATURES,
> >  	PLATFORM(INTEL_ELKHARTLAKE),
> > -	.require_force_probe = 1,
> >  	.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(VCS0) | BIT(VECS0),
> >  	.ppgtt_size = 36,
> >  };
> > -- 
> > 2.31.1
> > 
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
