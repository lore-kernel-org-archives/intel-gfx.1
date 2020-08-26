Return-Path: <SRS0=RAJW=CE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C2BC433DF
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2020 10:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA9882067C
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2020 10:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA9882067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2AC26EA4C;
	Wed, 26 Aug 2020 10:02:49 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FF96E106;
 Wed, 26 Aug 2020 10:02:47 +0000 (UTC)
IronPort-SDR: 4J4Z0p7Fx4h4gkFHwJr+xHdcg0hj1je4WW9LCYD8l36EDAhfxmhn4Q39V40+B6sHH4Yjwj/MlU
 yp2bedozizVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="153836093"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; d="scan'208";a="153836093"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 03:02:46 -0700
IronPort-SDR: hTW03OiJetmuVTvPOubt55QsvItuwZ2hIwphzV/U8+t44Rsp4D0PYQkLzqffzXBRXLXqIPzK85
 6IzTBFmw++hg==
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; d="scan'208";a="443969722"
Received: from jguenthe-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.32.223])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 03:02:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
In-Reply-To: <20200820125644.hee2jjtnef5bf74o@gilmour.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200820125644.hee2jjtnef5bf74o@gilmour.lan>
Date: Wed, 26 Aug 2020 13:02:39 +0300
Message-ID: <87lfi167y8.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PULL] drm-misc-next
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
Cc: dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, 20 Aug 2020, Maxime Ripard <maxime@cerno.tech> wrote:
> This PR diffstat is pretty massive since we merged 5.9-rc1 and it's not (yet?) in drm-next.
>
> I'm not entirely sure how to tackle this (if it causes an issue?).
>
> Let me know, thanks!

Whatever Dave & Daniel say, but previously the rule of thumb has been to
only ever do backmerges from drm-next. If you need a backmerge from
Linus' tree, you ask for a backmerge to drm-next, and then backmerge
that.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
