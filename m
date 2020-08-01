Return-Path: <SRS0=JvXe=BL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5ACAC433E0
	for <intel-gfx@archiver.kernel.org>; Sat,  1 Aug 2020 09:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DEEA206F6
	for <intel-gfx@archiver.kernel.org>; Sat,  1 Aug 2020 09:22:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="IgCkAPJ8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DEEA206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9DE6EB67;
	Sat,  1 Aug 2020 09:22:00 +0000 (UTC)
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6646EB67
 for <intel-gfx@lists.freedesktop.org>; Sat,  1 Aug 2020 09:21:59 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id a24so8418693oia.6
 for <intel-gfx@lists.freedesktop.org>; Sat, 01 Aug 2020 02:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zwWs+YsY/PuUQJ/WUIE1Kse2qSG6qC/DZ8taau+b2dY=;
 b=IgCkAPJ81H9Gi55pKFCO0wr8bMrEOkm5DeuAtZcOS2957xqKSBu51BysdaJb8r+1Fb
 SY6g8BzzsrECx9NqJkRyh2GnYcSx+TcqDdhK5bj/9YnnZ5HMG7Kk0/sJ15iCxek23VjD
 jK0ABmwDjENSMBupJf+EA4V9I1iWl0ISSklGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zwWs+YsY/PuUQJ/WUIE1Kse2qSG6qC/DZ8taau+b2dY=;
 b=GZhA3sC1q4YzJeankwstcqBJm4f7hRz0CPvtGRs+s1Z0UinHlGYBzIrcxVQySVJ8q4
 +MH5MXCgKDtw/xeigQ/Jy8CX2oHuTNAA7G3n6diKJdkNrjDMPQtbPA3hQFi4wF3zBNn9
 cAdaP1WuRC871GFP+9adj+E3kLn6cTVhrNFz6gppkY0cdUmz0wk4+Gb5tnGrEI3LeE7C
 +Rn8OQwi3UL3l83SrPxmN8SslBGJnUpKEG1NdWn2HzoU4mOxxxKdVmvUaCaDYvnSqzXq
 md8LscRsYb4Eau6Sa1geL89BY+5SiP1VrMreEShpRHGe/kTiT916zcrhGVagQZdhRLWy
 GL8g==
X-Gm-Message-State: AOAM530lRrs9uMPAtZOqfrErLemDRMTAIQplYqgUV6ch3rywi6IacPbd
 3xzbZuBinx+9oIcXShkyOp+yrdWjtX325BDVuhqAow==
X-Google-Smtp-Source: ABdhPJzykxUZzoY70zlvf99Lgi1ubHjP4tQw6y0xe34QvxNco0DvmeTWAayKsmQPEY9oYWIDY3llg5MohJzb4PYMFco=
X-Received: by 2002:aca:da03:: with SMTP id r3mr5971241oig.14.1596273718711;
 Sat, 01 Aug 2020 02:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200731134553.156492-1-lionel.g.landwerlin@intel.com>
 <20200731134553.156492-3-lionel.g.landwerlin@intel.com>
 <159620585968.21624.902926301015466462@build.alporthouse.com>
 <28cadfb8-528a-7683-9b82-a2fbdf494f68@intel.com>
In-Reply-To: <28cadfb8-528a-7683-9b82-a2fbdf494f68@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sat, 1 Aug 2020 11:21:47 +0200
Message-ID: <CAKMK7uEwosYw7uGNWCNhq-oD7TWaHsncLjGbmtz4n-FZNFTLzg@mail.gmail.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915: add syncobj timeline support
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Jul 31, 2020 at 9:07 PM Lionel Landwerlin
<lionel.g.landwerlin@intel.com> wrote:
>
> On 31/07/2020 17:30, Chris Wilson wrote:
> > Quoting Lionel Landwerlin (2020-07-31 14:45:52)
> >> -               drm_syncobj_replace_fence(syncobj, fence);
> >> +               if (eb->fences[n].chain_fence) {
> >> +                       drm_syncobj_add_point(syncobj, eb->fences[n].chain_fence,
> >> +                                             fence, eb->fences[n].value);
> > This function remains not acceptable. It is trivial to write an igt test
> > that causes the DRM_ERROR. A user controllable error message is still
> > not allowed. If you do not have such a test in your igt series, then that
> > too is lacking.
> > -Chris
>
> As far as I remember there are IGT tests for this (*unordered* subtests).
>
> So CI should report a fairlure. The IGT test itself won't fail though.

CI did catch it.

> I thought we removed that DRM_ERROR a while ago.
>
> I'll send a patch to remove it. Thanks.

Typed it already (since I didn't see yours), as soon as it's pushed
you can just hit the retest button with your current series and then
we see whether it's all gone.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
