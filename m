Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44351CCA463
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Oct 2026 03:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD6C10E248;
	Fri, 16 Oct 2026 03:02:29 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BFE10E248
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Oct 2026 03:02:24 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-cd3310348d2so300012a12.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 15 Oct 2026 20:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792119744; x=1792724544; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WGUCMs28DpPSn+ppcL59RwrFtWtuthKTRyw8zNLj4Wg=;
 b=W6Tgvm9/qBG6BUZFpu+Oo1nWyJzyKAYP1CPBjwWDyUS1aCHfmkbbPBMcCtMGwsqK3C
 g9rlvGwS8uA1LuFS8Lv1MP2aS8oc4oiaxMMclEWCvAs5Q86TDnfMG50nHX9zexoQzaWG
 VzoP08vJZCSsCY21T3XXIk8ORUEIOclMLxjr5eOJDg3xlkgl4dH3evv8Fk8VXpF5uCY+
 VCHAwzF6VIAtUff/oMD5B/ozsth/IwYZMyYurRUcbhk3CrniZLWTp0sP6wO/sNMGccqi
 DI3l3mDVlxvhYqKR8WoiZQB+AAoF2Ss6pn1OScIl4j04L+Qck6uc7VjJ8kEqyMsxN54l
 enfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792119744; x=1792724544;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WGUCMs28DpPSn+ppcL59RwrFtWtuthKTRyw8zNLj4Wg=;
 b=TzqKD2+MkPpO+5NVp8mjODjuIzOUspld2TJLtP26/DR8R3e9XbGk2aCFyAqzcxEIdP
 mD5sHu9OQncNEOWmf/q0xty3out9ILuacEdLlKz6szYmb0lO7y9PUv+kQHLeVgsObBeH
 BAq62Bsk5St2psjImcy2buJENRynBu7SNz/P3qs5xzN6VSz3+VsbCDA/ptTB/UEKyJ/v
 6+i+uQmrr3fV7nVm9PhNmnEs2Vrgd5qYHGhv6aKoi6lAnakAJnmErppAxWOPm5xaVjHj
 Un4mfHv53LSH8nuzOrrs+LxQqLLMk59ROHUdTsbYYVnYIaE0OylC9492pm84XzAupBSM
 gGag==
X-Forwarded-Encrypted: i=1;
 AKwUvBwtNAH6OqrzHoTWjnlqQlcmG1aOQWI0RFQT9uxr1d/2puAVAn8qr07CqYAVtlkGlegVd5efU5kGoAs=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKZFYHSp2LlQM9cvg9nldUEylrA4Zkw3UGiEXDFdiZmKXrGbyBh
 gOPBhBMLtMD09Q8J0SXFBEuH7zvOs/hsqZV8ta23Jl5X8w2WjkWRV7uz
X-Gm-Gg: AYBFou36TeGyRmUSCq8GGirb4Qn0JRCoIws7XAKEXoYDMpJNMSkMJszw9ZNdcS0Phl3
 +vyA3Bpe2CVbAvGbS40SvGmXQccvtrrvAJH3FkVBr8bPMB/XI6NrVZr/Y9dIgpmV8KJ4EQ/8kav
 OPVz8RkHm5f5wzMFWeYIpsFa4uMOJ1xJrpYGeSIKT3E/i8zHeTq+H2OzLR2gTrRdL/VrLxpyt1k
 dNiZd83AQpn5oqeG3nA97krvKdCTXou2qD3kQinVrKhsvTeYfFmKaRbdlQ2bvS2BavGbSb+1iDz
 aaDoowAhXGGoXhwE6CREfUjka+AckhEOr0KElMuFpTtzyFIo6rGNcQwp2/TZ8Bewvu6fOiIuLKy
 0SqUzZ+zuUg1i+MZxJUIpmNCL0YI2JPWvEvazaSckPe2atXfmBxPkhgRNs26hmgqwcHhwWUuHUX
 TX1AMNb1WDcQaX9+s2Mzp4qJgdjiuO/Fj3m8lAILn0Nt8KG769NKH799Vt/03W1RZN3mTW+1RUh
 b7QNInz35h7wJp0AJxyoIRlv5bCSYOunQBjGmVOw/tX
X-Received: by 2002:a17:90b:4e8f:b0:3ac:9ad9:6afe with SMTP id
 98e67ed59e1d1-3acbb8d5b8amr1095002a91.39.1792119743425; 
 Thu, 15 Oct 2026 20:02:23 -0700 (PDT)
Received: from localhost (softbank126159121187.bbtec.net. [126.159.121.187])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3acc43a1e1esm1937126a91.1.2026.10.15.20.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 20:02:22 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:02:20 +0900
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
Message-ID: <atGTvA2zocXGWmbp@dell-wzy>
References: <20261004212403.208681-1-oss.patchbox@gmail.com>
 <asm4DV84UitLCbve@dell-wzy>
 <CAGG=RgApzG=MeZ9xbpeBzqE0i0Q6RCPXtnyS-30JfEDPDKNN0Q@mail.gmail.com>
 <as4fKufR2O21NWk5@dell-wzy>
 <CAGG=RgDVsPHjLMTEgoqjh17hfnBUg3WUeca93VrDS7NTshHsOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGG=RgDVsPHjLMTEgoqjh17hfnBUg3WUeca93VrDS7NTshHsOg@mail.gmail.com>
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

On Wed, Oct 14, 2026 at 03:25:33PM -0400, Yuho Choi wrote:
> On Tue, 13 Oct 2026 at 08:08, Zhenyu Wang <zhenyuw.linux@gmail.com> wrote:
> >
> > > You know this code much better than I do, and I can't test it without
> > > GVT-g hardware, so I may well be missing something.
> >
> > I can understand that but I think for any non-trivial change or
> > for sensitive part, testing is a must...
> 
> Understood. I'll hold this patch until I can test it on GVT-g hardware.
> 
> > > The case I had in mind is the guest mapping the same page at both sizes
> > > and keeping both, e.g. 2M in the PPGTT of one context and 4K in the GGTT
> > > or in another context's PPGTT. If the second request replaces the entry,
> > > the first shadow entry seems to keep the old DMA address, as
> > > shadow_ppgtt_mm() reuses a PPGTT that is already shadowed. Is that ruled
> > > out somewhere? Please let me know if so.
> >
> > Shadow ppgtt is created by a PV interface, so each context would have
> > separate shadow ppgtt or shadow mm. GVT handles guest page's dma
> > mapping per-vgpu as for per-VM. But GVT handles context submission in
> > order, shadow ppgtt is populated for each submission. I think even in
> > your example that possible one page mapped in different context as 4K
> > or 2M, it would be remapped as size doesn't match for each submission,
> > so no invalide dma address access.
> >
> > I doubt if i915 could possibly have such case in reality..
> 
> It does seem to happen: 7366aeb77cd8 was written after the same gfn was
> requested at both 4K and 2M during an OpenCL conformance test.

ok..so that was actually a fix to remap guest page when populate
shadow ppgtt, it's a little hacky but as for gvt procedure, it works.
Your change might also work but have a penalty to an extra 2M split
with extra dma mapping effort..
