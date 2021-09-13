Return-Path: <SRS0=s8fd=OD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F3AC433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Sep 2021 17:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00E9A61029
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Sep 2021 17:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00E9A61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53AD6ECC8;
	Mon, 13 Sep 2021 17:00:06 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B086ECC8;
 Mon, 13 Sep 2021 17:00:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="219857055"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="219857055"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 10:00:04 -0700
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="515517559"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 10:00:04 -0700
Date: Mon, 13 Sep 2021 09:55:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Message-ID: <20210913165504.GB8862@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-8-matthew.brost@intel.com>
 <7b0f2535-a0f7-e423-d929-63f31febee14@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b0f2535-a0f7-e423-d929-63f31febee14@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [PATCH 07/27] drm/i915/guc: Don't call
 switch_to_kernel_context with GuC submission
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

On Thu, Sep 09, 2021 at 03:51:27PM -0700, John Harrison wrote:
> On 8/20/2021 15:44, Matthew Brost wrote:
> > Calling switch_to_kernel_context isn't needed if the engine PM reference
> > is taken while all contexts are pinned. By not calling
> > switch_to_kernel_context we save on issuing a request to the engine.
> I thought the intention of the switch_to_kernel was to ensure that the GPU
> is not touching any user context and is basically idle. That is not a valid
> assumption with an external scheduler such as GuC. So why is the description
> above only mentioning PM references? What is the connection between the PM
> ref and the switch_to_kernel?
> 
> Also, the comment in the code does not mention anything about PM references,
> it just says 'not necessary with GuC' but no explanation at all.
> 
> 
> > v2:
> >   (Daniel Vetter)
> >    - Add FIXME comment about pushing switch_to_kernel_context to backend
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > index 1f07ac4e0672..11fee66daf60 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > @@ -162,6 +162,15 @@ static bool switch_to_kernel_context(struct intel_engine_cs *engine)
> >   	unsigned long flags;
> >   	bool result = true;
> > +	/*
> > +	 * No need to switch_to_kernel_context if GuC submission
> > +	 *
> > +	 * FIXME: This execlists specific backend behavior in generic code, this
> "This execlists" -> "This is execlist"
> 
> "this should be" -> "it should be"
> 

Missed this. Will fix in next rev.

Matt

> John.
> 
> > +	 * should be pushed to the backend.
> > +	 */
> > +	if (intel_engine_uses_guc(engine))
> > +		return true;
> > +
> >   	/* GPU is pointing to the void, as good as in the kernel context. */
> >   	if (intel_gt_is_wedged(engine->gt))
> >   		return true;
> 
