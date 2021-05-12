Return-Path: <SRS0=b0kO=KH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BBCC433ED
	for <intel-gfx@archiver.kernel.org>; Wed, 12 May 2021 10:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A399561205
	for <intel-gfx@archiver.kernel.org>; Wed, 12 May 2021 10:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A399561205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F299E6E03D;
	Wed, 12 May 2021 10:06:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FAC6E03D
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 May 2021 10:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620813987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=81sVBEIcin+fR8adKR/jAKl76VnJLIMjbgCMr2BrWHo=;
 b=Pp0rK3CAGYcX+x9QTFFIqljf8m0ffSo0ORSpvK53UJQhtnd4omLeaUNEqvAIrC1dcZ5Ey6
 sD/cZl9Z8rlo0j6byouT/fEz2be6tPQuoL8oYtUOogVr3RSsCEm791CwUoeA8/DQp2gXkf
 mhV/ZVzwQcMWSOS3rhGR7MW7zAroiaw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-Dowm1bfJOQWtVUDo90aJIQ-1; Wed, 12 May 2021 06:06:25 -0400
X-MC-Unique: Dowm1bfJOQWtVUDo90aJIQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 g17-20020aa7dd910000b029038843570b67so12561132edv.9
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 May 2021 03:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=81sVBEIcin+fR8adKR/jAKl76VnJLIMjbgCMr2BrWHo=;
 b=rxzjpxtQYwz/QMaBXywr6aKgnIyU3b9D+fyntJw0fwfFvn1SNc3sC86GbPOcSNw7ta
 uYbXiq6fpFjmK1IVTX6ymm+xt2zEJbZ9qgvTTxVhW+QiPm+R7yuUaQKoSZFZQxcuoLbm
 ChGnjzwUoE3E55QmMcB93LfORNw1J9GZjJpQAwrB2X7PtkhrhYLcrd0z7SH4vkbRsj22
 wghD5HWIfSEOcI+inC36DCTHTDYIeK4Uc5yFgPOH4sPO132rkR6VFJOtzD/sSPEUYqi/
 UwxVwNPrXDyN+Z/YDOrbRhDjJBfefG3gDLpUHkS6EX1hlT1IdcM+ul1QFU2jB3ibNOfI
 OXZQ==
X-Gm-Message-State: AOAM530R7K6myuIzwTyoE+kz0HTL7glZdEYeciIUqNsWTlsLBaqNqiLx
 Tvmwvru77XGVRVuYRbmiaMcMjGKJyy8WgQWLzmsamW1Ph1dPk87cQtAc7V1aIRkPhKrXuI57xkm
 rHJZ6lNkDjmxP8/tjGwZJk3BPXgz25/nmOPnh2GZ8Z4HnJLrX+m974s89cpKVLeYYRG6c7Ok1q3
 6Lrtgk
X-Received: by 2002:a05:6402:1b1e:: with SMTP id
 by30mr7372613edb.277.1620813984070; 
 Wed, 12 May 2021 03:06:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAWAri+MIdvtybR02bopVDxkMAFzgTUDZskOUjWbWMz0VYOYYnCrZL0tuE8MQX8TScDj4lIA==
X-Received: by 2002:a05:6402:1b1e:: with SMTP id
 by30mr7372594edb.277.1620813983881; 
 Wed, 12 May 2021 03:06:23 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id i8sm17337145edu.64.2021.05.12.03.06.23
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 03:06:23 -0700 (PDT)
From: Hans de Goede <hdegoede@redhat.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Message-ID: <3e2e12f6-a5bd-858f-7454-fce19f70cf30@redhat.com>
Date: Wed, 12 May 2021 12:06:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Subject: [Intel-gfx] i915 clear-residuals BYT + IVB rendering issue +
 possible fix
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi All,

We (Fedora) received a bug-report about rendering issues
on BYT and IVB caused by the i915 clear-residuals work
which landed in 5.10.y :

The Fedora bug:
https://bugzilla.redhat.com/show_bug.cgi?id=1959581

Points to these i915 bugs:
https://gitlab.freedesktop.org/drm/intel/-/issues/3071
https://gitlab.freedesktop.org/drm/intel/-/issues/3081#note_890606

With the second link containing a possible fix which looks promising
if someone can take a look at this, then that would be great:

diff --git a/drivers/gpu/drm/i915/gt/gen7_renderclear.c b/drivers/gpu/drm/i915/gt/gen7_renderclear.c
index de575fdb0..054a0f5b8 100644
--- a/drivers/gpu/drm/i915/gt/gen7_renderclear.c
+++ b/drivers/gpu/drm/i915/gt/gen7_renderclear.c
@@ -397,7 +397,7 @@ static void emit_batch(struct i915_vma * const vma,
        gen7_emit_pipeline_invalidate(&cmds);
        batch_add(&cmds, MI_LOAD_REGISTER_IMM(2));
        batch_add(&cmds, i915_mmio_reg_offset(CACHE_MODE_0_GEN7));
-       batch_add(&cmds, 0xffff0000);
+       batch_add(&cmds, 0xfffb0000);
        batch_add(&cmds, i915_mmio_reg_offset(CACHE_MODE_1));
        batch_add(&cmds, 0xffff0000 | PIXEL_SUBSPAN_COLLECT_OPT_DISABLE);
        gen7_emit_pipeline_invalidate(&cmds);

Note the:
https://gitlab.freedesktop.org/drm/intel/-/issues/3081#note_890606

Link contains details about the what and why of this change.

Regards,

Hans

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
