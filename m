Return-Path: <SRS0=SCM9=P4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898E3C433FE
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Nov 2021 11:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51DF361354
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Nov 2021 11:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51DF361354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B777D6E894;
	Tue,  9 Nov 2021 11:09:58 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FBB6E894;
 Tue,  9 Nov 2021 11:09:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="229887613"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="229887613"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 03:09:44 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="503463235"
Received: from stkachen-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.251.216.106])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 03:09:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
In-Reply-To: <YYo8axRhW/zFQUgW@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211015202648.258445ef@canb.auug.org.au>
 <20211101194223.749197c5@canb.auug.org.au>
 <20211105171517.287de894@canb.auug.org.au> <874k8qampc.fsf@intel.com>
 <20211106133314.42e3e308@canb.auug.org.au> <87zgqd6alj.fsf@intel.com>
 <YYo8axRhW/zFQUgW@phenom.ffwll.local>
Date: Tue, 09 Nov 2021 13:09:38 +0200
Message-ID: <87ilx160wd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] linux-next: build failure after merge of the
 drm-misc tree
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 09 Nov 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Tue, Nov 09, 2021 at 09:40:08AM +0200, Jani Nikula wrote:
>> On Sat, 06 Nov 2021, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > Hi Jani,
>> >
>> > On Fri, 05 Nov 2021 13:03:43 +0200 Jani Nikula <jani.nikula@intel.com> wrote:
>> >>
>> >> I probably should have pushed c4f08d7246a5 ("drm/locking: fix
>> >> __stack_depot_* name conflict") to drm-misc-next-fixes.
>> >
>> > Please do so as builds will start failing otherwise :-(
>> 
>> Thomas/Maxime/Maarten, okay to cherry-pick that to drm-misc-next-fixes?
>
> Yeah just do, for drm-misc this is considered in committer purview. I
> think we should add a section to the docs about "What if a patch is in the
> wrong branch" which tells you to just cherry-pick -x or whatever.

Done.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
