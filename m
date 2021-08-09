Return-Path: <SRS0=mdfT=NA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D798C4338F
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Aug 2021 14:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E684A61002
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Aug 2021 14:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E684A61002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBEA89C3F;
	Mon,  9 Aug 2021 14:29:50 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E83890DB;
 Mon,  9 Aug 2021 14:29:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2CAA967357; Mon,  9 Aug 2021 16:29:45 +0200 (CEST)
Date: Mon, 9 Aug 2021 16:29:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <20210809142945.GA18850@lst.de>
References: <20210721155355.173183-1-hch@lst.de>
 <20210721155355.173183-5-hch@lst.de>
 <162850857939.5634.17747219922172884449@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162850857939.5634.17747219922172884449@jlahtine-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] [PATCH 04/21] drm/i915/gvt: move the gvt code into
 kvmgt.ko
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

On Mon, Aug 09, 2021 at 02:29:39PM +0300, Joonas Lahtinen wrote:
> Thanks for putting the work into this. This conversion has been
> requested for a long time. For clarity, should we call the module
> i915_kvmgt?

If this was a new module that would be my preferance.  But the
kvmgt module already exists, so I thought it might be a good idea
to keep the name.

> How far would we be from dynamically modprobing/rmmoding the kvmgt
> module in order to eliminate the enable_gvt parameter?

Hmm.  I suspect it could be done fairly easily, but from what I see
it would still require to disable GUC at i915 module load time.

If you want I could look into that for an incremental patch, but
to unblock the vfio/mdev work I'd like to do that in a separate
stage.
