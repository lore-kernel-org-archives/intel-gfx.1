Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D588D606A323
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 12:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggVF+zgt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B1710EFAF;
	Mon, 16 Nov 2026 12:03:04 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C02E10EFB2
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 12:02:57 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-8b4bc216e9dso10264207b3.3
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 04:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794830576; x=1795435376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EtXXp+gERr+VQooeT8RtlOTQCTUXPoOb6izAMQjVcRM=;
 b=ggVF+zgt1KZH9VRE/6dtovWfakmmyWitYef03S9j7HTuiU1zyRfh8J/ds1Oy6aetat
 p2m3TYYKtRljXjbSB1/JADO01yjRM6vdY5+elxKuF5zZWFaYygSi9St2B3sxNBU/SznQ
 XwFc8V1wyitdM1RgbaO7Cd6w9hzrvBbhRIfcmY57oWVv0S5yy6cM5E5nKU+jfdWCtlrc
 29fLhXE4ljJhVX1UJtopqtyFLzRnRmci323jPxAiHEt8rBNLkYF8AQnE5LJDJsidlidQ
 IR5wCiz2sr/ba8AgSPGEqO1luqBhYLNX8uZHvcQ+bRUgAIXQXFcpRGoBxLktH9eQ02Sh
 1LpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794830576; x=1795435376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EtXXp+gERr+VQooeT8RtlOTQCTUXPoOb6izAMQjVcRM=;
 b=KTTfHtW7MvN/FOtaFeqYHXIYl1vlVbYGRmPp8/Fdx1xJ9+TDs5u33SrolLNt/6MmkZ
 ksUKtx4SKHVAnqC3T0Ml+I09Eu3W+hr17x7h5yWx48CTv6MXFmlOlJGKRDzm197GblfD
 OeXc2rIhCqS/luW9TKsjdaqH8lNc1GYzPeliu64WVJYBRmEXl2rPo+L+QsQyjjQ/PDV3
 u4vXM36zKUc4BkH2/hKgcL7osR8UddHKp+WNV44XFVkm2TQJ39CIoCCaLfs9iP8c+HhV
 1/rRa1k/WZfbYhr14kLn21GmhZ4F1aVX4fr53UXH7UelIkdVavMN60mkiDhC9ok6lPo4
 bPjg==
X-Gm-Message-State: APuU4Z9P2tAchFuvI8DqI7fDQ1RLoyrqZGD9vlL01DBIsYXZzHecOg/k
 UMkFEOmMSTpTbgbLly4s9Uc8T1yyW2YTVsF9g4v668jiD/b1SCOWa7N2f0293rNn
X-Gm-Gg: AZFdTZcyeps6EZ+p3rRT3K7OjzUXGqMBO3OiZdJSEqjoYQZJFAU1XkdAt+girx7rDrg
 C5u9J1JaTGKlCHStMLYeRvmmxhN2I42UdnhvuclF0FO/1nMj/Lyo0b94ndb/rqQlSGk9HDVCBsJ
 sccPskNFExGV/S0yzeUvablSUsTwGiOZi3S8gCCaGpQ0I3vCkPo/lsc8ffMb0xsEy7a2Y/VMFTo
 Njbf+pkl5x0ryxEWFWVP4jXytu6x2use1cGikOGxJPnLuhXWVqqIdBL4RsBQH0GMamc3e3mk8DG
 1BOgMA7ozbBBYOlXhwUB9YOHSVa1leEVlDQGIA2C6iKZEIQjzDcIY5WUNtjTqFRe3XMaA7JIQnP
 KDrE68YMwIBNceP7/L4v7wfdm/XTVRZ4clvlOGqUoYMqxSGZYTnRuq2bykt/8afaNDqc62UoB8K
 NE39euXF1h4729SwRKAE+fuE1w1/kDTlAKniFDUpRSalXJP4dzqUgsBNkTFqJq+OZbsYBm/3mCQ
 KnDgKMFJQZ5hFoV8sLp0FXtwDqE0B5nmkP/HOU/xfFphg6+9gU7oERsa9lujFNDjJaHFall+oCQ
 +CsXJAylad+JPL3m1XKgSnfZyZkpBAud/QlTnTCbADoYFrr87NmUdYURbHbh
X-Received: by 2002:a05:690c:e3ed:b0:8b0:a30a:7f05 with SMTP id
 00721157ae682-8b4aa35069bmr51507437b3.84.1794830576464; 
 Mon, 16 Nov 2026 04:02:56 -0800 (PST)
Received: from f90457aaaf9e ([186.153.252.80])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b4aa99f7a1sm83572997b3.29.2026.11.16.04.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 04:02:26 -0800 (PST)
From: Javier MV <javiermv@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: Javier MV <javiermv@duck.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, matthew.brost@intel.com,
 daniele.ceraolospurio@intel.com, umesh.nerlige.ramappa@intel.com
Subject: [PATCH v3 1/2] drm/i915/guc: Complete all requests of a
 non-schedulable context
Date: Mon, 16 Nov 2026 11:59:47 +0000
Message-ID: <20261116115958.9499-2-javiermv@gmail.com>
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

guc_dequeue_one_context() merges the queued requests of a context and
passes only the last one to __guc_add_request(), which marks only that
one complete when the context is banned or exiting. The earlier ones
are on ce->guc_state.requests and need the context to run to signal
their breadcrumbs. After a full GT reset the context is unregistered and
never runs again, so they never complete and their objects stay pinned.
Seen on ADL-P after a GuC context reset of a Vulkan compute job: the
client waited on its fences forever, and 7.5 GB stayed pinned after it
was killed.

Complete every request on the list once the context is off the HW, as
guc_cancel_context_requests() does.

Found with the help of Claude Code.

Fixes: ae8ac10dfd2a ("drm/i915/guc: Implement banned contexts for GuC submission")
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15301
Signed-off-by: Javier MV <javiermv@duck.com>
---
v3:
- Shorter commit message and comment (Rodrigo).

v2:
- Complete rq on its own only when the loop doesn't run, under the
  lock. v1 completed it again after the unlock, when the loop had
  already completed it and it could have been retired and freed
  (Sashiko).

 .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 788e59cdfac9..229fa0fd3714 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -709,7 +709,22 @@ static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	 * request resubmitted after the context was banned.
 	 */
 	if (unlikely(!intel_context_is_schedulable(ce))) {
-		i915_request_put(i915_request_mark_eio(rq));
+		struct i915_request *pos;
+
+		/*
+		 * Only the last merged request is passed in. Once the context
+		 * is off the HW, complete all of them (rq included).
+		 */
+		spin_lock(&ce->guc_state.lock);
+		if (!context_enabled(ce) && !context_pending_enable(ce) &&
+		    !context_pending_disable(ce)) {
+			list_for_each_entry(pos, &ce->guc_state.requests, sched.link)
+				i915_request_put(i915_request_mark_eio(pos));
+		} else {
+			i915_request_put(i915_request_mark_eio(rq));
+		}
+		spin_unlock(&ce->guc_state.lock);
+
 		intel_engine_signal_breadcrumbs(ce->engine);
 		return 0;
 	}
-- 
2.51.1

