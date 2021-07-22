Return-Path: <SRS0=pd08=MO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD152C4338F
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Jul 2021 21:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 813F560E74
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Jul 2021 21:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 813F560E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2682F6ECCC;
	Thu, 22 Jul 2021 21:55:05 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B446EC2D;
 Thu, 22 Jul 2021 21:55:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="211470659"
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="211470659"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 14:55:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="416096168"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 14:55:02 -0700
Date: Thu, 22 Jul 2021 21:55:00 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <20210722215500.GA22641@DUT151-ICLU.fm.intel.com>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-51-matthew.brost@intel.com>
 <c0bd8e5c-784c-18cc-d724-f676dd3546aa@intel.com>
 <20210722213835.GA22352@DUT151-ICLU.fm.intel.com>
 <ebe8c917-c4b0-90a3-29df-030009cd7d51@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ebe8c917-c4b0-90a3-29df-030009cd7d51@intel.com>
Subject: Re: [Intel-gfx] [PATCH 50/51] drm/i915/guc: Implement GuC priority
 management
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 02:50:24PM -0700, Daniele Ceraolo Spurio wrote:
> 
> <snip>
> 
> > > > @@ -1756,15 +1796,119 @@ static int guc_context_alloc(struct intel_context *ce)
> > > >    	return lrc_alloc(ce, ce->engine);
> > > >    }
> > > > +static void guc_context_set_prio(struct intel_guc *guc,
> > > > +				 struct intel_context *ce,
> > > > +				 u8 prio)
> > > > +{
> > > > +	u32 action[] = {
> > > > +		INTEL_GUC_ACTION_SET_CONTEXT_PRIORITY,
> > > > +		ce->guc_id,
> > > > +		prio,
> > > > +	};
> > > > +
> > > > +	GEM_BUG_ON(prio < GUC_CLIENT_PRIORITY_KMD_HIGH ||
> > > > +		   prio > GUC_CLIENT_PRIORITY_NORMAL);
> > > > +
> > > > +	if (ce->guc_prio == prio || submission_disabled(guc) ||
> > > > +	    !context_registered(ce))
> > > > +		return;
> > > > +
> > > > +	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> > > > +
> > > > +	ce->guc_prio = prio;
> > > > +	trace_intel_context_set_prio(ce);
> > > > +}
> > > > +
> > > > +static inline u8 map_i915_prio_to_guc_prio(int prio)
> > > > +{
> > > > +	if (prio == I915_PRIORITY_NORMAL)
> > > > +		return GUC_CLIENT_PRIORITY_KMD_NORMAL;
> > > > +	else if (prio < I915_PRIORITY_NORMAL)
> > > > +		return GUC_CLIENT_PRIORITY_NORMAL;
> > > > +	else if (prio != I915_PRIORITY_BARRIER)
> > > Shouldn't this be I915_PRIORITY_UNPREEMPTABLE?
> > > 
> > No, I915_PRIORITY_UNPREEMPTABLE is an execlists only concept.
> 
> then we need a
> 
> /* we don't expect umpreemptable submissions with the GuC */
> GEM_BUG_ON(prio == I915_PRIORITY_UNPREEMPTABLE)
> 

Actually this probably should < I915_PRIORITY_DISPLAY as we really want
pageflips to be high than any user context.

Matt

> or something, because that prio level would be assigned incorrectly
> otherwise.
> 
> Daniele
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
