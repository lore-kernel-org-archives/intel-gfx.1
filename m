Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A29C606A31C
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2026 12:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gz2aj+Fk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B9510F652;
	Tue, 10 Nov 2026 12:29:12 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D2F10F652
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2026 12:29:06 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-8b0d126f631so19616237b3.2
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2026 04:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794313746; x=1794918546; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HJVQyVFSr5ZKSeX3QoqokJiP5jFd6IBCIBzkfDlgoO4=;
 b=Gz2aj+FkA+ZYOGxdSTUxVIDnajj8EX0OzCPVOLLP3biwMBYadgVFdWDG+stanjSSYo
 EVa/Ohw2FwXze/byMQXuxvzw3I1a6ekPvbRFM3kM8xCesEZEphuDWKBXKSAFCLg0x1Y2
 HHhJK2z65UIHbqvPtvNIogvNuQtf44PWhbC6ddM5Vb7mEEcOccRbuhto9450IBkOaWgG
 Mhhc64VpuOWi4MRLq+pIPtfHDgI2jKxL/iQ73DEWzZbVdfQMwJNjlutmMjbUDNIHZqzO
 KRBCqlM9VfPmcxVcGOth44PiphKIvN6TY6MTBNof7sARFp7MQHO7LF0Nr0iz5dSyTvmw
 pwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794313746; x=1794918546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HJVQyVFSr5ZKSeX3QoqokJiP5jFd6IBCIBzkfDlgoO4=;
 b=mTOb+VJTU6ROHIBMU+QDhOyQMtnw2ynAm+wctZkeDNWWCdbbfGpWx+EHyEam0UMEHb
 5pw9uryZUPZwsVQBqXK4vM7GYCqNiMEeHlLx/uO25iQnMnnWh0aqrJdoWhnlakI74SZn
 GqWmgMfiUNZZqZ5ybiMVTAI6Z43gUzJvfJQ+aLyJAWBVKKDWV7E5lrQnOHYbwwjsLgio
 JUZbuV0o8zEGEnakVbOsMuP6OJXQeyCle2ruPqz8fwK8WRbJjppflkqpIX8KhIaeFDcc
 0h/ii45pcXYzXOEIhGRBNagZ3OpzKU886HGt2+VUURrJhEiuD8MjYIm1BMaQgJKR9Arx
 z+QQ==
X-Gm-Message-State: APuU4Z9tak4tWS++3ErkH6dXo2rzvA9pwEt/5ClDxh2MEOoMy5TCFlh9
 v7DDtXF0RRPzYHCm7SqXLPh1tjw/N0QL6iKl6HgeJsDsn2YWmVbgBjq0G3JDjMhf
X-Gm-Gg: AYBFou2CAvqRsAM9Q06V7vmnRbH04wfD6CZ9z2eXY+PGQe29kuRuKO3pF8PWiuQhLAi
 OVSqDT2pypEZbq6ac/O4GfNmx/9UeABniA/+TZogsAFlYYw2294/QGmFyGA5e8JIXII3PKtL1sl
 vvkDSV/fEPbpBkV7dJwG5pneRBHZE7jrD9R7jDal60zx+hoQNe97VbP65bq7VySzNnipNee3Dpc
 c3qG2HpYu9xslyvQtqdLgCN2B6TFOkSI56J65m//HXo38fopeEJ9qQAyRprvLtAr0Me02K08oMe
 bQJs3ejLc53xQ61zGQmoycrk3h4ofEZocfLMHFsILNo7T1Qa43yZO9dtXV3FCcRcDM/YxCNyt2J
 /QqWI/7IYU6f7JJqgiiZKmmy2E/fYZHyB2YHRzbEtRQM7IM68+VyPaTCISW235jXFS4DDOMQKaQ
 5G6527PhnadyOt0q815KAMvGYjDRLMaN3SnpGf5SLzJiUoSegXdqDiJlBhJOJRDEPyRlnwwRL/r
 GGYAHoPmr5f0nfD3DKsvk3rMbH+aIi+HLd73qtlkwvGBGkdxSbwbrt2hWH11TiB7Pn2Fe84WeHQ
 a1EAu/8/EGNUpz58GypjNhK+Jo8AlaOMwM4lbMOe3h/W1hXUusHjvCp7/SvD
X-Received: by 2002:a05:690c:a90c:b0:8b2:f6bd:969f with SMTP id
 00721157ae682-8b39280fe78mr13908837b3.4.1794313745813; 
 Tue, 10 Nov 2026 04:29:05 -0800 (PST)
Received: from f90457aaaf9e ([186.153.252.80])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b393421a3esm17859727b3.32.2026.11.10.04.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 04:29:05 -0800 (PST)
From: Javier MV <javiermv@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: Javier MV <javiermv@duck.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, matthew.brost@intel.com,
 daniele.ceraolospurio@intel.com, umesh.nerlige.ramappa@intel.com
Subject: [PATCH 2/2] drm/i915/guc: Don't unblock a banned context
Date: Tue, 10 Nov 2026 12:24:48 +0000
Message-ID: <20261110122534.12989-3-javiermv@gmail.com>
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

guc_context_cancel_request() blocks the context, skips the request and
unblocks the context again. If the context gets banned meanwhile (the
blocked request hits a GuC context reset), guc_context_revoke() finds
the schedule disable of the block still pending, so it only sets the
preemption timeout to 1 ms and leaves the cancellation to the schedule
disable done handler. That handler clears SCHED_STATE_BANNED, and then
guc_context_unblock() finds nothing in context_cant_unblock() that
stops it from enabling scheduling again.

GuC then runs a banned context with a 1 ms preemption timeout and
resets it again at the first preemption. Seen on ADL-P: the second
reset notification was ignored, GuC sent G2H messages the driver
rejected (action 0x6000, -EOPNOTSUPP), the rcs0 heartbeat stopped and
the whole GT was reset, which also kills every other client's work.

Also check intel_context_is_banned(), which stays set. The requests the
replay put back in the queue are then completed on resubmission, as for
any banned context.

Found and fixed with Claude Code (AI coding assistant); details in the
cover letter.

Fixes: 9888beaaf118 ("drm/i915/guc: Don't enable scheduling on a banned context, guc_id invalid, not registered")
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15301
Signed-off-by: Javier MV <javiermv@duck.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 555ca8f..eb1d010 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3182,7 +3182,12 @@ static bool context_cant_unblock(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 
+	/*
+	 * SCHED_STATE_BANNED alone isn't enough: the sched disable done
+	 * handler clears it.
+	 */
 	return (ce->guc_state.sched_state & SCHED_STATE_NO_UNBLOCK) ||
+		intel_context_is_banned(ce) ||
 		context_guc_id_invalid(ce) ||
 		!ctx_id_mapped(ce_to_guc(ce), ce->guc_id.id) ||
 		!intel_context_is_pinned(ce);
-- 
2.51.1

