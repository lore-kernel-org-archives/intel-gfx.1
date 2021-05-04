Return-Path: <SRS0=qSOt=J7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4EAC43460
	for <intel-gfx@archiver.kernel.org>; Tue,  4 May 2021 14:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E666610A0
	for <intel-gfx@archiver.kernel.org>; Tue,  4 May 2021 14:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E666610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573896EB1C;
	Tue,  4 May 2021 14:58:55 +0000 (UTC)
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7486EB1A;
 Tue,  4 May 2021 14:58:54 +0000 (UTC)
Date: Tue, 04 May 2021 14:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1620140331;
 bh=qEGxxhio4KaOagLa+mw/91EPyjF4mijCoGDB/nEKnaI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=dVwyWgUr9/GdatTYaoqxaLJ8/LNbZ/iTKA+oBmNUod49weBCN2tWEtyEHTnxiGeKG
 Y+fFSxa7oFlnErdrA4rUhdoWDDvFi4ay6BJ1qO46aXTCn8/h0cYLgLtH1pkPRCGy+X
 JfJfgJo0VRKJDTSKpDfbqS5Vb8BnSAflwuZtfxxIaoecC4WxcHJPjX1YDrBxgZjjbb
 /Zn8RLF/x5TWLXKgI4owGtpvnszmts1a7H9jDAw+hZE+j9OPJXmBepV4Vlae9JeQl9
 rbtlG+ObYFwz9DQswOtwe1HxvKKwZgDxBeLm2BsTY9FV5ZbUXmJiJQrtlSPirBHLm3
 CN830PawN2oEA==
To: Emil Velikov <emil.l.velikov@gmail.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <_ICN4Ho9WvMf55FvcWEqbzvApWTRd3hIiVAJ8vkrc0XTljEiq3f5aOB8ElxJL3WTL--P1-VZddkcjLcwdL3YxdPkYClHuyMhtQ0-Zv88Fh0=@emersion.fr>
In-Reply-To: <CACvgo50frye2h5L78YKnHm8TaE9xM=fn-7fNNtHbSwiv+GnYVA@mail.gmail.com>
References: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
 <20210427092018.832258-8-daniel.vetter@ffwll.ch>
 <CACvgo51rQJmHc1K-MSq-WLZkwVt34MY73csgEyxorrYsKPwQiA@mail.gmail.com>
 <YIgB76WmQijHCJeV@phenom.ffwll.local>
 <CACvgo50frye2h5L78YKnHm8TaE9xM=fn-7fNNtHbSwiv+GnYVA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 8/8] drm/modifiers: Enforce consistency
 between the cap an IN_FORMATS
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Inki Dae <inki.dae@samsung.com>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Continuing on that idea to push for enabling the cap in more cases: do
we have a policy to require new drivers to always support modifiers?

That would be nice, even if it's just about enabling LINEAR.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
