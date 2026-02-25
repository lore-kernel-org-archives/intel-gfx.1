Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD15FD3760
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Feb 2026 13:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617F910E788;
	Wed, 25 Feb 2026 13:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="XJB39VWz";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D99710E783
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Feb 2026 13:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772025593;
 bh=Ki3mUmMvHpijIAiDYp7vsZU9L20YDZpEx92dDshhaXk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XJB39VWzqqJ+esk8DpRmhCD5XIy/ZbdMUdZ1EFKwORKZe5i5rhnNV6ocBi5sFjoIV
 b7/IRzL5ZWw/9qtQMB06ULwzozA015sUTWyZwpOhRKyfwuhmy4jOJCCO0uu55f9ZFy
 y/RdLorXYnmGD0IGHxzb8mwhBj36/7TuvmI58lAFUfJTHux+Fh8N7Ez3UQA7RmGvyB
 O8jXCpEZktwzm7SU7BFexc8HnX9N/3YCFq8nCONKQGz0GzlhrHm/Z1T00qbHnU3JRQ
 V9ee4qq/LB99+UTHOki+SUPzQ8+261gOwKznh76cfb9g9K/VOOrcCL9Yo25mU5Db5o
 q8VuS9ftIJhRQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org
Subject: [i915-ci-only NO-REVIEW 22/25] drm/i915: Use sleeping selftests for
 igt_atomic on PREEMPT_RT
Date: Wed, 25 Feb 2026 14:19:26 +0100
Message-ID: <20260225131931.60724-23-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260225131931.60724-1-dev@lankhorst.se>
References: <20260225131931.60724-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This makes the i915 selftests slightly happier, especially
related to GPU reset.

I believe this may be a better approach than trying to convert
uncore->lock to raw_spinlock

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/selftests/igt_atomic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/igt_atomic.c b/drivers/gpu/drm/i915/selftests/igt_atomic.c
index fb506b6990956..8ae39cf570b76 100644
--- a/drivers/gpu/drm/i915/selftests/igt_atomic.c
+++ b/drivers/gpu/drm/i915/selftests/igt_atomic.c
@@ -39,7 +39,14 @@ static void __hardirq_end(void)
 	local_irq_enable();
 }
 
+static void __maybe_unused __nop(void)
+{}
+
 const struct igt_atomic_section igt_atomic_phases[] = {
+#if IS_ENABLED(CONFIG_PREEMPT_RT)
+	{ "sleeping", __nop, __nop },
+	{ },
+#endif
 	{ "preempt", __preempt_begin, __preempt_end },
 	{ "softirq", __softirq_begin, __softirq_end },
 	{ "hardirq", __hardirq_begin, __hardirq_end },
-- 
2.51.0

