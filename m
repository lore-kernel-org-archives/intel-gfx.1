Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03867C79F82
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 23:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B4610E0E7;
	Tue,  8 Sep 2026 23:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wkh4fRXM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67EC10EDE2
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 23:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788909805; x=1820445805;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=C2/Kf+1GLKF6yuLa9NufO/CwAqBZx3ctg8z27Re1sSk=;
 b=Wkh4fRXMMM1VVCK/N4qTvc/iZK6C5OoKafCsoPGL55q8EXFzcEoPDOxy
 +kp0/sIV4Vrqg+kkdVIYe5ecTImOo/3qDkhyJA15dLakNhFdrQ1ZVWuLb
 wNc+kQUOsaA/3q0/9xp0bpDNDTqlZys4E9T2tJ6GsdabGiwYAJLVGIutk
 PZbHNllWWIcBE/YP+FRkeSfUF/k+IXVH4lM6f7u7xprUYjCGqwSsmYD6q
 hHg3bybncrXq+tXgOWzRtD2asBVWyYTrLonRZYsSRxs+jMl83vH3DgDLc
 Nn/8rqnXZ+GbcW9ZwEG7vYY+UKvd+LyMQZUtfdebtDb4tTstb6LMyoB95 A==;
X-CSE-ConnectionGUID: D/Ds6IuMTTWFenxMOPp4uw==
X-CSE-MsgGUID: 4wZwVi3cSbK4vPP8/xW5nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93191025"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="93191025"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:23:25 -0700
X-CSE-ConnectionGUID: S/zhZsPnTbCXy2ayUxWGOQ==
X-CSE-MsgGUID: nVgF6a43SpGxgZDcy0kQZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="271131585"
Received: from unerlige-desk1.jf.intel.com ([10.24.80.43])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:23:26 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH 1/2] drm/i915/guc: Range check GuC-provided engine class and
 instance
Date: Tue,  8 Sep 2026 16:23:25 -0700
Message-ID: <20260908232323.1220407-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908232323.1220407-4-umesh.nerlige.ramappa@intel.com>
References: <20260908232323.1220407-4-umesh.nerlige.ramappa@intel.com>
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

intel_guc_lookup_engine() indexes gt->engine_class[][] with a class and
instance pair that originates from the GuC, guarded only by GEM_BUG_ON.
That compiles out on production builds, so nothing validates either index
at runtime.

Range check both indices and return NULL when either is out of range.
Callers already handle a NULL return, so no caller changes are
needed.

Fixes: f7957e603cbc ("drm/i915/guc: Handle engine reset failure notification")
Reported-by: Martin Hodo <martin.hodo@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 788e59cdfac9..9d3bd16adf40 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -5301,10 +5301,16 @@ struct intel_engine_cs *
 intel_guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
-	u8 engine_class = guc_class_to_engine_class(guc_class);
+	u8 engine_class;
 
-	/* Class index is checked in class converter */
-	GEM_BUG_ON(instance > MAX_ENGINE_INSTANCE);
+	/*
+	 * Both indices come from the GuC, so range check them here rather than
+	 * relying on the debug-only assertions in the class converter.
+	 */
+	if (guc_class > GUC_LAST_ENGINE_CLASS || instance > MAX_ENGINE_INSTANCE)
+		return NULL;
+
+	engine_class = guc_class_to_engine_class(guc_class);
 
 	return gt->engine_class[engine_class][instance];
 }
-- 
2.53.0

