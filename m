Return-Path: <SRS0=rOxW=NY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8B5C433F5
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Sep 2021 21:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A828610A1
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Sep 2021 21:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A828610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D48C6E820;
	Thu,  2 Sep 2021 21:57:41 +0000 (UTC)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2046A6E81E;
 Thu,  2 Sep 2021 21:57:39 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 9E16C3F07E; 
 Thu,  2 Sep 2021 21:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630619857;
 bh=RrGb14526Hzdi2/6F7zzMyJp4jDW7pX9lwkBYSkcqpM=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=coaFRyxoT+NWg1LTsanYt1sed4BgbKdeHv4iRV+tv1YdVLbj+1qp8qoLAVUFZXKfD
 tA7nQjAsIvGYP01nwDOzhGMR4j9pRsxNpSSYn8yqfBbw5p4kccz6jweZEF8mDtvSrQ
 hIbQtv2yaNnTK/odnQDg0Tqh4qah7EbhpRBFKxuAYgBuU3Rq70f3ckrvBd2Ehw90On
 dBcBh+ymObVnS8XVihxM9isHp4RYDgIkffT/wg+0yLCqwRFivGjwQkosjHCEDmxBCF
 wSXh7lCdcuKRJ9j2uPmSKWd3Q8g98UXvRE93lgBrPiznazVlJkKJ72/1F3wbedZOrr
 sCQHRUzFgEWlw==
From: Colin King <colin.king@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Thu,  2 Sep 2021 22:57:37 +0100
Message-Id: <20210902215737.55570-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH][next] drm/i915: clean up inconsistent indenting
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

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented one character too deeply,
clean this up.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index de5f9c86b9a4..aeb324b701ec 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2565,7 +2565,7 @@ __execlists_context_pre_pin(struct intel_context *ce,
 	if (!__test_and_set_bit(CONTEXT_INIT_BIT, &ce->flags)) {
 		lrc_init_state(ce, engine, *vaddr);
 
-		 __i915_gem_object_flush_map(ce->state->obj, 0, engine->context_size);
+		__i915_gem_object_flush_map(ce->state->obj, 0, engine->context_size);
 	}
 
 	return 0;
-- 
2.32.0

