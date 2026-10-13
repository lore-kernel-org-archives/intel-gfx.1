Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B525CA9ED2
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Oct 2026 12:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E383510F7C7;
	Tue, 13 Oct 2026 12:08:18 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6121C10E7D9
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Oct 2026 12:08:13 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-3ab8309dcbaso1974974a91.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Oct 2026 05:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791893293; x=1792498093; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=SL2wq6QLb6u6b9Wwd0Sv7tNMSJxrgLs/vOJ5VBrZl6o=;
 b=nPeDezwxt2qTRW3OVrobNSRYMf1pKtQ+bgz1JFnUZjNx1tjI9Htehh1sU+Ko+3OaI9
 e3WRghgAN9QGXO9MgRLQ4HsfaJsOZu0y0CoYGeSngE0YnU0MvNQbhOltaU42cX10E20f
 6zqhKHMM7AlxJLuPAfW682Ame6tLxCLocI6yMuvE2HD2BLX9rrZ3XpyuCrtFa5X6B2ca
 cPIQ10Lzrr+8Lli7sSWR5jk7CNnD/cso+HMnJTSzDmFAzfv/+NjUMd0sUVt5ecaDh9Qv
 KlsIhpzTXxj6aE4lQqslNWwrOuKIYE+62X6QX2uXI79tnwpOJ69AYwf5FbSDnLWJ6+nO
 Exhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791893293; x=1792498093;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SL2wq6QLb6u6b9Wwd0Sv7tNMSJxrgLs/vOJ5VBrZl6o=;
 b=zemCyP523ADfbAskMP9XMVF2bQFFL/SUi9E2PZJ2iAVaq1m4qH+Wu2X1VGJ6bYNRNi
 h0/5Qh2Np3Z6WSEopbvkieRrd3b+twyPDN5IMpf8jSiGXDw+e8ypULX1GagX+I6m3fbR
 rLL+cyg0eZhtiV31O/5MTc3ZHcABMM6HJxvEG0AmNC9tUAA81+swiQs91tAV5RdtP2Sl
 eA3g/qNc/uhsptfipLJA1SbV++SiYQgmsIN2vvg0rkQoklwiqv3OWpx+R1FQzUjt1OZv
 o7gd9M1Rele2HPYk/+BR7WLs4FjisbJ9c62IMrrRb3gkhBmAv//WFRiUWwnqMB96jvwN
 prmw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy/O2Bf/wQG1yxS0RW/eAwg3msp4UUXyJ7xdu5bx2+E6lEdeeTSHvXDILj629BIIpt/tvhMxHjolJA=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYI7YO33tDO/uonmrlZp56L1isDcr0rEdRhY9DlKNXzsawjJBNFk
 HT/rK5/rwIPSqRiaaDnCskv7qr0KttWW/geKzNmodl80N+8N3l7V7Nz+
X-Gm-Gg: AYBFou3Ok3TsITuwA2wh/blA0eie++O+pMIeXcOEcr1bHV8xiZbnRVsFPGnSchoE11r
 9KSqJDuu8IhaaNu963T6kziEUR0DDcwq6YTFBW0uAqn397WxxuB0dwsDzMUuu1ODCYiZASYKBIJ
 hFhQTenfpOpz9EjJQJ+hTVWccI+nxAKJNqsFP5AXts4LAFY7rhWIdD1MSrknQyg7krjo0wULx78
 EgE0v6/e3Qox9+EL7yp6zUo8WypOZamWeEBxhwA5Z9Eske3ejAwj1xLVcYTN6UH5PdmgKQ+CmNY
 yI7t0MBHvuZjFEbJrT0IKbGprtq79LlHFHybyFnhHwrg4oFVB5X67n5dYawxcWNPIrErZmo540w
 fncIg8mgeSVjCgkLW2I9EUB2POTURat/ybwacOo0DCOodiYZy7WM192Vpl9xqhAeBcCYCwQrjHE
 UZrXE24cgEMag6+1z04PCb4qfos1WCAk8TrQqkhlHnebsab+U4TYwiPzUNypAnTZah/vn7Gb6l4
 IjFQgJJiu0WniaUYzE/Btw/zEcpWI9K5A==
X-Received: by 2002:a17:90b:384b:b0:3a0:295e:6e61 with SMTP id
 98e67ed59e1d1-3ab3a953717mr6170484a91.12.1791893292679; 
 Tue, 13 Oct 2026 05:08:12 -0700 (PDT)
Received: from localhost (softbank126159121187.bbtec.net. [126.159.121.187])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ab37817414sm21827776a91.2.2026.10.13.05.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 05:08:12 -0700 (PDT)
Date: Tue, 13 Oct 2026 21:08:10 +0900
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Zhi Wang <zhi.wang.linux@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Xiaolin Zhang <xiaolin.zhang@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, zhiw@nvidia.com
Subject: Re: [PATCH v1] drm/i915/gvt: Don't replace a DMA mapping that is
 still in use
Message-ID: <as4fKufR2O21NWk5@dell-wzy>
References: <20261004212403.208681-1-oss.patchbox@gmail.com>
 <asm4DV84UitLCbve@dell-wzy>
 <CAGG=RgApzG=MeZ9xbpeBzqE0i0Q6RCPXtnyS-30JfEDPDKNN0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGG=RgApzG=MeZ9xbpeBzqE0i0Q6RCPXtnyS-30JfEDPDKNN0Q@mail.gmail.com>
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2026 at 12:01:31AM -0400, Yuho Choi wrote:
> Thanks for the review!
> 
> On Fri, 9 Oct 2026 at 23:59, Zhenyu Wang <zhenyuw.linux@gmail.com> wrote:
> >
> > I don't think this is *real*, as code would simply destroy entry in
> > that case, and there won't be on-the-fly dma operation on that, as
> > guest mem setup is totally before execlist submission, if guest driver
> > changed mapping by ignoring gvt emulated execlist status, that's just bad...
> 
> You know this code much better than I do, and I can't test it without
> GVT-g hardware, so I may well be missing something.

I can understand that but I think for any non-trivial change or
for sensitive part, testing is a must...

> 
> The case I had in mind is the guest mapping the same page at both sizes
> and keeping both, e.g. 2M in the PPGTT of one context and 4K in the GGTT
> or in another context's PPGTT. If the second request replaces the entry,
> the first shadow entry seems to keep the old DMA address, as
> shadow_ppgtt_mm() reuses a PPGTT that is already shadowed. Is that ruled
> out somewhere? Please let me know if so.

Shadow ppgtt is created by a PV interface, so each context would have
separate shadow ppgtt or shadow mm. GVT handles guest page's dma
mapping per-vgpu as for per-VM. But GVT handles context submission in
order, shadow ppgtt is populated for each submission. I think even in
your example that possible one page mapped in different context as 4K
or 2M, it would be remapped as size doesn't match for each submission,
so no invalide dma address access.

I doubt if i915 could possibly have such case in reality..

> 
> > So this change would always force 2M to split into 4K? why?
> 
> No, only when a 4K entry for the same gfn is cached at the time of the
> 2M request. With no entry or a 2M entry nothing changes, and a 4K
> request now reuses an existing 2M entry instead of replacing it.
