Return-Path: <SRS0=EMYW=LR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18415C48BC2
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Jun 2021 15:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B961F611C1
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Jun 2021 15:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B961F611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744B16E935;
	Wed, 23 Jun 2021 15:39:53 +0000 (UTC)
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFB16E935
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Jun 2021 15:39:51 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 48bdc4bf-d439-11eb-a36f-0050568cd888;
 Wed, 23 Jun 2021 15:40:06 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 22AEB194B5F;
 Wed, 23 Jun 2021 17:39:52 +0200 (CEST)
Date: Wed, 23 Jun 2021 17:39:47 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <YNNVwxu5MEI6r62R@ravnborg.org>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-8-daniel.vetter@ffwll.ch>
 <YNI1i1D88TWZU1vR@ravnborg.org>
 <CAKMK7uGXvpLz=NxR9FB2YAA2DrAkC42OpnDy8Qr9NJdKMcvQLw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGXvpLz=NxR9FB2YAA2DrAkC42OpnDy8Qr9NJdKMcvQLw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 07/15] drm/atomic-helper: make
 drm_gem_plane_helper_prepare_fb the default
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Daniel,

> > >        * equivalent functionality should be implemented through private
> > >        * members in the plane structure.
> > >        *
> > > -      * Drivers which always have their buffers pinned should use
> > > -      * drm_gem_plane_helper_prepare_fb() for this hook.
> > > +      * For GEM drivers who neither have a @prepare_fb not @cleanup_fb hook
> > s/not/nor/ ??
> 
> Yup.
> 
> > > +      * set drm_gem_plane_helper_prepare_fb() is called automatically to
> >               ^add comma?
> > > +      * implement this.
> >
> >
> > Leave cleanup_fb out of the description to make it more readable.
> 
> With the not->nor typo fixed, why does this make it more readable?
> Afaiui neither ... nor ... is fairly standard English, and I really
> want to make this the default only if you specify absolutely no plane
> fb handling of your own.

What I tried to suggest was like this:

"
Drivers which always have their buffers pinned should use
drm_gem_plane_helper_prepare_fb() for this hook.
For GEM drivers who do not have a @prepare_fb hook set,
drm_gem_plane_helper_prepare_fb() is called automatically to
implement this.
"

But anyway is fine and with the typo fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
