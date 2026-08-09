Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BA6C5B56C
	for <intel-gfx@archiver.kernel.org>; Mon, 10 Aug 2026 13:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6964010E854;
	Mon, 10 Aug 2026 13:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gFrLQ3za";
	dkim-atps=neutral
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEAB10E18E
 for <intel-gfx@lists.freedesktop.org>; Sun,  9 Aug 2026 17:37:22 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-8ff5d1b0f91so6497726d6.2
 for <intel-gfx@lists.freedesktop.org>; Sun, 09 Aug 2026 10:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786297041; x=1786901841; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UDwhP+SNEQonzNCu80xIUxXIG/Qn0ez/r1xaxvU+zXo=;
 b=gFrLQ3zat/iG+pVuctZQtmJ3b76mAoipqXDfwH1IO939mAvZb9I6mZD8OIPNiQaZlN
 DLF7cXE2BzNvFr8RgedYdpZ/B0ytG0GDDFgLKWdHleI6NkjaFekKF8ivCTtW8DY/WJpK
 3qHOic9M2QBavcS1maqvSO9AMzQtHicWJoykavP4fU9ViduesuWEucloZR3CjTvzNKBY
 5/Drc4b1CRVqxTck9iqREwIS/agoJymkerGU/R54gKbngbRTY/6Hs54rlgzyn+a/nyez
 AWh83gS/JHt0imC3YS3g1OB5tjudNEXQ8Pd0qqY2cvIK3GZw4VL1iJjb6idif3VXR7uu
 KEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786297041; x=1786901841;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UDwhP+SNEQonzNCu80xIUxXIG/Qn0ez/r1xaxvU+zXo=;
 b=MIGwu8D10uHCxM4mSmpdp6Vh3gxLtssa+dbs2sC+eQVfVz9a11crxB4DYat3pP70dT
 XRmjw0KCbzseWVP6puec8I3ONvW5v8hn8+GRxOGDgA86JpNU/oAKLbujG9t/SXpFkh9+
 vl7ggM/0jZM+BbbcFYR77gijxpISHx0YcoeTOBn84x1L7PtPsBQtqye05E5fYJiGsLii
 mO8jbmK8jJQ/+U+Y+ASDqqHswnMkI/31cQ4uI/LveY++znncGyWF7jkXWxx+PTEVlnRO
 N+36stzafBZmxXTvAyyYN0Amj4b1UFKWhp+ALxy8P09dcflJ3OvotKrwURJ/fNV7YeSM
 +LLw==
X-Gm-Message-State: AOJu0YzlG7PGF3aGQrvB57MJVo01mb01QqTkM11AccTuKYokVH9nv8uW
 UbRzDotlGMfLK/CSrQZANYD9WdDIepBsym2P9K/e/mra+6unbsyYDoJRGSw+2tQf
X-Gm-Gg: AR+sD10QXt8oF0smWarErUo9xOK4c7/ihMzZrp+iJ9tplxRACJYAP28Mf+dj8GjDbwV
 /mHnSrVRyPlh6G+PPLzgdGa5CkVY6FrcfNkMIiiodRxCbQXxTHnOUKZvoocZF/9BRK2i5CviX4E
 yp3CgXWODSJDKFwtIHNQCovbeU/qcthahlQ2DbUN2l5vex88nOs532krA0ci/p7eIEsmZPPjU9T
 SRBeouY4mrvNCxw1E5M14HFA41xZcg2q4v8NBteJYw5lH+/dWNzaI560splewWjTpWUFQkty7vG
 UPCiKE1T365uXnVlkAIbXmW1TIIHhZ1TtMD2YZz5SFbWZq0Dzeh9tjEFb3N4wpVDgsB8UpyIVt6
 79nH28YCU1iyrPHwO7d66eZP4kX9jG6FVeQdckocyCMs+qWJSuJl7Ld9PCJIyHzGI3Y+6hzSl3n
 BM6lFAlfBnX/guGyblHxXkCVkQIOU6GjUcnWKcFASSV9BNH10vVNZ598WBqCm/swYsq9DQeWcUl
 +tTfGNzpyLWDSthmwSffSUUDIz7
X-Received: by 2002:a05:6214:4f06:b0:908:9045:217a with SMTP id
 6a1803df08f44-908904526e0mr330626976d6.29.1786297041447; 
 Sun, 09 Aug 2026 10:37:21 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-908a918ec9fsm55388176d6.5.2026.08.09.10.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 10:37:21 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, chris@chris-wilson.co.uk,
 Shuangpeng Bai <shuangpeng.kernel@gmail.com>, stable@vger.kernel.org
Subject: [PATCH] drm/i915/gem: Fix request use-after-free in active_engine()
Date: Sun,  9 Aug 2026 13:36:46 -0400
Message-ID: <20260809173646.3292361-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 Aug 2026 13:14:57 +0000
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

active_engine() walks timeline->requests in reverse under RCU and takes a
temporary reference before inspecting each request. However, it drops that
reference in the loop body before list_for_each_entry_reverse() advances
the cursor.

Concurrent retirement can unlink the same request and drop its base
reference while active_engine() holds the temporary reference. The put in
active_engine() may then be final, freeing or recycling the request before
the loop step reads rq->link.prev. SLAB_TYPESAFE_BY_RCU does not defer that
reuse.

Open-code the reverse walk and cache the previous request while the current
request is still referenced. The next request remains protected by
i915_request_get_rcu() and validated against the timeline before use.

An i915 mock selftest forced retirement between the active check and cursor
advance. The vulnerable tree reached the final request release and
kmem_cache_free(), while the fixed tree completed the same ordering without
accessing rq after the put.

Fixes: 3cfea8c97c93 ("drm/i915/gem: Hold request reference for canceling an active context")
Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index c58ffa5a8fa6..ff5c892a0176 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1361,7 +1361,7 @@ static bool __cancel_engine(struct intel_engine_cs *engine)
 static struct intel_engine_cs *active_engine(struct intel_context *ce)
 {
 	struct intel_engine_cs *engine = NULL;
-	struct i915_request *rq;
+	struct i915_request *rq, *prev;
 
 	if (intel_context_has_inflight(ce))
 		return intel_context_inflight(ce);
@@ -1375,7 +1375,8 @@ static struct intel_engine_cs *active_engine(struct intel_context *ce)
 	 * (and onto a new timeline->requests list).
 	 */
 	rcu_read_lock();
-	list_for_each_entry_reverse(rq, &ce->timeline->requests, link) {
+	rq = list_last_entry(&ce->timeline->requests, typeof(*rq), link);
+	while (!list_entry_is_head(rq, &ce->timeline->requests, link)) {
 		bool found;
 
 		/* timeline is already completed upto this point? */
@@ -1387,9 +1388,14 @@ static struct intel_engine_cs *active_engine(struct intel_context *ce)
 		if (likely(rcu_access_pointer(rq->timeline) == ce->timeline))
 			found = i915_request_active_engine(rq, &engine);
 
+		/* Cache the cursor before the put, which may release rq. */
+		if (!found)
+			prev = list_prev_entry(rq, link);
 		i915_request_put(rq);
 		if (found)
 			break;
+
+		rq = prev;
 	}
 	rcu_read_unlock();
 

base-commit: a59f57e2aa127c5354168d2ec4bac920df1be4f4
-- 
2.43.0

