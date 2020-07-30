Return-Path: <SRS0=TdJj=BJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B842C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 30 Jul 2020 19:37:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 076482072A
	for <intel-gfx@archiver.kernel.org>; Thu, 30 Jul 2020 19:37:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNN/R9P5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 076482072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C796E2A8;
	Thu, 30 Jul 2020 19:37:33 +0000 (UTC)
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1031A6E2A8
 for <intel-gfx@lists.freedesktop.org>; Thu, 30 Jul 2020 19:37:32 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id p25so14580728vsg.4
 for <intel-gfx@lists.freedesktop.org>; Thu, 30 Jul 2020 12:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1lzFL+UgEc6FnH3Ed9rxj1S/c7LUzAdDBJO6c/t5WCs=;
 b=XNN/R9P5BDFYf+r/DrP/t9Jdm//sU0moLxtp1zmwEQJ2lN9qSRied7iER3F/KNa2fz
 4od6FzO35GlvFbV4ySJFKmQfcdwn7MzfvkX+vsDUDy/6/vX4AxP+apsk/HfpKWBe0u+u
 uZae58Iv8R6odVeOCpiNB69vi/WD+iPt5IoJL/m7ns4cMnkK/ECiopUXpLU5tgZGb9+l
 rYKAAreiIV1mskgKDCrxg+CQpjk704BxdBmCfWRWe7X8XhL9g8S2dxNlp+sjKGFCqsop
 hED0NWzzFAmqiuA6KcOXGV89QnkRsveJTuZaEZ4C3hxcVh03+veJ2P8qnh0ss0HRq0kS
 ep1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1lzFL+UgEc6FnH3Ed9rxj1S/c7LUzAdDBJO6c/t5WCs=;
 b=sH79C3g7jY+cRAzuJEiwhaTeO3bzt9LMudln8VQsVLtn3m1QKRSI/F26xTCbIxc34g
 AQvpYVE7Efb7C+zKkyF4mv/rwWsW8PYGnn1fxY5acQ4pZCAT0FC3xrblrOG6LLImro3Y
 F0LmlLfvVByx6crtFsabWCUAQDKWz6b4fqiZsuxdpensWXprFg7V2DLsMECZwoWeOE4N
 kLuM3u5PPvSu/afGG5HJQqVhtRvH8BS/r/ufMGGmP1amcevSitRjfPUnVe/AGtLIIsg6
 wCTV2O5ULlkaOUaXa2lOL8CIy52xT0+MjitGBi3yW5EubWKEHe8w2W1sDT/Jop7GAO6V
 uTfA==
X-Gm-Message-State: AOAM530O7pgi/CK4l/pW7x72kE4zfJMHo1WFfjYJLLZ4hHcuttILLmpH
 bfwVVIQCuW4ONyYf+OPNqik98FNX90yU8klADvE8xopZ
X-Google-Smtp-Source: ABdhPJx21t9FkrQ1jH01MrSyp2n4XnFzHe1jobE00ztK2APzJZ0YZgFhz0meZZHPmr54EBmWwG8l6fCL9J6QYWR3nEk=
X-Received: by 2002:a67:66c1:: with SMTP id a184mr817277vsc.23.1596137851168; 
 Thu, 30 Jul 2020 12:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200730134049.8822-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200730134049.8822-1-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 30 Jul 2020 20:37:05 +0100
Message-ID: <CAM0jSHMBPRGiSwLTn3sZb8M2FY3T=unL6wFZ2YhpUqrt=YR7iQ@mail.gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Pull release of node->age
 under the spinlock
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

On Thu, 30 Jul 2020 at 14:41, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> We need to ensure that the list is valid prior to marking the node as
> retrievable, otherwise we may see two threads compete over the same node
> in intel_gt_get_buffer_pool(). If the first thread acquires and releases
> the node in the same jiffie, the second thread may then acquire it (as
> the jiffie now again matches the expected value) and claim the node
> before it is put back into the list.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
