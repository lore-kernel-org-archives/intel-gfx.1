Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A296CCF2DE
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2026 13:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3087210ED27;
	Mon, 19 Oct 2026 13:16:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA41910ED27
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 13:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792415757; x=1823951757;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1LjMm1xCqHbUVy7R9qvj1rp//juug1CKCmpn+ICkl8E=;
 b=kgDwg6nZvgYC4Fw/v/WXEkniaoCmLcH4lKbEOMjBcsv9dweuvwOyRLKv
 swAOpsnrl2+J8YGcpK15+0UjNcoSXhvbcAqtQmzn9StryXqvqG6wkRU1L
 bO4ttOG1lvYkIsYErk8ezOojwe86nURKZVjM6pnBIxc7LxEiY/6BjrjMK
 R8QGsHgU0oCAUt7yHTvnNdAZbvNB20pY9Y79U2KP7CIGTpDYacozkY5Wu
 fpMBFnvUUtJceJ8NNuyJMjQVda9DzKQJ8dumcJcrZQLuLLRwD07ZZPUFu
 f482DuopICM01Jmjh9PJg37y6LURZP1rZKxDhk2i3EwRNMggeLBxvTImC Q==;
X-CSE-ConnectionGUID: QnsyVG2HSkmWH2ClhpYUxw==
X-CSE-MsgGUID: Uj2CcgXBRWaSd11jRbKWEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="980281"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="980281"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:15:56 -0700
X-CSE-ConnectionGUID: Vv/GAD0VSs+pK8SZAngLmg==
X-CSE-MsgGUID: t/rdHQAhQMmN8zMpX0Aztw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2635073"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:15:55 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/7] drm/i915/rps: Reorder the queue_work() vs. GT_TRACE()
Date: Mon, 19 Oct 2026 16:15:38 +0300
Message-ID: <20261019131542.28822-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019131542.28822-1-ville.syrjala@linux.intel.com>
References: <20261019131542.28822-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Emit the GT_TRACE() after we've queued the boost work. I don't
expect the order to really matter, and this will allow further
refactoring of intel_rps_boost().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 8cb36ee028c3..4f6fa9a2d6fc 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1054,9 +1054,6 @@ void intel_rps_boost(struct i915_request *rq)
 		if (slpc->min_freq_softlimit >= slpc->boost_freq)
 			return;
 
-		GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
-			 rq->fence.context, rq->fence.seqno);
-
 		queue_work(rps_to_gt(rps)->i915->unordered_wq,
 			   &slpc->boost_work);
 	} else {
@@ -1066,13 +1063,13 @@ void intel_rps_boost(struct i915_request *rq)
 		if (!intel_rps_is_active(rps))
 			return;
 
-		GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
-			 rq->fence.context, rq->fence.seqno);
-
 		if (READ_ONCE(rps->cur_freq) < rps->boost_freq)
 			queue_work(rps_to_gt(rps)->i915->unordered_wq, &rps->work);
 	}
 
+	GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
+		 rq->fence.context, rq->fence.seqno);
+
 	WRITE_ONCE(rps->boosts, rps->boosts + 1); /* debug only */
 }
 
-- 
2.55.0

