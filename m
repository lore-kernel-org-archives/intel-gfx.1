Return-Path: <SRS0=NhnI=PJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92655C433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 13:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59B9261130
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 13:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59B9261130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C392E6EC75;
	Thu, 21 Oct 2021 13:43:07 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F24C6EC75
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 Oct 2021 13:43:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="228982878"
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="228982878"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 06:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="484210954"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 21 Oct 2021 06:43:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 21 Oct 2021 16:43:02 +0300
Date: Thu, 21 Oct 2021 16:43:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Message-ID: <YXFuZlMBCUPQDGpn@intel.com>
References: <20211021133408.32166-1-jani.nikula@intel.com>
 <YXFs/l9Aq5F82ZcC@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YXFs/l9Aq5F82ZcC@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH] drm/i915/cdclk: put the cdclk vtables in
 const data
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

On Thu, Oct 21, 2021 at 04:37:02PM +0300, Ville Syrjälä wrote:
> On Thu, Oct 21, 2021 at 04:34:08PM +0300, Jani Nikula wrote:
> > Add the const that was accidentally left out from the vtables.
> > 
> > Fixes: 6b4cd9cba620 ("drm/i915: constify the cdclk vtable")
> > Cc: Dave Airlie <airlied@redhat.com>
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> And if you're sufficiently bored could also move i915->cdclk_funcs
> into i915->cdclk.funcs.

Oh and we should move the cdclk_funcs struct definition into
intel_cdclk.c.

-- 
Ville Syrjälä
Intel
