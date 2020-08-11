Return-Path: <SRS0=3cRA=BV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FB6C433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 11 Aug 2020 10:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 477FA20756
	for <intel-gfx@archiver.kernel.org>; Tue, 11 Aug 2020 10:49:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aqvu2maG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 477FA20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AC26E4F1;
	Tue, 11 Aug 2020 10:49:16 +0000 (UTC)
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F0F6E4DD
 for <intel-gfx@lists.freedesktop.org>; Tue, 11 Aug 2020 10:49:16 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id y8so5740174vsq.8
 for <intel-gfx@lists.freedesktop.org>; Tue, 11 Aug 2020 03:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hR53kJA7+HG11LynphjIEWecXVIfzgwkhlY4lwPKma4=;
 b=Aqvu2maGWILoEvX6Ff0//puwZ9/WT/9qm9qOjyiP3JfPfTocN8o4RflU5zjx8KPb4d
 yv+qNRCMQtkCZXNthg5Klo3nvgQbEItNkYORFk3SYj5KPL6YFAAaYKHQQesFP7mRU9fP
 AujNPZNJUGmBe9fFjqJPp6vRQ10a43vqt1GtJLRN3urV1euXXE/H/j9WBrXN3sru7h3N
 FsqwJ6m3K0Z4LYqqY4VKmsNcgSxgyYK5wvnBcsqSJs8BHpSOeQaW2KFuR14nNErEB3mW
 c9ho/THchEYrBPHBK8FE6tu+vmFh9HoJR493Ef/tRJIMRuTWL2LTlzgj1eDUMsQ0Dy9+
 Z3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hR53kJA7+HG11LynphjIEWecXVIfzgwkhlY4lwPKma4=;
 b=Daq0G4eA1i/sWtKR9Iatsi5B52FCkqr71xmhWngiR+JQhk07tpXf3wdTD0Lt8YM1AA
 w5gl5gRKv0j2APxfwb4CEDdsSc5ddrmnMhGQIWZplsP4Qdb7QZ3mGb+kOok/9f1ToZXf
 erwH4Jyi9M+uECJ3NBcDx9tLiFOdx+9BDc4AS3cAXoKquryC4MHuDCoCh1N0beE7UHoA
 8ZaUWN8vEC+T4DXQyxoU5RdoqkGS+yt7ZzGjgNQTtqu2+q0ymF5WbjXTGTaSEVHINv3f
 6B5bqrySsS5Xt9AG2rqM4/pmLma+OcX3SM6hCIRx460z3TR81mxAPdFgGOv0Bx71dW1B
 nv3Q==
X-Gm-Message-State: AOAM531zWeVpy8MjLjNTI27LIaLqUQJmNUENBAW2rxmX/yzvx2UX7R7s
 oyhJtbmfPIeGbCEoAWyC+5miCrQkBhj7p0IXNUA=
X-Google-Smtp-Source: ABdhPJwE2OVyFtuA2jbBYQaDjtnMqWzB4uINGbZLPKENQXEQgMPER+Y1LQGhfx3qLEQ1ImNirnFJTsYs7oKRUM46I1I=
X-Received: by 2002:a05:6102:382:: with SMTP id
 m2mr23129102vsq.34.1597142955249; 
 Tue, 11 Aug 2020 03:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200710115757.290984-1-matthew.auld@intel.com>
 <CAPM=9tx1bjf+0RpML8R3sKeWBGwoX4QQxrS3dFcB=nN=+aWXag@mail.gmail.com>
In-Reply-To: <CAPM=9tx1bjf+0RpML8R3sKeWBGwoX4QQxrS3dFcB=nN=+aWXag@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 11 Aug 2020 11:48:48 +0100
Message-ID: <CAM0jSHP0Dt0XbdZr5UvuQZDH4nOD2629WBGKTe5yT8k025KgQg@mail.gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [Intel-gfx] [RFC 00/60] DG1 LMEM enabling
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 11 Aug 2020 at 04:23, Dave Airlie <airlied@gmail.com> wrote:
>
> Hi Matthew,
>
> do you have a rebase of these or a git tree with them, once I hit the
> PPGTT support applying started to get messy.

Yeah, that stuff pretty much needed a rewrite.

https://github.com/matt-auld/linux/tree/drm-tip-lmem-dg1
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
