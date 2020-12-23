Return-Path: <SRS0=gLHY=F3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF288C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Dec 2020 05:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9107522202
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Dec 2020 05:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9107522202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1E76E8C6;
	Wed, 23 Dec 2020 05:58:01 +0000 (UTC)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E216E8C6
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Dec 2020 05:57:59 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id 2so10635831qtt.10
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Dec 2020 21:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9AQIg2tEJcqdIopbefziQIusF9qS+FasinIBQYilTXU=;
 b=Y8y4JmYrJFLglVJ0bhKeMbD8vi/r2uCaaPmwmhTnHwTkm2p4IxETrz/Wau895exnwQ
 bXXmo6ycPEDgwbwt/up0xQrUBD9aOHUgdMJhQ+pqnc2SD2xkA09oY0QbyVRlS7aBWe8q
 TbCMJpMruEUHl4O/ssjpBZ3tAr4YO/ygyO5W+OFwfBJcLyjYM7iyaoggC5miWrWP8c43
 f1GAzQcaW4w4G5IYmYeg21X7uCMdPqq4H/a3kLuS6J5TG44seExRV3/kvCo8Ku+gfLHo
 gje1Eq4hQ8E311q4M+QoFESBLobmmfHhSCfd6nwpFYe1IsfQ9usGeN2VU8gvR6mo8YNC
 HQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9AQIg2tEJcqdIopbefziQIusF9qS+FasinIBQYilTXU=;
 b=W0bkFpjK95K+YSnQP85WBv4fhTYBI611IvqDhB+m6M1hNVEYzU/JFEgr0MzmvwlVgE
 Eaq0RUEaBsw7y+M2LHevX3QIKIJq1tcIPmTPkZnBRzM+ykcFO7J+s8c37MJmE/93eMzs
 xQA6gZMMaNbkc3dMrkhw0pialaeb0rBSVLXZtkWkKD18QcoR3/zAG+zNpccl1TNgUjfr
 OWNjg1fn2qjEi7TRuUGJsqA1j9wHpcfhECIGbHCQIIZyILTjsKtQQ/FJYykWbng+yz8+
 EDj4BalPOtq3/8+5Z86I6pq63cnqzEyLphQIAMDuui780oRyF9D2n5cO2er8zO74SSu2
 beIw==
X-Gm-Message-State: AOAM530wFupdSkF7YPS5+0MnBVZYwsj/6BXtQUnLoQBlomRu2BZnnhjB
 LBZy89Phx7pMcHEBZxDpLWZkqcBXN8/eCuLbAiOw7ofk
X-Google-Smtp-Source: ABdhPJxvMDPZsWIWl2Ej32iYhX7R+oFrQ8jw7XAZ5eUmcexoXy8SyI/XtBMWfkuSOL4X1xqIaoYrT946zUBZihcSb+k=
X-Received: by 2002:ac8:1386:: with SMTP id h6mr24301603qtj.95.1608703078914; 
 Tue, 22 Dec 2020 21:57:58 -0800 (PST)
MIME-Version: 1.0
References: <20201211110310.22740-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201211110310.22740-1-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 23 Dec 2020 05:57:32 +0000
Message-ID: <CAM0jSHN6-LOXxtBqQpwB7VTOY_BQUeuPnvCRTjdZVosAZ4eJnQ@mail.gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use cmpxchg64 for 32b
 compatilibity
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

On Fri, 11 Dec 2020 at 11:03, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> By using the double wide cmpxchg64 on 32bit, we can use the same
> algorithm on both 32/64b systems.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
