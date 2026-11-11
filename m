Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29F1606A324
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Nov 2026 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TcdZ4Lc9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB5B10FBA1;
	Wed, 11 Nov 2026 13:59:13 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B621710FBCF
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Nov 2026 13:59:06 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-8b0cf2c0785so33373927b3.3
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Nov 2026 05:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794405546; x=1795010346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NMIJcPDV5p1muT6/DuQ08jrz3S8sDCLFu8c78hDoSGo=;
 b=TcdZ4Lc9+i2o/tj98cMAlsB7eKf9XImQAZ1smX8apTWuZ6DMEvu3mWD5JfgUwNJLkp
 k+KSyCNi99Og34aNpqU9X2t4kEah9CIE9egHXo8C6bpUsgdTfeIasms0zOJMtqsTFV3z
 c1pML0hQ5/Qkdqt/Bxf0qggk9UC5zWgG8KQa1KUrnTy9XkYPPhngk83kFdv7Xh+lQZYg
 2559ENFWO5NmpJD8UILyywjtiyZg4Uwyb5eX6E6K9ozZbTtciC+8Ms9DQSAkW1kD+zbE
 pWHsiBGCO3llyQNwWB9nj7mlxnUbC1J1GH0NLwrZ7HiPPU/tTV5AUX4ZMOGWByD+Xb7A
 ptlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794405546; x=1795010346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NMIJcPDV5p1muT6/DuQ08jrz3S8sDCLFu8c78hDoSGo=;
 b=N/LlZwgTm3YUGyafVREFq+4v+Jq5cjKQg+vcegxFwmuNx75W0cd6TY7C4x+WJ6JP/o
 TnKjwLNWmRXrfdt8sYerE7hYygycM8k66tDUe++R2BZicwoSlk+TExO7IZ9P+fnTiqs4
 1qO7NXW4uvsBhP53KZHBWnM0DCwVYTxjo8DqZ3Sf7HaTABOGysgQ1ZvbTvNmehqv7eIe
 LVMGZlzgplKZr8nkHtDKaZGaEUNnE8lYK7sxiiB1Ph4qAWa4ae5sYt28oHeeTrTNtTsQ
 ieJDH8OsXodPSh4P1pninQPSoHK2OatqZpHAHCYWa2H5jbzQ9rnqJKAgZHZKFMk3/otH
 9eUQ==
X-Gm-Message-State: APuU4Z9wuOuj/3f2vzqno3YsiWfT86sMBj1UTno4nZ+QPMiWjS8ZvN6V
 bwJRCojpyrlufgdT89+fgZ7XDnaFe4usqVyKWMMR4Dt7npavzDHFQaqK7WhscQXQ
X-Gm-Gg: AYBFou0igbfSIqMjWtBFlwW3zhRq3WVcsbZ2wF0FzjsMg8Hbrq53JsPXzDidB3uDAMp
 BhlqdEB56NDROZeIGcdCJgzf8trnQngM8HH3rUXnEv5Sz4hh4SHVKYbS2V87ouoe1vBtdpcWIjm
 Jya6F/aIRchclLmk4DPqW7xNnM6ccsAgT6n3xPIseSscXTAnH5YyIA1Plwy4aujzYucEoeujWPc
 AKpu6CeKIZBEA4LwmMq6ghHvkqokTQCHQO/vAns5YyT1BLsUkufGti9MrFTGg5QX9rDjia+zvf4
 GIgCbPE4t0GueSyvN+hh+wfDEIMr9VxFPB9ngpMjlC6WqD+OShrVuKK5sjnqtUyeKd4B6fe8RlK
 BKs/GmVcB+CUUxykh20yFN2szwE/T43ML6SIyyTofQrv6+wBxSkExyR/z7hg7sMezQa43qgr6kR
 9e3eN52a8LlKxiFdppdrzbs5iodrEAuCp5AyYFv23xV495kvEu4/dFbkruWYDjC/DvW6LxR270L
 QLuQVjdJcx+nRAlNf5VRxrG64VusvyDCeN0iM1kNSZ1vKt3KAiCRD549d/nrQZXDSItbPdVKSDz
 EqzQpxCKIW8M0rVU/J3qvoTJXZ6k/QMLFTOLOuN32OpY6VV40Prsqn3q2NigcA==
X-Received: by 2002:a05:690c:e043:10b0:8b0:d554:a7c with SMTP id
 00721157ae682-8b3a81a6f0cmr13448107b3.79.1794405545671; 
 Wed, 11 Nov 2026 05:59:05 -0800 (PST)
Received: from f90457aaaf9e ([186.153.252.80])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b39339efd0sm44619547b3.10.2026.11.11.05.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 05:59:05 -0800 (PST)
From: Javier MV <javiermv@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: Javier MV <javiermv@duck.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, matthew.brost@intel.com,
 daniele.ceraolospurio@intel.com, umesh.nerlige.ramappa@intel.com
Subject: [PATCH v2 2/2] drm/i915/guc: Don't unblock a non-schedulable context
Date: Wed, 11 Nov 2026 13:57:26 +0000
Message-ID: <20261111135753.11071-3-javiermv@gmail.com>
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

Also check intel_context_is_schedulable(), whose CONTEXT_BANNED and
CONTEXT_EXITING flags stay set. Exiting contexts need it too: revoke
takes the same SCHED_STATE_BANNED path for them, so the same race can
re-enable a revoked context. The requests the replay put back in the
queue are then completed on resubmission, as for any banned context.

Found and fixed with Claude Code; details in the cover letter.

Fixes: 9888beaaf118 ("drm/i915/guc: Don't enable scheduling on a banned context, guc_id invalid, not registered")
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15301
Signed-off-by: Javier MV <javiermv@duck.com>
---
v2:
- Check !intel_context_is_schedulable() instead of
  intel_context_is_banned(): revoke takes the same path for exiting
  contexts (Sashiko).

 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b2ffc6b..966c23e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3186,7 +3186,12 @@ static bool context_cant_unblock(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 
+	/*
+	 * SCHED_STATE_BANNED alone isn't enough: the sched disable done
+	 * handler clears it. Revoke sets it for exiting contexts too.
+	 */
 	return (ce->guc_state.sched_state & SCHED_STATE_NO_UNBLOCK) ||
+		!intel_context_is_schedulable(ce) ||
 		context_guc_id_invalid(ce) ||
 		!ctx_id_mapped(ce_to_guc(ce), ce->guc_id.id) ||
 		!intel_context_is_pinned(ce);
-- 
2.51.1

