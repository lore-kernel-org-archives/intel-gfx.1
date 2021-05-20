Return-Path: <SRS0=a6yN=KP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FF6C433ED
	for <intel-gfx@archiver.kernel.org>; Thu, 20 May 2021 14:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DA07610A2
	for <intel-gfx@archiver.kernel.org>; Thu, 20 May 2021 14:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DA07610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644766E3FC;
	Thu, 20 May 2021 14:07:46 +0000 (UTC)
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54FA6E332;
 Thu, 20 May 2021 14:07:44 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id v8so16270656qkv.1;
 Thu, 20 May 2021 07:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ytwyc2rd26HegdNA2IyeEVfQs5d/jjcm5L5OfWQMEn8=;
 b=T8mYpGc7SpzWbitRRqvnct/KPb7fwyDo84beqMY2effwHKpU2cjarPNyiA02jO5VoA
 139l0kQAHbeccNh3SOk+rgPDpMorLAyEn4ObCZelupUnP/rx/fYxeIGBzFTq9RHhULdS
 z22j+LJMF43YkDGXDa7gQ3aKZjbR5jSU/qHy6g+HrsFp0oD1ikHg5RFvX/1PSpKekopT
 LZEV22ndA9u8oCChTH1x7kwUizgvvdQvXQBTdftOsUn3wmjbv7onWA5SjI+2NvSyUUFn
 BH3qfs444NuuZuZsISXvY4qQ0kkkfnlHY+8aYefPcu7obkitnoS5sE3sCc8ILe1kNwSH
 ORnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ytwyc2rd26HegdNA2IyeEVfQs5d/jjcm5L5OfWQMEn8=;
 b=hMlJDVSM9W+p6kC945SWaD8wD1K78BfvY+EVYOQMCBUviiPWAupxnHBQrhR76qHccK
 3lTneSIecTTVllcPSj1twNayK1VazlHXA2mHTzc5SfPFnpnTy4qU30QfRj+I1g/I70pb
 m3hnYKF2LA0f53rmF3WcN06DtiBk0fTK0R4bwATX9Blc1//kUKerB2Uyk56IPgqQI+Ee
 JDPMej9JpX/cTsVJlJwzwrgME0447mVgbTN1u8td5u57Tb+BqMXHcIZAv6xLkOzELFIq
 F0e2JsYGeKRLhSxpmiTqqZAA6QZAh9Z7r0QX4/f+Jq3T/yskkK+93WOsmtVLdbbZug2W
 YCsg==
X-Gm-Message-State: AOAM531PgZ0wyZ0PhonlasTWIAoOrl0Z/jgQApXChSnRLUWbXsDE48Q5
 /vTdEcBcP+AOgQuSww9r2N1GWErjyt5sfZ8OuqE=
X-Google-Smtp-Source: ABdhPJyGvUjwwyny1TE05MUhwqeqp/dZ1srNSNit/9c9Y/6m22v8UX9ydbry0qV9MnfmZL6mkbhqxRCfmHfDONgfHbo=
X-Received: by 2002:a05:620a:14b9:: with SMTP id
 x25mr2960889qkj.460.1621519663865; 
 Thu, 20 May 2021 07:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210520080646.24132-1-samirweng1979@163.com>
In-Reply-To: <20210520080646.24132-1-samirweng1979@163.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 20 May 2021 15:07:17 +0100
Message-ID: <CAM0jSHO1K_qrnPMAvoGst=_dRF7BjzSumLH8pVd-3k9Ejk_44w@mail.gmail.com>
To: samirweng1979 <samirweng1979@163.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: fix typo issue
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
Cc: sudeep.holla@arm.com, wengjianfeng <wengjianfeng@yulong.com>,
 David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 kernel list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, 20 May 2021 at 09:23, samirweng1979 <samirweng1979@163.com> wrote:
>
> From: wengjianfeng <wengjianfeng@yulong.com>
>
> change 'freqency' to 'frequency'.
>
> Signed-off-by: wengjianfeng <wengjianfeng@yulong.com>

Pushed to intel-gt-next. Thanks.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
