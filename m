Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95E5606A321
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Nov 2026 13:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j3FtCF0T
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0BA10FB59;
	Wed, 11 Nov 2026 13:58:56 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB2610FB59
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Nov 2026 13:58:49 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-8b31261e8a9so24225127b3.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Nov 2026 05:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794405529; x=1795010329; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hMTHinr5xQJpG6gbYhdPPyxfFncCQkCYFPBjPBU6PvQ=;
 b=j3FtCF0TGTS+/bdi3nzWSnfB5nTIYKxjvYG0/+oWCtu5K4RA3iyPpVT1qES2Y9iFOo
 x5+aaSi2Pk72obMUij6ivUhZFziy79LO2p1HM94WC9hBEtXR49cnh4y4GyffcxtwzFW9
 PZ8f6LQz+bmwflHf1XyhCkymUi5X1Yskf0sVgGUqz8ocbKS9qVzCTYWwiStodFF8y4yE
 ZlSXF5RLurUxnB15JJ/sJuSz4soBvvuX+4GJ8n9lIs7H2f0JYDwUkEIHoqr3I+RTt2Us
 NQ+reqSxioQOQ2ze53qjLzI0+j9Pqf+/uAqUT21+F6m0jlL1Tj3PPp6u0lpH8Kpoiaw7
 2Gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794405529; x=1795010329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hMTHinr5xQJpG6gbYhdPPyxfFncCQkCYFPBjPBU6PvQ=;
 b=bPBOVxszzUqMqPBZZ/XxWQWmqUNyMWYJdzpJBtXvrHYa/xUULRO1mm5zUu2p5/1OHG
 W8TZ5+W6ApvEszxohX/TfeNoKzIK9kWzhrj++/keU0zhGVRMPU8L1V4CvISlcCJPKy2I
 lzNkZygY2iITa+MfAJMiXQgGagTCt1QknTh3q2BiUgBANa97XictoUkRH2z2eeKFIKBf
 6d8b3VydB5AYUj10vdYa+dJNX0qoRCVd7T3T5YG4CXtu78dONrl4gXDUqL0S4O94q94k
 oDJCP5MHTJSsFxBgDaIrT+uNKtFzQ69I34VDwCDVnQwpIEx7t4CRKYaJbCbh+5kjLiRY
 1Syw==
X-Gm-Message-State: APuU4Z8X/+LJoq33XtTzDt5cuOYihqYyIfvc59hG0FPi9FAVRI4Cwf5m
 BRpNuoSqxg9rUQOwJnS9HnYvLEPr3DStjq53cgAUTZbe2OCz2LDObrBMQ2kng4j/
X-Gm-Gg: AYBFou2LfvunhwaPuI1KMTjBBL9cLCmDOJF+3U9SxSdnXXWpcxyrGDFe6zJHwUjsf3K
 V9BL2syp1ygo0WXvfqMWawon+lGsxHDKs4LS2bDW97Zd3gPs8fykTWxid0aS349yvhv8J4GYoJ7
 qt04LheaWRRssP4alcKCXoezXrOj8cQqPJZMivcvjYqs3K88+1Ppi/Dpty7DO2PQztefddn7cPA
 bGLMDrZcqcEc9r6QxADZckBYbKemCxx2qQiGqbiGni4OeF9kXavOJcxTsK0PMvkkcM85c+RKtdU
 Ew0pjr8B2A6mOghNtzrI4pCdm0TMBTOYk2UPgngNN3ecSLGsj8tKQkRHeWU0FA0gB1g0GL3uFRz
 WynQZE3PItpVayATf0FMsxbB64FZXqTDtLYCTn06kD4hdNTwutGHq1eOT+fWMzIwZiPrjJqxWXn
 H4B2/q/r9Qh65jdG4lojVPrvHlZB2kTC/WZ3vpSKoo4/qUs9YZikMVtQVFANqE3UznIAurD8OGd
 bqeC+5IROnlzA3+P4n6rCqTf8a61lEXY4AQ0z4up9UmiMfCgZqmWDE4MjUuRuKp4gEDuTbDBwDo
 azBRbtUVSWpB/cVHHYN2V1X7yY6EGEqtusZb2zJOBwwe0KyHlbMBEhlULIPvBQ==
X-Received: by 2002:a05:690c:ec8:b0:8b3:90df:3952 with SMTP id
 00721157ae682-8b3a8051afbmr17868777b3.30.1794405528686; 
 Wed, 11 Nov 2026 05:58:48 -0800 (PST)
Received: from f90457aaaf9e ([186.153.252.80])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b39339efd0sm44619547b3.10.2026.11.11.05.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 05:58:48 -0800 (PST)
From: Javier MV <javiermv@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: Javier MV <javiermv@duck.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, matthew.brost@intel.com,
 daniele.ceraolospurio@intel.com, umesh.nerlige.ramappa@intel.com
Subject: [PATCH v2 1/2] drm/i915/guc: Complete all requests of a
 non-schedulable context
Date: Wed, 11 Nov 2026 13:57:25 +0000
Message-ID: <20261111135753.11071-2-javiermv@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20261111135753.11071-1-javiermv@gmail.com>
References: <20261111135753.11071-1-javiermv@gmail.com>
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
is still executing is never marked complete. The submitted request is
on that list too, so it is completed on its own only when the context
is still on the HW, and nothing touches it after the lock is dropped:
once complete it can be retired and freed.

Found and fixed with Claude Code; details in the cover letter.

Fixes: ae8ac10dfd2a ("drm/i915/guc: Implement banned contexts for GuC submission")
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15301
Signed-off-by: Javier MV <javiermv@duck.com>
---
v2:
- Complete rq on its own only when the loop doesn't run, under the
  lock. v1 completed it again after the unlock, when the loop had
  already completed it and it could have been retired and freed
  (Sashiko).

 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 788e59c..b2ffc6b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -709,7 +709,25 @@ static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	 * request resubmitted after the context was banned.
 	 */
 	if (unlikely(!intel_context_is_schedulable(ce))) {
-		i915_request_put(i915_request_mark_eio(rq));
+		struct i915_request *pos;
+
+		/*
+		 * The dequeue only passes the last of the merged requests, and
+		 * the context won't run again to write the others' breadcrumbs:
+		 * complete them all (rq is on the list too), once the context
+		 * is off the HW. Don't touch rq after the unlock: once complete
+		 * it can be retired and freed.
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

