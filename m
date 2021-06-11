Return-Path: <SRS0=pHm+=LF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB177C48BD1
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Jun 2021 14:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F255613AE
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Jun 2021 14:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F255613AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68756E083;
	Fri, 11 Jun 2021 14:28:58 +0000 (UTC)
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714A26E083;
 Fri, 11 Jun 2021 14:28:57 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id q16so5140979qkm.9;
 Fri, 11 Jun 2021 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yRPSeelTEPif0cVWrIOHri2lb+IuiZ08vAiEAvOsPyA=;
 b=GpVVbDKr5lkne6eeo3Y2jS54F+zpzTAwRJDuPffo3zgTS5kLt0pXrcPWTts1dIlFxq
 M03GPfes6OFQd1aVAyVFMwakrtWS+im6qDAbBD6ePrX1pWJJJ2/o83FBZCI348oveacN
 jjhGZqslf6AG2Q89lNuT16eXNKxe7Bdml98JbfYz/ogXBa50HhnichvRfQvfmgBZpV+Z
 HPLf68teiPp1WeljTewSHvPoSreEIGHLqXksV7YBjsvr/sf6lZp/7eZfHAR6nPgEKDHR
 Wigc1mxt8FbVXTovqFky1vykxMCgw/wsyFs816igLRHBS7/PJ3Pj+s1gGWYI91sqG95e
 szXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yRPSeelTEPif0cVWrIOHri2lb+IuiZ08vAiEAvOsPyA=;
 b=dpT1AddaAksgoQV2qiemT+i9GSpwvqeFQnAnfMOJux3uY7qGmmdSfZZlrwB99ncAsv
 26m6vkUweng4DWkqjQonpKAmt9cVn7wZQgsyDlCpH2q9P3hbBxAbhHI1RENEVrK7zLHU
 dGs1TvCRyYPzHligX71bNuKYlkoyregVBdaksgSYPH3MTu19yFoSURZE+WLi5wje/YlV
 toK0/emoTmKzJQySR8DUrUMkD1Vk0lp6H8LaPgBDsw1ZrtrOcH4Dhy9zKTVvPHMzcWOf
 KlGeacJzfHH5ZbEmgmJ/WNo0kKPDFVzZ+DeYZ26nEF/gYwwE8ximR1wMuA6WlGeqkuOe
 Nntg==
X-Gm-Message-State: AOAM531NiaTOFWaRgc2YSVPd0M+GxABxSP4cqxm4OnSyyIih7CRnX6PT
 gMqixH1KBhdfy0UiPx9ZeP9LNy3jx9Iyj9L0C3o=
X-Google-Smtp-Source: ABdhPJzoyw7QcJIaVbnpcnvht13XyfmR1LoSuOm1c3NRcZRsYmnVEuls40P67XhgMq3PuOjKYzqbWlnOoLhJZoxZ7rg=
X-Received: by 2002:a37:9a0b:: with SMTP id c11mr3892302qke.327.1623421736295; 
 Fri, 11 Jun 2021 07:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210611132221.1055650-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210611132221.1055650-1-tvrtko.ursulin@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 11 Jun 2021 15:28:30 +0100
Message-ID: <CAM0jSHMnaBqS19tenY_WSeqY6hDyMW-ZLaiQLqGR3LXV_Nq-2A@mail.gmail.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix busy ioctl commentary
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, 11 Jun 2021 at 14:22, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Just tidy one instance of incorrect context parameter name and a stray
> sentence ending from before reporting was converted to be class based.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
