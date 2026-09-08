Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92863C79F82
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 23:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAD710E21C;
	Tue,  8 Sep 2026 23:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8QgBCaY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0860C10E1C2
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 23:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788909319; x=1820445319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=relAP9iKLvjNSkB84TXQeUudUJL7IMpFXjMnTrlt0pE=;
 b=D8QgBCaYve12x5r+2N4l/Tk4IyCpwRwuqSECcYLkLWOdcF/tOMTREm5Y
 xvIElaaJJp+ZAUp+dUjZdDC0OtPmsSaCTHy69+Powxw2VIGqFA9nIhS2V
 0bYGQl6PPukbfXAqZRNizQU7DnHKHcUlxZ/R0tI8rbDjiZXgadSYzZ7DS
 GAkDTE0QBFglKL5XwhhpsygAtQMkZPEA6b0giXrruUar1wJUbHmEFULnu
 HyJAHg9wMMxYXpDPYqHdHYwTWE1YChDUp28fJG/TTIEdvjjjmuRjsMHur
 6+wVCdH1rSz/PHxyPawHrdkQX/kgGf0hicyyXja0825RgkzLisdLHW2iQ Q==;
X-CSE-ConnectionGUID: 0b8rKKNnQsSc946fqoZ5BQ==
X-CSE-MsgGUID: s0Vt+gmBTuuBH9MZpd9kLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89530151"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="89530151"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:15:18 -0700
X-CSE-ConnectionGUID: h9fPheebRu+gDluzBOa8lw==
X-CSE-MsgGUID: zP8KZPfbRLKnPaFxzm+8qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="273092685"
Received: from unerlige-desk1.jf.intel.com ([10.24.80.43])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:15:18 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 2/2] drm/i915/perf: Remove sysfs group on OA config
 idr_alloc() failure
Date: Tue,  8 Sep 2026 16:15:14 -0700
Message-ID: <20260908231511.1217426-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908231511.1217426-4-umesh.nerlige.ramappa@intel.com>
References: <20260908231511.1217426-4-umesh.nerlige.ramappa@intel.com>
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

If idr_alloc() fails, the error path jumps to sysfs_err, which only drops
metrics_lock and falls through to reg_err, where i915_oa_config_put()
releases the last reference and frees the config. The sysfs group is
never removed. Fix the error path so that sysfs group is also cleaned up.

Fixes: f89823c21224 ("drm/i915/perf: Implement I915_PERF_ADD/REMOVE_CONFIG interface")
Reported-by: Martin Hodo <martin.hodo@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/gpu/drm/i915/i915_perf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 96823dcd3fae..abda7b1c4956 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4728,7 +4728,7 @@ int i915_perf_add_config_ioctl(struct drm_device *dev, void *data,
 		drm_dbg(&perf->i915->drm,
 			"Failed to create sysfs entry for OA config\n");
 		err = oa_config->id;
-		goto sysfs_err;
+		goto remove_sysfs;
 	}
 	id = oa_config->id;
 
@@ -4738,6 +4738,8 @@ int i915_perf_add_config_ioctl(struct drm_device *dev, void *data,
 
 	return id;
 
+remove_sysfs:
+	sysfs_remove_group(perf->metrics_kobj, &oa_config->sysfs_metric);
 sysfs_err:
 	mutex_unlock(&perf->metrics_lock);
 reg_err:
-- 
2.53.0

