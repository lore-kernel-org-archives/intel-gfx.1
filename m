Return-Path: <SRS0=Ajii=IJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA723C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 19:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DAB764FDE
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 19:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DAB764FDE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D7C6EB74;
	Thu, 11 Mar 2021 19:08:21 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B796EB6E;
 Thu, 11 Mar 2021 19:08:20 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v4so204337wrp.13;
 Thu, 11 Mar 2021 11:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pF7No3WYUbj7605JGq0ce6bExxBu7wQzQsniyVdaykE=;
 b=jrCGW3wtz3JEoOCyHp48HGQBuo11adWfWE6zMpDEQlq+Z9wUONC5qYHvLM3mLJma/N
 BtUwQJiGIiAj7EAAKGW4bsoaQYaWhQdeIRa7yU+wB5I9oHnoa2TVW7KtPx5lVlGGljoa
 Wl+YqL8zpZTEFjWFToRux3RGlK7vfpSmKCrrU4d1eb+ewSQiIeiweKtGh0JWmQYVUlik
 nrPYC+75/4LLcQRY8D0+k5OfSjFFtV1gxVJlVciH/7Z3uH/rnw25MZm8avXWe5HhRfNb
 FGXaFpjNRCR+8PDG/AAx/oRc+GQNiTPm5W47/1Bmu9aNDcAu+1jSD3X9sX3aA4tkcybn
 2FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pF7No3WYUbj7605JGq0ce6bExxBu7wQzQsniyVdaykE=;
 b=Ke4lL7UarZk5fauNIjKJump5BBJsSi4qoYyxYOhP9S18Ugf0QJ2kc/xqO31HsDvoJf
 FN9ofhtVAoGIEZp9ZsRyIDUqgaOCGjE5Mh2KLG4FaWJ6dro10IpWb53R6siXGLw1FdwT
 Ya/YBfmiCcO9TtsRYmKLUiyugmz9FedAvm5LRYmZXtogWs5xFytFQW+rYR6naWBfbl4U
 WU9LPhU/Pv9DFhzls3JLdmT7UEiAwYTJmKQasBL5QwpqMtRHd04AfvObbl20zOWj9Yuw
 lnnE5CnvBPG8SkBnrgmzkA2PWx3iGjp2Qlo0CEklwlg8y2q6WaVBAVi/oLi1OOFUrgcI
 dsAg==
X-Gm-Message-State: AOAM532cHO3BfA+KxdE80b2JUGFNXlCp2nlx6mcHN8F5OxBT4RrW7q9Q
 MRfH5YDrPasXGwvxihFVOSuw5qs5rAFR4/p1iWWms7hm
X-Google-Smtp-Source: ABdhPJzOEuqNJhwSPoy3pJeUYmkxR6DIjNlkdSvUznJcjT/by4rMEkC0+ZMtWqJEgttpmltzNgFX4+FIuvJmDPG2DNs=
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr10673073wrk.146.1615489699365; 
 Thu, 11 Mar 2021 11:08:19 -0800 (PST)
MIME-Version: 1.0
References: <20210310210049.723206-1-jason@jlekstrand.net>
 <87a6raekd7.fsf@keithp.com>
In-Reply-To: <87a6raekd7.fsf@keithp.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 12 Mar 2021 05:08:05 +1000
Message-ID: <CAPM=9tzYJ9ru=SCcm1DW-cRgiPHhFSyK3EZv5Vtg9pZD2UxDWw@mail.gmail.com>
To: Keith Packard <keithp@keithp.com>
Subject: Re: [Intel-gfx] [PATCH] i915: Drop legacy execbuffer support
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
Cc: Dave Airlie <airlied@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, 11 Mar 2021 at 08:04, Keith Packard <keithp@keithp.com> wrote:
>
> Jason Ekstrand <jason@jlekstrand.net> writes:
>
> > libdrm has supported the newer execbuffer2 ioctl and using it by default
> > when it exists since libdrm commit b50964027bef249a0cc3d511de05c2464e0a1e22
> > which landed Mar 2, 2010.  The i915 and i965 drivers in Mesa at the time
> > both used libdrm and so did the Intel X11 back-end.  The SNA back-end
> > for X11 has always used execbuffer2.
>
> All execbuffer users in the past that I'm aware of used libdrm, which
> now uses the execbuffer2 ioctl for this API. That means these
> applications will remain ABI compatible through this change.
>
> Acked-by: Keith Packard <keithp@keithp.com>

Acked-by: Dave Airlie <airlied@redhat.com>

Dave.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
