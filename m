Return-Path: <SRS0=HG+d=D2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDBBC433E7
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2020 11:34:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A316D22257
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2020 11:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A316D22257
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B804E6E921;
	Mon, 19 Oct 2020 11:34:15 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7186E921
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2020 11:34:14 +0000 (UTC)
IronPort-SDR: +p6WTCOA/8hlKkmpEsOV4LW02/NFtBBJaJR+vsUFncDH9chyj1WcPjiFnSC0qJ8p4VJK87QTZL
 Q9NIDley8ibA==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="167089035"
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; d="scan'208";a="167089035"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 04:34:13 -0700
IronPort-SDR: lK7vJS9mkbVeG8DXxcXW8/+JvxMKH+7aX8MtkQLJezDl7Uag9Ce9Y0jZ8j5d+/2ReIOFAgd/TE
 ZddZ/R3rgxUw==
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; d="scan'208";a="347398851"
Received: from amcorcor-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.84.153])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 04:34:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Navare\, Manasi" <manasi.d.navare@intel.com>, Ville =?utf-8?B?U3ly?=
 =?utf-8?B?asOkbMOk?= <ville.syrjala@linux.intel.com>
In-Reply-To: <20201016192442.GB4421@labuser-Z97X-UD5H>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201008214535.22942-1-manasi.d.navare@intel.com>
 <20201008214535.22942-6-manasi.d.navare@intel.com>
 <20201015130705.GL6112@intel.com> <20201015163741.GB28888@labuser-Z97X-UD5H>
 <20201016160620.GP6112@intel.com> <20201016181733.GA4421@labuser-Z97X-UD5H>
 <20201016185000.GQ6112@intel.com> <20201016192442.GB4421@labuser-Z97X-UD5H>
Date: Mon, 19 Oct 2020 14:34:07 +0300
Message-ID: <87lfg2a1qo.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v10 06/11] drm/i915: Enable big joiner
 support in enable and disable sequences.
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

On Fri, 16 Oct 2020, "Navare, Manasi" <manasi.d.navare@intel.com> wrote:
> I really want to push back on any design changes at this point since we have a working solution
> and we currently dont have any special cases. Like I discussed with you all the commit modeset enables
> code is now generic and similar to 2p2p.
> These kind of changes/ optimizations can be done later. Like you suggested we should get the basic working
> solution and support in.

Like I said in [1], this is a big scary patch that has been reported to
break DSI VDSC. I tried to skim through it, but it's really impossible
to identify the one thing that could break DSI.

I mean, even if you had the hardware to test, it could take days to
identify the regressing part here.

And this isn't really specific to DSI, but rather to *any* regression
this might cause. Afterwards, would you stand a chance of telling what
goes wrong if you get a bisect result?


BR,
Jani.


[1] http://lore.kernel.org/r/87o8l5awvr.fsf@intel.com


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
