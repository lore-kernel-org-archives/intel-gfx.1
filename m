Return-Path: <SRS0=HG33=FU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70450C4361B
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 11:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0291E23339
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 11:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0291E23339
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6618F6E193;
	Wed, 16 Dec 2020 11:44:30 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C97B6E190
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Dec 2020 11:44:29 +0000 (UTC)
IronPort-SDR: zi16RASBWdg8W3NTXKB9flB13W91c8JTv9MbQlTZGylI4Dra4wVtkL1wGvSs/W5zLx1Tt8+deb
 MTTZfXPSzmmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="175155267"
X-IronPort-AV: E=Sophos;i="5.78,424,1599548400"; d="scan'208";a="175155267"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 03:44:27 -0800
IronPort-SDR: dtrQH2533c23PqLpUTBYrMt3TMxQgKBXqHombrdtKSfLvd7RfrQu6S5Ys5W7pDP45lf//4QWy7
 P2rdbFLg3cpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,424,1599548400"; d="scan'208";a="338377721"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 16 Dec 2020 03:44:24 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 16 Dec 2020 13:44:24 +0200
Date: Wed, 16 Dec 2020 13:44:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <X9nzGCAqpRWDCMh5@intel.com>
References: <20201211072922.19101-1-airlied@gmail.com>
 <20201211072922.19101-6-airlied@gmail.com>
 <87czza5apy.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87czza5apy.fsf@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH 05/11] drm/i915: refactor some crtc code out
 of intel display.
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

On Wed, Dec 16, 2020 at 12:03:37PM +0200, Jani Nikula wrote:
> On Fri, 11 Dec 2020, Dave Airlie <airlied@gmail.com> wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > There may be more crtc code that can be pulled out, but this
> > is a good start.
> >
> > RFC: maybe call the new file something different
> =

> I checked this is just code movement. I did clean up intel_crtc.h
> locally a bit though. (I'll probably re-send the series with a few fixes
> to pass CI.)
> =

> I'm not averse to renaming the file later if needed, I'm more concerned
> about choosing a meaningful bunch of functions to take out and put in
> the new file.
> =

> Ville, I saw you had some comments about this - is this making sensible
> progress or making further refactoring harder?

Just means we have to move 90% of the proposed intel_crtc.c
into i9xx_plane.c again. So the plane bits here are just
pointless churn IMO.

-- =

Ville Syrj=E4l=E4
Intel
---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
