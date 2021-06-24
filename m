Return-Path: <SRS0=foSz=LS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BFEC49EA6
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 15:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D781613DC
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 15:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D781613DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A257D6EC41;
	Thu, 24 Jun 2021 15:48:42 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9E76EB5E;
 Thu, 24 Jun 2021 15:48:41 +0000 (UTC)
IronPort-SDR: K7BkZt89mNhsRSouk3qgbYVJhKsX+S3uAbkQ7B5v0YmpGc/g+2ajyfq5VSk0TGc/FeiSNgZ3LG
 adRXE/NpwLbw==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="268630784"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="268630784"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 08:48:40 -0700
IronPort-SDR: zBwbJmFI9wx/89LsVN1u+c7y3aF8xYk5lgETlLZpOrklgTgsf11ryBzbYPT7JC25hqikPV6uFO
 DHLspgvYQQWA==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="424115448"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 08:48:39 -0700
Date: Thu, 24 Jun 2021 08:41:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20210624154158.GA1629@sdutt-i7>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-4-matthew.brost@intel.com>
 <0b04e2ee-f5f3-3eb9-ad9f-a595f1942e4c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b04e2ee-f5f3-3eb9-ad9f-a595f1942e4c@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [PATCH 03/47] drm/i915/guc: Increase size of CTB
 buffers
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

On Thu, Jun 24, 2021 at 03:49:55PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 24.06.2021 09:04, Matthew Brost wrote:
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
> > index 07f080ddb9ae..a17215920e58 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > @@ -58,11 +58,16 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
> >   *      +--------+-----------------------------------------------+------+
> >   *
> >   * Size of each `CT Buffer`_ must be multiple of 4K.
> > - * As we don't expect too many messages, for now use minimum sizes.
> > + * We don't expect too many messages in flight at any time, unless we are
> > + * using the GuC submission. In that case each request requires a minimum
> > + * 2 dwords which gives us a maximum 256 queue'd requests. Hopefully this
> > + * enough space to avoid backpressure on the driver. We increase the size
> > + * of the receive buffer (relative to the send) to ensure a G2H response
> > + * CTB has a landing spot.
> >   */
> >  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
> >  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> > -#define CTB_G2H_BUFFER_SIZE	(SZ_4K)
> > +#define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
> >  
> >  struct ct_request {
> >  	struct list_head link;
> > @@ -641,7 +646,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
> >  	/* beware of buffer wrap case */
> >  	if (unlikely(available < 0))
> >  		available += size;
> > -	CT_DEBUG(ct, "available %d (%u:%u)\n", available, head, tail);
> > +	CT_DEBUG(ct, "available %d (%u:%u:%u)\n", available, head, tail, size);
> 
> CTB size is already printed in intel_guc_ct_init() and is fixed so not
> sure if repeating it on every ct_read has any benefit
> 

I'd say more debug the better and if CT_DEBUG is enabled the logs are
very verbose so an extra value doesn't really hurt.

Matt

> >  	GEM_BUG_ON(available < 0);
> >  
> >  	header = cmds[head];
> > 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
