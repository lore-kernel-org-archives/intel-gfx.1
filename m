Return-Path: <SRS0=Vnqj=M2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D27C4338F
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Aug 2021 12:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68D2560EEA
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Aug 2021 12:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68D2560EEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4286E0C8;
	Tue,  3 Aug 2021 12:15:26 +0000 (UTC)
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A0D6E0F1
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 Aug 2021 12:15:25 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 o2-20020a9d22020000b0290462f0ab0800so20445412ota.11
 for <intel-gfx@lists.freedesktop.org>; Tue, 03 Aug 2021 05:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NSOhii9Pkds7u2GLLF3iL2oicT+PRJhz5VYiGW29+Xo=;
 b=UXznTkX+xqMFCKwMze5WemqhAaqiZIhOHsLv3VxYCKpKx6yF4aWDs631GpzUqFuveS
 YKDbOaz77smSfgJCzdY3ZCGHXTk8Px8oDovkv63SwCKD3iM2rx44MfEkIxEhtTWZhQkU
 LcrUY4RmnMole7YTQhywgNzubUKuzzeJ8G5zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NSOhii9Pkds7u2GLLF3iL2oicT+PRJhz5VYiGW29+Xo=;
 b=Bt7b458t++jer0Gl9CBOF28T4XLqnRovvE1+bWJIh/cSkgrlQUNQAcfGptpUCDVIMS
 CQTpOjHuOvLpc8HqZUupV5Nf6qDw8aGY0fOLGR7HXe9Hthd+6E7v5LjY70QTKGUdqoCv
 HH1mw4SfB36qt54d3idF1/OX/kz1lgrCK/gsE+GCymAeMNCalDQ1uPC8OP+zmyEU/luw
 xWtCLABr72LHJ8ULznfufhBogmpqUmeJap3S6LEphXmO+Jbqaj5v+drV6fOeO4mm3oHf
 tH7FEsgweDz88pAePDFufQj211LFuk4eDIyP6UxCqt0yaDVg3qpYmPyDsYrlpTMZx/mt
 rziA==
X-Gm-Message-State: AOAM530DNY83eqzqy/Dci83p1eJVqpDw20vLxnpHer/FXB5hJY/y16/F
 8mSueyRtJ92wgD3WFVoVZ4dy/Kqrpljuh7KHe5sCvQ==
X-Google-Smtp-Source: ABdhPJyP2FFiHIAc61/QjnTCwg1Q1GuNdxtE70yGUdfwKMgBd/O/taiGCehBLR5MLMr4e4bIOqxcvGcfmqNHYefcFao=
X-Received: by 2002:a9d:6d86:: with SMTP id x6mr15053453otp.188.1627992924277; 
 Tue, 03 Aug 2021 05:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210803051121.72017-1-matthew.brost@intel.com>
In-Reply-To: <20210803051121.72017-1-matthew.brost@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 3 Aug 2021 14:15:13 +0200
Message-ID: <CAKMK7uGOAx7xM=6nDGtLqqW7sf2Rjbj24hAu8U9NK9J2t5+LwQ@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-gfx] [PATCH 0/4] Enable GuC submission by default on DG1
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Aug 3, 2021 at 6:53 AM Matthew Brost <matthew.brost@intel.com> wrote:
>
> Minimum set of patches to enable GuC submission on DG1 and enable it by
> default.
>
> A little difficult to test as IGTs do not work with DG1 due to a bunch
> of uAPI features being disabled (e.g. relocations, caching memory
> options, etc...).

Matt Auld has an igt series which fixes a lot of this stuff, would be
good to do at least a Test-With run with that.

Also I'm assuming that for ADL-P we'll get this equivalent patch set
soon, and there we should be able to get real results?
-Daniel

>
> Tested with the loading the driver and 'live' selftests. Submissions
> seem to work.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>
> Daniele Ceraolo Spurio (1):
>   drm/i915/guc: put all guc objects in lmem when available
>
> Matthew Brost (2):
>   drm/i915/guc: Add DG1 GuC / HuC firmware defs
>   drm/i915/guc: Enable GuC submission by default on DG1
>
> Venkata Sandeep Dhanalakota (1):
>   drm/i915: Do not define vma on stack
>
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.c  | 26 +++++++
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.h  |  4 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  9 ++-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 11 ++-
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 14 +++-
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c     |  2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 90 ++++++++++++++++++++---
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  2 +
>  8 files changed, 138 insertions(+), 20 deletions(-)
>
> --
> 2.28.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
