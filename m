Return-Path: <SRS0=x/xo=B4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA31C433E1
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Aug 2020 01:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D00E92067C
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Aug 2020 01:40:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANrArfPB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D00E92067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142EA89E5A;
	Tue, 18 Aug 2020 01:40:06 +0000 (UTC)
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098A289E5A
 for <intel-gfx@lists.freedesktop.org>; Tue, 18 Aug 2020 01:40:04 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id c10so13939068edk.6
 for <intel-gfx@lists.freedesktop.org>; Mon, 17 Aug 2020 18:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dr3vMXamkxDtaruImDwyH8JBZKsPaSdCWX05rGHqhIM=;
 b=ANrArfPBA0FwEShG8khHZXtcT7q5TsVvwDJVMnGYfh1y1bYSPvkgLtpIfKi+7LMaye
 TVP6e8W9UbW4FZFdqZf26Ah2plosm3O/DYMYqi3aW+E6X3BmsyfE/5voSKbIR5I6nRCF
 danuV85v7dSdL2llVr4mdZZNcMfttRQ4HpjNsOIhhCAHFgs7VcI+27uqD1Vakk/gG1Yh
 8n9Ak2V1W3eOCJdyOk0LSfxHOTDmGMMspD3zNCnFeSvzBwb4Znsfh0ilMdmZiNyujeRY
 UNTKrralZE3tv+ECPlOWDJrgdOuBRQwDhXYp24HNjREWnHul+ZxkasnsaBMOIHF6QAwk
 L6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dr3vMXamkxDtaruImDwyH8JBZKsPaSdCWX05rGHqhIM=;
 b=rSvmkcMP9UXIo+LSaIkas/ZK9vCW4kkGsh+1rcaO9V2pwbUz8cdU+P68Th/m+Eq7O6
 fW1eenCvXyJcs2R+6SnTXE4x8aYCxr9i1VX4yEAR5e0/b2u0/w93ARxAQ25cjv1CCJ8J
 Hj7NlOqcoEO571GUfpudSR6sYu5Nafp2MveT63wlI1Sj9oY5tP/nqR2s60E23NozgJeM
 n7VJ9/oGXQPR3h4OORS7GswYsS4bR++rU3xwGw0Kq6H9eq/W55Rcc7XZk4hl6z5k9xGE
 EKqtq2gn+qBCx2RkzXdtgPBVBuKuAjho9XlasUbiiPbZbEKrNwdlmFS35C+d7pYmd7kh
 vNww==
X-Gm-Message-State: AOAM531IJIP7sRNdESU2vdovftfM53MRMGBuqWWas+vIAjsYLaWjf1ug
 lpnMnjebMD/5azkp4lmDDb9c9ecsVgp8hGD/ySw=
X-Google-Smtp-Source: ABdhPJyQELF2g6xTUEJtTMPE+/jk1mBc2sA+hZmcluiuPMgOaQ9mvb9ki+oHZfqmwycIaEKo05KjwcGjrihJeiZPjaI=
X-Received: by 2002:aa7:c983:: with SMTP id c3mr17413429edt.383.1597714803377; 
 Mon, 17 Aug 2020 18:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200429172429.6054-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200429172429.6054-1-chris@chris-wilson.co.uk>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 18 Aug 2020 11:39:51 +1000
Message-ID: <CAPM=9tzr9HtR-PRzffD=6q7nRWVAEKwFKLW395cfJ4rRZePEAg@mail.gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [CI] drm/i915/gt: Keep a no-frills swappable copy
 of the default context state
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, 30 Apr 2020 at 03:24, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> We need to keep the default context state around to instantiate new
> contexts (aka golden rendercontext), and we also keep it pinned while
> the engine is active so that we can quickly reset a hanging context.
> However, the default contexts are large enough to merit keeping in
> swappable memory as opposed to kernel memory, so we store them inside
> shmemfs. Currently, we use the normal GEM objects to create the default
> context image, but we can throw away all but the shmemfs file.
>
> This greatly simplifies the tricky power management code which wants to
> run underneath the normal GT locking, and we definitely do not want to
> use any high level objects that may appear to recurse back into the GT.
> Though perhaps the primary advantage of the complex GEM object is that
> we aggressively cache the mapping, but here we are recreating the
> vm_area everytime time we unpark. At the worst, we add a lightweight
> cache, but first find a microbenchmark that is impacted.
>
> Having started to create some utility functions to make working with
> shmemfs objects easier, we can start putting them to wider use, where
> GEM objects are overkill, such as storing persistent error state.
>
The current DG1 patchset is missing something around here.

The driver creates in intel_lrc.c the contexts in LMEM, but then it
gets to this patch and gets an EBUSY trying to pin_map it.

Dave.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
