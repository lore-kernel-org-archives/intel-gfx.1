Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54114606A31B
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2026 15:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kya7srvA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D928F10E2AC;
	Wed,  4 Nov 2026 15:03:08 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com
 [74.125.82.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F84610E850
 for <intel-gfx@lists.freedesktop.org>; Wed,  4 Nov 2026 07:33:21 +0000 (UTC)
Received: by mail-dy1-f178.google.com with SMTP id
 5a478bee46e88-3550dd02c9cso37770eec.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 03 Nov 2026 23:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793777601; x=1794382401; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6RXhW7yttS8+T6Ujo6Pp8C/77aQWUYKl7npzE/fKr5c=;
 b=Kya7srvASO5sxRWf2fLswEYCdTiDJR79FjhDXMobgSJgMys+Ty0t05mak46S+cyj2u
 qavV3lMry86Ih9UArIyGuqXlq7r+z5tmysJSayCodSsut1qXuahyXLVId0Qp17sbbgDI
 61aWaR8BE/v+gTn87X8Xoy2qZUW5mfF0Fs1SH8I9JSF2nZqnCWKj6LhZRE16v3zf/AKW
 xrcInQ4P4CHuAIZZ17V1QRTWKLyq6t2Zg/Gq7UJIVW3mAgkZIVzoptzbCAbesPNMpv1G
 TnKmWk5pwGjLl68V0GagVz9CP5s95+eNY6YNFkZ8ox09fpvorpCfxmSKmnvMxpNpaEDu
 7ieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793777601; x=1794382401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6RXhW7yttS8+T6Ujo6Pp8C/77aQWUYKl7npzE/fKr5c=;
 b=ALvHg5KecqhDvoTf8cr6gjw5ucdYqUmctAOw3tN/wxHIJBnMD07PljP+1zl4DnzzuM
 pcOiyhOWSV+JLIlxwH3cxEcnhi7bGukmjG8Y7y+dp+ly4jphSCRM7ZJw0lf149KWmmx8
 wbwGkMLN2ATRj6jeQk7iMJzWEyxeA9EidtXS0mBE7rAfAtUO41rmJQwgT+ftcXEtQzw/
 0QUzDNk104BkPDrmbwYWO0e45z5B1vVS8SArkkfuklWRm7tfQqqtlSRU01JY7MlFz1tv
 FV4pXwn1VbRxr6NbQd7bGTdtEDbyVDEG+CRYJdC/LrtzwO4JX7vJrRbUr4hWeHm6b4Kp
 /odA==
X-Gm-Message-State: APuU4Z/uy3rfQg7bS4UD13i77ibGq98NStjUmYPyuO1PRtG6X3rXYnOY
 R2jMPKpIGExJT7KbWVApa3fGYnM2DHjFSRmpVDi1goWAkeqbkRRYAdtvuvCB4OilDNA=
X-Gm-Gg: AYBFou1DnoFe1XWvkyKyfx00UpW8JsTu5wEI4FtU/YyUgOrmJvfhcgfZqoU0571r+Ie
 khsPx4Q3NI7KPFrngKGxbIBEoM8o/lTdYQg4wMpgnI3IbRLxLYGq5AmgqxRxY/x+fHmrSKkBMzR
 XdwA/yVCwNMRrFr86JdTAbI2zMKTxzt/SOssmyFT4nBt8cJ8t7klzMppMa+R6dCOQ9nOFi6sg2G
 7ZqFXBRtZcPuefET+f0G66SkKMUaDI5UDYFc7VWWTHfB0hpJzsYXDeu1GMLBToxCiruCMVF13yB
 qO4IXGgwpKGZ7lliWoqtaZ23mB7zQ1fegg5m+AY1XurZpFJxth+CjBVckduRI+S/WqAIrEO/+Kp
 FDnRnv4ammNbMgU2gxyVfdzfvTwaeM1ZqEbnZ8TOtBPSmZFslvbSaoL5FKJzKSOfURbhX9P8rgz
 cDOrye1OnGHnLgn2droTv925XJ5m+MnnWQIZz1w24YhlTuktrBBj8VF2u40Ls8E++q+n33qLZ03
 b254Miw9BzX0V7hnz7IPide0IePW+3pfe9RJVZpIpbQVW8RtRLrHLcu/ILi7LUL9D8b7ODLiSDy
 EVIqhiX99VQcXEJqQqvNWVaSPe+uDD7urhknLfaBUA==
X-Received: by 2002:a05:7300:e9d7:10b0:36a:1452:8da9 with SMTP id
 5a478bee46e88-36a4231f759mr39423242eec.1.1793777600535; 
 Tue, 03 Nov 2026 23:33:20 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d3754sm6295359eec.14.2026.11.03.23.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 23:33:20 -0800 (PST)
From: Chengyu Liu <lui2012qwq@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, Chengyu Liu <lui2012qwq@gmail.com>
Subject: [PATCH 0/2] i915: two teardown fixes (gen6 ppgtt ERR_PTR,
 OA config sysfs leak)
Date: Wed,  4 Nov 2026 15:33:09 +0800
Message-Id: <20261104073311.1617823-1-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Nov 2026 15:03:08 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two independent small fixes found by static analysis:

1/2: gen6_ppgtt_create() stores an ERR_PTR in ppgtt->base.pd when
     gen6_alloc_top_pd() fails; the teardown path
     (gen6_ppgtt_cleanup -> gen6_ppgtt_free_pd) dereferences it and
     crashes in the async release worker.  Guard both teardown sites
     with IS_ERR_OR_NULL() so an allocation failure under memory
     pressure stays a plain -ENOMEM.

2/2: i915_perf_add_config_ioctl() creates the dynamic sysfs entry
     before idr_alloc(); if idr_alloc() fails the error path frees the
     config without removing the sysfs entry, leaving attributes that
     point into freed memory (UAF read via the embedded show()
     callback).  Remove the group on that path, mirroring the remove
     ioctl's ordering.

Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
---

Chengyu Liu (2):
  i915/gt: tolerate ERR_PTR pd in gen6_ppgtt teardown
  i915/perf: remove sysfs entry if idr_alloc() fails in add_config

 drivers/gpu/drm/i915/gt/gen6_ppgtt.c | 5 ++++-
 drivers/gpu/drm/i915/i915_perf.c     | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.25.1
