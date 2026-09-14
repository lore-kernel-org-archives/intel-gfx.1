Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6021BC982D1
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Sep 2026 14:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA8610E929;
	Tue, 15 Sep 2026 14:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZJM+t/54";
	dkim-atps=neutral
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7118410ED4A
 for <intel-gfx@lists.freedesktop.org>; Mon, 14 Sep 2026 10:56:12 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-8692be1cda4so2496015b3a.1
 for <intel-gfx@lists.freedesktop.org>; Mon, 14 Sep 2026 03:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789383372; x=1789988172; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Gj8h2lt98zX4NzJl96Knw548gSSkkGwsjExtVdozT0A=;
 b=ZJM+t/54UkS88PI+ugp+p4grc1x/wunR07RivP38z03zBSEmSug3m4qR0NJWknLB5b
 3O3lc1BIgn5TD3OZwwgjQxS/7+4SEw34LMfF6nFrwxfynbYD2nwYEYUZ3bR7Zvnugddp
 lg7HZfxjqpPOpvw03CjtotuUfcfSDJhel6jUVV8zSUOihSg8OVe1xelGBRyGT/+SM9tx
 1JJ992VX+Ul9fnsGwItivDlvopyaJtBEe0LpxdRt3bncH561IEkwCjRf8KXEmJ3sH5id
 BOD8ACBlulxqsZ7QBiWlg+/RPJogIRyNCbuXZpMBiqgkZUzoZKL7xTUX5lA0OSh2gz4P
 pikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789383372; x=1789988172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Gj8h2lt98zX4NzJl96Knw548gSSkkGwsjExtVdozT0A=;
 b=NU2iwotR1vsRqyMnz+bye4/VyPivl90p3RpBUdy+Ri7MT6TI6JJ/zjIL3HJqgeN1xd
 IaU3u2LO7Mciw5WS02MAncqGhkmCu5/Rub1RgziHR0ChTYbFeSvzH20Zk1vlG73YKuKw
 NnVXmCxWbPP6bF6Cci3a2Hmcnqj2lsZKzFVzVjSmh9XbeRljdxbgexXYCH0G1JVoAAxp
 Ojcd/Zt3qRSxuUY6OojOELn31I2j27uvpAD+NnIzCIVzdvse1LCJQbfeSyvDICPUnclN
 lRjC2TLYLNkmS7g8qOoYJly3xyBwwAt8Q/gCqF8spJ6AjQtGZ249CnIVaZ9MeQAWsUvR
 Vdjw==
X-Forwarded-Encrypted: i=1;
 AKwUvBygJ8M+CyC4m39JnmQ1ol0fzHSHRjJ/ZBGjy5Dran5mQq0Z3FQDAtdZ0ybDq/Uqvj0xQkAbb5QnA6w=@lists.freedesktop.org
X-Gm-Message-State: AFuF++l7r6dh8Flybb54KBTERKPfSG2h8sEkbCzGWCsShPEk4L5fLiwq
 3D6TO1l9E2ZmemFWevlpOusXwS1sc7gERfZjNyL5z14rd9lwSuyY8uG3
X-Gm-Gg: AYBFou2f0oX/pxVuAFFVQyLxyBINAbmHN9Qf4zFvm9V6idKqCs3xycu9Tbi+xOjd0+/
 0L516q+VpQCw2diGapYQvRHFDv4ccRWcDHip0X8LL8iaiVB2HR+bH/P0tKYc5MRE8TY40uA+oYC
 Bke+76a2pxLtw7sbh2uaJO/mGkma33k82ctKXT+5gnCqXFFjoe7QYxGwCUr/IdSiAwfocOUqWIh
 K6s9LpE3jTH6JcQLUtTFtuSBVErt0xtVIOGfEt4ZK7UR1lbaxs8+TKvM6yojCBo4aW1L6csDHcn
 P2OyZOGrCw8KAnF6cBqYcuK1l4NPFadLpn1jSFFYEyaEDMZCVdQcWPj9x17mkHaBU16nWwHjREn
 5ru5w2OH2JFpy/msBLKz+rj8TjhB8gOXiTKiB05aAoxVmujkN0h2l85/rVXevAK8gWbtiCk0x1I
 lfau5xcSRkE41BhEjU1Dw1sOqpqThaZ9qBzhOhqJXiwneGhK32YvV4uf6VdoctgjogN4urA930s
 fFgi8nlJIlAQqJijoK4HYwQ90imjw9yZQ5QuY/aGl6X5jcA6zZISQVQc1xK2Z6JbWTOeOlD7OF1
 QM8eqMKA1S7D+QPDQgQUmeU7oOjBru+A9jOwFIOp3GJISNEMGh132D34EuiNbJA=
X-Received: by 2002:a05:6a00:438d:b0:86a:9be:6bf9 with SMTP id
 d2e1a72fcca58-86f85108442mr4695374b3a.12.1789383371846; 
 Mon, 14 Sep 2026 03:56:11 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-86b287c481asm4589354b3a.11.2026.09.14.03.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 03:56:11 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christian Brauner <brauner@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] drm/i915: unlock shmem folios after skipped writeback
Date: Mon, 14 Sep 2026 18:56:06 +0800
Message-ID: <20260914105606.3997649-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Sep 2026 14:13:14 +0000
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

writeback_iter() returns a locked folio.  The mapped-folio path redirties
the folio without unlocking it, so shrinking can leave the folio locked
indefinitely.

shmem_write_folio() can also return AOP_WRITEPAGE_ACTIVATE with the folio
locked.  Passing that positive control value back to writeback_iter()
triggers its warning, stops asynchronous writeback, and leaves the folio
locked.  This can occur when zswap rejects a folio while memcg zswap
writeback is disabled.

Unlock folios on both paths and consume AOP_WRITEPAGE_ACTIVATE so the
best-effort writeback scan can continue.

Fixes: 776a853a43c9 ("i915: Use writeback_iter()")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index ef9440166295..e7b18f7f9644 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -322,10 +322,16 @@ void __shmem_writeback(size_t size, struct address_space *mapping)
 	 * as normal.
 	 */
 	while ((folio = writeback_iter(mapping, &wbc, folio, &error))) {
-		if (folio_mapped(folio))
+		if (folio_mapped(folio)) {
 			folio_redirty_for_writepage(&wbc, folio);
-		else
+			folio_unlock(folio);
+		} else {
 			error = shmem_write_folio(folio);
+			if (error == AOP_WRITEPAGE_ACTIVATE) {
+				folio_unlock(folio);
+				error = 0;
+			}
+		}
 	}
 }
 

base-commit: cbd3dafc2003db679ccd2f6c6a2551db79657049
-- 
2.55.0

