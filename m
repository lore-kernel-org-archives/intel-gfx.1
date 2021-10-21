Return-Path: <SRS0=NhnI=PJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90711C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 20:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F68860249
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 20:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F68860249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25BA6E4A2;
	Thu, 21 Oct 2021 20:42:28 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AA96E4A2;
 Thu, 21 Oct 2021 20:42:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="216058027"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="216058027"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 13:42:26 -0700
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="568577532"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 13:42:26 -0700
Date: Thu, 21 Oct 2021 13:37:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 john.c.harrison@intel.com
Message-ID: <20211021203747.GA27209@jons-linux-dev-box>
References: <20211011234705.30853-1-matthew.brost@intel.com>
 <f8f1ae021e8cabc2c6d76996b5e74912cb0913db.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8f1ae021e8cabc2c6d76996b5e74912cb0913db.camel@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: Allow engine reset
 failure to do a GT reset in hangcheck selftest
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

On Thu, Oct 21, 2021 at 08:15:49AM +0200, Thomas Hellström wrote:
> Hi, Matthew,
> 
> On Mon, 2021-10-11 at 16:47 -0700, Matthew Brost wrote:
> > The hangcheck selftest blocks per engine resets by setting magic bits
> > in
> > the reset flags. This is incorrect for GuC submission because if the
> > GuC
> > fails to reset an engine we would like to do a full GT reset. Do no
> > set
> > these magic bits when using GuC submission.
> > 
> > Side note this lockless algorithm with magic bits to block resets
> > really
> > should be ripped out.
> > 
> 
> Lockless algorithm aside, from a quick look at the code in
> intel_reset.c it appears to me like the interface that falls back to a
> full GT reset is intel_gt_handle_error() whereas intel_engine_reset()
> is explicitly intended to not do that, so is there a discrepancy
> between GuC and non-GuC here?
> 

With GuC submission when an engine reset fails, we get an engine reset
failure notification which triggers a full GT reset
(intel_guc_engine_failure_process_msg in intel_guc_submission.c). That
reset is blocking by setting these magic bits. Clearing the bits in this
function doesn't seem to unblock that reset either, the driver tries to
unload with a worker blocked, and results in the blow up. Something with
this lockless algorithm could be wrong as clear of the bit should
unlblock the reset but it is doesn't. We can look into that but in the
meantime we need to fix this test to be able to fail gracefully and not
crash CI.

Matt

> /Thomas
> 
> 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> > b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> > index 7e2d99dd012d..90a03c60c80c 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> > @@ -734,7 +734,8 @@ static int __igt_reset_engine(struct intel_gt
> > *gt, bool active)
> >                 reset_engine_count = i915_reset_engine_count(global,
> > engine);
> >  
> >                 st_engine_heartbeat_disable(engine);
> > -               set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> > +               if (!using_guc)
> > +                       set_bit(I915_RESET_ENGINE + id, &gt-
> > >reset.flags);
> >                 count = 0;
> >                 do {
> >                         struct i915_request *rq = NULL;
> > @@ -824,7 +825,8 @@ static int __igt_reset_engine(struct intel_gt
> > *gt, bool active)
> >                         if (err)
> >                                 break;
> >                 } while (time_before(jiffies, end_time));
> > -               clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> > +               if (!using_guc)
> > +                       clear_bit(I915_RESET_ENGINE + id, &gt-
> > >reset.flags);
> >                 st_engine_heartbeat_enable(engine);
> >                 pr_info("%s: Completed %lu %s resets\n",
> >                         engine->name, count, active ? "active" :
> > "idle");
> > @@ -1042,7 +1044,8 @@ static int __igt_reset_engines(struct intel_gt
> > *gt,
> >                 yield(); /* start all threads before we begin */
> >  
> >                 st_engine_heartbeat_disable_no_pm(engine);
> > -               set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> > +               if (!using_guc)
> > +                       set_bit(I915_RESET_ENGINE + id, &gt-
> > >reset.flags);
> >                 do {
> >                         struct i915_request *rq = NULL;
> >                         struct intel_selftest_saved_policy saved;
> > @@ -1165,7 +1168,8 @@ static int __igt_reset_engines(struct intel_gt
> > *gt,
> >                         if (err)
> >                                 break;
> >                 } while (time_before(jiffies, end_time));
> > -               clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
> > +               if (!using_guc)
> > +                       clear_bit(I915_RESET_ENGINE + id, &gt-
> > >reset.flags);
> >                 st_engine_heartbeat_enable_no_pm(engine);
> >  
> >                 pr_info("i915_reset_engine(%s:%s): %lu resets\n",
> 
> 
