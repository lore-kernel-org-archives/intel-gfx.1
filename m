Return-Path: <SRS0=wM0p=JR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E7EC433ED
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Apr 2021 13:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA33D61155
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Apr 2021 13:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA33D61155
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9E16E50E;
	Tue, 20 Apr 2021 13:22:43 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D176E50E
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Apr 2021 13:22:42 +0000 (UTC)
IronPort-SDR: bFwsEkBdnq06pNEc8mL+ebIGohNPQet3+R1f/gWpkRcBvDkjBI06jFxMSWFJBnaJFUNyCWAdmc
 w0ckZ3koKxAw==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="175610266"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="175610266"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 06:22:42 -0700
IronPort-SDR: 7EppD5puaP/rm2gMvGZzq2px2vBg/pGdyVUNaL3cz2ACP+hMPVEWPnsPsF7sSojz/GqLrJAR2J
 8VF2F0XK7L1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="454773912"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 20 Apr 2021 06:22:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 20 Apr 2021 16:22:39 +0300
Date: Tue, 20 Apr 2021 16:22:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <YH7VnzDwhmfnxfVc@intel.com>
References: <20210416171011.19012-1-ville.syrjala@linux.intel.com>
 <87mttt9kqe.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mttt9kqe.fsf@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH 0/8] drm/i915: dbuf cleanups
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

On Tue, Apr 20, 2021 at 03:57:45PM +0300, Jani Nikula wrote:
> On Fri, 16 Apr 2021, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> > A bunch of drive-by-cleanup While I was reading through
> > the dbuf code.
> =

> Good stuff. On the series,
> =

> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> =

> Some thoughts provoked by the series:
> =

> * Time to start splitting up dbuf/ddb/wm stuff from intel_pm.[ch] to
>   separate file(s) under display/?

I guess we could start shoveling. I've been putting it off due to
having bunch of in-flight stuff (wm latency cleanups, s/intel/ilk/
rename, and some wip skl+ dbuf patches come to mind). But I suppose
those aren't going to make any progress without a reposting anyway.
I could always respin them after the code has settled in its new
home.

> =

> * Time to start moving more display related struct intel_device_info
>   fields under the display substruct?

Perhaps. I was a bit torn between .dbuf and .display.dbuf for this
series. In the end I decided that .display.dbuf is a bit too long
for my liking. Not sure if s/.display/.de/ might make it more
palatable...

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
