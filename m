Return-Path: <SRS0=MVSk=JS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EE1C433ED
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Apr 2021 11:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 740CF61424
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Apr 2021 11:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 740CF61424
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30C56E98C;
	Wed, 21 Apr 2021 11:24:48 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F287A6E98C
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Apr 2021 11:24:46 +0000 (UTC)
IronPort-SDR: C1XUUyVNzIEbkPF/IaCYg115UHyacrSvD6IOOsLg2v+5V1kbPRKmYWkpJWkkR3/t0UbIrG3Ti7
 DxQBDOHae8QA==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="216321001"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="216321001"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 04:24:46 -0700
IronPort-SDR: q3fPW4fj5fyqUViQiSfGLMaBxQa2bNbuWvzP1hrqdjOtU70pdjG1rBnfkQpKxy8ZZRGerjDPuM
 /oNFkuD8/nnQ==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="420958237"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 04:24:45 -0700
Date: Wed, 21 Apr 2021 14:24:41 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20210421112441.GA3514109@ideak-desk.fi.intel.com>
References: <20210414155208.3161335-1-imre.deak@intel.com>
 <87a6pzeqfi.fsf@intel.com> <87tunz99wu.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tunz99wu.fsf@intel.com>
Subject: Re: [Intel-gfx] [PATCH 00/11] drm/i915/adl_p: Add support for
 Display Page Tables
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 02:03:45PM +0300, Jani Nikula wrote:
> On Thu, 15 Apr 2021, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Wed, 14 Apr 2021, Imre Deak <imre.deak@intel.com> wrote:
> >> Alder Lake-P adds a new Display Page Table hardware structure, mapping
> >> tiled framebuffer pages to the display engine, reducing the address
> >> space required in GGTT for these framebuffers.
> >>
> >> This patchset adds support for this taking a minimum set of dependency
> >> patches from the ADL_P enabling patchset at
> >> https://patchwork.freedesktop.org/series/87897/
> >
> > Cc: Daniel
> >
> > I guess we'll need a topic branch for the base enabling to merge to both
> > din and dign? I guess it'll need to include the stuff in
> > topic/intel-gen-to-ver too.
> >
> > Shared stuff like this keeps being a problem with the separate dign
> > branch, especially when the only way to sync is to merge both din and
> > dign to drm-next and then backmerge to both.
> 
> I've created the topic branch.
> 
> When this series starts getting ready to merge, please use the
> topic/adl-p-enabling branch, so we can merge it to both drm-intel-next
> and drm-intel-gt-next.

Ok, thanks, I would need a review for 4 (trivial) patches in the
patchset. Could you explain the reason for a separate branch?

> BR,
> Jani.
> -- 
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
