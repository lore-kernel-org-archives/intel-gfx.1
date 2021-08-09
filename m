Return-Path: <SRS0=mdfT=NA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C224C432BE
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Aug 2021 19:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EF7D60231
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Aug 2021 19:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EF7D60231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E76989C55;
	Mon,  9 Aug 2021 19:07:01 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC8889180;
 Mon,  9 Aug 2021 19:06:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="195026834"
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="195026834"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 12:06:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="671020580"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 12:06:58 -0700
Date: Mon, 9 Aug 2021 19:06:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <20210809190657.GA123873@DUT151-ICLU.fm.intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-22-matthew.brost@intel.com>
 <YRFLbB2Ayzf+KDz/@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRFLbB2Ayzf+KDz/@phenom.ffwll.local>
Subject: Re: [Intel-gfx] [PATCH 21/46] drm/i915/guc: Add
 guc_child_context_destroy
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

On Mon, Aug 09, 2021 at 05:36:12PM +0200, Daniel Vetter wrote:
> On Tue, Aug 03, 2021 at 03:29:18PM -0700, Matthew Brost wrote:
> > Since child contexts do not own the guc_ids or GuC context registration,
> > child contexts can simply be freed on destroy. Add
> > guc_child_context_destroy context operation to do this.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 2d8296bcc583..850edeff9230 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -2828,6 +2828,13 @@ static void destroy_worker_func(struct work_struct *w)
> >  		intel_gt_pm_unpark_work_add(gt, destroy_worker);
> >  }
> >  
> > +/* Future patches will use this function */
> > +__maybe_unused
> 
> Pure bikeshed, but for something this small just squash it in with the
> first user. This kinda does nothing alone.
> -Daniel
> 

Sure.

Matt

> > +static void guc_child_context_destroy(struct kref *kref)
> > +{
> > +	__guc_context_destroy(container_of(kref, struct intel_context, ref));
> > +}
> > +
> >  static void guc_context_destroy(struct kref *kref)
> >  {
> >  	struct intel_context *ce = container_of(kref, typeof(*ce), ref);
> > -- 
> > 2.28.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
