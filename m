Return-Path: <SRS0=hFQw=IK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CDEC433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Mar 2021 02:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D557964F87
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Mar 2021 02:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D557964F87
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827E86EC8D;
	Fri, 12 Mar 2021 02:57:44 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D226EC55;
 Fri, 12 Mar 2021 02:57:42 +0000 (UTC)
IronPort-SDR: PkE0AOBrVNkdFdbJrbgRnaFSAVLqmNti1TPbHYcgcvS0dcB8Kyhuo07mbOjtmEVgnyZhtHWPF/
 LanAMV3fFGLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="252791471"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="252791471"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 18:57:39 -0800
IronPort-SDR: BaXb6L6l8bvZE/tdmN0h3kVU8QCrSweoHGs3p/qEFKo15aMeL+hdXH4viyL/b0Ba5w0Wxups4/
 14udxTT4djKg==
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="448490347"
Received: from lucindar-mobl2.amr.corp.intel.com (HELO intel.com)
 ([10.209.122.103])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 18:57:38 -0800
Date: Thu, 11 Mar 2021 21:57:36 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>
Message-ID: <YErYoFUwmmpMNTyk@intel.com>
References: <YEn+yXnNFFoW5+CF@intel.com>
 <CAPM=9tyi=qSSbkgh_cmDWiRfsnxyd+5shNFXdce2xZityUkUpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9tyi=qSSbkgh_cmDWiRfsnxyd+5shNFXdce2xZityUkUpQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PULL] drm-intel-fixes
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Mar 12, 2021 at 11:36:51AM +1000, Dave Airlie wrote:
> On Thu, 11 Mar 2021 at 21:28, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> >
> > Hi Dave and Daniel,
> >
> > Things are very quiet. Only 1 fix this round.
> > Since I will be out next week, if this trend continues I will
> > accumulate 2 weeks and send when in -rc4.
> >
> > Here goes drm-intel-fixes-2021-03-11:
> >
> > - Wedge the GPU if command parser setup fails (Tvrtko)
> >
> > Thanks,
> > Rodrigo.
> >
> > The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
> >
> >   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
> 
> This was based on 5.12-rc1 against my request earlier in the week to
> not do that. but since it was a single patch I just cherry-picked it
> across.

I'm really sorry about that! It is so unusual to have this low influx
of patches at this round that I'm not used and end up forgetting to rebase.

> 
> Can we make sure no fixes or next based on rc1 arrive please.

Sure thing.

> 
> Dave.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
