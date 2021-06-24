Return-Path: <SRS0=foSz=LS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3DBC49EA6
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 15:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92E0C60234
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 15:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92E0C60234
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E166EB30;
	Thu, 24 Jun 2021 15:35:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903D16EB30
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Jun 2021 15:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624548932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f6k4ykVaPXFxqKCeveqsqgjZTsHJh+2Hx0FU9Hu8Shk=;
 b=fEwzt1Ur7YqA7l19kiUugGJRO/H/dvI+1x7GM/mgPG5F4QUtx+W0HI8u0m96/5ozq+RbCi
 3T32lRrJx4rRV1849gEUVzpzd6XTkxIEo+A3krIkt30LVuyZwN1CrpHJ1JLiekYIoTO7Y8
 Rdl2pVPnEFdzKdgoXeuqVj9b84ScU3Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-DtrcSNjaPvynLVokkiVF0A-1; Thu, 24 Jun 2021 11:35:29 -0400
X-MC-Unique: DtrcSNjaPvynLVokkiVF0A-1
Received: by mail-wm1-f71.google.com with SMTP id
 b11-20020a1ce40b0000b02901e5309e25ebso1919849wmh.9
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Jun 2021 08:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f6k4ykVaPXFxqKCeveqsqgjZTsHJh+2Hx0FU9Hu8Shk=;
 b=RPZdJLkkzpb97j1Vctp/e6BqzkREMnMXcTVo0QfJCrsVWIRqMqHSMeZ3NAdqGE72rn
 Z9vfIseFcom+vE4PEyog7jyaNgUK1l/D2DodwheUO02BYFr0e4I7MtHOVWnRcYT5tYBL
 uxcdXBravzrUFqZH4BidiWExClN8mfJCK/DpfHklsbyvgYSjDKEfT7AYTEwfso7P51QK
 xi9khPiqI290P/2kuU1P2twA+S4dQC57zDyGBWDKOTzQanuF0Y+uhoXdspngTzr757TX
 NHrpk31+L2I7ftYh8107BhmRaJ+WFXBax4IKvZoKrgtMvtb7azhqZj9YHutNwOSltraX
 DEGQ==
X-Gm-Message-State: AOAM533HFRcAF8PWdW+IM0cry/x5TY06qbMNP8CCcTXhVfbE8VIF6IAD
 FoydYPj3D/hNoj6MjWfRd/gCym5Mwi+i/4UOU5mQmeR/c8DhB2JxJkj4JUwyI+VQyWZ6GSTc9Af
 kxmwTLiQP/gkpXOWeyKq+XLySbLCA
X-Received: by 2002:a05:6000:1251:: with SMTP id
 j17mr5373885wrx.122.1624548927955; 
 Thu, 24 Jun 2021 08:35:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBnDqu4vf3bAIylFJkD7JiEEmgRW9T3VoP4swdNx5pmdzHboAZtCJNJi7bVPTY8V2i+hs/AQ==
X-Received: by 2002:a05:6000:1251:: with SMTP id
 j17mr5373864wrx.122.1624548927675; 
 Thu, 24 Jun 2021 08:35:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v18sm4013288wrv.24.2021.06.24.08.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 08:35:27 -0700 (PDT)
To: Nicholas Piggin <npiggin@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, David Stevens <stevensd@chromium.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <1624530624.8jff1f4u11.astroid@bobo.none>
 <1624534759.nj0ylor2eh.astroid@bobo.none>
 <0d3a699a-15eb-9f1b-0735-79d14736f38c@redhat.com>
 <1624539354.6zggpdrdbw.astroid@bobo.none>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <81d99029-ec40-19c5-5647-20607d78dab0@redhat.com>
Date: Thu, 24 Jun 2021 17:35:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1624539354.6zggpdrdbw.astroid@bobo.none>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 0/6] KVM: Remove uses of struct page from
 x86 and arm64 MMU
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Stevens <stevensd@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, intel-gfx@lists.freedesktop.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvmarm@lists.cs.columbia.edu,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Morse <james.morse@arm.com>, kvm-ppc@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linux-mips@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 24/06/21 14:57, Nicholas Piggin wrote:
> KVM: Fix page ref underflow for regions with valid but non-refcounted pages

It doesn't really fix the underflow, it disallows mapping them in the 
first place.  Since in principle things can break, I'd rather be 
explicit, so let's go with "KVM: do not allow mapping valid but 
non-reference-counted pages".

> It's possible to create a region which maps valid but non-refcounted
> pages (e.g., tail pages of non-compound higher order allocations). These
> host pages can then be returned by gfn_to_page, gfn_to_pfn, etc., family
> of APIs, which take a reference to the page, which takes it from 0 to 1.
> When the reference is dropped, this will free the page incorrectly.
> 
> Fix this by only taking a reference on the page if it was non-zero,

s/on the page/on valid pages/ (makes clear that invalid pages are fine 
without refcounting).

Thank you *so* much, I'm awful at Linux mm.

Paolo

> which indicates it is participating in normal refcounting (and can be
> released with put_page).
> 
> Signed-off-by: Nicholas Piggin<npiggin@gmail.com>

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
