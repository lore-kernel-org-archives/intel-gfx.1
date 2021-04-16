Return-Path: <SRS0=UFhG=JN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D4CC433B4
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Apr 2021 10:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 992FB610CD
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Apr 2021 10:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 992FB610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8E36EB6C;
	Fri, 16 Apr 2021 10:37:50 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B896EB69;
 Fri, 16 Apr 2021 10:37:47 +0000 (UTC)
IronPort-SDR: Hi3g/AZsaVWgRftHtrt62wZx1yqBnhz2yIXLrbtTxQ6/a5eWfuzleFFDlImGeZFXnursY1+qTb
 gwI/vnDodv5Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="256336407"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="256336407"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 03:37:46 -0700
IronPort-SDR: Mm5ViiGAll4q1p3kcWdM/il/6Pq4t9tGN2JcDF47lpCjBuybLoxtrpppYiEEOXYqfA7dAG1ymw
 LmL5X82Q/SOw==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="451434325"
Received: from pmwillia-mobl2.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.7.203])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 03:37:44 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 16 Apr 2021 11:37:15 +0100
Message-Id: <20210416103718.460830-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/4] drm/i915/uapi: fix kernel doc warnings
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
Cc: dri-devel@lists.freedesktop.org, Kenneth Graunke <kenneth@whitecape.org>,
 mesa-dev@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Fix the cases where it is almost already valid kernel doc, for the
others just nerf the warnings for now.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
---
 include/uapi/drm/i915_drm.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index ddc47bbf48b6..92da48e935d1 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1054,12 +1054,12 @@ struct drm_i915_gem_exec_fence {
 	__u32 flags;
 };
 
-/**
+/*
  * See drm_i915_gem_execbuffer_ext_timeline_fences.
  */
 #define DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES 0
 
-/**
+/*
  * This structure describes an array of drm_syncobj and associated points for
  * timeline variants of drm_syncobj. It is invalid to append this structure to
  * the execbuf if I915_EXEC_FENCE_ARRAY is set.
@@ -1700,7 +1700,7 @@ struct drm_i915_gem_context_param {
 	__u64 value;
 };
 
-/**
+/*
  * Context SSEU programming
  *
  * It may be necessary for either functional or performance reason to configure
@@ -2067,7 +2067,7 @@ struct drm_i915_perf_open_param {
 	__u64 properties_ptr;
 };
 
-/**
+/*
  * Enable data capture for a stream that was either opened in a disabled state
  * via I915_PERF_FLAG_DISABLED or was later disabled via
  * I915_PERF_IOCTL_DISABLE.
@@ -2081,7 +2081,7 @@ struct drm_i915_perf_open_param {
  */
 #define I915_PERF_IOCTL_ENABLE	_IO('i', 0x0)
 
-/**
+/*
  * Disable data capture for a stream.
  *
  * It is an error to try and read a stream that is disabled.
@@ -2090,7 +2090,7 @@ struct drm_i915_perf_open_param {
  */
 #define I915_PERF_IOCTL_DISABLE	_IO('i', 0x1)
 
-/**
+/*
  * Change metrics_set captured by a stream.
  *
  * If the stream is bound to a specific context, the configuration change
@@ -2103,7 +2103,7 @@ struct drm_i915_perf_open_param {
  */
 #define I915_PERF_IOCTL_CONFIG	_IO('i', 0x2)
 
-/**
+/*
  * Common to all i915 perf records
  */
 struct drm_i915_perf_record_header {
@@ -2151,7 +2151,7 @@ enum drm_i915_perf_record_type {
 	DRM_I915_PERF_RECORD_MAX /* non-ABI */
 };
 
-/**
+/*
  * Structure to upload perf dynamic configuration into the kernel.
  */
 struct drm_i915_perf_oa_config {
@@ -2292,21 +2292,21 @@ struct drm_i915_query_topology_info {
  * Describes one engine and it's capabilities as known to the driver.
  */
 struct drm_i915_engine_info {
-	/** Engine class and instance. */
+	/** @engine: Engine class and instance. */
 	struct i915_engine_class_instance engine;
 
-	/** Reserved field. */
+	/** @rsvd0: Reserved field. */
 	__u32 rsvd0;
 
-	/** Engine flags. */
+	/** @flags: Engine flags. */
 	__u64 flags;
 
-	/** Capabilities of this engine. */
+	/** @capabilities: Capabilities of this engine. */
 	__u64 capabilities;
 #define I915_VIDEO_CLASS_CAPABILITY_HEVC		(1 << 0)
 #define I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC	(1 << 1)
 
-	/** Reserved fields. */
+	/** @rsvd1: Reserved fields. */
 	__u64 rsvd1[4];
 };
 
@@ -2317,13 +2317,13 @@ struct drm_i915_engine_info {
  * an array of struct drm_i915_engine_info structures.
  */
 struct drm_i915_query_engine_info {
-	/** Number of struct drm_i915_engine_info structs following. */
+	/** @num_engines: Number of struct drm_i915_engine_info structs following. */
 	__u32 num_engines;
 
-	/** MBZ */
+	/** @rsvd: MBZ */
 	__u32 rsvd[3];
 
-	/** Marker for drm_i915_engine_info structures. */
+	/** @engines: Marker for drm_i915_engine_info structures. */
 	struct drm_i915_engine_info engines[];
 };
 
-- 
2.26.3

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
