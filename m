Return-Path: <SRS0=Vblo=HU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D01FC433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Feb 2021 18:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFE6D64EB3
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Feb 2021 18:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFE6D64EB3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C29A6EA30;
	Thu, 18 Feb 2021 18:21:44 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788256EA30
 for <intel-gfx@lists.freedesktop.org>; Thu, 18 Feb 2021 18:21:42 +0000 (UTC)
IronPort-SDR: CknBtkO4dczpVy+XWVZujchyrjHiS/KMQLR/YQWoqTv048TbIWnIw061lPS8MpT3Y8lLQSEoXa
 LF1e/5UCq2JA==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="163384120"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="163384120"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 10:21:40 -0800
IronPort-SDR: za01azCJtZ2CoMHWk1zrdMCqZDyBY+aooJcdSwKxWkxy4grhjaHOzofhEo0QVpu/QbTQhxIzsR
 eJeqGacirriQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="364921300"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 18 Feb 2021 10:21:37 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Feb 2021 20:21:36 +0200
Date: Thu, 18 Feb 2021 20:21:36 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <YC6wMEIOfYOfLeKB@intel.com>
References: <20210212182201.155043-1-jose.souza@intel.com>
 <20210212182201.155043-3-jose.souza@intel.com>
 <YCbKi3rpV3pWwkHw@intel.com>
 <463536ed55ca9d96c96e48efe60e99e2dad8cb07.camel@intel.com>
 <YCbvjHhGHvD5vM+0@intel.com>
 <65170873d65d0bcd9bb97e10fe152b7a3c42bac0.camel@intel.com>
 <YC2VVWNAMSLqRdLR@intel.com>
 <cbb1fdee5dea7737ec209a114c84cd5aef5c11e4.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cbb1fdee5dea7737ec209a114c84cd5aef5c11e4.camel@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: Fix plane watermark mismatches
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Feb 18, 2021 at 05:25:54PM +0000, Souza, Jose wrote:
> On Thu, 2021-02-18 at 00:14 +0200, Ville Syrj=E4l=E4 wrote:
> > On Wed, Feb 17, 2021 at 05:24:03PM +0000, Souza, Jose wrote:
> > > On Fri, 2021-02-12 at 23:13 +0200, Ville Syrj=E4l=E4 wrote:
> > > > On Fri, Feb 12, 2021 at 07:44:22PM +0000, Souza, Jose wrote:
> > > > > On Fri, 2021-02-12 at 20:35 +0200, Ville Syrj=E4l=E4 wrote:
> > > > > > On Fri, Feb 12, 2021 at 10:22:01AM -0800, Jos=E9 Roberto de Sou=
za wrote:
> > > > > > > Found a system were firmware/BIOS left the plane_res_b and pl=
ane_res_l
> > > > > > > set with non-zero values for disable planes.
> > > > > > =

> > > > > > It pretty much happens always since the reset value is not zero.
> > > > > > IIRC we made the state chcker pedantic enough to complain about
> > > > > > that, so we need to clean it up.
> > > > > =

> > > > > Are you planning to fix it soon?
> > > > =

> > > > Fix what exactly? I guess you're seeing an actual problem of some s=
ort?
> > > =

> > > Your comment above made me understand that you were planning to fix t=
his plane watermark mismatches for disabled planes in other way other than =
what
> > > this patch does.
> > > Or should we proceed with this solution? =

> > =

> > There should be no mismatches with the current scheme.
> > We explicitly program wms to 0 for disabled planes.
> > =

> =

> It still happens when we take over the state that BIOS/firmware left.

That would seem to imply skl_wm_add_affected_planes() isn't working
right for some reason.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
