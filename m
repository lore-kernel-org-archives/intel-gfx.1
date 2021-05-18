Return-Path: <SRS0=F/h7=KN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4F7C433B4
	for <intel-gfx@archiver.kernel.org>; Tue, 18 May 2021 08:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADBD5611BD
	for <intel-gfx@archiver.kernel.org>; Tue, 18 May 2021 08:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADBD5611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rz.uni-freiburg.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534196E857;
	Tue, 18 May 2021 08:30:31 +0000 (UTC)
Received: from smtp2.uni-freiburg.de (smtp2.uni-freiburg.de [132.230.2.212])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42146EAC1
 for <intel-gfx@lists.freedesktop.org>; Tue, 18 May 2021 08:30:27 +0000 (UTC)
Delivery-date: Tue, 18 May 2021 10:30:27 +0200
Received: from fe2.uni-freiburg.de ([132.230.2.222] helo=uni-freiburg.de) port
 54266 by smtp2.uni-freiburg.de with esmtp ( Exim )
 id 1liv7S-0004NR-0j
 for intel-gfx@lists.freedesktop.org; Tue, 18 May 2021 10:30:26 +0200
Received: from [132.230.8.113] (account simon.rettberg@rz.uni-freiburg.de HELO
 dellnichtsogutkiste)
 by mail.uni-freiburg.de (CommuniGate Pro SMTP 6.3.6f)
 with ESMTPSA id 69788826; Tue, 18 May 2021 10:30:25 +0200
Date: Tue, 18 May 2021 10:30:25 +0200
From: Simon Rettberg <simon.rettberg@rz.uni-freiburg.de>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20210518103025.2fa0935e@dellnichtsogutkiste>
In-Reply-To: <YJ0Nyb51rS6YYTFR@intel.com>
References: <20210426161124.2b7fd708@dellnichtsogutkiste>
 <CAPM=9tzj9Fn+FQFBueMLVxhBSy48kZizTnCM7bNxfUi55o+zYg@mail.gmail.com>
 <YJ0Nyb51rS6YYTFR@intel.com>
Organization: Rechenzentrum Uni Freiburg
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Disable HiZ Raw Stall
 Optimization on broken gen7
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 development@manuel-bentele.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Am Thu, 13 May 2021 07:30:17 -0400
schrieb Rodrigo Vivi <rodrigo.vivi@intel.com>:

> On Thu, May 13, 2021 at 10:18:49AM +1000, Dave Airlie wrote:
> > Reviewed-by: Dave Airlie <airlied@redhat.com>
> > 
> > Can we get this fix in, having a regression spanning 3 kernels
> > isn't a good look, we can work out why it matters later in life if
> > anyone cares.  
> 
> Agreed and pushed do drm-intel-next.

What's the status here? I can't seem to find the fix in drm-intel-next.

- Simon

> 
> This triggered me to do an archeology work here and I found a possible
> alternative for ILK:
> 
> +#define   HIZ_UNIT_CLOCK_GATE_DISABLE  REG_BIT(5)
>  
>  #define FDI_PLL_FREQ_CTL        _MMIO(0x46030)
>  #define  FDI_PLL_FREQ_CHANGE_REQUEST    (1 << 24)
> diff --git a/drivers/gpu/drm/i915/intel_pm.c
> b/drivers/gpu/drm/i915/intel_pm.c index 06d5b7cc8b62..6316b70978f7
> 100644 --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -6892,8 +6892,11 @@ static void ilk_init_clock_gating(struct
> drm_i915_private *dev_priv) intel_uncore_write(&dev_priv->uncore,
> PCH_3DCGDIS0, MARIUNIT_CLOCK_GATE_DISABLE |
>                    SVSMUNIT_CLOCK_GATE_DISABLE);
> +
> +       /* WaDisableHizUnitClockGating:ilk */
>         intel_uncore_write(&dev_priv->uncore, PCH_3DCGDIS1,
> -                  VFMUNIT_CLOCK_GATE_DISABLE);
> +                  VFMUNIT_CLOCK_GATE_DISABLE |
> +                  HIZ_UNIT_CLOCK_GATE_DISABLE);
> 
> however I couldn't find anything for Baytrail, so let's move with this
> one for now.
> 
> > 
> > Dave.
> > 
> > On Tue, 27 Apr 2021 at 00:31, Simon Rettberg
> > <simon.rettberg@rz.uni-freiburg.de> wrote:  
> > >
> > > When resetting CACHE_MODE registers, don't enable HiZ Raw Stall
> > > Optimization on Ivybridge GT1 and Baytrail, as it causes severe
> > > glitches when rendering any kind of 3D accelerated content.
> > > This optimization is disabled on these platforms by default
> > > according to official documentation from 01.org.
> > >
> > > Fixes: ef99a60ffd9b ("drm/i915/gt: Clear CACHE_MODE prior to
> > > clearing residuals") Fixes: 520d05a77b28 ("drm/i915/gt: Clear
> > > CACHE_MODE prior to clearing residuals") BugLink:
> > > https://gitlab.freedesktop.org/drm/intel/-/issues/3081 BugLink:
> > > https://gitlab.freedesktop.org/drm/intel/-/issues/3404 BugLink:
> > > https://gitlab.freedesktop.org/drm/intel/-/issues/3071
> > > Reviewed-By: Manuel Bentele <development@manuel-bentele.de>
> > > Signed-off-by: Simon Rettberg <simon.rettberg@rz.uni-freiburg.de>
> > > --- drivers/gpu/drm/i915/gt/gen7_renderclear.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gt/gen7_renderclear.c
> > > b/drivers/gpu/drm/i915/gt/gen7_renderclear.c index
> > > de575fdb0..21f08e538 100644 ---
> > > a/drivers/gpu/drm/i915/gt/gen7_renderclear.c +++
> > > b/drivers/gpu/drm/i915/gt/gen7_renderclear.c @@ -397,7 +397,10 @@
> > > static void emit_batch(struct i915_vma * const vma,
> > > gen7_emit_pipeline_invalidate(&cmds); batch_add(&cmds,
> > > MI_LOAD_REGISTER_IMM(2)); batch_add(&cmds,
> > > i915_mmio_reg_offset(CACHE_MODE_0_GEN7));
> > > -       batch_add(&cmds, 0xffff0000);
> > > +       batch_add(&cmds, 0xffff0000 |
> > > +                       ((IS_IVB_GT1(i915) ||
> > > IS_VALLEYVIEW(i915)) ?
> > > +                        HIZ_RAW_STALL_OPT_DISABLE :
> > > +                        0));
> > >         batch_add(&cmds, i915_mmio_reg_offset(CACHE_MODE_1));
> > >         batch_add(&cmds, 0xffff0000 |
> > > PIXEL_SUBSPAN_COLLECT_OPT_DISABLE);
> > > gen7_emit_pipeline_invalidate(&cmds); --
> > > 2.25.1
> > >
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx  
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx  

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
