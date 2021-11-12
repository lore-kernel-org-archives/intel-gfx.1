Return-Path: <SRS0=wBbn=P7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60059C433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Nov 2021 11:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B98E60C4B
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Nov 2021 11:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B98E60C4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDC26EAC6;
	Fri, 12 Nov 2021 11:12:16 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034576E89D
 for <intel-gfx@lists.freedesktop.org>; Fri, 12 Nov 2021 11:12:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="231842396"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="231842396"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 03:11:55 -0800
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="492966914"
Received: from sbacanu-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.217.145])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 03:11:54 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <20211104144520.22605-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211104144520.22605-1-ville.syrjala@linux.intel.com>
 <20211104144520.22605-10-ville.syrjala@linux.intel.com>
Date: Fri, 12 Nov 2021 13:11:51 +0200
Message-ID: <874k8h4oi0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH 09/17] drm/i915/fbc: Introduce
 .program_cfb() vfunc
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

On Thu, 04 Nov 2021, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> +static void i8xx_fbc_program_cfb(struct drm_i915_private *i915)
> +{
> +	struct intel_fbc *fbc = &i915->fbc;
> +
> +	GEM_BUG_ON(range_overflows_end_t(u64, i915->dsm.start,
> +					 fbc->compressed_fb.start, U32_MAX));
> +	GEM_BUG_ON(range_overflows_end_t(u64, i915->dsm.start,
> +					 fbc->compressed_llb.start, U32_MAX));

This is just code movement, but why are we adding GEM_BUG_ON() stuff in
display?

If the macro is useful beyond gem, it should be called something
else. If not, it should not be used in display.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
