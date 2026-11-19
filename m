Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D32606A320
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 14:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+7to1Bg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F1E10EB43;
	Thu, 19 Nov 2026 14:59:07 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755B51124F8
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 14:59:01 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-7d2da1667b2so1315396137.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 06:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795100340; x=1795705140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=X8eb1KnawBYB7zI5bNmDTRr+MkAOVhf5pLdU5wizOSM=;
 b=u+7to1Bgl2tmmOaNC+VMlabey60n/MWJEbGSAqVXL4x9y3xG4GT3MzsggFMQjYW+re
 Az0gJdtBeKEyY7CEwMX/0kyfvnsFtQNMXkScH63N9fYvO/EguNKAQtED885razln7L2j
 5BLvPBT3RgXBOpD2Pq1xoi9a5LjndbJ4DLbvXa5J53vnelZaNjudhmfcXk3bfnwOBWwJ
 TsLlLzXqy8v3gIlA2Mp6X5+bQyueGhRbiZ8ZZpWRT0WGmUvjCf4uZeVwZgQjE0Txb+OC
 oCPME+E/s8q5Cf/AHXMnSRt4A/OVeFnJR1d3bNmcTdGu4ilPULwRg6P4O5F3QRpnNWYr
 XeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795100340; x=1795705140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=X8eb1KnawBYB7zI5bNmDTRr+MkAOVhf5pLdU5wizOSM=;
 b=Or/XM6wTQ6JLRgiCxLdo7mChgBRlztOrp6wAoJV76qD8UGhK+EEUPH4O9bSyz79X2W
 82br7LoM3LSKbJiLilFxqOxM5bYAbmBoyoDPcokYOCwexRzcmGe61lFi2ta8qDUvpbK5
 ZDbyuvAB2eN9NwwTmw2k6Zvk3LMY5EW/3TZVWJL4UHP8DHlIZB8y6BNv2SbJBwMIIbz9
 VgLd5TsnIGbaogwV2j+t5ZDJtOmwj33+1UHBhc11Ggmga19LGAkg6Tif7Fgb5AT18oBm
 2+fLArMQ3eaM5CMM3jiTzbsiKmRNN1GkN0GwJPUnxFkzyTTdfoPE0xtpetto8704DorK
 Y4AQ==
X-Gm-Message-State: APuU4Z+5tb1JD1XrY8lfdk5xW43GlsZmbhKKS2FzKYTm3IWJRKzH51Z9
 iyIwm5+AWOUcpJbWCN1GvDF33/OcqBedl+6wmvItbrL7mX6ozu7fHlf6PbtI4BsA
X-Gm-Gg: AYBFou2CeGewunH6bxLNHx2JybUobJxqzxn6EXLpLszUSfGW+X6ktQhNtkqXCkLBq8T
 ACBFSMmsLD+ptRzL0hyGsYu7nJd3cB+TRnafvh5D/M8GRWkdR3bw/Lat8PoPa8enj+ykZg+3Xzd
 pnzvhV0KyHM1O+EWpUa87PCpSXEAOZi70QaLasFo+ChXqPC8ucurbqx/y2PDJR9NRz4yGNbsq43
 1dcZN31CKUd2wMJXGsMkB+iAk/iIERf9B49mP28jU0TJlUOPHR+9W7XlLCc15WxG2kvyZhI8tGQ
 QrDeTXEeuQ2+w7F+xeTeENlYr1Uu/zt9DUD17/LNb/HNC3oaL2xPvu2AEqJNIPzwfFVa+oIXHGK
 dKvM2hYbk8dLoKYfbK1i0SEoq0ZA/r7o3B7AOP0F5bwxjCNuBnLVH6Ji5EsZlPkNXntPTvU7mIC
 SrwD4ro0TMCednHP9oofV6Q2xs9MNRZkryDUw9LsVov5mRln097WMlui8sTlUF76kKUVlLGUY5s
 olMicVhnTa1iImpmDF7VS2hht2cdZl5DfFD86Mbqqrzxm2V8v9+H6YTKLD4mjCPgSD6Lei/vrZP
 qLruUHRcefGY0aoymiCeIyEQrE3X83X533g0kijP/9v6VO8di9V0RJSvYp48Sg==
X-Received: by 2002:a05:6102:578b:b0:7cc:226a:f977 with SMTP id
 ada2fe7eead31-7d6ba4d3bb7mr2459046137.36.1795100340192; 
 Thu, 19 Nov 2026 06:59:00 -0800 (PST)
Received: from f90457aaaf9e ([186.153.252.80])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-7d6e7f3d7bcsm6083137.4.2026.11.19.06.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 06:58:59 -0800 (PST)
From: Javier MV <javiermv@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: Javier MV <javiermv@duck.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, matthew.brost@intel.com,
 daniele.ceraolospurio@intel.com, umesh.nerlige.ramappa@intel.com
Subject: [PATCH v4 2/2] drm/i915/guc: Don't unblock a non-schedulable context
Date: Thu, 19 Nov 2026 14:56:55 +0000
Message-ID: <20261119145709.6735-3-javiermv@gmail.com>
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
v4:
- No changes.

v3:
- Shorter commit message and comment (Rodrigo).

v2:
- Check !intel_context_is_schedulable() instead of
  intel_context_is_banned(): revoke takes the same path for exiting
  contexts (Sashiko).

 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 111cd4c89ad3..046a2f47db0c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3180,7 +3180,9 @@ static bool context_cant_unblock(struct intel_context *ce)
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

