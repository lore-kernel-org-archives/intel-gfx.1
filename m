Return-Path: <SRS0=3Rq4=PR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5BDC433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 29 Oct 2021 00:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF8196103B
	for <intel-gfx@archiver.kernel.org>; Fri, 29 Oct 2021 00:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF8196103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752726E96B;
	Fri, 29 Oct 2021 00:16:18 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668966E96B;
 Fri, 29 Oct 2021 00:16:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="228006155"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="228006155"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 17:16:16 -0700
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="498650985"
Received: from roymalle-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.32.55])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 17:16:13 -0700
Date: Fri, 29 Oct 2021 02:16:10 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Andi Shyti <andi@etezian.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <YXs9Sq87Lukml5wr@intel.intel>
References: <20211008215635.2026385-1-matthew.d.roper@intel.com>
 <20211008215635.2026385-9-matthew.d.roper@intel.com>
 <YXrQEb1Isc+n9dAO@jack.zhora.eu>
 <20211028232053.GG602200@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028232053.GG602200@mdroper-desk1.amr.corp.intel.com>
Subject: Re: [Intel-gfx] [PATCH 08/11] drm/i915/xehp: Make IRQ reset and
 postinstall multi-tile aware
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

Hi Matt,

> > > -	dg1_master_intr_enable(uncore->regs);
> > > -	intel_uncore_posting_read(uncore, DG1_MSTR_TILE_INTR);
> > > +	dg1_master_intr_enable(dev_priv->gt.uncore->regs);
> > > +	intel_uncore_posting_read(dev_priv->gt.uncore, DG1_MSTR_TILE_INTR);
> > 
> > I guess this should also go under a for_each_gt()
> 
> DG1_MSTR_TILE_INTR (0x190008) is the top-level, one-per-PCI device
> interrupt register; we always access it via tile0's MMIO .  So in this
> case we do want to do this outside the loop since it's not a per-tile
> operation.

yes of course... we are writing to the master interrupt.

> We could probably simplify the dev_priv->gt.uncore parameter to just
> dev_priv->uncore to make this more obvious.

... it would be a nitpick, but nice to have.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
