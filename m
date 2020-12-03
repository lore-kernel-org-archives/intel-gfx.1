Return-Path: <SRS0=sbLu=FH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6C5C4361A
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Dec 2020 16:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C63D206F9
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Dec 2020 16:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C63D206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D1B6EB79;
	Thu,  3 Dec 2020 16:40:48 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433BE6EB79
 for <intel-gfx@lists.freedesktop.org>; Thu,  3 Dec 2020 16:40:47 +0000 (UTC)
IronPort-SDR: 0eHsQDLW2ABPyUQns69JZ+PgNSfpfAEClF54YYJIPXWNuORPq0ftlXyAJjxFYpffbX7S7eCAfY
 jl9n1mcpFbJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="173384409"
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="173384409"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2020 08:40:45 -0800
IronPort-SDR: 1M45FykK4w3xnp48nfxmfI5ca4DQofBCnksoPzwljrdM05INPwh+Dlyo3uHiIQb5bWo88Ofdhq
 BMXiDTdlxGAQ==
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="540243286"
Received: from isobow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.16.51])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2020 08:40:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Navare\, Manasi" <manasi.d.navare@intel.com>
In-Reply-To: <20201201225602.GC22644@labuser-Z97X-UD5H>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201022222709.29386-1-manasi.d.navare@intel.com>
 <20201022222709.29386-8-manasi.d.navare@intel.com> <87imadscnr.fsf@intel.com>
 <20201201225602.GC22644@labuser-Z97X-UD5H>
Date: Thu, 03 Dec 2020 18:40:41 +0200
Message-ID: <87mtyuc06u.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 07/11] drm/i915/display/vrr: Configure and
 enable VRR in modeset enable
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

On Tue, 01 Dec 2020, "Navare, Manasi" <manasi.d.navare@intel.com> wrote:
> On Tue, Nov 10, 2020 at 12:56:40PM +0200, Jani Nikula wrote:
>> On Thu, 22 Oct 2020, Manasi Navare <manasi.d.navare@intel.com> wrote:
>> > +	/* Programming adjustments for 0 based regs */
>> > +	trans_vrr_vmax = crtc_state->vrr.vtotalmax - 1;
>> > +	trans_vrr_vmin = crtc_state->vrr.vtotalmin - 1;
>> > +	trans_vrr_flipline = crtc_state->vrr.vtotalmin - 1;
>> > +
>> > +	trans_push = TRANS_PUSH_EN;
>> 
>> Frankly I'd just throw away the above four temp variables.
>
> Okay and use them directly in de_write ?

Yes.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
