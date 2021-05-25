Return-Path: <SRS0=ggpC=KU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9681C2B9F8
	for <intel-gfx@archiver.kernel.org>; Tue, 25 May 2021 16:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5CCF613F5
	for <intel-gfx@archiver.kernel.org>; Tue, 25 May 2021 16:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5CCF613F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43D16E170;
	Tue, 25 May 2021 16:05:56 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1446A89A1F
 for <intel-gfx@lists.freedesktop.org>; Tue, 25 May 2021 16:05:55 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r12so32826248wrp.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 25 May 2021 09:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=f7DBrUo3wL4Qpwwbs5pU+Y2UR7h2QKSlSLVfoQUFNMI=;
 b=B3DENF8eoHhecWAFNQVLS2JEamnemU33gyvaAri/jUlxzebGZ65BPV0vBbEDgtL0i2
 ktvkA4hfm35xWOsU0Qpu7M/Khpm+8vhn3XskgiCo4rDbB3tRmN4WHjCEACwUXqYx4FeY
 Jtta5hNrcC+yqioS0IajWgJ26ctB5Cv70tzOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=f7DBrUo3wL4Qpwwbs5pU+Y2UR7h2QKSlSLVfoQUFNMI=;
 b=euDAkO4Osvt4PzEDFTV6XA+YG5HIOB//rtFPNqLb3GrL7nPFeG4Nb7mdEJTIMROPwl
 RBX8Yu9NcFQDuPNqt2GXkLwyvk2XbekmFLZQojk+OYP/DPkA38s/9RUqYuPd4B9bSkDe
 seTOQAQRF8C02RpTzRqspScsIdlf93bHn6IyizSzoakVEGwaC4b6OgQQjyPBl95uIAL3
 UXfFsLSmszWWmnNDLtKgcglRac8YszVmk/5KpZGcmrfLtZOZndZRpRtmVjNmwjpo6QMU
 iIUMfmyLqWsUt0aJsKVPe1MqjNpEhYFQPDHaLxZQfUjJgK+8qNGn3y6W7LeviT4WGOJj
 JtJA==
X-Gm-Message-State: AOAM530DvxP7OegGaKDICRjbM+iHTkxIqNJq/zfVonOq614Amz5y06Ow
 JqYC3QXKyMHeAtnwnOdiJN+Ddg==
X-Google-Smtp-Source: ABdhPJzmCQM+KdUAXONpPffkFRK0K5WklaT15aqWUiMtaXWooOfXUGpF52ocgwjNDKESzlRppx+OrQ==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr28170569wru.90.1621958753771; 
 Tue, 25 May 2021 09:05:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h15sm11169638wmq.1.2021.05.25.09.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 09:05:52 -0700 (PDT)
Date: Tue, 25 May 2021 18:05:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Message-ID: <YK0gXjANguasJLu5@phenom.ffwll.local>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
 <0b2b3fd7-7740-4c4e-78a5-142a6e9892ea@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b2b3fd7-7740-4c4e-78a5-142a6e9892ea@tronnes.org>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Subject: Re: [Intel-gfx] [PATCH 11/11] drm/tiny:
 drm_gem_simple_display_pipe_prepare_fb is the default
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Lechner <david@lechnology.com>, Emma Anholt <emma@anholt.net>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Jeffery <andrew@aj.id.au>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Joel Stanley <joel@jms.id.au>, Thomas Zimmermann <tzimmermann@suse.de>,
 xen-devel@lists.xenproject.org, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 04:09:13PM +0200, Noralf Tr=F8nnes wrote:
> =

> =

> Den 21.05.2021 11.09, skrev Daniel Vetter:
> > Goes through all the drivers and deletes the default hook since it's
> > the default now.
> > =

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> =

> Acked-by: Noralf Tr=F8nnes <noralf@tronnes.org>

Can you perhaps also look at the prep patch right before this one?
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
