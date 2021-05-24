Return-Path: <SRS0=+tRi=KT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BF3C04FF3
	for <intel-gfx@archiver.kernel.org>; Mon, 24 May 2021 18:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 787186140F
	for <intel-gfx@archiver.kernel.org>; Mon, 24 May 2021 18:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 787186140F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33096E908;
	Mon, 24 May 2021 18:47:56 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE82B6E908;
 Mon, 24 May 2021 18:47:55 +0000 (UTC)
IronPort-SDR: KRn5IaRyrguHPnsR4xe2ek01LCVTdrds4nRP35LsODX8eicWWFaW/bq6dI7+rIxrv9ABUS73xp
 xx/OMGB/VYkw==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="223164889"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="223164889"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 11:47:54 -0700
IronPort-SDR: zhjFNWQKh3hD3Mk8vjBGZ8IMWi7lnOCq3mGmWkXQMkHpZ/EKBi1J6IZT2HYD01svt+NY+ORw3p
 a+dTB1xORx+Q==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="396500396"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 11:47:54 -0700
Date: Mon, 24 May 2021 11:40:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20210524184045.GA13139@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-40-matthew.brost@intel.com>
 <596cb7fb-588a-f5f1-6119-1393b8faf8a6@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <596cb7fb-588a-f5f1-6119-1393b8faf8a6@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [RFC PATCH 39/97] drm/i915/guc: Increase size of
 CTB buffers
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 03:43:11PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 06.05.2021 21:13, Matthew Brost wrote:
> > With the introduction of non-blocking CTBs more than one CTB can be in
> > flight at a time. Increasing the size of the CTBs should reduce how
> > often software hits the case where no space is available in the CTB
> > buffer.
> > 
> > Cc: John Harrison <john.c.harrison@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > index 77dfbc94dcc3..d6895d29ed2d 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > @@ -63,11 +63,16 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
> >   *      +--------+-----------------------------------------------+------+
> >   *
> >   * Size of each `CT Buffer`_ must be multiple of 4K.
> > - * As we don't expect too many messages, for now use minimum sizes.
> > + * We don't expect too many messages in flight at any time, unless we are
> > + * using the GuC submission. In that case each request requires a minimum
> > + * 16 bytes which gives us a maximum 256 queue'd requests. Hopefully this
> 
> nit: all our CTB calculations are in dwords now, not bytes
> 

I can change the wording to DW sizes.

> > + * enough space to avoid backpressure on the driver. We increase the size
> > + * of the receive buffer (relative to the send) to ensure a G2H response
> > + * CTB has a landing spot.
> 
> hmm, but we are not checking G2H CTB yet
> will start doing it around patch 54/97
> so maybe this other patch should be introduced earlier ?
>

Yes, that patch is going to be pulled down to an earlier spot in the
series.
 
> >   */
> >  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
> >  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> > -#define CTB_G2H_BUFFER_SIZE	(SZ_4K)
> > +#define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
> 
> in theory, we (host) should be faster than GuC, so G2H CTB shall be
> almost always empty, if this is not a case, maybe we should start
> monitoring what is happening and report some warnings if G2H is half full ?
>

Certainly some IGTs put some more pressure on the G2H channel than the
H2G channel at least I think. This is something we can tune over time
after this lands upstream. IMO a message at this point is overkill.

Matt
 
> >  
> >  #define MAX_US_STALL_CTB	1000000
> >  
> > @@ -753,7 +758,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
> >  	/* beware of buffer wrap case */
> >  	if (unlikely(available < 0))
> >  		available += size;
> > -	CT_DEBUG(ct, "available %d (%u:%u)\n", available, head, tail);
> > +	CT_DEBUG(ct, "available %d (%u:%u:%u)\n", available, head, tail, size);
> >  	GEM_BUG_ON(available < 0);
> >  
> >  	header = cmds[head];
> > 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
