Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3598606D80E
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2026 14:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zK4rzB9r
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370AD10E41F;
	Thu,  5 Nov 2026 14:06:19 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AC710EE2E
 for <intel-gfx@lists.freedesktop.org>; Thu,  5 Nov 2026 06:04:36 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-3b0b8b5d28cso55852a91.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 04 Nov 2026 22:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793858676; x=1794463476; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6JrtG29F6YmjX1if1HVP+LUFJxu86N0pKm/C06N0tvM=;
 b=zK4rzB9rhp3IEjcbtq2kbv2sJVRSB8SEIjdxmxQsq5Br34vzFSCEF9KYzbkHGmFeEk
 71jRVKjNt/KMKEpM+DY/0JDFz7L9jiQ+PtWW/q7CFF12o7wWVP3ANpp2djnZoW0m/GKr
 w0oCcCpsx0Ajx4vutYSeQjOyGMM4vCWLMcVd6/p0AJGVBDG4OQChSR6dzVz/Da5JsOcE
 eRcRT3nn37Il1UVuZmluOyRe2ygGTcFCMDk3ZX90lPYaG/ix2PmlDr9kF6RUSe714rI8
 b05PEdDXXnkz5wOw8Di2MEadUtj3fIxkzvBhiVDqVovhBqK+JRkPdtLQXTvK+Xvw0eow
 Osyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793858676; x=1794463476;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6JrtG29F6YmjX1if1HVP+LUFJxu86N0pKm/C06N0tvM=;
 b=1fYd/lAL/YmCt3H48FvXG7w4RSPSldWTi3rH2YOAzZ0landiuLE8fpYtKeH1v45soB
 PihTGEjtH6wXvPo+ntr6fPHgesoood4yMtVkEpNszwL0M5TKmwHNC+pIQGkgkGQ3RPmn
 mpmr0EBCTOkouOHdhefI5rfRybzjJf/h7wBTPU7S1KxCjcbp0mnz5BHhM0L+wXm916RH
 T9P7AbI5pXyGh15oSJmmvy+nU7x2iqt0tqmSKT2787MJ3UGw+Z/QVkXtJqrMfdvIs5jk
 jUJSWo/wZXSKxlPMa2Do2lbLPiNJtjh9oaixe2OieQ5sOIsYAKU+ZVI7MbW9740vJvZL
 D1Tg==
X-Gm-Message-State: APuU4Z9sJtikmq2ZhYMZe9s3hBF8D67yBIKH6iteSneYh2w/IvdBQUdb
 wKe2I8jIw1+01Edid/YthbbWzeXloaNWvpGIPlMaY683zKhTkDAUKER0d6r5jNuY
X-Gm-Gg: AYBFou1tapkNVwqBsORG47IPUhE4K1tuJ9SjmtutDgim9FaTNNTSQhW3BBcJkw+v72q
 U2QsDRQrFtaYYSQ7LWSmaMCl34peCbRarNIjQd+dUxJEc8ZQeexQOE4bI81miEpAdD8ZQFWJWmd
 FJGz8JzZA53MI9ko56u3fzloMSQmbZbwOQehdePCnCaXYU18MgKPL5hIzriQtfLjki38QsIcpxm
 Hw1qJkHljGur9MU1Q5PSBScmtcC5ykV6+367dMllUYcwUUrfCjqOM5XasXYoJGxvceCDsmuge8x
 XSxzChaKSyUD7OhDUASrr2ULoJzWa5cnMnWDc0IX8WMiHWhzkOhAPz+SnSVNmKBcCWVVzvbq14u
 eZOVA4mwyNc+MAUEUowdQjGHzDK9rELYlszDvaPgV8JsueJg6cIFHg8f9vhKKG4vWgZeXliKm7o
 jVUQOBuddeYc2+uvvinRwN1IbmkZ3W7TSdTP07XxhDWHOFW7R3pu4yfmXLmXmsyQx2PONDJnFeI
 RjC7HcVr3hUl6mmVt2PNLtJHPnBbyMYJ+rw3Qxt7TWF/PgwBsfVeL1LjlL7jslr8PKpebSpATe/
 k/OUFbpurvRbk0Bn54Nq37hQAVBnCg0nhNhtO9rQyA==
X-Received: by 2002:a17:90b:28c7:b0:3a7:fef3:8561 with SMTP id
 98e67ed59e1d1-3ae89822b55mr26092371a91.5.1793858675639; 
 Wed, 04 Nov 2026 22:04:35 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b0b313c0dcsm2093100a91.1.2026.11.04.22.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 22:04:35 -0800 (PST)
From: Chengyu Liu <lui2012qwq@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, stable@vger.kernel.org,
 Chengyu Liu <lui2012qwq@gmail.com>
Subject: [PATCH v2 0/2] i915: two teardown fixes (gen6 ppgtt ERR_PTR,
 OA config sysfs leak)
Date: Thu,  5 Nov 2026 14:04:20 +0800
Message-Id: <20261105060422.51848-1-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 Nov 2026 14:06:18 +0000
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

1/2: gen6_ppgtt_create() stored the result of gen6_alloc_top_pd()
     directly into ppgtt->base.pd; on failure the ERR_PTR stayed in the
     field and the async release worker crashed dereferencing it in
     gen6_ppgtt_free_pd().  v2 follows the local-variable pattern
     suggested by Ville: assign to the field only after validation, so
     it can only ever be NULL or a valid pointer, and
     gen6_ppgtt_free_pd() now bails out on a NULL pd.

2/2: i915_perf_add_config_ioctl() creates the dynamic sysfs entry
     before idr_alloc(); if idr_alloc() fails the error path frees the
     config without removing the sysfs entry, leaving attributes that
     point into freed memory (UAF read via the embedded show()
     callback).  Remove the group on that path, mirroring the remove
     ioctl's ordering.  Unchanged since v1.

Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
---
v2:
  - 1/2: don't assign the error pointer into ppgtt->base.pd at all
  - 2/2: unchanged

v1: https://lore.kernel.org/r/20261104073311.1617823-1-lui2012qwq@gmail.com

Chengyu Liu (2):
  i915/gt: don't store ERR_PTR into ppgtt->base.pd on allocation failure
  i915/perf: remove sysfs entry if idr_alloc() fails in add_config

 drivers/gpu/drm/i915/gt/gen6_ppgtt.c | 11 ++++++++---
 drivers/gpu/drm/i915/i915_perf.c     |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.25.1
