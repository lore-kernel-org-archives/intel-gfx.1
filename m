Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E73CC6B33
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2026 12:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D608A10E1E4;
	Thu, 15 Oct 2026 12:15:59 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8344410EABC
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Oct 2026 19:25:47 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3a9787a15bdso37342821fa.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Oct 2026 12:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792005946; cv=none;
 d=google.com; s=arc-20260327;
 b=G9HDiZEBYUNyLMuN4Xg3omgqroRigL4SL3rUrOdBu4nQ75rLB4jqmNa39Z/94evX+D
 DLDlNnOmsrdn2AkMu6Z1JoUnfe72V9D8BOklfNB1vf0yX8RBcT3I8SpMKiD0LxStuthh
 zqbiFwoyT8y6Yl7Qg/HtxQcwXcGalXzc6psRTCC2LmbXFoKaT3UocXdTMV3FV3PV5I+0
 Rw+qjpF5aasEzzAm1+rgFSW8EPEBw5SYuJaTYSla9oz6BU1RtZcojLRRv6T0qvrYShg8
 PLAt3ZvmUVARWXjXBRLRXtR+SSNP/+Ck4+rsW1JtaZOZFoSoPGMlu4Avs7rBcH+/C1h1
 B2pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=582l4UN9d8ZpIIQBKyvfoe2ud1OuHObN9VtOBwz13Bg=;
 fh=NmWNnwlnqDtOUSpGw3I6qSj6CL71zWsIXMVr9XA5hI8=;
 b=BAe842y/IaZuO5Xsi1fkTaKIqNbVAIf0UxsiEMdCOXLYdDWWJ7/1saWIr2O3hg1oZ8
 bQ0dXo7FchD0YcLqkMee5IMcRw06VF5oy8VmI9NNwUQzaobq90zFoZvkc9atrGvxgwrP
 t+pMsgb+WOUhurYKdeitA9bZGSJjt2f8aj0iEaPwsmnKMRg9wtaUezdGmSjSs7zdPGPL
 fdJrXpkzq4ZJf5xK48ZfXuBroIpEHt+hD/rYzVmAcdPCGS2dPjTEGb21RsMKy22sTZUC
 BuPzbhG1SKPr4h97FAgdd2wja2ejXJx8f0nwi6bFl44X9lPXaTtwt3RUx1E9VJ1l2ep8
 IGeA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792005945; x=1792610745; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=582l4UN9d8ZpIIQBKyvfoe2ud1OuHObN9VtOBwz13Bg=;
 b=rdhIPjal3xwf5B/fHe2FJrDB0SOqRCRRMc5x8T/yHgYm6BTikN0bMlOKP/i2RJ+tao
 owsDpw9E7mx3hjheFVVjIF9r22BRTCtr9Pb0qKrvZp7dum/Iu22aR8G3VPhQFf+BvEDK
 MxCuku7JFrXPb71umQk77M4wewsiSgNUhPj3qMAFCKTFz46EmGIwetcfICWkcHoQgHGi
 IMDqtWf/UGi7gXhNpqASxyDLMR08+F00DhJAtDAofsTQbrdQvHlHzFq9MLZCczsA7cgc
 gNrR2QBqwlEdCDHc2cZrtlKt5WEXHaSraUpf+IIqXRl9mwJzRpkbiCrtafze3h1nltmr
 Hvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792005945; x=1792610745;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=582l4UN9d8ZpIIQBKyvfoe2ud1OuHObN9VtOBwz13Bg=;
 b=ZtgYSamIj1m/MDW1NPL31gGdS4AbVzdUNOWNk7Iin8W5CcbA3xyR5eCNuO1dZAtwCr
 dAQ/WsNJIX9OwrHM8ZA7X/crFA0dkMuOWOBPgNGZJJs5ilLGn6ENj+hOfH2Wi/c0NnCE
 1SMsUyA4JGAAFkT8blfRMAUREAzCPitxIPhzUsuU8pFvnv8WpozyLFZcRGrC+UVENgIA
 dcbzcrE0IF7eETszinj5WXa3vkeJrNoF3wdu48Yl+VFIbJqU6hu0jrp/5r2SnqAWxFep
 Uy0S33mdkwI5IART8PdrbSLrgfKMcr2u+NEcId3McL+H6O9WLlynuxsNz1+nNrJg1Zje
 Tmcg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzRHwJtJuu2zuZ469SdFMTmWjXaNvJs7WvgK0ydBaveb/ubU15AG7xyA8FVzWkmPlYkCqHwvUcrbWw=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLTLax2RBBrLl7AmvSwiNPTreWUedu8rBRxpo8Gfb/DdUVcMsN/
 HiWeOP3PG+fE+/+lCtFbvPoKyAEZB8ot7ofTMINcc8TMXJG/6quAX5JsPoyWrn/pbWhkcfLAA60
 yvbKAIdMvUOQmsShU+n8VE3g5+jqrwo0=
X-Gm-Gg: AYBFou153ieUSBxba58wUMHMq/lnngqZTVVuRT2YxhR2NLsvZf5zgwxuPGnscUweQeI
 QZhsokFp2e0HjJLnxlF2TK2rfSUQ72miTM3UodpkP8HkvFD9JKaTbXH4+TRMixOIL9OuHk2VBg6
 BDIQEQQr9+VO7WXJmAIftd9kENV+EzpTKguCO7FvMe2yOQdFNgrP+xePtwE0/3CUPqQkwKKgtAW
 M9vR8JHZpavh0afSeA9tsz4NK4MyP2p6J8S06el2GuD/ys4VTbCoRIx/lVRDnp7aNI183wqfges
 S28zElE6CKnFyGUAQoHiMtPMDONEKqpC+Q/3H8RrEDEN5qwwUOliaxww
X-Received: by 2002:a05:651c:b28:b0:3a9:9b0b:e0e9 with SMTP id
 38308e7fff4ca-3a9c539ad00mr43922551fa.6.1792005945250; Wed, 14 Oct 2026
 12:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20261004212403.208681-1-oss.patchbox@gmail.com>
 <asm4DV84UitLCbve@dell-wzy>
 <CAGG=RgApzG=MeZ9xbpeBzqE0i0Q6RCPXtnyS-30JfEDPDKNN0Q@mail.gmail.com>
 <as4fKufR2O21NWk5@dell-wzy>
In-Reply-To: <as4fKufR2O21NWk5@dell-wzy>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Wed, 14 Oct 2026 15:25:33 -0400
X-Gm-Features: AclHuK8bWEAIT_jes9eLRLNmTdyx38C_iJwbW3y3L5STgV7Y6fOZaRlXyp6RKPU
Message-ID: <CAGG=RgDVsPHjLMTEgoqjh17hfnBUg3WUeca93VrDS7NTshHsOg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/i915/gvt: Don't replace a DMA mapping that is
 still in use
To: Zhenyu Wang <zhenyuw.linux@gmail.com>
Cc: Zhi Wang <zhi.wang.linux@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Xiaolin Zhang <xiaolin.zhang@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, zhiw@nvidia.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 15 Oct 2026 12:15:59 +0000
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

On Tue, 13 Oct 2026 at 08:08, Zhenyu Wang <zhenyuw.linux@gmail.com> wrote:
>
> > You know this code much better than I do, and I can't test it without
> > GVT-g hardware, so I may well be missing something.
>
> I can understand that but I think for any non-trivial change or
> for sensitive part, testing is a must...

Understood. I'll hold this patch until I can test it on GVT-g hardware.

> > The case I had in mind is the guest mapping the same page at both sizes
> > and keeping both, e.g. 2M in the PPGTT of one context and 4K in the GGTT
> > or in another context's PPGTT. If the second request replaces the entry,
> > the first shadow entry seems to keep the old DMA address, as
> > shadow_ppgtt_mm() reuses a PPGTT that is already shadowed. Is that ruled
> > out somewhere? Please let me know if so.
>
> Shadow ppgtt is created by a PV interface, so each context would have
> separate shadow ppgtt or shadow mm. GVT handles guest page's dma
> mapping per-vgpu as for per-VM. But GVT handles context submission in
> order, shadow ppgtt is populated for each submission. I think even in
> your example that possible one page mapped in different context as 4K
> or 2M, it would be remapped as size doesn't match for each submission,
> so no invalide dma address access.
>
> I doubt if i915 could possibly have such case in reality..

It does seem to happen: 7366aeb77cd8 was written after the same gfn was
requested at both 4K and 2M during an OpenCL conformance test.
