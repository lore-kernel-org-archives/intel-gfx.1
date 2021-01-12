Return-Path: <SRS0=+Lzr=GP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC7EC433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 12 Jan 2021 16:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34A1322B2B
	for <intel-gfx@archiver.kernel.org>; Tue, 12 Jan 2021 16:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34A1322B2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B7489948;
	Tue, 12 Jan 2021 16:25:01 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3427789938
 for <intel-gfx@lists.freedesktop.org>; Tue, 12 Jan 2021 16:25:00 +0000 (UTC)
IronPort-SDR: xE1T+Q6JQ750rQ2D81ShkZy9kRAweIhf9TjX5SI0yvSNtL2vL013TFoW4BxmLt7OE+99j7+shY
 r+sGibQF28Iw==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="178216296"
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; d="scan'208";a="178216296"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 08:24:58 -0800
IronPort-SDR: Xvd/ZDtf57z5HZNjvEsUvmABdlFkQXK5bq4e2DoLr8zhorSwwSZfKzvcd9V7CfLz+NXiqTfBe3
 Zy1ryoRcfzBA==
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; d="scan'208";a="353085737"
Received: from vbucoci-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.39.237])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 08:24:55 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
In-Reply-To: <20210111212553.brclyuex7dgzeryu@ldmartin-desk1>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210108231853.2859646-1-aditya.swarup@intel.com>
 <20210108231853.2859646-2-aditya.swarup@intel.com>
 <20210108234440.GO3894148@mdroper-desk1.amr.corp.intel.com>
 <878s8zw7tw.fsf@intel.com> <875z43w7kq.fsf@intel.com>
 <20210111205743.GC4758@mdroper-desk1.amr.corp.intel.com>
 <20210111212553.brclyuex7dgzeryu@ldmartin-desk1>
Date: Tue, 12 Jan 2021 18:24:50 +0200
Message-ID: <87o8hut965.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/tgl: Use TGL stepping info for
 applying WAs
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 11 Jan 2021, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Mon, Jan 11, 2021 at 12:57:43PM -0800, Matt Roper wrote:
>>On Mon, Jan 11, 2021 at 10:18:45PM +0200, Jani Nikula wrote:
>>So to clarify, it looks like we have a bunch of revid changes to the
>>display code that got merged to the gt-next tree but not to the
>>intel-next tree?  Should we be going back and also merging /
>>cherry-picking those over to intel-next since that's where the display
>>changes are supposed to go, or is it too late to do that cleanly at this
>>point?
>
> it was my mistake to merge them to drm-intel-gt-next. They should have
> been in drm-intel-next.

That's not the problem though. The branches generally being too far
apart atm is. The single cherry-pick won't solve that. Applying these
patches to one tree just adds a dependency that will not be around in
the topic branch baseline, creating a new problem for merging the topic
branch.

>>Going forward, what should the general strategy be for stuff like
>>platform definitions and such?  Merge such enablement patches to both
>
> last time we talked about this was regarding dg1 AFAIR and the consensus
> was to create a topic branch and that topic branch to be merged in both
> branches. That would avoid having 2 commits in different branches.

Agreed.

> Not sure if it would work out nicely for getting test on CI though.
> Since the changes are spread through the codebase, we could very easily
> hit a situation that this topic branch creates conflicts for other
> patches getting merged on either drm-intel-next or drm-intel-gt-next.

The cycle in review -> apply to topic branch -> merge topic branch just
needs to be short enough. We can't have the topic branch laying around
for more than maybe a few days, or we'll have problems.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
