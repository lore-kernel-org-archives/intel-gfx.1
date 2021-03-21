Return-Path: <SRS0=n/yo=IT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B131C433C1
	for <intel-gfx@archiver.kernel.org>; Sun, 21 Mar 2021 16:32:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D353B61939
	for <intel-gfx@archiver.kernel.org>; Sun, 21 Mar 2021 16:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D353B61939
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6181E89D53;
	Sun, 21 Mar 2021 16:32:22 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE34389D53
 for <intel-gfx@lists.freedesktop.org>; Sun, 21 Mar 2021 16:32:20 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 24184737-1500050 for multiple; Sun, 21 Mar 2021 16:32:16 +0000
MIME-Version: 1.0
In-Reply-To: <161634423285.31629.4117583325553566238@build.alporthouse.com>
References: <20210321161038.9329-1-ville.syrjala@linux.intel.com>
 <161634408760.31629.1053248022479151885@build.alporthouse.com>
 <161634423285.31629.4117583325553566238@build.alporthouse.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Sun, 21 Mar 2021 16:32:16 +0000
Message-ID: <161634433679.31629.17304076211421246191@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Avoid div-by-zero on gen2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Chris Wilson (2021-03-21 16:30:32)
> Quoting Chris Wilson (2021-03-21 16:28:07)
> > Quoting Ville Syrjala (2021-03-21 16:10:38)
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > index ec28a6cde49b..0b2434e29d00 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > @@ -189,7 +189,7 @@ compute_partial_view(const struct drm_i915_gem_object *obj,
> > >         struct i915_ggtt_view view;
> > >  
> > >         if (i915_gem_object_is_tiled(obj))
> > > -               chunk = roundup(chunk, tile_row_pages(obj));
> > > +               chunk = roundup(chunk, tile_row_pages(obj) ?: 1);
> > 
> > I was thinking the answer would be to align to the next page, and hey
> > presto!
> 
> Wait, the tile row cannot be a single page. Something else is zero that
> should not be.

Which fortunately does not matter here, as we start with a 2MiB chunk
and want to align that to a multiple of tile rows. Still, as you said,
something stinks.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
