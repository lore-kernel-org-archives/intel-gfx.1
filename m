Return-Path: <SRS0=ZZZP=GD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA12C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 31 Dec 2020 09:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E3DA2222D
	for <intel-gfx@archiver.kernel.org>; Thu, 31 Dec 2020 09:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E3DA2222D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9BE89B0D;
	Thu, 31 Dec 2020 09:18:03 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9C889B0D
 for <intel-gfx@lists.freedesktop.org>; Thu, 31 Dec 2020 09:18:01 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23468806-1500050 for multiple; Thu, 31 Dec 2020 09:17:50 +0000
MIME-Version: 1.0
In-Reply-To: <0e8a2ada254a3fb151aa133093a475577151d152.camel@intel.com>
References: <20201230103742.18577-1-chris@chris-wilson.co.uk>
 <20201231000210.GE3894148@mdroper-desk1.amr.corp.intel.com>
 <0e8a2ada254a3fb151aa133093a475577151d152.camel@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>, "Deak,
 Imre" <imre.deak@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Souza, Jose" <jose.souza@intel.com>, ville.syrjala@linux.intel.com
Date: Thu, 31 Dec 2020 09:17:50 +0000
Message-ID: <160940627002.15472.4084597144232819762@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dp: Remove aux xfer timeout debug
 message
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
Cc: intel-gfx@lists.freedesktop.org, "Lin, Charlton" <charlton.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Almahallawy, Khaled (2020-12-31 01:24:34)
> On Wed, 2020-12-30 at 16:02 -0800, Matt Roper wrote:
> > On Wed, Dec 30, 2020 at 10:37:42AM +0000, Chris Wilson wrote:
> > > The timeouts are frequent and expected. We will complain if we
> > > retry so
> > > often as to lose patience and give up, so the cacophony from
> > > individual
> > > complaints is redundant.
> > > 
> > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > 
> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> > 
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_dp.c | 2 --
> > >  1 file changed, 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > > b/drivers/gpu/drm/i915/display/intel_dp.c
> > > index 8ae769b18879..704e4cebf7f3 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > @@ -1613,8 +1613,6 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> > >     /* Timeouts occur when the device isn't connected, so they're
> > >      * "normal" -- don't fill the kernel log with these */
> > >     if (status & DP_AUX_CH_CTL_TIME_OUT_ERROR) {
> > > -           drm_dbg_kms(&i915->drm, "%s: timeout (status
> > > 0x%08x)\n",
> > > -                       intel_dp->aux.name, status);
> 
> AUX timeout logs are very important for TGL TCSS Display debugging. We
> actually can get AUX timeout when the display is connected for the
> following reasons:
> * If AUX orientation is not configured correctly in BIOS
> * If USB3 dock is downgraded to USB2 and SBU/AUX lines are disabled
> * When LTTPR/Retimer started to act funny and not configured correctly
> by EC
> * When we have a bug in the PMC mux configuration because of bug in the
> following files: drivers/usb/typec/mux/intel_pmc_mux.c and
> drivers/platform/x86/intel_scu_ipc.c
> * When user space is not cleanly disconnected all MST connectors for
> disconnected MST hub with 2+ display. We will be left with enabled
> pipes although the cable is disconnected and next connect of type-c
> display will give aux timeout: 
>   ** User space fix in Chrome: 
> https://chromium-review.googlesource.com/c/chromium/src/+/2512550/ 
>   ** WA in driver: https://patchwork.freedesktop.org/patch/395901/ 
> 
> These logs are especially important for Chrome based platforms with
> type-C. Seeing these logs we can know who is screwing up (TCSS driver,
> CB, or EC).

Then capture the information you require to analyse your failures.
Flooding the debug log makes debugging everything else much, much harder.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
