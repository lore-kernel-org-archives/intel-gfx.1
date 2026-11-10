Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99D3606A31C
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2026 12:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BiqbNTTA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5137710F650;
	Tue, 10 Nov 2026 12:28:47 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8999010F650
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2026 12:28:41 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-8b305d38bafso14529967b3.3
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2026 04:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794313720; x=1794918520; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hzreqdWnmdNiZjoTznQXHYu1dzajnnIIrU5bPZTUbJw=;
 b=BiqbNTTAHGNMzSNuTfNifZVsIa8gEn0Aru28ald+cSVjUAO/rB40yOjhOmdznW/cxn
 bP8wkQAG7smyMlVZcpMU5KnC4IlEkjhTboexB6y0WABWX4qaXscYpq5KjM89nwkRu3WM
 75i2ZRXxw5cJ3r4SD+M4rvYSdC7f91WmYiuPbMilc1A8w24oEhOyJ2wkApOoSRGN7VJn
 rJRMpYwfE2WDeqpugtyPZOqsaBsXQcZV4nlBqXdvL2GxHA22BwNiJpOxn8Ogd4qP5EJu
 Bu0Sq1hZsYvEuVNZv7GISGPiVYBk5g3s0QUQQZgBQStB5fI20unT1drqkTi3jsOGWgVY
 ZUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794313720; x=1794918520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hzreqdWnmdNiZjoTznQXHYu1dzajnnIIrU5bPZTUbJw=;
 b=wwkC1sCHanze0ca6JzPHOoF1i5R8Gu+ikBSO2P/9MWaV/gvtocrk+VDNaiHIRR2jl2
 Po6xOF5OOb1MxRSx4/2yBF1Haj3gzIyC4JXhqz/ocR4LXn0eQtT4smaJMmyaqIzSUe/a
 E62H2DegCehMqGg0Y9bVs4JzYACFdmzEDICzthRy36pB3EhYqlncKxAfvgaRRqK+Y6eJ
 x7fhHQLcC/skF2tluJvByPyOenFEzmxxTNUB3/F+Oj9r681LApgxbPkt7H8SnGisjzMK
 LzDHlUKlo3Cmoe6B41jsZwuBrpZ1xCdoou46LVt1k/QceeW8RXIBZX0eAQwbhpD1EgyV
 BVvw==
X-Gm-Message-State: APuU4Z+Dsz5FgNbNTHYeoqPnM3lHCzf+zUgH0c4aTLO6B6/60uc50frp
 peL2Vl2yDlBL34v89ecFVdW6fzXFdg7mvafN1Cz6ztKmWsU68zI9kwTtXWJE8JJy
X-Gm-Gg: AYBFou17dXRbPMqJax9aPHOMSa11E933yiFHuMqS0BUWt4XULFzyJakX7G9ITljQ5Eq
 AnrAm7jloNDZmnao7F+U5G9Dnr3SgjW/jGFx+2odSJjhIJWTVLG0wGvRhqkqrC1j7dOXlsR+rKh
 Vk+IZfsB+0eSrZYbFyfF/ZDjj9Iz9D7MtfikokbqqxP9AsEdvx2HSM5PN0Qnd5G61ViCHk+plot
 C6eD5mhYkYjHc2iRoJk8gIFKdT/81Ux10vOv1GdYMM2fueQZ731beWlRR2Ouoa1cZpucEKh26Pw
 +xkr6NVVMnbpcEdYb6Q+kb3j9Zl1Wwdm4hkgRhTLffwpkb54JIHgO0/xWRR7ysk+Hs/+C4B0pTT
 JIfEsfIwLYH8jifOPMZlacdRJn3o84F0rWrfy4LJtGwZ6Xom0+U0dvYa+Xo1hnOjOZ0t0wV6ekW
 cm3qN325m+jYeCXKkoTLrhbeTVKlWVk8rA57Cruew8GbcoKnGtDXqxZzI/Mae4HWR1anVr91nyS
 w16gAKaQp2iYnQKZ4rFol8vWywCvbmg62MJLNRakQtg9v9qqQbxPMCjKGxvLQx2yEnryAOvSCa8
 2cyd6vq7bJeLFR2Cxtt3bqnxGQQhBpp4VLcxIkr4fGymBVbzOvChGB+y2Kmv
X-Received: by 2002:a05:690c:399:b0:8b3:2c71:b325 with SMTP id
 00721157ae682-8b39260fb60mr17258867b3.0.1794313720340; 
 Tue, 10 Nov 2026 04:28:40 -0800 (PST)
Received: from f90457aaaf9e ([186.153.252.80])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b393421a3esm17859727b3.32.2026.11.10.04.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 04:28:39 -0800 (PST)
From: Javier MV <javiermv@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: Javier MV <javiermv@duck.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, matthew.brost@intel.com,
 daniele.ceraolospurio@intel.com, umesh.nerlige.ramappa@intel.com
Subject: [PATCH 1/2] drm/i915/guc: Complete all requests of a non-schedulable
 context
Date: Tue, 10 Nov 2026 12:24:47 +0000
Message-ID: <20261110122534.12989-2-javiermv@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20261110122534.12989-1-javiermv@gmail.com>
References: <20261110122534.12989-1-javiermv@gmail.com>
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

When the context of a request being submitted is banned or exiting,
__guc_add_request() marks the request as complete with -EIO instead of
submitting it. But guc_dequeue_one_context() merges all queued requests
of a context and only passes the last one to __guc_add_request(). The
earlier ones were moved to ce->guc_state.requests by
__i915_request_submit(), which only skips their payload: they still
need the GPU to run the context and write their breadcrumbs.

After a full GT reset the banned context is no longer registered with
GuC and is never registered again, so those requests never complete.
Nothing retires them, the buffers they reference stay pinned, and the
client waits on their fences forever.

Seen on ADL-P with a Vulkan compute job (llama.cpp) and a short
request_timeout_ms: a GuC context reset, the ban, the replay moving
10 requests back to the queue, then a full GT reset after a stopped
heartbeat. Afterwards the context was unregistered and the GuC submit
queue was empty, but 9 of its requests never completed: 7.5 GB of
objects stayed pinned after the process was killed.

Complete every request on the context's list, as
guc_cancel_context_requests() does, but only when the context is off
the HW (not enabled, no enable or disable in flight), so a request that
is still executing is never marked complete.

Found and fixed with Claude Code (AI coding assistant); details in the
cover letter.

Fixes: ae8ac10dfd2a ("drm/i915/guc: Implement banned contexts for GuC submission")
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15301
Signed-off-by: Javier MV <javiermv@duck.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 788e59c..555ca8f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -709,6 +709,20 @@ static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	 * request resubmitted after the context was banned.
 	 */
 	if (unlikely(!intel_context_is_schedulable(ce))) {
+		struct i915_request *pos;
+
+		/*
+		 * The dequeue only passes the last of the merged requests, and
+		 * the context won't run again to write the others' breadcrumbs:
+		 * complete them all, once the context is off the HW.
+		 */
+		spin_lock(&ce->guc_state.lock);
+		if (!context_enabled(ce) && !context_pending_enable(ce) &&
+		    !context_pending_disable(ce))
+			list_for_each_entry(pos, &ce->guc_state.requests, sched.link)
+				i915_request_put(i915_request_mark_eio(pos));
+		spin_unlock(&ce->guc_state.lock);
+
 		i915_request_put(i915_request_mark_eio(rq));
 		intel_engine_signal_breadcrumbs(ce->engine);
 		return 0;
-- 
2.51.1

