Return-Path: <SRS0=Ht+W=CZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CB2C43461
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 17:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86E2B2080C
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 17:33:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Efh52ww4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86E2B2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045E16EAAA;
	Wed, 16 Sep 2020 17:33:55 +0000 (UTC)
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7E46EAAA
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Sep 2020 17:33:53 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id d2so1945893vkd.13
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Sep 2020 10:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+tjT2C0B7PYUpeU+QplrrDbVq9vCks49RQVP/ATZ87k=;
 b=Efh52ww4gi0vq1sCYdFHNIvAe5TmRzYuQBPLu53LBAonpRCSCjnAlCqAvg8Cx/sv+g
 WUTQS1nFBpKQr4hkQqNmyMbuvDwAZciI5g2D3zpMusrF+HPB9a6gGClHyf6zcuHonNz7
 GoruhS/JEXtS/3ujPwGaLY8aIWw999zeYAlnR1nRpOQ3/RC78wQmqVYMaOSI680/2jsP
 VWhON045TR10bHX27UEYjNfzjbVcuFxo1lPn66CSNLck56KT/MuJsWj+L8ZXCpZ6UcMa
 Wjq5omljxkWQp5+bexNS/myv8eEeIW/H75RqdohbeK0GuWjWHxEbgxXO/G/XztUuItnT
 z+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+tjT2C0B7PYUpeU+QplrrDbVq9vCks49RQVP/ATZ87k=;
 b=DIBICvLpct34pApWMbXTqryaGxmI99eb+iANmdM5mMv8XLA5paP3U+pPH4dT7+3oTx
 ijhRMBVvQV1Tg1G0cGIYcYFiB9crESIlFfNDenXUVqX/xO5sAfOrrSiXungVUXCY8E6h
 fCcRJ58hr3dKyYcd7LfxSIAtpCJdi84xRmX7CcmWXleUX+/BGDTC68NmdT0R8xvZhmff
 tn1FRaovfL6x2U5pVbzBA6mYGZrtAWXL+hCTI7Y0eAjtdXtbhyNgFgJ80tN90d8Ev/pA
 4E7cSzKl3V43NYDMFGqJdLPBIt7AxXa0ZUpTKjpNjw1OHfYfThKTzqHVT74UcCKXnQrD
 8brg==
X-Gm-Message-State: AOAM530b5vJ6IUhbHIA33a2a6nv8ZKkY2rlXiJdABACW83tdA4Sqzxqx
 /oHuRsGGo2AKwRz6cz4S3qq5ePCGQa5+SPA0v0gEMDb4SCjiFA==
X-Google-Smtp-Source: ABdhPJyE+VDzINhH+OHGIlhlVsZXayMOjH2h0r35bdq+8u1JjiGZ2lW/vKZm7mHFkLI/9MdM67v1fk2iaj8TTFsLTJI=
X-Received: by 2002:a1f:6ec4:: with SMTP id j187mr5865219vkc.15.1600277633123; 
 Wed, 16 Sep 2020 10:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200916094607.409-1-chris@chris-wilson.co.uk>
 <20200916094607.409-2-chris@chris-wilson.co.uk>
In-Reply-To: <20200916094607.409-2-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 16 Sep 2020 18:33:27 +0100
Message-ID: <CAM0jSHMb4b3-maNZO5aKAc8ORXHebScK-9fwHemnKzhkyPryGg@mail.gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/selftests: Finish pending mock
 requests on cancellation.
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

On Wed, 16 Sep 2020 at 10:46, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Flush all the pending requests from the mock engine when they are
> cancelled.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
