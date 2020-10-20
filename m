Return-Path: <SRS0=qNAp=D3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B46C43457
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2020 10:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC1C322282
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2020 10:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC1C322282
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58046EC40;
	Tue, 20 Oct 2020 10:08:31 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071616EC3D
 for <Intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2020 10:08:30 +0000 (UTC)
IronPort-SDR: OOdnpzYj+5tQ6YrxJ/Xiau+DIdHFHbFCQ1owNB0fmjKNAwi418cGI0M0qEEOKo5Ut8/BU2t833
 sK6aldpB380g==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="147042064"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; d="scan'208";a="147042064"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 03:08:29 -0700
IronPort-SDR: h2mZR+4Fo6dQ5grj2fbOAsYPOCDiZV3TFYJw4Kl8CJebGJ9IWekFdQwbpSosV1U5f61nc/fPYi
 dR0aq4dX6Ltw==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; d="scan'208";a="465879915"
Received: from bszymanx-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.55.244])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 03:08:27 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Tue, 20 Oct 2020 11:08:21 +0100
Message-Id: <20201020100822.543332-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/2] drm/i915/pmu: Handle PCI unbind
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Mark the device as closed and keep references to driver data alive to
allow for safe driver unbind with active PMU clients. Perf core does not
otherwise handle this case so we have to do it manually like this.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/i915_pmu.c | 39 +++++++++++++++++++++++++++++++--
 drivers/gpu/drm/i915/i915_pmu.h |  4 ++++
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 69c0fa20eba1..51ed7d0efcdc 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -445,6 +445,8 @@ static void i915_pmu_event_destroy(struct perf_event *event)
 		container_of(event->pmu, typeof(*i915), pmu.base);
 
 	drm_WARN_ON(&i915->drm, event->parent);
+
+	drm_dev_put(&i915->drm);
 }
 
 static int
@@ -510,8 +512,12 @@ static int i915_pmu_event_init(struct perf_event *event)
 {
 	struct drm_i915_private *i915 =
 		container_of(event->pmu, typeof(*i915), pmu.base);
+	struct i915_pmu *pmu = &i915->pmu;
 	int ret;
 
+	if (pmu->closed)
+		return -ENODEV;
+
 	if (event->attr.type != event->pmu->type)
 		return -ENOENT;
 
@@ -536,8 +542,10 @@ static int i915_pmu_event_init(struct perf_event *event)
 	if (ret)
 		return ret;
 
-	if (!event->parent)
+	if (!event->parent) {
+		drm_dev_get(&i915->drm);
 		event->destroy = i915_pmu_event_destroy;
+	}
 
 	return 0;
 }
@@ -594,9 +602,16 @@ static u64 __i915_pmu_event_read(struct perf_event *event)
 
 static void i915_pmu_event_read(struct perf_event *event)
 {
+	struct drm_i915_private *i915 =
+		container_of(event->pmu, typeof(*i915), pmu.base);
 	struct hw_perf_event *hwc = &event->hw;
+	struct i915_pmu *pmu = &i915->pmu;
 	u64 prev, new;
 
+	if (pmu->closed) {
+		event->hw.state = PERF_HES_STOPPED;
+		return;
+	}
 again:
 	prev = local64_read(&hwc->prev_count);
 	new = __i915_pmu_event_read(event);
@@ -724,6 +739,13 @@ static void i915_pmu_disable(struct perf_event *event)
 
 static void i915_pmu_event_start(struct perf_event *event, int flags)
 {
+	struct drm_i915_private *i915 =
+		container_of(event->pmu, typeof(*i915), pmu.base);
+	struct i915_pmu *pmu = &i915->pmu;
+
+	if (pmu->closed)
+		return;
+
 	i915_pmu_enable(event);
 	event->hw.state = 0;
 }
@@ -738,6 +760,13 @@ static void i915_pmu_event_stop(struct perf_event *event, int flags)
 
 static int i915_pmu_event_add(struct perf_event *event, int flags)
 {
+	struct drm_i915_private *i915 =
+		container_of(event->pmu, typeof(*i915), pmu.base);
+	struct i915_pmu *pmu = &i915->pmu;
+
+	if (pmu->closed)
+		return -ENODEV;
+
 	if (flags & PERF_EF_START)
 		i915_pmu_event_start(event, flags);
 
@@ -1167,7 +1196,13 @@ void i915_pmu_unregister(struct drm_i915_private *i915)
 	if (!pmu->base.event_init)
 		return;
 
-	drm_WARN_ON(&i915->drm, pmu->enable);
+	/*
+	 * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
+	 * ensures all currently executing ones will have exited before we
+	 * proceed with unregistration.
+	 */
+	pmu->closed = true;
+	synchronize_rcu();
 
 	hrtimer_cancel(&pmu->timer);
 
diff --git a/drivers/gpu/drm/i915/i915_pmu.h b/drivers/gpu/drm/i915/i915_pmu.h
index 941f0c14037c..59a0d19afb67 100644
--- a/drivers/gpu/drm/i915/i915_pmu.h
+++ b/drivers/gpu/drm/i915/i915_pmu.h
@@ -49,6 +49,10 @@ struct i915_pmu {
 	 * @base: PMU base.
 	 */
 	struct pmu base;
+	/**
+	 * @closed: i915 is unregistering.
+	 */
+	bool closed;
 	/**
 	 * @name: Name as registered with perf core.
 	 */
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
