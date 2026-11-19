Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7755C606A332
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ps74hRW7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8829D10E898;
	Thu, 19 Nov 2026 14:58:40 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEA310E18D
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 14:58:34 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-7a6e560f580so1546579137.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 06:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795100313; x=1795705113; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EWHuzKl1811WwogAgInHScJvEiU4Uc8gIvC7P2ok2bQ=;
 b=ps74hRW76SrsNjZTUTQrIiabLd9kPv2j2R+dXhR0YJa5XKdJAxMUnasXj5lv9sIA4t
 8Y2rKGTZAJyDErT99ErxWwHUPdwb/va7KLeIde3fW+kkkfQD4yxnim0jDuqQWHAELcme
 tJhwOyRQeWRYSm+M0SlHKmNb03onu/rwB5Hb5UtLVqzJQnHYjIT3HnVBa+XWVeyfavGH
 I+5UJsNbFX7V8wu5HzS8RQSJe6bB317bqDXzIO8i97PnK493nznny7TYzrBfROBz/PAp
 X2wFzKrg6Y9Rge0U1Y7Cm/0bPpAv+Xtl4pWHYL6ENT1E/K0d1x3l0Lhy6rrjo8rI3LLP
 b22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795100313; x=1795705113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EWHuzKl1811WwogAgInHScJvEiU4Uc8gIvC7P2ok2bQ=;
 b=t9pCheh5PqT7l3xAVxeH1umA+HFh4PVBhlfqVUFDu84XIjwX1Cu+WogeEQzqsiY435
 gGFdrdr5W5rnYwg9WmANIlBlip0gqRD8PGqtvC6E8faEataXtpfBBTPrfGSD7fo111D/
 9w2vynkyj2ryax5iCMV+aQR2Fc06ZSJtyr/GFJGje3m95yln1pob1ZoZ7zu/6i3n1Avn
 FSbmY7FOQUoRJu90H1RlL1qlPTmf773lHNZjtK6fRDWLXXZ7mt2szBzngFo9eiEnNS79
 DsNOw+m4ziBly9rRkZ5CbXAzZrObPvxMztIxz/uHptugSpKKWL9y9QjwK1FQ7KeQO7bW
 ScpA==
X-Gm-Message-State: APuU4Z/QAeSNylfN1gMacPm/oXRU9f23o6r8WvZzU+md4SwApWIG0GpQ
 FSzGXVxNxhBDLpywCFeKO6zW5WaiDCNF7R2Gm923FE5BU4UH2MNl4cSYTybbuL52
X-Gm-Gg: AYBFou36OQDP1bZtzMYQHHVbHlP10CmnX+NSX7Jg1706WZ83T/vLw16Tr0AwytuDY1z
 VXOu2/wVM0MKOL+re9nWqtgJIBch+E9FsIKB2aFs77MKmtXvgOBaFUTLZSiAbelgHoYdGQGXnpU
 5OWkzNwmVP1EAG2aoID3KsS8Cl9zLSYrefGrc3eTJznLdPuyjbJAwJOlTItwugmrO6S01Mz2/R9
 mapK6TMmDw0dbStjzEK23umEYZ/GzyABrLmdE1ZNqR7vVnnof8q2whSsqv+2hYmxWaRkKHKNMee
 DJF8MV7v0gbLeLh9hIiPXeHJtllJ/DvoOMvSpaKeYMkOI9Y+sTIPo2AnXozMMq3CC5fy7HPBFdW
 18ASH2NwAPm7o8zap5gRrVgT72o3fIa7EJF3CppGNMa6wVZR9jbMxx/6e5N21DfdnCxgWiCyA4G
 BXmb4tvRKpAVO3X1iLOlpVeYPpL69/PhZQ2k2WzU4jD5U9XHQcampnMAZ5XWm61799LzEJvND3W
 Fbx8omjQcTUSq1NLkxgVEwil8EqDE3YoBdGHVV3S1qOcaqTK/pVBCZtL6QEDLvDWAC25bXALVEo
 bz8BaNQacHV88FftIrHE1ycdq2Lgte702Ss2xuPEzpqqrg==
X-Received: by 2002:a05:6102:290b:b0:7d2:c786:5a98 with SMTP id
 ada2fe7eead31-7d6ba3c0849mr2575312137.8.1795100313101; 
 Thu, 19 Nov 2026 06:58:33 -0800 (PST)
Received: from f90457aaaf9e ([186.153.252.80])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-7d6e7f3d7bcsm6083137.4.2026.11.19.06.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 06:58:32 -0800 (PST)
From: Javier MV <javiermv@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: Javier MV <javiermv@duck.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, matthew.brost@intel.com,
 daniele.ceraolospurio@intel.com, umesh.nerlige.ramappa@intel.com
Subject: [PATCH v4 1/2] drm/i915/guc: Complete all requests of a
 non-schedulable context
Date: Thu, 19 Nov 2026 14:56:54 +0000
Message-ID: <20261119145709.6735-2-javiermv@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20261119145709.6735-1-javiermv@gmail.com>
References: <20261119145709.6735-1-javiermv@gmail.com>
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

Complete every request on the list once the context is off the HW, with
the same test as guc_context_revoke(). Otherwise leave them to the
schedule disable done handler, which cancels the whole list in order.

Found with the help of Claude Code.

Fixes: ae8ac10dfd2a ("drm/i915/guc: Implement banned contexts for GuC submission")
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15301
Signed-off-by: Javier MV <javiermv@duck.com>
---
v4:
- Same off-HW test as guc_context_revoke(), and no else branch:
  completing rq alone was out of order, and a pending enable left by a
  reset kept the earlier requests from completing (Sashiko).

v3:
- Shorter commit message and comment (Rodrigo).

v2:
- Complete rq on its own only when the loop doesn't run, under the
  lock. v1 completed it again after the unlock, when the loop had
  already completed it and it could have been retired and freed
  (Sashiko).

 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 788e59cdfac9..111cd4c89ad3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -709,7 +709,19 @@ static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	 * request resubmitted after the context was banned.
 	 */
 	if (unlikely(!intel_context_is_schedulable(ce))) {
-		i915_request_put(i915_request_mark_eio(rq));
+		struct i915_request *pos;
+
+		/*
+		 * rq and the requests merged before it are on
+		 * ce->guc_state.requests. If the context is off the HW, complete
+		 * them all here; otherwise the schedule disable done handler will.
+		 */
+		spin_lock(&ce->guc_state.lock);
+		if (!context_enabled(ce) && !context_pending_disable(ce))
+			list_for_each_entry(pos, &ce->guc_state.requests, sched.link)
+				i915_request_put(i915_request_mark_eio(pos));
+		spin_unlock(&ce->guc_state.lock);
+
 		intel_engine_signal_breadcrumbs(ce->engine);
 		return 0;
 	}
-- 
2.51.1

