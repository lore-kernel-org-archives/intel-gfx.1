Return-Path: <SRS0=9DaN=HE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA83C433DB
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Feb 2021 14:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64DE861481
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Feb 2021 14:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64DE861481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C6B89617;
	Tue,  2 Feb 2021 14:26:14 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D5389617
 for <intel-gfx@lists.freedesktop.org>; Tue,  2 Feb 2021 14:26:13 +0000 (UTC)
IronPort-SDR: 5crbv6LAl+TxdO4bE96mvVc55ImgYfgiewmzYrHA/E2zN7eeQU4zI0Qa53K7B54TIV5PUaZXog
 vLV7jdMVybMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="160025600"
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; d="scan'208";a="160025600"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 06:26:12 -0800
IronPort-SDR: WqmjxWf6YQnm1etmbl+j+S4Z/dkgzPoB2omsOifP1DNOrYp3SLAI47iQ/A3ajuvjNPN49xAoDh
 Pb+dBhrfCw6g==
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; d="scan'208";a="432942176"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 06:26:10 -0800
Date: Tue, 2 Feb 2021 16:26:07 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20210202142607.GB494606@ideak-desk.fi.intel.com>
References: <87lfcqobpl.fsf@intel.com>
 <87ft2fgcu1.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ft2fgcu1.fsf@intel.com>
Subject: Re: [Intel-gfx] Fixes that failed to apply to v5.11-rc4
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
Reply-To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi,

On Tue, Feb 02, 2021 at 09:15:18AM +0200, Jani Nikula wrote:
> On Mon, 18 Jan 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> > The following commits have been marked as Cc: stable or fixing something
> > in v5.11-rc4 or earlier, but failed to cherry-pick to
> > drm-intel-fixes. Please see if they are worth backporting, and please do
> > so if they are.
> >
> > Conflicts:
> > dbe13ae1d6ab ("drm/i915/pmu: Don't grab wakeref when enabling events")
> > 9bb36cf66091 ("drm/i915: Check for rq->hwsp validity after acquiring RCU lock")
> > 5b4dc95cf7f5 ("drm/i915/gt: Prevent use of engine->wa_ctx after error")
> > 6a3daee1b38e ("drm/i915/selftests: Fix some error codes")
> > 67fba3f1c73b ("drm/i915/dp: Fix LTTPR vswing/pre-emp setting in non-transparent mode")
> >
> > Fails to build:
> > 3170a21f7059 ("drm/i915: Only enable DFP 4:4:4->4:2:0 conversion when outputting YCbCr 4:4:4")
> >
> > BR,
> > Jani.
> 
> Update.
> 
> Conflicts:
> 5b4dc95cf7f5 ("drm/i915/gt: Prevent use of engine->wa_ctx after error")
> 6a3daee1b38e ("drm/i915/selftests: Fix some error codes")
> 67fba3f1c73b ("drm/i915/dp: Fix LTTPR vswing/pre-emp setting in non-transparent mode")

This depends on
  1c6e527d6947 ("rm/i915/dp: Move intel_dp_set_signal_levels() to intel_dp_link_training.c")

> 699390f7f026 ("drm/i915: Fix the PHY compliance test vs. hotplug mishap")
> e7004ea4f5f5 ("drm/i915/gt: Close race between enable_breadcrumbs and cancel_breadcrumbs")
> fed387572040 ("drm/i915/display: Prevent double YUV range correction on HDR planes")
> 
> Fails to build:
> 0713eb979d2c ("drm/i915: Disable atomics in L3 for gen9")
> f8abfda84841 ("drm/i915: Fix the MST PBN divider calculation")

and this one depends on
  a321fc2b4e60 ("rm/dp/mst: Export drm_dp_get_vc_payload_bw()")

> 
> BR,
> Jani.
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
