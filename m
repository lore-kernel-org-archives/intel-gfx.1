Return-Path: <SRS0=FEgb=NK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720D7C4338F
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Aug 2021 13:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E7A3610A1
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Aug 2021 13:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E7A3610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8036E90F;
	Thu, 19 Aug 2021 13:31:25 +0000 (UTC)
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4A36E90F
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Aug 2021 13:31:24 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id y144so7117785qkb.6
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Aug 2021 06:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P5LRAIsomsNEiTO3gkFgAEAG5VC+Mh0RHfrbCCbqhCI=;
 b=odXwP2eNytACjcqSVTAEWplRbQ6mUCptIhrhlJgcVspVgcDAuY1EPkMYyOx1w9Evwv
 ggFVN5Sl9ODjdFPWVbnpRs3tgqxkL/3WuAqrzC6F8VjMVQ7d7b+bcXEhHXZdnj6AtjZw
 HVxiepV0FGCgs0MTFXxYfFEdNAeNJyMcVg2xMfMHPuRpSVJvZ5NcQsQpm6wAQ1U15oU5
 4hKTnJBRFdbDPlpkHOo+SNINYe5Ce5xU6NyjvUJZNOtFZ1qJG+wcw4UZN8EtFXP5OoVN
 hp1yXUWFEV++18cGDtYMUAml4htZucXKVTL1944XYI0JoLABod+iqyYq8QYK8ube7JZk
 Zlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P5LRAIsomsNEiTO3gkFgAEAG5VC+Mh0RHfrbCCbqhCI=;
 b=aXDppIS1yKDUODe0s7ODqUDbFeTg0rEoYsBn6p9CIpGKI2wc/oZnaMdXpBlnPIEYa1
 ZrlaQFK2w84XDRSMlu5QJcz65mx5dbZITPGYt99dEZG9tFsJq2q2KQ1SsgPiZ+vDK+2F
 hucwTW+CmTtz1qBrDvAAmMQJfGw2VdgOaeufvGmJJxTuzh9jVyrgaLAoiaTVqSicnAMs
 nwo+G+MdB0C1k43NgFnysh7iTt1Lz/x278WjHfiy32Ws6947vqmNB62w9JUEpiMk9k5Z
 aA7KqtjfZDmReX7ESAVO+QwqOuF5klRZmeQ5KiZZDnkRufR079WGqT96EakJD4Ue8MIC
 zlkw==
X-Gm-Message-State: AOAM530uFMhGEbOxetUeAVfpzWcpQVgra1kopIAQ+CwDuU5cn+FsgqRG
 7/39/f2q0cyiQCsK5V4NvIgWHJg5fGPrMwvMo8KldWIqtN27kg==
X-Google-Smtp-Source: ABdhPJyL87V1kKAc9LJ4vnxaFf1xdUsYqatNolptnlGeahEx6ojRzbU3EF77WA+kuQYFO3BNkv5Az8gEsh4I8PrDRm0=
X-Received: by 2002:a05:620a:c05:: with SMTP id
 l5mr3723880qki.17.1629379883933; 
 Thu, 19 Aug 2021 06:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210819093419.295636-1-matthew.auld@intel.com>
 <162937826268.747.12676970171860091710@emeril.freedesktop.org>
In-Reply-To: <162937826268.747.12676970171860091710@emeril.freedesktop.org>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 19 Aug 2021 14:30:57 +0100
Message-ID: <CAM0jSHOeMG2yPkeJ6yt7=tfGwTL2F2Q5wq_HhJv+ZBH_yCcgqA@mail.gmail.com>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: Matthew Auld <matthew.auld@intel.com>, lakshminarayana.vudum@intel.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-gfx] 
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2Vy?=
	=?utf-8?q?ies_starting_with_=5Bv2=2C1/2=5D_drm/i915/buddy=3A_add_s?=
	=?utf-8?q?ome_pretty_printing?=
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

On Thu, 19 Aug 2021 at 14:04, Patchwork
<patchwork@emeril.freedesktop.org> wrote:
>
> Patch Details
> Series:series starting with [v2,1/2] drm/i915/buddy: add some pretty printing
> URL:https://patchwork.freedesktop.org/series/93819/
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20853/index.html
>
> CI Bug Log - changes from CI_DRM_10498_full -> Patchwork_20853_full
>
> Summary
>
> FAILURE
>
> Serious unknown changes coming with Patchwork_20853_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in Patchwork_20853_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> Possible new issues
>
> Here are the unknown changes that may have been introduced in Patchwork_20853_full:
>
> IGT changes
>
> Possible regressions
>
> igt@gem_ppgtt@blt-vs-render-ctxn:
>
> shard-snb: PASS -> FAIL
>
> igt@gem_spin_batch@legacy@bsd1:
>
> shard-tglb: PASS -> INCOMPLETE

Lakshmi, these are unrelated to this series.
