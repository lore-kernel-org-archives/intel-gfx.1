Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA49C79FA1
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 23:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B536410EDDF;
	Tue,  8 Sep 2026 23:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PIotxc/D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5B610E21C
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 23:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788909319; x=1820445319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oRccGsUQB0c/cFk4VC1rPJcMYkXQX3G1Po8QMIPwR7g=;
 b=PIotxc/DA3DYnqByKdbAXLEk5+SNzFWzsFe9P/KsBNyNYp6tP9Xb2Z/O
 Aev6NU1yvnhIjg+ZIMY9aX96zDtOgQyIrV09ooKekWcBKe76uya/hNSH5
 Nw9deIJf2XJGMEefY9keN5sSLxD2khGVsJw94atoCuoP4j2+rMMvV2M8C
 UHZ24pR2YS5fvpae9STv7woKML0VUvOoSYBV6JB7j2TMuoSPtArgmEydK
 Z+xKhKBfY1hjyb1vwrzE1asvmMx6ckVyS3zy/QRCEZhasnWmSBTIO8rlO
 bCwQWJFm+bZvJmSZmN37MIjPdFUmevBmLz090gxVWzAnfLlPfbYW3mi/h w==;
X-CSE-ConnectionGUID: YsfleWkCSiad1U8AE3S74w==
X-CSE-MsgGUID: qHfzbjRTQYKiL4voEP7FrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89530150"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="89530150"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:15:18 -0700
X-CSE-ConnectionGUID: lEVlIUgKT3ma3g2c/slP6g==
X-CSE-MsgGUID: UtXOoMC3Riq/Wr15p7t6WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="273092682"
Received: from unerlige-desk1.jf.intel.com ([10.24.80.43])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:15:18 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 1/2] drm/i915/perf: Enable the stream before installing its fd
Date: Tue,  8 Sep 2026 16:15:13 -0700
Message-ID: <20260908231511.1217426-5-umesh.nerlige.ramappa@intel.com>
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

Enable the stream before installing the fd. Once the fd is visible
to userspace, file operations can run concurrently with this thread
and they only take stream->lock, which is not held here. In
particular, an I915_PERF_IOCTL_DISABLE racing with the middle of
i915_perf_enable_locked() could clear stream->enabled and cancel a
poll timer that has not been started yet, leaving the stream with
enabled == false and the timer armed. Nothing would then cancel that
timer before the stream is freed on release.

Fixes: 2db609c01495 ("drm/i915/perf: Replace gt->perf.lock with stream->lock for file ops")
Reported-by: Martin Hodo <martin.hodo@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/gpu/drm/i915/i915_perf.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 19b82427aa41..96823dcd3fae 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -3900,15 +3900,25 @@ i915_perf_open_ioctl_locked(struct i915_perf *perf,
 	if (param->flags & I915_PERF_FLAG_FD_NONBLOCK)
 		f_flags |= O_NONBLOCK;
 
+	/*
+	 * Enable the stream before installing the fd. Once the fd is visible
+	 * to userspace, file operations can run concurrently with this thread
+	 * and they only take stream->lock, which is not held here. In
+	 * particular, an I915_PERF_IOCTL_DISABLE racing with the middle of
+	 * i915_perf_enable_locked() could clear stream->enabled and cancel a
+	 * poll timer that has not been started yet, leaving the stream with
+	 * enabled == false and the timer armed. Nothing would then cancel that
+	 * timer before the stream is freed on release.
+	 */
+	if (!(param->flags & I915_PERF_FLAG_DISABLED))
+		i915_perf_enable_locked(stream);
+
 	stream_fd = anon_inode_getfd("[i915_perf]", &fops, stream, f_flags);
 	if (stream_fd < 0) {
 		ret = stream_fd;
-		goto err_flags;
+		goto err_enable;
 	}
 
-	if (!(param->flags & I915_PERF_FLAG_DISABLED))
-		i915_perf_enable_locked(stream);
-
 	/* Take a reference on the driver that will be kept with stream_fd
 	 * until its release.
 	 */
@@ -3916,6 +3926,8 @@ i915_perf_open_ioctl_locked(struct i915_perf *perf,
 
 	return stream_fd;
 
+err_enable:
+	i915_perf_disable_locked(stream);
 err_flags:
 	if (stream->ops->destroy)
 		stream->ops->destroy(stream);
-- 
2.53.0

