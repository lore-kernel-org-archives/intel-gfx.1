Return-Path: <SRS0=0ugA=J2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0BFC43460
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 13:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE6D26143A
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 13:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE6D26143A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0441C6EEA2;
	Thu, 29 Apr 2021 13:47:24 +0000 (UTC)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3716E239
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Apr 2021 13:47:22 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id l1so9339837qtr.12
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Apr 2021 06:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YAqH7e29WBbnQHQKD0rVnOMeJhP05YK1LRyqdxTxJHQ=;
 b=IFfCsGyJWuAAlQyO0YnNQAaG23jaQWDY2QCJAlHHKDrhffHpbKybgvjYVzQQ7RK7k8
 Iez7cQEaixP6/ppMFiw8SvYB3T9VXRV2aY0ECPxLN/2KkZF2Fux3ZsyJcvpxZQMvN/3K
 DdQZR7wk3PnwK4INtg2GN9ryEW5PuZ2A0Lmybisw08/ssbVhqJCz1sj604ptHk2Az9wg
 7hM8AI8T4RSnlu9p/5ezmvDtBzOtmTmZWukEpZrCodWet5AAAQqcFCBx1CQ6luUOVfKn
 vmeVukcMcvdE5GtXm8/5IVFKI5sQI6wG/qpy0V2j4jFeXkZD/b2KHQq1ZXsrCu07t+Oz
 E5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YAqH7e29WBbnQHQKD0rVnOMeJhP05YK1LRyqdxTxJHQ=;
 b=IUphnYFhHzQiy2miwl2ZxD7LDUAthUxD2vsSb8z0IaIJYGCHu/ONcqBML2o4TiuxRM
 6Oxr2ihtpio5E3HDoM5eWleCWDAUdWSCTu0mPBLpXsMRt4KDJAgVTsbJewP1jUS8902U
 mnLtK6mt96cr50B/5o7HtAGH9fS1mOWd1sJqtm11b5wjMhYQphdhgMklye13gw7W/VBu
 kqqUe+alXVqvleZooqLEl1hQLznGctD4kjEC/WYxQPJjw3yzYHb3khujRg1i47lM5GT3
 NVoVQ8z5Ia6PLkFQkxPleA9lAe/FxLdsdnwVl6kpGebkXi0YDNSU6lEVagnt6OIwvdbH
 kQtA==
X-Gm-Message-State: AOAM532XDb5epiQP2FUfnbI5dZlmh4DcrWKOPFUF2P08oWJ6VEFkKHoY
 mjlB1I/dhV/B7o9CmwjI2TvkXf8eP673kh+2WLOLckE4+8M=
X-Google-Smtp-Source: ABdhPJy/hoj/O9ghMpiDXQpQRCwHbN0O0GZkRBHs1Elxw9qujpyH/kvVmeRCeev6a1KfoQrDOm0XfGGbFJ+ZvvTQjxc=
X-Received: by 2002:a05:622a:2c6:: with SMTP id
 a6mr31927365qtx.95.1619704041376; 
 Thu, 29 Apr 2021 06:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210429101036.1086461-1-maarten.lankhorst@linux.intel.com>
 <20210429101036.1086461-5-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20210429101036.1086461-5-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 29 Apr 2021 14:46:54 +0100
Message-ID: <CAM0jSHM=Jqgg6DzFSDmtaNTmLxgsKMoqVO2kT-QxPk-y3panKg@mail.gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Pass ww ctx to
 i915_gem_object_pin_pages, v2.
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

On Thu, 29 Apr 2021 at 11:10, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> This is the final part of passing ww ctx to the get_pages() callbacks.
> Now we no longer have to implicitly get ww ctx by using get_ww_ctx.
>
> Changes since v1:
> - Fix error handling in pin_map_unlocked().
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
