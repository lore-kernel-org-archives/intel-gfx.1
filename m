Return-Path: <SRS0=djoz=LY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401F5C11F65
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Jun 2021 12:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0849561997
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Jun 2021 12:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0849561997
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999C46E99F;
	Wed, 30 Jun 2021 12:11:12 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685DD6E99F
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Jun 2021 12:11:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="269469528"
X-IronPort-AV: E=Sophos;i="5.83,311,1616482800"; d="scan'208";a="269469528"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 05:11:01 -0700
X-IronPort-AV: E=Sophos;i="5.83,311,1616482800"; d="scan'208";a="641688550"
Received: from genxfsim-desktop.iind.intel.com (HELO intel.com)
 ([10.223.74.179])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 05:10:58 -0700
Date: Wed, 30 Jun 2021 17:26:23 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: acelan@gmail.com
Message-ID: <20210630115622.GH8620@intel.com>
References: <5830863.31r3eYUQgx@acelan-xps15-9560>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5830863.31r3eYUQgx@acelan-xps15-9560>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [v2] drm/i915: Tweaked Wa_14010685332 for all PCHs
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

On 2021-06-30 at 19:19:04 +0800, acelan.kao@canonical.com wrote:
> > dispcnlunit1_cp_xosc_clkreq clock observed to be active on TGL-H platform
> > despite Wa_14010685332 original sequence, thus blocks entry to deeper s0ix
> > state.
> > 
> > The Tweaked Wa_14010685332 sequence fixes this issue, therefore use tweaked
> > Wa_14010685332 sequence for every PCH since PCH_CNP.
> > 
> > v2:
> > - removed RKL from comment and simplified condition. [Rodrigo]
> > 
> > Fixes: b896898c7369 ("drm/i915: Tweaked Wa_14010685332 for PCHs used on
> > gen11 platforms") Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> > 
> >  .../drm/i915/display/intel_display_power.c    | 16 +++++++-------
> >  drivers/gpu/drm/i915/i915_irq.c               | 21 -------------------
> >  2 files changed, 8 insertions(+), 29 deletions(-)
> Hi,
> 
> I didn't see this patch shown in mainline kernel tree, nor in drm-tip,
> May I know what the patch's status now?
We have observed that this patch does not fix the issue on all platforms.
That is the reason patch is not merged yet.
Br,
Anshuman Gupta.

> 
> 
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
