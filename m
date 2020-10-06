Return-Path: <SRS0=f8CR=DN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8778DC4727D
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 18:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10226206F7
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 18:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10226206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4867789F6D;
	Tue,  6 Oct 2020 18:33:46 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E3C89F6D
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Oct 2020 18:33:45 +0000 (UTC)
IronPort-SDR: V6pVDnBWQxu0nu714DyU5aXLGJocCtEOu8gewe4SqQEFiO2LaQMG/CCunzNk+ibVP9m95hV43p
 bV38nE4x4b+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="161232817"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="161232817"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 11:33:10 -0700
IronPort-SDR: 8ojOjngqEa48bEh4FG/DFjI9V/x0QlWhQM4qmW5WpU/eFFssW4KuvUKAe6/LKWTv0pd+jVefHN
 hnrjNhPa5UFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="327678847"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 06 Oct 2020 11:33:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 06 Oct 2020 21:33:07 +0300
Date: Tue, 6 Oct 2020 21:33:07 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20201006183307.GY6112@intel.com>
References: <20201001151640.14590-1-ville.syrjala@linux.intel.com>
 <20201001151640.14590-3-ville.syrjala@linux.intel.com>
 <87o8lfk8i5.fsf@intel.com> <20201006134340.GW6112@intel.com>
 <87zh4zi5o3.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zh4zi5o3.fsf@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [PATCH v2 3/6] drm/i915: Replace the VLV/CHV eDP
 reboot notifier with the .shutdown() hook
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Oct 06, 2020 at 09:13:32PM +0300, Jani Nikula wrote:
> On Tue, 06 Oct 2020, Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com> wr=
ote:
> > On Tue, Oct 06, 2020 at 12:29:22PM +0300, Jani Nikula wrote:
> >> On Thu, 01 Oct 2020, Ville Syrjala <ville.syrjala@linux.intel.com> wro=
te:
> >> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >> >
> >> > Currently VLV/CHV use a reboot notifier to make sure the panel
> >> > power cycle delay isn't violated across a system reboot. Replace
> >> > that with the new encoder .shutdown() hook.
> >> >
> >> > And let's also stop overriding the power cycle delay with the
> >> > max value. No idea why the current code does that. The already
> >> > programmed delay should be correct.
> >> =

> >> I kind of have a little uneasy feeling about conflating these two
> >> changes together. I think both are objectively good changes, just not
> >> necessarily at once.
> >> =

> >> ISTR setting the max delay was, perhaps, somehow related to the hardwa=
re
> >> losing its marbles after power is cut, effectively not ensuring any of
> >> the delays at power-on. So it's possible we set the max here to account
> >> for that. Maybe. ;)
> >> =

> >> Anyway,
> >> =

> >> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> >> =

> >> on the whole.
> >> =

> >> I'm leaving it up to you, but personally I'd lean towards switching
> >> edp_notify_handler() to use wait_panel_power_cycle(intel_dp) first in a
> >> separate patch, to help with potential bisect results, and then doing
> >> the rest.
> >
> > I don't think it would be quite that simple. We'd have to also toss
> > in some combination of panel_off() and vdd_off_sync() in there,
> > depending on whether the panel power is currently enabled or not.
> > Otherwise the bookkeeping needed by wait_panel_power_cycle() isn't
> > going to be up to date.
> =

> Oh? So the calls via encoder hooks actually ensure that?

1. drm_atomic_helper_shutdown()
   -> panel_off() as needed via the normal crtc disable sequence
2. mst suspend + interrupts off + cancel hpd stuff
   -> hopefully nothing can re-enable vdd after this point
3. encoder.suspend()
   -> vdd_off_sync() to really turn vdd off if it's still lingering
4. encoder.shutdown()
   -> wait_panel_power_cycle()

Hopefully it even works like that :P

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
