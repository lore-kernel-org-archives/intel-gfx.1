Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2B7CA9EC5
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2026 14:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC26B10F16F;
	Mon, 12 Oct 2026 14:37:58 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5FA10E124
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Oct 2026 04:01:45 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3a1e9f55e03so15436721fa.1
 for <intel-gfx@lists.freedesktop.org>; Sun, 11 Oct 2026 21:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791777703; cv=none;
 d=google.com; s=arc-20260327;
 b=sHximDiWV7M/b2vMdWzYy129RcQVQK8r4H1KNkVHDTvGrkng5W6NRf+vU9FFI4JHvp
 p2LYn7ndoLA8L+d9spj8aou++M5pFR2/M3Jxe/ydlJYFAiphIB/uw9ff/DvwC72wn5M1
 jC7nNy/2wD1Y7Kw4m+XkrHQHH9gQ1eHQgTwMPTyHfGpTyUyX0O3jAxG9rc04KlU6kswx
 s4PrA8Wz9Ob494RMYQzwzBOhxS9HVolkueTSq1D22acS7LK808fg2mbhBQHqjp2oGB9p
 A2Hu/sh+Ur2y5cEI38JHMlsPmyyKKFCLBMfFfOzhzVtap/whvLPw7NW9IDSrkEq9HsHY
 13bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Pe/a+GuYYDIVdvs2+OYKQN4TuAur+dcC/ty/ULPvGLo=;
 fh=4zS/InDLfuSkx1t1exkFmyDotz0kdpzI/bBXX304MOQ=;
 b=d4aX5i5cyT5qWyfcTrsIkCBv2LT/G6xlmxT8IXFsbudsgJdcQ1ECXmT7/+GVXoBqd9
 O7jLHT3tCmdCXJ7dG1MpMrvvbEcvW1veFexSZdb4y+ZqyLisAnc90Lr5YETUkiuxvF0c
 r1BX9prgHTXGG/XHVEtSbE0g7zr9V6h/CzD20+aKRfdPAVzz3lk7vtmYYOmP2Pmo93WS
 9PUMtny7hjR2I4sw5ws29k8n13FLv1FDi2/40YRsmVk5zVn8z8AjElip0pJ4qDE10T/7
 +bbLcsO2CnxCpItukU/zRP4CCkJOwIoxDbrU5y1Ehm4w0jNkGHpl39clTvDXTBgQOTN7
 UBUQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791777703; x=1792382503; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Pe/a+GuYYDIVdvs2+OYKQN4TuAur+dcC/ty/ULPvGLo=;
 b=k0r2zJiYv2jOcyghrY9QU0cvt/KneIXZPx/6yECJZco9UzPLWd6iZ8oe1iGqfEvnqQ
 Gh4C4JOS5q4ZgSyxHNU+2i+qaHBKLe+UG2BNCN2qJ/tLg5csv/yznT6xS4r30N8EYRxb
 +6NrfE3KJKcxvsaTbHT2n/H3bYzYoXjhUoseB3/eOMan7B2g5M/GNx25cOlYw+xS+KI9
 bo+ozOgioFLe/AkmwDwfE9NPCoVvwWO5YwscTgmXs0wpKmHDaKBRYQyl5+XlOufGM/+c
 2O0TQH89JoorxgCnZ+PIS1B3LQTQtXUoMW2UAOUvLoqtWpD9gJ4hbBSg2y9sCL/QM3LU
 Tc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791777703; x=1792382503;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Pe/a+GuYYDIVdvs2+OYKQN4TuAur+dcC/ty/ULPvGLo=;
 b=nHRAdyodvYmzMUvcSQWqFFlNKkke6ZPKRparbJV6HI1xrIRK9xOTpECcD84By6Zh+N
 cDxkVJj+4GMXeQrqFkYOnWhENhDNzBULtG2SBa6MawZnT5Ez7mrZJd1OLyfBJETe7N/7
 D8f3Hc4hvHwQGz5QyLtXnDDAGGRvtakzvNAFkFaRsKVWsfLPDAYvDkdvxyENawErZFqk
 pacY5QjswsursiQ+iGJpewxzbh+ECN6quf35rx8/GkCIihbAc1bA977DC8DQ5PMAFTzW
 tviQ4YxR6XGYABKuQ1mgLpNzhjXafVbd/7YvstLLsE7DkpXsfq1sBIj8EE5cODCsLmT+
 Rtfg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwYcWVJSVxtUZOpfdXwpPEKSr+SV88X+05ZnbhiexZIp415hi3b0horZyVqjwpYtojFBUGOB7wjWr8=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYI4NLfMpiNcrxJ5QggQBWcvqHG++FZZ3+RV3iV+BolJLwlXSI8F
 zgYgKbLs00OZlEEFurgmWvGaqorbcky9vuM3X8hMddntovYpd0gem4jt/fsZReZUXJ0J+moj5gQ
 xLTiwC1ujBLYfMQgJJTxBTkQ9iXIg4J0=
X-Gm-Gg: AYBFou1WG6wbjfpGTViGT36HhaHzIh93dvX54wsU/z4PP8gyjXxCuA1OwvzdYYJbuH5
 Axov7eRGFOiopD1+iDUGZAY8MFrLJp21ZNdStZX+/EbWZZRJSAYg/EcUiI794D6s5UPRezYh2uo
 rF0bdgzagX5pyG9dHIpDQxy/+yX+8OMcf7yjuAMkmlo6hyTvjYAfAfm1PttEHiixQOUdeR46vtX
 N0N52BnRYJdCKeiJs2I0NmGPgKRxtaU6vRo6gzRG6Y3e5QjIWrOaynw/uuKHetQ16AC5o1FYH6V
 ZmbvnGaKjwtTgZz+9ncLvY6V6Eagg2Sbeeg0GtgBMxY15LsJGbAyyrpFnw0r53h++Q==
X-Received: by 2002:a2e:bea9:0:b0:3a6:6a12:61e4 with SMTP id
 38308e7fff4ca-3a9c5380907mr22473741fa.19.1791777703249; Sun, 11 Oct 2026
 21:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20261004212403.208681-1-oss.patchbox@gmail.com>
 <asm4DV84UitLCbve@dell-wzy>
In-Reply-To: <asm4DV84UitLCbve@dell-wzy>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Mon, 12 Oct 2026 00:01:31 -0400
X-Gm-Features: AclHuK8Nc-yI1UOeFL3cp2dh7P_n3SkiObRIXOBg2zlQtbRku8sMwkQ2lyVopD4
Message-ID: <CAGG=RgApzG=MeZ9xbpeBzqE0i0Q6RCPXtnyS-30JfEDPDKNN0Q@mail.gmail.com>
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
X-Mailman-Approved-At: Mon, 12 Oct 2026 14:37:50 +0000
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

Thanks for the review!

On Fri, 9 Oct 2026 at 23:59, Zhenyu Wang <zhenyuw.linux@gmail.com> wrote:
>
> I don't think this is *real*, as code would simply destroy entry in
> that case, and there won't be on-the-fly dma operation on that, as
> guest mem setup is totally before execlist submission, if guest driver
> changed mapping by ignoring gvt emulated execlist status, that's just bad...

You know this code much better than I do, and I can't test it without
GVT-g hardware, so I may well be missing something.

The case I had in mind is the guest mapping the same page at both sizes
and keeping both, e.g. 2M in the PPGTT of one context and 4K in the GGTT
or in another context's PPGTT. If the second request replaces the entry,
the first shadow entry seems to keep the old DMA address, as
shadow_ppgtt_mm() reuses a PPGTT that is already shadowed. Is that ruled
out somewhere? Please let me know if so.

> So this change would always force 2M to split into 4K? why?

No, only when a 4K entry for the same gfn is cached at the time of the
2M request. With no entry or a 2M entry nothing changes, and a 4K
request now reuses an existing 2M entry instead of replacing it.
