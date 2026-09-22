Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E54C98302
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2026 15:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8C910E6FD;
	Tue, 22 Sep 2026 15:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y2VUOK2S";
	dkim-atps=neutral
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com
 [74.125.224.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3852110E19E
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Sep 2026 02:55:23 +0000 (UTC)
Received: by mail-yx2-f13.google.com with SMTP id
 956f58d0204a3-66e4ab1ba47so1949670d50.0
 for <intel-gfx@lists.freedesktop.org>; Mon, 21 Sep 2026 19:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790045722; cv=none;
 d=google.com; s=arc-20260327;
 b=H9tT9po39wBGc5jjqq92HXiFMZb+u++oZEjJ0Y+zSi4fFf27Ts2/gPJ0kDQX7kcx/Y
 F6H2o9QSYfo5/ojO5Y9yarzo4WoyDvOnsbe4Ljz2N6etA1erXcJj2EQqzdhvzeiPO/Oj
 9aJ7a8Ji49pVaXp/wZp0bEFZJs3Um8ALfKsJIImOxwrGX6KWKCeMSRuPoCsLieuABe24
 1m/u57ro456fNuFQQIyfZTp+VxP98PdncowJD3CFCQMwAy6sayJgJn1Y1FIFiZd0jrsw
 6G5dMy/JuDO/deQn4Lo8z1LoJVbgZXdhpqOgr5DmCLF2whxoHEwY7SOm2m/2CuYEpHR6
 szdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OTieWtMtlg1zITO+Uxg0UDNibYRqr028lfLfV7Q57S8=;
 fh=HFurT00wTtbKjlDH6gvOEniHigKF0wvcyKGkEHkrp54=;
 b=b38UlbzXkHUfc4ZWzRINL/+jqgj9vEj7cap+vqkTscsaNXuR9/Upsji+D1PFXVFP6z
 NN7UTJQszaflaDamjZPXrme9JdZMOhyf/sY0vxXDYKssoONt21fXtPElsnfBvuToWRM3
 9UuPY9CC60sNfUHwWnYoCFcE3s9nXAwa6BFtUzWzX/3RkSgDMHr2Ic1Y9Ro/eowfWIUx
 K0WG0rrKKZzAUXhouXxCko639q2l0dvX0GPVaXUbwkkYbRqs+Gra7aLmUFcBAkOisJBM
 Ku+w9PWJMPbYOYZ4FgW8QWprGJtEZdBEZWGbkpr0uZqr2HK39Qtyp/hi7eWUZYFjJBtG
 0rcQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790045722; x=1790650522; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=OTieWtMtlg1zITO+Uxg0UDNibYRqr028lfLfV7Q57S8=;
 b=Y2VUOK2Sy3uF7jpF9DZK9z6W1VFJqqi7zExxggBTOdU/Hgo8a9CRa46peV1qYX4MJw
 nWOCWQq5QTzTGN4JKomwKWYfch6JerKfq1eiAhxUVAHSTBLI+W3LNn3vtwAe05mIRQRI
 Ys5mmP4kC3wAN9Z/acgijZYsdJiWOuLVD5t+GbVfmMTA4z72NhaNtdka/o5waFH+K1EQ
 4HhpesH+plKxTV7gns1S9fq7Q4T8aWE7eA0irNESfLJ0ExaC1hH3mivMkyHUSi9wqBIc
 jsPZY/Ifd+0gnS5d9/xTYy7bq5eS+zgdGYjoYGZXiKok2Mi5Smaht9YtzxgQbXYPUVNx
 ot/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790045722; x=1790650522;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=OTieWtMtlg1zITO+Uxg0UDNibYRqr028lfLfV7Q57S8=;
 b=wcKjdKtwBlnC9yluZTU2HURbT9nTaxRCZbzNl2ECelYgJXKevRlEm3nYrylI1diZbT
 GubJEHVOsWD+Ksr5G1ecRYnZvNeSixJjdAHiZvgCyBmqrj+BJYnVnpolPhlxEmh2M5Rk
 hSkZt31MYBOOCY14+UfknCXtniYbWPgplW+QCISpvbxeZCbiSDAZCgGSyuYF4/OayKKz
 HYbPecr2Q3w+Aa0AUgPDhzhTTWTCF5cUNDHYnFJAvCeQQCOYexY+/qC0IwRdjUyOFjZ+
 Uzl9ziCsETbDpfOkQE/k8GRpYapaxgui3NTNlBNZNXZVeEP2KF4jVq6A240Q/vs1pRcg
 pQ9Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByHl9EyEKsGiM3gGBDNUb3nQk0osLZhUAEqePQdiMIM9IyEs4b0gg5SVYFBmUnXvOs1+ayiCi70aCM=@lists.freedesktop.org
X-Gm-Message-State: AFuF++lxegeqTiIFldHFNr9+h8Jcp8BnBlrkRN+tU0VPbzqCBSXh63YY
 iPHg4uxpDkUyjkqXR/ZZLYBKxR4etbtOELXFeUzwXAYeB9COfk/FrOf4+Zoj75oFQ5eN2ptstMJ
 l3a39ZpS+1v7wLCQmN4L4Fns+dwOQv3o=
X-Gm-Gg: AYBFou2R6WAQXg8BNU8Pt/9aim8V77zF6lqKYIg7n9tjzL58lomNeBLQ/Au+HAT9PsL
 aJ+RozeuEZeBJodh5lw2IMH9WQP3VQaF+jssZIKKYglIDvNsos0/JTVmDcCQbYCZkX9UgapUmrh
 8vHbjGf3iLUf1hgUVfABTaLJ1/Rvv6A0QB+Iv7TA648wten3w0G08KKzV+PQ6HCFX2uhdo1UwjX
 y4mXeVWi+Iwm3+PS5/unp65oBTl4E6HeCaoKLPnI9KcSZlDx5ui4leu+tTPhfpaDr2p7qCbkWsY
 v0RlGi3DIE5JmroiuDupLskAxibytCpvfC6YXFcnh1DhqvOfXRuJirTV9g==
X-Received: by 2002:a05:690e:12ce:b0:66f:b0f7:5958 with SMTP id
 956f58d0204a3-672c292b051mr691603d50.6.1790045721971; Mon, 21 Sep 2026
 19:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260919171710.3699710-1-lgs201920130244@gmail.com>
 <arFH__nd1-T-6kft@quoll>
In-Reply-To: <arFH__nd1-T-6kft@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:55:08 +0800
X-Gm-Features: AcwNN1WJzmefJMuoQ8BNwToU4Ldlc5pP17GQHNyphMtayYqHxTXwBfR3oYlyR7c
Message-ID: <CANUHTR9CncY6h_j-ADSrW_+QSPpDpKsqgN2Y_WrFukq4SYpy6w@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: fix mock ring memory leak on context allocation
 failure
To: krzk@kernel.org
Cc: David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, stable@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>,
 linux-kernel@vger.kernel.org, 
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org, 
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 22 Sep 2026 15:03:49 +0000
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

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:06, <krzk@kernel.org> wrote:
>
>
> On Sun, 20 Sep 2026 01:17:10 +0800, Guangshuo Li wrote:
> > mock_context_alloc() creates ce->ring before allocating and pinning the
> > context timeline. mock_ring() initializes the ring reference count and
> > returns the initial reference to the context.
> >
> > If intel_timeline_create() fails, mock_context_alloc() returns without
> > dropping the ring reference. The same leak occurs when
> > mock_timeline_pin() fails after the timeline has been created. Since
> > context allocation did not complete, CONTEXT_ALLOC_BIT is not set and
> > the later context teardown does not release the ring.
> >
> > Drop the initial ring reference with kref_put() on both failure paths.
> > When the reference count reaches zero, intel_ring_free() releases the
> > ring VMA and frees the ring allocation. Clear ce->ring after dropping
> > the reference to avoid retaining a stale pointer.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: 75d0a7f31eec ("drm/i915: Lift timeline into intel_context")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/gt/mock_engine.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
>
>
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.
>
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
>
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.
>
> Please read kernel documentation BEFORE posting more work. It will
> explain you how to identify subsystems, how to organize your work per
> subsystem, how to document usage of LLM and how what you should not
> do if this was posted in a good faith.
>
> Best regards,
> Krzysztof
>
>
>

I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo
