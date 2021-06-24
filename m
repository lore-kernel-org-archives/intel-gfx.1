Return-Path: <SRS0=foSz=LS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8847C49EA6
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 03:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A928E613BE
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 03:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A928E613BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A006E9DE;
	Thu, 24 Jun 2021 03:59:26 +0000 (UTC)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD466E9DC
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Jun 2021 03:59:24 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so2653054pjn.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Jun 2021 20:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y2W7T6qLTS3Ag7NuAuUIEAg67sPyiesCNMUj+p56BzY=;
 b=g8nSjjfxIBXk4iRyM4lDbfJzcUO123uZjh0RON0fXQwb8kyWdvJ99YtzcNsJdcW79w
 BLdPz3Bosh+WypVWcDrteNvejBUGZqV7Gjr/9gfUWwY5ZNBNimDbH5JiJYT2XnLubHCB
 FZKukRJWUrijD93ZogN/F8+SkBe8RkjXiOk2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y2W7T6qLTS3Ag7NuAuUIEAg67sPyiesCNMUj+p56BzY=;
 b=mZ8DY+Fn3BMiwJ8ykYXVe8GzcJd3njumdGVxvMuou9fqtD/41yBBrFTIyWWvjFbcWB
 YjIGtz0gNjb9YVvU0Mr9dU1eQKsP3+R59iypEWNkiXj+AOZh+hYf8xsGb2ZBq0+dKSsx
 6P0moEm2nZXvDFXmf7n+sz1HcsLqkyXiOmnLI06SXQpSs05PkV9a0E3V3TlxO9HfEbQp
 +LBoidMkABNzdSOdkzTZnQkjl7Gr45pZx5ToHqWw5CvOE5S0/+Hk3fvqmuSZww5U8HCb
 7O5DuW7X0A8U/vcteMsscXnTMN87D+89Pq7ecrNoO/r6E5mxJxlH32Osg+FGpBKAKpYS
 qwEA==
X-Gm-Message-State: AOAM5322LnJtOtvx4JB0OW/YJb3Wn9ZwO0EIpDnYh8rueKWsA76WOrb3
 3PlwvgntyMSFWpu76FIxT1kdGg==
X-Google-Smtp-Source: ABdhPJwqCB154PR6k9RDOGQgmS7bfDVXTfHVxk5gZuq7k0BJad439o4c4+nm6Z45Q9WJ95xxqXqGDA==
X-Received: by 2002:a17:902:b188:b029:11b:1549:da31 with SMTP id
 s8-20020a170902b188b029011b1549da31mr2405367plr.7.1624507164071; 
 Wed, 23 Jun 2021 20:59:24 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:5038:6344:7f10:3690])
 by smtp.gmail.com with UTF8SMTPSA id f205sm1163119pfa.154.2021.06.23.20.59.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 20:59:23 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Date: Thu, 24 Jun 2021 12:57:44 +0900
Message-Id: <20210624035749.4054934-2-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210624035749.4054934-1-stevensd@google.com>
References: <20210624035749.4054934-1-stevensd@google.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/6] KVM: x86/mmu: release audited pfns
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
Cc: intel-gvt-dev@lists.freedesktop.org, Wanpeng Li <wanpengli@tencent.com>,
 kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-mips@vger.kernel.org,
 David Stevens <stevensd@chromium.org>, James Morse <james.morse@arm.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: David Stevens <stevensd@chromium.org>

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 arch/x86/kvm/mmu/mmu_audit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu_audit.c b/arch/x86/kvm/mmu/mmu_audit.c
index cedc17b2f60e..97ff184084b4 100644
--- a/arch/x86/kvm/mmu/mmu_audit.c
+++ b/arch/x86/kvm/mmu/mmu_audit.c
@@ -121,6 +121,8 @@ static void audit_mappings(struct kvm_vcpu *vcpu, u64 *sptep, int level)
 		audit_printk(vcpu->kvm, "levels %d pfn %llx hpa %llx "
 			     "ent %llxn", vcpu->arch.mmu->root_level, pfn,
 			     hpa, *sptep);
+
+	kvm_release_pfn_clean(pfn);
 }
 
 static void inspect_spte_has_rmap(struct kvm *kvm, u64 *sptep)
-- 
2.32.0.93.g670b81a890-goog

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
