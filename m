Return-Path: <SRS0=AA48=MI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FC2C636CB
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Jul 2021 19:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CD1B613EB
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Jul 2021 19:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CD1B613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B335A6E9CC;
	Fri, 16 Jul 2021 19:20:17 +0000 (UTC)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5D86E9CC;
 Fri, 16 Jul 2021 19:20:16 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id r125so9774339qkf.1;
 Fri, 16 Jul 2021 12:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dkhs2tEFMJ6j7r6WGC72CuW7H3CxJIWmCvSObfjCTVc=;
 b=sB9f9B1LtPhRNWsAKbvmzwdNhmoJdULJgvvLL9x8IJV2PuZbb0qkhzEIvWcGRfOZ2b
 9KF6KVGk+aWfOvQ/X87RdDwF37Dv5nkHm0K8dtqdep4MuyBBFITOQpC5XTb5MM4rcGsE
 oHWpuPn8wEQ9FYATmbm7DSwvq3CNh66O4M4ULXPADbLV2cqYaeIYy0oiENxL4Kr7fhGY
 7THMb2VtzPv+w1r8LfpkM6C2/Ibd2RFpHNPlnMP6ZZv2qeyyIWxAGVnJC+UIA5rYuOWO
 4G4edz1D7eiYNrPMFoXLGKlK8gYul/XcnYhZw+U+NXp+GHC4M3RqMsUjpaEANtlhFYzx
 ElwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dkhs2tEFMJ6j7r6WGC72CuW7H3CxJIWmCvSObfjCTVc=;
 b=QcHRVreCQQIJv6QG+Dk2czqzXeuB1L9EZWb0By2ZGMgwVUWK55ZMgGBPGzkW7WjckQ
 uPEoWNqi8E1hCn2dS2/Oh9MRSwIJ/lDsIxoZV/IW3iuO62AgrAUTwnL8Qg1s/8wnuY8i
 rRUCrwFjwiQa6vI/q3Ix0JbBOWy1qk21+oUvX2qXsB1mBKrOyghNp9hOH1JC6kqbhNkh
 Q5XFK0Xe+cgHmiKwD8WsCGu0Rv95O06XFa6NRlTbKSEwTnJKSPBDGBgbc8oFUI3+jLCl
 y33jkJM2BcofsrWFjMUU4A/VgZq/gEQMKasOhK/fCZCj5SJSpe6CRvIlsTQEQIatjeP/
 oryA==
X-Gm-Message-State: AOAM53276Im3YWNDzyXHyCckqd0q/Ua9N3LyebO5sbr1SWaluhuSImB6
 FD3FHdhr6MysHaCgMtbYZ53zzH4zke80o/j+jJUyOqZNSmE=
X-Google-Smtp-Source: ABdhPJz6XuRvwVsBKFYo+gtv8r6cA0VDA127p/rzFKGM6BVV/RZ1DV+JV21vw9Slbu/GVFVGhxV/inw4fp8zvOkL1w4=
X-Received: by 2002:a37:5d5:: with SMTP id 204mr11449888qkf.17.1626463215923; 
 Fri, 16 Jul 2021 12:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210716141426.1904528-1-jason@jlekstrand.net>
 <20210716141426.1904528-4-jason@jlekstrand.net>
In-Reply-To: <20210716141426.1904528-4-jason@jlekstrand.net>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 16 Jul 2021 20:19:50 +0100
Message-ID: <CAM0jSHObDORrPX58c-Cn2axnze3=4hnnpSoFrbE78J7KMC_v_w@mail.gmail.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915/gem: Call
 i915_gem_flush_free_objects() in i915_gem_dumb_create()
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, 16 Jul 2021 at 15:14, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> This doesn't really fix anything serious since the chances of a client
> creating and destroying a mass of dumb BOs is pretty low.  However, it
> is called by the other two create IOCTLs to garbage collect old objects.
> Call it here too for consistency.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
