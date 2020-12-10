Return-Path: <SRS0=CSZM=FO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DF9C433FE
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 10:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCFB123D6A
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 10:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCFB123D6A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0952F6EA6B;
	Thu, 10 Dec 2020 10:41:45 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDE36EA6B
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Dec 2020 10:41:43 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23278183-1500050 for multiple; Thu, 10 Dec 2020 10:41:39 +0000
MIME-Version: 1.0
In-Reply-To: <87k0tqlzhk.fsf@gaia.fi.intel.com>
References: <20201209134231.961-1-chris@chris-wilson.co.uk>
 <87k0tqlzhk.fsf@gaia.fi.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Thu, 10 Dec 2020 10:41:39 +0000
Message-ID: <160759689953.21588.11243424019053509462@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Rearrange snb workarounds
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Mika Kuoppala (2020-12-10 10:36:07)
> Chris Wilson <chris@chris-wilson.co.uk> writes:
> 
> > Some rcs0 workarounds were being incorrectly applied to the GT, and so
> > we failed to restore the expected register settings after a reset.
> >
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_workarounds.c | 67 ++++++++++-----------
> >  1 file changed, 33 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > index b5339a36d256..50cfe82f18a9 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > @@ -823,40 +823,6 @@ ilk_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
> >  static void
> >  snb_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
> >  {
> > -     /* WaDisableHiZPlanesWhenMSAAEnabled:snb */
> > -     wa_masked_en(wal,
> > -                  _3D_CHICKEN,
> > -                  _3D_CHICKEN_HIZ_PLANE_DISABLE_MSAA_4X_SNB);
> > -
> > -     /* WaDisable_RenderCache_OperationalFlush:snb */
> > -     wa_masked_dis(wal, CACHE_MODE_0, RC_OP_FLUSH_ENABLE);
> > -
> > -     /*
> > -      * BSpec recommends 8x4 when MSAA is used,
> > -      * however in practice 16x4 seems fastest.
> > -      *
> > -      * Note that PS/WM thread counts depend on the WIZ hashing
> > -      * disable bit, which we don't touch here, but it's good
> > -      * to keep in mind (see 3DSTATE_PS and 3DSTATE_WM).
> > -      */
> > -     wa_add(wal,
> > -            GEN6_GT_MODE, 0,
> > -            _MASKED_FIELD(GEN6_WIZ_HASHING_MASK, GEN6_WIZ_HASHING_16x4),
> > -            GEN6_WIZ_HASHING_16x4);
> > -
> > -     wa_masked_dis(wal, CACHE_MODE_0, CM0_STC_EVICT_DISABLE_LRA_SNB);
> 
> Where did this go?

It was already in rcs_engine_wa
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
