Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C792606A31C
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KWplOgqy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE9910EFBE;
	Mon, 16 Nov 2026 12:04:07 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CFA10EFBF
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 12:04:01 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-67db23d8892so1245597d50.2
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 04:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794830640; x=1795435440; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LtZGJrxT/VcU9YNu1R73dtw2Tnv9qm++pXhCioLps3s=;
 b=KWplOgqyKuSKzToOsYRxfUBWmaU5En0obbtsokR5iDMWe+vqApfioryeCDxoH5bk/A
 GDI1L3RcQpl3TE4da34xgJBhgxZB1aj1mUtbT0TBj1DKt9+lXUCYslVOJMo3glVoghYH
 RMsyQ86nqQIWt7JXLOkPEKwwCIb8Bl5/pf4WctyAw26UwrdKg1cnuA2zA5tEy86NrQCf
 ahT6DlSds8L3JbLYKZNxnMWhLCYo03pqApLMC6UG8fd02LDd7X7adq6sSUqLUT8YhcCx
 y5ewux67cRp6zW1HpLSOWMNcUVHNpT9v1j5gon8zYfvgwgidMBYsFn8A2F+n8u/f02Nw
 Wpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794830640; x=1795435440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LtZGJrxT/VcU9YNu1R73dtw2Tnv9qm++pXhCioLps3s=;
 b=n5aYKggV8Oth483ryMwV/OIiROoDJt2zW54m1goWPVVEXH0sW0EDVw8UirClSn/4wu
 NiCW6dVqOy/j6fYr34sF0DTqiDsBdemxXNFbWsVFQowaYr93GfMQTfkRqWWnK+h6vKNc
 wXppZjGNbgj2NtJjKSfJLXAUwucREF5rVtceTHGWjoNkCtJWuBzHVBuiPsW7GHaJvDt2
 dx5VCyl4lXJLGLQLpo6fLnBa8xZID5Jyk+CYg3u/f3YMfOVoG0zTIyJ+uwxIVzfzpxkw
 SwtQsRHXvj/lfufdHnGxbtJh/brYAPAhDb306qYTndLI0hh8vnVZFWYcaLfWjsOLPTwH
 afYQ==
X-Gm-Message-State: APuU4Z8uhc7wPeA37ptmmf7Zn+pbDzxKSQPxJKIjKrscHIer8jM4lqe2
 vet0dK97v9hTDsLt6oN/32+aL0Wtwdbd48Kh3pTsCU5xZMeRMI4RB5wmfCvqAVr3
X-Gm-Gg: AZFdTZezaITAQj++i6EKvdB7afD9fDqrcup/RmOlXPAK09WKYX0kjMTR91YsxVe3wrs
 pSVOLvR+C1TaCc0XI21p5XrAcR40vq1k5k/W7YXolbnb0bssGTS9bffcgigKAOsJSIiUeFf847T
 TNJN/3m/D4GdKOKa2oXQ4mvsxaC8x2aEBWDagup5K9hbpz3YK7EoMjCS9/Cr/JiQxe+M+X8Kvxf
 X1pfaRg+/E1itKUORysRnoH/diV77jBrFheMx1FLdPZFyqtg1zewWsLZTbXTSKozlDUL8JjIF12
 tB6lMp/Z+HeopvwkanUJ07YmOlEM7nGGwvaLm0u+G42LHs+C1Bfyu43RWibYmM7IT9amlJI6Sye
 wB/AMlAXiuRAw3kExE9BJSfEWpu+d2J9s1YPUjZiID85OaeL7PhSIuZXL5KwpRT8QkVU2b6cPLj
 TguUYuekYPquLHHaOKvU3fNLwUa3WfSwmwnaKeKVON9s16Md7Sm/caSrxwKQLUFz7BdIMzJhD2/
 OmXgWI6K1Rh70g36uh4FZVEIDcgZV8XteRxJAteCpMWiKyevTKbm3d9KhqPV/LCtnVjIbQwYtGZ
 inIS63SfNvaKBvafhef3fxYzhjV9qGoqb6wmHYMHzIb4qlbbcSXsf8CvUxGb
X-Received: by 2002:a05:690e:130e:b0:67d:be3c:958f with SMTP id
 956f58d0204a3-67dbe3c99e0mr917462d50.51.1794830640077; 
 Mon, 16 Nov 2026 04:04:00 -0800 (PST)
Received: from f90457aaaf9e ([186.153.252.80])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b4aa99f7a1sm83572997b3.29.2026.11.16.04.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 04:03:59 -0800 (PST)
From: Javier MV <javiermv@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: Javier MV <javiermv@duck.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, matthew.brost@intel.com,
 daniele.ceraolospurio@intel.com, umesh.nerlige.ramappa@intel.com
Subject: [PATCH v3 2/2] drm/i915/guc: Don't unblock a non-schedulable context
Date: Mon, 16 Nov 2026 11:59:48 +0000
Message-ID: <20261116115958.9499-3-javiermv@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20261116115958.9499-1-javiermv@gmail.com>
References: <20261116115958.9499-1-javiermv@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Javier MV <javiermv@duck.com>

If a context is banned or revoked while guc_context_cancel_request() has
it blocked, guc_context_revoke() finds the block's schedule disable
pending and leaves the cancellation to its done handler, which clears
SCHED_STATE_BANNED. guc_context_unblock() then enables scheduling again.
GuC resets the context at the first preemption (1 ms timeout), the
second reset is ignored, and on ADL-P this ended in a full GT reset.

Also check intel_context_is_schedulable(), which stays false.

Found with the help of Claude Code.

Fixes: 9888beaaf118 ("drm/i915/guc: Don't enable scheduling on a banned context, guc_id invalid, not registered")
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15301
Signed-off-by: Javier MV <javiermv@duck.com>
---
v3:
- Shorter commit message and comment (Rodrigo).

v2:
- Check !intel_context_is_schedulable() instead of
  intel_context_is_banned(): revoke takes the same path for exiting
  contexts (Sashiko).

 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 229fa0fd3714..8a3a39da4963 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3183,7 +3183,9 @@ static bool context_cant_unblock(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 
+	/* The sched disable done handler clears SCHED_STATE_BANNED */
 	return (ce->guc_state.sched_state & SCHED_STATE_NO_UNBLOCK) ||
+		!intel_context_is_schedulable(ce) ||
 		context_guc_id_invalid(ce) ||
 		!ctx_id_mapped(ce_to_guc(ce), ce->guc_id.id) ||
 		!intel_context_is_pinned(ce);
-- 
2.51.1

