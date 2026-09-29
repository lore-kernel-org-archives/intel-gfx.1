Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83172CA5FAD
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2026 19:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E743910F006;
	Tue, 29 Sep 2026 19:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAipOS4H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6463610F03F
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Sep 2026 19:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790708514; x=1822244514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0+/tvSi1MDXNSAgNR6fmMhG5nOLszHkdDS8hIQKWrsc=;
 b=RAipOS4HVV/TNE4CjrE2pc7Myzn6HLgZ3MhkuC10ODsjGI4rPnd+ZRme
 sKbgIAqPXRXWwghC6oMGLhdAiq2kmY9bQGvxkKNryexqHeMrL3z9Yae3/
 wIf7YwlvVJ/xWxa2Oksd3ajjPLSJ55+U5TH+oLNZQWNewidvtZurbb+Ho
 HgiAXf54CT56clSGwE4G+e6VPD88nfNONNydXuV9hYvJkmUZzkYHjbEtY
 BBcrT7yCz80Zb0vYLXk5Rw+8HijEL83WYfa/lTybMcBXDmkCUtr8INc2U
 dqUQJp0aSy7RqmlKNjJnyRiG8MNwd6r8eO7gYnQXE9FEphtURYM9RUy0Y w==;
X-CSE-ConnectionGUID: pgbCilhYQfizUpIxEYEamA==
X-CSE-MsgGUID: +hSbkuHgT/ih9ottryf/KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90564110"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90564110"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:01:53 -0700
X-CSE-ConnectionGUID: D1kEWnMySTSiVntVLPf18g==
X-CSE-MsgGUID: 3an4xjkJRfmnBcAKaN8Xmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274062216"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:01:53 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org,
	vinay.belgaumkar@intel.com
Cc: dev@lankhorst.se
Subject: [PATCH 1/3] drm/i915/pmu: Disable on PREEMPT_RT
Date: Tue, 29 Sep 2026 12:01:49 -0700
Message-ID: <20260929190147.2886670-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929190147.2886670-5-umesh.nerlige.ramappa@intel.com>
References: <20260929190147.2886670-5-umesh.nerlige.ramappa@intel.com>
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

From: Maarten Lankhorst <dev@lankhorst.se>

I tried to come up with alternative and lockless approaches
to make pmu work, but since the perf events are run in
atomic context on PREEMPT_RT, ordinary spinlocks no longer
work and forcewake and register accesses become problematic.

Disable perf events on PREEMPT_RT for now, without affecting
!PREEMPT_RT users.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
v2: s/reeturn/return/
---
 drivers/gpu/drm/i915/i915_pmu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 1c3bafda9c70..9ea5626399e5 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -1156,6 +1156,16 @@ void i915_pmu_register(struct drm_i915_private *i915)
 	};
 	int ret = -ENOMEM;
 
+	/*
+	 * PREEMPT_RT has problems with forcewake. Forcewake is used by the
+	 * engine 'busy' event when guc submission is enabled, and to measure
+	 * rc6 residency.
+	 *
+	 * Disable pmu events on PREEMPT_RT entirely to prevent deadlocks.
+	 */
+	if (IS_ENABLED(CONFIG_PREEMPT_RT))
+		return;
+
 	spin_lock_init(&pmu->lock);
 	hrtimer_setup(&pmu->timer, i915_sample, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	init_rc6(pmu);
-- 
2.55.0

