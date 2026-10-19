Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3505CCF2E5
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2026 13:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEB810ED29;
	Mon, 19 Oct 2026 13:15:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D1610ED00
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792415753; x=1823951753;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bFmxqaig8+J/jnYB/U5QJ5VJJFM7Oz9or/LbXCHvwog=;
 b=my2oxdV3evZ2EJdD8G3JD33bg6M1U1IM3CnXDotfjc5jpBD6m5NKQv4K
 dN3cRCssjxWIEQ7Hu1wliXwmi2LsqHai/n2wz6xBNYTpjokNksh6QNd1F
 lGLzDYJP6T9+mVbIQS+zj4M/B4GLhlnLdZe+7nEbL/dgdRLOhwosDdH2q
 wJWCdgYkcsfBpG2CUrge/ECqiRchT/ZzPE59pkLNO13mR0EWxFprKfaOu
 hKZQPET7Ro+6Pn9Liz15zCRrGtGjyGOkv8UYuzDOfJZohw70grKpY7mzW
 pcZURk5ZDF59EJ+QmaRYejYnGC0CZ4mg0mfyN3tpyzagXwClzdGN5BgOH w==;
X-CSE-ConnectionGUID: i9yHhxYDRiqRrLyQRCOJsg==
X-CSE-MsgGUID: haX3hALASLiP9t1pbNecQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1106052"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1106052"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:15:53 -0700
X-CSE-ConnectionGUID: 6BlbMEn9SHuoWhVeVHbufA==
X-CSE-MsgGUID: bIsS4WxTQJiD+vKRiBxIbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2870312"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:15:52 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/7] drm/i915/rps: Increment rps->boosts with SLPC
Date: Mon, 19 Oct 2026 16:15:37 +0300
Message-ID: <20261019131542.28822-3-ville.syrjala@linux.intel.com>
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

rps->boosts is just a debug counter of how many times we've
boosted. Don't see why we wouldn't want to know that also
when using SLPC.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 4cfa0b15e80e..8cb36ee028c3 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1071,9 +1071,9 @@ void intel_rps_boost(struct i915_request *rq)
 
 		if (READ_ONCE(rps->cur_freq) < rps->boost_freq)
 			queue_work(rps_to_gt(rps)->i915->unordered_wq, &rps->work);
-
-		WRITE_ONCE(rps->boosts, rps->boosts + 1); /* debug only */
 	}
+
+	WRITE_ONCE(rps->boosts, rps->boosts + 1); /* debug only */
 }
 
 int intel_rps_set(struct intel_rps *rps, u8 val)
-- 
2.55.0

