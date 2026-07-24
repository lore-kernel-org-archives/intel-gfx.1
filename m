Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6C8C531D0
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Jul 2026 13:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B1D10E40F;
	Mon, 27 Jul 2026 13:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jfEYV8j1";
	dkim-atps=neutral
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF4910F320
 for <intel-gfx@lists.freedesktop.org>; Fri, 24 Jul 2026 07:59:25 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-38125cebfdaso157448a91.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 24 Jul 2026 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784879965; x=1785484765; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=60gePLlXQJ2FLj3Sfms6m0pXBaiWjvamSHFgVRwWfTA=;
 b=jfEYV8j1DTeUY0UO2/Fej5UcQN8mQDngcH7+T+S4x5ilxUOQnSUFZogQ5G3y85OwUU
 wP2ZLnryvulbVvT9Lb1GIyZXoVmRBe5KetNwpOkhcJmTdzTwt3mzL5je790eza9SaFok
 5U9NWuyevEBfj0gTIkg8EJOZmKmjJRQzIiF+qIKGXV41Oz/aTnZg0m4kZc+DXZfGBgfj
 5uqxxR5HNcumsOuWl2ZUVnWuzEGBp5YnSki+cYaBcEpG5Di9QmUl+MPKLBrODXh+AHTk
 /RROU5Th9yeaO2DNytvNZLCsOUUi9Q+hwE57tASs8rJJX+bSlE+a6gDly//A8V5fnbX1
 fcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784879965; x=1785484765;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=60gePLlXQJ2FLj3Sfms6m0pXBaiWjvamSHFgVRwWfTA=;
 b=kmymYYzTWLfyh5cZp0y14r11HzirOCi/7KxaIxvBePosm2pD/mHrDZ2G4KnxrigVxs
 gcKau+rcuvPT5gK6e0IZy8epGLtxFNMnxq0E0jYySIUTjYLcoN+CfaQf3A/D8FNIKQ4O
 qfuq43kGOprXmf6+f3ukouy/d36bEllFmqMObSnbOTPHqIWgdsMCPLi41Atl0J8uCLAo
 ic7hY0CBigx1d0Qz5r2Qan30ULgyOJdJ0T0ezcC6PKGQdOmYypaQxRkjaV1t5HcwY9Dh
 IVpVEPeIwe/C8s+8kzORMUweFlU86CuFz9KbdY1PJrq2tjSrIxCuVRkjxfFEe5IBH/nd
 Pnqw==
X-Gm-Message-State: AOJu0Yx7G6QU6yOdgk0Fa7w+mmraZ//8k37etk7dF3pLa+rixzqrkhX3
 6/VDcje2HpU8gcULKSht0uZ6E0G9jjJGixHnUEc2dWZhUKlX/hpUkNR4dqVHMv4Uuo0=
X-Gm-Gg: AR+sD13cKI0SqZjtJba4BAHDb1zY+QN6dXmvJpIp/B2uIBtyaRLG0wuj95ItdiH0wxt
 aIYfi1H+fqJVAgtVSuD4DcYCAyNzYRMhcpe8GCQa1SPCjfeKP1KTv+9cU74SdH06YW4xIft1Fye
 PzDMUSY1E5XClspoPDvd0NIefpXVgUy2+akE8srF8UCKm4sSH1JNi5yjk2sHTIcWu3zlJpbkcRE
 krzvcogySY+vOio6KvTHgFMPPVwbRy5jAo1XjHTBW9j4nrYcIVYKnAXsnRhTlsWVVVuYsh9huDC
 nz1d08CNvhpTgmB+UK2+s6FOwtl/PvEjvVulsXBcZ9ruAuWs1i8JaGHeeJYW7kW9Zi/cJDQXx5L
 EpwNVCsLzlJ/kpNwgAg5FJa6O6MEFmCen1SJWcQAp60hCq13EPuSad7rkzU75nroLAZlqUIadkq
 rO20yR9H5+n6KlV8ep8ljAefbn+mVIHShRRXl98WjABlTzY3CU0tLgHlY3Aipedo9CuCpNAYGDy
 OpSix7n2yKkFJ+CrjhYhdtY509i8gDjwRCYgQm9PGTJzw==
X-Received: by 2002:a17:90b:1f90:b0:38d:f096:a1dc with SMTP id
 98e67ed59e1d1-38ec6575a01mr6454628a91.11.1784879965030; 
 Fri, 24 Jul 2026 00:59:25 -0700 (PDT)
Received: from bass-virtual-machine.. ([114.247.65.140])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f03c20dbdsm1047727a91.13.2026.07.24.00.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2026 00:59:24 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net
Cc: chris@chris-wilson.co.uk, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH] drm/i915: Use acquire when checking software fence completion
Date: Fri, 24 Jul 2026 15:59:19 +0800
Message-Id: <20260724075919.2262539-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 27 Jul 2026 13:38:03 +0000
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

__i915_sw_fence_wake_up_all() publishes completion with
atomic_set_release(). Pair it with atomic_read_acquire() in
i915_sw_fence_done().

Without acquire ordering, a waiter can observe the completed state while
still reading stale data written before completion, such as fence->error.
This can prevent errors from completed dependencies from being propagated.

i915_sw_fence_signaled() also accepts the state before the completion
callback finishes, and its callers do not consume completion data. It does
not need acquire ordering.

Fixes: e68a139f6bf3 ("drm/i915: Add a sw fence for collecting up dma fences")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
Found by auditing atomic operations used for synchronization.
A similar fix can be found in 6df8e84aa6b5.
---
 drivers/gpu/drm/i915/i915_sw_fence.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drivers/gpu/drm/i915/i915_sw_fence.h
index f752bfc7c6e1..16563c66c984 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.h
+++ b/drivers/gpu/drm/i915/i915_sw_fence.h
@@ -105,7 +105,7 @@ static inline bool i915_sw_fence_signaled(const struct i915_sw_fence *fence)
 
 static inline bool i915_sw_fence_done(const struct i915_sw_fence *fence)
 {
-	return atomic_read(&fence->pending) < 0;
+	return atomic_read_acquire(&fence->pending) < 0;
 }
 
 static inline void i915_sw_fence_wait(struct i915_sw_fence *fence)
-- 
2.34.1

