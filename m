Return-Path: <SRS0=MAHO=MV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D619C4338F
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 14:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D44C6069E
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 14:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D44C6069E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3B26EDB2;
	Thu, 29 Jul 2021 14:45:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DF66EDB2;
 Thu, 29 Jul 2021 14:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yXVoVs90MS1xZ9tjxl4bGWV3as2/GFBM7qNojQie/p4=; b=NQVTi6MOTMOFnA5GJnFX0Xd5GJ
 HPir7Vag2LISCmHW7sWkZbCucsXBS1h25ee4xy+eeVwqRONc36m8sSE516mdDKAiHrorePAR6NOZ/
 MVOvIHpwEFovnYhOuiGQm6wsjT9Cuw6+uOH/7WqqqbDb3IKQVUHruAQ9Rt+ANkwN/WxsMEBB5lw9b
 mmSp9hjza3Ijnh/IA7rxrxinhl8gmepWpSSlX9IZf3egqd0tLE3B6GfUaPpIQrPM9j9Z5gpgbT/7F
 imD4I01sncchnnRHubC7jUDk+wnb+tDeJkFsnIYpxGhEWUUe9b+yJK5Dra3TlkItp3X/MKx02bLOa
 aRqmtYAA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m97Hd-003z22-Ow; Thu, 29 Jul 2021 14:45:13 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 407DF300215;
 Thu, 29 Jul 2021 16:45:11 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1099229A0995A; Thu, 29 Jul 2021 16:45:11 +0200 (CEST)
Date: Thu, 29 Jul 2021 16:45:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <YQK+9p+RIcFuzD3O@hirez.programming.kicks-ass.net>
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
 <20210722092929.244629-2-desmondcheongzx@gmail.com>
 <YPlKkvelm/mcnCj0@phenom.ffwll.local>
 <YQAaIrNUXa6i2gxD@hirez.programming.kicks-ass.net>
 <YQJSE3TMRydDNhqT@phenom.ffwll.local>
 <fbf2ec46-5ef5-7108-450a-13a7c48c30ce@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fbf2ec46-5ef5-7108-450a-13a7c48c30ce@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm: use the lookup lock in
 drm_is_current_master
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
Cc: tzimmermann@suse.de, airlied@linux.ie, gregkh@linuxfoundation.org,
 Boqun Feng <boqun.feng@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 mripard@kernel.org, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, zackr@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 10:32:13PM +0800, Desmond Cheong Zhi Xi wrote:
> Sounds good, will do. Thanks for the patch, Peter.
> 
> Just going to make a small edit:
> s/LOCK_STAT_NOT_HELD/LOCK_STATE_NOT_HELD/

Bah, I knew I should've compile tested it :-), Thanks!
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
