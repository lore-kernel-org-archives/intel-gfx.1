Return-Path: <SRS0=pd08=MO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AED6C6377D
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Jul 2021 07:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC7CB61279
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Jul 2021 07:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC7CB61279
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724036E828;
	Thu, 22 Jul 2021 07:23:58 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218A86E828
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Jul 2021 07:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=aA4619Na/ZHkeZlhbllXdfTMmrfh9fAGhgxPqU7d/9c=; b=hGWYQCeHTvaiX/eMNfZkLitN8M
 z3bO5YU2fVEdgZW0LrYkYY+RcjEtBlZpauIZwXN9eJ8x049VA0mu75nMKbjI8r9J/YFTAZ+6oCNqq
 sbqZxZZEWAJ2gWeCKF2xLbc6yb3Qro+20q70Hpyz1DXrxGkQKF6ChqGIN4ZNawE8IkIXN+gLwFtB6
 xY2gPF202bvxHdVwfqn63RoOnTEQ5XqUPDldHfJyMV09QVfsXBKAl7QzMv+8IdTc2ytnEBroN6vNQ
 h9EOtJJP1QaDjcaaTf/qX07p3jrFYqVKG8w8tGaD6yRmgi/wcs9llDvizMKT/TmXu3MBUEV6Kwy+9
 DapRxx1A==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m6T2p-009zgY-C2; Thu, 22 Jul 2021 07:23:19 +0000
Date: Thu, 22 Jul 2021 08:22:59 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <YPkc0yKx1IEcXwoy@infradead.org>
References: <20210721220023.268194-1-rodrigo.vivi@intel.com>
 <20210722060534.mbbicupeecihgyww@ldmartin-desk2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722060534.mbbicupeecihgyww@ldmartin-desk2>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Intel-gfx] [PATCH] drm/i915/bios: Fix ports mask
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
Cc: Christoph Hellwig <hch@infradead.org>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

> > init_vbt_missing_defaults(struct drm_i915_private *i915)
> > {
> > 	enum port port;
> > -	int ports = PORT_A | PORT_B | PORT_C | PORT_D | PORT_E | PORT_F;
> > +	int ports = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C) | \
> > +		    BIT(PORT_D) | BIT(PORT_E) | BIT(PORT_F);

No need for the \, this isn't a macro.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
