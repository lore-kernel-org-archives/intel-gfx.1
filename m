Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92E3CA5FDD
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Oct 2026 20:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA1010F9F6;
	Fri,  2 Oct 2026 20:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="oD8mr75L";
	dkim-atps=neutral
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C555010E6A3
 for <intel-gfx@lists.freedesktop.org>; Fri,  2 Oct 2026 19:59:27 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-cc89e37f17aso103322a12.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 02 Oct 2026 12:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790971167; x=1791575967; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:cc
 :to:date:subject:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=HkouzctOookzlfqAtqEA0B5BQsmtjIgHflnmjsHr5aU=;
 b=oD8mr75L3pWkakqM5rbbhevynPUFCu6GF2ew0MihTKjvdWMDCYiDUpttvGQM/8l7Yi
 P+e7YalraByo6RHc9vjcvbxyj/426+30hr25is9qe9q644ipkueIbmdRYTOYqPJDzudJ
 V+uz0aZjqwwBX0+YCkD5vu8SEHs9WT+XtquR37HyObmB9oE19FLbqhJ3crGNpEPqM+qj
 LDVlwko+seOUD6O0zT5Wq+aI1jgTUwBGEBa7OacVdIhS6oq75AmiRNnjjM4BsJg4SvZd
 6Tg9qu/g7w3l6H6gf2vPS6whT+M2zQzpruWrioDeLcOsVNBKVWijIom9JaMN8+o3cTc6
 5AFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790971167; x=1791575967;
 h=content-transfer-encoding:content-type:mime-version:message-id:cc
 :to:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=HkouzctOookzlfqAtqEA0B5BQsmtjIgHflnmjsHr5aU=;
 b=2hOGVVUW9cVM4fFOwjbJ8GGbIJgJmCtWqa/0HHIi18Yn03NmE4GXMFabnXxziGFRCD
 ei2v0FmjEm9KRtyngblEW7pveewgb572KFqTRuE8J33IEH0TfKX3OKarquX7nr9FSoEU
 zzEIre68p3C1x2q6r9M/eyDDhhP5iql4j7RoilrK9z6/T5zFsYUSw5AU6XFduFJHbXgc
 zS0K5PgE/kadF9TH4VvT7I5qBVB4WRn7/IWy6vzFXrxouJFI8tJI5XHQdAki7rjRBtpe
 6m/Xt6TAMn3MX0DKGddw+XRoR5kJXmOwgX1psxl49V4aaoclGFOOIXHg2ZnNk+vcbruS
 pzcQ==
X-Gm-Message-State: AFq9FYI8YY16bVw7Wk2JkAN6+R8CkyRSDr1CrR6NJoXyMmmoG4ug5lEX
 GmI92uboY0fztPOmnF7SogGYUblJR0eRAehr+IFKzuQTrJPcewqi3yaP
X-Gm-Gg: AYBFou1c36u4U3q1YOs8WsWhvROoBxNfSo706wF8ay2CWaHNV/NKvoKgqeULiD+1HoX
 6B5XU4DbjHh1m70OAgzLSuWHnA1mYtVyKhglo5qc8/wX/gd8RAB2upGB+3eEAHM90NZkHeYT4MI
 8eGD3HpiHmvG41vw1XS10qgwb1M2PJL2/VDzAqR18UnrKqbsvySU8xre1sL5GvMYzYgeBINPda8
 3faguzPqv2LobIuEczk98qrwGAFkCDldEPoVcFucrS43kltIwUb0RPx9zao6enSlAgM1hAsFZFJ
 Nof9867s+ydnUxL6JFP86S+SAD/CZ8aA5sSkbA+0ccdnYELKhc8LWH8hDZJF5b+bC74G+HsY2xT
 oJoNQytnH4mC58gI5j+sMF8BOoqLZT4+pkREEtlUf2qKF3nbMO2BDrmQxYGQquSpzMowMO17k+M
 6GIjTXRMg/KlQnVcUNZw+WIcB1zihDqLzrLaNf4pdfCF44BMVQmZnt1QcfmNIQdReEQt+ORqM9u
 AIXtBhxs6waLHaPjlWQf8w=
X-Received: by 2002:a17:90b:1806:b0:3a4:8c41:fab6 with SMTP id
 98e67ed59e1d1-3a78750a564mr215960a91.46.1790971167133; 
 Fri, 02 Oct 2026 12:59:27 -0700 (PDT)
Received: from SANGHOON. ([1.220.132.212]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a6c8421fe4sm5419796a91.12.2026.10.02.12.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 12:59:26 -0700 (PDT)
From: Sang-Hoon Choi <csh0052@gmail.com>
Subject: [PATCH] drm/i915: release context ID when context creation fails
Date: Fri, 02 Oct 2026 19:47:40 +0000
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gfx@lists.freedesktop.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Changyul Lee <lcy8047@gmail.com>
Message-ID: <20261003.final010.56cd81b38781b9d9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 02 Oct 2026 20:45:17 +0000
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

On graphics version 13 and later, xa_alloc() reserves a context ID before
i915_gem_create_context() is called. If context creation fails, the
reserved entry is left in context_xa, making the ID unavailable to later
context allocations on the same DRM file.

Release the unused XArray reservation on the failure path.

Fixes: ca06f9363836 ("drm/i915: Finalize contexts in GEM_CONTEXT_CREATE on version 13+")
Reported-by: Changyul Lee <lcy8047@gmail.com>
Assisted-by: LLM
Signed-off-by: Sang-Hoon Choi <csh0052@gmail.com>
---
Compile-tested the affected object with x86_64 allmodconfig
and W=1 (GCC 13.3.0). Base: mainline 3b7cab693ba2bab63774bf5b988e8a61b2ef0f32.
No hardware testing or runtime failure reproduction was performed.

 drivers/gpu/drm/i915/gem/i915_gem_context.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index c58ffa5a8fa6..4eb715c2da1c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -2421,6 +2421,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 		ctx = i915_gem_create_context(i915, ext_data.pc);
 		if (IS_ERR(ctx)) {
 			ret = PTR_ERR(ctx);
+			xa_release(&ext_data.fpriv->context_xa, id);
 			goto err_pc;
 		}
 
