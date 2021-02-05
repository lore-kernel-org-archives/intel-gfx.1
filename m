Return-Path: <SRS0=PZs0=HH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0D4C433E0
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Feb 2021 21:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F33964FC6
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Feb 2021 21:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F33964FC6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788A86E086;
	Fri,  5 Feb 2021 21:29:07 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C606D88E34;
 Fri,  5 Feb 2021 21:29:04 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23803014-1500050 for multiple; Fri, 05 Feb 2021 21:28:53 +0000
MIME-Version: 1.0
In-Reply-To: <202102051319.E5D8B4528D@keescook>
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
 <20210205210610.29837-1-chris@chris-wilson.co.uk>
 <161255976138.12021.9385501710085642237@build.alporthouse.com>
 <202102051319.E5D8B4528D@keescook>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Kees Cook <keescook@chromium.org>
Date: Fri, 05 Feb 2021 21:28:52 +0000
Message-ID: <161256053234.12021.17815864250035077266@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH v2] kernel: Expose SYS_kcmp by default
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
Cc: Will Drewry <wad@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andy Lutomirski <luto@amacapital.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Kees Cook (2021-02-05 21:20:33)
> On Fri, Feb 05, 2021 at 09:16:01PM +0000, Chris Wilson wrote:
> > The subject should of course be changed, as it is no longer being
> > enabled by default.
> 
> "default n" is redundant.

I thought being explicit would be preferred. There are a few other
default n, so at least it's not the odd-one-out!

> I thought Daniel said CONFIG_DRM needed to
> "select" it too, though?

Yes. We will need to select it for any DRM driver so that the Vulkan/GL
stacks can rely on having SYS_kcmp. That deserves to be handled and
explain within drm/Kconfig, and as they are already shipping with calls
to SYS_kcmp we may have to ask for a stable backport.

> Otherwise, yeah, this looks good. Was the
> export due to the 0-day bot failure reports?

Yes.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
