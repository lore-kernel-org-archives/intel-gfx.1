Return-Path: <SRS0=BkXb=GK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C5FC433E0
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jan 2021 13:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F51122D01
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jan 2021 13:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F51122D01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE096E22B;
	Thu,  7 Jan 2021 13:13:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E786E22B
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 Jan 2021 13:13:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DD2B223C8;
 Thu,  7 Jan 2021 13:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1610025185;
 bh=sBaRgt9v5nPEv/YZQlpS6zarzR2tvC1DT8Zf2tm0ZxY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b7bBAyMfXt7V4aW/SorObkV7/lz3G6s0ars2K9mGiyruC66kWAxZaD4yMLmiQRwLg
 o4eW4e+44Yq7079xdRDmlEKej0J4jALe9TUA2KS605zKVwEWSMBtiKFV4VRtmPvomR
 5dd942x3nTrkcXiuSd0yNwvn1krqO3GWsYKWstpU=
Date: Thu, 7 Jan 2021 14:14:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Imre Deak <imre.deak@intel.com>
Message-ID: <X/cJMWjnhr+JFh/N@kroah.com>
References: <20210106175301.GB202232@ideak-desk.fi.intel.com>
 <X/X7umSYEeKCZ0Dw@kroah.com>
 <20210106190945.GA213231@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210106190945.GA213231@ideak-desk.fi.intel.com>
Subject: Re: [Intel-gfx] v5.10 stable backport request
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Jan 06, 2021 at 09:09:45PM +0200, Imre Deak wrote:
> On Wed, Jan 06, 2021 at 07:04:42PM +0100, Greg KH wrote:
> > On Wed, Jan 06, 2021 at 07:53:01PM +0200, Imre Deak wrote:
> > > Stable team, please backport the upstream commit
> > > 
> > > 8f329967d596 ("drm/i915/tgl: Fix Combo PHY DPLL fractional divider for 38.4MHz ref clock")
> > > 
> > > to the v5.10 stable kernel.
> > 
> > I see no such commit id in Linus's kernel :(
> 
> Sorry, the commit id correctly is
> 
> 0e2497e334de42dbaaee8e325241b5b5b34ede7e

Much better :)

Now queued up, thanks.

greg k-h
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
