Return-Path: <SRS0=FeUR=OL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF41C433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 13:06:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B298161168
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 13:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B298161168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7E26E97A;
	Tue, 21 Sep 2021 13:06:06 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A806E97A;
 Tue, 21 Sep 2021 13:06:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="210586172"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="210586172"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 06:06:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="512306554"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 21 Sep 2021 06:06:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Sep 2021 16:06:00 +0300
Date: Tue, 21 Sep 2021 16:06:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <YUnYuCFUVULQQK7j@intel.com>
References: <20210914195151.560793-1-lucas.demarchi@intel.com>
 <27c071ae-13b8-d71d-d869-e9cbd7431afd@intel.com>
 <b6b996be-b60c-41f1-e531-77c2bcdda920@intel.com>
 <20210921054708.p63rjkxux742op72@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210921054708.p63rjkxux742op72@ldmartin-desk2>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: remove unneeded clflush
 calls
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

On Mon, Sep 20, 2021 at 10:47:08PM -0700, Lucas De Marchi wrote:
> On Wed, Sep 15, 2021 at 12:29:12PM -0700, John Harrison wrote:
> >On 9/15/2021 12:24, Belgaumkar, Vinay wrote:
> >>On 9/14/2021 12:51 PM, Lucas De Marchi wrote:
> >>>The clflush calls here aren't doing anything since we are not writting
> >>>something and flushing the cache lines to be visible to GuC. Here the
> >>>intention seems to be to make sure whatever GuC has written is visible
> >>>to the CPU before we read them. However a clflush from the CPU side is
> >>>the wrong instruction to use.
> >Is there a right instruction to use? Either we need to verify that no 
> 
> how can there be a right instruction? If the GuC needs to flush, then
> the GuC needs to do it, nothing to be done by the CPU.
> 
> Flushing the CPU cache line here is doing nothing to guarantee that what
> was written by GuC hit the memory and we are reading it. Not sure why it
> was actually added, but since it was added by Vinay and he reviewed this
> patch, I'm assuming he also agrees

clflush == writeback + invalidate. The invalidate is the important part
when the CPU has to read something written by something else that's not
cache coherent.

Now, I have no idea if the guc has its own (CPU invisible) caches or not.
If it does then it will need to trigger a writeback. But regardless, if
the guc bypasses the CPU caches the CPU will need to invalidate before
it reads anything in case it has stale data sitting in its cache.

-- 
Ville Syrjälä
Intel
