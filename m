Return-Path: <SRS0=HSM9=GJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TRACKER_ID,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB63C433E0
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Jan 2021 19:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C9F02311B
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Jan 2021 19:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C9F02311B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B69891B4;
	Wed,  6 Jan 2021 19:09:52 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CEE89F1B
 for <intel-gfx@lists.freedesktop.org>; Wed,  6 Jan 2021 19:09:50 +0000 (UTC)
IronPort-SDR: FmBYgWNFUgAi29qHL9q3LwFZFg5BkuG0oeYFDzwC7lQp4p6YYv7UkhV6/qSqVqhGbAIRmWOyOy
 NlaagMzcXp0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9856"; a="156511292"
X-IronPort-AV: E=Sophos;i="5.79,327,1602572400"; d="scan'208";a="156511292"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 11:09:50 -0800
IronPort-SDR: Ao3rT7Dz9YpNqB2XTjOQD9TVPcY+HQ9cLOsgq9E/i8Qyg6WwhBDk7n7mgLEX5fhMahQpHlKzxE
 svL72pT6ke1Q==
X-IronPort-AV: E=Sophos;i="5.79,327,1602572400"; d="scan'208";a="379391290"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 11:09:48 -0800
Date: Wed, 6 Jan 2021 21:09:45 +0200
From: Imre Deak <imre.deak@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20210106190945.GA213231@ideak-desk.fi.intel.com>
References: <20210106175301.GB202232@ideak-desk.fi.intel.com>
 <X/X7umSYEeKCZ0Dw@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/X7umSYEeKCZ0Dw@kroah.com>
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
Reply-To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Jan 06, 2021 at 07:04:42PM +0100, Greg KH wrote:
> On Wed, Jan 06, 2021 at 07:53:01PM +0200, Imre Deak wrote:
> > Stable team, please backport the upstream commit
> > 
> > 8f329967d596 ("drm/i915/tgl: Fix Combo PHY DPLL fractional divider for 38.4MHz ref clock")
> > 
> > to the v5.10 stable kernel.
> 
> I see no such commit id in Linus's kernel :(

Sorry, the commit id correctly is

0e2497e334de42dbaaee8e325241b5b5b34ede7e

--Imre
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
