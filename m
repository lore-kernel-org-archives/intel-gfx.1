Return-Path: <SRS0=lJ7G=P5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A79CC433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Nov 2021 23:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F091461038
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Nov 2021 23:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F091461038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40E06E7D9;
	Wed, 10 Nov 2021 23:30:38 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83B26E5BB;
 Wed, 10 Nov 2021 23:30:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="296254632"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="296254632"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 15:30:36 -0800
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="504194438"
Received: from rdomark-mobl1.ccr.corp.intel.com (HELO intel.com)
 ([10.249.34.125])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 15:30:34 -0800
Date: Thu, 11 Nov 2021 00:30:31 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Stimson, Dale B" <dale.b.stimson@intel.com>
Message-ID: <YYxWF8TEIbJZH5lF@intel.intel>
References: <20211110232018.GA33197@dbstims-dev.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110232018.GA33197@dbstims-dev.fm.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 05/10] drm/i915: Prepare for multiple gts
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi,

> > +#define for_each_gt(i915__, id__, gt__) \
> > +	for ((id__) = 0; \
> > +	     (id__) < I915_MAX_TILES; \
> > +	     (id__)++) \
> > +		for_each_if(((gt__) = (i915__)->gts[(id__)]))
> 
> In this patch set, symbol I915_MAX_TILES is introduced.
> In a later patch set of this series, I915_MAX_TILES is renamed to I915_MAX_GTS.
> How about using name I915_MAX_GTS consistently through the patch series?
> 
> It will make the history easier to understand, and should this patch series
> be merged in pieces, it will avoid having to do the rename in software that
> depends on this.

speaking of which I915_MAX_GTS is not a great choice of a name:
as Jani pointed out in one of his prevoius reviews, how do we
intrepret it, GTS or GTs?

Andi
